# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/ECM_DCD/username/ip_repo/training_lib/vivado/circuit_ch1_1a/circuit_ch1_1a.cache/wt [current_project]
set_property parent.project_path D:/ECM_DCD/username/ip_repo/training_lib/vivado/circuit_ch1_1a/circuit_ch1_1a.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo d:/ECM_DCD/username/ip_repo/training_lib/vivado/circuit_ch1_1a/circuit_ch1_1a.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library training_lib D:/ECM_DCD/username/ip_repo/training_lib/hdl/circuit_ch1_1a_rtl.vhd
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/ECM_DCD/username/ip_repo/training_lib/zybo_training.xdc
set_property used_in_implementation false [get_files D:/ECM_DCD/username/ip_repo/training_lib/zybo_training.xdc]


synth_design -top circuit_ch1_1a -part xc7z010clg400-1


write_checkpoint -force -noxdef circuit_ch1_1a.dcp

catch { report_utilization -file circuit_ch1_1a_utilization_synth.rpt -pb circuit_ch1_1a_utilization_synth.pb }