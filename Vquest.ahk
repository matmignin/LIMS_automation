gosub, vquest_start

return

;___________________________________________________________________________
______________________________________________________________________DEFAULT:
;____________________________________________________________________________
#IfWinActive,
;VarBar.show()

#If MouseIsOver("VarBar ahk_class AutoHotkeyGUI")
WheelUp::Varbar.AddIteration()
wheeldown::Varbar.SubIteration()
   F16::Excel.NextSheet()
   F17::excel.previoussheet()
#If
MouseIsOver(WinTitle)
{  MouseGetPos,,, Win
   Return WinExist(WinTitle . " ahk_id " . Win)
}

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
;----send LMS codes
F13 & LButton::Sendinput, +^4 ;screenshot
F13 & MButton::VarBar.Send("lot")
F13 & WheelUp::VarBar.Send("Product")
F13 & WheelDown::VarBar.Send("Batch")
F13::VarBar.set()
#If (A_PriorHotKey = "F15" AND A_TimeSincePriorHotkey < 4000)
{
	f15::Menu("Sheets")
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


Mbutton & WheelDown::Wheel("^{WheelDown}") 
Mbutton & Wheelup::Wheel("^{WheelUp}") 
;F17::Wheel_Right()
Rbutton & Wheelup::Wheel_cut() 
Rbutton & Wheeldown::Wheel_paste()
Rbutton & F16::Backspace
Rbutton & F18::Get_WindowInfo()
Mbutton & F15::Menu("Sheets")
Rbutton & F17::delete
Rbutton & Lbutton::Enter
F17::Wheel_Right()
F16::Wheel_left()
#inputlevel 1
!F15::Mouse_CloseWindow()
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
_________________________________________________________________OUTLOOK:
;____________________________________________________________________________


	#IfWinActive, ahk_exe OUTLOOK.EXE 
	Mbutton::SENDINPUT % VarBar.send("Batch") " is updated"
	Rbutton & Wheelup::Wheel("{ctrl down}x{ctrl up}")
	Rbutton & wheeldown::Wheel("{ctrl down}v{ctrl up}")
	F14 & WheelDown::varbar.search("batch")
	F14 & Wheelup::varbar.search("Product")
	;F14::menu()
	F13::varbar.set()
	F19 & Space::Varbar.send("Product")
	F20 & Space::Varbar.send("batch")
	F18::
		send, ^c
		ClipWait, 1,
		Clipboard := Trim((Clipboard, "`r`n"))
		WinActivate, NuGenesis LMS - \\Remote
		;Click 364, 46
		;sleep 200
		click, 500,127, 2 ;click search bar
		sleep 200
		Send, %clipboard%{enter}
		return

#IfWinActive,

;___________________________________________________________________________
______________________________________EXCEL:
;____________________________________________________________________________

#IfWinActive, LMS Workbook.xlsm - Excel
	Mbutton::Excel.Connect()
#ifwinactive, ahk_exe EXCEL.EXE
	+Enter::sendinput, !{enter}
	$Enter::sendinput, {enter}
	F13::Excel.Search()
; ~lbutton::
; 	XL:= ComObjActive("Excel.Application")
; 	Visible := True
; 	CurrentSheet:=xl.ActiveWorkbook.Activesheet.name
; 	if (Product != CurrentSheet)
; 	varbar.update("Iteration")
; ; WinWaitNotActive, LMS Workbook.xlsm - Excel,
; return
	; `::esc
return
F18::
	;Varbar.Set()
		;CellValue:= 
	; if (Regexmatch(Clip, "\b\d{3}-\d{4}\b", ClipforBatch) > 0)
			; Cellvalue := ClipforBatch
	; else 
			; Cellvalue := Clip
		; regexmatch(Clip, "\b[EGLHKJI]{1}\d{3}", CellValue)
		WinActivate, NuGenesis LMS - \\Remote
		;Click 364, 46
		;sleep 200
		click, 500,127, 2 ;click search bar
		sleep 200
	send % Excel.ActiveCell()
	sleep 200
	send, {enter}
	return

#ifwinactive, Find and Replace,
F13 & WheelUp::
	Wheel("{alt down}n{alt up}")
	VarBar.Send("Product")
	return
F13 & WheelDown::
	Wheel("{alt down}n{alt up}")
	VarBar.Send("Batch")
	return
	enter::sendinput, !i
	rbutton & Lbutton::sendinput, !i







#IfWinActive, ahk_exe WFICA32.EXE,
F14 & WheelUp::Varbar.AddIteration()

F14 & wheeldown::Varbar.SubIteration()

WheelRight::Excehl.NextSheet()
wheelleft::Excel.PreviousSheet()
F16::Excel.NextSheet()
F17::Excel.PreviousSheet()


#Ifwinactive, Result Entry - \\Remote
		F13::WorkTab_ChangeTestResults("toggle")	







;___________________________________________________________________________
________________________________________________________________Main_screen:
;___________________________________________________________________________

#Ifwinactive, NuGenesis LMS - \\Remote 
F14 & WheelRight:: sendinput, {click, 743, 41}
F14 & WheelLeft::sendinput, {Click 354, 44}
F14 & WheelDOWN::Sendinput, {Click 46, 855}
F14 & wheelUP::sendinput, {click, 544, 41}
Enter::
Send, ^a
varbar.set()
sleep 200
send, {enter}
return
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
#KeyHistory 400
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
#MaxHotkeysPerInterval 200
#maxthreadsperhotkey, 1
SetKeyDelay, 0
setwindelay, 450
AutoTrim, On
Menu, Tray, Icon, Robot.ico
#HotkeyModifierTimeout 
Iniread, Iteration, data.ini, SavedVariables, Iteration
Iniread, VarBar_X, data.ini, Locations, VarBar_x
Iniread, VarBar_Y, data.ini, Locations, VarBar_Y
Excel.Connect(1)
excel.listsheets()
; test_Excelsheets()
;VarBar.show(1)
Run, ViM.Ahk
Menu, Tray, Add, Stop, StopSub 
Menu, Tray, Default, Stop 
return


StopSub: 
  exitapp
Return


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
