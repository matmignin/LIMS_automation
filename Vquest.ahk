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
VarBar()
Run, ViM.Ahk
return
#IfWinActive,


VarBar_Reset:
VarBar_Reset()
return
Run_CL3:
Run, cl3.Ahk, C:\Users\mmignin\Documents\Autohotkey\lib\CL3
return
#include Vim.ahk
#Include LMS.ahk
#include test.ahk
#Include <F17>
#include <varBar>
/*
	#include <Menu>
*/




;F18::SampleTab_ChangeTestResults()
;F13::SampleTab_ChangeTestResults("Toggle")
F18::Menu()
F17::F17()


F13 & LButton::Sendinput, +^4 ;screenshot
F13 & MButton::Sendinput, % Varbar_get("lot")
F13 & WheelUp::Sendinput, % Varbar_get("Product")
/* 
#If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4000) && winactive("ahk_exe OUTLOOK.EXE")
{
	f13::Mouse_Wheelcopy() 
	;Wheelup::Set_lot()
	Wheeldown::sendinput, #v
	F16::
	F17::
	#if
}
#If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4000)
{
	f13::Mouse_Wheelcopy() 
	Wheelup::Varbar_Set("Product") ;Set_lot()
	Wheeldown::sendinput, {lcontrol down}b{lcontrol up}
	F16::
	;F17::
	;Lbutton::^+4 ;screenshot
	;Rbutton::OCR()
	;mbutton::Varbar_SetProduct(Mouse_clip())
	#If
}
F13:: Tooltip("☩",4000) 
*/
#if
return
F13 & WheelDown::Mouse_Wheelpaste()
Mbutton & WheelDown::Mouse_Wheel("^{WheelDown}") 
Mbutton & Wheelup::Mouse_Wheel("^{WheelUp}") 
F16::LMS_Autofill()
;F17::Mouse_Wheelright()
Rbutton & Wheelup::Mouse_Wheelcut()
Rbutton & Wheeldown::Mouse_Wheelpaste()
Rbutton & WheelLeft::
Rbutton & WheelRight::delete
Rbutton & Lbutton::Enter
Rbutton & Mbutton::Esc
Rbutton & F18::^a
Rbutton & F13::Mouse_Get_WindowInfo()
#inputlevel 1
Rbutton::
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

