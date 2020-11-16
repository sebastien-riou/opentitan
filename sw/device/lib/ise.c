// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/device/lib/ise.h"

#include "ise_regs.h"  // Generated.
#include "hw/top_earlgrey/sw/autogen/top_earlgrey.h"

#define ISE0_BASE_ADDR TOP_EARLGREY_ISE_BASE_ADDR


#define REG32(add) *((volatile uint32_t *)(add))

uint32_t ise_get(void) {
  return REG32(ISE0_BASE_ADDR+ISE_DATA0_REG_OFFSET);
}

void ise_put(uint32_t val) {
  REG32(ISE0_BASE_ADDR+ISE_DATA0_REG_OFFSET) = val;
}

uint32_t ise_status(void) {
  return REG32(ISE0_BASE_ADDR+ISE_STATUS_REG_OFFSET);
}
