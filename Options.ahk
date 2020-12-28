
#IfWinActive,  ;}
#Include Excel.ahk
#Include Editor.ahk
#Include OneNote.ahk
#include Other Apps.ahk
	Ralt & \::
    PrintScreen::
    numpaddot & NumpadEnter::Send,mmignin{tab}Kilgore7744
    NumpadDot::Send,.

VIM:
    Capslock & j::down
    Capslock & k::up
    Capslock & h::left
    Capslock & l::right
    Capslock & x::Delete
    Capslock & 6::end
    Capslock & 0::home
    Capslock & d::Send {home}+{end}{ctrlDown}x{ctrlup}{backspace}
    Capslock & y::Send {home}+{end}^c{right}
    Capslock & p::Send {end}{enter}{ctrlDown}v{ctrlup}
    Capslock & w::Send {ctrlDown}{right 2}{left}{ctrlup}
    Capslock & e::Send {ctrlDown}{right}{ctrlup}{left}
    Capslock & u::Send {ctrlDown}z{ctrlup}
    Capslock & b::Send {ctrlDown}{left}{ctrlup}
    Capslock & 5::Send {ctrlDown}e{ctrlup}
    Capslock & o::Send, {end}{enter]
    Capslock & Space::winactivate, ahk_exe SciTE.exe
    F5::sendinput,{shift up}
    CapsLock::send,{esc}
    lalt & space::SendInput ,{U+02713}
    lalt & x::SendInput,{U+2717}
    lalt & v::sendinput,#v
    lalt & z::SendInput,{U+2757}
    lalt & c::SendInput,{U+2753}
    lwin & w::sendinput,^w
    lwin & c::sendinput,^c
    lwin & x::sendinput,^x
    lwin & z::sendinput,^z
    lwin & y::sendinput,^y
    lwin & a::sendinput,^a
    lwin & v::sendinput,^v
    lwin & s::sendinput,^s
    lwin & r::sendinput,^r
    lwin & f::sendinput,^f   
    lwin & Space::PrimaryApp()
    Rwin & Space::PrimaryApp()
    Lwin::lwin
enter::enter
;}	     							     

