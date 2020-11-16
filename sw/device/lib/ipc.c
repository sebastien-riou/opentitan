// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/device/lib/ipc.h"

#include "ipc_regs.h"  // Generated.
#include "hw/top_earlgrey/sw/autogen/top_earlgrey.h"

#define IPC0_BASE_ADDR TOP_EARLGREY_IPC_BASE_ADDR


#define REG32(add) *((volatile uint32_t *)(add))

uint32_t ipc_get(void) {
  return REG32(IPC0_BASE_ADDR+IPC_DATA0_REG_OFFSET);
}

void ipc_put(uint32_t val) {
  REG32(IPC0_BASE_ADDR+IPC_DATA0_REG_OFFSET) = val;
}
