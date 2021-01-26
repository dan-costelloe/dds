#! /bin/sh

# Parse vhdl sources.
xvhdl ./src/dds.vhd ./src/dds_tb.vhd --nolog

# Elaborate the design.
xelab work.dds_tb --debug typical --nolog

# Run the simulation
xsim work.dds_tb --gui --view ./src/dds_sim.wcfg --wdb sim_output.wdb --nolog
