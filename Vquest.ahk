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
test_Excelsheets()
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






F18::Menu()
F17::Wheel_Right()
F16::Wheel_left()
F15 & Wheelup::Test(3)
F15 & Wheeldown::Test(2)
F12::
F15::Test(Iteration)
;----send LMS codes
F13 & LButton::Sendinput, +^4 ;screenshot
F13 & MButton::Varbar_Send("lot")
; F13 & WheelUp::
; 	while GetKeyState("F13","p")
; 		sendinput, {CtrlDown}
; 	sleep 200
; 	sendinput, {ctrlup}
; 	return

;F13 & WheelDown::Varbar_Send("Batch")
;F13 & F17::


; #If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4000) && winactive("ahk_exe OUTLOOK.EXE")
; {
; 	f13::Mouse_Wheelcopy() 
; 	;Wheelup::Set_lot()
; 	Wheeldown::sendinput, #v
; 	F16::
; 	F17::
; 	#if
; ; }
; #If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4000)
; {
; 	f13::LMS_AutoFill()() 
; 	Wheelup::Varbar_Send("Product") ;Set_lot()
; 	Wheeldown::Varbar_Send("Batch")
; 	F16::
; 	;F17::
; 	;Lbutton::^+4 ;screenshot
; 	;Rbutton::OCR()
; 	;mbutton::Varbar_SetProduct(Mouse_clip())
; 	#If
; }
; F13:: Tooltip("☩",4000) 

#if
return
#inputlevel 1

Mbutton & WheelDown::Mouse_Wheel("^{WheelDown}") 
Mbutton & Wheelup::Mouse_Wheel("^{WheelUp}") 
;F17::Mouse_Wheel_Right()
Rbutton & Wheelup::Mouse_Wheelcut() 
Rbutton & Wheeldown::Mouse_Wheelpaste()
Rbutton & F16::

Rbutton & WheelRight::delete
Rbutton & Lbutton::Enter
Rbutton & F18::^a
Rbutton & F13::Mouse_Get_WindowInfo()
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