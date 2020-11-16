// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package rv_plic_reg_pkg;

  // Param list
  parameter int NumSrc = 82;
  parameter int NumTarget = 1;
  parameter int PrioWidth = 2;

  ////////////////////////////
  // Typedefs for registers //
  ////////////////////////////
  typedef struct packed {
    logic        q;
  } rv_plic_reg2hw_le_mreg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio0_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio1_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio2_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio3_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio4_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio5_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio6_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio7_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio8_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio9_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio10_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio11_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio12_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio13_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio14_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio15_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio16_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio17_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio18_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio19_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio20_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio21_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio22_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio23_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio24_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio25_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio26_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio27_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio28_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio29_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio30_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio31_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio32_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio33_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio34_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio35_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio36_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio37_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio38_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio39_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio40_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio41_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio42_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio43_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio44_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio45_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio46_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio47_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio48_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio49_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio50_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio51_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio52_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio53_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio54_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio55_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio56_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio57_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio58_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio59_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio60_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio61_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio62_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio63_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio64_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio65_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio66_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio67_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio68_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio69_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio70_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio71_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio72_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio73_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio74_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio75_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio76_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio77_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio78_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio79_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio80_reg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_prio81_reg_t;

  typedef struct packed {
    logic        q;
  } rv_plic_reg2hw_ie0_mreg_t;

  typedef struct packed {
    logic [1:0]  q;
  } rv_plic_reg2hw_threshold0_reg_t;

  typedef struct packed {
    logic [6:0]  q;
    logic        qe;
    logic        re;
  } rv_plic_reg2hw_cc0_reg_t;

  typedef struct packed {
    logic        q;
  } rv_plic_reg2hw_msip0_reg_t;


  typedef struct packed {
    logic        d;
    logic        de;
  } rv_plic_hw2reg_ip_mreg_t;

  typedef struct packed {
    logic [6:0]  d;
  } rv_plic_hw2reg_cc0_reg_t;


  ///////////////////////////////////////
  // Register to internal design logic //
  ///////////////////////////////////////
  typedef struct packed {
    rv_plic_reg2hw_le_mreg_t [81:0] le; // [339:258]
    rv_plic_reg2hw_prio0_reg_t prio0; // [257:256]
    rv_plic_reg2hw_prio1_reg_t prio1; // [255:254]
    rv_plic_reg2hw_prio2_reg_t prio2; // [253:252]
    rv_plic_reg2hw_prio3_reg_t prio3; // [251:250]
    rv_plic_reg2hw_prio4_reg_t prio4; // [249:248]
    rv_plic_reg2hw_prio5_reg_t prio5; // [247:246]
    rv_plic_reg2hw_prio6_reg_t prio6; // [245:244]
    rv_plic_reg2hw_prio7_reg_t prio7; // [243:242]
    rv_plic_reg2hw_prio8_reg_t prio8; // [241:240]
    rv_plic_reg2hw_prio9_reg_t prio9; // [239:238]
    rv_plic_reg2hw_prio10_reg_t prio10; // [237:236]
    rv_plic_reg2hw_prio11_reg_t prio11; // [235:234]
    rv_plic_reg2hw_prio12_reg_t prio12; // [233:232]
    rv_plic_reg2hw_prio13_reg_t prio13; // [231:230]
    rv_plic_reg2hw_prio14_reg_t prio14; // [229:228]
    rv_plic_reg2hw_prio15_reg_t prio15; // [227:226]
    rv_plic_reg2hw_prio16_reg_t prio16; // [225:224]
    rv_plic_reg2hw_prio17_reg_t prio17; // [223:222]
    rv_plic_reg2hw_prio18_reg_t prio18; // [221:220]
    rv_plic_reg2hw_prio19_reg_t prio19; // [219:218]
    rv_plic_reg2hw_prio20_reg_t prio20; // [217:216]
    rv_plic_reg2hw_prio21_reg_t prio21; // [215:214]
    rv_plic_reg2hw_prio22_reg_t prio22; // [213:212]
    rv_plic_reg2hw_prio23_reg_t prio23; // [211:210]
    rv_plic_reg2hw_prio24_reg_t prio24; // [209:208]
    rv_plic_reg2hw_prio25_reg_t prio25; // [207:206]
    rv_plic_reg2hw_prio26_reg_t prio26; // [205:204]
    rv_plic_reg2hw_prio27_reg_t prio27; // [203:202]
    rv_plic_reg2hw_prio28_reg_t prio28; // [201:200]
    rv_plic_reg2hw_prio29_reg_t prio29; // [199:198]
    rv_plic_reg2hw_prio30_reg_t prio30; // [197:196]
    rv_plic_reg2hw_prio31_reg_t prio31; // [195:194]
    rv_plic_reg2hw_prio32_reg_t prio32; // [193:192]
    rv_plic_reg2hw_prio33_reg_t prio33; // [191:190]
    rv_plic_reg2hw_prio34_reg_t prio34; // [189:188]
    rv_plic_reg2hw_prio35_reg_t prio35; // [187:186]
    rv_plic_reg2hw_prio36_reg_t prio36; // [185:184]
    rv_plic_reg2hw_prio37_reg_t prio37; // [183:182]
    rv_plic_reg2hw_prio38_reg_t prio38; // [181:180]
    rv_plic_reg2hw_prio39_reg_t prio39; // [179:178]
    rv_plic_reg2hw_prio40_reg_t prio40; // [177:176]
    rv_plic_reg2hw_prio41_reg_t prio41; // [175:174]
    rv_plic_reg2hw_prio42_reg_t prio42; // [173:172]
    rv_plic_reg2hw_prio43_reg_t prio43; // [171:170]
    rv_plic_reg2hw_prio44_reg_t prio44; // [169:168]
    rv_plic_reg2hw_prio45_reg_t prio45; // [167:166]
    rv_plic_reg2hw_prio46_reg_t prio46; // [165:164]
    rv_plic_reg2hw_prio47_reg_t prio47; // [163:162]
    rv_plic_reg2hw_prio48_reg_t prio48; // [161:160]
    rv_plic_reg2hw_prio49_reg_t prio49; // [159:158]
    rv_plic_reg2hw_prio50_reg_t prio50; // [157:156]
    rv_plic_reg2hw_prio51_reg_t prio51; // [155:154]
    rv_plic_reg2hw_prio52_reg_t prio52; // [153:152]
    rv_plic_reg2hw_prio53_reg_t prio53; // [151:150]
    rv_plic_reg2hw_prio54_reg_t prio54; // [149:148]
    rv_plic_reg2hw_prio55_reg_t prio55; // [147:146]
    rv_plic_reg2hw_prio56_reg_t prio56; // [145:144]
    rv_plic_reg2hw_prio57_reg_t prio57; // [143:142]
    rv_plic_reg2hw_prio58_reg_t prio58; // [141:140]
    rv_plic_reg2hw_prio59_reg_t prio59; // [139:138]
    rv_plic_reg2hw_prio60_reg_t prio60; // [137:136]
    rv_plic_reg2hw_prio61_reg_t prio61; // [135:134]
    rv_plic_reg2hw_prio62_reg_t prio62; // [133:132]
    rv_plic_reg2hw_prio63_reg_t prio63; // [131:130]
    rv_plic_reg2hw_prio64_reg_t prio64; // [129:128]
    rv_plic_reg2hw_prio65_reg_t prio65; // [127:126]
    rv_plic_reg2hw_prio66_reg_t prio66; // [125:124]
    rv_plic_reg2hw_prio67_reg_t prio67; // [123:122]
    rv_plic_reg2hw_prio68_reg_t prio68; // [121:120]
    rv_plic_reg2hw_prio69_reg_t prio69; // [119:118]
    rv_plic_reg2hw_prio70_reg_t prio70; // [117:116]
    rv_plic_reg2hw_prio71_reg_t prio71; // [115:114]
    rv_plic_reg2hw_prio72_reg_t prio72; // [113:112]
    rv_plic_reg2hw_prio73_reg_t prio73; // [111:110]
    rv_plic_reg2hw_prio74_reg_t prio74; // [109:108]
    rv_plic_reg2hw_prio75_reg_t prio75; // [107:106]
    rv_plic_reg2hw_prio76_reg_t prio76; // [105:104]
    rv_plic_reg2hw_prio77_reg_t prio77; // [103:102]
    rv_plic_reg2hw_prio78_reg_t prio78; // [101:100]
    rv_plic_reg2hw_prio79_reg_t prio79; // [99:98]
    rv_plic_reg2hw_prio80_reg_t prio80; // [97:96]
    rv_plic_reg2hw_prio81_reg_t prio81; // [95:94]
    rv_plic_reg2hw_ie0_mreg_t [81:0] ie0; // [93:12]
    rv_plic_reg2hw_threshold0_reg_t threshold0; // [11:10]
    rv_plic_reg2hw_cc0_reg_t cc0; // [9:1]
    rv_plic_reg2hw_msip0_reg_t msip0; // [0:0]
  } rv_plic_reg2hw_t;

  ///////////////////////////////////////
  // Internal design logic to register //
  ///////////////////////////////////////
  typedef struct packed {
    rv_plic_hw2reg_ip_mreg_t [81:0] ip; // [170:7]
    rv_plic_hw2reg_cc0_reg_t cc0; // [6:-2]
  } rv_plic_hw2reg_t;

  // Register Address
  parameter logic [9:0] RV_PLIC_IP_0_OFFSET = 10'h 0;
  parameter logic [9:0] RV_PLIC_IP_1_OFFSET = 10'h 4;
  parameter logic [9:0] RV_PLIC_IP_2_OFFSET = 10'h 8;
  parameter logic [9:0] RV_PLIC_LE_0_OFFSET = 10'h c;
  parameter logic [9:0] RV_PLIC_LE_1_OFFSET = 10'h 10;
  parameter logic [9:0] RV_PLIC_LE_2_OFFSET = 10'h 14;
  parameter logic [9:0] RV_PLIC_PRIO0_OFFSET = 10'h 18;
  parameter logic [9:0] RV_PLIC_PRIO1_OFFSET = 10'h 1c;
  parameter logic [9:0] RV_PLIC_PRIO2_OFFSET = 10'h 20;
  parameter logic [9:0] RV_PLIC_PRIO3_OFFSET = 10'h 24;
  parameter logic [9:0] RV_PLIC_PRIO4_OFFSET = 10'h 28;
  parameter logic [9:0] RV_PLIC_PRIO5_OFFSET = 10'h 2c;
  parameter logic [9:0] RV_PLIC_PRIO6_OFFSET = 10'h 30;
  parameter logic [9:0] RV_PLIC_PRIO7_OFFSET = 10'h 34;
  parameter logic [9:0] RV_PLIC_PRIO8_OFFSET = 10'h 38;
  parameter logic [9:0] RV_PLIC_PRIO9_OFFSET = 10'h 3c;
  parameter logic [9:0] RV_PLIC_PRIO10_OFFSET = 10'h 40;
  parameter logic [9:0] RV_PLIC_PRIO11_OFFSET = 10'h 44;
  parameter logic [9:0] RV_PLIC_PRIO12_OFFSET = 10'h 48;
  parameter logic [9:0] RV_PLIC_PRIO13_OFFSET = 10'h 4c;
  parameter logic [9:0] RV_PLIC_PRIO14_OFFSET = 10'h 50;
  parameter logic [9:0] RV_PLIC_PRIO15_OFFSET = 10'h 54;
  parameter logic [9:0] RV_PLIC_PRIO16_OFFSET = 10'h 58;
  parameter logic [9:0] RV_PLIC_PRIO17_OFFSET = 10'h 5c;
  parameter logic [9:0] RV_PLIC_PRIO18_OFFSET = 10'h 60;
  parameter logic [9:0] RV_PLIC_PRIO19_OFFSET = 10'h 64;
  parameter logic [9:0] RV_PLIC_PRIO20_OFFSET = 10'h 68;
  parameter logic [9:0] RV_PLIC_PRIO21_OFFSET = 10'h 6c;
  parameter logic [9:0] RV_PLIC_PRIO22_OFFSET = 10'h 70;
  parameter logic [9:0] RV_PLIC_PRIO23_OFFSET = 10'h 74;
  parameter logic [9:0] RV_PLIC_PRIO24_OFFSET = 10'h 78;
  parameter logic [9:0] RV_PLIC_PRIO25_OFFSET = 10'h 7c;
  parameter logic [9:0] RV_PLIC_PRIO26_OFFSET = 10'h 80;
  parameter logic [9:0] RV_PLIC_PRIO27_OFFSET = 10'h 84;
  parameter logic [9:0] RV_PLIC_PRIO28_OFFSET = 10'h 88;
  parameter logic [9:0] RV_PLIC_PRIO29_OFFSET = 10'h 8c;
  parameter logic [9:0] RV_PLIC_PRIO30_OFFSET = 10'h 90;
  parameter logic [9:0] RV_PLIC_PRIO31_OFFSET = 10'h 94;
  parameter logic [9:0] RV_PLIC_PRIO32_OFFSET = 10'h 98;
  parameter logic [9:0] RV_PLIC_PRIO33_OFFSET = 10'h 9c;
  parameter logic [9:0] RV_PLIC_PRIO34_OFFSET = 10'h a0;
  parameter logic [9:0] RV_PLIC_PRIO35_OFFSET = 10'h a4;
  parameter logic [9:0] RV_PLIC_PRIO36_OFFSET = 10'h a8;
  parameter logic [9:0] RV_PLIC_PRIO37_OFFSET = 10'h ac;
  parameter logic [9:0] RV_PLIC_PRIO38_OFFSET = 10'h b0;
  parameter logic [9:0] RV_PLIC_PRIO39_OFFSET = 10'h b4;
  parameter logic [9:0] RV_PLIC_PRIO40_OFFSET = 10'h b8;
  parameter logic [9:0] RV_PLIC_PRIO41_OFFSET = 10'h bc;
  parameter logic [9:0] RV_PLIC_PRIO42_OFFSET = 10'h c0;
  parameter logic [9:0] RV_PLIC_PRIO43_OFFSET = 10'h c4;
  parameter logic [9:0] RV_PLIC_PRIO44_OFFSET = 10'h c8;
  parameter logic [9:0] RV_PLIC_PRIO45_OFFSET = 10'h cc;
  parameter logic [9:0] RV_PLIC_PRIO46_OFFSET = 10'h d0;
  parameter logic [9:0] RV_PLIC_PRIO47_OFFSET = 10'h d4;
  parameter logic [9:0] RV_PLIC_PRIO48_OFFSET = 10'h d8;
  parameter logic [9:0] RV_PLIC_PRIO49_OFFSET = 10'h dc;
  parameter logic [9:0] RV_PLIC_PRIO50_OFFSET = 10'h e0;
  parameter logic [9:0] RV_PLIC_PRIO51_OFFSET = 10'h e4;
  parameter logic [9:0] RV_PLIC_PRIO52_OFFSET = 10'h e8;
  parameter logic [9:0] RV_PLIC_PRIO53_OFFSET = 10'h ec;
  parameter logic [9:0] RV_PLIC_PRIO54_OFFSET = 10'h f0;
  parameter logic [9:0] RV_PLIC_PRIO55_OFFSET = 10'h f4;
  parameter logic [9:0] RV_PLIC_PRIO56_OFFSET = 10'h f8;
  parameter logic [9:0] RV_PLIC_PRIO57_OFFSET = 10'h fc;
  parameter logic [9:0] RV_PLIC_PRIO58_OFFSET = 10'h 100;
  parameter logic [9:0] RV_PLIC_PRIO59_OFFSET = 10'h 104;
  parameter logic [9:0] RV_PLIC_PRIO60_OFFSET = 10'h 108;
  parameter logic [9:0] RV_PLIC_PRIO61_OFFSET = 10'h 10c;
  parameter logic [9:0] RV_PLIC_PRIO62_OFFSET = 10'h 110;
  parameter logic [9:0] RV_PLIC_PRIO63_OFFSET = 10'h 114;
  parameter logic [9:0] RV_PLIC_PRIO64_OFFSET = 10'h 118;
  parameter logic [9:0] RV_PLIC_PRIO65_OFFSET = 10'h 11c;
  parameter logic [9:0] RV_PLIC_PRIO66_OFFSET = 10'h 120;
  parameter logic [9:0] RV_PLIC_PRIO67_OFFSET = 10'h 124;
  parameter logic [9:0] RV_PLIC_PRIO68_OFFSET = 10'h 128;
  parameter logic [9:0] RV_PLIC_PRIO69_OFFSET = 10'h 12c;
  parameter logic [9:0] RV_PLIC_PRIO70_OFFSET = 10'h 130;
  parameter logic [9:0] RV_PLIC_PRIO71_OFFSET = 10'h 134;
  parameter logic [9:0] RV_PLIC_PRIO72_OFFSET = 10'h 138;
  parameter logic [9:0] RV_PLIC_PRIO73_OFFSET = 10'h 13c;
  parameter logic [9:0] RV_PLIC_PRIO74_OFFSET = 10'h 140;
  parameter logic [9:0] RV_PLIC_PRIO75_OFFSET = 10'h 144;
  parameter logic [9:0] RV_PLIC_PRIO76_OFFSET = 10'h 148;
  parameter logic [9:0] RV_PLIC_PRIO77_OFFSET = 10'h 14c;
  parameter logic [9:0] RV_PLIC_PRIO78_OFFSET = 10'h 150;
  parameter logic [9:0] RV_PLIC_PRIO79_OFFSET = 10'h 154;
  parameter logic [9:0] RV_PLIC_PRIO80_OFFSET = 10'h 158;
  parameter logic [9:0] RV_PLIC_PRIO81_OFFSET = 10'h 15c;
  parameter logic [9:0] RV_PLIC_IE0_0_OFFSET = 10'h 200;
  parameter logic [9:0] RV_PLIC_IE0_1_OFFSET = 10'h 204;
  parameter logic [9:0] RV_PLIC_IE0_2_OFFSET = 10'h 208;
  parameter logic [9:0] RV_PLIC_THRESHOLD0_OFFSET = 10'h 20c;
  parameter logic [9:0] RV_PLIC_CC0_OFFSET = 10'h 210;
  parameter logic [9:0] RV_PLIC_MSIP0_OFFSET = 10'h 214;


  // Register Index
  typedef enum int {
    RV_PLIC_IP_0,
    RV_PLIC_IP_1,
    RV_PLIC_IP_2,
    RV_PLIC_LE_0,
    RV_PLIC_LE_1,
    RV_PLIC_LE_2,
    RV_PLIC_PRIO0,
    RV_PLIC_PRIO1,
    RV_PLIC_PRIO2,
    RV_PLIC_PRIO3,
    RV_PLIC_PRIO4,
    RV_PLIC_PRIO5,
    RV_PLIC_PRIO6,
    RV_PLIC_PRIO7,
    RV_PLIC_PRIO8,
    RV_PLIC_PRIO9,
    RV_PLIC_PRIO10,
    RV_PLIC_PRIO11,
    RV_PLIC_PRIO12,
    RV_PLIC_PRIO13,
    RV_PLIC_PRIO14,
    RV_PLIC_PRIO15,
    RV_PLIC_PRIO16,
    RV_PLIC_PRIO17,
    RV_PLIC_PRIO18,
    RV_PLIC_PRIO19,
    RV_PLIC_PRIO20,
    RV_PLIC_PRIO21,
    RV_PLIC_PRIO22,
    RV_PLIC_PRIO23,
    RV_PLIC_PRIO24,
    RV_PLIC_PRIO25,
    RV_PLIC_PRIO26,
    RV_PLIC_PRIO27,
    RV_PLIC_PRIO28,
    RV_PLIC_PRIO29,
    RV_PLIC_PRIO30,
    RV_PLIC_PRIO31,
    RV_PLIC_PRIO32,
    RV_PLIC_PRIO33,
    RV_PLIC_PRIO34,
    RV_PLIC_PRIO35,
    RV_PLIC_PRIO36,
    RV_PLIC_PRIO37,
    RV_PLIC_PRIO38,
    RV_PLIC_PRIO39,
    RV_PLIC_PRIO40,
    RV_PLIC_PRIO41,
    RV_PLIC_PRIO42,
    RV_PLIC_PRIO43,
    RV_PLIC_PRIO44,
    RV_PLIC_PRIO45,
    RV_PLIC_PRIO46,
    RV_PLIC_PRIO47,
    RV_PLIC_PRIO48,
    RV_PLIC_PRIO49,
    RV_PLIC_PRIO50,
    RV_PLIC_PRIO51,
    RV_PLIC_PRIO52,
    RV_PLIC_PRIO53,
    RV_PLIC_PRIO54,
    RV_PLIC_PRIO55,
    RV_PLIC_PRIO56,
    RV_PLIC_PRIO57,
    RV_PLIC_PRIO58,
    RV_PLIC_PRIO59,
    RV_PLIC_PRIO60,
    RV_PLIC_PRIO61,
    RV_PLIC_PRIO62,
    RV_PLIC_PRIO63,
    RV_PLIC_PRIO64,
    RV_PLIC_PRIO65,
    RV_PLIC_PRIO66,
    RV_PLIC_PRIO67,
    RV_PLIC_PRIO68,
    RV_PLIC_PRIO69,
    RV_PLIC_PRIO70,
    RV_PLIC_PRIO71,
    RV_PLIC_PRIO72,
    RV_PLIC_PRIO73,
    RV_PLIC_PRIO74,
    RV_PLIC_PRIO75,
    RV_PLIC_PRIO76,
    RV_PLIC_PRIO77,
    RV_PLIC_PRIO78,
    RV_PLIC_PRIO79,
    RV_PLIC_PRIO80,
    RV_PLIC_PRIO81,
    RV_PLIC_IE0_0,
    RV_PLIC_IE0_1,
    RV_PLIC_IE0_2,
    RV_PLIC_THRESHOLD0,
    RV_PLIC_CC0,
    RV_PLIC_MSIP0
  } rv_plic_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] RV_PLIC_PERMIT [94] = '{
    4'b 1111, // index[ 0] RV_PLIC_IP_0
    4'b 1111, // index[ 1] RV_PLIC_IP_1
    4'b 0111, // index[ 2] RV_PLIC_IP_2
    4'b 1111, // index[ 3] RV_PLIC_LE_0
    4'b 1111, // index[ 4] RV_PLIC_LE_1
    4'b 0111, // index[ 5] RV_PLIC_LE_2
    4'b 0001, // index[ 6] RV_PLIC_PRIO0
    4'b 0001, // index[ 7] RV_PLIC_PRIO1
    4'b 0001, // index[ 8] RV_PLIC_PRIO2
    4'b 0001, // index[ 9] RV_PLIC_PRIO3
    4'b 0001, // index[10] RV_PLIC_PRIO4
    4'b 0001, // index[11] RV_PLIC_PRIO5
    4'b 0001, // index[12] RV_PLIC_PRIO6
    4'b 0001, // index[13] RV_PLIC_PRIO7
    4'b 0001, // index[14] RV_PLIC_PRIO8
    4'b 0001, // index[15] RV_PLIC_PRIO9
    4'b 0001, // index[16] RV_PLIC_PRIO10
    4'b 0001, // index[17] RV_PLIC_PRIO11
    4'b 0001, // index[18] RV_PLIC_PRIO12
    4'b 0001, // index[19] RV_PLIC_PRIO13
    4'b 0001, // index[20] RV_PLIC_PRIO14
    4'b 0001, // index[21] RV_PLIC_PRIO15
    4'b 0001, // index[22] RV_PLIC_PRIO16
    4'b 0001, // index[23] RV_PLIC_PRIO17
    4'b 0001, // index[24] RV_PLIC_PRIO18
    4'b 0001, // index[25] RV_PLIC_PRIO19
    4'b 0001, // index[26] RV_PLIC_PRIO20
    4'b 0001, // index[27] RV_PLIC_PRIO21
    4'b 0001, // index[28] RV_PLIC_PRIO22
    4'b 0001, // index[29] RV_PLIC_PRIO23
    4'b 0001, // index[30] RV_PLIC_PRIO24
    4'b 0001, // index[31] RV_PLIC_PRIO25
    4'b 0001, // index[32] RV_PLIC_PRIO26
    4'b 0001, // index[33] RV_PLIC_PRIO27
    4'b 0001, // index[34] RV_PLIC_PRIO28
    4'b 0001, // index[35] RV_PLIC_PRIO29
    4'b 0001, // index[36] RV_PLIC_PRIO30
    4'b 0001, // index[37] RV_PLIC_PRIO31
    4'b 0001, // index[38] RV_PLIC_PRIO32
    4'b 0001, // index[39] RV_PLIC_PRIO33
    4'b 0001, // index[40] RV_PLIC_PRIO34
    4'b 0001, // index[41] RV_PLIC_PRIO35
    4'b 0001, // index[42] RV_PLIC_PRIO36
    4'b 0001, // index[43] RV_PLIC_PRIO37
    4'b 0001, // index[44] RV_PLIC_PRIO38
    4'b 0001, // index[45] RV_PLIC_PRIO39
    4'b 0001, // index[46] RV_PLIC_PRIO40
    4'b 0001, // index[47] RV_PLIC_PRIO41
    4'b 0001, // index[48] RV_PLIC_PRIO42
    4'b 0001, // index[49] RV_PLIC_PRIO43
    4'b 0001, // index[50] RV_PLIC_PRIO44
    4'b 0001, // index[51] RV_PLIC_PRIO45
    4'b 0001, // index[52] RV_PLIC_PRIO46
    4'b 0001, // index[53] RV_PLIC_PRIO47
    4'b 0001, // index[54] RV_PLIC_PRIO48
    4'b 0001, // index[55] RV_PLIC_PRIO49
    4'b 0001, // index[56] RV_PLIC_PRIO50
    4'b 0001, // index[57] RV_PLIC_PRIO51
    4'b 0001, // index[58] RV_PLIC_PRIO52
    4'b 0001, // index[59] RV_PLIC_PRIO53
    4'b 0001, // index[60] RV_PLIC_PRIO54
    4'b 0001, // index[61] RV_PLIC_PRIO55
    4'b 0001, // index[62] RV_PLIC_PRIO56
    4'b 0001, // index[63] RV_PLIC_PRIO57
    4'b 0001, // index[64] RV_PLIC_PRIO58
    4'b 0001, // index[65] RV_PLIC_PRIO59
    4'b 0001, // index[66] RV_PLIC_PRIO60
    4'b 0001, // index[67] RV_PLIC_PRIO61
    4'b 0001, // index[68] RV_PLIC_PRIO62
    4'b 0001, // index[69] RV_PLIC_PRIO63
    4'b 0001, // index[70] RV_PLIC_PRIO64
    4'b 0001, // index[71] RV_PLIC_PRIO65
    4'b 0001, // index[72] RV_PLIC_PRIO66
    4'b 0001, // index[73] RV_PLIC_PRIO67
    4'b 0001, // index[74] RV_PLIC_PRIO68
    4'b 0001, // index[75] RV_PLIC_PRIO69
    4'b 0001, // index[76] RV_PLIC_PRIO70
    4'b 0001, // index[77] RV_PLIC_PRIO71
    4'b 0001, // index[78] RV_PLIC_PRIO72
    4'b 0001, // index[79] RV_PLIC_PRIO73
    4'b 0001, // index[80] RV_PLIC_PRIO74
    4'b 0001, // index[81] RV_PLIC_PRIO75
    4'b 0001, // index[82] RV_PLIC_PRIO76
    4'b 0001, // index[83] RV_PLIC_PRIO77
    4'b 0001, // index[84] RV_PLIC_PRIO78
    4'b 0001, // index[85] RV_PLIC_PRIO79
    4'b 0001, // index[86] RV_PLIC_PRIO80
    4'b 0001, // index[87] RV_PLIC_PRIO81
    4'b 1111, // index[88] RV_PLIC_IE0_0
    4'b 1111, // index[89] RV_PLIC_IE0_1
    4'b 0111, // index[90] RV_PLIC_IE0_2
    4'b 0001, // index[91] RV_PLIC_THRESHOLD0
    4'b 0001, // index[92] RV_PLIC_CC0
    4'b 0001  // index[93] RV_PLIC_MSIP0
  };
endpackage

