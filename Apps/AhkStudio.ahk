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
F14:: WinMenuSelectItem, ahk_exe AHK-Studio.exe, 2&, 11&, 3& ; sendinput, +^F 				;jump to function
F3::+^F1 					;search Help

Ralt & up::^+up
Ralt & down::^+down
Ralt & left::sendinput, {home}+{Tab}
Ralt & right::sendinput, {home}{Tab}

RAlt::
RButton & wheelright::Sendinput, %WindowTitle%
Rwin::
Rbutton & Wheelleft::Sendinput, %MousePosition%
f13 & Wheelleft::Send_productcode()
f13 & Wheelright::Set_Batch()
F13 & Mbutton::send, ifwinactive{space}
LCtrl & space::^!o
wheelright::!right
wheelleft::!left
F15 & wheelUP::+^up
F15 & wheeldown::+^down
F15 & wheelleft::sendinput, {home}+{tab}
F15 & wheelright::sendinput, {home}{tab}
;Mbutton::^!o
F14 & Wheeldown::Wheel_ZoomOut()
F14 & wheelup::Wheel_ZoomIn()
+enter::SaveRestart() 
capslock::sendinput, {ESC}
lalt::sendinput, {alt}{Alt}
Lshift & enter::sendinput, {end}{enter}{tab}return{enter}{up 2}{end}
	
	
#ifwinactive,

