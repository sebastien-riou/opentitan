/* Copyright lowRISC contributors.
   Licensed under the Apache License, Version 2.0, see LICENSE for details.
   SPDX-License-Identifier: Apache-2.0 */

OUTPUT_ARCH(riscv)

MEMORY
{
    ram         : ORIGIN = 0x10000000, LENGTH = 0x1000
    stack       : ORIGIN = 0x10001000, LENGTH = 0x1000
}

INCLUDE "link_common.ld"
