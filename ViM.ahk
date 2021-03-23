gosub, Vim_opened


#If (A_PriorHotKey = "d" AND A_TimeSincePriorHotkey < 4000)
{
	d::Send, {home 2}+{end}^x{backspace}
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



#If WinActive("ahk_class AutoHotkeyGUI") && Getkeystate("Capslock","p") ;editor
{
	,::sendinput, {ctrl down}{/}{ctrl up}
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



#ifwinactive,
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
	#!\::
	{
		sendinput, 4130220009588038
		trayTip, ,11/21  127
		return
	}
	F20 & Right::send, #{right}
	F20 & Left::send, #{Left}
	F20 & UP::send, #{UP}
	F20 & Down::send, #{Down}
	; F15 & Wheelup::lwin
	; F15 & Wheeldown::Mouse_CloseWindow()

	#ifwinactive, ahk_exe Code.exe
	capslock::esc

	#IfWinActive,
	Numlock::BackSpace
	#ifwinactive,  outlook
	capslock::return


	#ifwinactive, ahk_exe explorer.exe ; _______________________explorer
	Mbutton::Open_in_Notepad()
	;________________________________________Firefox and Edge
	#IfWinActive, ahk_exe firefox.exe OR ahk_exe msedge.exe
	F15 & WheelDown::
	send, ^w
	sleep 500
	return
	F13 & WheelDOWN::Browser_Back
	F14 & wheelUP::Browser_Forward
	;_________________________________________________________Snipper 
	#IfWinActive,  Paster - Snipaste ahk_exe Snipaste.exe

	F13 & Rbutton::Click, 2
	#IfWinActive,  Paster - Snipaste ahk_exe Snipaste.exe
	Mbutton::Sendinput, {click right}z1{click right}e{ctrl down}5{ctrl up}
}#if
;__________________________________________________________________
;__________________________________________________________________Editors
;__________________________________________________________________
#IfWinActive, ahk_exe AHK-Studio.exe OR ahk_exe Code.exe
{
	Capslock & ,::^j
	Capslock & a::!^a
	^r::sendinput, ^s
		reload
		return
	+^j::+^down
	+^K::+^up
	+^l::sendinput, {home}{tab}
	+^h::sendinput, {home}+{tab}
	Mbutton::sendinput, ^d
	F17::Mouse_Wheel("+{right}",0)
	F16::Mouse_Wheel("+{left}",0)
	F14 & WheelLEFT::mouse_wheel("{home}+{tab}")
	F14 & WheelRIGHT::mouse_wheel("{home}+{tab}")
	F14 & WheelDOWN::mouse_wheel("{alt down}j{alt up}")
	F14 & wheelUP::Mouse_wheel("{alt down}k{alt up}")
	F14::sendinput, +^f
	Mbutton & Wheeldown::mouse_wheel("!{right}")
	Mbutton & Wheelup::mouse_wheel("!{left}")

	F3::+^F1 	;search Help
	F19 & h::!h
	F19 & m::^M
	F19::sendinput, !f
	^k::sendinput, +^{up}
	^j::sendinput, +^{down}
	Rbutton & F16::mouse_wheel("+{home}{delete}")
	Rbutton & F17::mouse_wheel("+{end}{Backspace}")
	Rbutton & Wheelup::mouse_wheel("{ctrl down}x{ctrl up}")
	Rbutton & wheeldown::mouse_wheel("{ctrl down}p{ctrl up}")
	$Rbutton::Click right
	capslock::sendinput, {esc}
}
#Ifwinactive, Find & Replace 
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
	Process, Priority,, High
	sendlevel 1
	return
