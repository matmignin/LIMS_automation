#Persistent 
#NoEnv
#SingleInstance,Force
;SetWorkingDir "C:\Users\mmignin\Documents\AHK-Studio\Projects\VQuest"
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
Menu, Tray, Icon, Robot.ico 
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
;#include lib\TextRead\vis2.ahk


VarBar_Reset:
VarBar_Reset()
return
Run_CL3:
run, Cl3.ahk, C:\Users\mmignin\Documents\Autohotkey\lib\CL3
return
Run_ViM:
run, ViM.ahk, C:\Users\mmignin\Documents\Autohotkey\lib
return

#Include LMS.ahk
#include <varbar>
#include test.ahk

#Include <F13>
#Include <F14>
#Include <F15>
#Include <WheelLeft>
#Include <WheelRight>
#Include <RightButton>
#Include <Middlebutton>
#Include <Functions>
#include <Vis2>

;#Include <Mouse>




