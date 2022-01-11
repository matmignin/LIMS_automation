    #Persistent
    #NoEnv
    #SingleInstance,Force
    #InstallKeybdHook
    #InstallMouseHook
    #maxthreadsperhotkey, 2
    FormatTime, DayString,, MM/d/yy
    FormatTime, TimeString, R
    FormatTime, CurrentDateTime,, MM/dd/yy
    SetNumLockState, on
    SetscrolllockState, off
		SetNumlockState Alwayson
    setcapslockstate alwaysoff
		#ClipboardTimeout 1500
    SetTitleMatchMode, 2
		Process, Priority, , High
		try Menu, Tray, Icon, C:\Users\mmignin\Documents\VQuest\bin\Vim.ico
		Menu, Tray, Add, E&xit, ExitSub
		Menu, Tray, Default, E&xit
   #include *i C:\Users\mmignin\Documents\VQuest\lib\Functions.ahk
   #include *i C:\Users\mmignin\Documents\VQuest\lib\VScode.ahk
	 #include *i C:\Users\mmignin\Documents\VQuest\lib\Vis\Gdip_All.ahk
	 #include *i C:\Users\mmignin\Documents\VQuest\lib\Vis\JSON.ahk
	 #include *i C:\Users\mmignin\Documents\VQuest\lib\Vis\Vis2.ahk


return


#ifwinactive,
	Tab & wheeldown::sendinput, ^{down}
	Tab & wheelup::sendinput, ^{up}
	Tab & wheelleft::^[
	Tab & wheelright::^]
	tab & F13::delete


;;F13
	F13 & r::reloadscript()
	F13 & q::SavedTextMenu()
	F13 & c::gosub, F19
	F13 & v::gosub, F20
  F13 & j::Vim.down()
	F13 & l::Vim.right()
	F13 & k::Vim.up()
	F13 & h::Vim.left()
	F13 & f::Vim.Find()
	F13 & o::Vim.NewLine()
	F13 & n::Vim.SelectNext()
	F13 & u::Vim.SelectPrevious()
	F13 & i::Vim.DuplicateLine()
	F13 & s::Vim.Selection()
	F13 & m::Vim.Home()
	F13 & w::
	F13 & .::Vim.WordRight()
	F13 & b::sendinput, {ctrldown}{b}{ctrlup}
	F13 & ,::Vim.WordLeft()
	F13 & /::Vim.End()
	F13 & x::Vim.Delete()
	F13 & a::Vim.SelectAll()
	F13 & d::Vim.Backspace()
	F13 & 9::Vim.OpenParentheses()
	F13 & 0::Vim.CloseParentheses()
	F13 & p::vim.GotoFile() ;                   		Sendinput,{F9} ;quick open editors view
	F13 & z::                      send, {F3} ;undo
	F13 & g up::vim.Git()
	F13 & down::									  sendinput, {altdown}{lwindown}{down}{altup}{lwinup}
	F13 & up::									    sendinput, {altdown}{lwindown}{up}{altup}{lwinup}
	F13 & left::									  sendinput, {altdown}{lwindown}{left}{altup}{lwinup}
	F13 & right::									  sendinput, {altdown}{lwindown}{right}{altup}{lwinup}
	F13 & ':: 											sendinput,{right}{ctrldown}{left}{shiftdown}{right}{'}{ctrlup}{shiftup}
	F13 & `;::        							Sendinput,!^{/} ;Vim_Comment()
	F13 & '::                    		Sendinput,+!{F9}
	F19 & F20::delete
	F19 & space::Backspace
	f13 & F19::sendinput, {ctrldown}{lwindown}{[}{lwinup}{ctrlup}
	f13 & F20::sendinput, {ctrldown}{lwindown}{]}{lwinup}{ctrlup}
	f13 & \::sendinput, {ctrldown}{lwindown}{\}{lwinup}{ctrlup}


; #If (& Getkeystate("F13","p") && A_TimeSincePriorHotkey < 800 && A_PriorhotKey = "o") ;; 	 	_o Vim_
; 	]::                    sendinput, {}} ;enter curly bracket below
; 	0::										 sendinput, {)} ;Enter parenthasis below



#If Getkeystate("F13","p") ;;F13
	s & d::
											if winactive("ahk_exe Code.exe")
											 	sendinput, {altdown}{ctrldown}{backspace}{ctrlup}{altup}
											 else
											 	sendinput, {home 2}{shiftdown}{end}{shiftup}{backspace}
											KeyWait, d, U
											 return
	s & [::
	                    sendinput, {{} ;enter curly bracket below
											keywait, s, u
											return
	s & }::
	                    sendinput, {{} ;enter curly bracket below
											keywait, s, u
											return
	s & 9::
	                    sendinput, {(} ;enter parentasis below
											keywait, s, u
											return
	s & ]::
	                    sendinput, {{} ;enter curly bracket below
											keywait, s, u
											return
	s & )::
											 sendinput, {(} ;Enter parenthasis below
											 keywait, s, u
											 return
	s & 0::
											 sendinput, {(} ;Enter parenthasis below
											 keywait, s, u
											 return
	s & '::
	                    sendinput, {shiftdown}{altdown}{`;}{altup}{shiftup} ;select brackets
											keywait, s, u
											return




	/ & m::
	m & /::
		if winactive("ahk_exe Code.exe")
		 	sendinput, {altdown}{ctrldown}{backspace}{ctrlup}{altup}
		 else
		 	sendinput, {home 2}{shiftdown}{end}{shiftup}{backspace}
		keywait m, u
		keywait /, u
		 return


	; ^`;::                   Sendinput,{shiftdown}{ctrldown}{altdown}{`;}{ctrlup}{altup}{shiftup}
	Tab::           return ;        Sendinput,{shiftdown}{ctrldown}{altdown}{f7}{altup}{ctrlup}{shiftup} ; next sugjesstion
	h::left
	l::right
	j::down
	k::up
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
	lbutton::					      send, {click} ;click up left
	y::                    	sendInput, {shiftdown}{ctrldown}{lwindown}{]}{lwinup}{shiftup}{c}{ctrlup}
	; c::                  		sendInput, {shiftdown}{ctrldown}{lwindown}{]}{lwinup}{shiftup}{c}{ctrlup} ;send, ^{c} ;  send,^{c}

	^r::										 sendinput, {F5}
	Enter::                  Sendinput,{shiftdown}{enter}{shiftup}
	; ^space::                 Sendinput,{shiftdown}{altdown}{ctrldown}{5}{ctrlup}{altup}{shiftup}
	#if

~lbutton::Return






Class Vim {

	down(){
		if Getkeystate("LControl","p")
			Sendinput,{shiftdown}{down}{shiftup}
		else if Getkeystate("Lshift","p")
			sendinput, {altdown}{lwindown}{down}{altup}{lwinup}
		else
			Sendinput,{down}
		return
		}
	up(){
		if Getkeystate("LControl","p")
			Sendinput,{shiftdown}{up}{shiftup}
		else if Getkeystate("Lshift","p")
			sendinput, {altdown}{lwindown}{up}{altup}{lwinup}
		else
			Sendinput,{up}
		return
		}
	left(){
		if Getkeystate("LControl","p")
			Sendinput,{shiftdown}{left}{shiftup}
		else if Getkeystate("Lshift","p")
			sendinput, {altdown}{lwindown}{left}{altup}{lwinup}
		else
			Sendinput,{left}
		return
		}
	right(){
		if Getkeystate("LControl","p")
			Send,{shiftdown}{right}{shiftup}
		else if Getkeystate("Lshift","p")
			sendinput, {altdown}{lwindown}{right}{altup}{lwinup}
		else
			Sendinput,{right}
		return
		}


	Find(){
		if Getkeystate("LControl","p")
			Sendinput,{altdown}{ctrldown}{r}{ctrlup}{altup}
		else
			sendinput, !#+{f 2}
		return
		}
	Git(){
		if Getkeystate("LControl","p")
			Sendinput,{shiftdown}{altdown}{ctrldown}{c}{ctrlup}{altup}{shiftup}{tab} ;Git message helper
		else
			sendinput, {ctrldown}{g}{ctrlup}4 ;focus pannel
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
	Selection(){
		global
	if Getkeystate("LControl","p") && Getkeystate("F13","p"){
		Sendinput,{end}{shiftdown}{home}{shiftup}
		return
	}
	else If (A_TimeSincePriorHotkey > 1800) || !(A_PriorhotKey = "F13 & s") {
		sendinput, {right}{ctrldown}{left}{shiftdown}{right}{ctrlup}{shiftup}
		return
		}
	else (A_PriorhotKey = "F13 & s" && A_TimeSincePriorHotkey < 800)
		sendinput, {shiftdown}{altdown}{s}{altup}{shiftup}
}


GoToFile(){
	send, {F9}
	Input, Inputkey, L1, {F13 up}
			If ErrorLevel,
				return
	if (InputKey = "q")
			send, Vquest.ahk
	Else if (InputKey = "b")
			send, VARBAR.ahk
	Else if (InputKey = "v")
			send, VIM.ahk
	Else if (InputKey = "e")
			send, Excel.ahk
	Else if (InputKey = "l")
			send, LMS.ahk
	Else if (InputKey = "t")
			send, temp.ahk
	Else if (InputKey = "t")
			send, Test.ahk
	Else if (InputKey = "s")
			send, VScode.ahk
	Else if (InputKey = "d")
			send, Settings.ini
	Else if (InputKey = "o")
			send, OpenApp.ahk
	Else if (InputKey = "m")
			send, Menu.ahk
	Else if (InputKey = "f")
			send, Functions.ahk
	Else if (InputKey = "c")
			send, clip.ahk
	; Else (if(InputKey  "=="")"
			; send, +!#{b}
	Else if (InputKey = "h")
			send, HotStrings.ahk
	Else if (InputKey = "k")
			send, KEYS.ahk
	Else if (InputKey = "j")
			send, Pad.ahk
	Else if (InputKey = "p"){
		send, {down}
		sleep 200
		send, {enter}
		return
	}
	else
		return
	sleep 250
	send, {enter}
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

}
