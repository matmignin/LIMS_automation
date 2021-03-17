#Persistent 
#NoEnv
#SingleInstance,Force
Menu, Tray, Add, Run CL3, Run_cl3
Menu, Tray, Add, Reset Table Locations, Varbar_Reset
;#InstallKeybdHook
;#InstallMouseHook
Setnumlockstate Alwayson
setCapslockstate alwaysoff
SetscrolllockState, alwaysOff
SetDefaultMouseSpeed, 0
detecthiddenwindows, on
SetTitleMatchMode, 2
settitlematchmode, slow
#MaxHotkeysPerInterval 100
#maxthreadsperhotkey, 1
SetKeyDelay, 0
setwindelay, 250
AutoTrim, On
Menu, Tray, Icon, Robot.ico
#HotkeyModifierTimeout 
Iniread, VarBar_X, data.ini, Locations, VarBar_x
Iniread, VarBar_Y, data.ini, Locations, VarBar_Y
Excel_Connect()
VarBar()
;Run, ViM.Ahk, C:\Users\mmignin\Documents\Autohotkey\Lib
return
#IfWinActive,


VarBar_Reset:
VarBar_Reset()
return
Run_CL3:
Run, cl3.Ahk, C:\Users\mmignin\Documents\Autohotkey\lib\CL3
return
#include <Vim>
;#include <Vis2>
#Include LMS.ahk
#include test.ahk
#Include <WheelLeft>
#Include <WheelRight>
#include <varBar>

#Include <Mouse>
;F13 & RButton::OCR()