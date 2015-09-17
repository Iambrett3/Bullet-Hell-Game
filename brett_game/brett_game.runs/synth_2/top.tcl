# 
# Synthesis run script generated by Vivado
# 

set_param gui.test TreeTableDev
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

create_project -in_memory -part xc7a100tcsg324-1
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Brett/School/Spring15/541/labs/brett_game/brett_game.cache/wt [current_project]
set_property parent.project_path C:/Brett/School/Spring15/541/labs/brett_game/brett_game.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/new/NoMoreMagicNumbers.sv
set_property file_type "Verilog Header" [get_files C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/new/NoMoreMagicNumbers.sv]
read_verilog -library xil_defaultlib -sv {
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/imports/sources_1/imports/new/xycounter.sv
  {C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/imports/imports/Lab9 files/register_file.sv}
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/new/screenmemory.sv
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/new/bitmapmemory.sv
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/imports/new/vgatimer.sv
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/imports/new/dmem.sv
  {C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/imports/lab10 files/controller.sv}
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/imports/new/datapath.sv
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/new/mem_mapper.sv
  {C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/imports/project_1 files/clockdiv.sv}
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/new/vgadisplaydriver.sv
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/imports/new/imem.sv
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/new/memIO.sv
  {C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/imports/lab10 files/mips.sv}
  {C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/imports/project_1 files/top.sv}
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/new/keyboard.sv
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/new/display8digit.sv
  {C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/Lab 5 files/hexto7seg.sv}
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/new/keyboard_test.sv
}
read_verilog -library xil_defaultlib {
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/imports/imports/new/fuladder.v
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/imports/imports/new/adder.v
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/imports/imports/new/comparator.v
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/imports/imports/new/logical.v
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/imports/imports/new/addsub.v
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/imports/imports/new/shifter.v
  C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/sources_1/imports/sources_1/imports/imports/new/ALU.v
}
read_xdc C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/constrs_1/imports/labs/top.xdc
set_property used_in_implementation false [get_files C:/Brett/School/Spring15/541/labs/brett_game/brett_game.srcs/constrs_1/imports/labs/top.xdc]

catch { write_hwdef -file top.hwdef }
synth_design -top top -part xc7a100tcsg324-1
write_checkpoint -noxdef top.dcp
catch { report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb }