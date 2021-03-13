;SetWorkingDir %A_ScriptDir%
#Persistent 
#NoEnv
#SingleInstance,Force
#InstallKeybdHook
;#HotkeyModifierTimeout 800
Setnumlockstate Alwayson
setCapslockstate alwaysoff
SetscrolllockState, alwaysOff
Menu, Tray, Icon, ViM.ico
Numlock::BackSpace
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
a::send, {Shift down}{shift up}{ctrl down}a{ctrl up}
#If Getkeystate("Capslock","p")
1::F1
2::F2
3::F3
`::esc
;/::RightClickText()
Enter::sendinput, +^enter

Lctrl::winactivate, ahk_exe AHK-Studio.exe
j::sendinput, {down}
k::sendinput, {Up}
h::left
l::right
x::Delete
space::sendinput, {down}
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

;Capslock & space::+^f

+Capslock::
GetKeyState("Capslock","p")
sendinput, {shift up}
return

#If (A_PriorHotKey = "d" AND A_TimeSincePriorHotkey < 2000)
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

#If (A_PriorHotKey = "y" AND A_TimeSincePriorHotkey < 2000)
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
		
		#If (A_PriorHotKey = "g" AND A_TimeSincePriorHotkey < 500)
		Capslock & g::Send, ^{home}
		#if
		
		
		
		Capslock & Space::SendInput ,{U+02713}
		;lalt & space::SendInput ,{U+02713}
		
		#if
		
		CapsLock::esc ;send, {shift up}{alt up}{ctrl up}{win up}{esc}
		
		
		;#include Apps\AhkStudio.ahk
		
		
		#IfWinActive, ahk_exe AHK-Studio.exe 
		F19::Sendinput, %MousePosition%
		F20::Sendinput, %WindowTitle%
		;F13::return
		Mbutton::
		{
			Click, 3
			send, ^c
			return
		}
		Enter::sendinput, {enter}
		;F13 & wheelright::
		;Sendinput, ^x
		;ClipWait, 1
		;AHKClipboard := Clipboard
		;return
		;F13 & wheelleft::send, %ahkclipbard%
		;wheelright::WHeelright()
		;wheelleft::WheelLeft()
		F1::
		F2::
		F3::
		F4::
		F12::
		F11::
		DoublePress()
		return

		
		;f15 & lbutton::SaveRestart()
		Rbutton & F13::backspace
		
		
		Rbutton::
		{
			suspend, On
			sleep 30
			send, {Rbutton}
			sleep 500
			suspend, Off
			return
		}
		
		Media_Prev::+^F1
		F3::+^F1 					;search Help
		
		Rbutton & F15::Send, %WindowTitle%
		RButton & wheelright::delete
		Rbutton & F14::Send, %MousePosition%
		Rbutton & Wheelleft::Backspace
		F13 & Mbutton::send, F9{enter}
		;F14 & Wheeldown::Mouse_WheelZoomOut()
		;F14 & wheelup::Mouse_WheelZoomIn()
		;+enter::SaveRestart() 
		#ifwinactive,
		
		
		DoublePress()
		{
			if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 400) 
			{
				Sendinput, {%A_ThisHotkey%}
				return
			}
			return
		}
		SaveRestart()
		{
			WinActivate, AHK Studio ahk_exe AHK-Studio.exe
			WinMenuSelectItem, ahk_class AutoHotkeyGUI ahk_exe AHK-Studio.exe, ,1&, 7& ; run in AHK Stuidio
			sleep 100
			reload
			return
		}
		SaveRerun()
		{
			WinMenuSelectItem, ahk_class AutoHotkeyGUI ahk_exe AHK-Studio.exe, ,4&, 8& ; run in AHK Stuidio
			return
		}