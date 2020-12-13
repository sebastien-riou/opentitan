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
- `build/lowrisc_systems_top_earlgrey_verilator_0.1/sim-verilator/Vtop_earlgrey_verilator   --meminit=rom,build-bin/sw/device/boot_rom/boot_rom_sim_verilator.elf   --meminit=flash,build-bin/sw/device/examples/ping_ise/ping_ise_sim_verilator.elf`

### Make a custom IP
- add it in IP list in `hw/Makefile`
- add it in top level meson.build (hw_ip_ipc_reg_h = gen_hw_hdr.process('hw/ip/ipc/data/ipc.hjson'))


### Debug on Artya7 FPGA:

````
fusesoc --cores-root . run --flag=fileset_top --target=synth lowrisc:systems:top_earlgrey_artya7-100
````
or
````
fusesoc --cores-root . pgm lowrisc:systems:top_earlgrey_artya7-100:0.1
````

monitor serial output:
````
picocom --baud=115200 /dev/ttyUSB2
````

run openocd:
````
/tools/openocd/bin/openocd -s util/openocd -f board/lowrisc-earlgrey-artya7.cfg
````

connect in eclipse


## RAM code
````
build/lowrisc_systems_top_earlgrey_verilator_0.1/sim-verilator/Vtop_earlgrey_verilator   --meminit=rom,build-bin/sw/device/boot_rom2/boot_rom2_sim_verilator.elf   --meminit=ram,build-bin/sw/device/ram_code/ram_code_sim_verilator.elf
````

## WIP

Debug on ISE

### Using verilator
In terminal 1:
````
build/lowrisc_systems_top_earlgrey_verilator_0.1/sim-verilator/Vtop_earlgrey_verilator   --meminit=rom,build-bin/sw/device/boot_rom/boot_rom_sim_verilator.elf   --meminit=flash,build-bin/sw/device/examples/ping_ise/ping_ise_sim_verilator.elf -t
````

In terminal 2:
````
/tools/openocd/bin/openocd -s util/openocd -f board/lowrisc-earlgrey-verilator.cfg
````

In terminal 3:
````
picocom --baud=115200 /dev/pts/? (replace with whatever is displayed by verilator output)
````


## susbys_tl
### gen xbar
````
util/tlgen.py -t hw/ip/ise/data/xbar_main.hjson -o hw/ip/ise/
````

### gen sw
````
make -C hw/ip/ise/sw/core0/
````
