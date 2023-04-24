#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
#Persistent
Process, Priority, , High
#NoEnv
ClipFile:="\\10.1.2.118\users\vitaquest\mmignin\VQ_Helper\clipboard.txt"
; #ClipboardTimeout 7500
; SetNumlockState, on
	SetscrolllockState, off
	SetNumlockState Alwayson
	setcapslockstate alwaysoff
	OnClipboardChange("clipChange")

return


clipChange(type){
  global
  sleep 75
tt(Clipboard, 500,50, 50)
;   If (Clipboard = PriorClipboard)
	; return
; else
{
  PriorClipboard:=ClipboardAll
	FileDelete, %ClipFile%
	sleep 300
	FileAppend, %Clipboard%, %ClipFile%
}
sleep 500
  return

}


TT(msg:="yo", time=1500, X:="",Y:="",N:="", Transparent:="",Position:="S") {
	global
	sleep 20
		tooltip, %msg%, %X%, %Y%,%N%
	hwnd := winExist("ahk_class tooltips_class32")
	if Transparent
		winSet, Trans, %Transparent%, % "ahk_id" hwnd
	; winSet, TransColor, FFFFFF 200, % "ahk_id" hwnd
	; winSet, Trans, 200, %W%
	; CoordMode, ToolTip, screen
	; CoordMode, ToolTip, Relative
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

