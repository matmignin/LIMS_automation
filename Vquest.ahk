#Persistent 
#NoEnv
#SingleInstance,Force
SetWorkingDir "C:\Users\mmignin\OneDrive - Vitaquest International\VQuest"
Menu, Tray, Add, Reset VarBar, VarBar_Reset
Menu, Tray, Add, ViM, Run_ViM
Menu, Tray, Add, Cl3, Run_CL3
#InstallKeybdHook
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
rightScreen:=		A_ScreenWidth-1270
TopScreen:=		0 
Iniread, VarBar_X, data.ini, Locations, VarBar_x
Iniread, VarBar_Y, data.ini, Locations, VarBar_Y
;iniread, Batch, data.ini, Batches, Batch 
iniread, Product, data.ini, Products, Product 
Excel_Connect("no")

VarBar()


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
#include lib\TextRead\vis2.ahk


VarBar_Reset:
VarBar_Reset()
return
Run_CL3:
run, lib\CL3\Cl3.ahk
return
Run_ViM:
run, ViM.ahk
return

#Include LMS.ahk
;#Include ViM.ahk
#include <varbar>
#include <
#Include Functions.ahk

	#Include Hotkeys\Keyboard.ahk
	#Include Hotkeys\F13.ahk
	#Include Hotkeys\F14.ahk
	#Include Hotkeys\F15.ahk
	#Include Hotkeys\WheelLeft.ahk
	#Include Hotkeys\WheelRight.ahk
	#Include Hotkeys\RightButton.ahk
	#Include Hotkeys\Middlebutton.ahk
	;#include Functions\Menu.ahk


