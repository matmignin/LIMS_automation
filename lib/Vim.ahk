

; #IfWinActive, ahk_exe Code.exe
#if MouseClip && winactive("ahk_exe Code.exe")
	Mbutton::                                    clip.Click()
#if Getkeystate("LControl","p")
	; ^z::                                     SendInput,{ctrldown}{z}{ctrlup}
	z::                                     	 SendInput,{ctrldown}{z}{ctrlup}
	n:: 												  	 SendInput,{altdown}{ctrldown}{g}{ctrlup}{altup}
	l::                                        SendInput,{ctrldown}{]}{ctrlup}
	h::                                        SendInput,{ctrldown}{[}{ctrlup}
	+z::                                       SendInput,{shiftup}{Ctrldown}{y}{CtrlUp}
#if

#IfWinActive, ahk_exe Code.exe
	; +^k::                                     SendInput,{Altdown}{shiftdown}{ctrldown}{up}{shiftup}{ctrlup}{altup}
	; +^j::                                     SendInput,{Altdown}{shiftdown}{ctrldown}{down}{shiftup}{ctrlup}{altup}
	F20 & .:: 			 									SendInput,{ctrldown}{f}{ctrlup}%wintitle%
	F15 & tab::                                  SendInput,{ctrldown}{]}{ctrlup}	
	numpadsub::                                  4left()
	numpadadd::                                  4right()
	numpadmult::                                 SendInput,{shiftdown}{altdown}{lwindown}{up}{-}{lwinup}{altup}{shiftup}
	numpaddot::                                  numpaddot
	^numpaddot::                                 SendInput,{ctrldown}{w}{ctrlup}
	Mbutton::                                    3Tap() 
	$Lwin Up::  
	                                 SendInput,{shiftdown}{altdown}{i}{lwinup}{altup}{shiftup}
_TAB:
	Tab & h::                                    SendInput,{ctrldown}{[}{ctrlup}
	Tab & l::                                    SendInput,{ctrldown}{]}{ctrlup}
	Tab & j::                                   	down
	Tab & k::                                    up
	Tab & a::                                    SendInput,{shiftdown}{altdown}{lwindown}{a}{lwinup}{altup}{shiftup} ;align vertically
	Tab & w::                                    SendInput,{shiftdown}{altdown}{lwindown}{w}{lwinup}{altup}{shiftup} ;fold all regions except current
	Tab & f13::                                  SendInput,{shiftdown}{altdown}{lwindown}{4}{lwinup}{altup}{shiftup} ;unfold All
	Tab & ,::                                    SendInput,{shiftdown}{altdown}{ctrldown}{,}{ctrlup}{altup}{shiftup} ;fold comments
	Tab & z::                                    SendInput,{shiftdown}{altdown}{ctrldown}{z}{ctrlup}{altup}{shiftup} ;align cursors
	Tab & s::                                    SendInput,{shiftdown}{altdown}{lwindown}{s}{lwinup}{altup}{shiftup} ;toggle column selection
	Tab & x::                                    SendInput,{shiftdown}{altdown}{ctrldown}{x}{ctrlup}{altup}{shiftup} ;align vertically
	Tab & c::                                    SendInput,{shiftdown}{altdown}{ctrldown}{c}{ctrlup}{altup}{shiftup} ;Align
	Tab & p::                                    SendInput,{shiftdown}{altdown}{ctrldown}{p}{ctrlup}{altup}{shiftup} ;Focus Pannel
	Tab & 1::                                    SendInput,{tab 8}
	tab & space::											SendInput,{shiftdown}{altdown}{lwindown}{8}{lwinup}{altup}{shiftup} ;toggle fold
	Tab & 2::                                    SendInput,{tab 10}
	Tab & 3::                                    SendInput,{tab 12}
	Tab & 4::                                    SendInput,{tab 14}
	tab & f::                                    SendInput,{shiftdown}{altdown}{ctrldown}{]}{ctrlup}{altup}{shiftup}
	Tab & 5::                                    SendInput,{tab 26}
	Tab & 6::                                    SendInput,{tab 20}
	Tab & F15::                                  SendInput,{ctrldown}{[}{ctrlup}
	esc & `::                                   	delete
	` & Tab::                                    SendInput,{shiftdown}{altdown}{lwindown}{q}{lwinup}{altup}{shiftup}
	` & esc::                                    backspace
	Tab & q::                                    SendInput,{ctrldown}{]}{ctrlup}
	q & tab::                                    SendInput,{ctrldown}{[}{ctrlup}
	q & u::													SendInput, {q}{u]
	q::q
	F13 & tab::												SendInput,{shiftdown}{altdown}{lwindown}{1}{lwinup}{altup}{shiftup}
	;F14::                                        ReloadScript()
	; `::   																				SendInput,{``}
	$^F::                                         
		tt("`n ----Find------- `n",1000,A_CaretX,A_Carety)
		SendInput,{ctrldown}{f}{ctrlup}
		return
	$F6::                                         F6
	$F7::                                         F7
	; $F8::                                       	F8
	$F9::                                         F9
	tab::                                        tab
	; `::                                          SendInput,{``}
	!t::                                         TT(trackpadhints,5000)
	<^r::                                        reloadscript()
	; <^t::                                        reloadscript()
	LCtrl & Appskey::                            return
	<^f19::                                      SendInput,{shiftdown}{ctrldown}{tab}{ctrlup}{shiftup}
	<+f19::                                      SendInput,{shiftdown}{ctrldown}{tab}{ctrlup}{shiftup}
	^Lshift::                                    SendInput,{ctrldown}{y}{ctrlup}


	; Lshift::                                     DoublePress("{ctrldown}{F6}{ctrlup}",,"Backward")
	; Rshift::                                     DoublePress("{ctrldown}{F7}{ctrlup}",,"Forward")
	; LCtrl j::                                   doublepress("{altdown}{shiftdown}{up}{shiftup}{altup}")
	Lwin & Appskey::                             return
	Lalt & Appskey::                             return
	Lwin::                                       doublepress("{altdown}{shiftdown}{up}{shiftup}{altup}+{2}")
	rshift & space::                             SendInput,{shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
	<^lwin::                                     delete
	<+space::                                    SendInput,{shiftdown}{altdown}{ctrldown}{e}{ctrlup}{altup}{shiftup}
	; rbutton up::                                 click R
	^s::                                         SendInput, {ctrldown}{end}{ctrlup}
	f9 & f6::                                    return
	F20 & h::                                    SendInput,{shiftdown}{altdown}{lwindown}{left}{lwinup}{altup}{shiftup}
	F20 & k::                                    SendInput,{shiftdown}{altdown}{lwindown}{up}{lwinup}{altup}{shiftup}
	F20 & backspace::                            delete
	F20 & j::                                    SendInput,{shiftdown}{altdown}{lwindown}{down}{lwinup}{altup}{shiftup}
	F20 & l::                                    SendInput,{shiftdown}{altdown}{lwindown}{right}{lwinup}{altup}{shiftup}
	F20 & Right::                                WinMove, ahk_exe Code.exe, , 1858, -1080, 1642, 1087
	F20 & Down::                                 WinMove, ahk_exe Code.exe, , 603, 14, 1963, 1354
	F19 & left::                                 SendInput,{shiftdown}{lwindown}{altdown}{left}{altup}{lwinup}{shiftup}
	; F19 & up::                                   SendInput,{shiftdown}{lwindown}{altdown}{up}{altup}{lwinup}{shiftup}
	F19 & down::                                 SendInput,{shiftdown}{lwindown}{altdown}{down}{altup}{lwinup}{shiftup}
	F19 & right::                                SendInput,{shiftdown}{lwindown}{altdown}{right}{altup}{lwinup}{shiftup}
	F19 & -::                                    SendInput,{ctrldown}{-}{ctrlup}
	F19 & =::                                    SendInput,{ctrldown}{=}{ctrlup}
	F19 & y::                                    SendInput,{ctrldown}{w}{ctrlup}
	F19 & /::                                    SendInput,{shiftdown}{altdown}{ctrldown}{/}{ctrlup}{altup}{shiftup}
	F19 & i::                                    SendInput,{F9}@
	F19 & o::                                    SendInput,{F9}
	F19 & p::                                    SendInput,^{F9}
	F19 & F9::                                   SendInput,^{F9}
	F19 & lbutton::                              SendInput,^{click}
	F19 & Enter::											SendInput,{ctrldown}{enter}{ctrlup}
	F19 & j::                                    SendInput,{shiftdown}{altdown}{lwindown}{down}{lwinup}{altup}{shiftup}
	F19 & l::                                    SendInput,{shiftdown}{ctrldown}{pgdn}{ctrlup}{shiftup}
	F19 & h::                                    SendInput,{shiftdown}{ctrldown}{pgup}{ctrlup}{shiftup}
	f19 & `::                                    SendInput,~
	F19 & k::                                    SendInput,{shiftdown}{altdown}{lwindown}{up}{lwinup}{altup}{shiftup}
	f19 & r::                                    SendInput,%process%
	f19 & c::                                    SendInput,%mouseposition%
	f19 & t::                                    SendInput,%wintitle%
	f19 & w::                                    SendInput,%wininfo%
	f19 & n::                                    SendInput,{shiftdown}{altdown}{lwindown}{m}{lwinup}{altup}{shiftup} ;navigate bookmarks
	f19 & f6::                                   SendInput,{ctrldown}{[}{ctrlup}
	f19 & f7::                                   SendInput,{ctrldown}{]}{ctrlup}
	F19 & 7::												GotoError()
	F13 & `::												delete
	F13 & F11::                                  WindowInfo()
	; F13 & g::                                  	SendInput,{shiftdown}{altdown}{lwindown}{g}{lwinup}{altup}{shiftup}
	F13 & lshift::											enter

	F13::F13             ;                         	SendInput,{shiftdown}{altdown}{ctrldown}{6}{ctrlup}{altup}{shiftup}
	; F19::                                        ^c
	
	
	#ifwinactive

_F13_Control: 
#If Getkeystate("F13","p") && Getkeystate("LControl","p")
	; 5::                                        SendInput,{shiftdown}{ctrldown}{/}{ctrlup}{shiftup}
	j::                                          SendInput,{shiftdown}{down}{shiftup}
	l::                                          SendInput,{shiftdown}{right}{shiftup}
	i::														SendInput,{shiftdown}{altdown}{lwindown}{i}{lwinup}{altup}{shiftup}
	h::                                          SendInput,{shiftdown}{left}{shiftup}
	k::                                          SendInput,{shiftdown}{up}{shiftup}
	^w::                                          SendInput,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}
	w::                                          SendInput,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}
	b::                                          SendInput,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}
	o::                                          SendInput,{Home}{enter}{up}
	; 0::                                          SendInput,{shiftdown}{Home 2}{shiftup}
	6::                                          SendInput,{shiftdown}{Home}{shiftup}
	t::														SendInput,{F9}test.ahk{enter}
	4::                                          SendInput,{shiftdown}{end}{shiftup} 
	<^m::                                        SendInput,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup}
	v::                                          SendInput,{shiftdown}{altdown}{lwindown}{v}{lwinup}{altup}{shiftup}
	<^v::                                        SendInput,{shiftdown}{altdown}{lwindown}{v}{lwinup}{altup}{shiftup}
	<^u::                                        SendInput,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup}
	^m::                                         SendInput,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup}
	m::                                          SendInput,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup}
	tab::														SendInput,{shiftdown}{altdown}{lwindown}{]}{lwinup}{altup}{shiftup}						
	u::                                          SendInput,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup}
	^u::                                         SendInput,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup}
	F19::                                        SendInput,{shiftdown}{ctrldown}{altdown}{f6}{altup}{ctrlup}{shiftup} ;previous suggestion
	'::                                          sendInput,{shiftdown}{ctrldown}{r}{ctrlup}{shiftup}
	p::														SendInput,{home}{enter}{up}{ctrldown}{v}{ctrlup}
	Space::                                      SendInput,{shiftdown}{altDown}{a}{shiftup}{altup}{shiftdown}{ctrldown}{]}{ctrlup}{shiftup}
	q::                                          SendInput,{shiftdown}{home}{shiftup}
	e::                                          SendInput,{shiftdown}{end}{shiftup}
	; g::                                          SendInput,{shiftdown}{lwindown}{g}{lwinup}{shiftup}
]::                               			    	SendInput,{shiftdown}{altdown}{lwindown}{]}{lwinup}{altup}{shiftup}
[::                               			    	SendInput,{shiftdown}{altdown}{lwindown}{[}{lwinup}{altup}{shiftup}
9::                               			    	SendInput,{shiftdown}{altdown}{lwindown}{9}{lwinup}{altup}{shiftup}
0::                               			    	SendInput,{shiftdown}{altdown}{lwindown}{0}{lwinup}{altup}{shiftup}
	; z::                                        SendInput,{shiftdown}{altdown}{ctrldown}{z}{ctrlup}{altup}{shiftup}
	; ^z::               			                 SendInput,{ctrldown}{z}{ctrlup}
	; z::           		                          SendInput,{ctrldown}{z}{ctrlup}
	; f::                                        SendInput,{shiftdown}{altdown}{ctrldown}{f}{ctrlup}{altup}{shiftup}
	,::                                          SendInput,{shiftdown}{altdown}{ctrldown}{,}{ctrlup}{altup}{shiftup} ;block comment
	#If 
#If Getkeystate("Lshift","p") 							&& Getkeystate("F13","p")
	F13_SHIFT:    
	k::                                          SendInput,{up 10}
	+k::                                        	SendInput,{up 10}
	j::                                          SendInput,{down 10}
	+j::                                        	SendInput,{down 10}
	Tab & 1::                                    SendInput,{tab 8}
	Tab & 2::                                    SendInput,{tab 10}
	Tab & 3::                                    SendInput,{tab 12}
	Tab & 4::                                    SendInput,{tab 14}
	Tab & 5::                                    SendInput,{tab 26}
	Tab & 6::                                    SendInput,{tab 20}

Vim:
	#If (A_PriorHotKey = "d" 							&& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 800) ;Vim Delete
		4::                                       SendInput,{shiftdown}{end}{shiftup}^{x}
		e::                                       SendInput,{shiftdown}{end}{shiftup}^{x}
		`;::                                      SendInput,{shiftdown}{end}{shiftup}^{x}
		q::                                       SendInput,{shiftdown}{home}{shiftup}^{x}
		l::                                       SendInput,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}^{x}
		h::                                       SendInput,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}^{x}
		5::                              			SendInput,{shiftdown}{ctrldown}{lwindown}{d}{lwinup}{ctrlup}{shiftup}
		w::                                       vim.Yank("{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}","cut")
		d::                                       vim.Yank("{Home 2}{shiftdown}{End}{right}{shiftup}","cut")
		[::                                  		SendInput,{shiftdown}{altDown}{ctrldown}{9}{ctrlup}{altup}{shiftup}{delete}
		]::                                       SendInput,{shiftdown}{altDown}{ctrldown}{9}{ctrlup}{altup}{shiftup}{delete}
	#If (A_PriorHotKey = "y" 							&& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 800)
		; e::                                       SendInput,{shiftdown}{end}{shiftup}^c{esc}{F5 2}
		; q::                                       SendInput,^{m}^{c}
		e::                                       SendInput,{shiftdown}{end}{shiftup}^{c}{F5 2}
		`;::                                      SendInput,{shiftdown}{end}{shiftup}^{c}{F5 2}
		q::                                       SendInput,{shiftdown}{home}{shiftup}^{c}{F5 2}
		d::                                   		SendInput,{home 2}{shiftdown}{end}{shiftup}^x
	; w::                                    		 SendInput,{right}{ctrldown}{left}{shiftdown}{right}{shiftup}{c}{Ctrlup}
		5::                                       SendInput,^{m}^{c}
		4::                                       SendInput,{shiftdown}{end}{shiftup}^c{esc}{F5 2}
		y::                                       SendInput,{home}{shiftdown}{end}{shiftup}^c{esc}{F5 3}
		w::                                       SendInput,{shiftdown}{altDown}{ctrldown}{s}{altup}{shiftup}{c}{Ctrlup}{esc}{F5 2}
		0::                                       SendInput,{shiftdown}{home}{shiftup}^c{esc}{F5 2}
	#If (A_PriorHotKey = "v" 							&& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 500)
		w::                                       SendInput,{shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
	; #If (A_PriorHotKey = "g" 							&& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 500)
; 	g::                                       SendInput,{shiftdown}{ctrldown}{end}{ctrlup}{shiftup}
	; #If (A_PriorHotKey = "p" 							&& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 500)
		; p::													vim.paste() ;SendInput,^z{end}{enter}
	#if
	#If Getkeystate("F13","p")
		F13::	Vim.Find()
		p::                                       Vim.Paste()
		y::                                       SendInput,^{c} 
		Rshift::                                  SendInput,{pgdn}
		f19 & lbutton::                           SendInput,^{lbutton}
		9 & 0::												SendInput,{)}
		s::                                       SendInput,{home}+{end}
		c::                                       SendInput,{shiftdown}{altdown}{lwindown}{c}{lwinup}{altup}{shiftup}
		space::												^space
		z::													backspace
		0::                                   
		]::                                       SendInput,{shiftdown}{altdown}{]}{altup}{shiftup}
		9::
		[::                                       SendInput,{shiftdown}{altdown}{[}{altup}{shiftup}
		$^]::                                     SendInput,{shiftdown}{altdown}{lwindown}{]}{lwinup}{altup}{shiftup}
		$^[::                                     SendInput,{shiftdown}{altdown}{lwindown}{[}{lwinup}{altup}{shiftup}
		^9::                                      SendInput,{shiftdown}{altdown}{lwindown}{9}{lwinup}{altup}{shiftup}
		^0::                                      SendInput,{shiftdown}{altdown}{lwindown}{0}{lwinup}{altup}{shiftup}
		q::                                       Send,+{Home}{home}
		f::                                      	sendinput,{shiftdown}{altdown}{lwindown}{f}{lwinup}{altup}{shiftup}
		n::                                       SendInput,{altdown}{ctrldown}{g}{ctrlup}{altup}
		F19::                                     SendInput,{shiftdown}{ctrldown}{altdown}{f7}{altup}{ctrlup}{shiftup} ; next sugjesstion
		; f20::                                   SendInput,{pgdn}
		; q::                                     SendInput,{altdown}{,}{altup}
		1::                                       SendInput,{F1}
		2::                                       SendInput,{F2{
		w::                                       SendInput,{ctrldown}{right}{ctrlup}
		 4::                                      SendInput,{End}
		`;::                                      SendInput,{End}
		+l::                                      SendInput,{End}
		e::                                       Send,+{end}{right}
		a::                                       SendInput,{altDown}{ctrldown}{a}{ctrlup}{altup}
		^a::                                      SendInput,{altDown}{ctrldown}{a}{ctrlup}{altup}
		v::                                       SendInput,{shiftdown}{altdown}{ctrldown}{v}{ctrlup}{altup}{shiftup}
		j::                                       SendInput,{down}
		k::                                       SendInput,{Up}
		; t::                                     SendInput,{altdown}{down}{altup}
		t::													SendInput,{F9}test.ahk{ctrldown}{enter}{ctrlup}
		h::                                       SendInput,{left}
		l::                                       SendInput,{right}
		x::                                       SendInput,{Delete}
		; g::                                       SendInput,{shiftdown}{altdown}{lwindown}{g}{lwinup}{altup}{shiftup}
		; g::                                     SendInput,{ctrldown}{end}{ctrlup}
		6::                                       SendInput,{HOME}
		+h::                                      SendInput,{HOME}
		g::                                    	SendInput,{HOME}
		d::                                       return
		b::                                       SendInput,{ctrldown}{left}{Ctrlup}
		o::                                       SendInput,{end}{enter}
		,::                                       SendInput,{Altdown}{ctrldown}{/}{ctrlup}{altup}
		; `::                                     SendInput, {shiftdown}{altdown}{ctrldown}{r}{ctrlup}{altup}{shiftup}

		m::                                       SendInput,{shiftdown}{ctrldown}{altDown}{]}{Ctrlup}{altup}{shiftup}
		u::                                       SendInput,{shiftdown}{ctrldown}{altDown}{[}{altup}{Ctrlup}{shiftup}
	; up::                                      SendInput,{Altdown}{shiftdown}{ctrldown}{up}{shiftup}{ctrlup}{altup}
		'::  													vim.GoToLine()
		; `;::                                      SendInput,:
		i::                                       SendInput,{ctrldown}{i}{Ctrlup}
		5::                                       SendInput,{shiftdown}{5}{shiftup}
	; `::                                     Vim.ChangeSelection()
		r::                                       Vim.ChangeSelection()
		Enter::                                   SendInput,{shiftdown}{enter}{shiftup}
	; !F::                                      openapp.Firefox()
		^space::                                  SendInput,{shiftdown}{altdown}{ctrldown}{5}{ctrlup}{altup}{shiftup}
		lshift::                                  SendInput,{pgup}
		<^right::                                 SendInput,{ctrldown}{]}{ctrlup}
		<^down::                                  SendInput,{ctrldown}{down}{ctrlup}
		<^left::                                  SendInput,{ctrldown}{[}{ctrlup}
		<^up::                                    SendInput,{ctrldown}{up}{ctrlup}
		+o::                                      SendInput,{Home}{enter}
		^e::                                      SendInput,+{end}
		^j::                                      SendInput,{shiftdown}{down}{shiftup}
		^z::                                      SendInput,{ctrldown}{z}{ctrlup}
		^l::                                      SendInput,{shiftdown}{right}{shiftup}
		^h::                                      SendInput,{shiftdown}{left}{shiftup}
		^k::                                      SendInput,{shiftdown}{up}{shiftup}
		^w::                                      SendInput,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}
		^b::                                      SendInput,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}
		^o::                                      SendInput,{Home}{enter}
	; ^0::                                      SendInput,{shiftdown}{Home}{shiftup}
		; ^q::                                      SendInput,{shiftdown}{Home 2}{shiftup}
		^4::                                      SendInput,{shiftdown}{end}{shiftup} 
		#if
		#IfWinActive
F13::F13 ; 													SendInput,{esc}{ctrlup}{altup}{shiftup}


; ============================= psudonumpad(){}

_PsudoNumpad:
	#If Getkeystate("F19","p")
	0::                                         	SendInput,{-}
	m::                                          numpad1
	+m::                                         M
	,::                                          numpad2
	.::                                          numpad3
	j::                                          numpad4
	+j::                                         J
	k::                                          numpad5
	+k::                                         K
	l::                                          numpad6
	+l::                                         L
	u::                                          numpad7
	+u::                                         U
	n::                                          numpad1
	+n::                                         N
	i::                                          numpad8
	+i::                                         I
	o::                                          numpad9
	+o::                                          O
	`;::                                         SendInput,{numpad0}
	; n::                                        numpaddot
	y::                                          numpaddot
	; b::                                        down
	/::                                          numpad0
	p::                                          numpad0
	=::                                          =
	-::                                          -
	; F20::                                        SendInput,{.}
	h::                                          left
	+h::                                         H
	'::                                          right
	Backspace::                                  backspace
	ENTER::                                      SendInput,{enter}
	RShift::                                     SendInput,{Tab}
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
	SendInput,%wintitle%
	return
	:*R:wm`;::                                   
	SendInput,%wininfo%
	return
	:*R:wp`;::                                   
	SendInput,%process%
	return
	:*R:mp`;::                                   
	SendInput,%mouseposition%
	return
	:*R:wc`;::                                  
	SendInput,%Wincontrol%
	return
	:*R:wl`;::
	SendInput,%WinLocation%
	return
	:*R:tt`;::                                    
	SendInput, tt(){left} 
	return 
	:*R:hs`;::                                   
	InputBox, UserInput, New Hotstring,enter Hotstring,,,,,,,, 
	SendInput, {end}{return}:`*R:%UserInput%``;::`n`t`t`t`t`t`t`t`t`t`t`tSendInput`, {enter}return{up}{end}{shiftup}{ctrldown}{v}{ctrlup}
	return 
	:*R:we`;::                                   
	SendInput, WinExist(`"`"){left 2} 
	return 
	:*R:wa`;::                                    
	SendInput, WinActive(`"`"){left 2} 
	return 
	:*R:tr`;::                                   
	sendraw, tt("")
	SendInput, {left 2} 
	return 
	:*R:c`;::                                                   
	sendraw,{ctrldown}{}{ctrlup}
	SendInput,{left 9}
	return
	:*R:w`;::                                                  
	sendraw,{lwindown}{}{lwinup}
	SendInput,{left 9}
	return
	:*r:a`;::                                                  
	sendraw,{altdown}{}{altup}
	SendInput,{left 8}
	return
	:*r:s`;::                                                  
	sendraw,{shiftdown}{}{shiftup}
	SendInput,{left 10}
	return
	:*r:csw`;::                                              
	:*r:cws`;::                                              
	:*r:scw`;::                                              
	:*r:swc`;::                                              
	:*r:wcs`;::                                              
	:*r:wsc`;::                                              
	sendraw,{shiftdown}{ctrldown}{lwindown}{}{lwinup}{ctrlup}{shiftup}
	SendInput,{left 26}
	return
	:*r:asw`;::                                              
	:*r:aws`;::                                              
	:*r:saw`;::                                              
	:*r:swa`;::                                              
	:*r:was`;::                                              
	:*r:wsa`;::                                              
	sendraw,{shiftdown}{altdown}{lwindown}{}{lwinup}{altup}{shiftup}
	SendInput,{left 25}
	return
	:*r:asc`;::                                              
	:*r:acs`;::                                              
	:*r:sac`;::                                              
	:*r:sca`;::                                              
	:*r:cas`;::                                              
	:*r:csa`;::                                              
	sendraw,{shiftdown}{altdown}{ctrldown}{}{ctrlup}{altup}{shiftup}
	SendInput,{left 25}
	return
	:*r:sc`;::                                                
	:*r:cs`;::                                                
	sendraw,{shiftdown}{ctrldown}{}{ctrlup}{shiftup}
	SendInput,{left 18}
	return
	:*r:sw`;::                                                
	:*r:ws`;::                                                
	sendraw,{shiftdown}{lwindown}{}{lwinup}{shiftup}
	SendInput,{left 18}
	return
	:*r:sa`;::                                                
	:*r:as`;::                                                
	sendraw,{shiftdown}{altdown}{}{altup}{shiftup}
	SendInput,{left 17}
	return
	:*r:ca`;::                                                
	:*r:ac`;::                                                
	sendraw,{altdown}{ctrldown}{}{ctrlup}{altup}
	SendInput,{left 16}
	return
	:*r:wa`;::                                                
	:*r:aw`;::                                                
	sendraw,{altdown}{lwindown}{}{lwinup}{altup}
	SendInput,{left 16}
	return
	:*R:nu`;::                                            
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
	SendInput,{Space}`%`%{,}{Space}data.ini{,}{Space}SavedVariables{,}{Space}
	return
	:*R:inir`;::                                            
	sendraw, iniread 
	SendInput,{space}{,}data.ini{,}{space}SavedVariables{,}{space}
	return
	
	:*R:#ifw`;::                                            
	sendraw, #ifwinactive, 
	return
	:*R:err`;::                                              
	sendraw, if ErrorLevel,
	return
	:*R:rtn::Return
	:*R:r`;::
	SendInput, {end}return
	return 
	:*:vs`;::ahk_exe Code.exe
	#ifwinactive,
	

class Vim{
	key(){
		SendInput,{F13}
		sleep 10
		SendInput,{%A_thishotkey%}{esc}
		return
	}
	find(){
		global
		SendInput,{shiftdown}{altdown}{ctrldown}{f}{shiftup}{altup}{ctrlup}
		; sleep 200
		input, letter, V,{enter}{return}{up}{down}{left}{right}
		; sleep 200
		SendInput,{enter}
		; SendInput,{ctrldown}{shiftdown}{lwindown}{c}{ctrlup}{shiftup}{lwinup}{esc}
		; , %letter%{a}
		; keywait, enter, d
		; SendInput,{esc}
		return
	}
	GoToLine(){
		SendInput,{shiftdown}{altdown}{g}{altUp}{shiftup}
		; sleep 200
		input, letter, L3 V T3,{lcontrol}{Rcontrol}{return}{up}{down}{left}{right}
		; sleep 200
		SendInput,{Enter}
		; , %letter%{a}
		; keywait, enter, d
		; SendInput,{esc}
		return
	}

	ChangeSelection(){
		Clipsave:=ClipboardAll
		clipboard:=
		SendInput,^c
		clipwait, 0.25
		if errorlevel
			SendInput,{shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
		SendInput,{shiftdown}{ctrldown}{r}{shiftup}{ctrlup}
		sleep 200
		SendInput,^v
		sleep 300
		Clipboard:=ClipSave
		return
	}
	Line(LeaderKey){
		SendInput,{esc}
		Input, Numbers, L3,,{enter}
		
		SendInput,{a}

	}
	Yank(Precommand:="",Cut:=""){
		global VimClip
		PreClip:=ClipboardAll
		Clipboard:=
		if Precommand
			Sendinput % PreCommand
		Send, ^{c}
		clipwait, 0.55
		if !errorlevel
			vimclip:=clipboard
		if Cut
			Sendinput, {Backspace 2}
		RegExReplace(VimClip, "\R+\R", "`r`n") 
		VimClip := StrReplace(VimClip, "`t","")
		sleep 20
		iniwrite %Vimclip%, data.ini, SavedVariables, Vimclip
		clipboard:=PreClip
		return 
	}
	
	Paste(){
		global Vimclip
		Preclip:=ClipboardAll
		clipboard:=
		sleep 20
		Clipboard:=Vimclip
		KeyWait, %A_ThisHotkey%, D T1
		if errorlevel
			Send,^v
		else
			Send,{end}{enter}^{v}
		; KeyWait, %A_ThisHotkey% ,D T0.25
		; sendinput, ^v
		sleep 20
		clipboard:=PreClip
		return
	}
	}