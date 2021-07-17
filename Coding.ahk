#Persistent
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
SetNumlockState Alwayson
 setCapslockstate alwaysoff
 SetMbuttonState, alwaysOff
 CoordMode, mouse, Window
 SetMouseDelay, 5
 SetDefaultMouseSpeed, 1
 SetTitleMatchMode, 2
	Menu, Tray, Icon, Vim.ico
	 #MaxHotkeysPerInterval 90
;  #HotkeyModifierTimeout, 500
 #maxthreadsperhotkey, 1
 SetKeyDelay, 0, 0
 setwindelay,400


;#include <TEST>
;#include VQuest.ahk
#IfWinActive,
 #include <TrackPad>
; #include <KEYS>
#include <Vim>
#include <VScode>
#Include <Firefox>
#Include <Office>
; #Include <LMS>
#Include <clip>
#Include <Snipper>
#Include <OpenApp>
; #Include <AutoFill>
; #include <varBar>
; #include <ProductTab>
; #include <WorkTab>
; #include <SpecTab>
; #include <menu>
; #include <Rotation>
#include <Excel>
#include <vis2>
#include <wheel>
#include <mouse>
#include <click>


 trackpadhints=

	 send,{CtrlUp}{AltUp}{shiftup}{LWinUp}
 ;AutoTrim, off
 LMSMain:="NuGenesis LMS - \\Remote"
 LMSWindow:="ahk_exe WFICA32.EXE"
return