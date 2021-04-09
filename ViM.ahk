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
	 m::numpad1
	 ,::numpad2
	 .::numpad3
	 j::numpad4
	 k::numpad5
	 l::numpad6
	 u::numpad7
	 i::numpad8
	 o::numpad9
	 `;::numpad0
	 n::numpaddiv
	 /::,
	 h::numpadsub
	 p::numpadmult
	 '::numpaddot
	;  ,::numpad1
	;  .::numpad2
	;  k::numpad4
	;  /::numpad3
	;  l::numpad5
	;  `;::numpad6
	;  i::numpad7
	;  o::numpad8
	;  p::numpad9
	;  '::numpad0
	;  m::numpaddiv
	;  j::numpadsub
	;  [::numpadmult
		#if
#IfWinActive,

	F20 & \::Sendinput, mmignin{tab}Kilgore7744
	F19 & \::Sendinput, ?Kilgore7744
	#!\::Login()

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
	#SingleInstance,Force
	SetKeyDelay, -1,-1
	#HotkeyModifierTimeout 100
	Setnumlockstate Alwayson
	setCapslockstate alwaysoff
	SetscrolllockState, alwaysOff
	Menu, Tray, Icon, ViM.ico
	Process, Priority,, High
	;sendlevel 1
	Menu, Tray, Add, windowSpy, WindowSpySub 
Menu, Tray, Default, WindowSpy 
return
WindowSpySub: 
  Run, WindowSpy.ahk,C:\Program Files\AutoHotkey\
Return

