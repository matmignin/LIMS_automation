#Persistent 
#NoEnv
#SingleInstance,Force
Setnumlockstate Alwayson
setCapslockstate alwaysoff
SetscrolllockState, alwaysOff
Menu, Tray, Icon, lib\ViM.ico 
#Ifwinactive,
alt::return
;lwin::return
return


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
Capslock & w::Send ^{right 2}{left}
Capslock & e::Send ^{right}{left}
Capslock & u::Send ^z
Capslock & b::Send ^{left}
;Capslock & g::Sendinput, ^{home}
Capslock & 5::Send ^m
Capslock & o::Send, {end}{enter}

#If (A_PriorHotKey = "Capslock & d" AND A_TimeSincePriorHotkey < 2000)
d::Send, {home 2}+{end}^x{delete}
Capslock & d::Sendinput, {home 2}+{end}^x{delete}
w::sendinput, ^{right}+^{left}{backspace}
Capslock & w::sendinput, ^{right}+^{left}{backspace}
Capslock & 4::sendinput, +{end}^x
4::sendinput, +{end}^x
Capslock & 5::sendinput, ^m^x
5::sendinput, ^m^x
Capslock & 0::sendinput, +{home}^x
0::sendinput, +{home}^x

#If (A_PriorHotKey = "Capslock & y" AND A_TimeSincePriorHotkey < 2000)
d::Send, {home 2}+{end}^c
Capslock & d::Sendinput, {home 2}+{end}^c
w::sendinput, ^{right}+^{left}
Capslock & w::sendinput, ^{right}+^{left}^c
Capslock & 4::sendinput, +{end}^c
Capslock & 5::sendinput, ^m^c
5::sendinput, ^m^c
4::sendinput, +{end}^c
Capslock & y::Send {home}+{end}{ctrl down}c{ctrl up}{right}
y::Send {home}+{end}{ctrl down}c{ctrl up}{right}
Capslock & 0::sendinput, +{home}^c
0::sendinput, +{home}^c

#If (A_PriorHotKey = "Capslock & g" AND A_TimeSincePriorHotkey < 500)
Capslock & g::Send, ^{home}
#if
Capslock & g::send, ^{end}


Capslock & Space::SendInput ,{U+02713}
CapsLock::send,{esc}
lalt & space::SendInput ,{U+02713}
;lwin & z::SendInput,{U+2757}
;lwin & c::SendInput,{U+2753}

#IfWinActive, ahk_class AutoHotkeyGUI
Capslock & ,::send, ^j
Capslock & m::+!down
Capslock & n::+!up
Capslock & u::+!up
capslock & '::+^!n
Capslock & v::+!^s
Capslock & space::+^f

return
