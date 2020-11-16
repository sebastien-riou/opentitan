# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

foreach device_name, device_lib : sw_lib_arch_core_devices
  ping_ipc_elf = executable(
    'ping_ipc_' + device_name,
    sources: ['ping_ipc.c'],
    name_suffix: 'elf',
    dependencies: [
      sw_examples_demos,
      sw_lib_runtime_hart,
      sw_lib_runtime_print,
      sw_lib_runtime_log,
      sw_lib_pinmux,
      sw_lib_dif_gpio,
      sw_lib_irq,
      sw_lib_dif_spi_device,
      sw_lib_dif_uart,
      sw_lib_ipc,
      riscv_crt,
      sw_lib_irq_handlers,
      device_lib,
      sw_lib_testing_test_status,
    ],
  )

  ping_ipc_embedded = custom_target(
    'ping_ipc_' + device_name,
    command: make_embedded_target,
    input: ping_ipc_elf,
    output: make_embedded_target_outputs,
    build_by_default: true,
  )

  custom_target(
    'ping_ipc_export_' + device_name,
    command: export_target_command,
    input: [ping_ipc_elf, ping_ipc_embedded],
    output: 'ping_ipc_export_' + device_name,
    build_always_stale: true,
    build_by_default: true,
  )
endforeach
