
#IfWinActive, ahk_exe AHK-Studio.exe 
F19::Sendinput, %MousePosition%
F20::Sendinput, %WindowTitle%
;F13::return
Mbutton::
{
		Click, 3
		send, ^c
		return
}
Enter::sendinput, {enter}
wheelright::sendinput, !{right}
wheelleft::sendinput, !{left}
F1::
F2::
F3::
F4::
F12::
F11::
DoublePress()
return


;f15 & lbutton::SaveRestart()
Rbutton & F13::backspace


Rbutton::
{
		suspend, On
		sleep 30
		send, {Rbutton}
		sleep 500
		suspend, Off
		return
}

Media_Prev::+^F1
F3::+^F1 					;search Help


DebugWindow(Text,Clear:=0,LineBreak:=1,Sleep:=10,AutoHide:=1,MsgBox:=0){
	x:=ComObjActive("{DBD5A90A-A85C-11E4-B0C7-43449580656B}"),x.DebugWindow(Text,Clear,LineBreak,Sleep,AutoHide,MsgBox)
}

debug(text,var)
{
global
Text:=Text ": "
Debugwindow(Text var, 0,1,10,0,0)
}

Tooltip(msg, time=800) 
{
	global
	tooltip, %msg%
	sleep, %time%
	tooltip
}

F13 & Mbutton::send, F9{enter}
F14 & Wheeldown::Mouse_WheelZoomOut()
F14 & wheelup::Mouse_WheelZoomIn()
;+enter::SaveRestart() 
#IfWinActive,