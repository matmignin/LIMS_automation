

; #IfWinActive, ahk_exe Code.exe
#if MouseClip && winactive("ahk_exe Code.exe")
	Mbutton::                                    clip.Click()
#if Getkeystate("LControl","p")
	; ^z::                                      send,{ctrldown}{z}{ctrlup}
	z::                                      send,{ctrldown}{z}{ctrlup}
	n:: 													send, {altdown}{ctrldown}{g}{ctrlup}{altup}
	l::                                      send, {ctrldown}{]}{ctrlup}
	h::                                        send, {ctrldown}{[}{ctrlup}
	+z::                                       send, {shiftup}{Ctrldown}{y}{CtrlUp}
#if

#IfWinActive, ahk_exe Code.exe
	; ^wheeldown::Block(400, "{down}")
		; if N
	; wheelDown::return
	; wheelup::return
	; #if
	; ^wheelup::return
	F20 & .:: 												Send, {ctrldown}{f}{ctrlup}%wintitle%
	F15 & tab::                                  send, {ctrldown}{]}{ctrlup}	
	numpadsub::                                  numpadsub
	numpadadd::                                  numpadadd
	numpadmult::                                 send, {shiftdown}{altdown}{lwindown}{up}{-}{lwinup}{altup}{shiftup}
	numpaddot::                                  numpaddot
	^numpaddot::                                 send, {ctrldown}{w}{ctrlup}
	Mbutton::                                    3Tap() 
	F19 up::                                     send, {F19}
	; f8::                                         send, {ctrldown}{d}{ctrlup}

	$Lwin Up::                                   Send, {shiftdown}{altdown}{i}{lwinup}{altup}{shiftup}
	Tab & h::                                    send, {ctrldown}{[}{ctrlup}
	Tab & l::                                    send, {ctrldown}{]}{ctrlup}
	Tab & j::                                    down
	Tab & k::                                    up
	Tab & f13::                                  send, {shiftdown}{altdown}{lwindown}{4}{lwinup}{altup}{shiftup}
	Tab & 1::                                    send, {tab 8}
	tab & space::											send, {shiftdown}{altdown}{lwindown}{0}{lwinup}{altup}{shiftup}
	Tab & 2::                                    send, {tab 10}
	Tab & 3::                                    send, {tab 12}
	Tab & 4::                                    send, {tab 14}
	Tab & 5::                                    send, {tab 26}
	Tab & 6::                                    send, {tab 20}
	Tab & `::                                    send, {shiftdown}{altdown}{lwindown}{``}{lwinup}{altup}{shiftup}
	Tab & F15::                                  send, {ctrldown}{[}{ctrlup}
	;F14::                                        ReloadScript()
	` & Tab::                                    send, {shiftdown}{altdown}{lwindown}{q}{lwinup}{altup}{shiftup}
	Tab & q::                                    send, {ctrldown}{]}{ctrlup}
	q & tab::                                    send, {ctrldown}{[}{ctrlup}
	q & u::													sendinput, {q}{u
	q::q
	; `::   																				send, {``}
	$^F::                                         
		tt("`n ----Find------- `n",1000,A_CaretX,A_Carety)
		send, {ctrldown}{f}{ctrlup}
		return
	$F6::                                         F6
	$F7::                                         F7
	; $F8::                                         F8
	$F9::                                         F9
	tab & f::                                    sendinput,{shiftdown}{altdown}{ctrldown}{]}{ctrlup}{altup}{shiftup}
	tab::                                        tab
	; `::                                          send, {``}
	!t::                                         TT(trackpadhints,5000)
	<^r::                                        reloadscript()
	<^t::                                        reloadscript()
	LCtrl & Appskey::                            return
	<^f19::                                      send,{shiftdown}{ctrldown}{tab}{ctrlup}{shiftup}
	^Lshift::                                    send, {ctrldown}{y}{ctrlup}
	; Lshift::                                     DoublePress("{ctrldown}{F6}{ctrlup}",,"Backward")
	; Rshift::                                     DoublePress("{ctrldown}{F7}{ctrlup}",,"Forward")
	; LCtrl j::                                   doublepress("{altdown}{shiftdown}{up}{shiftup}{altup}")
	Lwin & Appskey::                             return
	Lalt & Appskey::                             return
	Lwin::                                       doublepress("{altdown}{shiftdown}{up}{shiftup}{altup}+{2}")
	rshift & space::                             send,{shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
	<^lwin::                                     delete
	<+space::                                    send,{shiftdown}{altdown}{ctrldown}{e}{ctrlup}{altup}{shiftup}
	; rbutton up::                                 click R
	^s::                                         sendinput, {ctrldown}{end}{ctrlup}
	f9 & f6::                                    return
	F20 & h::                                    send, {shiftdown}{altdown}{lwindown}{left}{lwinup}{altup}{shiftup}
	F21 & h::                                    send, {shiftdown}{altdown}{lwindown}{left}{lwinup}{altup}{shiftup}
	F20 & k::                                    send, {shiftdown}{altdown}{lwindown}{up}{lwinup}{altup}{shiftup}
	F20 & backspace::                            delete
	F21 & backspace::                            delete
	F21 & k::                                    send, {shiftdown}{altdown}{lwindown}{up}{lwinup}{altup}{shiftup}
	F20 & j::                                    send, {shiftdown}{altdown}{lwindown}{down}{lwinup}{altup}{shiftup}
	F21 & j::                                    send, {shiftdown}{altdown}{lwindown}{down}{lwinup}{altup}{shiftup}
	F20 & l::                                    send, {shiftdown}{altdown}{lwindown}{right}{lwinup}{altup}{shiftup}
	F21 & l::                                    send, {shiftdown}{altdown}{lwindown}{right}{lwinup}{altup}{shiftup}
	F20 & Right::                                WinMove, ahk_exe Code.exe, , 1858, -1080, 1642, 1087
	F21 & Right::                                WinMove, ahk_exe Code.exe, , 1858, -1080, 1642, 1087
	F20 & Down::                                 WinMove, ahk_exe Code.exe, , 603, 14, 1963, 1354
	F21 & Down::                                 WinMove, ahk_exe Code.exe, , 603, 14, 1963, 1354
	F19 & left::                                 send, {shiftdown}{lwindown}{altdown}{left}{altup}{lwinup}{shiftup}
	F19 & up::                                   send, {shiftdown}{lwindown}{altdown}{up}{altup}{lwinup}{shiftup}
	F19 & down::                                 send, {shiftdown}{lwindown}{altdown}{down}{altup}{lwinup}{shiftup}
	F19 & right::                                send, {shiftdown}{lwindown}{altdown}{right}{altup}{lwinup}{shiftup}
	F19 & -::                                    send, {ctrldown}{-}{ctrlup}
	F19 & =::                                    send, {ctrldown}{=}{ctrlup}
	F19 & y::                                    send, {ctrldown}{w}{ctrlup}
	F19 & /::                                    send, {shiftdown}{altdown}{ctrldown}{/}{ctrlup}{altup}{shiftup}
	F19 & i::                                    send, {F9}@
	F19 & o::                                    send, {F9}
	F19 & p::                                    send, ^{F9}
	F19 & F9::                                   send, ^{F9}
	F19 & lbutton::                              send, ^{click}
	F19 & Enter::											Send, {ctrldown}{enter}{ctrlup}
	F19 & j::                                    send, {shiftdown}{altdown}{lwindown}{down}{lwinup}{altup}{shiftup}
	F19 & l::                                    send, {shiftdown}{ctrldown}{pgdn}{ctrlup}{shiftup}
	F19 & h::                                    send, {shiftdown}{ctrldown}{pgup}{ctrlup}{shiftup}
	f19 & `::                                    send, ~
	F19 & k::                                    send, {shiftdown}{altdown}{lwindown}{up}{lwinup}{altup}{shiftup}
	f19 & r::                                    send, %process%
	f19 & c::                                    send, %mouseposition%
	f19 & t::                                    send, %wintitle%
	f19 & w::                                    send, %wininfo%
	f19 & n::                                    send, {shiftdown}{altdown}{lwindown}{m}{lwinup}{altup}{shiftup} ;navigate bookmarks
	f19 & f6::                                   send,{ctrldown}{[}{ctrlup}
	f19 & f7::                                   send,{ctrldown}{]}{ctrlup}
	F19 & 7::												GotoError()
	F13 & `::												delete
	F13 & F11::                                  WindowInfo()
	F13 & tab::												send, {shiftdown}{altdown}{lwindown}{1}{lwinup}{altup}{shiftup}
	F13 & lshift::											send, {shiftdown}{altdown}{ctrldown}{F7}{ctrlup}{altup}{shiftup}

	F13::                                       send, {shiftdown}{altdown}{ctrldown}{6}{ctrlup}{altup}{shiftup}
	F19::                                        ^c
	
	
	#ifwinactive

F13_Control: 
#If Getkeystate("F13","p") && Getkeystate("LControl","p")
	; 5::                                        send,{shiftdown}{ctrldown}{/}{ctrlup}{shiftup}
	j::                                          send,{shiftdown}{down}{shiftup}
	l::                                          send,{shiftdown}{right}{shiftup}
	i::														send,{shiftdown}{altdown}{lwindown}{i}{lwinup}{altup}{shiftup}
	h::                                          send,{shiftdown}{left}{shiftup}
	k::                                          send,{shiftdown}{up}{shiftup}
	w::                                          send,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}
	b::                                          send,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}
	o::                                          Send,{Home}{enter}{up}
	0::                                          send,{shiftdown}{Home 2}{shiftup}
	6::                                          send,{shiftdown}{Home}{shiftup}
	t::														send,{F9}test.ahk{enter}
	4::                                          send,{shiftdown}{end}{shiftup} 
	<^m::                                        send,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup}
	v::                                          send,{shiftdown}{altdown}{lwindown}{v}{lwinup}{altup}{shiftup}
	<^v::                                        send,{shiftdown}{altdown}{lwindown}{v}{lwinup}{altup}{shiftup}
	<^u::                                        send,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup}
	^m::                                         send,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup}
	m::                                          send,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup}
	tab::														Send,{shiftdown}{altdown}{lwindown}{]}{lwinup}{altup}{shiftup}						
	u::                                          send,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup}
	^u::                                         send,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup}
	F19::                                        send,{shiftdown}{ctrldown}{altdown}{f6}{altup}{ctrlup}{shiftup} ;previous suggestion
	'::                                          send {shiftdown}{ctrldown}{r}{ctrlup}{shiftup}
	p::														send,{home}{enter}{up}{ctrldown}{v}{ctrlup}
	Space::                                      send,{shiftdown}{altDown}{a}{shiftup}{altup}{shiftdown}{ctrldown}{]}{ctrlup}{shiftup}
	q::                                          send,{shiftdown}{altdown}{,}{altup}{shiftup}
	g::                                          send,{shiftdown}{lwindown}{g}{lwinup}{shiftup}
	; z::                                          Send,{shiftdown}{altdown}{ctrldown}{z}{ctrlup}{altup}{shiftup}
			; ^z::                                      send,{ctrldown}{z}{ctrlup}
		; z::                                      send,{ctrldown}{z}{ctrlup}
	f::                                          send,{shiftdown}{altdown}{ctrldown}{f}{ctrlup}{altup}{shiftup}
	,::                                          send,{shiftdown}{altdown}{ctrldown}{,}{ctrlup}{altup}{shiftup} ;block comment
	#If 
#If Getkeystate("F13","p") && Getkeystate("Lshift","p")
	F13_SHIFT:    
	k::                                          send, {up 10}
	+k::                                        	send, {up 10}
	j::                                          send, {down 10}
	+j::                                        	send, {down 10}
	Tab & 1::                                    send, {tab 8}
	Tab & 2::                                    send, {tab 10}
	Tab & 3::                                    send, {tab 12}
	Tab & 4::                                    send, {tab 14}
	Tab & 5::                                    send, {tab 26}
	Tab & 6::                                    send, {tab 20}
Vim:
	#If (Getkeystate("F13","p") && A_PriorHotKey = "d" AND A_TimeSincePriorHotkey < 800) ;Vim Delete
		w::                                       send, {shiftdown}{altdown}{ctrldown}{7}{ctrlup}{altup}{shiftup}
		4::                                       send, +{end}^{x}
		5::                              			Send, {shiftdown}{ctrldown}{lwindown}{d}{lwinup}{ctrlup}{shiftup}
		d::                                       Send, {shiftdown}{ctrldown}{lwindown}{d}{lwinup}{ctrlup}{shiftup}
		[::                                       send, {shiftdown}{altDown}{ctrldown}{9}{ctrlup}{altup}{shiftup}{delete}
		]::                                       send, {shiftdown}{altDown}{ctrldown}{9}{ctrlup}{altup}{shiftup}{delete}
	#If (Getkeystate("F13","p") && A_PriorHotKey = "y" AND A_TimeSincePriorHotkey < 800)
		d::                                    Send,{home 2}+{end}^x
		; w::                                         send,{right}{ctrldown}{left}{shiftdown}{right}{shiftup}{c}{Ctrlup}
		5::                                       send, ^m^c
		4::                                       send, +{end}^c{esc}{F5 2}
		y::                                       send,{home}+{end}^c{esc}{F5 3}
		w::                                       send,{shiftdown}{altDown}{ctrldown}{s}{altup}{shiftup}{c}{Ctrlup}{esc}{F5 2}
		0::                                       send, +{home}^c{esc}{F5 2}
	#If (Getkeystate("F13","p") && A_PriorHotKey = "v" AND A_TimeSincePriorHotkey < 500)
			w::                                          send,{F17}
		#If (Getkeystate("F13","p") && A_PriorHotKey = "g" AND A_TimeSincePriorHotkey < 500)
			g::                                          send, {shiftdown}{ctrldown}{end}{ctrlup}{shiftup}
		#If (Getkeystate("F13","p") && A_PriorHotKey = "p" AND A_TimeSincePriorHotkey < 500)
		p::																						send, ^z{end}{enter}{ctrldown}{v}{ctrlup}
		#if
	#If Getkeystate("F13","p")
		p::                                       ^v
		y::                                       ^c 
		Rshift::                                  send,{pgdn}
		f19 & lbutton::                           send,^{lbutton}
		9 & 0::												send, {)}
		s::                                       send, {home}+{end}
		space::                                   send, {shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
		]::                                       send,{}}
		[::                                       send,{ctrldown}{right}{ctrlup}{{}
		9::                                       send,{(}
		0::                                       send, {Home 2}
		f::                                       Vim.Find()
		n::                                       send, {altdown}{ctrldown}{g}{ctrlup}{altup}
		F19::                                     send, {shiftdown}{ctrldown}{altdown}{f7}{altup}{ctrlup}{shiftup} ; next sugjesstion
		f20::                                     pgdn
		f21::                                     pgdn
		q::                                       send, {altdown}{,}{altup}
		1::                                       F1
		2::                                       F2
		w::                                       ^Right
		e::                                       Send, ^{right}{altdown}{ctrldown}{h}{ctrlup}{altup}
		a::                                       send,{altDown}{ctrldown}{a}{ctrlup}{altup}
		v::                                       send, {shiftdown}{altdown}{ctrldown}{v}{ctrlup}{altup}{shiftup}
		j::                                       send, {down}
		k::                                       send, {Up}
		; t::                                       send, {altdown}{down}{altup}
		t::														send, {F9}test.ahk{ctrldown}{enter}{ctrlup}
		h::                                       send, {left}
		l::                                       send, {right}
		x::                                       send, {Delete}
		g::                                       send, {ctrldown}{end}{ctrlup}
		6::                                       send, {HOME}
		4::                                       send, {End}
		d::                                       return
		b::                                       send,{ctrldown}{left}{Ctrlup}
		o::                                       Send,{end}{enter}
		,::                                       send,{Altdown}{ctrldown}{/}{ctrlup}{altup}
		; `::                                       send {shiftdown}{altdown}{ctrldown}{r}{ctrlup}{altup}{shiftup}
		m::                                       Send,{shiftdown}{ctrldown}{altDown}{]}{Ctrlup}{altup}{shiftup}
		u::                                       send,{shiftdown}{ctrldown}{altDown}{[}{altup}{Ctrlup}{shiftup}
		up::                                      send,{Altdown}{shiftdown}{ctrldown}{up}{shiftup}{ctrlup}{altup}
		'::  													vim.GoToLine()
		`;::                                      Send, :
		i::                                       send,{ctrldown}{i}{Ctrlup}
		5::                                       send,{shiftdown}{5}{shiftup}
		; `::                                       Vim.ChangeSelection()
		r::                                       Vim.ChangeSelection()
		Enter::                                   send,{shiftdown}{enter}{shiftup}
		!F::                                      openapp.Firefox()
		^space::                                  send,{shiftdown}{altdown}{ctrldown}{5}{ctrlup}{altup}{shiftup}
		lshift::                                  Send,{pgup}
		<^right::                                 send,{ctrldown}{]}{ctrlup}
		<^down::                                  send,{ctrldown}{down}{ctrlup}
		<^left::                                  send,{ctrldown}{[}{ctrlup}
		<^up::                                    send,{ctrldown}{up}{ctrlup}
		+o::                                      Send,{Home}{enter}
		^e::                                      Send,+^{right}
		^j::                                      send,{shiftdown}{down}{shiftup}
		^z::                                      send,{ctrldown}{z}{ctrlup}
		^l::                                      send,{shiftdown}{right}{shiftup}
		^h::                                      send,{shiftdown}{left}{shiftup}
		^k::                                      send,{shiftdown}{up}{shiftup}
		^w::                                      send,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}
		^b::                                      send,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}
		^o::                                      Send,{Home}{enter}
		^0::                                      send,{shiftdown}{Home}{shiftup}
		^4::                                      send,{shiftdown}{end}{shiftup} 
		#if
		#IfWinActive
; F13 UP:: 													send, {esc}{ctrlup}{altup}{shiftup}


; ============================= psudonumpad(){}
	
_PsudoNumpad:
	#If Getkeystate("F19","p")
	0::                                         	send,{-}
	m::                                          numpad1
	,::                                          numpad2
	.::                                          numpad3
	j::                                          numpad4
	k::                                          numpad5
	l::                                          numpad6
	u::                                          numpad7
	n::                                          numpad1
	i::                                          numpad8
	o::                                          numpad9
	`;::                                         send,{numpad0}
	; n::                                        numpaddot
	y::                                          numpaddot
	; b::                                        down
	/::                                          numpad0
	p::                                          numpad0
	=::                                          =
	-::                                          -
	h::                                          left
	'::                                          right
	Backspace::                                  backspace
	ENTER::                                      send,{enter}
	RShift::                                     send,{Tab}
	#if

_VSCODE_Hotstrings:
	:*r:cd`;::{ctrldown}
	:*r:cu`;::{ctrlup}
	:*r:ad`;::{altdown}
	:*r:au`;::{altup}
	:*r:sd`;::{shiftdown}
	:*r:su`;::{shiftup}
	:*r:wd`;::{lwindown}
	:*r:wu`;::{lwinup}
	:*R:wt`;::
	send, %wintitle%
	return
	:*R:wm`;::                                   
	send, %wininfo%
	return
	:*R:wp`;::                                   
	send, %process%
	return
	:*R:mp`;::                                   
	send, %mouseposition%
	return
	:*R:wc`;::                                   
	send, %Wincontrol%
	return
	:*R:tt`;::                                    
	sendinput, tt(){left} 
	return 
	:*R:hs`;::                                   
	InputBox, UserInput, New Hotstring,enter Hotstring,,,,,,,, 
	sendinput, {end}{return}:`*R:%UserInput%``;::`n`t`t`t`t`t`t`t`t`t`t`tsendinput`, {enter}return{up}{end}{shiftup}{ctrldown}{v}{ctrlup}
	return 
	:*R:we`;::                                   
	sendinput, WinExist(`"`"){left 2} 
	return 
	:*R:wa`;::                                    
	sendinput, WinActive(`"`"){left 2} 
	return 
	:*R:tr`;::                                   
	sendraw, tt("")
	sendinput, {left 2} 
	return 
	:*R:c`;::                                                   
	sendraw,{ctrldown}{}{ctrlup}
	sendinput,{left 9}
	return
	:*R:w`;::                                                  
	sendraw,{lwindown}{}{lwinup}
	sendinput,{left 9}
	return
	:*r:a`;::                                                  
	sendraw,{altdown}{}{altup}
	sendinput,{left 8}
	return
	:*r:s`;::                                                  
	sendraw,{shiftdown}{}{shiftup}
	sendinput,{left 10}
	return
	:*r:csw`;::                                              
	:*r:cws`;::                                              
	:*r:scw`;::                                              
	:*r:swc`;::                                              
	:*r:wcs`;::                                              
	:*r:wsc`;::                                              
	sendraw,{shiftdown}{ctrldown}{lwindown}{}{lwinup}{ctrlup}{shiftup}
	sendinput,{left 26}
	return
	:*r:asw`;::                                              
	:*r:aws`;::                                              
	:*r:saw`;::                                              
	:*r:swa`;::                                              
	:*r:was`;::                                              
	:*r:wsa`;::                                              
	sendraw,{shiftdown}{altdown}{lwindown}{}{lwinup}{altup}{shiftup}
	sendinput,{left 25}
	return
	:*r:asc`;::                                              
	:*r:acs`;::                                              
	:*r:sac`;::                                              
	:*r:sca`;::                                              
	:*r:cas`;::                                              
	:*r:csa`;::                                              
	sendraw,{shiftdown}{altdown}{ctrldown}{}{ctrlup}{altup}{shiftup}
	sendinput,{left 25}
	return
	:*r:sc`;::                                                
	:*r:cs`;::                                                
	sendraw,{shiftdown}{ctrldown}{}{ctrlup}{shiftup}
	sendinput,{left 18}
	return
	:*r:sw`;::                                                
	:*r:ws`;::                                                
	sendraw,{shiftdown}{lwindown}{}{lwinup}{shiftup}
	sendinput,{left 18}
	return
	:*r:sa`;::                                                
	:*r:as`;::                                                
	sendraw,{shiftdown}{altdown}{}{altup}{shiftup}
	sendinput,{left 17}
	return
	:*r:ca`;::                                                
	:*r:ac`;::                                                
	sendraw,{altdown}{ctrldown}{}{ctrlup}{altup}
	sendinput,{left 16}
	return
	:*r:wa`;::                                                
	:*r:aw`;::                                                
	sendraw,{altdown}{lwindown}{}{lwinup}{altup}
	sendinput,{left 16}
	return
	:*R:main`;::                                            
	sendraw, NuGenesis LMS - \\Remote
	return
	:*:lms`;::ahk_exe WFICA32.EXE                                         
	sendraw, ifwinactive, 
	return
	:*R:ifwe`;::                                            
	sendraw, ifwinexists, 
	return
	
	:*R:iniw`;::                                            
	sendraw, iniwrite 
	send, {tab}`%`%{tab}data.ini{tab}SavedVariables{tab}
	return
	:*R:inir`;::                                            
	sendraw, iniread 
	send, {tab 2}data.ini{tab}SavedVariables{tab}
	return
	
	:*R:#ifw`;::                                            
	sendraw, #ifwinactive, 
	return
	:*R:err`;::                                              
	sendraw, if ErrorLevel,
	return
	:*R:rtn::Return
	:*R:r`;::
	sendinput, {end}return
	return 
	#ifwinactive,
	

class Vim{
	key(){
		send, {F13}
		sleep 10
		send, {%A_thishotkey%}{esc}
		return
	}
	find(){
		global
		send,{shiftdown}{altdown}{ctrldown}{f}{shiftup}{altup}{ctrlup}
		; sleep 200
		input, letter, V,{enter}{return}{up}{down}{left}{right}
		; sleep 200
		send, {esc}
		; send,{ctrldown}{shiftdown}{lwindown}{c}{ctrlup}{shiftup}{lwinup}{esc}
		; , %letter%{a}
		; keywait, enter, d
		; send,{esc}
		return
	}
	GoToLine(){
		send,{shiftdown}{altdown}{g}{altUp}{shiftup}
		; sleep 200
		input, letter, L3 V T3,{lcontrol}{Rcontrol}{return}{up}{down}{left}{right}
		; sleep 200
		send, {Enter}
		; send,{ctrldown}{shiftdown}{lwindown}{c}{ctrlup}{shiftup}{lwinup}{esc}
		; , %letter%{a}
		; keywait, enter, d
		; send,{esc}
		return
	}

	ChangeSelection(){
		Clipsave:=ClipboardAll
		clipboard:=
		send, ^c
		clipwait, 0.25
		if errorlevel
			send, {shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
		send, {shiftdown}{ctrldown}{r}{shiftup}{ctrlup}
		sleep 200
		send, ^v
		sleep 300
		Clipboard:=ClipSave
		return
	}
	Line(LeaderKey){
		send,{esc}
		Input, Numbers, L3,,{enter}
		send,{:}%Numbers%{enter}
		send,{a}
		return
	}
	cut(){
		clipboard:=ClipboardAll
		clipboard:=
		send, ^{x}
		clipwait, 0.25
		vimclip:=clipboard
		tt(clipboard,400,,,,200)
		sleep 20
		clipboard:=ClipboardAll
		return
	}
	Paste(){
		global
		KeyWait, %A_ThisHotkey%, U
		KeyWait, %A_ThisHotkey% ,D T0.25
		if errorlevel
			if Vimclip
				sendinput, %Vimclip%
			else
				send, ^v
		else
			if vimclip
				sendinput, {end}{enter}%Vimclip%
			else
				sendinput,{end}{enter}^{v}
		return
	}
	}