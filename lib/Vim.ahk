


	VIM:
	#If Getkeystate("F13","p")

	lbutton::vscode_menu()
	n::send, {altdown}{ctrldown}{g}{ctrlup}{altup}
	; ^n::send, {altdown}{ctrldown}{g}{ctrlup}{altup}
	tab::send,{ctrldown}{]}{ctrlup}
	f20::pgdn
	;#If (A_PriorHotKey = "v" AND A_TimeSincePriorHotkey < 500)

#If (A_PriorHotKey = "d" AND A_TimeSincePriorHotkey < 800)
	d::Send,{home}+{end}{Delete}
	w::send, {F17}{delete}
	4::send, +{end}^{x}
	5::send, ^{m}^{x}
	0::send, +{home}^{x}
#If (A_PriorHotKey = "y" AND A_TimeSincePriorHotkey < 400)
	d::Send,{home 2}+{end}^c
	; w::sendinput,{right}{ctrldown}{left}{shiftdown}{right}{shiftup}{c}{Ctrlup}
	5::sendinput, ^m^c
	4::send, +{end}^c{esc}
	y::sendinput,{home}+{end}^c{esc}
	w::sendinput,{shiftdown}{altDown}{ctrldown}{s}{altup}{shiftup}{c}{Ctrlup}{esc}
	0::sendinput, +{home}^c{esc}
#If (A_PriorHotKey = "v" AND A_TimeSincePriorHotkey < 500)
	w::send,{F17}
#If (A_PriorHotKey = "g" AND A_TimeSincePriorHotkey < 500)
	g::Send, ^{home}
	; #If (A_PriorHotKey = "p" AND A_TimeSincePriorHotkey < 500)
	; p::send,{end}{enter}^v
#If Getkeystate("F13","p")
	; w::send, {altDown}{ctrldown}{L}{ctrlup}{altup}
	p::Vim.Paste()
	1::F1
	2::F2
	; 3::F3
	w::^Right
	^w::+^Right
	e::Sendinput, ^{right}
	^e::Sendinput, +^{right}
	`::esc
	j::down
	; space::F17
	^space::send,{altDown}{ctrldown}{a}{ctrlup}{altup}
	v::send, {shiftdown}{altdown}{ctrldown}{v}{ctrlup}{altup}{shiftup}
	k::Up
	t::!down
	s::send,{shiftdown}{altDown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
	space::send,{shiftdown}{altDown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
	a::send,{shiftdown}{altDown}{ctrldown}{e}{ctrlup}{altup}{shiftup}
	; k::Up
	h::left
	; h::left
	l::right
	; l::right
	x::Delete
	g::send, ^{end}
	4::end
	^4::+end
	^0::+home ;Send
	0::home ;Send
	y::return
	d::return ; Send,{home 2}+{end}^x{delete}
	; +^j::send,{shiftdown}{altDown}{ctrldown}{down}{ctrlup}{altup}{shiftup}
	; +^k::send,{shiftdown}{altDown}{ctrldown}{up}{ctrlup}{altup}{shiftup}
	; *w::Sendinput,{ctrldown}{right}{ctrlup}
	; F13 & Rshift::send, {shiftdown}{lwindown}{ctrldown}{r}{ctrlup}{lwinup}{shiftup}
	; +w::Sendinput,{ctrldown}{right 2}{ctrlup}
	; u::Send ^z
	~Rshift::send, {shiftdown}{lwindown}{ctrldown}{r}{ctrlup}{lwinup}{shiftup}
	up::+up
	down::+down
	right::+right
	left::+left
	b::sendinput,{ctrldown}{left}{Ctrlup}
	; Shift & o::sendinput,{home}{enter}{up}
	; backspace::sendinput,{ctrldown}{backspace}{Ctrlup}
	; F13 & o::send, {end}{enter}
	o::Sendinput,{end}{enter}
	+o::Sendinput,{Home}{enter}
	; Shift & ,::sendinput, !{,}
	left::sendinput,{ctrldown}{[}{Ctrlup}
	right::sendinput,{ctrldown}{]}{Ctrlup}
	; f::sendinput,{esc}{ctrldown}{f}{Ctrlup}
	,::sendinput,{Altdown}{ctrldown}{/}{ctrlup}{altup}
	Lctrl & Space::sendinput,{shiftdown}{altDown}{a}{shiftup}{altup}
	f::Vim.find("f")
	'::"
	m::Sendinput,{shiftdown}{ctrldown}{altDown}{]}{Ctrlup}{altup}{shiftup}
	u::sendinput,{shiftdown}{ctrldown}{altDown}{[}{altup}{Ctrlup}{shiftup}
	<^j::send,{shiftdown}{down}{shiftup}
	<^l::send,{shiftdown}{right}{shiftup}
	<^h::send,{shiftdown}{left}{shiftup}
	<^k::send,{shiftdown}{up}{shiftup}
	<^w::send,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}
	$<^0::send,{shiftdown}{Home}{shiftup}
	$<^4::send,{shiftdown}{end}{shiftup}
	Lctrl & m::send,{shiftdown}{altDown}{right}{altup}{shiftup}
	lctrl & u::send,{shiftdown}{altDown}{left}{altup}{shiftup}
	up::sendinput,{Altdown}{shiftdown}{ctrldown}{up}{shiftup}{ctrlup}{altup}
	down::sendinput,{Altdown}{shiftdown}{ctrldown}{down}{shiftup}{ctrlup}{altup}
	`;::vim.GoToLine() ;+!g
	`::send, {shiftdown}{altdown}{ctrldown}{i}{ctrlup}{altup}{shiftup} ;+!g
	i::sendinput,{ctrldown}{i}{Ctrlup}
	5::sendinput,{shiftdown}{ctrldown}{/}{ctrlup}{shiftup}
	r::Vim.ChangeSelection()
	Enter::sendinput,{shiftdown}{enter}{shiftup}
	; $F13::send,{esc}{shiftup}{Ctrlup}{altup}
	; $<^k::sendinput,{ctrldown}{up}{ctrlup}
	$<^up::sendinput,{ctrldown}{up}{ctrlup}
	; $<^l::sendinput,{ctrldown}{]}{ctrlup}
	$<^right::sendinput,{ctrldown}{]}{ctrlup}
	; $<^h::sendinput,{ctrldown}{[}{ctrlup}
	$<^left::send,{ctrldown}{[}{ctrlup}
	; $<^j::send,{ctrldown}{down}{ctrlup}
	$<^down::send,{ctrldown}{down}{ctrlup}
	; ~lctrl::send, {shiftdown}{altdown}{lwindown}{down}{lwinup}{altup}{shiftup}
	$F19::
	sleep 100
	While GetKeyState("F13", "p") {
		If GetKeyState("F19", "p") {
			send, {altdown}{down}
			sleep 150
		}
		If GetKeyState("Lctrl", "p") {
			send, {altdown}{up}
			sleep 150
		}
		sleep 50	; 
		; KeyWait, F19, U 
			; sleep 200
	}
	send, {altup}
	#if

; $F13::esc
Media_Next::F17
Media_Prev::F16

	PsudoIns:
	#If Getkeystate("F19","p")
	0::sendinput,{ctrldown}{0}{Ctrlup}
		;sendlevel 1
	m::numpad1
	,::numpad2
	.::numpad3
	j::numpad4
	k::numpad5
	l::numpad6
	u::numpad7
	h::left
	i::numpad8
	o::numpad9
	`;::sendinput,{numpad0}
	n::Numpaddiv
	y::up
	b::down
	/::.
	p::*
	=::=
	-::-
	n::sendinput,{-}
	'::right
	; F20::send,{F21}
	RShift::sendinput,{Tab}
	ENTER::sendinput,{enter}
	space::SendInput, 0
		;sendlevel 0
	#if




		class Vim{

			key(){
				send, {F13}
				sleep 10
				send, {%A_thishotkey%}{esc}
				return
			}

		find(){
			global
			send,{shiftdown}{ctrldown}{f}{shiftup}{ctrlup}
			; sleep 200
			input, letter, V,{enter}{lcontrol}{Rcontrol}{return}{up}{down}{left}{right}
			; sleep 200
			send, {esc}
			; send,{ctrldown}{shiftdown}{lwindown}{c}{ctrlup}{shiftup}{lwinup}{esc}
			; , %letter%{a}
			; keywait, enter, d
			; send,{esc}
			return
		}

		GoToLine(){
			send,{shiftdown}{altdown}{g}{altUp}{shiftup}
			; sleep 200
			input, letter, L3 V T2,{lcontrol}{Rcontrol}{return}{up}{down}{left}{right}
			; sleep 200
			send, {Enter}
			; send,{ctrldown}{shiftdown}{lwindown}{c}{ctrlup}{shiftup}{lwinup}{esc}
			; , %letter%{a}
			; keywait, enter, d
			; send,{esc}
			return
		}

		ChangeSelection(){
		clipboard:=
			send, ^+!{r}^c
			clipwait,1
			send,{tab}^{a}^{v}
			return
		}
		Line(LeaderKey){
			send,{esc}
			Input, Numbers, L3,,{enter}
		send,{:}%Numbers%{enter}
			send,{a}
			return
		}

		Paste(){
			global
			KeyWait, %A_ThisHotkey%, U
			KeyWait, %A_ThisHotkey% ,D T0.25
			if errorlevel
			sendinput, ^v
			else
			sendinput,{end}{enter}^{v}
			return
		}
		}