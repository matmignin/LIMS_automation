#IfWinActive, ahk_exe AHK-Studio.exe 

f15 & lbutton::SaveRestart()
Rbutton::
	suspend, On
	sleep 30
	send, {Rbutton}
	sleep 500
	suspend, Off
	return
	Media_Prev::+^F1
F3::+^F1 ;search Help

Ralt & up::^+up
Ralt & down::^+down
Ralt & left::sendinput, {home}+{Tab}
Ralt & right::sendinput, {home}{Tab}

RAlt::
RButton & wheelright::Send, %WindowTitle%
Rwin::
Rbutton & Wheelleft::Send, %mousePosition%

LCtrl & space::^!o
wheelright::!right
wheelleft::!left
F15 & wheelUP::+^up
F15 & wheeldown::+^down
F15 & wheelleft::sendinput, {home}+{tab}
F15 & wheelright::sendinput, {home}{tab}
Mbutton::^!o
F14 & Wheeldown::Wheel_ZoomOut()
F14 & wheelup::Wheel_ZoomIn()
+enter::SaveRestart() 
F14::sendinput, +^f
lalt::sendinput, {alt}{alt}
#ifwinactive,
f11::SaveRestart()
Media_Next::ShowMouseLocation()
F12::ShowMouseLocation()
Media_Play_Pause::SaveRestart()

F10::Exitapp
