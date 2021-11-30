    #Persistent
    #NoEnv
    #SingleInstance,Force

    #InstallKeybdHook
    #InstallMouseHook
    #maxthreadsperhotkey, 1
    ; SetBatchLines, 20ms
    setwindelay, 150
    FormatTime, DayString,, MM/d/yy
    FormatTime, TimeString, R
    FormatTime, CurrentDateTime,, MM/dd/yy
    SetNumLockState, on
    SetscrolllockState, off
		SetNumlockState Alwayson
    setcapslockstate alwaysoff
		#ClipboardTimeout 1500
    SetMouseDelay, 1
    SetDefaultMouseSpeed, 1
    SetTitleMatchMode, 2
		Process, Priority, , High
		try Menu, Tray, Icon, C:\Users\mmignin\Documents\VQuest\bin\Vim.ico
		menu, tray, add, ReloadScript, <^r
		Menu, Tray, Add, E&xit, ExitSub
		Menu, Tray, Default, E&xit
   #include C:\Users\mmignin\Documents\VQuest\lib\Functions.ahk 
   #include C:\Users\mmignin\Documents\VQuest\lib\VScode.ahk 
	 #include C:\Users\mmignin\Documents\VQuest\lib\Vis\Gdip_All.ahk
	 #include C:\Users\mmignin\Documents\VQuest\lib\Vis\JSON.ahk
	 #include C:\Users\mmignin\Documents\VQuest\lib\Vis\Vis2.ahk
return

#If Getkeystate("Lwin","p") ;|| GetKeyState("Capslock","T") ;; PsudoNumpad
	F7::right
	F6::left
	F9::up
	F8::down
	wheelup::pgup
	wheeldown::pgdn
	#if

#If Getkeystate("F19","p") ;|| GetKeyState("Capslock","T") ;; PsudoNumpad
	m::              numpad1
	+m::             M
	,::              numpad2
	.::              numpad3
	j::              numpad4
	+j::             J
	k::              numpad5
	+k::             K
	l::              numpad6
	+l::             L
	u::              numpad7
	+u::             U
	/::              sendinput, {tab}
	i::              numpad8
	+i::             I
	o::              numpad9
	+o::             O
	`;::             SendInput,{numpad0}
	y::              sendinput, {Tab}
	p::              numpad0
	=::              -
	-::              -
	[::              left
	]::              right
	h::              sendinput, {,}
	n::              sendinput, {.}
	9::              sendinput, {-}
	8::              sendinput, {*}
	0::              sendinput, {-}
	+h::             H
	'::              numpad0
	Backspace::      backspace
	ENTER::          SendInput,{enter}
	RShift::         SendInput,{Tab}
#if 





#if Getkeystate("LControl","p")  ;; 	      -||| LCONTROL ||-
	z::                        SendInput,{ctrldown}{z}{ctrlup}
	/:: 											 SendInput,{ctrldown}{n}{ctrlup}
	l::                        SendInput,{ctrldown}{]}{ctrlup}
h::                        SendInput,{ctrldown}{[}{ctrlup}
	+z::                       SendInput,{shiftup}{Ctrldown}{y}{CtrlUp}
	y::                        SendInput,	^+{y}
	; Lshift::               		 SendInput, {ctrldown}{z}{ctrlup}
	; Rshift::                SendInput, {ctrldown}{y}{ctrlup}
	n::                       F7
	u::                      	F6
	8::return
	7::return
	6::return
	5::return
	4::return
	3::return
	2::return
	1::return
	#if 
	tab & appskey::return ;Send, {tab}
#if Getkeystate("Tab","p")
	`::							sendinput, ^!{0} ;unfold all
	h::									SendInput,{ctrldown}{[}{ctrlup}
	l::               	SendInput,{ctrldown}{]}{ctrlup}
	`;::               	SendInput,!^{/} ;unfold all
	j::               	down
	^j::               	send, {shiftdown}{down}{shiftup}
	^k::               	send, {shiftdown}{up}{shiftup}
	k::               	up
	,::               	sendinput, +!^{left}
	.::               	sendinput, +!^{.}
	a::               	SendInput,{shiftdown}{altdown}{lwindown}{a}{lwinup}{altup}{shiftup} ;align vertically
	w::               	SendInput,{shiftdown}{altdown}{lwindown}{w}{lwinup}{altup}{shiftup} ;fold all regions except current
	f13::             	SendInput,{shiftdown}{altdown}{lwindown}{4}{lwinup}{altup}{shiftup} ;unfold All
	s::               	SendInput,{shiftdown}{altdown}{lwindown}{s}{lwinup}{altup}{shiftup} ;toggle column selection
	m::               	SendInput,{shiftdown}{altdown}{ctrldown}{,}{ctrlup}{altup}{shiftup} ;fold comments
	z::               	SendInput,{shiftdown}{altdown}{ctrldown}{z}{ctrlup}{altup}{shiftup} ;align cursors
	x::               	SendInput,{shiftdown}{altdown}{ctrldown}{x}{ctrlup}{altup}{shiftup} ;align vertically
	c::               	SendInput,{shiftdown}{altdown}{ctrldown}{c}{ctrlup}{altup}{shiftup} ;Align
	p::               	SendInput,{shiftdown}{altdown}{ctrldown}{p}{ctrlup}{altup}{shiftup} ;Focus Pannel
	1::               	SendInput,^!{1} ;fold level 1
	space::							SendInput,{shiftdown}{altdown}{lwindown}{8}{lwinup}{altup}{shiftup} ;toggle fold
	2::                 SendInput,^!{2} ;fold level 2
	3::                 SendInput,+!#{w} ;fold all except selected
	4::                 SendInput,^!{/} 
	f::                SendInput,{shiftdown}{altdown}{ctrldown}{]}{ctrlup}{altup}{shiftup}
	q::                SendInput,{ctrldown}{]}{ctrlup}
	#if
	$tab::send, {tab}
	Lbutton & tab::						sendinput, {shiftdown}{altdown}{\}{altup}{shiftup} ;switch column select
	q & tab::                 SendInput,{ctrldown}{[}{ctrlup}
	q & u::										SendInput, {q}{u}
	q::q
	`::`



#If Getkeystate("F13","p")									&& Getkeystate("LControl","p") ;;		||| VIM + CONTROL ||| 
	j::                       SendInput,{shiftdown}{down}{shiftup}
	l::                       SendInput,{shiftdown}{right}{shiftup}
	h::                       SendInput,{shiftdown}{left}{shiftup}
	k::                       SendInput,{shiftdown}{up}{shiftup}                      
	^w::
	.::												SendInput,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}
	^,::											SendInput,{shiftdown}{ctrldown}{Left}{ctrlup}{shiftup}
	,::												SendInput,{shiftdown}{ctrldown}{Left}{ctrlup}{shiftup}
	^b::                      SendInput,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}
	^x::											sendinput, ^{x}								
	^.::											SendInput,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}
	o::                       SendInput,{Home}{enter}{up}
	f::												Sendinput,{altdown}{ctrldown}{f}{ctrlup}{altup}
	^n::                      SendInput,{shiftdown}{ctrldown}{n}{ctrlup}{shiftup} ;highlight next
	tab::											SendInput,{shiftdown}{altdown}{lwindown}{]}{lwinup}{altup}{shiftup}						
	[::												sendinput,{right}^{left}+^{right}{[}
	]::												sendinput,{right}^{left}+^{right}+{[}
	9::                       SendInput,{right}^{left}+^{right}+{9}
	0::                       SendInput,{right}^{left}+^{right}+{9}+{'}
	^u::                      SendInput,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup} ;hilight previous
	; '::  										sendinput,{right}^{left}+^{right}+{'}
	^'::  										sendinput,{right}{ctrldown}{left}{shiftdown}{right}{'}{ctrlup}{shiftup}
	^m::                      SendInput,{shiftdown}{Home 2}{shiftup}
	; ^/::                    SendInput,{shiftdown}{end}{shiftup} 
	/::                       SendInput,{shiftdown}{end}{shiftup} 
	^y::                      Send,{home 2}{shift down}{end}{shift up}^x{delete}
	; s::                     SendInput,{home}+{end}
	; a::                   
	^a::										sendinput, {shiftdown}{ctrldown}{left}{ctrlup}{shiftup}{backspace}
	; s::                    	
	^s::                    sendinput, {shiftdown}{ctrldown}{right}{ctrlup}{shiftup}{delete}
	c::	                      clip.append()
	#If 
 
#If Getkeystate("Lshift","p") 							&& Getkeystate("F13","p")  ;; 		||| VIM +SHIFT |||  
	k::                       SendInput,{up 10}
	+k::                      SendInput,{up 10}
	j::                       SendInput,{down 10}
	+j::                      SendInput,{down 10}
	; 1::		                    SendInput,{tab 8}
	; 2::		                    SendInput,{tab 10}
	; 3::		                    SendInput,{tab 12}
	; 4::		                    SendInput,{tab 14}
	; 5::		                    SendInput,{tab 26}
	; 6::		                    SendInput,{tab 20}
	#if

#If (A_PriorhotKey = "'" 										&& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 1100) ;; 	 	_' Vim_
	'::                    sendinput, {shiftdown}{altdown}{`;}{altup}{shiftup} ;select brackets
#If (A_PriorKey = "d" 									   && Getkeystate("F13","p") && A_TimeSincePriorHotkey < 900) ;; 	 	_d Vim_
	; w::                     SendInput,{ctrldown}{right}{shiftdown}{left}{ctrlup}{shiftup}{backspace}
	b::                     SendInput,{ctrldown}{left}{shiftdown}{right}{ctrlup}{shiftup}{backspace}
	e::
	/::                    	Sendinput, {ctrldown}{z}{ctrlup}+{End}{delete}	
	w::
	m::                     Sendinput, +{Home}{Backspace}
	,::                     SendInput,{ctrldown}{shiftdown}{left}{ctrlup}{shiftup}{backspace}
	.::                     SendInput, {ctrldown}{z}{shiftdown}{right}{ctrlup}{shiftup}{delete}
	a::											Sendinput, {ctrldown}{a}{ctrlup}{delete}
  s:: 										SendInput,{home 2}{shiftdown}{end}{shiftup}{Backspace 2}
	space::                 sendinput, {shiftdown}{altdown}{`;}{altup}{shiftup}{delete}
#If (A_PriorKey = "s" 										&& Getkeystate("F13","p")) ;&& A_TimeSincePriorHotkey < 900) ;; 	 	_s Vim_
	a::                    Sendinput, {{shiftdown}{altdown}{a}{altup}{shiftup}
	/::                    Sendinput, +{End}
	m::                    Sendinput, +{Home}
	`;::                   Sendinput, +!{;}
	l::                    SendInput,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}
	h::                    SendInput,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}
	.::
	w::                    sendinput, {F3 3}{ctrldown}{right}{shiftdown}{left}{ctrlup}{shiftup}
	,::
	b::                    Sendinput, {ctrldown}{shiftdown}{left}{ctrlup}{shiftup}
	s::                    sendinput, {shiftdown}{altdown}{`;}{altup}{shiftup} 
	; d::											
	d::                    sendinput, {home 2}{shiftdown}{end}{shiftup}{backspace 2} ;select line
	x::                    sendinput, ^{x}
	c::                    sendinput, ^{c}

#If (A_PriorHotKey = "p"									&& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 1000) ;; 	 	_p Vim_
	q::										
		send, Vquest.ahk
		sleep 200
		send, {enter}
		return
	b::										
		send, VARBAR.ahk
		sleep 200
		send, {enter}
		return
	v::										
		send, VIM.ahk
		sleep 200
		send, {enter}
		return
	e::										
		send, Excel.ahk 
		sleep 200
		send, {enter}
		return
	l::										
		send, LMS.ahk 
		sleep 200
		send, {enter}
		return
	t::										
		send, temp.ahk 
		sleep 200
		send, {enter}
		return
	^t::										
		send, Test.ahk 
		sleep 200
		send, {enter}
		return
	s::										
		send, VScode.ahk 
		sleep 200
		send, {enter}
		return
	d::										
		send, data.ini 
		sleep 200
		send, {enter}
		return
	o::										
		send, OpenApp.ahk 
		sleep 200
		send, {enter}
		return
	m::										
		send, Menu.ahk 
		sleep 200
		send, {enter}
		return
	f::										
		send, Functions.ahk 
		sleep 200
		send, {enter}
		return
	c::										
		send, clip.ahk 
		sleep 200
		send, {enter}
		return
	h::										
		send, HotStrings.ahk 
		sleep 200
		send, {enter}
		return
	k::										
		send, KEYS.ahk
		sleep 200
		send, {enter}
		return
	^k::										
	j::										
		send, Pad.ahk 
		sleep 200
		send, {enter}
		return
	p::										
		send, {down}
		sleep 200
		send, {enter}
		return


#If (A_PriorHotKey = "y"									&& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 300) ;; 	 	_y Vim_
	/::                             Vim.Yank("+{End}") ;yank end
	m::                             Vim.Yank("+{Home}") ;yank end{shiftdown}{altdown}{`;}{altup}{shiftup}
	`;::                            Vim.Yank("+!{;}") ;encase
	l::                             Send,{shiftdown}{}ctrldown{right}{ctrlup}{shiftup}^{c}
	h::                             Send,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}^{c}
	.::															send, {shiftdown}{ctrldown}{right}{ctrlup}{shiftup}^c
	w::                             send, {ctrldown}{right}{shiftdown}{left}{shiftup}{c}{ctrlup}
	,::															send, {shiftdown}{ctrldown}{left}{ctrlup}{shiftup}
	b::                             Send, {ctrldown}{shiftdown}{left}{shiftup}{c}{ctrlup}
	d::                            sendinput, {Home 2}{shiftdown}{End}{right}{shiftup}^{x}
	y::                            sendinput, {Home 2}{shiftdown}{End}{right}{shiftup}^{c}
	
#If Getkeystate("F13","p") 																							;;          	=|||- VIM F13 -|||=
	h::                       SendInput,{left}
	^h::                     SendInput,{shiftdown}{left}{shiftup}
	l::                       SendInput,{right}
	+l::                      SendInput,{End}
	^j::                     SendInput,{shiftdown}{down}{shiftup}
	^l::                     SendInput,{shiftdown}{right}{shiftup}
	.::                     SendInput,{ctrldown}{right}{ctrlup}
	; ^.::                    SendInput,{blind}{kkshiftdown}{ctrldown}{right}{ctrlup}{shiftup}
	,::                     SendInput,{ctrldown}{left}{Ctrlup}
	; ^,::										SendInput,{blind}{shiftdown}{ctrldown}{left}{ctrlup}{shiftup} ;go back a word
	w::											sendinput,{ctrldown}{right}{ctrlup}
	^w::                    SendInput,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}
	b::											sendinput,{ctrldown}{left}{ctrlup}
	^b::                    SendInput,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}
	i::											Sendinput, ^{i}
	u::                     sendinput, {shiftdown}{ctrldown}{altDown}{[}{altup}{Ctrlup}{shiftup} ;go to previous matching word
	n::                     sendinput, {shiftdown}{ctrldown}{altDown}{]}{Ctrlup}{altup}{shiftup} ;goto next matching word
	/::                     Send,+{end}{right} ;end of line
	m::      	              Send,{Home}
	^k::                     SendInput,{shiftdown}{up}{shiftup}
	f:: 	                 sendinput, !#+{f 2}
	9 & 0::									SendInput,{)}
	; Space::									sendinput, {right}{ctrldown}{left}{shiftdown}{right}{ctrlup}{shiftup} ;selectWord
	Space::									sendinput, {_}
	a::											SendInput,{home 2}{shiftdown}{end}{shiftup} ;select whole line
	^a::											SendInput, {ctrldown}{a}{ctrlup} ;select All
	^s::										Sendinput, {shiftdown}{altdown}{a}{altup}{shiftup} ;select all of word
	 ;delete word
	^e::                  	SendInput,^{a}{backspace}			 ;block comment
	d::											backspace
	^d::                    sendinput, {shiftdown}{ctrldown}{left}{ctrlup}{shiftup}{backspace}
	x::											delete
	^x::                    sendinput, {shiftdown}{ctrldown}{right}{ctrlup}{shiftup}{delete}
	t::                     SendInput,+!{F9}
	s::sendinput, {right}{ctrldown}{left}{shiftdown}{right}{ctrlup}{shiftup}
	`;::        						SendInput,!^{/}
	^`;::                   SendInput,{shiftdown}{ctrldown}{altdown}{`;}{ctrlup}{altup}{shiftup}
	9::											SendInput,+{9}
	0::											SendInput,+{0}
	^9::                    SendInput,{right}^{left}+^{right}+{9}
	^0::                    SendInput,{right}^{left}+^{right}+{9}+{'}
	Tab::                   SendInput,{shiftdown}{ctrldown}{altdown}{f7}{altup}{ctrlup}{shiftup} ; next sugjesstion
	p::                     SendInput,{F9}
	^]::                    SendInput,{right}^{left}+^{right}+{[}
	^[::                    SendInput,{right}^{left}+^{right}{[}
	; ]::                     SendInput,+!#{]} ;go to bracket right
	; [::                     SendInput,+#{[} ;go to bracket left
	[::                     SendInput, {F6} 
	]::                     SendInput, {f7}
	; '::  										SendInput,!{'} go back to previous ediet
	; '::  										sendinput, {shiftdown}{altdown}{`;}{altup}{shiftup} 
	'::sendinput, {left}{ctrldown}{right}{shiftdown}{left}{ctrlup}{shiftup}

	y::                    	sendinput, {shiftdown}{altdown}{a}{altup}{shiftup} ;select all occurances
	; c::                  		send, ^{c} ;  send,^{c}
	; ^c::                  	send, ^{x} ;  send,^{c}

	; v::                  Send, ^{v}
	j::                     SendInput,{down}
	k::                     SendInput,{Up}
	; t::											sendinput,{ctrldown}{enter}{ctrlup}
	g::                     SendInput,^g ;Git

	o::                     SendInput,{end}{enter}
	5::                      SendInput,{shiftdown}{5}{shiftup}
	; ^y::										send, ^{F18}

	; ::                      send, {F18}
	z::                      send, {F3}
	v::                      send, {F18}
	; r::                    Vim.ChangeSelection()
	Enter::                  SendInput,{shiftdown}{enter}{shiftup}
	^space::                 SendInput,{shiftdown}{altdown}{ctrldown}{5}{ctrlup}{altup}{shiftup}
	; lshift::                 SendInput,{pgup} 
	<^right::                SendInput,{ctrldown}{]}{ctrlup}
	<^down::                 SendInput,{ctrldown}{down}{ctrlup}
	<^left::                 SendInput,{ctrldown}{[}{ctrlup}
	<^up::                   SendInput,{ctrldown}{up}{ctrlup}
	+o::                     SendInput,{Home}{enter}
	^o::                     SendInput,{Home}{enter}
	^m::                     SendInput,{shiftdown}{Home}{shiftup}
	^/::                     SendInput,{shiftdown}{end}{shiftup} 
	down::									  sendinput, {altdown}{lwindown}{down}{altup}{lwinup}
	up::									    sendinput, {altdown}{lwindown}{up}{altup}{lwinup}
	left::									  sendinput, {altdown}{lwindown}{left}{altup}{lwinup}
	right::									  sendinput, {altdown}{lwindown}{right}{altup}{lwinup}
	#if









