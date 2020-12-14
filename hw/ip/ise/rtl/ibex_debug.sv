// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// Top-level debug module (DM)
//
// This module implements the RISC-V debug specification version 0.13,
//

`include "prim_assert.sv"

module ibex_debug #(
  parameter int                 NrHarts = 1,
  parameter logic [31:0]        IdcodeValue = 32'h 0000_0001,
  parameter int BusWidth    = 32,
  parameter int AddressWidth = 32
) (
  input  logic                  clk_i,       // clock
  input  logic                  rst_ni,      // asynchronous reset active low, connect PoR
                                             // here, not the system reset
  input  logic                  testmode_i,
  output logic                  ndmreset_o,  // non-debug module reset
  output logic                  dmactive_o,  // debug module is active
  output logic [NrHarts-1:0]    debug_req_o, // async debug request
  input  logic [NrHarts-1:0]    unavailable_i, // communicate whether the hart is unavailable
                                               // (e.g.: power down)

  // bus device with debug memory, for an execution based technique
  //input  tlul_pkg::tl_h2d_t tl_d_i,
  //output tlul_pkg::tl_d2h_t tl_d_o,
  input  logic                    device_req_i,
  input  logic [AddressWidth-1:0] device_addr_i,
  input  logic                    device_we_i,
  input  logic [  BusWidth/8-1:0] device_be_i,
  input  logic [    BusWidth-1:0] device_wdata_i,
  output logic                    device_gnt_o,
  output logic                    device_rvalid_o,
  output logic [    BusWidth-1:0] device_rdata_o,
  output logic                    device_err_o,

  // bus host, for system bus accesses
  //output tlul_pkg::tl_h2d_t  tl_h_o,
  //input  tlul_pkg::tl_d2h_t  tl_h_i,
  output logic                    host_req_o   ,
  output logic [AddressWidth-1:0] host_addr_o  ,
  output logic                    host_we_o    ,
  output logic [  BusWidth/8-1:0] host_be_o    ,
  output logic [    BusWidth-1:0] host_wdata_o ,
  input                           host_gnt_i   ,
  input                           host_rvalid_i,
  input        [    BusWidth-1:0] host_rdata_i ,
  input                           host_err_i   ,

  input  logic               tck_i,           // JTAG test clock pad
  input  logic               tms_i,           // JTAG test mode select pad
  input  logic               trst_ni,         // JTAG test reset pad
  input  logic               td_i,            // JTAG test data input pad
  output logic               td_o,            // JTAG test data output pad
  output logic               tdo_oe_o         // Data out output enable
);

  `ASSERT_INIT(paramCheckNrHarts, NrHarts > 0)

  // all harts have contiguous IDs
  localparam logic [NrHarts-1:0] SelectableHarts = {NrHarts{1'b1}};

  // Debug CSRs
  dm::hartinfo_t [NrHarts-1:0]      hartinfo;
  logic [NrHarts-1:0]               halted;
  // logic [NrHarts-1:0]               running;
  logic [NrHarts-1:0]               resumeack;
  logic [NrHarts-1:0]               haltreq;
  logic [NrHarts-1:0]               resumereq;
  logic                             clear_resumeack;
  logic                             cmd_valid;
  dm::command_t                     cmd;

  logic                             cmderror_valid;
  dm::cmderr_e                      cmderror;
  logic                             cmdbusy;
  logic [dm::ProgBufSize-1:0][31:0] progbuf;
  logic [dm::DataCount-1:0][31:0]   data_csrs_mem;
  logic [dm::DataCount-1:0][31:0]   data_mem_csrs;
  logic                             data_valid;
  logic [19:0]                      hartsel;
  // System Bus Access Module
  logic [BusWidth-1:0]              sbaddress_csrs_sba;
  logic [BusWidth-1:0]              sbaddress_sba_csrs;
  logic                             sbaddress_write_valid;
  logic                             sbreadonaddr;
  logic                             sbautoincrement;
  logic [2:0]                       sbaccess;
  logic                             sbreadondata;
  logic [BusWidth-1:0]              sbdata_write;
  logic                             sbdata_read_valid;
  logic                             sbdata_write_valid;
  logic [BusWidth-1:0]              sbdata_read;
  logic                             sbdata_valid;
  logic                             sbbusy;
  logic                             sberror_valid;
  logic [2:0]                       sberror;

  dm::dmi_req_t  dmi_req;
  dm::dmi_resp_t dmi_rsp;
  logic dmi_req_valid, dmi_req_ready;
  logic dmi_rsp_valid, dmi_rsp_ready;
  logic dmi_rst_n;

  // static debug hartinfo
  localparam dm::hartinfo_t DebugHartInfo = '{
    zero1:      '0,
    nscratch:   2, // Debug module needs at least two scratch regs
    zero0:      0,
    dataaccess: 1'b1, // data registers are memory mapped in the debugger
    datasize:   dm::DataCount,
    dataaddr:   dm::DataAddr
  };
  for (genvar i = 0; i < NrHarts; i++) begin : gen_dm_hart_ctrl
    assign hartinfo[i] = DebugHartInfo;
  end

  dm_csrs #(
    .NrHarts(NrHarts),
    .BusWidth(BusWidth),
    .SelectableHarts(SelectableHarts)
  ) i_dm_csrs (
    .clk_i                   ( clk_i                 ),
    .rst_ni                  ( rst_ni                ),
    .testmode_i              ( testmode_i            ),
    .dmi_rst_ni              ( dmi_rst_n             ),
    .dmi_req_valid_i         ( dmi_req_valid         ),
    .dmi_req_ready_o         ( dmi_req_ready         ),
    .dmi_req_i               ( dmi_req               ),
    .dmi_resp_valid_o        ( dmi_rsp_valid         ),
    .dmi_resp_ready_i        ( dmi_rsp_ready         ),
    .dmi_resp_o              ( dmi_rsp               ),
    .ndmreset_o              ( ndmreset_o            ),
    .dmactive_o              ( dmactive_o            ),
    .hartsel_o               ( hartsel               ),
    .hartinfo_i              ( hartinfo              ),
    .halted_i                ( halted                ),
    .unavailable_i,
    .resumeack_i             ( resumeack             ),
    .haltreq_o               ( haltreq               ),
    .resumereq_o             ( resumereq             ),
    .clear_resumeack_o       ( clear_resumeack       ),
    .cmd_valid_o             ( cmd_valid             ),
    .cmd_o                   ( cmd                   ),
    .cmderror_valid_i        ( cmderror_valid        ),
    .cmderror_i              ( cmderror              ),
    .cmdbusy_i               ( cmdbusy               ),
    .progbuf_o               ( progbuf               ),
    .data_i                  ( data_mem_csrs         ),
    .data_valid_i            ( data_valid            ),
    .data_o                  ( data_csrs_mem         ),
    .sbaddress_o             ( sbaddress_csrs_sba    ),
    .sbaddress_i             ( sbaddress_sba_csrs    ),
    .sbaddress_write_valid_o ( sbaddress_write_valid ),
    .sbreadonaddr_o          ( sbreadonaddr          ),
    .sbautoincrement_o       ( sbautoincrement       ),
    .sbaccess_o              ( sbaccess              ),
    .sbreadondata_o          ( sbreadondata          ),
    .sbdata_o                ( sbdata_write          ),
    .sbdata_read_valid_o     ( sbdata_read_valid     ),
    .sbdata_write_valid_o    ( sbdata_write_valid    ),
    .sbdata_i                ( sbdata_read           ),
    .sbdata_valid_i          ( sbdata_valid          ),
    .sbbusy_i                ( sbbusy                ),
    .sberror_valid_i         ( sberror_valid         ),
    .sberror_i               ( sberror               )
  );

  dm_sba #(
    .BusWidth(BusWidth)
  ) i_dm_sba (
    .clk_i                   ( clk_i                 ),
    .rst_ni                  ( rst_ni                ),
    .master_req_o            ( host_req_o            ),
    .master_add_o            ( host_addr_o           ),
    .master_we_o             ( host_we_o             ),
    .master_wdata_o          ( host_wdata_o          ),
    .master_be_o             ( host_be_o             ),
    .master_gnt_i            ( host_gnt_i            ),
    .master_r_valid_i        ( host_rvalid_i         ),
    .master_r_rdata_i        ( host_rdata_i          ),//TODO: handle host_err_i
    .dmactive_i              ( dmactive_o            ),
    .sbaddress_i             ( sbaddress_csrs_sba    ),
    .sbaddress_o             ( sbaddress_sba_csrs    ),
    .sbaddress_write_valid_i ( sbaddress_write_valid ),
    .sbreadonaddr_i          ( sbreadonaddr          ),
    .sbautoincrement_i       ( sbautoincrement       ),
    .sbaccess_i              ( sbaccess              ),
    .sbreadondata_i          ( sbreadondata          ),
    .sbdata_i                ( sbdata_write          ),
    .sbdata_read_valid_i     ( sbdata_read_valid     ),
    .sbdata_write_valid_i    ( sbdata_write_valid    ),
    .sbdata_o                ( sbdata_read           ),
    .sbdata_valid_o          ( sbdata_valid          ),
    .sbbusy_o                ( sbbusy                ),
    .sberror_valid_o         ( sberror_valid         ),
    .sberror_o               ( sberror               )
  );

  // DBG doesn't handle error responses so raise assertion if we see one
  `ASSERT(dbgNoErrorResponse, host_rvalid_i |-> !host_err_i)

  //`define DEBUG_DM_MEM_IF //not supported bu bus.sv

  `ifdef DEBUG_DM_MEM_IF
  logic                    device_req;
  logic [AddressWidth-1:0] device_addr;
  logic                    device_we;
  logic [  BusWidth/8-1:0] device_be;
  logic [    BusWidth-1:0] device_wdata;
  dm_mem #(
    .NrHarts(NrHarts),
    .BusWidth(BusWidth),
    .SelectableHarts(SelectableHarts),
    // The debug module provides a simplified ROM for systems that map the debug ROM to offset 0x0
    // on the system bus. In that case, only one scratch register has to be implemented in the core.
    // However, we require that the DM can be placed at arbitrary offsets in the system, which
    // requires the generalized debug ROM implementation and two scratch registers. We hence set
    // this parameter to a non-zero value (inside dm_mem, this just feeds into a comparison with 0).
    .DmBaseAddress(1)
  ) i_dm_mem (
    .clk_i                   ( clk_i                 ),
    .rst_ni                  ( rst_ni                ),
    .debug_req_o             ( debug_req_o           ),
    .hartsel_i               ( hartsel               ),
    .haltreq_i               ( haltreq               ),
    .resumereq_i             ( resumereq             ),
    .clear_resumeack_i       ( clear_resumeack       ),
    .halted_o                ( halted                ),
    .resuming_o              ( resumeack             ),
    .cmd_valid_i             ( cmd_valid             ),
    .cmd_i                   ( cmd                   ),
    .cmderror_valid_o        ( cmderror_valid        ),
    .cmderror_o              ( cmderror              ),
    .cmdbusy_o               ( cmdbusy               ),
    .progbuf_i               ( progbuf               ),
    .data_i                  ( data_csrs_mem         ),
    .data_o                  ( data_mem_csrs         ),
    .data_valid_o            ( data_valid            ),
    .req_i                   ( device_req            ),
    .we_i                    ( device_we             ),
    .addr_i                  ( device_addr           ),
    .wdata_i                 ( device_wdata          ),
    .be_i                    ( device_be             ),
    .rdata_o                 ( device_rdata_o        )
  );

  assign device_err_o = 0;
  logic device_rvalid;

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      device_rvalid_o <= '0;
      device_gnt_o <= '0;
      device_rvalid <= '0;
      device_req   <= '0;
      device_addr  <= '0;
      device_we    <= '0;
      device_be    <= '0;
      device_wdata <= '0;
    end else begin
      //for debug purpose, we slow down accesses to see clearly in waveforms
      if(device_gnt_o) begin
          device_gnt_o <= 0;
          device_rvalid <= 0;
          device_rvalid_o <= device_rvalid;
      end else begin
          device_req   <= device_req_i   ;
          device_addr  <= device_addr_i  ;
          device_we    <= device_we_i    ;
          device_be    <= device_be_i    ;
          device_wdata <= device_wdata_i ;

          device_gnt_o <= device_req_i;
          device_rvalid <= device_req_i & ~device_we_i;
          device_rvalid_o <= 0;
      end
    end
  end



  `else

  dm_mem #(
    .NrHarts(NrHarts),
    .BusWidth(BusWidth),
    .SelectableHarts(SelectableHarts),
    // The debug module provides a simplified ROM for systems that map the debug ROM to offset 0x0
    // on the system bus. In that case, only one scratch register has to be implemented in the core.
    // However, we require that the DM can be placed at arbitrary offsets in the system, which
    // requires the generalized debug ROM implementation and two scratch registers. We hence set
    // this parameter to a non-zero value (inside dm_mem, this just feeds into a comparison with 0).
    .DmBaseAddress(1)
  ) i_dm_mem (
    .clk_i                   ( clk_i                 ),
    .rst_ni                  ( rst_ni                ),
    .debug_req_o             ( debug_req_o           ),
    .hartsel_i               ( hartsel               ),
    .haltreq_i               ( haltreq               ),
    .resumereq_i             ( resumereq             ),
    .clear_resumeack_i       ( clear_resumeack       ),
    .halted_o                ( halted                ),
    .resuming_o              ( resumeack             ),
    .cmd_valid_i             ( cmd_valid             ),
    .cmd_i                   ( cmd                   ),
    .cmderror_valid_o        ( cmderror_valid        ),
    .cmderror_o              ( cmderror              ),
    .cmdbusy_o               ( cmdbusy               ),
    .progbuf_i               ( progbuf               ),
    .data_i                  ( data_csrs_mem         ),
    .data_o                  ( data_mem_csrs         ),
    .data_valid_o            ( data_valid            ),
    .req_i                   ( device_req_i          ),
    .we_i                    ( device_we_i           ),
    .addr_i                  ( device_addr_i         ),
    .wdata_i                 ( device_wdata_i        ),
    .be_i                    ( device_be_i           ),
    .rdata_o                 ( device_rdata_o        )
  );

  assign device_err_o = 0;
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      device_rvalid_o <= '0;
      device_gnt_o <= '0;
    end else begin
      device_gnt_o <= device_req_i;
      device_rvalid_o <= device_req_i;// need rvalid for both read and write
    end
  end
`endif

  // JTAG TAP
  dmi_jtag #(
    .IdcodeValue    (IdcodeValue)
  ) dap (
    .clk_i            (clk_i),
    .rst_ni           (rst_ni),
    .testmode_i       (testmode_i),

    .dmi_rst_no       (dmi_rst_n),
    .dmi_req_o        (dmi_req),
    .dmi_req_valid_o  (dmi_req_valid),
    .dmi_req_ready_i  (dmi_req_ready),

    .dmi_resp_i       (dmi_rsp      ),
    .dmi_resp_ready_o (dmi_rsp_ready),
    .dmi_resp_valid_i (dmi_rsp_valid),

    //JTAG
    .tck_i,
    .tms_i,
    .trst_ni,
    .td_i,
    .td_o,
    .tdo_oe_o
  );

endmodule
