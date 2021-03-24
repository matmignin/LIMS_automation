#Persistent 
#NoEnv
#SingleInstance,Force
SetWorkingDir, %A_ScriptDir%
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
setwindelay, 450
AutoTrim, On
Menu, Tray, Icon, Robot.ico
#HotkeyModifierTimeout 
Iniread, VarBar_X, data.ini, Locations, VarBar_x
Iniread, VarBar_Y, data.ini, Locations, VarBar_Y
Excel_Connect()
test_Excelsheets()
VarBar()
Run, ViM.Ahk
return
#IfWinActive,


VarBar_Reset:
VarBar_Reset()
return
Run_CL3:
Run, cl3.Ahk, lib\CL3
return
#include Vim.ahk
#Include LMS.ahk
#include test.ahk
; #Include <F17>
#include <varBar>
; #include CL3/cl3.ahk





F14 & Rbutton:: 
F14 & Lbutton::Sendinput, #{down}
F13 & F14::sendinput, !{tab}
F18 & Rbutton:: 
F18 & Lbutton::sendinput, ^{Lbutton}
F18 & Mbutton:: 
F14 & F13::sendinput, #{tab}
F18 & F13::reload
F18::Menu()
; F17::Wheel_Right()
; F16::Wheel_left()
F15 & Wheelup::
F15 & Wheeldown::
F12::
F15::Test()
;----send LMS codes
F13 & LButton::Sendinput, +^4 ;screenshot
F13 & MButton::Varbar_Send("lot")
F13 & WheelUp::Varbar_Send("Product")
F13 & WheelDown::Varbar_Send("Batch")

#If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4000)
{
	f13::Varbar_Set()
	Wheelup::Varbar_Set("Product") ;Set_lot()
	Wheeldown::Varbar_Set("Batch")
	F16::Varbar_Set("Name")
	F17::Varbar_Set("Lot")
	Lbutton::LMS_AutoFill()
	Rbutton::LMS_AutoClick()
	mbutton::Varbar_Set("Lot")
	#If
}
F13::Varbar_Set() ;Tooltip("☩",4000) 

#if
#IfWinActive,
return
Enter & k::Varbar_Focus()

Mbutton & WheelDown::Mouse_Wheel("^{WheelDown}") 
Mbutton & Wheelup::Mouse_Wheel("^{WheelUp}") 
;F17::Mouse_Wheel_Right()
Rbutton & Wheelup::Mouse_Wheelcut() 
Rbutton & Wheeldown::Mouse_Wheelpaste()
Rbutton & F16::Backspace
Rbutton & F18::Mouse_Get_WindowInfo()

Rbutton & F17::delete
Rbutton & Lbutton::Enter
F17::Wheel_Right()
F16::Wheel_left()
Rbutton & F13::
#inputlevel 1
Rbutton up::
{
	suspend, On
	sleep 50
	Click, Right
	sleep 500
	;MouseClick, Right,,,1, 0, U
	suspend, Off
	return
}
#inputlevel 0