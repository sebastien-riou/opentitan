// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
module tb;
  // dep packages
  import uvm_pkg::*;
  import dv_utils_pkg::*;
  import keymgr_env_pkg::*;
  import keymgr_test_pkg::*;

  // macro includes
  `include "uvm_macros.svh"
  `include "dv_macros.svh"

  wire clk, rst_n;
  wire devmode;
  wire [NUM_MAX_INTERRUPTS-1:0] interrupts;

  // interfaces
  clk_rst_if clk_rst_if(.clk(clk), .rst_n(rst_n));
  pins_if #(NUM_MAX_INTERRUPTS) intr_if(interrupts);
  pins_if #(1) devmode_if(devmode);
  tl_if tl_if(.clk(clk), .rst_n(rst_n));
  keymgr_input_data_if keymgr_input_data_if();

  logic [1:0][7:0][31:0] rand_values;
  keymgr_pkg::kmac_data_rsp_t kmac_rsp;
  assign kmac_rsp.ready = 1'b1;
  assign kmac_rsp.done = 1'b1;
  assign kmac_rsp.error = 1'b0;

  always_ff @(posedge clk) begin
    for (int i = 0; i < 8; i++) begin
      rand_values[0][i] <= $urandom_range(-1, 0);
      rand_values[1][i] <= $urandom_range(-1, 0);
    end
  end

  assign kmac_rsp.digest_share0 = rand_values[0];
  assign kmac_rsp.digest_share1 = rand_values[1];

  `DV_ALERT_IF_CONNECT

  // dut
  keymgr dut (
    .clk_i                (clk        ),
    .rst_ni               (rst_n      ),
    .aes_key_o            (           ),
    .hmac_key_o           (           ),
    .kmac_key_o           (           ),
    .kmac_data_o          (           ),
    .kmac_data_i          (kmac_rsp   ),
    .lc_i                 (keymgr_input_data_if.lc),
    .otp_i                (keymgr_input_data_if.otp),
    .flash_i              (keymgr_input_data_if.flash),
    .intr_op_done_o       (interrupts[IntrOpDone]),
    .intr_err_o           (interrupts[IntrErr]),
    .alert_rx_i           (alert_rx   ),
    .alert_tx_o           (alert_tx   ),
    .tl_i                 (tl_if.h2d  ),
    .tl_o                 (tl_if.d2h  )
    // TODO: add remaining IOs and hook them
  );

  initial begin
    // drive clk and rst_n from clk_if
    clk_rst_if.set_active();
    uvm_config_db#(virtual clk_rst_if)::set(null, "*.env", "clk_rst_vif", clk_rst_if);
    uvm_config_db#(intr_vif)::set(null, "*.env", "intr_vif", intr_if);
    uvm_config_db#(devmode_vif)::set(null, "*.env", "devmode_vif", devmode_if);
    uvm_config_db#(virtual tl_if)::set(null, "*.env.m_tl_agent*", "vif", tl_if);
    uvm_config_db#(virtual keymgr_input_data_if)::set(null, "*.env", "keymgr_input_data_vif",
                                                      keymgr_input_data_if);
    $timeformat(-12, 0, " ps", 12);
    run_test();
  end

endmodule
