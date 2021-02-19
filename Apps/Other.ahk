#Include Apps\Browsers.ahk
#include Apps\Outlook.ahk
#Include Apps\OneNote.ahk
#Include Apps\AhkStudio.ahk
#Include Apps\Excel.ahk
#Include Apps\RemoteDesktop.ahk

#Ifwinactive,

F1::return
+F1::F1
+F2::f2

;_________________________________________________________________________Snipper
	#ifwinactive, If winactive("ahk_exe explorer.exe")
	Rbutton::Mbutton
	F13::sendinput, {enter}
	F13 & Rbutton::Click, 2
	#IfWinActive,  Paster - Snipaste ahk_exe Snipaste.exe
	F14::send, ^{rbutton}
	Mbutton::Sendinput, {click right}{down 3}{enter}
	wheelright::sendinput, ^=^=
	wheelleft::sendinput, ^-^-
	F15::sendinput, +{click right}
	#ifwinactive, 



#ifwinactive,
F18 & \::Sendinput, mmignin{tab}Kilgore7744
F17 & \::Sendinput, Kilgore7744
#!\::
	sendinput, 4130220009588038
	trayTip, ,11/21  127
	return

	
+!^F2::^Lbutton




 