
return
#Ifwinactive,

F1::return
+F1::F1
+F2::f2
#IfWinActive, ahk_exe explorer.exe ;_____________________________________Explorer
	wheelleft::!left
	wheelright::!right

;_________________________________________________________________________Snipper
	#ifwinactive, Snipper - Snipaste ahk_exe Snipaste.exe
	Rbutton::Mbutton
	F13::sendinput, {enter}
	F13 & Rbutton::Click, 2
	#IfWinActive,  Paster - Snipaste ahk_exe Snipaste.exe
	Mbutton::Sendinput, {click right}{down 3}{enter}
	wheelright::sendinput, ^=^=
	wheelleft::sendinput, ^-^-
	F15::sendinput, +{click right}
	#ifwinactive, 



#ifwinactive,
RAlt & \::Sendinput, mmignin{tab}Kilgore7744
RWin & \::Sendinput, Kilgore7744
#!\::
	sendinput, 4130220009588038
	trayTip, ,11/21  127
	return

	
+!^F2::^Lbutton
enter::enter



 