

; #IfWinActive, ahk_exe Code.exe
#if MouseClip && winactive("ahk_exe Code.exe")
	Mbutton::                                    clip.Click()
_LCONTROL:
#if Getkeystate("LControl","p")
	; ^z::                                     SendInput,{ctrldown}{z}{ctrlup}
	z::                                     	 SendInput,{ctrldown}{z}{ctrlup}
	n:: 												  	 SendInput,{altdown}{ctrldown}{g}{ctrlup}{altup}
	l::                                        SendInput,{ctrldown}{]}{ctrlup}
	h::                                        SendInput,{ctrldown}{[}{ctrlup}
	+z::                                       SendInput,{shiftup}{Ctrldown}{y}{CtrlUp}
#if
_VScode:
#IfWinActive, ahk_exe Code.exe                                
	!v:: 														send, {F9}vim.ahk{enter}
	F20 & .:: 			 									SendInput,{ctrldown}{f}{ctrlup}%wintitle%
	F15 & tab::                                  SendInput,{ctrldown}{]}{ctrlup}	
	numpadsub::                                  4left()
	numpadadd::                                  4right()
	numpadmult::                                 SendInput, {altdown}{ctrldown}{tab}{ctrlup}{altup}
	; numpadmult::                                 SendInput,{shiftdown}{altdown}{lwindown}{up}{-}{lwinup}{altup}{shiftup}
	numpaddot::                                  numpaddot
	^numpaddot::                                 SendInput,{ctrldown}{w}{ctrlup}
	Mbutton::                                    3Tap() 
	$Lwin Up::  											SendInput,{shiftdown}{altdown}{i}{lwinup}{altup}{shiftup} ; toggle colun selection mode
_TAB:
	Tab & `:: 	 											
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
	` & Tab::                                    SendInput,{shiftdown}{altdown}{lwindown}{q}{lwinup}{altup}{shiftup}
	` & esc::                                    backspace
	Tab & q::                                    SendInput,{ctrldown}{]}{ctrlup}
	q & tab::                                    SendInput,{ctrldown}{[}{ctrlup}
	q & u::													SendInput, {q}{u]
	q::q
	F13 & tab::												SendInput,{shiftdown}{altdown}{lwindown}{1}{lwinup}{altup}{shiftup}
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
	^Lshift::                                    


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
	F20 & h::                                    SendInput,{shiftdown}{altdown}{lwindown}{left}{lwinup}{altup}{shiftup}
	F20 & k::                                    SendInput,{shiftdown}{altdown}{lwindown}{up}{lwinup}{altup}{shiftup}
	F20 & backspace::                            delete
	F20 & j::                                    SendInput,{shiftdown}{altdown}{lwindown}{down}{lwinup}{altup}{shiftup}
	F20 & l::                                    SendInput,{shiftdown}{altdown}{lwindown}{right}{lwinup}{altup}{shiftup}
	; F20 & Right::                                WinMove, ahk_exe Code.exe, , 1858, -1080, 1642, 1087
	; F20 & Down::                                 WinMove, ahk_exe Code.exe, , 603, 14, 1963, 1354
	F19 & left::                                 SendInput,{shiftdown}{lwindown}{altdown}{left}{altup}{lwinup}{shiftup}
	; F19 & up::                                   SendInput,{shiftdown}{lwindown}{altdown}{up}{altup}{lwinup}{shiftup}
	F19 & down::                                 SendInput,{shiftdown}{lwindown}{altdown}{down}{altup}{lwinup}{shiftup}
	F19 & right::                                SendInput,{shiftdown}{lwindown}{altdown}{right}{altup}{lwinup}{shiftup}
	F19 & -::                                    SendInput,{ctrldown}{-}{ctrlup}
	F19 & =::                                    SendInput,{ctrldown}{=}{ctrlup}
	F19 & y::                                    SendInput,{ctrldown}{w}{ctrlup}
	F19 & /::                                    SendInput,{shiftdown}{altdown}{ctrldown}{/}{ctrlup}{altup}{shiftup}
	F19 & m::                                    SendInput,{shiftdown}{lwindown}{j}{lwinup}{shiftup}
	F19 & u::                                    SendInput,{shiftdown}{lwindown}{k}{lwinup}{shiftup}
	F19 & i::                                    SendInput,{F9}@
	F19 & o::                                    SendInput,{F9}
	F19 & p::                                    SendInput,^{F9}
	F19 & lbutton::                              SendInput,^{click}
	F19 & Enter::											SendInput,{ctrldown}{enter}{ctrlup}
	F19 & j::                                    SendInput,+!{j}
	F19 & k::                                    SendInput,+!{k}
	F19 & l::                                    SendInput,{shiftdown}{ctrldown}{pgdn}{ctrlup}{shiftup}
	F19 & h::                                    SendInput,{shiftdown}{ctrldown}{pgup}{ctrlup}{shiftup}
	f19 & `::                                    SendInput,~
	f19 & r::                                    SendInput,%process%
	f19 & c::                                    SendInput,%mouseposition%
	f19 & t::                                    SendInput,%wintitle%
	f19 & w::                                    SendInput,%wininfo%
	f19 & n::                                    SendInput,{shiftdown}{altdown}{lwindown}{m}{lwinup}{altup}{shiftup} ;navigate bookmarks
	F13 & F11::                                  WindowInfo()
	; F13 & g::                                  	SendInput,{shiftdown}{altdown}{lwindown}{g}{lwinup}{altup}{shiftup}
	F13 & lshift::											enter

	; F13 & appskey::send, {esc}            ;                         	SendInput,{shiftdown}{altdown}{ctrldown}{6}{ctrlup}{altup}{shiftup}
	; F19::                                        ^c
	F13::F13
	
	#ifwinactive

_F13_CONTROL: 
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
	v::                                          SendInput,{shiftdown}{altdown}{lwindown}{v}{lwinup}{altup}{shiftup}
	<^v::                                        SendInput,{shiftdown}{altdown}{lwindown}{v}{lwinup}{altup}{shiftup}
	[::														
	<^m::                                        SendInput,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup}
	^m::                                         SendInput,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup} ;highlight Previous
	m::                                          SendInput,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup}
	tab::														SendInput,{shiftdown}{altdown}{lwindown}{]}{lwinup}{altup}{shiftup}						
	]:
	u::                                          SendInput,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup}
	^u::                                         SendInput,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup} ;hilight next
	<^u::                                        SendInput,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup}
	F19::                                        SendInput,{shiftdown}{ctrldown}{altdown}{f6}{altup}{ctrlup}{shiftup} ;previous suggestion
		'::  													sendinput,{shiftdown}{lwindown}{altdown}{'}{altup}{lwinup}{shiftup}
	^'::  													sendinput,{shiftdown}{lwindown}{altdown}{'}{altup}{lwinup}{shiftup}
		p::														SendInput,{home}{enter}{up}{ctrldown}{v}{ctrlup}
	Space::                                      SendInput,{shiftdown}{altDown}{a}{shiftup}{altup}{shiftdown}{ctrldown}{]}{ctrlup}{shiftup}
	; q::                                          SendInput,{shiftdown}{home}{shiftup}
	e::                                          SendInput,{shiftdown}{end}{shiftup} ;encase
	; g::                                          SendInput,{shiftdown}{lwindown}{g}{lwinup}{shiftup}
	; ]::                               			    	SendInput,{shiftdown}{altdown}{lwindown}{]}{lwinup}{altup}{shiftup}
	; [::                                 			    	SendInput,{shiftdown}{altdown}{lwindown}{[}{lwinup}{altup}{shiftup}
	9::                               			    	SendInput,{shiftdown}{altdown}{lwindown}{9}{lwinup}{altup}{shiftup}
	0::                               			    	SendInput,{shiftdown}{altdown}{lwindown}{0}{lwinup}{altup}{shiftup}
		; z::                                        SendInput,{shiftdown}{altdown}{ctrldown}{z}{ctrlup}{altup}{shiftup}
		; ^z::               			                 SendInput,{ctrldown}{z}{ctrlup}
		; z::           		                          SendInput,{ctrldown}{z}{ctrlup}
		; f::                                        SendInput,{shiftdown}{altdown}{ctrldown}{f}{ctrlup}{altup}{shiftup}
	q::                                          SendInput,{shiftdown}{altdown}{ctrldown}{,}{ctrlup}{altup}{shiftup} ;block comment
	,::                                      SendInput,{shiftdown}{Home 2}{shiftup}
	.::                                      SendInput,{shiftdown}{end}{shiftup} 
	z::											SendInput,{ctrldown}{y}{ctrlup}
	^z::											SendInput,{ctrldown}{y}{ctrlup}
	s::                                       SendInput,{home}+{end}
	^s::                                       SendInput,{home}+{end}
	c::	                                 	SendInput,!+^{/}
	/::	                                 	SendInput,!+^{/}
	^c::	                                 	SendInput,!+^{/}
	^/::	                                 	SendInput,!+^{/}
	#If 
_F13_SHIFT:    
#If Getkeystate("Lshift","p") 							&& Getkeystate("F13","p")
	k::                                          SendInput,{up 10}
	+k::                                        	SendInput,{up 10}
	j::                                          SendInput,{down 10}
	+j::                                        	SendInput,{down 10}
	1::		                                    SendInput,{tab 8}
	2::		                                    SendInput,{tab 10}
	3::		                                    SendInput,{tab 12}
	4::		                                    SendInput,{tab 14}
	5::		                                    SendInput,{tab 26}
	6::		                                    SendInput,{tab 20}


#if


















_Vim_Doublepress:
	#If (A_PriorHotKey = "d" 							&& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 800) ;Vim Delete
		4::                                       SendInput,{shiftdown}{end}{shiftup}^{x}
		.::                                       SendInput,{shiftdown}{end}{shiftup}^{x}
		`;::                                      SendInput,{shiftdown}{end}{shiftup}^{x} ;encase
		,::                                       SendInput,{shiftdown}{home}{shiftup}^{x}
		l::                                       SendInput,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}^{x}
		h::                                       SendInput,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}^{x}
		5::                              			SendInput,{shiftdown}{ctrldown}{lwindown}{d}{lwinup}{ctrlup}{shiftup}
		w::                                       vim.Yank("{ctrldown}{right}{shiftdown}{left}{ctrlup}{shiftup}","cut")
		d::                                       vim.Yank("{Home 2}{shiftdown}{End}{right}{shiftup}","cut")
		; [::                                  		SendInput,{shiftdown}{altDown}{ctrldown}{9}{ctrlup}{altup}{shiftup}{delete}
		; ]::                                       SendInput,{shiftdown}{altDown}{ctrldown}{9}{ctrlup}{altup}{shiftup}{delete}
	#If (A_PriorHotKey = "y" 							&& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 800)
		.::                                       SendInput,{shiftdown}{end}{shiftup}^{c}{F5 2}
		`;::                                      SendInput,{shiftdown}{end}{shiftup}^{c}{F5 2} ;incase
		,::                                       SendInput,{shiftdown}{home}{shiftup}^{c}{F5 2}
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
_Vim_F13:
	#If Getkeystate("F13","p")
		p::                                       Vim.Paste()
		y::                                       SendInput,^{c} 
		Rshift::                                  SendInput,{pgdn}
		f19 & lbutton::                           SendInput,^{lbutton}
		9 & 0::												SendInput,{)}
		^s::                                       SendInput,{home}+{end}
		; ^q::                                     	SendInput,{shiftdown}{ctrldown}{,}{ctrlup}{shiftup}				 ;block comment

		z::													backspace
		space::												^space
		c::                                       sendinput,!^{/}
		/::	                                    SendInput,!^{/} 
		^/::	                                 	SendInput,!+^{/}
		q::                                       SendInput,!^{/}						;line comment
	; ]::                                       SendInput,{shiftdown}{altdown}{]}{altup}{shiftup}
		9::													SendInput,{shiftdown}{altdown}{9}{altup}{shiftup}
		0::													SendInput,{shiftdown}{altdown}{0}{altup}{shiftup}
	; [::                                       SendInput,{shiftdown}{altdown}{[}{altup}{shiftup}
		$^]::                                     SendInput,{shiftdown}{altdown}{lwindown}{]}{lwinup}{altup}{shiftup}
		$^[::                                     SendInput,{shiftdown}{altdown}{lwindown}{[}{lwinup}{altup}{shiftup}
		^9::                                      SendInput,{shiftdown}{altdown}{lwindown}{9}{lwinup}{altup}{shiftup}
		^0::                                      SendInput,{shiftdown}{altdown}{lwindown}{0}{lwinup}{altup}{shiftup}
		,::                                       Send,+{Home}{home}
		f::                                      	sendinput,{shiftdown}{altdown}{lwindown}{f}{lwinup}{altup}{shiftup}
		F19::                                     SendInput,{shiftdown}{ctrldown}{altdown}{f7}{altup}{ctrlup}{shiftup} ; next sugjesstion
		; f20::                                   SendInput,{pgdn}
		1::                                       SendInput,{F1}
		2::                                       SendInput,{F2{
		w::                                       SendInput,{ctrldown}{right}{ctrlup}
		 4::                                      SendInput,{End}
		i::                                      	SendInput,{F9}@
		s::                                      SendInput,{shiftdown}{altdown}{;}{altup}{shiftup}
		`;::                                      SendInput,{shiftdown}{altdown}{;}{altup}{shiftup}
		^`;::                                     SendInput,{shiftdown}{ctrldown}{altdown}{;}{ctrlup}{altup}{shiftup}
		+l::                                      SendInput,{End}

		.::                                       Send,+{end}{right} ;end of line
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
		6::                                       SendInput,{HOME}
		+h::                                      SendInput,{HOME}
		g::                                    	SendInput,{HOME}
		d::                                       return
		b::                                       SendInput,{ctrldown}{left}{Ctrlup}
		o::                                       SendInput,{end}{enter}
		]::                                   	  SendInput,{shiftdown}{ctrldown}{altDown}{]}{Ctrlup}{altup}{shiftup} ;goto next matching word
		[::                                       SendInput,{shiftdown}{ctrldown}{altDown}{[}{altup}{Ctrlup}{shiftup} ;go to previous matching word
		u::                                       sendinput, !+{k}  						;move line up
		m::                                       sendinput, !+{j}  						;Move line down
		n::                                       SendInput,{altdown}{ctrldown}{g}{ctrlup}{altup} 			;dublicate line

	; up::                                      SendInput,{Altdown}{shiftdown}{ctrldown}{up}{shiftup}{ctrlup}{altup}
		^'::  													sendinput,{shiftdown}{lwindown}{altdown}{'}{altup}{lwinup}{shiftup}
		'::  													sendinput,{shiftdown}{altdown}{'}{altup}{shiftup}
		5::                                       SendInput,{shiftdown}{5}{shiftup}
	`::                                     Vim.ChangeSelection()
		; r::                                       Vim.ChangeSelection()
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
		^,::                                      SendInput,{shiftdown}{Home 2}{shiftup}
		^.::                                      SendInput,{shiftdown}{end}{shiftup} 
		#if
		#IfWinActive
 $F13::esc ; 													SendInput,{esc}{ctrlup}{altup}{shiftup}
F13 & Lbutton::sendinput, {shiftdown}{click}{shiftup}
F13 & down::sendinput, {shiftdown}{down}{shiftup}
F13 & up::sendinput, {shiftdown}{up}{shiftup}
F13 & left::sendinput, {shiftdown}{left}{shiftup}
F13 & right::sendinput, {shiftdown}{right}{shiftup}

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


class Vim{

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
	Yank(Precommand:="",Cut:=""){
		global VimClip
		PreClip:=ClipboardAll
		Clipboard:=
		if Precommand
			Sendinput % PreCommand
		Send, ^{c}
		clipwait, 0.25
		if !errorlevel
			vimclip:=clipboard
		if Cut
			Sendinput, {Backspace}
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