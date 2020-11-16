// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#ifndef OPENTITAN_SW_DEVICE_LIB_ISE_H_
#define OPENTITAN_SW_DEVICE_LIB_ISE_H_

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

uint32_t ise_get(void);

void ise_put(uint32_t val);

uint32_t ise_status(void);

#endif  // OPENTITAN_SW_DEVICE_LIB_ISE_H_
