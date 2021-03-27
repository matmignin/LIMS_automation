gosub, Vim_opened

#ifwinactive, 
#If (A_PriorHotKey = "d" AND A_TimeSincePriorHotkey < 4000)
{
	d::Send, {home 2}+{end}{Delete}
	w::sendinput, {right}^{left}+^{right}+{left}{backspace}
	4::sendinput, +{end}^x
	5::sendinput, ^m^x
	0::sendinput, +{home}^x
}


#If (A_PriorHotKey = "y" AND A_TimeSincePriorHotkey < 4000)
{
	d::Send, {home 2}+{end}^c
	w::sendinput, {right}^{left}+^{right}+{left}^c 
	5::sendinput, ^m^c
	4::sendinput, +{end}^c{right}
	y::
	Send {home}+{end}^c
	sleep 25
	ClipWait, 1
	send, {right}
	return
	Capslock & 0::sendinput, +{home}^c
	0::sendinput, +{home}^c
}	
#If (A_PriorHotKey = "g" AND A_TimeSincePriorHotkey < 500)
{
	Capslock & g::Send, ^{home}
}



#If WinActive("ahk_exe Code.exe") && Getkeystate("Capslock","p") ;editor
{
	,::sendinput, !`,
	m::+!down
	n::+!up
	u::+!up
	'::+^!n
	.::+F1
	up::^+up
	down::^+down
	/::sendinput, !^w
}
#If Getkeystate("Capslock","p")
{
	1::F1
	2::F2
	3::F3
	`::esc
	Enter::sendinput, +^enter
	j::down
	k::Up
	h::left
	l::right
	x::Delete
	g::send, ^{end}
	4::end
	0::home
	y::return
	d::return ; Send, {home 2}+{end}^x{delete}
	p::Send {end}{enter}^v
	w::Send {right}^{right 2}{left}
	e::Send ^{right}
	u::Send ^z
	up::+up
	down::+down
	right::+right
	left::+left
	b::^left
	Shift & o::sendinput, {home}{enter}{up}
	5::Send ^m
	o::Send, {end}{enter}
	Shift & ,::sendinput, +{F1}
	left::sendinput, {home}+{Tab}
	right::sendinput, {home}{Tab}

v up::
	while GetKeyState("Capslock","p")
		sendinput, {Shift down}
	sleep 200
	sendinput, {shift up}
	return
#if
}


#If Getkeystate("F19","p") ;________________________________________Psudo Numpad
	 j::numpad4
	 k::numpad5
	 l::numpad6
	 m::numpad1
	 ,::numpad2
	 .::numpad3
	 u::numpad7
	 i::numpad8
	 o::numpad9
	 `;::numpad0
	 n::numpaddiv
	 /::,
	 h::numpadsub
	 p::numpadmult
	 '::numpaddot
		#if

F19::NumpadSub
;F20 & F19::

;F20::Menu()


#IfWinActive,
return
;__________________________________________________________________
;_______________________________________________________Other stuff
;__________________________________________________________________
{ 
	CapsLock::return
	$enter::sendinput, {enter}
	F20::^m
	+F12::Exitapp
	F20 & \::Sendinput, mmignin{tab}Kilgore7744
	F19 & \::Sendinput, ?Kilgore7744
	#!\::Login()
	F20 & Right::send, #{right}
	F20 & Left::send, #{Left}
	F20 & UP::send, #{UP}
	F20 & Down::send, #{Down}
	#ifwinactive, NuGenesis LMS - \\Remote

F20::Mouse_Click("SearchBar_Batch")     
	; F15 & Wheelup::lwin
	; F15 & Wheeldown::Mouse_CloseWindow()



	#ifwinactive, ahk_exe Code.exe
	capslock::esc

	#IfWinActive,
	Numlock::BackSpace
	#IfWinActive, ahk_exe OUTLOOK.EXE ;____________________________________Outlook
	capslock::return


	#ifwinactive, ahk_exe explorer.exe ; _______________________explorer
	Mbutton::Open_in_Notepad()
	;________________________________________Firefox and Edge
	#IfWinActive, ahk_exe firefox.exe OR ahk_exe msedge.exe
	F15 & WheelDown::Mouse_wheel("^w")
	F13 & WheelDOWN::Browser_Back
	F14 & wheelUP::Browser_Forward
	;_________________________________________________________Snipper 
	#IfWinActive,  Paster - Snipaste ahk_exe Snipaste.exe

	F13 & Rbutton::Click, 2
	#IfWinActive,  Paster - Snipaste ahk_exe Snipaste.exe
	Mbutton::Sendinput, {click right}z1{click right}e{ctrl down}5{ctrl up}
}
#if




;__________________________________________________________________
;__________________________________________________________________Editors
;__________________________________________________________________ 


#IfWinActive, ahk_exe AHK-Studio.exe OR ahk_exe Code.exe
{
	Capslock & ,::^,
	Capslock & a::!^a
	^r::ReloadScript()
	+^j::+^down
	+^K::+^up
	+^l::sendinput, {home}{tab}
	+^h::sendinput, {home}+{tab}
	Mbutton::sendinput, ^d
	F17::Mouse_Wheel("!{left}",1500)
	F16::Mouse_Wheel("!{right}",1500)
	F14 & WheelDOWN::mouse_wheel("{ctrl down}{down}{ctrl up}")
	F14 & wheelUP::Mouse_wheel("^{up}")
	F14 & F13::sendinput, #{tab}
	F14 & Rbutton::sendinput, +^f
	F14 & Lbutton::sendinput, ^{click}
	F14::menu()
	Mbutton & Wheeldown::mouse_wheel("!{right}")
	Mbutton & Wheelup::mouse_wheel("!{left}")
	Mbutton & Rbutton::Mouse_wheel("{home}+{end}{backspace}")
	+Mbutton::+^d
	F18::ReloadScript()
	F3::+^F1 	;search Help
	^k::sendinput, ^{up}
	^j::sendinput, ^{down}
	Rbutton & F17::mouse_wheel("{shift down}{home}{shift up}{ctrl down}x{ctrl up}",1000)
	Rbutton & F16::mouse_wheel("{shift down}{end}{shift up}{ctrl down}x{ctrl up}",1000)
	Rbutton & Wheelup::mouse_wheel("{ctrl down}x{ctrl up}",4000)
	Rbutton & wheeldown::mouse_wheel("{ctrl down}v{ctrl up}",4000)
	Rbutton & Mbutton::sendinput, {click}{Home}+{end}^c
	$Rbutton::Click right
	capslock::sendinput, {esc}
	
	Rbutton & F18::Mouse_Get_WindowInfo()




; F14::
; 		Menu, codemenu, Add, Mouse Location `t%MousePosition%, codemenu	
; 		Menu, codemenu, Add, Window Title `t%wintitle%, codemenu	
; 		Menu, codemenu, Add, Process `t%winProcess% , codemenu	
; 		Menu, codemenu, Add, Control `t%winControl%, codemenu	
; 		Menu, codeMenu, Add, Test &1, codeMenu
; 		Menu, codeMenu, Add, Test &2, codeMenu
; 		Menu, codeMenu, Add, Test &3, codeMenu
; 		Menu, codeMenu, Add, F13, codeMenu
; 		Menu, codeMenu, Add, F14, codeMenu
; 		Menu, codeMenu, Add, F15, codeMenu
; 		Menu, codeMenu, Add, F16, codeMenu
; 		Menu, codeMenu, Add, F17, codeMenu
; 		Menu, codeMenu, Add, F18, codeMenu
; 		Menu, codeMenu, Add, Mbutton, codeMenu
; 		Menu, codeMenu, Add, Rbutton, codeMenu
; 		Menu, codeMenu, Add, Wheel, codeMenu
; 		menu, CodeMenu, show
; 		return

; CodeMenu:
; 	if A_thismenuitem contains Test &1
; 		TRY Test(1)	
; 	else if A_thismenuitem contains Test &2
; 		Try Test(2)	
; 	else if A_thismenuitem contains Test &3
; 		Try Test(3)	
; 	else if (A_thismenuitem = "F13")
; 			Sendinput, ^fF13`:`:{enter}
; 				else if (A_thismenuitem = "F13")
; 			Sendinput, ^fF13`:`:{enter}
; 				else if (A_thismenuitem = "F14")
; 			Sendinput, ^fF14`:`:{enter}
; 				else if (A_thismenuitem = "F15")
; 			Sendinput, ^fF15`:`:{enter}
; 				else if (A_thismenuitem = "F16")
; 			Sendinput, ^fF16`:`:{enter}
; 				else if (A_thismenuitem = "F17")
; 			Sendinput, ^fF17`:`:{enter}
; 				else if (A_thismenuitem = "F18")
; 			Sendinput, ^fF18`:`:{enter}
; 				else if (A_thismenuitem = "Mbutton")
; 			Sendinput, ^fMbutton{enter}
; 			else if (A_thismenuitem = "Rbutton")
; 			Sendinput, ^fRbutton{enter}
; 			else if (A_thismenuitem = "Wheel")
; 			Sendinput, ^fWheel`:`:{enter}
; 	else if A_thismenuItem contains Mouse Location `t%MousePosition%
; 		sendinput %MousePosition%
; 	else if A_thismenuItem contains Window Title `t%wintitle%
; 		Sendinput %WinTitle%
; 	else if A_thismenuItem contains Process `t%winProcess% 
; 		sendinput ahk_exe %WinProcess%
; 	else if A_thismenuItem contains Control `t%winControl%
; 		sendinput, %WinControl%
; 		else
; 		menu, Codemenu, deleteall

; return


}











#Ifwinactive, Find and Replace 
{
	capslock::return	
	enter::!i
}

#IfWinActive,
	Open_in_Notepad(){
	click
	WinGetClass class, % " ahk_id " WinExist("A")
	for Window in ComObjCreate("Shell.Application").Windows 
		Selection := Window.Document.SelectedItems
	for Items in Selection
		Path_to_Selection := Items.path		
	Run C:\Windows\system32\Notepad.exe %Path_to_Selection%
}


DoublePress(){
	if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 400) 
	{
		Sendinput, {%A_ThisHotkey%}
		return
	}
	return
}


Login(){
		sendinput, 4130220009588038
		trayTip, ,11/21  127
		return
	}

ReloadScript(){
		sendinput, ^s
		sleep 200
		run, VQuest.ahk
		tooltip("Reload")
	}

Vim_opened:
	#Persistent 
	#NoEnv
	#SingleInstance,Force
	SetKeyDelay, -1,-1
	#HotkeyModifierTimeout 100
	Setnumlockstate Alwayson
	setCapslockstate alwaysoff
	SetscrolllockState, alwaysOff
	Menu, Tray, Icon, ViM.ico
	;Process, Priority,, High
	;sendlevel 1
	#include <menu>
	return

