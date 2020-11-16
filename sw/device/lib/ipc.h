// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#ifndef OPENTITAN_SW_DEVICE_LIB_IPC_H_
#define OPENTITAN_SW_DEVICE_LIB_IPC_H_

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

uint32_t ipc_get(void);

void ipc_put(uint32_t val);


#endif  // OPENTITAN_SW_DEVICE_LIB_IPC_H_
