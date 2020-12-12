// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

/**
 * Boot ROM runtime initialization code.
 */

  // NOTE: The "ax" flag below is necessary to ensure that this section
  // is allocated executable space in ROM by the linker.
  .section .crt, "ax"

/**
 * Entry point after reset. This symbol is jumped to from the handler
 * for IRQ 0x80.
 *
 * Sets up the stack, then jumps to `_start`.
 */
_reset_start:
  .globl _reset_start
  call _ram_start

  // Loop forever if _boot_start somehow returns.
1:
  wfi
  j 1b
