return
#IfWinActive,ahk_exe Code.exe  ;;___VSCODE___    
	; Mbutton::sendinput, +{F9}  
	<^h::[    
	<^l::]    
	Numlock::ReloadScript()
	F13 & numlock::									send % tt("`n Toggle Column Selection `n ") "^+{\}"                 
	Media_Next::							sendinput, {altdown}{ctrldown}{lwin down}{]}{lwin up}{ctrlup}{altup} ;debug next
	Media_Play_Pause::				sendinput, {altdown}{ctrldown}{lwin down}{\}{lwin up}{ctrlup}{altup} ;debug stat
	Media_Prev::							sendinput, {altdown}{ctrldown}{lwin down}{[}{lwin up}{ctrlup}{altup} ;debug prev  
	; Lbutton & F13::
	; 	send, ^c
	; 	tt(Clipboard,1000,100,-400,,160)
	; 	return  
	#h::send, !{F2}
	#p::send, +!{h}
	#k::send, ^+{h}
	numpadsub::               sendinput, {shiftdown}{altdown}{ctrldown}{,}{ctrlup}{altup}{shiftup} ;open file
	numpadadd::               sendinput, {shiftdown}{altdown}{ctrldown}{.}{ctrlup}{altup}{shiftup}
	numpadmult::              send, ^{F9} ;switch workplace
	numpaddot::               numpaddot
	^numpaddot::              SendInput,{ctrldown}{w}{ctrlup}
	; Numpadsub::               SendInput, ^{d} ;go to Deffinition
	; Numpadadd::               SendInput, !^{d} ;go to reference
;;	---modifiers---        
	$lwin::return
		LCtrl & Appskey::         return
	RShift::										sendinput,+!{i}
	Rshift & appsKey::   			Return             
	Lshift & appsKey::   			Return             
	; Lwin & Appskey::          return
	Lalt & Appskey::          return
	rshift & space::          SendInput,{shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
	<+space::                 SendInput,{shiftdown}{altdown}{ctrldown}{e}{ctrlup}{altup}{shiftup}
;;		---F Keys---
 ; go to file
	F2::FindMatchingWindows()
	F15::ReloadScript()
	; F3::Run, WindowSpy.ahk,C:\Program Files\AutoHotkey\
	; F13 & s::SendInput,{shiftdown}{altdown}{`;}{altup}{shiftup}
;send, {click}^{v} ;{F19}
	; F13 & s::						 sendinput, {right}{ctrldown}{left}{shiftdown}{right}{ctrlup}{shiftup} ;selectWord
	F13 & Lalt::sendinput, ^{click}
	F13 & tab::								SendInput,{shiftdown}{altdown}{lwindown}{1}{lwinup}{altup}{shiftup}
	F13 & `::sendinput, {ctrldown}{F8}{ctrlup}
	F13::F13
;;		---F19 and F20---
	F20 & /:: 			 					SendInput,{ctrldown}{f}{ctrlup}%wintitle%
	<^f19::                   SendInput,{shiftdown}{ctrldown}{tab}{ctrlup}{shiftup}
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
	
#IfWinActive



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
	varbar.SaveVariables()
	Send, !s
	WinSet, Transparent, 155, ahk_exe Code.exe
	sleep 100
	WinSet, Transparent, off, ahk_exe Code.exe
	; try	run, VQuest.ahk, C:\Users\mmignin\Documents\VQuest
	if Debugging
		ControlSend, , ^+{r}, ahk_exe Code.exe
	else
		reload
	}