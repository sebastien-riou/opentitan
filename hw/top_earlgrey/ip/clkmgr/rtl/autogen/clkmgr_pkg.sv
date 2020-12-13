// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// ------------------- W A R N I N G: A U T O - G E N E R A T E D   C O D E !! -------------------//
// PLEASE DO NOT HAND-EDIT THIS FILE. IT HAS BEEN AUTO-GENERATED WITH THE FOLLOWING COMMAND:
// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0



package clkmgr_pkg;

  typedef enum int {
  } hint_names_e;

  typedef struct packed {
  logic clk_main_powerup;
  logic clk_io_div4_powerup;
  logic clk_aon_powerup;
  logic clk_io_powerup;
  logic clk_usb_powerup;
  logic clk_io_div2_powerup;
  logic clk_aon_secure;
  logic clk_main_infra;
  logic clk_io_div4_infra;
  logic clk_io_div4_secure;
  logic clk_main_secure;
  logic clk_io_div4_timers;
  logic clk_proc_main;
  logic clk_io_div4_peri;
  logic clk_usb_peri;

  } clkmgr_out_t;

  typedef struct packed {
    logic clk_ast_usbdev_io_div4_peri;
    logic clk_ast_usbdev_usb_peri;
    logic clk_ast_sensor_ctrl_io_div4_secure;
  } clkmgr_ast_out_t;

  typedef struct packed {
    logic [0-1:0] idle;
  } clk_hint_status_t;

  parameter clk_hint_status_t CLK_HINT_STATUS_DEFAULT = '{
    idle: {0{1'b1}}
  };


endpackage // clkmgr_pkg
