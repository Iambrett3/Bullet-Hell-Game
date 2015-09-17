@echo off
set xv_path=C:\\Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto df6264912dc94b4484c861525ef1c957 -m64 --debug typical --relax --include "../../../brett_game.srcs/sources_1/imports/sources_1/imports/sources_1/new" --include "../../../brett_game.srcs/sources_1/new" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot project_screentest_behav xil_defaultlib.project_screentest xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
