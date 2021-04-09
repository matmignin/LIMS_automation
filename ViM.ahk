gosub, Vim_opened

#ifwinactive, 
#If (A_PriorHotKey = "d" AND A_TimeSincePriorHotkey < 4000)
{
	d::Send, {home 2}+{end}{Delete}
	w::sendinput, {right}^{left}+^{right}{backspace}
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
	n::+!n
	u::+!up
	'::+^!n
	.::+F1
	up::^+up
	down::^+down
	/::sendinput, !^w
	5::^+/
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






#IfWinActive,
return
;__________________________________________________________________
_______________________________________________________Otherstuff:
;__________________________________________________________________
{ 
	Media_Next::tooltip(A_ThisHotkey)
	Browser_Back::tooltip(A_ThisHotkey)
	Browser_Forward::tooltip(A_ThisHotkey)
	Media_Prev::tooltip(A_ThisHotkey)

	Volume_Down::tooltip(A_ThisHotkey)
	Volume_Up::tooltip(A_ThisHotkey)
	#right::tooltip(A_ThisHotkey)
	^+!down::tooltip(A_ThisHotkey)
	CapsLock::return
	$enter::sendinput, {enter}

	+F12::Exitapp
	F20 & \::Sendinput, mmignin{tab}Kilgore7744
	F19 & \::Sendinput, ?Kilgore7744
	#!\::Login()
	F20 & Right::send, #{right}
	F20 & Left::send, #{Left}
	F20 & UP::send, #{UP}
	F20 & Down::send, #{Down}


	F20::LMS_autofill()
	; sendinput, ^s
		; sleep 200
		; run, VQuest.ahk
		; return
#If (A_PriorHotKey = "F19" AND A_TimeSincePriorHotkey < 4000)
{
	f19::Menu("Sheets")
	Wheelup::tooltip(A_ThisHotkey)
	Wheeldown::tooltip(A_ThisHotkey)
	wheelleft::tooltip(A_ThisHotkey)
	wheelright::tooltip(A_ThisHotkey)
	Lbutton::tooltip(A_ThisHotkey)
	Rbutton::tooltip(A_ThisHotkey)
	mbutton::tooltip(A_ThisHotkey)
}
	#If
F19::Tooltip("☩",4000) 




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
	#IfWinActive, ahk_exe firefox.exe || ahk_exe msedge.exe
	F15 & WheelDown::Wheel("^w")
	F13 & WheelDOWN::Browser_Back
	F14 & wheelUP::Browser_Forward
	Mbutton::sendinput, ^{click}
	;_________________________________________________________Snipper 
	#IfWinActive, Snipper - Snipaste ; the capture screen
	rbutton::Enter
	#IfWinActive,  Paster - Snipaste ahk_exe Snipaste.exe ; the floating window
	Mbutton & wheelUp::Wheel("{click right}z1{click right}e{ctrl down}5{ctrl up}")
	Mbutton::send, !{click}
	F13::sendinput, ^c

	
	F16::sendinput, ^+{+}
	F17::sendinput, ^+{-}
}
#if




#include <VScode>



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



Vim_opened:
	#Persistent 
	#NoEnv
	#KeyHistory 400
	#SingleInstance,Force
	SetKeyDelay, -1,-1
	#HotkeyModifierTimeout 100
	Setnumlockstate Alwayson
	setCapslockstate alwaysoff
	SetscrolllockState, alwaysOff
	Menu, Tray, Icon, ViM.ico
	;Process, Priority,, High
	;sendlevel 1
	Menu, Tray, Add, windowSpy, WindowSpySub 
Menu, Tray, Default, WindowSpy 

	return
	#include <menu>

WindowSpySub: 
  Run, WindowSpy.ahk,C:\Program Files\AutoHotkey\
Return

