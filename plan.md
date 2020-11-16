# Plan

## Add existing IP
- [x] make software to use AES
- [x] add second AES
- [x] make software using it

## make a custom IP
- [x] add IPC
- [x] make software using it

## Add subsys
- [x] add RISC-V with GPO
- [x] dev trivial ROM code toggling the GPO
- [ ] add JTAG
- [ ] connect GDB to subsys JTAG


## Notes

### Add a peripheral:
general guide is here: https://docs.opentitan.org/hw/top_earlgrey/ search "Adding new blocks into top level"
- edit `top_earlgrey.hjson`
- edit `xbar_main.hjson`
    - add the IP
    - connect it
- edit `hw/lint/top_earlgrey_lint_cfgs.hjson`
- edit `hw/Makefile`
- `make -C hw`: this creates \*_reg_pkg.sv and \*_reg_top.sv.
- `util/dvsim/dvsim.py hw/top_earlgrey/lint/top_earlgrey_lint_cfgs.hjson --tool verilator --purge --select-cfgs ise`
- `fusesoc --cores-root . run --flag=fileset_top --target=sim --setup --build lowrisc:systems:top_earlgrey_verilator`
- create sw lib in `sw/lib`
- edit `sw/lib/meson.build` to create sw lib entry
- edit sw project meson.build to include that lib.
- `ninja -C build-out all`
- `build/lowrisc_systems_top_earlgrey_verilator_0.1/sim-verilator/Vtop_earlgrey_verilator   --meminit=rom,build-bin/sw/device/boot_rom/boot_rom_sim_verilator.elf   --meminit=flash,build-bin/sw/device/examples/ping_aes/ping_aes_sim_verilator.elf`

### Make a custom IP
- add it in IP list in `hw/Makefile`
- add it in top level meson.build (hw_ip_ipc_reg_h = gen_hw_hdr.process('hw/ip/ipc/data/ipc.hjson'))
