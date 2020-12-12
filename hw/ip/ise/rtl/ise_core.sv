module ise_core(
    input wire clk_sys,
    input wire rst_sys_n,
    // JTAG interface
    input               jtag_tck_i,
    input               jtag_tms_i,
    input               jtag_trst_ni,
    input               jtag_tdi_i,
    output logic        jtag_tdo_o,
    output logic        jtag_tdo_oe_o,

    output logic [31:0] status
    );

    parameter bit               PMPEnable                = 1'b0;
    parameter int unsigned      PMPGranularity           = 0;
    parameter int unsigned      PMPNumRegions            = 4;
    parameter bit               RV32E                    = 0;
    parameter bit               RV32M                    = 1;
    parameter ibex_pkg::rv32b_e RV32B                    = 0;
    parameter bit               BranchTargetALU          = 1'b0;
    parameter bit               WritebackStage           = 1'b0;
    parameter                   MultiplierImplementation = "fast";
    parameter                   SRAMInitFile             = "";

    // JTAG IDCODE for development versions of this code.
    // Manufacturers of OpenTitan chips must replace this code with one of their
    // own IDs.
    // Field structure as defined in the IEEE 1149.1 (JTAG) specification,
    // section 12.1.1.
    localparam logic [31:0] JTAG_IDCODE = {
      4'h0,     // Version
      16'hAAAA, // Part Number
      11'h426,  // Manufacturer Identity: Google
      1'b1      // (fixed)
    };

    localparam ADDR_SPACE_DEBUG_MEM = 32'h00010000;

    typedef enum {
    CoreI,
    CoreD,
    DbgSBA
    } bus_host_e;

    typedef enum {
    DbgMem,
    Ram,
    Timer,
    Status
    } bus_device_e;

    localparam NrDevices = 4;
    localparam NrHosts = 3;

    // Non-debug module reset == an extra reset source for everything except for the debug module
    logic ndmreset_req;

    //reset for everything except debug
    wire rst_n = rst_sys_n & ~ndmreset_req;

    // debug request from rv_dm to core
    logic debug_req;



    // interrupts
    logic timer_irq;

    // host and device signals
    logic           host_req    [NrHosts];
    logic           host_gnt    [NrHosts];
    logic [31:0]    host_addr   [NrHosts];
    logic           host_we     [NrHosts];
    logic [ 3:0]    host_be     [NrHosts];
    logic [31:0]    host_wdata  [NrHosts];
    logic           host_rvalid [NrHosts];
    logic [31:0]    host_rdata  [NrHosts];
    logic           host_err    [NrHosts];

    // devices (slaves)
    logic           device_req    [NrDevices];
    logic [31:0]    device_addr   [NrDevices];
    logic           device_we     [NrDevices];
    logic [ 3:0]    device_be     [NrDevices];
    logic [31:0]    device_wdata  [NrDevices];
    logic           device_rvalid [NrDevices];
    logic [31:0]    device_rdata  [NrDevices];
    logic           device_err    [NrDevices];

    // Device address mapping
    logic [31:0] cfg_device_addr_base [NrDevices];
    logic [31:0] cfg_device_addr_mask [NrDevices];
    assign cfg_device_addr_base[DbgMem] =  ADDR_SPACE_DEBUG_MEM;
    assign cfg_device_addr_mask[DbgMem] = ~32'h0000FFFF; //64 KB
    assign cfg_device_addr_base[Ram]    =  32'h80000000;
    assign cfg_device_addr_mask[Ram]    = ~32'h000FFFFF; // 1 MB
    assign cfg_device_addr_base[Timer]  =  32'h00020000;
    assign cfg_device_addr_mask[Timer]  = ~32'h000003FF; // 1 kB
    assign cfg_device_addr_base[Status] =  32'h00030000;
    assign cfg_device_addr_mask[Status] = ~32'h000003FF; // 1 kB

    // Instruction fetch signals
    //logic instr_req;
    //logic instr_gnt;
    //logic instr_rvalid;
    //logic [31:0] instr_addr;
    //logic [31:0] instr_rdata;
    //logic instr_err;

    //assign instr_gnt = instr_req;
    //assign instr_err = '0;

    // Tie-off unused error signals
    assign device_err[Ram] = 1'b0;

    bus #(
    .NrDevices    ( NrDevices ),
    .NrHosts      ( NrHosts   ),
    .DataWidth    ( 32        ),
    .AddressWidth ( 32        )
    ) u_bus (
    .clk_i               (clk_sys),
    .rst_ni              (rst_n),

    .host_req_i          (host_req     ),
    .host_gnt_o          (host_gnt     ),
    .host_addr_i         (host_addr    ),
    .host_we_i           (host_we      ),
    .host_be_i           (host_be      ),
    .host_wdata_i        (host_wdata   ),
    .host_rvalid_o       (host_rvalid  ),
    .host_rdata_o        (host_rdata   ),
    .host_err_o          (host_err     ),

    .device_req_o        (device_req   ),
    .device_addr_o       (device_addr  ),
    .device_we_o         (device_we    ),
    .device_be_o         (device_be    ),
    .device_wdata_o      (device_wdata ),
    .device_rvalid_i     (device_rvalid),
    .device_rdata_i      (device_rdata ),
    .device_err_i        (device_err   ),

    .cfg_device_addr_base,
    .cfg_device_addr_mask
    );

`ifdef RVFI
  logic        rvfi_valid;
  logic [63:0] rvfi_order;
  logic [31:0] rvfi_insn;
  logic        rvfi_trap;
  logic        rvfi_halt;
  logic        rvfi_intr;
  logic [ 1:0] rvfi_mode;
  logic [ 1:0] rvfi_ixl;
  logic [ 4:0] rvfi_rs1_addr;
  logic [ 4:0] rvfi_rs2_addr;
  logic [ 4:0] rvfi_rs3_addr;
  logic [31:0] rvfi_rs1_rdata;
  logic [31:0] rvfi_rs2_rdata;
  logic [31:0] rvfi_rs3_rdata;
  logic [ 4:0] rvfi_rd_addr;
  logic [31:0] rvfi_rd_wdata;
  logic [31:0] rvfi_pc_rdata;
  logic [31:0] rvfi_pc_wdata;
  logic [31:0] rvfi_mem_addr;
  logic [ 3:0] rvfi_mem_rmask;
  logic [ 3:0] rvfi_mem_wmask;
  logic [31:0] rvfi_mem_rdata;
  logic [31:0] rvfi_mem_wdata;
`endif

    assign host_be    [CoreI] = 4'hF;
    assign host_we    [CoreI] = 0;
    assign host_wdata [CoreI] = 0;
    wire [31:0] hart_id = 32'h00000000;

    ibex_core #(
      .PMPEnable                ( PMPEnable                ),
      .PMPGranularity           ( PMPGranularity           ),
      .PMPNumRegions            ( PMPNumRegions            ),
      .MHPMCounterNum           ( 29                       ),
      .RV32E                    ( RV32E                    ),
      .RV32M                    ( RV32M                    ),
      .RV32B                    ( RV32B                    ),
      .BranchTargetALU          ( BranchTargetALU          ),
      .WritebackStage           ( WritebackStage           ),
      //.MultiplierImplementation ( MultiplierImplementation ),
      .DmHaltAddr               ( ADDR_SPACE_DEBUG_MEM + dm::HaltAddress ),
      .DmExceptionAddr          ( ADDR_SPACE_DEBUG_MEM + dm::ExceptionAddress)
    ) u_core (
      .clk_i                 (clk_sys),
      .rst_ni                (rst_n),

      .test_en_i             ('b0),

      .hart_id_i             (hart_id),
      // First instruction executed is at boot_addr_i + 0x80
      .boot_addr_i           (32'h80000000),

      .instr_req_o           (host_req   [CoreI]),
      .instr_gnt_i           (host_gnt   [CoreI]),
      .instr_rvalid_i        (host_rvalid[CoreI]),
      .instr_addr_o          (host_addr  [CoreI]),
      .instr_rdata_i         (host_rdata [CoreI]),
      .instr_err_i           (host_err   [CoreI]),

      .data_req_o            (host_req   [CoreD]),
      .data_we_o             (host_we    [CoreD]),
      .data_be_o             (host_be    [CoreD]),
      .data_addr_o           (host_addr  [CoreD]),
      .data_wdata_o          (host_wdata [CoreD]),
      .data_rvalid_i         (host_rvalid[CoreD]),
      .data_rdata_i          (host_rdata [CoreD]),
      .data_err_i            (host_err   [CoreD]),
      .data_gnt_i            (host_gnt   [CoreD]),

      .irq_software_i        (1'b0),
      .irq_timer_i           (timer_irq),
      .irq_external_i        (1'b0),
      .irq_fast_i            (15'b0),
      .irq_nm_i              (1'b0),

      .debug_req_i           (debug_req),

      `ifdef RVFI
          .rvfi_valid,
          .rvfi_order,
          .rvfi_insn,
          .rvfi_trap,
          .rvfi_halt,
          .rvfi_intr,
          .rvfi_mode,
          .rvfi_ixl,
          .rvfi_rs1_addr,
          .rvfi_rs2_addr,
          .rvfi_rs3_addr,
          .rvfi_rs1_rdata,
          .rvfi_rs2_rdata,
          .rvfi_rs3_rdata,
          .rvfi_rd_addr,
          .rvfi_rd_wdata,
          .rvfi_pc_rdata,
          .rvfi_pc_wdata,
          .rvfi_mem_addr,
          .rvfi_mem_rmask,
          .rvfi_mem_wmask,
          .rvfi_mem_rdata,
          .rvfi_mem_wdata,
      `endif

      .fetch_enable_i        ('b1),
      .core_sleep_o          (),
      .alert_minor_o         (),
      .alert_major_o         ()
    );

    // Debug Module (RISC-V Debug Spec 0.13)
    ibex_debug #(
      .NrHarts     (1),
      .IdcodeValue (JTAG_IDCODE)
    ) u_dm_top (
      .clk_i         (clk_sys),
      .rst_ni        (rst_n),
      .testmode_i    (1'b0),
      .ndmreset_o    (ndmreset_req),
      .dmactive_o    (),
      .debug_req_o   (debug_req),
      .unavailable_i (1'b0),

      // bus device with debug memory (for execution-based debug)
      .device_req_i     (device_req   [DbgMem]),
      .device_addr_i    (device_addr  [DbgMem]),
      .device_we_i      (device_we    [DbgMem]),
      .device_be_i      (device_be    [DbgMem]),
      .device_wdata_i   (device_wdata [DbgMem]),
      .device_rvalid_o  (device_rvalid[DbgMem]),
      .device_rdata_o   (device_rdata [DbgMem]),
      .device_err_o     (device_err   [DbgMem]),
      .device_gnt_o     (),//TODO: assert always 1 or handle it

      // bus host (for system bus accesses, SBA)
      .host_req_o       (host_req   [DbgSBA]),
      .host_addr_o      (host_addr  [DbgSBA]),
      .host_we_o        (host_we    [DbgSBA]),
      .host_be_o        (host_be    [DbgSBA]),
      .host_wdata_o     (host_wdata [DbgSBA]),
      .host_rvalid_i    (host_rvalid[DbgSBA]),
      .host_rdata_i     (host_rdata [DbgSBA]),
      .host_err_i       (host_err   [DbgSBA]),
      .host_gnt_i       (host_gnt   [DbgSBA]),

      //JTAG
      .tck_i            (jtag_tck_i),
      .tms_i            (jtag_tms_i),
      .trst_ni          (jtag_trst_ni),
      .td_i             (jtag_tdi_i),
      .td_o             (jtag_tdo_o),
      .tdo_oe_o         (jtag_tdo_oe_o)
    );
/*
    // SRAM block for instruction and data storage
    ram_2p #(
      .Depth(8*1024/4),
      .MemInitFile(SRAMInitFile)
    ) u_ram (
      .clk_i       (clk_sys),
      .rst_ni      (rst_n),

      .a_req_i     (device_req   [Ram]),
      .a_addr_i    (device_addr  [Ram]),
      .a_we_i      (device_we    [Ram]),
      .a_be_i      (device_be    [Ram]),
      .a_wdata_i   (device_wdata [Ram]),
      .a_rvalid_o  (device_rvalid[Ram]),
      .a_rdata_o   (device_rdata [Ram]),

      .b_req_i     (instr_req),
      .b_we_i      (1'b0),
      .b_be_i      (4'b0),
      .b_addr_i    (instr_addr),
      .b_wdata_i   (32'b0),
      .b_rvalid_o  (instr_rvalid),
      .b_rdata_o   (instr_rdata)
    );
*/
    // SRAM block for instruction and data storage
    ram_1p #(
      .Depth(8*1024/4),
      .MemInitFile(SRAMInitFile)
    ) u_ram (
      .clk_i       (clk_sys),
      .rst_ni      (rst_n),

      .req_i     (device_req   [Ram]),
      .addr_i    (device_addr  [Ram]),
      .we_i      (device_we    [Ram]),
      .be_i      (device_be    [Ram]),
      .wdata_i   (device_wdata [Ram]),
      .rvalid_o  (device_rvalid[Ram]),
      .rdata_o   (device_rdata [Ram])
    );


    timer #(
    .DataWidth    (32),
    .AddressWidth (32)
    ) u_timer (
      .clk_i          (clk_sys),
      .rst_ni         (rst_n),

      .timer_req_i    (device_req[Timer]),
      .timer_we_i     (device_we[Timer]),
      .timer_be_i     (device_be[Timer]),
      .timer_addr_i   (device_addr[Timer]),
      .timer_wdata_i  (device_wdata[Timer]),
      .timer_rvalid_o (device_rvalid[Timer]),
      .timer_rdata_o  (device_rdata[Timer]),
      .timer_err_o    (device_err[Timer]),
      .timer_intr_o   (timer_irq)
    );

    gpo u_status (
      .clk_i          (clk_sys),
      .rst_ni         (rst_n),
      .req_i    (device_req   [Status]),
      .we_i     (device_we    [Status]),
      .be_i     (device_be    [Status]),
      .addr_i   (device_addr  [Status]),
      .wdata_i  (device_wdata [Status]),
      .rvalid_o (device_rvalid[Status]),
      .rdata_o  (device_rdata [Status]),
      .err_o    (device_err   [Status]),
      .state    (status)
    );

/*
always_ff @(posedge clk_sys, negedge rst_sys_n) begin
    if(~rst_sys_n) status <= 0;
    else begin
        status <= status + 1;
    end
end
*/

`ifdef RVFI
  ibex_tracer ibex_tracer_i (
    .clk_i(clk_sys),
    .rst_ni(rst_sys_n),

    .hart_id_i(hart_id|32'h80000000),

    .rvfi_valid,
    .rvfi_order,
    .rvfi_insn,
    .rvfi_trap,
    .rvfi_halt,
    .rvfi_intr,
    .rvfi_mode,
    .rvfi_ixl,
    .rvfi_rs1_addr,
    .rvfi_rs2_addr,
    .rvfi_rs3_addr,
    .rvfi_rs1_rdata,
    .rvfi_rs2_rdata,
    .rvfi_rs3_rdata,
    .rvfi_rd_addr,
    .rvfi_rd_wdata,
    .rvfi_pc_rdata,
    .rvfi_pc_wdata,
    .rvfi_mem_addr,
    .rvfi_mem_rmask,
    .rvfi_mem_wmask,
    .rvfi_mem_rdata,
    .rvfi_mem_wdata
  );
`endif

endmodule
