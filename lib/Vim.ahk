    #Persistent
    #NoEnv
    #SingleInstance,Force

    #InstallKeybdHook
    #InstallMouseHook
    #maxthreadsperhotkey, 2
    ; SetBatchLines, 20ms
		; SendMode, Input
    ; setwindelay, 150
    FormatTime, DayString,, MM/d/yy
    FormatTime, TimeString, R
    FormatTime, CurrentDateTime,, MM/dd/yy
    SetNumLockState, on
    SetscrolllockState, off
		SetNumlockState Alwayson
    setcapslockstate alwaysoff
		#ClipboardTimeout 1500
		Hotkey,F13 & j, Vim_down
		Hotkey,F13 & l, Vim_right
		Hotkey,F13 & h, Vim_left
		Hotkey,F13 & k, Vim_up
    ; SetMouseDelay, 1
    ; SetDefaultMouseSpeed, 1
    SetTitleMatchMode, 2
		; Process, Priority, , High
		try Menu, Tray, Icon, C:\Users\mmignin\Documents\VQuest\bin\Vim.ico
		;menu, tray, add, ReloadScript, <^r
		Menu, Tray, Add, E&xit, ExitSub
		Menu, Tray, Default, E&xit
   #include *i C:\Users\mmignin\Documents\VQuest\lib\Functions.ahk
   #include *i C:\Users\mmignin\Documents\VQuest\lib\VScode.ahk
	 #include *i C:\Users\mmignin\Documents\VQuest\lib\Vis\Gdip_All.ahk
	 #include *i C:\Users\mmignin\Documents\VQuest\lib\Vis\JSON.ahk
	 #include *i C:\Users\mmignin\Documents\VQuest\lib\Vis\Vis2.ahk
	;  #Include *i C:\Users\mmignin\Documents\VQuest\lib\LMS.ahk
	;  #Include *i C:\Users\mmignin\Documents\VQuest\lib\PAD.ahk
	;  #Include *i C:\Users\mmignin\Documents\VQuest\lib\KEYS.ahk

return
; #ifwinactive, ahk_exe SketchUp.exe
; 	~Mbutton::return ;mbutton

; #If Getkeystate("Lwin","p") ;|| GetKeyState("Capslock","T") ;; PsudoNumpad



; #If Getkeystate("F19","p") ;|| GetKeyState("Capslock","T") ;; PsudoNumpad

; #if

	Vim_down(){
		if Getkeystate("LControl","p")
			Sendinput,{shiftdown}{down}{shiftup}
		else if Getkeystate("Lshift","p")
			sendinput, {altdown}{lwindown}{down}{altup}{lwinup}
		else
			Sendinput,{down}
		return
		}
	Vim_up(){
		if Getkeystate("LControl","p")
			Sendinput,{shiftdown}{up}{shiftup}
		else if Getkeystate("Lshift","p")
			sendinput, {altdown}{lwindown}{up}{altup}{lwinup}
		else
			Sendinput,{up}
		return
		}
	Vim_left(){
		if Getkeystate("LControl","p")
			Sendinput,{shiftdown}{left}{shiftup}
		else if Getkeystate("Lshift","p")
			sendinput, {altdown}{lwindown}{left}{altup}{lwinup}
		else
			Sendinput,{left}
		return
		}
	Vim_right(){
		if Getkeystate("LControl","p")
			Send,{shiftdown}{right}{shiftup}
		else if Getkeystate("Lshift","p")
			sendinput, {altdown}{lwindown}{right}{altup}{lwinup}
		else
			Sendinput,{right}
		return
		}



; 	l::                        Sendinput,{ctrldown}{]}{ctrlup}
; #if Getkeystate("LControl","p")  ;; 	      -||| LCONTROL ||-
; 	z::                        Sendinput,{ctrldown}{z}{ctrlup}
; 	/:: 											 Sendinput,{ctrldown}{n}{ctrlup}
; 	h::                        Sendinput,{ctrldown}{[}{ctrlup}
; 	+z::                       Sendinput,{shiftup}{ctrldown}{y}{ctrlUp}
; 	y::                        Sendinput,	^+{y}
; 	n::                       F7
; 	u::                      	F6
; 	; Lshift::               		 Sendinput, {ctrldown}{z}{ctrlup}
; 	; Rshift::                Sendinput, {ctrldown}{y}{ctrlup}
; 	8::return
; 	7::return
; 	6::return
; 	5::return
; 	4::return
; 	3::return
; 	2::return
; 	1::return
; 	#if

;;    Vim_Tab

;;		||| VIM + CONTROL |||
#If Getkeystate("F13","p")									&& Getkeystate("LControl","p")
	;q::gosub, ADD_A_DROPDOWN_SavedTextMenu_ITEM

	; j::                       Sendinput,{shiftdown}{down}{shiftup}
		; h::                       Sendinput,{shiftdown}{left}{shiftup}
	; k::                       Sendinput,{shiftdown}{up}{shiftup}
	; l::                       Sendinput,{shiftdown}{right}{shiftup}
	w::
	; ,::												Sendinput,{shiftdown}{ctrldown}{Left}{ctrlup}{shiftup}
	b::                      Sendinput,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}
	x::											sendinput, ^{x}
	; .::											Sendinput,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}
	tab::											Sendinput,{shiftdown}{altdown}{lwindown}{]}{lwinup}{altup}{shiftup}
	[::												sendinput,{right}^{left}+^{right}{[}
	]::												sendinput,{right}^{left}+^{right}+{[}
	; 9::                       Sendinput,{right}^{left}+^{right}+{9}
	; r::  										sendinput,{shiftdown}{altdown}{ctrldown}{F5}{ctrlup}{altup}{shiftup}
	; 0::                       Sendinput,{right}^{left}+^{right}+{9}+{'}

	; y::                      Send,{home 2}{shift down}{end}{shift up}^x{delete}
	s::                    sendinput, {shiftdown}{altdown}{s}{altup}{shiftup}
	c::	                      clip.append()
	#If
;;++++++++++++++++++++++++++++++++++++++++++++++++++++ VIM +SHIFT |++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; #If Getkeystate("F13","p") && Getkeystate("Lshift","p")
	; +j::									  sendinput, {altdown}{lwindown}{down}{altup}{lwinup}
	; +k::									  sendinput, {altdown}{lwindown}{up}{altup}{lwinup}
	; +h::									  sendinput, {altdown}{lwindown}{left}{altup}{lwinup}
	; +l::									  sendinput, {altdown}{lwindown}{right}{altup}{lwinup}
	; +Space::
	; `;::									  sendinput, {altdown}{lwindown}{/}{altup}{lwinup} ;something with metago

	; #if
/* ;;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| ' Vim |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#If (& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 1100 && A_PriorhotKey = "'") ;; 	 	_' Vim_
	[::                    sendinput, {{} ;enter curly bracket below
	}::                    sendinput, {{} ;enter curly bracket below
	9::                    sendinput, {(} ;enter parentasis below
	]::                    sendinput, {{} ;enter curly bracket below
	)::									 sendinput, {(} ;Enter parenthasis below
	0::										 sendinput, {(} ;Enter parenthasis below
	'::                    sendinput, {shiftdown}{altdown}{`;}{altup}{shiftup} ;select brackets
#If (& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 800 && A_PriorhotKey = "o") ;; 	 	_o Vim_
	]::                    sendinput, {}} ;enter curly bracket below
	0::										 sendinput, {)} ;Enter parenthasis below
;;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| d Vim |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#If (A_PriorKey = "d" 									   && Getkeystate("F13","p") && A_TimeSincePriorHotkey < 900) ;; 	 	_d Vim_
	; w::                     Sendinput,{ctrldown}{right}{shiftdown}{left}{ctrlup}{shiftup}{backspace}
	b::                     Sendinput,{ctrldown}{left}{shiftdown}{right}{ctrlup}{shiftup}{backspace}
	e::
	/::                    	Sendinput, {ctrldown}{z}{ctrlup}+{End}{delete}
	w::
	m::                     Sendinput, +{Home}{Backspace}
	,::                     Sendinput,{ctrldown}{shiftdown}{left}{ctrlup}{shiftup}{backspace}
	.::                     Sendinput, {ctrldown}{z}{shiftdown}{right}{ctrlup}{shiftup}{delete}
	a::											Sendinput, {ctrldown}{a}{ctrlup}{delete}
  s:: 										Sendinput,{home 2}{shiftdown}{end}{shiftup}{Backspace 2}
	space::                 sendinput, {shiftdown}{altdown}{`;}{altup}{shiftup}{delete}
;;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| s Vim |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#If (A_PriorKey = "s" 							&& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 700) ;; 	 	_s Vim_
	a::                    Sendinput, {shiftdown}{altdown}{a}{altup}{shiftup}
	/::                    Sendinput, {F3 3}+{End}
	m::                    Sendinput, {F3 3}+{Home}
	n::
												 Sendinput, {shiftdown}{ctrldown}{n}
												 keywait F13
												 sendinput {ctrlup}{shiftup}
												 return
	u::
												 Sendinput, {shiftdown}{ctrldown}{u}
												 keywait F13
												 sendinput {ctrlup}{shiftup}
												 return
	.::
	w::                    sendinput, {F3 3}{ctrldown}{shiftdown}{Right}{shiftup}{ctrlup}
	,::
	b::                    Sendinput, {F3 3}{ctrldown}{shiftdown}{left}{shiftup}{ctrlup}
	s::                    sendinput, {shiftdown}{altdown}{`;}{altup}{shiftup}
	; d::
	d::                    sendinput, {home 2}{shiftdown}{end}{shiftup}{backspace}{Delete} ;select line
	x::                    sendinput % "^{x}" tt(Clipboard,1000)
	c::                    sendinput % "^{c}" tt(Clipboard,1000)
 v::                    	clip.cutswap()

;;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| p Vim |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#If (Getkeystate("F13","p") && A_TimeSincePriorHotkey < 1000 && A_PriorHotKey = "p") ;; 	 	_p Vim_
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
		send, Settings.ini
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
	`;::send, +!#{b}
		; sleep 200
		; send, {enter}
		; return
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

;;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| y Vim |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#If (Getkeystate("F13","p") && A_TimeSincePriorHotkey < 2000 && A_PriorHotKey = "y") ;; 	 	_y Vim_
	/::                             sendinput % "{End}^c{F3}" tt(Clipboard,1000)
	m::                             Sendinput % "+{Home}^c{F3}" tt(Clipboard,1000) ;yank end{shiftdown}{altdown}{`;}{altup}{shiftup}
	`;::                            Sendinput % "+!{;}^c{F3}" tt(Clipboard,1000) ;encase
	l::                             Sendinput % "{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}^{c}{F3}" tt(Clipboard,1000)
	h::                             Sendinput % "{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}^{c}{F3}" tt(Clipboard,1000)
	.::															sendinput % "{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}^c{F3}" tt(Clipboard,1000)
	w::                             sendinput % "{ctrldown}{right}{shiftdown}{left}{shiftup}{c}{ctrlup}{F3}" tt(Clipboard,1000)
	,::															sendinput % "{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}^{c}{F3}" tt(Clipboard,1000)
	b::                             Sendinput % "{ctrldown}{shiftdown}{left}{shiftup}{c}{ctrlup}{F3}" tt(Clipboard,1000)
	d::                            sendinput % "{Home 2}{shiftdown}{End}{right}{shiftup}^{x}" tt(Clipboard,1000)
	y::                            sendinput % "{Home 2}{shiftdown}{End}{right}{shiftup}^{c}{F3}" tt(Clipboard,1000)
 */


	F13 & r::reloadscript()
	F13 & q::SavedTextMenu()
  F13 & j::Vim.down()
	F13 & l::Vim.right()
	F13 & h::Vim.left()
	F13 & k::Vim.up()
	F13 & f::Vim.Find()
	F13 & o::Vim.NewLine()
	F13 & n::Vim.SelectNext()
	F13 & u::Vim.SelectPrevious()
	F13 & i::Vim.DuplicateLine()
	F13 & m::Vim.Home()
	F13 & w::
	F13 & .::Vim.WordRight()
	F13 & b::
	F13 & ,::Vim.WordLeft()
	F13 & /::Vim.End()
	F13 & x::Vim.Delete()
	F13 & a::Vim.SelectAl l()
	F13 & d::Vim.Backspace()
	F13 & 9::Vim.OpenParentheses()
	F13 & 0::Vim.CloseParentheses()
	F13 & p::                   		Sendinput,{F9} ;quick open editors view
	F13 & down::									  sendinput, {altdown}{lwindown}{down}{altup}{lwinup}
	F13 & up::									    sendinput, {altdown}{lwindown}{up}{altup}{lwinup}
	F13 & left::									  sendinput, {altdown}{lwindown}{left}{altup}{lwinup}
	F13 & right::									  sendinput, {altdown}{lwindown}{right}{altup}{lwinup}
	F13 & ':: 											sendinput,{right}{ctrldown}{left}{shiftdown}{right}{'}{ctrlup}{shiftup}
	F13 & `;::        							Sendinput,!^{/} ;Vim_Comment()

	; 9 & 0::													Sendinput,{)}

	F19 & F20::delete
	F19 & space::Backspace


#If Getkeystate("F13","p") 	;;=|||-   [ JUST F13 ]   -|||=
	s & d::									sendInput, {shiftdown}{ctrldown}{lwindown}{d}{lwinup}{ctrlup}{shiftup}
	s & c::									sendInput, {shiftdown}{ctrldown}{lwindown}{]}{lwinup}{shiftup}{c}{ctrlup}
	s & x::									sendInput, {shiftdown}{ctrldown}{lwindown}{]}{lwinup}{shiftup}{x}{ctrlup}
	s & a::									sendInput, ^{a}
	s up::											sendinput, {right}{ctrldown}{left}{shiftdown}{right}{ctrlup}{shiftup}
	^s::											sendinput, {shiftdown}{altdown}{s}{altup}{shiftup}
	t::                     Sendinput,+!{F9}
	^`;::                   Sendinput,{shiftdown}{ctrldown}{altdown}{`;}{ctrlup}{altup}{shiftup}
	Tab::           return ;        Sendinput,{shiftdown}{ctrldown}{altdown}{f7}{altup}{ctrlup}{shiftup} ; next sugjesstion
	Tab & h::			   Sendinput,{ctrldown}{[}{ctrlup}
	Tab & l::        Sendinput,{ctrldown}{]}{ctrlup}
	Tab & j::        sendinput, {down}
	Tab & k::        sendinput, {up}
	^]::                    Sendinput,{right}^{left}+^{right}+{[}
	^[::                    Sendinput,{right}^{left}+^{right}{[}
	; ]::                     Sendinput,+!#{]} ;go to bracket right
	; [::                     Sendinput,+#{[} ;go to bracket left
	[::                Sendinput, #{F3}
	]::               Sendinput, +#{f3}
	; '::  										SendInput,!{'} go back to previous ediet
	lbutton::					send, {click} ;click up left
	y::                    	sendInput, {shiftdown}{ctrldown}{lwindown}{]}{lwinup}{shiftup}{c}{ctrlup}
	c::                  		sendInput, {shiftdown}{ctrldown}{lwindown}{]}{lwinup}{shiftup}{c}{ctrlup} ;send, ^{c} ;  send,^{c}
	g::                     Sendinput,^g ;Git
	z::                      send, {F3}
	v::                      send, {F18}
	^r::										 sendinput, {F5}
	Enter::                  Sendinput,{shiftdown}{enter}{shiftup}
	; ^space::                 Sendinput,{shiftdown}{altdown}{ctrldown}{5}{ctrlup}{altup}{shiftup}
	#if

; #if Getkeystate("Tab","p")
	tab & `::				sendinput, ^!{0} ;unfold all
	tab & `;::       Sendinput,!^{/} ;unfold all
	tab & h::			   Sendinput,{ctrldown}{altdown}{[}{altup}{ctrlup}
	tab & l::        Sendinput,{ctrldown}{altdown}{]}{altup}{ctrlup}

	tab & j::
									if Getkeystate("LControl","p")
										send, {shiftdown}{down}{shiftup}
									else
										sendinput, {shiftdown}{altdown}{ctrldown}{'}{ctrlup}{altup}{shiftup}
									return
	tab & k::
									if Getkeystate("LControl","p")
										send, {shiftdown}{up}{shiftup}
									else
						        sendinput, {shiftdown}{altdown}{k}{altup}{shiftup}
									return
	tab & n::        sendinput, {shiftdown}{lwindown}{h}{lwinup}{shiftup}
	tab & u::        sendinput, {shiftdown}{lwindown}{k}{lwinup}{shiftup}
	tab & ,::        sendinput, +!^{left}
	tab & .::        sendinput, +!^{.}
	tab & a::        Sendinput,{shiftdown}{altdown}{lwindown}{a}{lwinup}{altup}{shiftup} ;align vertically
	tab & w::        Sendinput,{shiftdown}{altdown}{lwindown}{w}{lwinup}{altup}{shiftup} ;fold region-current
	tab & F13::      Sendinput,{shiftdown}{altdown}{lwindown}{4}{lwinup}{altup}{shiftup} ;unfold All
	tab & s::        Sendinput,{shiftdown}{altdown}{lwindown}{s}{lwinup}{altup}{shiftup} ;toggle column
	tab & m::        Sendinput,{shiftdown}{altdown}{ctrldown}{,}{ctrlup}{altup}{shiftup} ;fold comments
	tab & z::        Sendinput,{shiftdown}{altdown}{ctrldown}{z}{ctrlup}{altup}{shiftup} ;align cursors
	tab & x::        Sendinput,{shiftdown}{altdown}{ctrldown}{x}{ctrlup}{altup}{shiftup} ;align vertically
	tab & c::        Sendinput,{shiftdown}{altdown}{ctrldown}{c}{ctrlup}{altup}{shiftup} ;Align
	tab & p::        Sendinput,{shiftdown}{altdown}{ctrldown}{p}{ctrlup}{altup}{shiftup} ;Focus Pannel
	tab & 1::        Sendinput,^!{1} ;fold level 1
	tab & space::		 Sendinput,{shiftdown}{altdown}{lwindown}{8}{lwinup}{altup}{shiftup} ;toggle fold
	tab & 2::        Sendinput,^!{2} ;fold level 2
	tab & 3::        Sendinput,+!#{w} ;fold all except selected
	tab & 4::        Sendinput,^!{/}
	tab & f::        Sendinput,{shiftdown}{altdown}{ctrldown}{]}{ctrlup}{altup}{shiftup}
	tab & q::        Sendinput,{ctrldown}{]}{ctrlup}
	tab & appskey::return ;Send, {tab}
	; #if


	; #if Getkeystate("Tab","p") 									&& Getkeystate("F13","p")
	3::3
	$tab::send, {tab}
	Lbutton & tab::						sendinput, {shiftdown}{altdown}{\}{altup}{shiftup} ;switch column select
	q & tab::                 Sendinput,{ctrldown}{[}{ctrlup}
	q & u::										Sendinput, {q}{u}
	q::q
	`::`
~lbutton::Return


Class Vim {




	Find(){
		if Getkeystate("LControl","p")
			Sendinput,{altdown}{ctrldown}{r}{ctrlup}{altup}
		else
			sendinput, !#+{f 2}
		return
		}
	NewLine(){
		if Getkeystate("LControl","p")
	 		Sendinput,{Home}{enter}{up}
		else
	 		Sendinput,{end}{enter}
		return
		}
	SelectNext(){
		if Getkeystate("LControl","p")
	 		Sendinput,{shiftdown}{ctrldown}{n}{ctrlup}{shiftup}
		else
   		sendinput, {shiftdown}{ctrldown}{altDown}{]}{ctrlup}{altup}{shiftup} ;goto next matching word
		return
		}
	SelectPrevious(){
		if Getkeystate("LControl","p")
	 		Sendinput,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup}
		else
  		 sendinput, {shiftdown}{ctrldown}{altDown}{[}{altup}{ctrlup}{shiftup} ;go to previous matching word
		return
		}
	Home(){
		if Getkeystate("LControl","p")
	 Sendinput,{shiftdown}{Home 2}{shiftup}
		else
  Send,{Home}
		return
		}
	WordRight(){
		if Getkeystate("LControl","p")
	 Sendinput,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}
		else
		Sendinput,{ctrldown}{right}{ctrlup}
		return
		}
	WordLeft(){
		if Getkeystate("LControl","p")
	 Sendinput,{shiftdown}{ctrldown}{Left}{ctrlup}{shiftup}
		else
   Sendinput,{ctrldown}{left}{ctrlup} ;word
		return
		}
	End(){
		if Getkeystate("LControl","p")
	 Sendinput,{shiftdown}{end}{shiftup}
		else
   Send,+{end}{right} ;end of line
		return
		}
	Backspace(){
	if Getkeystate("LControl","p")
		sendinput, {shiftdown}{ctrldown}{left}{ctrlup}{shiftup}{backspace}
	else
		sendinput, {backspace}
		return
	}
	Delete(){
	if Getkeystate("LControl","p")
		sendinput, {shiftdown}{ctrldown}{right}{ctrlup}{shiftup}{delete}
	else
		sendinput, {delete}
		return
	}
	SelectAll(){
		if Getkeystate("LControl","p")
			Sendinput, {shiftdown}{altdown}{a}{altup}{shiftup} ;select All occurances
		else
			Sendinput,{home 2}{shiftdown}{end}{shiftup} ;select whole line
		Return
	}
	DuplicateLine(){
		if Getkeystate("LControl","p")
			return
		else
			Sendinput, ^{i}
		return
	}
	OpenParentheses(){
		if Getkeystate("LControl","p")
			Sendinput,{right}^{left}+^{right}+{9}
		else
			Sendinput,+{9}
		return
		}
	CloseParentheses(){
		if Getkeystate("LControl","p")
			Sendinput,{right}^{left}+^{right}+{9}+{'}
		else
			Sendinput,+{0}
		return
		}










	ChangeSelection(){
		Clipsave:=ClipboardAll
		clipboard:=
		Sendinput,^c
		clipwait, 0.25
		if errorlevel
			Sendinput,{shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
		Sendinput,{shiftdown}{ctrldown}{r}{shiftup}{ctrlup}
		sleep 200
		Sendinput,^v
		sleep 300
		Clipboard:=ClipSave
		return
	}
	Yank(Precommand:="",Cut:=""){
		global
		clipboard:=
		if Precommand
			Sendinput % PreCommand
		Send, ^{c}
		clipwait, 0.25
			; if errorlevel
				; send, {home}+{end}^{c}
		if Cut
			Sendinput, {Backspace}
		else
			send, {esc}{F3}
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
