module ise_core(
    input wire clk_sys_i,
    input wire rst_sys_ni,
    // JTAG interface
    input               jtag_tck_i,
    input               jtag_tms_i,
    input               jtag_trst_ni,
    input               jtag_tdi_i,
    output logic        jtag_tdo_o,
    output logic        jtag_tdo_oe_o,

    output logic [31:0] status
    );

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

    import tlul_pkg::*;
    //import top_pkg::*;
    import tl_ise_main_pkg::*;


    tlul_pkg::tl_h2d_t       ram_main_tl_req;
    tlul_pkg::tl_d2h_t       ram_main_tl_rsp;
    tlul_pkg::tl_h2d_t       gpio_tl_req;
    tlul_pkg::tl_d2h_t       gpio_tl_rsp;

    tlul_pkg::tl_h2d_t       main_tl_corei_req;
    tlul_pkg::tl_d2h_t       main_tl_corei_rsp;
    tlul_pkg::tl_h2d_t       main_tl_cored_req;
    tlul_pkg::tl_d2h_t       main_tl_cored_rsp;
    tlul_pkg::tl_h2d_t       main_tl_dm_sba_req;
    tlul_pkg::tl_d2h_t       main_tl_dm_sba_rsp;
    tlul_pkg::tl_h2d_t       main_tl_debug_mem_req;
    tlul_pkg::tl_d2h_t       main_tl_debug_mem_rsp;

    wire clk_sys = clk_sys_i;
    wire scanmode = 0;
    assign jtag_tdo_oe_o = 1;

    // Escalation outputs
    prim_esc_pkg::esc_tx_t [1:0]  esc_tx;
    prim_esc_pkg::esc_rx_t [1:0]  esc_rx;
    assign esc_tx = '0;

    logic [0:0] irq_plic;
    logic [0:0] msip;
    //logic [6:0] irq_id[1];
    logic [6:0] unused_irq_id[1];

    assign irq_plic = '0;
    assign msip = '0;

    wire intr_rv_timer_timer_expired_0_0 = 0;

    // Non-debug module reset == reset for everything except for the debug module
    logic ndmreset_req;
    wire rst_ndm_n = ~ndmreset_req;
    wire rst_sys_n = rst_sys_ni & rst_ndm_n;

    // debug request from rv_dm to core
    logic debug_req;

    // processor core
    rv_core_ibex #(
      .PMPEnable                (1),
      .PMPGranularity           (0), // 2^(PMPGranularity+2) == 4 byte granularity
      .PMPNumRegions            (16),
      .MHPMCounterNum           (10),
      .MHPMCounterWidth         (32),
      .RV32E                    (0),
      .RV32M                    (ibex_pkg::RV32MSingleCycle),
      .RV32B                    (ibex_pkg::RV32BNone),
      .RegFile                  (ibex_pkg::RegFileFF),
      .BranchTargetALU          (1),
      .WritebackStage           (1),
      .ICache                   (1),
      .ICacheECC                (1),
      .BranchPredictor          (0),
      .DbgTriggerEn             (1),
      .SecureIbex               (0),
      .DmHaltAddr               (ADDR_SPACE_DEBUG_MEM + dm::HaltAddress[31:0]),
      .DmExceptionAddr          (ADDR_SPACE_DEBUG_MEM + dm::ExceptionAddress[31:0]),
      .PipeLine                 (0),
      .TRACE_NAME               ("trace_ise")
    ) u_rv_core_ibex (
      // clock and reset
      .clk_i                (clk_sys),
      .rst_ni               (rst_sys_n),
      .test_en_i            (1'b0),
      // static pinning
      .hart_id_i            (32'h00000000),
      .boot_addr_i          (ADDR_SPACE_RAM_MAIN),
      // TL-UL buses
      .tl_i_o               (main_tl_corei_req),
      .tl_i_i               (main_tl_corei_rsp),
      .tl_d_o               (main_tl_cored_req),
      .tl_d_i               (main_tl_cored_rsp),
      // interrupts
      .irq_software_i       (msip),
      .irq_timer_i          (intr_rv_timer_timer_expired_0_0),
      .irq_external_i       (irq_plic),
      // escalation input from alert handler (NMI)
      .esc_tx_i             (esc_tx[0]),
      .esc_rx_o             (esc_rx[0]),
      // debug interface
      .debug_req_i          (debug_req),
      // CPU control signals
      .fetch_enable_i       (1'b1),
      .core_sleep_o         ()
    );

    // Debug Module (RISC-V Debug Spec 0.13)
    //
    rv_dm #(
      .NrHarts     (1),
      .IdcodeValue (JTAG_IDCODE)
    ) u_dm_top (
      .clk_i         (clk_sys),
      .rst_ni        (rst_sys_ni),
      .testmode_i    (1'b0),
      .ndmreset_o    (ndmreset_req),
      .dmactive_o    (),
      .debug_req_o   (debug_req),
      .unavailable_i (1'b0),

      // bus device with debug memory (for execution-based debug)
      .tl_d_i        (main_tl_debug_mem_req),
      .tl_d_o        (main_tl_debug_mem_rsp),

      // bus host (for system bus accesses, SBA)
      .tl_h_o        (main_tl_dm_sba_req),
      .tl_h_i        (main_tl_dm_sba_rsp),

      //JTAG
      .tck_i            (jtag_tck_i),
      .tms_i            (jtag_tms_i),
      .trst_ni          (jtag_trst_ni),
      .td_i             (jtag_tdi_i),
      .td_o             (jtag_tdo_o),
      .tdo_oe_o         (       )
    );

    // sram device
    logic        ram_main_req;
    logic        ram_main_we;
    logic [13:0] ram_main_addr;
    logic [31:0] ram_main_wdata;
    logic [31:0] ram_main_wmask;
    logic [31:0] ram_main_rdata;
    logic        ram_main_rvalid;
    logic [1:0]  ram_main_rerror;

    tlul_adapter_sram #(
      .SramAw(14),
      .SramDw(32),
      .Outstanding(2)
    ) u_tl_adapter_ram_main (
      .clk_i    (clk_sys),
      .rst_ni   (rst_sys_n),
      .tl_i     (ram_main_tl_req),
      .tl_o     (ram_main_tl_rsp),

      .req_o    (ram_main_req),
      .gnt_i    (1'b1), // Always grant as only one requester exists
      .we_o     (ram_main_we),
      .addr_o   (ram_main_addr),
      .wdata_o  (ram_main_wdata),
      .wmask_o  (ram_main_wmask),
      .rdata_i  (ram_main_rdata),
      .rvalid_i (ram_main_rvalid),
      .rerror_i (ram_main_rerror)
    );

    prim_ram_1p_adv #(
      .Width(32),
      .Depth(16384),
      .DataBitsPerMask(8),
      .CfgW(8),
      .EnableParity(0),
      .MemInitFile(SRAMInitFile)
    ) u_ram1p_ram_main (
      .clk_i    (clk_sys),
      .rst_ni   (rst_sys_n),

      .req_i    (ram_main_req),
      .write_i  (ram_main_we),
      .addr_i   (ram_main_addr),
      .wdata_i  (ram_main_wdata),
      .wmask_i  (ram_main_wmask),
      .rdata_o  (ram_main_rdata),
      .rvalid_o (ram_main_rvalid),
      .rerror_o (ram_main_rerror),
      .cfg_i    ('0)
    );

    gpio u_status (

        // Input
        .cio_gpio_i    ('0),

        // Output
        .cio_gpio_o    (status),
        .cio_gpio_en_o (),

        // Interrupt
        .intr_gpio_o (),

        // Inter-module signals
        .tl_i(gpio_tl_req),
        .tl_o(gpio_tl_rsp),
      //clocks
        .clk_i (clk_sys),
      //resets
        .rst_ni (rst_sys_n)
    );

    // TL-UL Crossbar
    xbar_ise_main u_xbar_main (
      .clk_main_i (clk_sys),
      .rst_main_ni (rst_sys_n),

      // port: tl_corei
      .tl_corei_i(main_tl_corei_req),
      .tl_corei_o(main_tl_corei_rsp),

      // port: tl_cored
      .tl_cored_i(main_tl_cored_req),
      .tl_cored_o(main_tl_cored_rsp),

      // port: tl_dm_sba
      .tl_dm_sba_i(main_tl_dm_sba_req),
      .tl_dm_sba_o(main_tl_dm_sba_rsp),

      // port: tl_debug_mem
      .tl_debug_mem_o(main_tl_debug_mem_req),
      .tl_debug_mem_i(main_tl_debug_mem_rsp),

      // port: tl_ram_main
      .tl_ram_main_o(ram_main_tl_req),
      .tl_ram_main_i(ram_main_tl_rsp),

      // port: tl_gpio
      .tl_gpio_o(gpio_tl_req),
      .tl_gpio_i(gpio_tl_rsp),

      .scanmode_i(scanmode)
    );

    // make sure scanmode is never X (including during reset)
    `ASSERT_KNOWN(scanmodeKnown, scanmode, clk_main_i, 0)
endmodule
