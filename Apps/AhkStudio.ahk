#IfWinActive, ahk_exe AHK-Studio.exe 
Enter::enter
F13 & wheelright::
		Sendinput, ^x
		ClipWait, 1
		AHKClipboard := Clipboard
		return
F13 & wheelleft::send, %ahkclipbard%
wheelright::WHeelright()
wheelleft::WheelLeft()

f15 & lbutton::SaveRestart()

Rbutton::
	suspend, On
	sleep 30
	send, {Rbutton}
	sleep 500
	suspend, Off
	return
Media_Prev::+^F1
F3::+^F1 					;search Help



Capslock & F14::
RButton & wheelright::Sendinput, %WindowTitle%
Capslock & F13::
Rbutton & Wheelleft::Sendinput, %MousePosition%
;f13 & Wheelleft::Send_productcode()
;f13 & Wheelright::VarSet_Batch()
F13 & Mbutton::send, F9{enter}
;LCtrl & space::^!o
F15 & wheelUP::+^up
F15 & wheeldown::+^down
F15 & wheelleft::sendinput, {home}+{tab}
F15 & wheelright::sendinput, {home}{tab}

F14 & Wheeldown::Wheel_ZoomOut()
F14 & wheelup::Wheel_ZoomIn()
+enter::SaveRestart() 
;capslock up::sendinput, {ESC}


	
	
#ifwinactive,

