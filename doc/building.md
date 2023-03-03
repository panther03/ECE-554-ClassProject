## Building requirements

All of the mentioned programs should be in `$PATH`.

* `make`
* `python3`
* Modelsim: `vsim`
* Quartus executables: `quartus_sh`, `quartus_pgm`

## How to build

* To build a SOF file for the DE1-SoC: `make fpga`
* To simulate all testbenches: `make sim`
* To simulate a specific testbench called `MyTB` (see [Repository Structure](#repository-structure)): `make sim TB=MyTB`
* To open the modelsim GUI for `MyTB`: `make gui TB=MyTB`

## I can't use the scripts. Where do I go?

* To open the quartus project: Double click the `*.qsf` in `fpga/de1_soc`.
    * Make sure the assembly file you want is built and placed in `out/out.hex`. See below simulation steps for building asm files.
* To simulate MiniLab0:
    * Create the ModelSim project manually. Add `tb/MiniLab0/MiniLab0_tb.sv` to the project. Add all of the files in `rtl/` (the design files) to the project.
    * Create `out/` in the root of the repository if it does not already exist.
    * From the root of the repository, run `python3 sw/assemble.py fw/MiniLab0.asm -o out/out.hex`.
    * Start simulation with `MiniLab0_tb` as the toplevel and run.