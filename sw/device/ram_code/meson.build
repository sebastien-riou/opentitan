# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

# RAM linker parameters.
#
# See sw/device/exts/common/flash_link.ld for additional info about these
# parameters.
ram_linkfile = files(['ram_link.ld'])
ram_link_args = [
  '-Wl,-L,@0@'.format(meson.source_root()),
  '-Wl,-T,@0@/@1@'.format(meson.source_root(), ram_linkfile[0]),
  '-Wl,--build-id=none',
]
ram_link_deps = [ram_linkfile]

foreach device_name, device_lib : sw_lib_arch_core_devices
    ram_code_elf = executable(
      'ram_code_' + device_name,
      sources: [
        'ram_code.c',
        'startup.S'
      ],
      name_suffix: 'elf',
      link_args: ram_link_args,
      link_depends: ram_link_deps,
      dependencies: [
        sw_lib_runtime_hart,
        sw_lib_runtime_print,
        sw_lib_runtime_log,
        sw_lib_pinmux,
        sw_lib_dif_gpio,
        sw_lib_irq,
        sw_lib_dif_spi_device,
        sw_lib_dif_uart,
        sw_lib_ise,
        sw_lib_irq_handlers,
        device_lib,
        sw_lib_testing_test_status,
      ],
    )

    ram_code_embedded = custom_target(
      'ram_code_' + device_name,
      command: make_embedded_target,
      input: ram_code_elf,
      output: make_embedded_target_outputs,
      build_by_default: true,
    )

    custom_target(
      'ram_code_export_' + device_name,
      command: export_target_command,
      input: [ram_code_elf, ram_code_embedded],
      output: 'ram_code_export_' + device_name,
      build_always_stale: true,
      build_by_default: true,
    )
  endforeach
