# Plan

## Add existing IP
- [x] make software to use AES
- [x] add second AES
- [x] make software using it

## Add APB IP
- [ ] add IPC
- [ ] make software using it

## Add subsys
- [ ] add RISC-V with JTAG and GPIO
- [ ] dev trivial ROM code toggling the GPIOs
- [ ] connect GDB to subsys JTAG


## Notes

### Add a peripheral:
general guide is here: https://docs.opentitan.org/hw/top_earlgrey/ search "Adding new blocks into top level"
- edit `top_earlgrey.hjson`
- edit `xbar_main.hjson`
    - add the IP
    - connect it
- `make` from `hw` directory
- `fusesoc --cores-root . run --flag=fileset_top --target=sim --setup --build lowrisc:systems:top_earlgrey_verilator`
- create sw lib in `sw/lib`
- edit `sw/lib/meson.build` to create sw lib entry
- edit sw project meson.build to include that lib.
- `ninja -C build-out all`
- `build/lowrisc_systems_top_earlgrey_verilator_0.1/sim-verilator/Vtop_earlgrey_verilator   --meminit=rom,build-bin/sw/device/boot_rom/boot_rom_sim_verilator.elf   --meminit=flash,build-bin/sw/device/examples/ping_aes/ping_aes_sim_verilator.elf`
