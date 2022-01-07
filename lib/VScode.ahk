return
#Ifwinactive,ahk_exe Code.exe  ;;___VSCODE___
	Mbutton::sendinput, +{F9}
	; F13 & 5::												send {blind}{shiftdown}{`5}{shiftup} ;send %
	F13 & numlock::									send % tt("`n Toggle Column Selection `n ") "^+{\}"
	F13 & Lalt::FindMatchingwindows()
	F13 & e::sendinput, {ctrldown}{F8}{ctrlup} ;expand(Peek)Deffinition
	F13 & z::F3
	F13 & 5::send,`%
	F13 & 4::        Sendinput,^!{4}
	F13::F13

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
	tab & p::        Sendinput,{shiftdown}{altdown}{ctrldown}{p}{ctrlup}{altup}{shiftup} ;Focus Pannel
	tab & 1::        Sendinput,^!{1} ;fold level 1
	tab & space::		 Sendinput,{shiftdown}{altdown}{lwindown}{8}{lwinup}{altup}{shiftup} ;toggle fold
	tab & 2::        Sendinput,^!{2} ;fold level 2
	tab & 3::        Sendinput,^!{3} ;fold all except selected
	tab & 4::        Sendinput,^!{4}
	tab & f::        Sendinput,{shiftdown}{altdown}{ctrldown}{]}{ctrlup}{altup}{shiftup}
	tab & q::        Sendinput,{ctrldown}{]}{ctrlup}
	tab & appskey::return ;Send, {tab}
	3::3
	$tab::send, {tab}
	Lbutton & tab::						sendinput, {shiftdown}{ctrldown}{\}{ctrlup}{shiftup} ;switch column select
	q & tab::                 Sendinput,{ctrldown}{[}{ctrlup}
	q & u::										Sendinput, {q}{u}
	q::q
	`::`



	numlock::#\
	^r::!r
	; <^h::[
	; <^l::]
	<^r::ReloadScript()
	F17::Enter
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
	^numpaddot::              Sendinput,{ctrldown}{w}{ctrlup}
;;	---modifiers---
	$lwin::return
		Lctrl & Appskey::         return
;	RShift::										sendinput,+!{i}
	Rshift & appsKey::   			Return
	Lshift & appsKey::   			Return
	; Lwin & Appskey::          return
	Lalt & Appskey::          return
	rshift & space::          Sendinput,{shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
	<+space::                 Sendinput,{shiftdown}{altdown}{ctrldown}{e}{ctrlup}{altup}{shiftup}
;;		---F Keys---
 ; go to file
	F2::FindMatchingwindows()
	F15::F15
	; F3:Run, windowSpy.ahk,C:\Program Files\AutoHotkey\
;;		---F19 and F20---
	F20 & /:: 			 					Sendinput,{ctrldown}{f}{ctrlup}%wintitle%
	<^f19::                   Sendinput,{shiftdown}{ctrldown}{tab}{ctrlup}{shiftup}
	F20 & h::                 Sendinput,{shiftdown}{altdown}{lwindown}{left}{lwinup}{altup}{shiftup}
	F20 & k::                 Sendinput,{shiftdown}{altdown}{lwindown}{up}{lwinup}{altup}{shiftup}
	F20 & backspace::         delete
	F19 & -::                 Sendinput,{ctrldown}{-}{ctrlup}
	F19 & =::                 Sendinput,{ctrldown}{=}{ctrlup}
	F19 & y::                 Sendinput,{ctrldown}{w}{ctrlup}
	F19 & n::                 Sendinput,{shiftdown}{lwindown}{j}{lwinup}{shiftup}
	F19 & u::                 Sendinput,{shiftdown}{lwindown}{k}{lwinup}{shiftup}
	F19 & i::                 Sendinput,{F9}
	F19 & o::                 Sendinput,+!{F9}
	F19 & p::                 Sendinput,^{F9}
	F19 & Enter::							Sendinput,{ctrldown}{enter}{ctrlup}
	F19 & j::                 Sendinput,+!{j}
	F19 & k::                 Sendinput,+!{k}
	F19 & l::                 Sendinput,{shiftdown}{ctrldown}{pgdn}{ctrlup}{shiftup}
	F19 & h::                 Sendinput,{shiftdown}{ctrldown}{pgup}{ctrlup}{shiftup}
	f19 & `::                 Sendinput,~
	f19 & r::                Sendinput,%process%
	f19 & c::                 Sendinput,%mouseposition%
	f19 & t::                 Sendinput,%wintitle%
	f19 & w::                 Sendinput,%wininfo%
	f19 & /::                 Sendinput,{shiftdown}{altdown}{lwindown}{m}{lwinup}{altup}{shiftup} ;navigate bookmarks
	; F13 & lshift::						enter
	; F13::F13

;;		---TAB---
VScodeTabsMenu(){
		try Menu,VScodeTabs, deleteAll
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
		Menu,VScodeTabs, deleteAll
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
	Menu,VScodeTabs, deleteAll
	return
}


	FindMatchingwindows(){
		global
	  winGetTitle, CurrentLMSwindow, ahk_exe WFICA32.EXE
  ; Pop(SubStr(CurrentLMSwindow, 1, 20))
  	winactivate, ahk_exe Code.exe
    send, ^{f}
    sleep 200
    sendinput % SubStr(CurrentLMSwindow, 1, 25)
	}

ReloadScript(){
	global
	varbar.SaveVariables()
	Send, !s
	winSet, Transparent, 155, ahk_exe Code.exe
	sleep 100
	winSet, Transparent, off, ahk_exe Code.exe
	; try	run, VQuest.ahk, C:\Users\mmignin\Documents\VQuest
if A_DebuggerName
		ControlSend, , {Numlock}, ahk_exe Code.exe
	else
		reload
	}