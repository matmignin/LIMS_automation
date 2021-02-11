#If Getkeystate("Capslock","p")
1::F1
2::F2
3::F3
`::esc
Lctrl::winactivate, ahk_exe AHK-Studio.exe
j::down
k::up
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
	sendinput, {shift up}
return

Capslock & space::+^f
+F12::reload
+Capslock::
	GetKeyState("Capslock","p")
	sendinput, {shift up}
	return
CapsLock::send, {shift up}{alt up}{ctrl up}{win up}{esc}

#If (A_PriorHotKey = "Capslock & d" AND A_TimeSincePriorHotkey < 2000)
	d::Send, {home 2}+{end}^x{backspace}{delete}
	Capslock & d::Sendinput, {home 2}+{end}^x{delete}
	w::sendinput, {right}^{right}{left}+^{left}{backspace}
	Capslock & w::sendinput, {right}^{right}+^{left}{backspace}
	Capslock & 4::sendinput, +{end}^x
	4::sendinput, +{end}^x
	Capslock & 5::sendinput, ^m^x
	5::sendinput, ^m^x
	Capslock & 0::sendinput, +{home}^x
	0::sendinput, +{home}^

#If (A_PriorHotKey = "Capslock & y" AND A_TimeSincePriorHotkey < 2000)
	d::Send, {home 2}+{end}^c
	Capslock & d::Sendinput, {home 2}+{end}^c
	w::sendinput, {right}^{right}{left}+^{left}^c ;{right}
	Capslock & w::sendinput, ^{right}{left}+^{left}^c 
	sleep 200
	send, {right}
	return
	Capslock & 4::sendinput, +{end}^c
	Capslock & 5::sendinput, ^m^c
	5::sendinput, ^m^c
	4::sendinput, +{end}^c{right}
	Capslock & y::Send {home}+{end}{ctrl down}c{ctrl up}{right}
	y::Send {home}+{end}{ctrl down}c{ctrl up}{right}
	Capslock & 0::sendinput, +{home}^c
	0::sendinput, +{home}^c

#If (A_PriorHotKey = "Capslock & g" AND A_TimeSincePriorHotkey < 500)
	Capslock & g::Send, ^{home}
#if



Capslock & Space::SendInput ,{U+02713}
lalt & space::SendInput ,{U+02713}
#If WinActive("ahk_class AutoHotkeyGUI") && Getkeystate("Capslock","p") ;editor
	,::^j
	m::+!down
	n::+!up
	u::+!up
	'::+^!n
	k::up
	.::+F1
	up::^+up
	down::^+down
	/::sendinput, !^w
#if








/*
	
	Capslock & 1::F1
	Capslock & 2::F2
	Capslock & 3::F3
	Capslock & `::esc
	Capslock & Lctrl::winactivate, ahk_exe AHK-Studio.exe
	Capslock & j::down
	Capslock & k::up
	Capslock & h::left
	Capslock & l::right
	Capslock & x::Delete
	Capslock & 4::end
	Capslock & 0::home
	Capslock & y::return
	Capslock & d::return ; Send, {home 2}+{end}^x{delete}
	Capslock & p::Send {end}{enter}^v
	Capslock & w::Send {right}^{right 2}{left}
	Capslock & e::Send ^{right}{left}
	Capslock & u::Send ^z
	CapsLock & up::+up
	CapsLock & down::+down
	CapsLock & right::+right
	CapsLock & left::+left
	Capslock & b::^left
	;Capslock & g::Sendinput, ^{home}
	Capslock & 5::Send ^m
	Capslock & o::Send, {end}{enter}
	
	#If (A_PriorHotKey = "Capslock & d" AND A_TimeSincePriorHotkey < 2000)
		d::Send, {home 2}+{end}^x{backspace}{delete}
		Capslock & d::Sendinput, {home 2}+{end}^x{delete}
		w::sendinput, {right}^{right}{left}+^{left}{backspace}
		Capslock & w::sendinput, {right}^{right}+^{left}{backspace}
		Capslock & 4::sendinput, +{end}^x
		4::sendinput, +{end}^x
		Capslock & 5::sendinput, ^m^x
		5::sendinput, ^m^x
		Capslock & 0::sendinput, +{home}^x
		0::sendinput, +{home}^
	
	#If (A_PriorHotKey = "Capslock & y" AND A_TimeSincePriorHotkey < 2000)
		d::Send, {home 2}+{end}^c
		Capslock & d::Sendinput, {home 2}+{end}^c
		w::sendinput, {right}^{right}{left}+^{left}^c ;{right}
		Capslock & w::sendinput, ^{right}{left}+^{left}^c 
		sleep 200
		send, {right}
		return
		Capslock & 4::sendinput, +{end}^c
		Capslock & 5::sendinput, ^m^c
		5::sendinput, ^m^c
		4::sendinput, +{end}^c{right}
		Capslock & y::Send {home}+{end}{ctrl down}c{ctrl up}{right}
		y::Send {home}+{end}{ctrl down}c{ctrl up}{right}
		Capslock & 0::sendinput, +{home}^c
		0::sendinput, +{home}^c
	
	#If (A_PriorHotKey = "Capslock & g" AND A_TimeSincePriorHotkey < 500)
		Capslock & g::Send, ^{home}
	#if
		Capslock & g::send, ^{end}
	
	
	Capslock & Space::SendInput ,{U+02713}
	lalt & space::SendInput ,{U+02713}
	
		8::sendinput, 5
	#if
	#IfWinActive, ahk_class AutoHotkeyGUI
	Capslock & ,::send, ^j
	Capslock & m::+!down
	Capslock & n::+!up
	Capslock & u::+!up
	capslock & '::+^!n
	Capslock & v up::
	while GetKeyState("Capslock","p")
		sendinput, {Shift down}
		sendinput, {shift up}
	return
	
	Capslock & space::+^f
	+F12::reload
	+Capslock::
		GetKeyState("Capslock","p")
		sendinput, {shift up}
		return
	CapsLock::send, {shift up}{alt up}{ctrl up}{win up}{esc}
*/