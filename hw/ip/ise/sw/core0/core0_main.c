// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "simple_system_common.h"

#include <string.h>
void print_impl(const char*msg){puts(msg);}
#include "print.h"
#include "assert_print.h"

#include "ipc_basic_test.h"

#define STATUSEN_ADDR 0x4000001C
#define STATUSEN (*((volatile uint32_t*)STATUSEN_ADDR))
#define STATUS_ADDR 0x40000010
#define STATUS (*((volatile uint32_t*)STATUS_ADDR))

int main(int argc, char **argv) {
  STATUSEN = 0xFFFFFFFF;
  while(1){
      STATUS++;
  }
  return 0;
}
