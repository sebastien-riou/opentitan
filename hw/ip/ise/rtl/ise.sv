// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// General Purpose Input/Output module

`include "prim_assert.sv"

module ise (
  input clk_i,
  input rst_ni,

  // Below Register interface can be changed
  input  tlul_pkg::tl_h2d_t tl_i,
  output tlul_pkg::tl_d2h_t tl_o
);

    import ise_reg_pkg::* ;

    //ise_reg2hw_t reg2hw;
    ise_hw2reg_t hw2reg;


    // Register module
    ise_reg_top u_reg (
    .clk_i,
    .rst_ni,

    .tl_i,
    .tl_o,

    //.reg2hw,
    .hw2reg,

    .devmode_i  (1'b1)
    );

    ise_core #(.SRAMInitFile("/home/user/Downloads/opentitan_fork/hw/ip/ise/sw/core0/core0_main0.vmem"))
    u_core(.clk_sys(clk_i), .rst_sys_n(rst_ni), .status(hw2reg.status.d));

endmodule
