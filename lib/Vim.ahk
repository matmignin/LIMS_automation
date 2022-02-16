#SingleInstance,Force
#Persistent
Process, Priority, , High
#NoEnv
#InstallKeybdHook
#InstallMouseHook
PasteTime:=A_TickCount
#maxthreadsperhotkey, 2
Process, Priority, , High
FormatTime, DayString,, MM/d/yy
FormatTime, TimeString, R
FormatTime, CurrentDateTime,, MM/dd/yy
SetNumlockState, on
SetscrolllockState, off
SetNumlockState Alwayson
setcapslockstate alwaysoff
#ClipboardTimeout 1500
SetTitleMatchMode, 2
try Menu, Tray, Icon, C:\Users\mmignin\Documents\VQuest\bin\Vim.ico
Menu, Tray, Add, E&xit, ExitSub
Menu, Tray, Default, E&xit
; try Run, cl3.Ahk, C:\Users\mmignin\Documents\VQuest\lib\CL3
AutoTrim, On
#include *i C:\Users\mmignin\Documents\VQuest\lib\Functions.ahk
#include *i C:\Users\mmignin\Documents\VQuest\lib\Excel.ahk
#Include *i C:\Users\mmignin\Documents\VQuest\lib\Test.ahk
#include *i C:\Users\mmignin\Documents\VQuest\lib\OpenApp.ahk
#include *i C:\Users\mmignin\Documents\VQuest\lib\KEYS.ahk
#include *i C:\Users\mmignin\Documents\VQuest\lib\Pad.ahk
#include *i C:\Users\mmignin\Documents\VQuest\lib\clip.ahk
#include *i C:\Users\mmignin\Documents\VQuest\lib\Vis\Gdip_All.ahk
#include *i C:\Users\mmignin\Documents\VQuest\lib\Vis\JSON.ahk
#include *i C:\Users\mmignin\Documents\VQuest\lib\Vis\Vis2.ahk
#include *i C:\Users\mmignin\Documents\VQuest\lib\HotStrings.ahk

return

#ifwinactive,
	Media_Play_Pause::ControlSend, , {F5}, ahk_exe Code.exe ;
	; Volume_Up::ControlSend, , {altdown}{ctrldown}{lwin down}{]}{lwin up}{ctrlup}{altup}, ahk_exe Code.exe ;
	; Volume_down::							clipboard:="K999 999-9999"


	; 	Clipboard:=
	; 	(
	; 	"K741 107-0431 0278H1`r`n
	; 	K277 888-8777`r`n
	; 	K277 111-1111`r`n
	; 	J929 910-0128 0623I1`r`n
	; 	J837 109-0445 7777A7 ct#666-6666`r`n
	; 	J837 109-0445 0670I1`r`n
	; 	J837 109-0445`r`n
	; 	J837 109-0333 0333I1`r`n
	; 	H624 104-0657`r`n
	; 	B086 108-0752 Ct#109-0635`r`n
	; 	B086 108-0752 Bulk Ct#109-0635`r`n
	; 	B086 108-0752 Bulk 109-0635`r`n
	; 	B086 108-0752  109-0635"
	; 	)
	; 	Return
	; Media_Prev::
	; 	var := clipboard
	; 	StrReplace(var, "`n","`n",LineCount)
	; 	; StringReplace, var, var, `n, `n, UseErrorLevel
	; 	msgbox, %LineCount%
	; 	return
	; ; Volume_down::				Send,			;clipboard:="K111 222-2222 3333B3 ct#444-4444"
	; Media_Next::							Clipboard:="K555 666-6666"
  ;Media_Prev::						F6 ;MakeTransparent()
	; ; Media_Play_Pause::			numlock
	; ; Media_Next::						F7
	 Media_Next::							sendinput, {altdown}{ctrldown}{lwin down}{]}{lwin up}{ctrlup}{altup} ;debug next
	;Media_Play_Pause::				sendinput, {altdown}{ctrldown}{lwin down}{\}{lwin up}{ctrlup}{altup} ;debug stat
	Media_Prev::							sendinput, {altdown}{ctrldown}{lwin down}{[}{lwin up}{ctrlup}{altup} ;debug prev


		Tab & wheelleft::^[
		Tab & wheelright::^]
		tab & F13::delete


	;;F13
	F13 & r::vscode.reloadscript()
	F13 & tab up::
		if winactive("ahk_exe WFICA32.EXE")
			excel.GetAllSheets()
			else
	SavedTextMenu()
		return
	F13 & Enter::Sendinput, {ctrldown}{enter}{ctrlup}
	; F13 & c::gosub, F19
	F13 & v::vim.visualmode()
	F13 & c::vim.visualmodeCopy()

	F13 & j::Vim.down()
	F13 & l::Vim.right()
	F13 & k::Vim.up()
	F13 & h::Vim.left()
	F13 & f::Vim.Find()
	F13 & n::Vim.SelectNext()
	F13 & u::Vim.SelectPrevious()

	F13 & s::Vim.Selection()
	F13 & m::Vim.Home()
	F13 & q::SavedTextMenu()
	; F13 & w::
	F13 & .::Vim.WordRight()
	F13 & b::sendinput, {ctrldown}{b}{ctrlup}
	F13 & ,::Vim.WordLeft()
	F13 & /::Vim.End()
	F13 & x::Vim.Delete()
	F13 & a::Vim.SelectAll()
	F13 & z::SendInput, {backspace}
	F13 & d up::
		; if getkeystate("s", "p"){
		; 	KeyWait, s, U
		; 	KeyWait, d, U
		; 	if winactive("ahk_exe Code.exe")
		; 		sendinput, {altdown}{ctrldown}{backspace}{ctrlup}{altup}
		; 	else
		; 		sendinput, {home 2}{shiftdown}{end}{shiftup}{backspace}
		; }
		; else
			Vim.Backspace()
		return
	F13 & o::vim.NewLine()
	F13 & 9::Vim.OpenParentheses()
	F13 & 0::Vim.CloseParentheses()
	F13 & p up::vim.GotoFile() ;                   		Sendinput,{F9} ;quick open editors view
                      ; sendinput, {F3} ;undo
	F13 & g::vim.Git()
	F13 & down::									  sendinput, {altdown}{lwindown}{down}{altup}{lwinup}
	F13 & up::									    sendinput, {altdown}{lwindown}{up}{altup}{lwinup}
	F13 & left::									  sendinput, {altdown}{lwindown}{left}{altup}{lwinup}
	F13 & right::									  sendinput, {altdown}{lwindown}{right}{altup}{lwinup}
	F13 & `;::        							Sendinput,!^{/} ;Vim_Comment()
	F13 & ' Up::                    		vim.Quote() ;sendinput, +{'};Sendinput,+!{F9}
	; F19 & F20::send
	F19 & space::										Backspace
	f13 & F19::											sendinput, {ctrldown}{lwindown}{[}{lwnup}{ctup}
	f13 & F20::											sendinput, {ctrldown}{lwindown}{]}{lwinup}{ctrlup}
	f13 & \::
												sendinput, {ctrldown}{lwindown}{\}{lwinup}{ctrlup}
												KeyWait, F13, U
												sleep 200
												send, {enter}
												return
	>+space::
	F13 & space::sendinput, {_}								 sendinput, {)} ;Enter parenthasis below
	; F13 up::F13


#If Getkeystate("F13","p") ;;F13
	d & s::
											if winactive("ahk_exe Code.exe"){
											 	; sendinput, {f2}
												 sendinput, {altdown}{ctrldown}{backspace}{ctrlup}{altup}
												 sleep 30
											}
											 else
											 	sendinput, {home 2}{shiftdown}{end}{shiftup}{backspace}
											KeyWait, d, U
											KeyWait, s, U
											 return
	d & ,::
											; if winactive("ahk_exe Code.exe")
											;  	sendinput, {altdown}{ctrldown}{backspace}{ctrlup}{altup}
											;  else
											 	sendinput, {shiftown}{ctrldown}{left}{ctrlup}{shiftup}{backspace}
											KeyWait, d, U
											KeyWait, `,, U
											 return
	d & .::
											; if winactive("ahk_exe Code.exe")
											;  	sendinput, {altdown}{ctrldown}{backspace}{ctrlup}{altup}
											;  else
											 	sendinput, {shiftdown}{ctrldown}{right}{ctrlup}{shiftup}{delete}
											KeyWait, d, U
											KeyWait, ., U
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
	, & .::vim.selection()
	. & ,::vim.selection()
		; keywait `,, u
		; keywait ., u
		; return
	/ & m::
	m & /::
		if winactive("ahk_exe Code.exe")
		 	sendinput, {altdown}{ctrldown}{backspace}{ctrlup}{altup}
		 else
		 	sendinput, {home 2}{shiftdown}{end}{shiftup}{backspace}
		keywait m, u
		keywait /, u
		 return
	a & s::
	s & a::
		sendinput, {home 2}{shiftdown}{end}{shiftup}^{c}
		if winactive("ahk_exe Code.exe")
			sendinput, {F3 3}
		keywait s, u
		keywait a, u
		 return
	x & s::
	s & x::
		sendinput, {home 2}{shiftdown}{end}{shiftup}^{x}
		if winactive("ahk_exe Code.exe")
			sendinput, {F3 3}
		keywait s, u
		keywait x, u
		 return
	s & c::
		sendinput, {right}{ctrldown}{left}{shiftdown}{right}{ctrlup}{shiftup}^c
		if winactive("ahk_exe Code.exe")
			sendinput, {F3 5}
		keywait s, u
		keywait c, u
		 return


	; ^`;::                   Sendinput,{shiftdown}{ctrldown}{altdown}{`;}{ctrlup}{altup}{shiftup}
	/::/
	Tab::           return ;        Sendinput,{shiftdown}{ctrldown}{altdown}{f7}{altup}{ctrlup}{shiftup} ; next sugjesstion
	h::left
	l::right
	j::down
	k::up

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

	; ^r::										 sendinput, {F5}
	Enter::                  Sendinput,{shiftdown}{enter}{shiftup}
	; ^space::                 Sendinput,{shiftdown}{altdown}{ctrldown}{5}{ctrlup}{altup}{shiftup}
	#if

	~lbutton::Return


   ;;;;;;;;;;;;;;;;;


;~^a::Send, ^c ;Ctl+A = Select All, then C

#Ifwinactive,ahk_exe Code.exe  ;;___________________________VSCODE____________________________
	Lbutton & F13::return
	F13 & Tab::
	;!+Lbutton::vscode.reloadscript()
	Mbutton::sendinput, !{f}
	; F13 & 5::												send {blind}{shiftdown}{`5}{shiftup} ;send %
	;F13 & !+Lbutton::									send % tt("`n Toggle Column Selection `n ") "^+{\}"
	F13 & Lalt::vscode.FindMatchingwindows()
	F13 & `::Sendinput,+{F9}
	; F13 & '::Sendinput,!+{F9}
	F13 & i::Vim.DuplicateLine()
	F13 & e::sendinput, {ctrldown}{F8}{ctrlup} ;expand(Peek)Deffinition

	F13 & 5::send,`%
	F13 & 1::vscode.bookmarks()
	F13 & 2::vscode.bookmarks()
	F13 & 3::vscode.bookmarks()
	F13 & 4::vscode.bookmarks()
	; F13 & 5::vscode.bookmarks()
	F13 & 6::vscode.bookmarks()
	F13 & 7::vscode.bookmarks()
	F13 & 8::vscode.bookmarks()
	F13 & 9::vscode.bookmarks()
	/ & space::								sendinput, {_}


	tab & `::				sendinput, ^!{0} ;unfold all
	tab & `;::       Sendinput,!^{/} ;unfold all
	Tab & l::
									if Getkeystate("F13","p")
										Sendinput,{ctrldown}{altdown}{]}{altup}{ctrlup}
									else
										Sendinput,{ctrldown}{]}{ctrlup}
									return
	Tab & h::
									if Getkeystate("F13","p")
										Sendinput,{ctrldown}{altdown}{[}{altup}{ctrlup}
								 	else
										Sendinput,{ctrldown}{[}{ctrlup}
									return
	tab & j::
									if Getkeystate("LControl","p")
										send, {shiftdown}{down}{shiftup}
									else if Getkeystate("F13","p")
										sendinput, {shiftdown}{altdown}{ctrldown}{'}{ctrlup}{altup}{shiftup}
									else
										sendinput, {down}
									return
	tab & k::
									if Getkeystate("LControl","p")
										send, {shiftdown}{up}{shiftup}
									else if Getkeystate("F13","p")
						        sendinput, {shiftdown}{altdown}{k}{altup}{shiftup}
									else
										Sendinput, {up}
									return
	tab & g::        sendinput, {shiftdown}{altdown}{ctrldown}{c}{ctrlup}{altup}{shiftup}
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
	;tab & p::        Sendinput,{shiftdown}{altdown}{ctrldown}{p}{ctrlup}{altup}{shiftup} ;Focus Pannel
	tab & 1::        Sendinput,^!{1} ;fold level 1
	tab & space::		 Sendinput,{shiftdown}{altdown}{lwindown}{8}{lwinup}{altup}{shiftup} ;toggle fold
	tab & 2::        Sendinput,^!{2} ;fold level 2
	tab & 3::        Sendinput,^!{3} ;fold all except selected
	Tab & p::        ; workplace switch
	tab & 4::        Sendinput,^!{4}
	tab & f::        Sendinput,{shiftdown}{altdown}{ctrldown}{]}{ctrlup}{altup}{shiftup}
	tab & appskey::return ;Send, {tab}
	3::3
	tab & q::
		if winactive("ahk_exe Code.exe")
		Sendinput,{ctrldown}{]}{ctrlup}
		else
			sendinput, {tab}
		return
	$tab::send, {tab}
	q & tab::
		if winactive("ahk_exe Code.exe")
			Sendinput,{ctrldown}{[}{ctrlup}
		else
			sendinput, {shiftdown}{tab}{shiftup}
		return

	q & u::										Sendinput, {q}{u}
	q::q
	Lbutton & tab::						sendinput, {shiftdown}{ctrldown}{\}{ctrlup}{shiftup} ;switch column select
	`::`
	/::/

	; !+Lbutton::#\
	^r::!r
	; <^h::[
	; <^l::]
	; <^r::vscode.reloadscript()


	; 	send, ^c
	; 	tt(Clipboard,1000,100,-400,,160)
	; 	return
	!t::run, Cmd.exe
	!s::send, #s
	#h::send, !{F2}
	#p::send, +!{h}
	#k::send, ^+{h}
	numpadsub::               sendinput, {shiftdown}{altdown}{ctrldown}{,}{ctrlup}{altup}{shiftup} ;open file
	numpadadd::               sendinput, {shiftdown}{altdown}{ctrldown}{.}{ctrlup}{altup}{shiftup}
	numpadmult::              send, ^{F9} ;switch workplace
	numpaddot::               numpaddot
	^numpaddot::              Sendinput,{ctrldown}{w}{ctrlup}
;;	---modifiers---
	$lwin::return
	; Lctrl & Appskey::         return
	Rshift & appsKey::   			Return
	Lshift & appsKey::   			Return
	; Lwin & Appskey::          return
	Lalt & Appskey::          return
;;		---F Keys---
	; go to file
	F20 & .::vscode.FindMatchingwindows()
	+F1::Run, windowSpy.ahk,C:\Program Files\AutoHotkey\
	F15::F15
	F20 & /:: 			 					Sendinput,{ctrldown}{f}{ctrlup}%wintitle%
	<^f19::                   Sendinput,{shiftdown}{ctrldown}{tab}{ctrlup}{shiftup}
	F20 & h::                 Sendinput,{shiftdown}{altdown}{lwindown}{left}{lwinup}{altup}{shiftup}
	F20 & k::                 Sendinput,{shiftdown}{altdown}{lwindown}{up}{lwinup}{altup}{shiftup}
	F20 & backspace::         delete
	F19 & -::                 Sendinput,{ctrldown}{-}{ctrlup}
	F19 & =::                 Sendinput,{ctrldown}{=}{ctrlup}
	; F19 & y::                 Sendinput,{ctrldown}{w}{ctrlup}
	; F19 & n::                 Sendinput,{shiftdown}{lwindown}{j}{lwinup}{shiftup}
	; F19 & u::                 Sendinput,{shiftdown}{lwindown}{k}{lwinup}{shiftup}
	; F19 & i::                 Sendinput,{F9}
	; F19 & o::                 Sendinput,+!{F9}
	; F19 & p::                 Sendinput,^{F9}
	F19 & Enter::							Sendinput,{ctrldown}{enter}{ctrlup}
	; F19 & j::                 Sendinput,+!{j}
	; F19 & k::                 Sendinput,+!{k}
	; F19 & l::                 Sendinput,{shiftdown}{ctrldown}{pgdn}{ctrlup}{shiftup}
	; F19 & h::                 Sendinput,{shiftdown}{ctrldown}{pgup}{ctrlup}{shiftup}
	; f19 & `::                 Sendinput,~
	f19 & r::                Sendinput,%process%
	f19 & c::                 Sendinput,%mouseposition%
	f19 & t::                 Sendinput,%wintitle%
	f19 & w::                 Sendinput,%wininfo%
	; f19 & /::                 Sendinput,{shiftdown}{altdown}{lwindown}{m}{lwinup}{altup}{shiftup} ;navigate bookmarks
	; F13 & lshift::						enter
	$F13::F13




Class Vim {

	VisualMode(){
		flashscreen(VisualMode)
		sendinput, {Shift down}
		Keywait, F13, U
		sendinput, {shift UP}
		flashscreen(VisualMode)
		return  ;gosub, F20
	}
	VisualModeCopy(){
		if Getkeystate("LControl","p")
			cutorclip:="x"
		else
			CutOrClip:="c"
		flashscreen(CopyMode, "Grey")
		sendinput, {Shift down}
		Keywait, F13, U
		sendinput, {shift UP}
		flashscreen("","Grey")
			send, ^%CutOrClip%
			Send, ^c
		sleep 30
		tt(clipboard,1000,A_CaretX,A_CaretY,,200)
		; Flovar(Clipboard)
		return  ;gosub, F20
	}

	VisualModeCut(){
		flashscreen(CopyMode, "grey")
		sendinput, {Shift down}
		Keywait, F13, U
		sendinput, {shift UP}
		flashscreen("","grey")
		Send, ^c
		sleep 30
		tt(clipboard,1000,A_CaretX,A_CaretY,,200)
		; Flovar(Clipboard)
		return  ;gosub, F20
	}

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
		if Getkeystate("LControl","p"){
			Sendinput,{shiftdown}{left}{shiftup}
			; keywait, LControl, U
		}
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
			sendinput, {ctrldown}{g}{ctrlup} ;focus pannel
		keywait, f13, U
		return
		}
	NewLine(){
		if Getkeystate("LControl","p")
	 		Sendinput,{Home}{enter}{up}
		else
	 		Sendinput,{end}{enter}
		return
		}
	Selection(){
		global
		while Getkeystate("F13","p"){
		if Getkeystate("LControl","p"){ ;&& Getkeystate("F13","p"){
			Sendinput,{end}{shiftdown}{home}{shiftup}
			KeyWait, s, U
			return
		}
		else If (A_TimeSincePriorHotkey > 1500) || !(A_PriorhotKey = "F13 & s") {
			sendinput, {right}{ctrldown}{left}{shiftdown}{right}{ctrlup}{shiftup}
			KeyWait, s, U
			return
			}
		else if (A_PriorhotKey = "F13 & s" && A_TimeSincePriorHotkey < 1500) { ;|| (!Getkeystate("s","p") && !Getkeystate("d","p"))
			sendinput, {lwindown}{shiftdown}{altdown}{e}{lwinup}{altup}{shiftup}
			KeyWait, s, U
			return
		}
		return
		}
		}
	Quote(){
		if Getkeystate("LControl","p")
			sendinput, {right}{ctrldown}{left}{shiftdown}{right}{ctrlup}{shiftup}+{'}
		else If Getkeystate("LControl","p")
			sendinput, {end}+{'}{F3 2}
		else
			sendinput, +{'}
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
		if getkeystate("s", "p") || getkeystate("d", "p")
			return
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
		if getkeystate("Lshift", "p"){
			sendinput, {Left}
			return
		}
		if Getkeystate("LControl","p")
			Sendinput, {shiftdown}{ctrldown}{a}{ctrlup}{shiftup} ;select All occurances
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
		else if Getkeystate("Lshift","p")
			sendinput, {end}{(}{F3 3}
		else
			Sendinput,+{9}
		return
		}
	CloseParentheses(){
		if Getkeystate("LControl","p")
			Sendinput,{right}^{left}+^{right}{shiftdown}{9}{'}{shiftup}
		else if Getkeystate("Lshift","p")
			sendinput, {end}{)}{F3 3}
		else
			Sendinput,+{0}
		return
		}
GoToFile(){
	send, {F9}
	; Input, Inputkey, L1 T3, {F13 up}
	; 		If ErrorLevel,
	; 			return
	while Getkeystate("F13","p"){
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
	Else if (InputKey = "p") || (A_PriorKey = "p"){
		send, {@}
		; return
	}
	; else
		; return
	sleep 150
	send, {enter}
	return
	}
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

SavedTextMenu() { ;; create a dropdown from SavedTextMenu ini datafile
		global
    if Getkeystate("LControl","p"){
      gosub, AddTextMenuItem
      return
    }
    else
    {
      try menu, Menu, DeleteAll
  		Loop, Read, C:\Users\mmignin\Documents\VQuest\Data\Menu.ini
  		{
  		If A_Index = 1
  			Continue
  		MenuItems := StrSplit(A_LoopReadLine, "=")
  		Selection:= % MenuItems[1]
  		Menu, Menu, add, %Selection%, SavedTextMenu
  		}
      menu, menu, add
      menu, menu, add, E&xit, ExitMenu
  		Menu, Menu, Show,
      }
		return
		SavedTextMenu:
			sleep 200
			SimpleClip:=1
			PreClip:=ClipboardAll
			Clipboard:=
			InputVar:=A_ThisMenuItem
			IniRead,vOutput, C:\Users\mmignin\Documents\VQuest\Data\Menu.ini, MenuItems, %InputVar%
			sleep 20
			Clipboard:=vOutput
			sleep 100
      menu, Menu, DeleteAll
			send, ^v
			sleep 200
			clipboard:=PreClip
			; Sendinput, %vOutput%
			SimpleClip:=
			return

      AddTextMenuItem:
      InputBox, Variable, Variable Name = Variable
      VARIABLEITEM:= "`n" Variable
      FileAppend, %VARIABLEITEM%, C:\Users\mmignin\Documents\VQuest\Data\Menu.ini
      Return
	}





VScodeTabsMenu(){
		try Menu,VScodeTabs, DeleteAll
		Menu, VScodeTabs,add, V&quest, SelectVScodeTab
		Menu, VScodeTabs,add, VAR&BAR, SelectVScodeTab
		Menu, VScodeTabs,add, &VIM, SelectVScodeTab
		Menu, VScodeTabs,add, &Excel, SelectVScodeTab
		Menu, VScodeTabs,add, &LMS, SelectVScodeTab
		Menu, VScodeTabs,add, &temp, SelectVScodeTab
		Menu, VScodeTabs,add, &Test, SelectVScodeTab
		Menu, VScodeTabs,add, &VScode, SelectVScodeTab
		Menu, VScodeTabs,add, &OpenApp, SelectVScodeTab
		Menu, VScodeTabs,add, &Menu, SelectVScodeTab
		Menu, VScodeTabs,add, &Functions, SelectVScodeTab
		Menu, VScodeTabs,add, &clip, SelectVScodeTab
		Menu, VScodeTabs,add, &HotStrings, SelectVScodeTab
		Menu, VScodeTabs,add, &KEYS, SelectVScodeTab
		Menu, VScodeTabs,add, P&ad, SelectVScodeTab
		menu, VsCodeTabs,add
		Menu, VScodeTabs,add, &Previous, SelectVScodeTab
		Menu, VScodeTabs,add, E&xit, SelectVScodeTab
		Menu, VscodeTabs,Show
		return

SelectVScodeTab:
	If (A_ThisMenuItem Contains E&xit) {
		Menu,VScodeTabs, DeleteAll
		return
		}
	If (A_ThisMenuItem Contains &Previous) {
		send, {F9}
		sleep 50
		send, {down}
	}
	else {
		ThisMenuItem:= StrReplace(A_ThisMenuItem, "&","")
		send, {F9}
		sleep 50
		send % ThisMenuItem ".ahk"
	}
	sleep 200
	send, {enter}
	Menu,VScodeTabs, DeleteAll
	return
	}






class VScode{

	FindMatchingwindows(){
			global
			winGetTitle, CurrentLMSwindow, ahk_exe WFICA32.EXE
		; Pop(SubStr(CurrentLMSwindow, 1, 20))
			winactivate, ahk_exe Code.exe
			send, ^{f}
			sleep 200
			sendinput % SubStr(CurrentLMSwindow, 1, 25)
		}

	reloadscript(){
		global
		Sendinput, ^s
		flashscreen("reload","grey")
		; winSet, Transparent, 155, ahk_exe Code.exe
		sleep 100
		; winSet, Transparent, off, ahk_exe Code.exe
		try	run, VQuest.ahk, C:\Users\mmignin\Documents\VQuest
		if A_DebuggerName || DebuggingScript
		{
				varbar.SaveVariables()
				ControlSend, , {F5}, ahk_exe Code.exe
				return
				}
		else
		{
			varbar.SaveVariables()
			try	run, VQuest.ahk, C:\Users\mmignin\Documents\VQuest
			; catch
				; reload
		}
	}
	Bookmarks(){
		StringTrimLeft, ThisNumber, A_ThisHotkey, 6
		if Getkeystate("LControl","p"){
			Sendinput,^+!{%ThisNumber%}
		}
		else
			Sendinput,^{%ThisNumber%}
			return
	}
			; global
			; try Menu,Menu, DeleteAll
			;   Menu, Menu, add, All &Products,   <#Space
			;   Menu, Menu, add, All &Batches,    <!Space
			;   Menu, Menu, add, All &WorkSheets, F19 & up
			;   ; Menu, Menu, add, %Product%, F20 & left
			;   Menu, Menu, add, Products_Tab, <#space
			;   Menu, Menu, add, Batches_Tab, <!space
			;   if winactive("ahk_exe Code.exe")
			;     Menu, Menu, add, &LMS Title, InputToVsCode
			;     Menu, Menu, add, window &Title, InputToVsCode
			;     Menu, Menu, add, window &Process, InputToVsCode
			;     Menu, Menu, add, &Click Position, InputToVsCode
			;     Menu, Menu, add, &Mouse Position, InputToVsCode
			;     Menu, Menu, add, window Location, InputToVsCode
			;     Menu, Menu, add,
			;       Menu, Menu, add, E&xit, ExitMenu
			;   Menu, Menu, Show
			;   ; KeyWait, Rbutton, U
			;     ; try Menu,Menu, DeleteAll
			; }




    Menu(){
    global
		try Menu,Menu, DeleteAll
    if winactive("ahk_exe Code.exe")
      Menu, Menu, add, &LMS Title, InputToVsCode
    Menu, Menu, add, window Title, InputToVsCode
    Menu, Menu, add, window Process, InputToVsCode
    Menu, Menu, add, Click Position, InputToVsCode
    Menu, Menu, add, Mouse Position, InputToVsCode
    Menu, Menu, add, window Location, InputToVsCode
    Menu, Menu, add,
    Menu, Menu, add, E&xit, ExitMenu
    try Menu, Menu, Show
    return

    InputToVSCode:
    if A_thismenuItem contains &LMS Title
    {
      winactivate, ahk_exe WFICA32.EXE
      windowInfo()
      winactivate, ahk_exe Code.exe
      send % wintitle
      return
    }
    else if (A_thismenuitem Contains E&xit) || (A_priorkey contains esc)
      Menu,Menu, DeleteAll
    else
    {
    tt("find window and click space",3000)
    KeyWait, Space, d
    windowInfo()
    winactivate, ahk_exe Code.exe
    sleep 200
    if A_thismenuItem contains window &Title
      send % wintitle
    else if A_thismenuItem contains window &Process
      send % Process
    else if A_thismenuItem contains &Click Position
      send % "{click " MousePosition "}"
    else if A_thismenuItem contains &Mouse Position
      send % MousePosition
    else if A_thismenuItem contains window Location
      send % winLocation
    ; sendinput, %A_thismenuItem%
    try Menu,Menu, DeleteAll
    }
    return
    }
}