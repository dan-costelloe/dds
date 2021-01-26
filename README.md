# DDS

A VHDL implementation of a Direct Digital Synthesizer (DDS). 

## Design

The DDS uses an 8-bit accumulator. The accumulator accepts an input word which is added to the output of the accumulator every clock period. The output of the accumulator indexs a 256 word look-up-table (LUT). Each word is 16 bits wide. The LUT contains one cycle of a sine wave. The output of the LUT is registered to ensure synchronous output.

## Requirements

To run the scripts you need Vivado, I used 2019.2 but other versions should work. The webtalk licence edition is sufficient. Ensure the Vivado tools are on your path.

    source <path-to-vivado-install-directory>/settings64.sh

### Simulation

A script to simulate the VHDL is provided.

    ./run_simulation.sh

This will open up the Vivado tools with the simulation ready. Hit F3 to start the simulation. The results are saved in a file called sim_output.wdb.

### Synthesis

To run synthesis there is a tcl script.

    vivado -mode batch -source run_synthesis.tcl

Which will run synthesis. A design checkpoint is saved in the build directory along with timing and utilization reports.
