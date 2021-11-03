    #Persistent
    #NoEnv
    #SingleInstance,Force
    #MenuMaskKey vkE8
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
    ; SetMouseDelay, 1
    ; SetDefaultMouseSpeed, 1
    SetTitleMatchMode, 2

		try Menu, Tray, Icon, data\Vim.ico
		menu, tray, add, ReloadScript, <^r
		Menu, Tray, Add, E&xit, ExitSub
		Menu, Tray, Default, E&xit

   #include Functions.ahk 
	;  #include C:\Users\mmignin\Documents\VQuest\Vquest.ahk
; return
return
#If Getkeystate("F19","p") ;|| GetKeyState("Capslock","T")
	m::              numpad1
	+m::             M
	; F19::						 numpad0
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
	/::              sendinput, {-}
	+/::             N
	i::              numpad8
	+i::             I
	o::              numpad9
	+o::             O
	`;::             SendInput,{numpad0}
	y::              numpaddot
	p::              numpad0
	=::              =
	-::              -
	[::              left
	]::              right
	h::              sendinput, {,}
	n::              sendinput, {.}
	9::              sendinput, {(}
	0::              sendinput, {)}
	+h::             H
	'::              numpad0
	Backspace::      backspace
	ENTER::          SendInput,{enter}
	RShift::         SendInput,{Tab}
#if 
#If WinActive("ahk_exe Code.exe")  ;;___VSCODE___    
	!f:: 	                  
	sendinput, !#+{f 2}
	Input, output, L2 V, {left}{up}{right}{down}{F13}{enter}{esc}
	sendinput, {enter}{esc 2}
	return
	Mbutton::sendinput, ^{click}      
	F2::FindMatchingWindows()
	F3::Run, WindowSpy.ahk,C:\Program Files\AutoHotkey\
	F13 & Space::SendInput,{shiftdown}{altdown}{`;}{altup}{shiftup}
	Lbutton & F13::
		send, ^c
		tt(Clipboard,1000,100,-400,,160)
		return  
	F13 & Lbutton::send, {click}^{v} ;{F19}
	F13 & Rbutton::send, ^{x} ;{F20}
	; F13 & Mbutton::send, ^{x}
	F13::F13
	numlock::									send % tt("`n Toggle Column Selection `n ") "^+{\}"                 
	Media_Next::							sendinput, {altdown}{ctrldown}{lwin down}{]}{lwin up}{ctrlup}{altup}
	Media_Play_Pause::				sendinput, {altdown}{ctrldown}{lwin down}{}{lwin up}{ctrlup}{altup}
	Media_Prev::							sendinput, {altdown}{ctrldown}{lwin down}{[}{lwin up}{ctrlup}{altup}              
	; !v:: 										send, {F9}vim.ahk{enter}
	; ^+4::											send, !+{4}
	; ^+3::											send, !+{3}
	; ^+2::											send, !+{2}
	F20 & /:: 			 					SendInput,{ctrldown}{f}{ctrlup}%wintitle%

	~lbutton & F20:: 					send, !+4
	lbutton & F19:: 					send, !+3
	numpadsub::               F7
	numpadadd::               F6
	numpadmult::              send, !+{F9}
	; numpadmult::             SendInput,{F9}
	numpaddot::               numpaddot
	^numpaddot::              SendInput,{ctrldown}{w}{ctrlup}
	; Lwin::  									SendInput,{shiftdown}{altdown}{i}{altup}{shiftup} ; toggle colun selection mode
	; ^f::                     SendInput,{ctrldown}{f}{ctrlup}
	Numpadsub::               SendInput, ^{d} ;go to Deffinition
	Numpadadd::               SendInput, !^{d} ;go to reference
	$F9::                     F9
	tab::                     tab
	<^r::                     reloadscript()
	<^f19::                   SendInput,{shiftdown}{ctrldown}{tab}{ctrlup}{shiftup}
	LCtrl & Appskey::         return
	<+f19::                   SendInput,{shiftdown}{ctrldown}{tab}{ctrlup}{shiftup}
	^Lshift::   							return              
	; Rshift::   								SendInput,!^{/}              
	RShift::										sendinput,+!{i}
	; F13::lbutton
	; Lwin up::sendinput, {lbutton up}
	Rshift & appsKey::   			Return             
	Lshift & appsKey::   			Return             

	Lwin & Appskey::          return
	Lalt & Appskey::          return
	; Lwin::                    doublepress("{altdown}{shiftdown}{up}{shiftup}{altup}")
	rshift & space::          SendInput,{shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
	<+space::                 SendInput,{shiftdown}{altdown}{ctrldown}{e}{ctrlup}{altup}{shiftup}
;;		---F19 and F20---
	F20 & h::                 SendInput,{shiftdown}{altdown}{lwindown}{left}{lwinup}{altup}{shiftup}
	F20 & k::                 SendInput,{shiftdown}{altdown}{lwindown}{up}{lwinup}{altup}{shiftup}
	F20 & backspace::         delete
	F19 & -::                 SendInput,{ctrldown}{-}{ctrlup}
	F19 & =::                 SendInput,{ctrldown}{=}{ctrlup}
	F19 & y::                 SendInput,{ctrldown}{w}{ctrlup}
	F19 & n::                 SendInput,{shiftdown}{lwindown}{j}{lwinup}{shiftup}
	F19 & u::                 SendInput,{shiftdown}{lwindown}{k}{lwinup}{shiftup}
	F19 & i::                 SendInput,{F9}
	F19 & o::                 SendInput,+!{F9}
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
	f19 & /::                 SendInput,{shiftdown}{altdown}{lwindown}{m}{lwinup}{altup}{shiftup} ;navigate bookmarks
	; F13 & lshift::						enter
	; F13::F13
;;		---TAB---
	Tab & `:: 	 							
	Tab & h::               	SendInput,{ctrldown}{[}{ctrlup}
	Tab & l::               	SendInput,{ctrldown}{]}{ctrlup}
	Tab & `;::               	SendInput,!^{/}
	Tab & j::               	down
	Tab & k::               	up
	Tab & ,::               	sendinput, +!^{left}
	Tab & .::               	sendinput, +!^{.}
	Tab & a::               	SendInput,{shiftdown}{altdown}{lwindown}{a}{lwinup}{altup}{shiftup} ;align vertically
	Tab & w::               	SendInput,{shiftdown}{altdown}{lwindown}{w}{lwinup}{altup}{shiftup} ;fold all regions except current
	Tab & f13::             	SendInput,{shiftdown}{altdown}{lwindown}{4}{lwinup}{altup}{shiftup} ;unfold All
	Tab & m::               	SendInput,{shiftdown}{altdown}{ctrldown}{,}{ctrlup}{altup}{shiftup} ;fold comments
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
	` & Tab::                 SendInput,{shiftdown}{altdown}{lwindown}{q}{lwinup}{altup}{shiftup}
	` & esc::                 backspace
	Tab & q::                 SendInput,{ctrldown}{]}{ctrlup}
	q & tab::                 SendInput,{ctrldown}{[}{ctrlup}
	q & u::										SendInput, {q}{u}
	F13 & tab::								SendInput,{shiftdown}{altdown}{lwindown}{1}{lwinup}{altup}{shiftup}
	q::q
	`::`
;; 		---LCONTROL---
#if Getkeystate("LControl","p")  
	z::                        SendInput,{ctrldown}{z}{ctrlup}
	/:: 											 SendInput,{ctrldown}{n}{ctrlup}
	l::                        SendInput,{ctrldown}{]}{ctrlup}
	h::                        SendInput,{ctrldown}{[}{ctrlup}
	+z::                       SendInput,{shiftup}{Ctrldown}{y}{CtrlUp}
	y::                        SendInput,	^{n}
	Lshift::               		 SendInput, {ctrldown}{z}{ctrlup}
	Rshift::                SendInput, {ctrldown}{y}{ctrlup}
	8::return
	7::return
	6::return
	5::return
	4::return
	3::return
	2::return
	1::return



#If Getkeystate("F13","p")									&& Getkeystate("LControl","p") ;;		||| VIM + CONTROL ||| 

	j::                       SendInput,{shiftdown}{down}{shiftup}
	l::                       SendInput,{shiftdown}{right}{shiftup}
	h::                       SendInput,{shiftdown}{left}{shiftup}
	k::                       SendInput,{shiftdown}{up}{shiftup}
		w::                       
			^w::									sendinput, +{home}{backspace}										
	x::                       
		^x::										sendinput, +{end}{backspace}										
	q::												SendInput,^{a}{backspace}
	^q::											SendInput,^{a}{backspace}
	.::												SendInput,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}
	^.::											SendInput,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}
	,::
		^,::
			^b::
				b::                 SendInput,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}
	o::                       SendInput,{Home}{enter}{up}
	f::												Sendinput,!^{f}
	; v::                       SendInput,{shiftdown}{altdown}{lwindown}{v}{lwinup}{altup}{shiftup}
	<^n::                     SendInput,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup}
	^n::                      SendInput,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup} ;highlight next
	n::                       SendInput,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup} ;select next
	tab::											SendInput,{shiftdown}{altdown}{lwindown}{]}{lwinup}{altup}{shiftup}						
	[::												sendinput,{right}^{left}+^{right}{[}
	]::												sendinput,{right}^{left}+^{right}+{[}
	9::                       SendInput,{right}^{left}+^{right}+{9}
	0::                       SendInput,{right}^{left}+^{right}+{9}+{'}
	u::                       SendInput,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup}
	^u::                      SendInput,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup} ;hilight previous
	<^u::                     SendInput,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup}
	'::  											sendinput,{right}^{left}+^{right}+{'}
	^'::  										sendinput,{right}^{left}+^{right}+{'}
	z::												send, ^{F18} ;cl3 ;SendInput,{home}{enter}{up}{ctrldown}{v}{ctrlup} ;cycle cl3 plugins
	^z::											send, ^{F18} ;Cl3 search ;SendInput,{home}{enter}{up}{ctrldown}{v}{ctrlup} ;cycle cl3 plugins
	m::                       SendInput,{shiftdown}{Home 2}{shiftup}
	^/::                       SendInput,{shiftdown}{end}{shiftup} 
	/::                       SendInput,{shiftdown}{end}{shiftup} 
	s::                       SendInput,{home}+{end}
	^s::                      SendInput,{home}+{end}
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

#If (A_PriorHotKey = "d" 										&& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 800) ;; 	 	_d Vim_
	/::                                       Vim.Yank("+{End}","cut") ;yank end
	m::                                       Vim.Yank("+{Home}","cut") ;yank end
	`;::                                      Vim.Yank("+!{;}","cut") ;encase
	l::                                       SendInput,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}^{x}
	h::                                       SendInput,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}^{x}
		.::
	w::                                       sendinput, {ctrldown}{right}{shiftdown}{left}{ctrlup}{shiftup}{backspace}
		,::
	b::                                       vim.Yank("{ctrldown}{shiftdown}{left}{ctrlup}{shiftup}","cut")
	d::                                       sendinput, {Home 2}{shiftdown}{End}{right}{shiftup}{backspace}

#If (A_PriorHotKey = "y" 										&& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 800) ;; 	 	_y Vim_
	/::                                       Vim.Yank("+{End}") ;yank end
	m::                                       Vim.Yank("+{Home}") ;yank end
	`;::                                      Vim.Yank("+!{;}") ;encase
	l::                                       Send,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}^{c}
	h::                                       Send,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}^{c}
	.::
	w::                                       send, {ctrldown}{right}{shiftdown}{left}{shiftup}{c}{ctrlup}
	,::
	b::                                       Send, {ctrldown}{shiftdown}{left}{shiftup}{c}{ctrlup}
	d::                            sendinput, {Home 2}{shiftdown}{End}{right}{shiftup}^{c}
	
#If Getkeystate("F13","p") ;;	=|||-VIM F13-|||=
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
	b::											sendinput,{ctrldown}{left}{ctrlup}
	^b::                    SendInput,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}
	p::											Sendinput, ^{n}
	u::                     sendinput, {shiftdown}{ctrldown}{altDown}{[}{altup}{Ctrlup}{shiftup} ;go to previous matching word
	n::                     sendinput, {shiftdown}{ctrldown}{altDown}{]}{Ctrlup}{altup}{shiftup} ;goto next matching word
	/::                     Send,+{end}{right} ;end of line
	m::      	              Send,{Home}
	^k::                     SendInput,{shiftdown}{up}{shiftup}


	9 & 0::									SendInput,{)}

	e::                     SendInput,{ctrldown}{right}{shiftdown}{left}{ctrlup}{shiftup}{backspace} ;delete word
	^e::                  	SendInput,^{a}{backspace}			 ;block comment
	q::
	w::											sendinput, {backspace}
	^q::
	^w::											sendinput, +{Home}{backspace}
	x::											sendinput, {delete}
	^x::										sendinput, +{end}{backspace}

	t::                     SendInput,+!{F9}
	space::									SendInput,{shiftdown}{altdown}{`;}{altup}{shiftup}	;sendinput, {ctrldown}{right}{shiftdown}{left}{ctrlup}{shiftup}
	`;::        						SendInput,!^{/}
	^`;::                   SendInput,{shiftdown}{ctrldown}{altdown}{`;}{ctrlup}{altup}{shiftup}
	9::											SendInput,+{9}
	0::											SendInput,+{0}
	^9::                    SendInput,{right}^{left}+^{right}+{9}
	^0::                    SendInput,{right}^{left}+^{right}+{9}+{'}
	s::                     SendInput,+!{s}
	^s::                    SendInput,{home}+{end}
	f::                     sendinput,!#+{f 2} ;{shiftdown}{altdown}{lwindown}{f}{lwinup}{altup}{shiftup}
	^f:: 	                  sendinput,+!{s}
	F19::                   SendInput,{shiftdown}{ctrldown}{altdown}{f7}{altup}{ctrlup}{shiftup} ; next sugjesstion
	i::                     SendInput,{F9}
	^]::                    SendInput,{right}^{left}+^{right}+{[}
	^[::                    SendInput,{right}^{left}+^{right}{[}
	; ]::                     SendInput,+!#{]} ;go to bracket right
	; [::                     SendInput,+#{[} ;go to bracket left
	[::                     SendInput, {F6} 
	]::                     SendInput, {f7}
	'::  										SendInput,!{'}
	a::                     SendInput,{altDown}{ctrldown}{a}{ctrlup}{altup}
	^a::                    SendInput,{altDown}{ctrldown}{a}{ctrlup}{altup}
	c::                  		send, ^{c} ;  send,^{c}
	^c::                  	send, ^{x} ;  send,^{c}
	v::                     Send, ^{v}
	j::                     SendInput,{down}
	k::                     SendInput,{Up}
	; t::											sendinput,{ctrldown}{enter}{ctrlup}
	g::                     SendInput,^g ;Git
	d::                     return
	o::                     SendInput,{end}{enter}
	5::                      SendInput,{shiftdown}{5}{shiftup}
	; ^y::										send, ^{F18}
	z::                      send, {F18}
	^z::                      send, ^{F18}
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
	down::									  sendinput, {shiftdown}{down}{shiftup}
	up::									    sendinput, {shiftdown}{up}{shiftup}
	left::									  sendinput, {shiftdown}{left}{shiftup}
	right::									  sendinput, {shiftdown}{right}{shiftup}
	#if

	ifNothingSelected(Action, Button){
	  ClipboardSaved:=ClipboardAll
    clipboard:=
    sleep 20
    Send % Button
		tt(clipboard,750)
      ; clipwait,0.10
		if !clipboard ;if nothing selected
		{
			clipboard:=ClipboardSaved
			if Action=copy 
		{
			if winactive("ahk_exe Code.exe"){
				sendinput, {Home 2}{shiftdown}{End}{right}{shiftup}^{c}
				tt(clipboard,750)
				return
				}
			else {
			mousegetpos, mousex, mousey
			SetDefaultMouseSpeed, 0
			Click, %A_CaretX% %A_caretY%
			Click, %A_CaretX% %A_caretY%
			mousemove, %mousex%, %mousey%, 0
			SetDefaultMouseSpeed, 1
			send, ^c
			sleep 20
			tt(clipboard,500)
			return
			}
		}
			; clicktext()
		if Action=cut
			send, {delete}
		}
	}
	ClickText(){
		global
		mousegetpos, mousex, mousey
		SetDefaultMouseSpeed, 0
		Click, %A_CaretX% %A_caretY%,
		mousemove, %mousex%, %mousey%, 0
		SetDefaultMouseSpeed, 1
	}


ifPriorHotkey(The_PriorHotKey,FunctionOrAction){
	if A_PriorHotkey contains The_PriorHotkey 
	{
		if IsFunc(FunctionName)
			func(FunctionOrAction)
		else
			sendinput % FunctionOrAction
		return ;FunctionOrAction
	}
	else
		return
}


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
	FindMatchingWindows(){
		global
	  WinGetTitle, CurrentLMSWindow, ahk_exe WFICA32.EXE
  ; Pop(SubStr(CurrentLMSWindow, 1, 20))
  	winactivate, ahk_exe Code.exe
    send, ^{f}
    sleep 200
    sendinput % SubStr(CurrentLMSWindow, 1, 25)
	}

ReloadScript(){
	global

	if Note1
		IniWrite, %note1%, data.ini, Notes, note1
	if Note2
		IniWrite, %note2%, data.ini, Notes, note2
	; if Note3
		; IniWrite, %note3%, data.ini, Notes, note3
	; Tooltip, Reload
	Send, !s
	WinSet, Transparent, 155, ahk_exe Code.exe
	tt("`nRELOAD `n ",300)
	sleep 100
	WinSet, Transparent, off, ahk_exe Code.exe
;	try Run, cl3.Ahk, lib\CL3
	;	catch
	;		return
	try	run, VQuest.ahk, C:\Users\mmignin\Documents\VQuest

	sleep 200
	;	catch
		;	return
		; sleep 50"
	 ;catch ; e ;catch any errors
	 	;return
		; throw e
	 	; msgbox % e.line
	reload
	}