# Script to run synthesis.

# Get the full path to this script.
set scriptPath [file normalize [info script]]
puts $scriptPath

# Get the directory containing this script, which
# is the root of the repository.
set rootDir [file dirname $scriptPath]
puts $rootDir

# All outputs go in a new directory called build.
set buildDir ${rootDir}/build
file mkdir $buildDir

# Add the sources.
set vhdlSources ${rootDir}/src/dds.vhd
read_vhdl -library defaultlib $vhdlSources
read_xdc $rootDir/src/constraints.xdc

# Run synthesis.
synth_design -top dds -part xc7k70tfbg676-2
write_checkpoint -force ${buildDir}/post_synth.dcp

# Save post synthesis reports.
report_timing_summary -file ${buildDir}/post_synth_timing_symmary.rpt
report_utilization -file ${buildDir}/post_syth_util_report.rpt
