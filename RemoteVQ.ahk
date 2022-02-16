VQuest_Start:
#SingleInstance,Force
#Persistent
Process, Priority, , High
#NoEnv
Iniread, Iteration, Settings.ini, SavedVariables, Iteration
#KeyHistory 500
#InstallKeybdHook
#InstallMouseHook
#ClipboardTimeout 1500
#InstallKeybdHook
SetKeyDelay,-1,1
setwindelay, 50
#InstallMouseHook
#HotkeyModifierTimeout
#maxthreadsperhotkey, 2
SetTitleMatchMode, 2
FormatTime, DayString,, MM/d/yy
FormatTime, TimeString, R
FormatTime, CurrentDateTime,, MM/dd/yy
FormatTime, The_Day,, MMMM d
FormatTime, The_Hour,, htt
FormatTime, The_Time,, hh:mm
SetNumlockState, on
SetscrolllockState, off
CrLf=`r`n
SetNumlockState Alwayson
setcapslockstate alwaysoff
CoordMode, mouse, window
SetWorkingDir, %A_ScriptDir%
#winactivateForce
SetscrolllockState, alwaysoff
AutoTrim, On
OnExit("Varbar.SaveVariables")
Menu, tray, NoStandard
; Menu, tray, Click,
Menu, Tray, Add, KeyHistory, KeyHistory
Menu, Tray, Add, listlines, listlines
Menu, Tray, Add, windowSpy, windowSpy
OnClipboardChange("clipChange")
PasteTime:=A_TickCount
Mode:="Entering_Rotations"
Menu, Tray, Add, E&xit, ExitSub
Menu, Tray, Default, E&xit
varbar.Show()
LMS.Orient()
copypasteToggle:=0
RegexProduct:="i)(?<=[\w\d]{3})?(?P<Product>[abcdefghijkl]\d{3})"
RegexBatch:=  "i)(?<!Ct#)(?P<Batch>\d{3}-\d{4}\b)"
RegexLot:=    "i)(?P<Lot>\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d)"
RegexCoated:= "i)(\d{4}\w\d\w?.|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d\s|coated: |ct#?|ct\s?|coated\s?)(?P<Coated>\d{3}-\d{4})"






activeCheck:
  If winactive("Result Entry - \\Remote") || winactive("Register new samples - \\Remote")
    varbar.FloatAtopwindow()
  else if winactive("Error - \\Remote") {
    ControlSend,, {enter}, Error - \\Remote
    sleep 200
    if winExist("Register new samples - \\Remote"){
      winactivate,
			Send, {click 180, 103,2}%Product%{enter}
		}
  }
  else if winactive("Information - \\Remote")
    send, {enter}
  else
    return
return




TT(msg:="yo", time=1500, X:="",Y:="",N:="", Transparent:="",Position:="S") {
	global
	sleep 20
	if (Position:="S")
		CoordMode, ToolTip, Screen
	if (Position:="R")
		CoordMode, ToolTip, Relative
	if (Position:="C")
		tooltip, %msg%, %A_CaretX%, %A_CaretY%,%N%
	else
		tooltip, %msg%, %X%, %Y%,%N%
	hwnd := winExist("ahk_class tooltips_class32")
	if Transparent
   	winSet, Trans, %Transparent%, % "ahk_id" hwnd
   	; winSet, TransColor, FFFFFF 200, % "ahk_id" hwnd
	; winSet, Trans, 200, %W%
	; CoordMode, ToolTip, screen
	CoordMode, ToolTip, Relative
	SetTimer, RemoveToolTip%N%, -%time%
	return
	RemoveToolTip:
		ToolTip
	return
	RemoveToolTip1:
		ToolTip,,,,1
	return
	RemoveToolTip2:
		ToolTip,,,,2
	return
	RemoveToolTip3:
		ToolTip,,,,3
	return
	RemoveToolTip4:
		ToolTip,,,,4
	return
	}


FlashScreen(Text:="",Color:="Black", ToolTipTime:=250){
	global
	SplashImage,,B w%A_ScreenWidth% h%A_ScreenHeight% cw%Color%
	if !Text
		Text:=A_ThisHotkey
		tt(Text,ToolTipTime,A_caretx,A_caretY,4)
		; ToolTip, %Text%, %A_CaretX%, %A_CaretY%, 9
	; ToolTip, %text%, 9
	Sleep,10
	SplashImage,off
	; ToolTip,,,,9
	return
}

class Breaking {
	Point(){
		Global
		If GetKeyState("Lbutton", "P") {
		TT("Broke")
			exit
		}
		if keep_running = n ;another signal to stop
				Exit
	}
	Preamble(){
		Global
		if keep_running = y
		{
			keep_running = n ;signal other thread to stop
			exit
		}
		keep_running = y
	}
}
MouseIsOver(winTitle){
	Global
	MouseGetPos,,, win
	Return winExist(winTitle . " ahk_id " . win)
}