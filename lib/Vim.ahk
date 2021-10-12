    ; #Persistent
    ; #NoEnv
    ; #SingleInstance,Force
    ; ; #KeyHistory 
    ; #MenuMaskKey vkE8
		;     ; #MaxHotkeysPerInterval 500
    ; ; #MaxThreadsBuffer, On
    ; #InstallKeybdHook
    ; #InstallMouseHook
    ; #maxthreadsperhotkey, 1
    ; SetBatchLines, 20ms
    ; SetControlDelay, 1
    ; SetKeyDelay, 1, 0.25
    ; ; setwindelay, 250
    ; FormatTime, DayString,, MM/d/yy
    ; FormatTime, TimeString, R
    ; FormatTime, CurrentDateTime,, MM/dd/yy
    ; SetNumLockState, on
    ; SetscrolllockState, off
		; SetNumlockState Alwayson
    ; setcapslockstate alwaysoff
    ; ; SetscrolllockState, always
    ; CoordMode, mouse, Window
    ; SetMouseDelay, 1
    ; SetDefaultMouseSpeed, 1
    ; SetTitleMatchMode, 2
		; SetWorkingDir, C:\Users\mmignin\Documents\VQuest
		; try Menu, Tray, Icon, lib\Vim.ico

		; #include Vquest.ahk
		; #include test.ahk
		; #include KEYS.ahk
		; #Include PAD.ahk
		;   #include Vis2.ahk

		
; return


#If WinActive("ahk_exe Code.exe")  ;;	___VSCODE    
		Mbutton::sendinput, ^{click}      
		numlock::									send, ^+{\}                 

		; !v:: 										  send, {F9}vim.ahk{enter}
		^+4::											send, !+{4}
		^+3::											send, !+{3}
		^+2::											send, !+{2}
		F21 & /:: 			 					SendInput,{ctrldown}{f}{ctrlup}%wintitle%
		F15 & tab::               SendInput,{ctrldown}{]}{ctrlup}	
		~lbutton & F21:: 					send, !+4
		lbutton & F19:: 					send, !+3
		numpadsub::               F7
		numpadadd::               F6
		numpadmult::              send,+{F9}
		; numpadmult::             SendInput,{shiftdown}{altdown}{lwindown}{up}{-}{lwinup}{altup}{shiftup}
		numpaddot::               numpaddot
		^numpaddot::              SendInput,{ctrldown}{w}{ctrlup}
		; Lwin::  									SendInput,{shiftdown}{altdown}{i}{altup}{shiftup} ; toggle colun selection mode
		; ^f::                     SendInput,{ctrldown}{f}{ctrlup}
		Numpadsub::               SendInput, ^{d} ;go to Deffinition
		Numpadadd::               SendInput, !^{d} ;go to reference
		$F9::                     F9
		tab::                     tab
		<^r::                     reloadscript()
		LCtrl & Appskey::         return
		<^f19::                   SendInput,{shiftdown}{ctrldown}{tab}{ctrlup}{shiftup}
		<+f19::                   SendInput,{shiftdown}{ctrldown}{tab}{ctrlup}{shiftup}
		^Lshift::   							return              
		Lwin & Appskey::          return
		Lalt & Appskey::          return
		; Lwin::                    doublepress("{altdown}{shiftdown}{up}{shiftup}{altup}")
		rshift & space::          SendInput,{shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
		<^lwin::                  delete
		<+space::                 SendInput,{shiftdown}{altdown}{ctrldown}{e}{ctrlup}{altup}{shiftup}
		; ^s::                      SendInput, {ctrldown}{end}{ctrlup}
	;;	___F19 and F21
		F21 & h::                 SendInput,{shiftdown}{altdown}{lwindown}{left}{lwinup}{altup}{shiftup}
		F21 & k::                 SendInput,{shiftdown}{altdown}{lwindown}{up}{lwinup}{altup}{shiftup}
		F21 & backspace::         delete
		; F21 & Right::           WinMove, ahk_exe Code.exe, , 1858, -1080, 1642, 1087
		; F21 & Down::            WinMove, ahk_exe Code.exe, , 603, 14, 1963, 1354
		F19 & left::              SendInput,{shiftdown}{lwindown}{altdown}{left}{altup}{lwinup}{shiftup}
		; F19 & up::              SendInput,{shiftdown}{lwindown}{altdown}{up}{altup}{lwinup}{shiftup}
		F19 & down::              SendInput,{shiftdown}{lwindown}{altdown}{down}{altup}{lwinup}{shiftup}
		F19 & right::             SendInput,{shiftdown}{lwindown}{altdown}{right}{altup}{lwinup}{shiftup}
		F19 & -::                 SendInput,{ctrldown}{-}{ctrlup}
		F19 & =::                 SendInput,{ctrldown}{=}{ctrlup}
		F19 & y::                 SendInput,{ctrldown}{w}{ctrlup}
		F19 & ,::                 SendInput,{shiftdown}{altdown}{ctrldown}{/}{ctrlup}{altup}{shiftup}
		F19 & m::                 SendInput,{shiftdown}{lwindown}{j}{lwinup}{shiftup}
		F19 & u::                 SendInput,{shiftdown}{lwindown}{k}{lwinup}{shiftup}
		F19 & i::                 SendInput,{F9}@
		F19 & o::                 SendInput,{F9}
		F19 & p::                 SendInput,^{F9}
		F19 & Enter::							SendInput,{ctrldown}{enter}{ctrlup}
		F19 & j::                 SendInput,+!{j}
		F19 & k::                 SendInput,+!{k}
		F19 & l::                 SendInput,{shiftdown}{ctrldown}{pgdn}{ctrlup}{shiftup}
		F19 & h::                 SendInput,{shiftdown}{ctrldown}{pgup}{ctrlup}{shiftup}
		f19 & `::                 SendInput,~
		f19 & r::                 SendInput,%process%
		f19 & c::                 SendInput,%mouseposition%
		f19 & t::                 SendInput,%wintitle%
		f19 & w::                 SendInput,%wininfo%
		f19 & n::                 SendInput,{shiftdown}{altdown}{lwindown}{m}{lwinup}{altup}{shiftup} ;navigate bookmarks
		F13 & lshift::						enter
		F13::F13
	;;	____TAB
		Tab & `:: 	 							
		Tab & h::               	SendInput,{ctrldown}{[}{ctrlup}
		Tab & l::               	SendInput,{ctrldown}{]}{ctrlup}
		Tab & j::               	down
		Tab & k::               	up
		Tab & a::               	SendInput,{shiftdown}{altdown}{lwindown}{a}{lwinup}{altup}{shiftup} ;align vertically
		Tab & w::               	SendInput,{shiftdown}{altdown}{lwindown}{w}{lwinup}{altup}{shiftup} ;fold all regions except current
		Tab & f13::             	SendInput,{shiftdown}{altdown}{lwindown}{4}{lwinup}{altup}{shiftup} ;unfold All
		Tab & .::               	SendInput,{shiftdown}{altdown}{ctrldown}{,}{ctrlup}{altup}{shiftup} ;fold comments
		Tab & z::               	SendInput,{shiftdown}{altdown}{ctrldown}{z}{ctrlup}{altup}{shiftup} ;align cursors
		Tab & s::               	SendInput,{shiftdown}{altdown}{lwindown}{s}{lwinup}{altup}{shiftup} ;toggle column selection
		Tab & x::               	SendInput,{shiftdown}{altdown}{ctrldown}{x}{ctrlup}{altup}{shiftup} ;align vertically
		Tab & c::               	SendInput,{shiftdown}{altdown}{ctrldown}{c}{ctrlup}{altup}{shiftup} ;Align
		Tab & p::               	SendInput,{shiftdown}{altdown}{ctrldown}{p}{ctrlup}{altup}{shiftup} ;Focus Pannel
		Tab & 1::               	SendInput,+!2
		tab & space::							SendInput,{shiftdown}{altdown}{lwindown}{8}{lwinup}{altup}{shiftup} ;toggle fold
		Tab & 2::                 SendInput,+!3
		Tab & 3::                 SendInput,+!4
		Tab & 4::                 SendInput,+!5
		tab & f::                 SendInput,{shiftdown}{altdown}{ctrldown}{]}{ctrlup}{altup}{shiftup}
		Tab & 5::                 SendInput,{tab 26}
		Tab & 6::                 SendInput,{tab 20}
		Tab & F15::               SendInput,{ctrldown}{[}{ctrlup}
		` & Tab::                 SendInput,{shiftdown}{altdown}{lwindown}{q}{lwinup}{altup}{shiftup}
		` & esc::                 backspace
		Tab & q::                 SendInput,{ctrldown}{]}{ctrlup}
		q & tab::                 SendInput,{ctrldown}{[}{ctrlup}
		q & u::										SendInput, {q}{u]
		F13 & tab::								SendInput,{shiftdown}{altdown}{lwindown}{1}{lwinup}{altup}{shiftup}
		q::q
	
	#ifwinactive

;; 		___LCONTROL
#if Getkeystate("LControl","p")
	z::                        SendInput,{ctrldown}{z}{ctrlup}
	n:: 											 SendInput,{ctrldown}{n}{ctrlup}
	l::                        SendInput,{ctrldown}{]}{ctrlup}
	h::                        SendInput,{ctrldown}{[}{ctrlup}
	+z::                       SendInput,{shiftup}{Ctrldown}{y}{CtrlUp}



;;					___VIM + CONTROL 
#If Getkeystate("F13","p") && Getkeystate("LControl","p")
	; 5::                                                                                       SendInput,{shiftdown}{ctrldown}{/}{ctrlup}{shiftup}
	j::                       SendInput,{shiftdown}{down}{shiftup}
	l::                       SendInput,{shiftdown}{right}{shiftup}
	;i::												SendInput,{shiftdown}{altdown}{lwindown}{i}{lwinup}{altup}{shiftup}
	h::                       SendInput,{shiftdown}{left}{shiftup}
	k::                       SendInput,{shiftdown}{up}{shiftup}
	^w::											
	w::                       SendInput,+^{right}{ctrl up}
	^e::                
	e::                       SendInput,^+!{0}
	^b::
	b::                       SendInput,^+{left}
	o::                       SendInput,{Home}{enter}{up}
	6::                       SendInput,{shiftdown}{Home}{shiftup}
	4::                       SendInput,{shiftdown}{end}{shiftup} 
	f::												Sendinput,!^{f}
	v::                       SendInput,{shiftdown}{altdown}{lwindown}{v}{lwinup}{altup}{shiftup}
	; <^v::                     SendInput,{shiftdown}{altdown}{lwindown}{v}{lwinup}{altup}{shiftup}
	<^m::                     SendInput,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup}
	^m::                      SendInput,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup} ;highlight next
	m::                       SendInput,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup} ;select next
	tab::											SendInput,{shiftdown}{altdown}{lwindown}{]}{lwinup}{altup}{shiftup}						
	[::												sendinput,{right}^{left}+^{right}{[}
	]::												sendinput,{right}^{left}+^{right}+{[}
	9::                       SendInput,{right}^{left}+^{right}+{9}
	0::                       SendInput,{right}^{left}+^{right}+{9}+{'}
	u::                       SendInput,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup}
	^u::                      SendInput,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup} ;hilight previous
	<^u::                     SendInput,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup}
	; F19::                     SendInput,{shiftdown}{altdown}{lwindown}{w}{lwinup}{altup}{shiftup} ;Fold all comments
		'::  										sendinput,{right}^{left}+^{right}+{'}
	^'::  										sendinput,{right}^{left}+^{right}+{'}
		p::											SendInput,{home}{enter}{up}{ctrldown}{v}{ctrlup}
	Space::                   SendInput,{shiftdown}{altDown}{a}{shiftup}{altup}{shiftdown}{ctrldown}{]}{ctrlup}{shiftup}
	q::                       SendInput,{shiftdown}{altdown}{ctrldown}{,}{ctrlup}{altup}{shiftup} ;block comment
	.::                       SendInput,{shiftdown}{Home 2}{shiftup}
	/::                       SendInput,{shiftdown}{end}{shiftup} 
	z::											  SendInput,{ctrldown}{y}{ctrlup}
	^z::											SendInput,{ctrldown}{y}{ctrlup}
	s::                       SendInput,{home}+{end}
	^s::                      SendInput,{home}+{end}
	; ^c::	
	c::	                      clip.append()
	,::	                      SendInput,!+^{/}
	^,::	                    SendInput,!+^{/}
	#If 
 
#If Getkeystate("Lshift","p") 							&& Getkeystate("F13","p")  ;; 					___VIM +SHIFT   
	k::                       SendInput,{up 10}
	+k::                      SendInput,{up 10}
	j::                       SendInput,{down 10}
	+j::                      SendInput,{down 10}
	1::		                    SendInput,{tab 8}
	2::		                    SendInput,{tab 10}
	3::		                    SendInput,{tab 12}
	4::		                    SendInput,{tab 14}
	5::		                    SendInput,{tab 26}
	6::		                    SendInput,{tab 20}


#if


















	#If (A_PriorHotKey = "d" 							&& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 800) ;; 			_Vim d
		4::                                       SendInput,{shiftdown}{end}{shiftup}^{x}
		/::                                       Vim.Yank("+{End}","cut") ;yank end
		.::                                       Vim.Yank("+{Home}","cut") ;yank end
		`;::                                      Vim.Yank("+!{;}","cut") ;encase
		l::                                       SendInput,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}^{x}
		h::                                       SendInput,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}^{x}
		5::                              			SendInput,{shiftdown}{ctrldown}{lwindown}{d}{lwinup}{ctrlup}{shiftup}
		w::                                       vim.Yank("{ctrldown}{right}{shiftdown}{left}{ctrlup}{shiftup}","cut")
		b::                                       vim.Yank("{ctrldown}{shiftdown}{left}{ctrlup}{shiftup}","cut")
		d::                                       vim.Yank("{Home 2}{shiftdown}{End}{right}{shiftup}","cut")
		; [::                                  		SendInput,{shiftdown}{altDown}{ctrldown}{9}{ctrlup}{altup}{shiftup}{delete}
		; ]::                                       SendInput,{shiftdown}{altDown}{ctrldown}{9}{ctrlup}{altup}{shiftup}{delete}
	#If (A_PriorHotKey = "y" 							&& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 800) ;;			_Vim y
		/::                                       SendInput,{shiftdown}{end}{shiftup}^{c}{F5 2}
		`;::                                      Vim.Yank("+!{;}") ;^{c}{F5 2} ;incase
		.::                                       Vim.Yank("{shiftdown}{home}{shiftup}")
		d::                                   		Vim.Yank("{home 2}{shiftdown}{end}{shiftup}")
	; w::                                    		 SendInput,{right}{ctrldown}{left}{shiftdown}{right}{shiftup}{c}{Ctrlup}
		5::                                       SendInput,^{m}^{c}
		4::                                       SendInput,{shiftdown}{end}{shiftup}^c{esc}{F5 2}
		y::                                       SendInput % "{home}{shiftdown}{end}{shiftup} "Vim.Yank() 
		w::                                       SendInput,{shiftdown}{altDown}{ctrldown}{s}{altup}{shiftup}{c}{Ctrlup}{esc}{F5 2}
		0::                                       SendInput,{shiftdown}{home}{shiftup}^c{esc}{F5 2}
	#If (A_PriorHotKey = "v" 							&& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 500) ;; 			_Vim v
		w::                                       SendInput,{shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
		; p::																			vim.paste() ;SendInput,^z{end}{enter}
	#if
;;					___Vim F13___
	#If Getkeystate("F13","p")
		h::                       SendInput,{left}
		l::                       SendInput,{right}
		+l::                      SendInput,{End}
		p::                       Vim.Paste()
		^j::                     SendInput,{shiftdown}{down}{shiftup}
		^l::                     SendInput,{shiftdown}{right}{shiftup}
		^h::                     SendInput,{shiftdown}{left}{shiftup}
		^k::                     SendInput,{shiftdown}{up}{shiftup}
		w::                     SendInput,^{right}
		e::                     SendInput,^!{0}
		^e::                    SendInput,!+^{0}
		^w::                    SendInput,+^{right}
		Rshift::                SendInput,{s}
		9 & 0::									SendInput,{)}
		y::                     SendInput,^{c} 
		; ^q::                  SendInput,{shiftdown}{ctrldown}{,}{ctrlup}{shiftup}				 ;block comment

		z::											backspace
		space::									sendinput, {ctrldown}{right}{shiftdown}{left}{ctrlup}{shiftup}
		c::                     sendinput, !+#{g}
		,::	                    SendInput,!^{/} 
		^,::	                  SendInput,!+^{/}
		q::                     SendInput,!^{/}						;line comment
	; ]::                     SendInput,{shiftdown}{altdown}{]}{altup}{shiftup}
		9::											SendInput,+{9}
		0::											SendInput,+{0}
	; [::                     SendInput,{shiftdown}{altdown}{[}{altup}{shiftup}
		; $^]::                 SendInput,{right}^{left}+^{right}+{[}
		; $^[::                 SendInput,{right}^{left}+^{right}{[}
		^9::                    SendInput,{right}^{left}+^{right}+{9}
		^0::                    SendInput,{right}^{left}+^{right}+{9}+{'}
		.::      	              Send,{Home}
		s::                     SendInput,+!{s}
		^s::                    SendInput,{home}+{end}
		f::                     sendinput,!#+{f 2} ;{shiftdown}{altdown}{lwindown}{f}{lwinup}{altup}{shiftup}
			^f::                  sendinput,+!{s}
		F19::                   SendInput,{shiftdown}{ctrldown}{altdown}{f7}{altup}{ctrlup}{shiftup} ; next sugjesstion
		; f20::                 SendInput,{pgdn}
		; 1::                   SendInput,{F1}
		; 2::                   SendInput,{F2{
		 4::                    SendInput,{End}
		i::                     SendInput,{F9}@
		`;::                    SendInput,{shiftdown}{altdown}{`;}{altup}{shiftup}
		^`;::                   SendInput,{shiftdown}{ctrldown}{altdown}{`;}{ctrlup}{altup}{shiftup}
		^]::                    SendInput,{right}^{left}+^{right}+{[}
		^[::                    SendInput,{right}^{left}+^{right}{[}
		]::                     SendInput,+{]}
		[::                                       SendInput,+{[}
		^'::  												sendinput,{right}^{left}+^{right}+{'}
		'::  													sendinput,+{'}

		/::                                       Send,+{end}{right} ;end of line
		a::                                       SendInput,{altDown}{ctrldown}{a}{ctrlup}{altup}
		^a::                                      SendInput,{altDown}{ctrldown}{a}{ctrlup}{altup}
		v::                                       SendInput,{shiftdown}{altdown}{ctrldown}{v}{ctrlup}{altup}{shiftup}
		j::                                       SendInput,{down}
		k::                                       SendInput,{Up}
		; t::                                     SendInput,{altdown}{down}{altup}
		t::																				SendInput,{F9}test.ahk{ctrldown}{enter}{ctrlup}
		x::                                       SendInput,{Delete}
		g::                                    	  SendInput,^g ;Git
		d::                                       return
		b::                                       SendInput,{ctrldown}{left}{Ctrlup}
		o::                                       SendInput,{end}{enter}
		m::                                       sendinput, {shiftdown}{ctrldown}{altDown}{]}{Ctrlup}{altup}{shiftup} ;goto next matching word
		u::                                       sendinput, {shiftdown}{ctrldown}{altDown}{[}{altup}{Ctrlup}{shiftup} ;go to previous matching word
		n::                                       SendInput,{ctrldown}{n}{ctrlup} 			;dublicate line

	; up::                                      SendInput,{Altdown}{shiftdown}{ctrldown}{up}{shiftup}{ctrlup}{altup}
		5::                      SendInput,{shiftdown}{5}{shiftup}
	`::                        vim.ChangeSelection()
		; r::                    Vim.ChangeSelection()
		Enter::                  SendInput,{shiftdown}{enter}{shiftup}
	; !F::                     openapp.Firefox()
		^space::                 SendInput,{shiftdown}{altdown}{ctrldown}{5}{ctrlup}{altup}{shiftup}
		lshift::                 SendInput,{pgup}

		<^right::                SendInput,{ctrldown}{]}{ctrlup}
		<^down::                 SendInput,{ctrldown}{down}{ctrlup}
		<^left::                 SendInput,{ctrldown}{[}{ctrlup}
		<^up::                   SendInput,{ctrldown}{up}{ctrlup}
		+o::                     SendInput,{Home}{enter}
		^z::                     SendInput,{ctrldown}{z}{ctrlup}
		^b::                     SendInput,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}
		^o::                     SendInput,{Home}{enter}
	; ^0::                     SendInput,{shiftdown}{Home}{shiftup}
		^.::                     SendInput,{shiftdown}{Home}{shiftup}
		^/::                     SendInput,{shiftdown}{end}{shiftup} 
		#if
		#IfWinActive
F13 & Lbutton::									send, +{click}
 $F13::													esc 
F13 & down::									  sendinput, {shiftdown}{down}{shiftup}
F13 & up::									    sendinput, {shiftdown}{up}{shiftup}
F13 & left::									  sendinput, {shiftdown}{left}{shiftup}
F13 & right::									  sendinput, {shiftdown}{right}{shiftup}


	#If Getkeystate("F19","p") ;;	 ___psudonumpad
	0::              SendInput,{-}
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
	n::              numpad1
	+n::             N
	i::              numpad8
	+i::             I
	o::              numpad9
	+o::              O
	`;::             SendInput,{numpad0}
	; n::            numpaddot
	y::              numpaddot
	; b::            down
	/::              numpad0
	p::              numpad0
	=::              =
	-::              -
	; F21::            SendInput,{.}
	h::              left
	+h::             H
	'::              numpad0
	Backspace::      backspace
	ENTER::          SendInput,{enter}
	RShift::         SendInput,{Tab}
	#if 


class Vim {

	find(){
		global
		SendInput,{shiftdown}{altdown}{ctrldown}{f}{shiftup}{altup}{ctrlup}
		input, letter, V,{enter}{return}{up}{down}{left}{right}
		SendInput,{enter}
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
		global 
		if Precommand
			Sendinput % PreCommand
		Send, ^{c}
		clipwait, 0.25
			if errorlevel
				send, {home}+{end}^{c}
		if Cut
			Sendinput, {Backspace}
		else 
			send, {esc}{F5}
		sleep 20
		return 
	}
	
	Paste(){
		global 

		KeyWait, p, U T1
		if errorlevel {
			Clipboard := StrReplace(Clipboard, A_tab, "")
			Clipboard := StrReplace(Clipboard, A_space A_space, A_Space)
			Clipboard:=RegExReplace(Clipboard, "\R+\R", "`r`n")     ; remove empty lines
			Send,^v
		}
		else
			Send,{end}{enter}^{v}
		return
	}
	}