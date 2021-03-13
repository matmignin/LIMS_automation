



#Ifwinactive,

+F1::F1
+F2::f2



#ifwinactive,
;Ralt & \::Sendinput, mmignin{tab}Kilgore7744
F20 & \::Sendinput, mmignin{tab}Kilgore7744
Rwin & \::Sendinput, Kilgore7744
#!\::
sendinput, 4130220009588038
trayTip, ,11/21  127
return


+!^F2::^Lbutton



Rwin::F19

#IfWinActive, ahk_exe ONENOTE.EXE ;{
	
	;F13 & Lbutton::sendinput, ^!h
	Rbutton::Rbutton
	capslock & 1::^!1
	capslock & 2::^!2
	#IfWinActive,



#IfWinActive, ahk_exe firefox.exe
F15 & WheelDown::
	send, ^w
	sleep 500
	return
F15 & Wheelleft::Browser_Back
F15 & wheelright::Browser_Forward
F14 & Rbutton::send, ^w
Capslock::return
#ifwinactive, ahk_exe msedge.exe ; edge
#ifwinactive, ahk_exe explorer.exe ; explorer
#ifwinactive,
if WinActivate, File Explorer