#Persistent 
#NoEnv
#SingleInstance,Force
#WinActivateForce
detecthiddenwindows, on
SetTitleMatchMode, 2
settitlematchmode, slow
;#HotkeyInterval ; This is the default value (milliseconds).
;#MaxHotkeysPerInterval 200
setwindelay, 200
Menu, Tray, Icon, Robot.ico 
AutoTrim, On
Setnumlockstate Alwayson
setCapslockstate alwaysoff
SetScrollLockState, alwaysOff
rightScreen:=A_ScreenWidth-1080
BottomScreen := A_ScreenHeight-28
;SetKeyDelay, 10
VariableGet()
return 
#IfWinActive


#include Variables.ahk
#Include Options.ahk
#Include Nugenesis.ahk
#Include MouseButtons.ahk

