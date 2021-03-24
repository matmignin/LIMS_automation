gosub, vquest_start


F14 & Rbutton:: 
F14 & Lbutton::Sendinput, #{down}
F13 & F14::sendinput, !{tab}
F18 & Rbutton:: 
F18 & Lbutton::sendinput, ^{Lbutton}
F14 & F13::sendinput, #{tab}
F18 & F13::reload
F14::Menu()
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

; #If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4000)
; {
; 	f13::Varbar_Set()
; 	Wheelup::Varbar_Set("Product") ;Set_lot()
; 	Wheeldown::Varbar_Set("Batch")
; 	F16::Varbar_Set("Name")
; 	F17::Varbar_Set("Lot")
; 	Lbutton::LMS_AutoFill()
; 	Rbutton::LMS_AutoFill()
; 	mbutton::Varbar_Set("Lot")
; 	#If
; }
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
#IfWinActive, LMS Workbook.xlsm - Excel
	F14::Excel_Connect()

#IfWinActive, ahk_exe WFICA32.EXE
Mbutton::LMS_AutoFill()

#Ifwinactive, NuGenesis LMS - \\Remote ;____________________________Main scree
F14 & WheelRight:: sendinput, {click, 743, 41}
F14 & WheelLeft::sendinput, {Click 354, 44}
F14 & WheelDOWN::Sendinput, {Click 46, 855}
F14 & wheelUP::sendinput, {click, 544, 41}
; F14 & WheelRIGHT::sendinput, {click, 743, 41}
; F14 & WheelLEFT::sendinput, {Click 354, 44} 
#IfWinActive







#IfWinActive
Hotstrings:
{
; F19::return
Return & G::Enter_Product("G")
Return & H::Enter_Product("H")
Return & I::Enter_Product("I")
Return & J::Enter_Product("J")
Return & K::Enter_Product("K")
Return & L::Enter_Product("L")

}

Enter_Batch(key) 
{
	global
	MouseGetPos,MouseLocationX,MouseLocationY
	sleep 200
	; make varbar location + y35	
	inputbox,Batch,, %key%-,,70,130,%MouseLocationX%,%MouseLocationY%,,,%Batch%
	if ErrorLevel
		return
	else
		Batch:=key . "-" . Batch
	;Save_Code("Batches", Batch)
	;Envset, Batch, %Batch%
	Sleep 100		
	VarBar()
	return
}
Enter_Product(key)
{
	global
	MouseGetPos,MouseLocationX,MouseLocationY
	sleep 200
	; make varbar location + y35
	inputbox,Code,,  %key%`t ,,70,130,%MouseLocationX%,%MouseLocationY%,,,%Code%
	if !ErrorLevel
		Product:=key . Code
	;Save_Code("Products", Product)
	Sleep 200	
	IfWinActive, NuGenesis LMS - \\Remote
		sendinput, {ctrl down}a{ctrl up}%Product%{enter}
	VarBar()
	return
} 


























VQuest_Start:
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
; test_Excelsheets()
;VarBar()
Run, ViM.Ahk
return


VarBar_Reset:
VarBar_Reset()
return
Run_CL3:
Run, cl3.Ahk, lib\CL3
return
#include Vim.ahk
#Include <LMS_autofill>
#include <test>
#include <varBar>
#include <ProductTab>
#include <WorkTab>
#include <SpecTab>
#include <Rotation>
#include <Excel>
return
#IfWinActive,
