// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#ifndef OPENTITAN_HW_TOP_ISE_SW_AUTOGEN_TOP_ISE_MEMORY_H_
#define OPENTITAN_HW_TOP_ISE_SW_AUTOGEN_TOP_ISE_MEMORY_H_

/**
 * @file
 * @brief Assembler-only Top-Specific Definitions.
 *
 * This file contains preprocessor definitions for use within assembly code.
 *
 * These are not shared with C/C++ code because these are only allowed to be
 * preprocessor definitions, no data or type declarations are allowed. The
 * assembler is also stricter about literals (not allowing suffixes for
 * signed/unsigned which are sensible to use for unsigned values in C/C++).
 */

// Include guard for assembler
#ifdef __ASSEMBLER__

/**
 * Memory base address for rom in top ise.
 */
#define TOP_ISE_ROM_BASE_ADDR 0x00008000

/**
 * Memory size for rom in top ise.
 */
#define TOP_ISE_ROM_SIZE_BYTES 0x4000

/**
 * Memory base address for ram_main in top ise.
 */
#define TOP_ISE_RAM_MAIN_BASE_ADDR 0x10000000

/**
 * Memory size for ram_main in top ise.
 */
#define TOP_ISE_RAM_MAIN_SIZE_BYTES 0x10000

/**
 * Memory base address for ram_ret in top ise.
 */
#define TOP_ISE_RAM_RET_BASE_ADDR 0x18000000

/**
 * Memory size for ram_ret in top ise.
 */
#define TOP_ISE_RAM_RET_SIZE_BYTES 0x1000

/**
 * Memory base address for eflash in top ise.
 */
#define TOP_ISE_EFLASH_BASE_ADDR 0x20000000

/**
 * Memory size for eflash in top ise.
 */
#define TOP_ISE_EFLASH_SIZE_BYTES 0x10000


#endif  // __ASSEMBLER__

#endif  // OPENTITAN_HW_TOP_ISE_SW_AUTOGEN_TOP_ISE_MEMORY_H_
