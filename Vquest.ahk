gosub, vquest_start
return


#IfWinActive,
;VarBar.show()



F13 & F18::Varbar.reset()
F14 & Rbutton:: 
F14 & Lbutton::Sendinput, #{down}
F13 & F14::sendinput, !{tab}
F18 & Rbutton:: 
F18 & Lbutton::sendinput, ^{Lbutton}
F14 & F13::sendinput, #{tab}
F14::Menu()
F15 & Wheelup::sendinput, {F15}
F15 & Wheeldown::
F12::
;----send LMS codes
F13 & LButton::Sendinput, +^4 ;screenshot
F13 & MButton::VarBar.Send("lot")
F13 & WheelUp::VarBar.Send("Product")
F13 & WheelDown::VarBar.Send("Batch")
F13::VarBar.set()
!F15::Mouse_CloseWindow()
#If (A_PriorHotKey = "F15" AND A_TimeSincePriorHotkey < 4000)
{
	f15::Menu()
	Wheelup::sendinput, {click, 544, 41}
	Wheeldown::Sendinput, {Click 46, 855}
	F16::sendinput, {Click 354, 44}
	F17::sendinput, {click, 743, 41}
	Lbutton::LMS_AutoFill()
	Rbutton::LMS_AutoFill()
	mbutton::VarBar.set()
}
	#If
F15::Tooltip("☩",4000) 

#if
return


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


;___________________________________________________________________________
																			OUTLOOK:
;____________________________________________________________________________


	#IfWinActive, ahk_exe OUTLOOK.EXE 
	Mbutton::SENDINPUT % VarBar.send("Batch") " is updated"
	Rbutton & Wheelup::mouse_wheel("{ctrl down}x{ctrl up}")
	Rbutton & wheeldown::mouse_wheel("{ctrl down}v{ctrl up}")
	F14 & WheelDown::varbar.search("batch")
	F14 & Wheelup::varbar.search("Product")
	;F14::menu()
	F13::varbar.set()
	F19 & Space::Varbar.send("Product")
F20 & Space::Varbar.send("batch")
#IfWinActive,

Excel:
;___________________________________________________________________________
;																				EXCEL
;____________________________________________________________________________

#IfWinActive, LMS Workbook.xlsm - Excel
	Mbutton::Excel_Connect()
#ifwinactive, ahk_exe EXCEL.EXE
	+Enter::sendinput, !{enter}
	$Enter::sendinput, {enter}
	F13::Excel_Search()
	`::esc


#ifwinactive, Find and Replace,
F13 & WheelUp::
Mouse_Wheel("{alt down}n{alt up}")
VarBar.Send("Product")
return
F13 & WheelDown::
Mouse_Wheel("{alt down}n{alt up}")
VarBar.Send("Batch")
return
	enter::sendinput, !i
	rbutton & Lbutton::sendinput, !i















#Ifwinactive, Result Entry - \\Remote
		F13::WorkTab_ChangeTestResults("toggle")	

#Ifwinactive, NuGenesis LMS - \\Remote ;____________________________Main screen
F14 & WheelRight:: sendinput, {click, 743, 41}
F14 & WheelLeft::sendinput, {Click 354, 44}
F14 & WheelDOWN::Sendinput, {Click 46, 855}
F14 & wheelUP::sendinput, {click, 544, 41}
; F14 & WheelRIGHT::sendinput, {click, 743, 41}
; F14 & WheelLEFT::sendinput, {Click 354, 44} 
#IfWinActive, ahk_exe WFICA32.EXE
Mbutton::LMS_AutoFill()
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
F19 & Space::Varbar.send("Product")
F20 & Space::Varbar.send("batch")
}

Enter_Batch(key) 
{
	global
	Inputbox_X:= Varbar_X + 40
	Inputbox_Y:= Varbar_Y
	sleep 200
	CoordMode, mouse, screen
	inputbox,Batch,, %key%-,,70,130,%InputBox_X%,%InputBox_Y%,,,%Batch%
	if ErrorLevel
		return
	else
		Batch:=key . "-" . Batch
			CoordMode, mouse, window
	;Save_Code("Batches", Batch)
	;Envset, Batch, %Batch%
	Sleep 100		
	VarBar.show()
	return
}
Enter_Product(key)
{
	global
	Inputbox_X:= Varbar_X + 40
	Inputbox_Y:= Varbar_Y
	sleep 200
	CoordMode, mouse, screen
	inputbox,Product,,  %key%`t ,,70,130,%InputBox_X%,%InputBox_Y%,,,%Product%
	if !ErrorLevel
		Product:=key . Code
	CoordMode, mouse, window
	Sleep 200	
	IfWinActive, NuGenesis LMS - \\Remote
		sendinput, {ctrl down}a{ctrl up}%Product%{enter}
	VarBar.show()
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
VarBar.show()
Run, ViM.Ahk
return


VarBar_Reset:
VarBar.Reset()
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
