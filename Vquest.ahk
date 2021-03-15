#Persistent 
#NoEnv
#SingleInstance,Force
;SetWorkingDir "C:\Users\mmignin\Documents\AHK-Studio\Projects\VQuest"
Menu, Tray, Add, Run ViM and CL3, Run_ViM_CL3
Menu, Tray, Add, Reset Table Locations, Varbar_Reset
#InstallKeybdHook
Setnumlockstate Alwayson
setCapslockstate alwaysoff
SetscrolllockState, alwaysOff
SetDefaultMouseSpeed, 0
detecthiddenwindows, on
SetTitleMatchMode, 2
settitlematchmode, slow
#MaxHotkeysPerInterval 800
#maxthreadsperhotkey, 1
SetKeyDelay, 0,0
setwindelay, 250
AutoTrim, On
Menu, Tray, Icon, bin\Robot.ico 
;rightScreen:=		A_ScreenWidth-1270
;TopScreen:=		0 
Iniread, VarBar_X, data.ini, Locations, VarBar_x
Iniread, VarBar_Y, data.ini, Locations, VarBar_Y
;iniread, Batch, data.ini, Batches, Batch 
;iniread, Product, data.ini, Products, Product 
Excel_Connect()
VarBar()
;Run, Vim.Ahk, C:\Users\mmignin\Documents\Autohotkey\Lib
return
#IfWinActive,

VarBar_Reset:
VarBar_Reset()
return
Run_Vim_CL3:
run, Cl3.ahk, C:\Users\mmignin\Documents\Autohotkey\lib\CL3
Run, Vim.Ahk, C:\Users\mmignin\Documents\Autohotkey\Lib
return

#Include LMS.ahk
#include <ViM>
#include test.ahk
#Include <WheelLeft>
#Include <WheelRight>
#Include <RightButton>
#Include <Functions>
#include <varBar>
;#Include <Mouse>
