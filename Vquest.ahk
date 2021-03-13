SetWorkingDir "C:\Users\mmignin\OneDrive - Vitaquest International\VQuest"
#Persistent 
#NoEnv
#SingleInstance,Force
#InstallKeybdHook
;#HotkeyModifierTimeout 800
Setnumlockstate Alwayson
setCapslockstate alwaysoff
SetscrolllockState, alwaysOff
SetDefaultMouseSpeed, 0
detecthiddenwindows, on
SetTitleMatchMode, 2
settitlematchmode, slow
#MaxHotkeysPerInterval 400
#maxthreadsperhotkey, 1
SetKeyDelay, 2,5 
setwindelay, 250
AutoTrim, On
Menu, Tray, Icon, lib\Robot.ico 
;WorkbookPath:="C:\Users\mmignin\OneDrive - Vitaquest International\LMS Products Workbook.xlsm"
rightScreen:=		A_ScreenWidth-1270
TopScreen:=		0 
Iniread, VarBar_X, data.ini, Locations, VarBar_x
Iniread, VarBar_Y, data.ini, Locations, VarBar_Y
;iniread, Batch, data.ini, Batches, Batch 
iniread, Product, data.ini, Products, Product 
;Product:="K552"
;Iniread, iteration, data.ini, iteration, iteration
Excel_Connect()
;testExcel_sheets()
VarBar()

Menu, Tray, Add, Reset VarBar, VarBar_Reset
#IfWinActive,
return


+^F4::Mouse_Closewindow()





;Ralt:: ; Take ~ off if you dont want context menue to pop up. 	
;If (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<400) ;if double click
;{
	;Send {F20}
;}
;Else
;{
	;Send {F18}
;}
;Return



VarBar_Reset:
VarBar_Reset()
return


#Include LMS.ahk
#Include Hotkeys\ViM.ahk
#include Apps\Other.ahk
#Include Functions.ahk
#Include Hotkeys\Keyboard.ahk
#Include Hotkeys\F13.ahk
#Include Hotkeys\F14.ahk
#Include Hotkeys\F15.ahk
#Include Hotkeys\WheelLeft.ahk
#Include Hotkeys\WheelRight.ahk
#Include Hotkeys\RightButton.ahk
#Include Hotkeys\Middlebutton.ahk
;#include Functions\MyMenu.ahk


