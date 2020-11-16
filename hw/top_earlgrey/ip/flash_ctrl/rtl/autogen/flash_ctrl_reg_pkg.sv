// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package flash_ctrl_reg_pkg;

  // Param list
  parameter int RegNumBanks = 2;
  parameter int RegPagesPerBank = 32;
  parameter int NumRegions = 8;
  parameter int NumInfos0 = 4;
  parameter int NumInfos1 = 4;
  parameter int WordsPerPage = 128;
  parameter int BytesPerWord = 8;
  parameter int BytesPerPage = 1024;
  parameter int BytesPerBank = 32768;

  ////////////////////////////
  // Typedefs for registers //
  ////////////////////////////
  typedef struct packed {
    struct packed {
      logic        q;
    } prog_empty;
    struct packed {
      logic        q;
    } prog_lvl;
    struct packed {
      logic        q;
    } rd_full;
    struct packed {
      logic        q;
    } rd_lvl;
    struct packed {
      logic        q;
    } op_done;
    struct packed {
      logic        q;
    } op_error;
  } flash_ctrl_reg2hw_intr_state_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } prog_empty;
    struct packed {
      logic        q;
    } prog_lvl;
    struct packed {
      logic        q;
    } rd_full;
    struct packed {
      logic        q;
    } rd_lvl;
    struct packed {
      logic        q;
    } op_done;
    struct packed {
      logic        q;
    } op_error;
  } flash_ctrl_reg2hw_intr_enable_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
      logic        qe;
    } prog_empty;
    struct packed {
      logic        q;
      logic        qe;
    } prog_lvl;
    struct packed {
      logic        q;
      logic        qe;
    } rd_full;
    struct packed {
      logic        q;
      logic        qe;
    } rd_lvl;
    struct packed {
      logic        q;
      logic        qe;
    } op_done;
    struct packed {
      logic        q;
      logic        qe;
    } op_error;
  } flash_ctrl_reg2hw_intr_test_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } start;
    struct packed {
      logic [1:0]  q;
    } op;
    struct packed {
      logic        q;
    } prog_sel;
    struct packed {
      logic        q;
    } erase_sel;
    struct packed {
      logic        q;
    } partition_sel;
    struct packed {
      logic        q;
    } info_sel;
    struct packed {
      logic [11:0] q;
    } num;
  } flash_ctrl_reg2hw_control_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } flash_ctrl_reg2hw_addr_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } en;
    struct packed {
      logic        q;
    } rd_en;
    struct packed {
      logic        q;
    } prog_en;
    struct packed {
      logic        q;
    } erase_en;
    struct packed {
      logic        q;
    } scramble_en;
    struct packed {
      logic [8:0]  q;
    } base;
    struct packed {
      logic [9:0] q;
    } size;
  } flash_ctrl_reg2hw_mp_region_cfg_mreg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } rd_en;
    struct packed {
      logic        q;
    } prog_en;
    struct packed {
      logic        q;
    } erase_en;
    struct packed {
      logic        q;
    } scramble_en;
  } flash_ctrl_reg2hw_default_region_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } en;
    struct packed {
      logic        q;
    } rd_en;
    struct packed {
      logic        q;
    } prog_en;
    struct packed {
      logic        q;
    } erase_en;
    struct packed {
      logic        q;
    } scramble_en;
  } flash_ctrl_reg2hw_bank0_info0_page_cfg_mreg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } en;
    struct packed {
      logic        q;
    } rd_en;
    struct packed {
      logic        q;
    } prog_en;
    struct packed {
      logic        q;
    } erase_en;
    struct packed {
      logic        q;
    } scramble_en;
  } flash_ctrl_reg2hw_bank0_info1_page_cfg_mreg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } en;
    struct packed {
      logic        q;
    } rd_en;
    struct packed {
      logic        q;
    } prog_en;
    struct packed {
      logic        q;
    } erase_en;
    struct packed {
      logic        q;
    } scramble_en;
  } flash_ctrl_reg2hw_bank1_info0_page_cfg_mreg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } en;
    struct packed {
      logic        q;
    } rd_en;
    struct packed {
      logic        q;
    } prog_en;
    struct packed {
      logic        q;
    } erase_en;
    struct packed {
      logic        q;
    } scramble_en;
  } flash_ctrl_reg2hw_bank1_info1_page_cfg_mreg_t;

  typedef struct packed {
    logic        q;
  } flash_ctrl_reg2hw_mp_bank_cfg_mreg_t;

  typedef struct packed {
    logic [31:0] q;
  } flash_ctrl_reg2hw_scratch_reg_t;

  typedef struct packed {
    struct packed {
      logic [4:0]  q;
    } prog;
    struct packed {
      logic [4:0]  q;
    } rd;
  } flash_ctrl_reg2hw_fifo_lvl_reg_t;

  typedef struct packed {
    logic        q;
  } flash_ctrl_reg2hw_fifo_rst_reg_t;


  typedef struct packed {
    struct packed {
      logic        d;
      logic        de;
    } prog_empty;
    struct packed {
      logic        d;
      logic        de;
    } prog_lvl;
    struct packed {
      logic        d;
      logic        de;
    } rd_full;
    struct packed {
      logic        d;
      logic        de;
    } rd_lvl;
    struct packed {
      logic        d;
      logic        de;
    } op_done;
    struct packed {
      logic        d;
      logic        de;
    } op_error;
  } flash_ctrl_hw2reg_intr_state_reg_t;

  typedef struct packed {
    logic        d;
  } flash_ctrl_hw2reg_ctrl_regwen_reg_t;

  typedef struct packed {
    struct packed {
      logic        d;
      logic        de;
    } start;
  } flash_ctrl_hw2reg_control_reg_t;

  typedef struct packed {
    struct packed {
      logic        d;
      logic        de;
    } done;
    struct packed {
      logic        d;
      logic        de;
    } err;
  } flash_ctrl_hw2reg_op_status_reg_t;

  typedef struct packed {
    struct packed {
      logic        d;
      logic        de;
    } rd_full;
    struct packed {
      logic        d;
      logic        de;
    } rd_empty;
    struct packed {
      logic        d;
      logic        de;
    } prog_full;
    struct packed {
      logic        d;
      logic        de;
    } prog_empty;
    struct packed {
      logic        d;
      logic        de;
    } init_wip;
    struct packed {
      logic [8:0]  d;
      logic        de;
    } error_addr;
  } flash_ctrl_hw2reg_status_reg_t;

  typedef struct packed {
    struct packed {
      logic        d;
      logic        de;
    } init_wip;
    struct packed {
      logic        d;
      logic        de;
    } prog_normal_avail;
    struct packed {
      logic        d;
      logic        de;
    } prog_repair_avail;
  } flash_ctrl_hw2reg_phy_status_reg_t;


  ///////////////////////////////////////
  // Register to internal design logic //
  ///////////////////////////////////////
  typedef struct packed {
    flash_ctrl_reg2hw_intr_state_reg_t intr_state; // [395:390]
    flash_ctrl_reg2hw_intr_enable_reg_t intr_enable; // [389:384]
    flash_ctrl_reg2hw_intr_test_reg_t intr_test; // [383:372]
    flash_ctrl_reg2hw_control_reg_t control; // [371:353]
    flash_ctrl_reg2hw_addr_reg_t addr; // [352:321]
    flash_ctrl_reg2hw_mp_region_cfg_mreg_t [7:0] mp_region_cfg; // [320:129]
    flash_ctrl_reg2hw_default_region_reg_t default_region; // [128:125]
    flash_ctrl_reg2hw_bank0_info0_page_cfg_mreg_t [3:0] bank0_info0_page_cfg; // [124:105]
    flash_ctrl_reg2hw_bank0_info1_page_cfg_mreg_t [3:0] bank0_info1_page_cfg; // [104:85]
    flash_ctrl_reg2hw_bank1_info0_page_cfg_mreg_t [3:0] bank1_info0_page_cfg; // [84:65]
    flash_ctrl_reg2hw_bank1_info1_page_cfg_mreg_t [3:0] bank1_info1_page_cfg; // [64:45]
    flash_ctrl_reg2hw_mp_bank_cfg_mreg_t [1:0] mp_bank_cfg; // [44:43]
    flash_ctrl_reg2hw_scratch_reg_t scratch; // [42:11]
    flash_ctrl_reg2hw_fifo_lvl_reg_t fifo_lvl; // [10:1]
    flash_ctrl_reg2hw_fifo_rst_reg_t fifo_rst; // [0:0]
  } flash_ctrl_reg2hw_t;

  ///////////////////////////////////////
  // Internal design logic to register //
  ///////////////////////////////////////
  typedef struct packed {
    flash_ctrl_hw2reg_intr_state_reg_t intr_state; // [44:39]
    flash_ctrl_hw2reg_ctrl_regwen_reg_t ctrl_regwen; // [38:39]
    flash_ctrl_hw2reg_control_reg_t control; // [38:20]
    flash_ctrl_hw2reg_op_status_reg_t op_status; // [19:20]
    flash_ctrl_hw2reg_status_reg_t status; // [19:20]
    flash_ctrl_hw2reg_phy_status_reg_t phy_status; // [19:20]
  } flash_ctrl_hw2reg_t;

  // Register Address
  parameter logic [8:0] FLASH_CTRL_INTR_STATE_OFFSET = 9'h 0;
  parameter logic [8:0] FLASH_CTRL_INTR_ENABLE_OFFSET = 9'h 4;
  parameter logic [8:0] FLASH_CTRL_INTR_TEST_OFFSET = 9'h 8;
  parameter logic [8:0] FLASH_CTRL_CTRL_REGWEN_OFFSET = 9'h c;
  parameter logic [8:0] FLASH_CTRL_CONTROL_OFFSET = 9'h 10;
  parameter logic [8:0] FLASH_CTRL_ADDR_OFFSET = 9'h 14;
  parameter logic [8:0] FLASH_CTRL_REGION_CFG_REGWEN_0_OFFSET = 9'h 18;
  parameter logic [8:0] FLASH_CTRL_REGION_CFG_REGWEN_1_OFFSET = 9'h 1c;
  parameter logic [8:0] FLASH_CTRL_REGION_CFG_REGWEN_2_OFFSET = 9'h 20;
  parameter logic [8:0] FLASH_CTRL_REGION_CFG_REGWEN_3_OFFSET = 9'h 24;
  parameter logic [8:0] FLASH_CTRL_REGION_CFG_REGWEN_4_OFFSET = 9'h 28;
  parameter logic [8:0] FLASH_CTRL_REGION_CFG_REGWEN_5_OFFSET = 9'h 2c;
  parameter logic [8:0] FLASH_CTRL_REGION_CFG_REGWEN_6_OFFSET = 9'h 30;
  parameter logic [8:0] FLASH_CTRL_REGION_CFG_REGWEN_7_OFFSET = 9'h 34;
  parameter logic [8:0] FLASH_CTRL_MP_REGION_CFG_0_OFFSET = 9'h 38;
  parameter logic [8:0] FLASH_CTRL_MP_REGION_CFG_1_OFFSET = 9'h 3c;
  parameter logic [8:0] FLASH_CTRL_MP_REGION_CFG_2_OFFSET = 9'h 40;
  parameter logic [8:0] FLASH_CTRL_MP_REGION_CFG_3_OFFSET = 9'h 44;
  parameter logic [8:0] FLASH_CTRL_MP_REGION_CFG_4_OFFSET = 9'h 48;
  parameter logic [8:0] FLASH_CTRL_MP_REGION_CFG_5_OFFSET = 9'h 4c;
  parameter logic [8:0] FLASH_CTRL_MP_REGION_CFG_6_OFFSET = 9'h 50;
  parameter logic [8:0] FLASH_CTRL_MP_REGION_CFG_7_OFFSET = 9'h 54;
  parameter logic [8:0] FLASH_CTRL_DEFAULT_REGION_OFFSET = 9'h 58;
  parameter logic [8:0] FLASH_CTRL_BANK0_INFO0_REGWEN_0_OFFSET = 9'h 5c;
  parameter logic [8:0] FLASH_CTRL_BANK0_INFO0_REGWEN_1_OFFSET = 9'h 60;
  parameter logic [8:0] FLASH_CTRL_BANK0_INFO0_REGWEN_2_OFFSET = 9'h 64;
  parameter logic [8:0] FLASH_CTRL_BANK0_INFO0_REGWEN_3_OFFSET = 9'h 68;
  parameter logic [8:0] FLASH_CTRL_BANK0_INFO0_PAGE_CFG_0_OFFSET = 9'h 6c;
  parameter logic [8:0] FLASH_CTRL_BANK0_INFO0_PAGE_CFG_1_OFFSET = 9'h 70;
  parameter logic [8:0] FLASH_CTRL_BANK0_INFO0_PAGE_CFG_2_OFFSET = 9'h 74;
  parameter logic [8:0] FLASH_CTRL_BANK0_INFO0_PAGE_CFG_3_OFFSET = 9'h 78;
  parameter logic [8:0] FLASH_CTRL_BANK0_INFO1_REGWEN_0_OFFSET = 9'h 7c;
  parameter logic [8:0] FLASH_CTRL_BANK0_INFO1_REGWEN_1_OFFSET = 9'h 80;
  parameter logic [8:0] FLASH_CTRL_BANK0_INFO1_REGWEN_2_OFFSET = 9'h 84;
  parameter logic [8:0] FLASH_CTRL_BANK0_INFO1_REGWEN_3_OFFSET = 9'h 88;
  parameter logic [8:0] FLASH_CTRL_BANK0_INFO1_PAGE_CFG_0_OFFSET = 9'h 8c;
  parameter logic [8:0] FLASH_CTRL_BANK0_INFO1_PAGE_CFG_1_OFFSET = 9'h 90;
  parameter logic [8:0] FLASH_CTRL_BANK0_INFO1_PAGE_CFG_2_OFFSET = 9'h 94;
  parameter logic [8:0] FLASH_CTRL_BANK0_INFO1_PAGE_CFG_3_OFFSET = 9'h 98;
  parameter logic [8:0] FLASH_CTRL_BANK1_INFO0_REGWEN_0_OFFSET = 9'h 9c;
  parameter logic [8:0] FLASH_CTRL_BANK1_INFO0_REGWEN_1_OFFSET = 9'h a0;
  parameter logic [8:0] FLASH_CTRL_BANK1_INFO0_REGWEN_2_OFFSET = 9'h a4;
  parameter logic [8:0] FLASH_CTRL_BANK1_INFO0_REGWEN_3_OFFSET = 9'h a8;
  parameter logic [8:0] FLASH_CTRL_BANK1_INFO0_PAGE_CFG_0_OFFSET = 9'h ac;
  parameter logic [8:0] FLASH_CTRL_BANK1_INFO0_PAGE_CFG_1_OFFSET = 9'h b0;
  parameter logic [8:0] FLASH_CTRL_BANK1_INFO0_PAGE_CFG_2_OFFSET = 9'h b4;
  parameter logic [8:0] FLASH_CTRL_BANK1_INFO0_PAGE_CFG_3_OFFSET = 9'h b8;
  parameter logic [8:0] FLASH_CTRL_BANK1_INFO1_REGWEN_0_OFFSET = 9'h bc;
  parameter logic [8:0] FLASH_CTRL_BANK1_INFO1_REGWEN_1_OFFSET = 9'h c0;
  parameter logic [8:0] FLASH_CTRL_BANK1_INFO1_REGWEN_2_OFFSET = 9'h c4;
  parameter logic [8:0] FLASH_CTRL_BANK1_INFO1_REGWEN_3_OFFSET = 9'h c8;
  parameter logic [8:0] FLASH_CTRL_BANK1_INFO1_PAGE_CFG_0_OFFSET = 9'h cc;
  parameter logic [8:0] FLASH_CTRL_BANK1_INFO1_PAGE_CFG_1_OFFSET = 9'h d0;
  parameter logic [8:0] FLASH_CTRL_BANK1_INFO1_PAGE_CFG_2_OFFSET = 9'h d4;
  parameter logic [8:0] FLASH_CTRL_BANK1_INFO1_PAGE_CFG_3_OFFSET = 9'h d8;
  parameter logic [8:0] FLASH_CTRL_BANK_CFG_REGWEN_OFFSET = 9'h dc;
  parameter logic [8:0] FLASH_CTRL_MP_BANK_CFG_OFFSET = 9'h e0;
  parameter logic [8:0] FLASH_CTRL_OP_STATUS_OFFSET = 9'h e4;
  parameter logic [8:0] FLASH_CTRL_STATUS_OFFSET = 9'h e8;
  parameter logic [8:0] FLASH_CTRL_PHY_STATUS_OFFSET = 9'h ec;
  parameter logic [8:0] FLASH_CTRL_SCRATCH_OFFSET = 9'h f0;
  parameter logic [8:0] FLASH_CTRL_FIFO_LVL_OFFSET = 9'h f4;
  parameter logic [8:0] FLASH_CTRL_FIFO_RST_OFFSET = 9'h f8;

  // Window parameter
  parameter logic [8:0] FLASH_CTRL_PROG_FIFO_OFFSET = 9'h fc;
  parameter logic [8:0] FLASH_CTRL_PROG_FIFO_SIZE   = 9'h 4;
  parameter logic [8:0] FLASH_CTRL_RD_FIFO_OFFSET = 9'h 100;
  parameter logic [8:0] FLASH_CTRL_RD_FIFO_SIZE   = 9'h 4;

  // Register Index
  typedef enum int {
    FLASH_CTRL_INTR_STATE,
    FLASH_CTRL_INTR_ENABLE,
    FLASH_CTRL_INTR_TEST,
    FLASH_CTRL_CTRL_REGWEN,
    FLASH_CTRL_CONTROL,
    FLASH_CTRL_ADDR,
    FLASH_CTRL_REGION_CFG_REGWEN_0,
    FLASH_CTRL_REGION_CFG_REGWEN_1,
    FLASH_CTRL_REGION_CFG_REGWEN_2,
    FLASH_CTRL_REGION_CFG_REGWEN_3,
    FLASH_CTRL_REGION_CFG_REGWEN_4,
    FLASH_CTRL_REGION_CFG_REGWEN_5,
    FLASH_CTRL_REGION_CFG_REGWEN_6,
    FLASH_CTRL_REGION_CFG_REGWEN_7,
    FLASH_CTRL_MP_REGION_CFG_0,
    FLASH_CTRL_MP_REGION_CFG_1,
    FLASH_CTRL_MP_REGION_CFG_2,
    FLASH_CTRL_MP_REGION_CFG_3,
    FLASH_CTRL_MP_REGION_CFG_4,
    FLASH_CTRL_MP_REGION_CFG_5,
    FLASH_CTRL_MP_REGION_CFG_6,
    FLASH_CTRL_MP_REGION_CFG_7,
    FLASH_CTRL_DEFAULT_REGION,
    FLASH_CTRL_BANK0_INFO0_REGWEN_0,
    FLASH_CTRL_BANK0_INFO0_REGWEN_1,
    FLASH_CTRL_BANK0_INFO0_REGWEN_2,
    FLASH_CTRL_BANK0_INFO0_REGWEN_3,
    FLASH_CTRL_BANK0_INFO0_PAGE_CFG_0,
    FLASH_CTRL_BANK0_INFO0_PAGE_CFG_1,
    FLASH_CTRL_BANK0_INFO0_PAGE_CFG_2,
    FLASH_CTRL_BANK0_INFO0_PAGE_CFG_3,
    FLASH_CTRL_BANK0_INFO1_REGWEN_0,
    FLASH_CTRL_BANK0_INFO1_REGWEN_1,
    FLASH_CTRL_BANK0_INFO1_REGWEN_2,
    FLASH_CTRL_BANK0_INFO1_REGWEN_3,
    FLASH_CTRL_BANK0_INFO1_PAGE_CFG_0,
    FLASH_CTRL_BANK0_INFO1_PAGE_CFG_1,
    FLASH_CTRL_BANK0_INFO1_PAGE_CFG_2,
    FLASH_CTRL_BANK0_INFO1_PAGE_CFG_3,
    FLASH_CTRL_BANK1_INFO0_REGWEN_0,
    FLASH_CTRL_BANK1_INFO0_REGWEN_1,
    FLASH_CTRL_BANK1_INFO0_REGWEN_2,
    FLASH_CTRL_BANK1_INFO0_REGWEN_3,
    FLASH_CTRL_BANK1_INFO0_PAGE_CFG_0,
    FLASH_CTRL_BANK1_INFO0_PAGE_CFG_1,
    FLASH_CTRL_BANK1_INFO0_PAGE_CFG_2,
    FLASH_CTRL_BANK1_INFO0_PAGE_CFG_3,
    FLASH_CTRL_BANK1_INFO1_REGWEN_0,
    FLASH_CTRL_BANK1_INFO1_REGWEN_1,
    FLASH_CTRL_BANK1_INFO1_REGWEN_2,
    FLASH_CTRL_BANK1_INFO1_REGWEN_3,
    FLASH_CTRL_BANK1_INFO1_PAGE_CFG_0,
    FLASH_CTRL_BANK1_INFO1_PAGE_CFG_1,
    FLASH_CTRL_BANK1_INFO1_PAGE_CFG_2,
    FLASH_CTRL_BANK1_INFO1_PAGE_CFG_3,
    FLASH_CTRL_BANK_CFG_REGWEN,
    FLASH_CTRL_MP_BANK_CFG,
    FLASH_CTRL_OP_STATUS,
    FLASH_CTRL_STATUS,
    FLASH_CTRL_PHY_STATUS,
    FLASH_CTRL_SCRATCH,
    FLASH_CTRL_FIFO_LVL,
    FLASH_CTRL_FIFO_RST
  } flash_ctrl_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] FLASH_CTRL_PERMIT [63] = '{
    4'b 0001, // index[ 0] FLASH_CTRL_INTR_STATE
    4'b 0001, // index[ 1] FLASH_CTRL_INTR_ENABLE
    4'b 0001, // index[ 2] FLASH_CTRL_INTR_TEST
    4'b 0001, // index[ 3] FLASH_CTRL_CTRL_REGWEN
    4'b 1111, // index[ 4] FLASH_CTRL_CONTROL
    4'b 1111, // index[ 5] FLASH_CTRL_ADDR
    4'b 0001, // index[ 6] FLASH_CTRL_REGION_CFG_REGWEN_0
    4'b 0001, // index[ 7] FLASH_CTRL_REGION_CFG_REGWEN_1
    4'b 0001, // index[ 8] FLASH_CTRL_REGION_CFG_REGWEN_2
    4'b 0001, // index[ 9] FLASH_CTRL_REGION_CFG_REGWEN_3
    4'b 0001, // index[10] FLASH_CTRL_REGION_CFG_REGWEN_4
    4'b 0001, // index[11] FLASH_CTRL_REGION_CFG_REGWEN_5
    4'b 0001, // index[12] FLASH_CTRL_REGION_CFG_REGWEN_6
    4'b 0001, // index[13] FLASH_CTRL_REGION_CFG_REGWEN_7
    4'b 1111, // index[14] FLASH_CTRL_MP_REGION_CFG_0
    4'b 1111, // index[15] FLASH_CTRL_MP_REGION_CFG_1
    4'b 1111, // index[16] FLASH_CTRL_MP_REGION_CFG_2
    4'b 1111, // index[17] FLASH_CTRL_MP_REGION_CFG_3
    4'b 1111, // index[18] FLASH_CTRL_MP_REGION_CFG_4
    4'b 1111, // index[19] FLASH_CTRL_MP_REGION_CFG_5
    4'b 1111, // index[20] FLASH_CTRL_MP_REGION_CFG_6
    4'b 1111, // index[21] FLASH_CTRL_MP_REGION_CFG_7
    4'b 0001, // index[22] FLASH_CTRL_DEFAULT_REGION
    4'b 0001, // index[23] FLASH_CTRL_BANK0_INFO0_REGWEN_0
    4'b 0001, // index[24] FLASH_CTRL_BANK0_INFO0_REGWEN_1
    4'b 0001, // index[25] FLASH_CTRL_BANK0_INFO0_REGWEN_2
    4'b 0001, // index[26] FLASH_CTRL_BANK0_INFO0_REGWEN_3
    4'b 0001, // index[27] FLASH_CTRL_BANK0_INFO0_PAGE_CFG_0
    4'b 0001, // index[28] FLASH_CTRL_BANK0_INFO0_PAGE_CFG_1
    4'b 0001, // index[29] FLASH_CTRL_BANK0_INFO0_PAGE_CFG_2
    4'b 0001, // index[30] FLASH_CTRL_BANK0_INFO0_PAGE_CFG_3
    4'b 0001, // index[31] FLASH_CTRL_BANK0_INFO1_REGWEN_0
    4'b 0001, // index[32] FLASH_CTRL_BANK0_INFO1_REGWEN_1
    4'b 0001, // index[33] FLASH_CTRL_BANK0_INFO1_REGWEN_2
    4'b 0001, // index[34] FLASH_CTRL_BANK0_INFO1_REGWEN_3
    4'b 0001, // index[35] FLASH_CTRL_BANK0_INFO1_PAGE_CFG_0
    4'b 0001, // index[36] FLASH_CTRL_BANK0_INFO1_PAGE_CFG_1
    4'b 0001, // index[37] FLASH_CTRL_BANK0_INFO1_PAGE_CFG_2
    4'b 0001, // index[38] FLASH_CTRL_BANK0_INFO1_PAGE_CFG_3
    4'b 0001, // index[39] FLASH_CTRL_BANK1_INFO0_REGWEN_0
    4'b 0001, // index[40] FLASH_CTRL_BANK1_INFO0_REGWEN_1
    4'b 0001, // index[41] FLASH_CTRL_BANK1_INFO0_REGWEN_2
    4'b 0001, // index[42] FLASH_CTRL_BANK1_INFO0_REGWEN_3
    4'b 0001, // index[43] FLASH_CTRL_BANK1_INFO0_PAGE_CFG_0
    4'b 0001, // index[44] FLASH_CTRL_BANK1_INFO0_PAGE_CFG_1
    4'b 0001, // index[45] FLASH_CTRL_BANK1_INFO0_PAGE_CFG_2
    4'b 0001, // index[46] FLASH_CTRL_BANK1_INFO0_PAGE_CFG_3
    4'b 0001, // index[47] FLASH_CTRL_BANK1_INFO1_REGWEN_0
    4'b 0001, // index[48] FLASH_CTRL_BANK1_INFO1_REGWEN_1
    4'b 0001, // index[49] FLASH_CTRL_BANK1_INFO1_REGWEN_2
    4'b 0001, // index[50] FLASH_CTRL_BANK1_INFO1_REGWEN_3
    4'b 0001, // index[51] FLASH_CTRL_BANK1_INFO1_PAGE_CFG_0
    4'b 0001, // index[52] FLASH_CTRL_BANK1_INFO1_PAGE_CFG_1
    4'b 0001, // index[53] FLASH_CTRL_BANK1_INFO1_PAGE_CFG_2
    4'b 0001, // index[54] FLASH_CTRL_BANK1_INFO1_PAGE_CFG_3
    4'b 0001, // index[55] FLASH_CTRL_BANK_CFG_REGWEN
    4'b 0001, // index[56] FLASH_CTRL_MP_BANK_CFG
    4'b 0001, // index[57] FLASH_CTRL_OP_STATUS
    4'b 0111, // index[58] FLASH_CTRL_STATUS
    4'b 0001, // index[59] FLASH_CTRL_PHY_STATUS
    4'b 1111, // index[60] FLASH_CTRL_SCRATCH
    4'b 0011, // index[61] FLASH_CTRL_FIFO_LVL
    4'b 0001  // index[62] FLASH_CTRL_FIFO_RST
  };
endpackage

