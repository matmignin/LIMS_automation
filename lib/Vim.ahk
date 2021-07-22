


	VIM:

^F13:   
	#If Getkeystate("F13","p") && Getkeystate("LControl","p")
	j::           send,{shiftdown}{down}{shiftup}
	l::           send,{shiftdown}{right}{shiftup}
	h::           send,{shiftdown}{left}{shiftup}
	k::           send,{shiftdown}{up}{shiftup}
	w::           send,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}
	b::           send,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}
	0::           send,{shiftdown}{Home}{shiftup}
	4::           send,{shiftdown}{end}{shiftup} 
	<^m::         send,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup}
	v::           send,{shiftdown}{altdown}{lwindown}{v}{lwinup}{altup}{shiftup}
	<^v::         send,{shiftdown}{altdown}{lwindown}{v}{lwinup}{altup}{shiftup}
	<^u::         send,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup}
	^m::          send,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup}
	m::           send,{shiftdown}{ctrldown}{m}{ctrlup}{shiftup}
	u::           send,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup}
	^u::          send,{shiftdown}{ctrldown}{u}{ctrlup}{shiftup}
	Space::       send,{shiftdown}{altDown}{a}{shiftup}{altup}
	q::           send,{shiftdown}{altdown}{,}{altup}{shiftup}
	g::           send,{shiftdown}{lwindown}{g}{lwinup}{shiftup}
	f::           send,{shiftdown}{altdown}{ctrldown}{f}{ctrlup}{altup}{shiftup}
	,::						send, {shiftdown}{altdown}{ctrldown}{,}{ctrlup}{altup}{shiftup}

+F13:    
	#If Getkeystate("F13","p") && Getkeystate("Lshift","p")
	k::           sendinput, {up 10}
	+k::          sendinput, {up 10}
	j::           sendinput, {down 10}
	+j::          sendinput, {down 10}

Capslock: 
	#If Getkeystate("F13","p")
	#If (A_PriorHotKey = "d" AND A_TimeSincePriorHotkey < 800)
		d::           Send, {shiftdown}{ctrldown}{lwindown}{d}{lwinup}{ctrlup}{shiftup}
		w::           send, {shiftdown}{altdown}{ctrldown}{7}{ctrlup}{altup}{shiftup}
		4::           send, +{end}^{x}
		5::           send, ^{m}^{x}
		0::           send, +{home}^{x}
		[::           send, {shiftdown}{altDown}{ctrldown}{9}{ctrlup}{altup}{shiftup}{delete}
		]::           send, {shiftdown}{altDown}{ctrldown}{9}{ctrlup}{altup}{shiftup}{delete}
	#If (A_PriorHotKey = "y" AND A_TimeSincePriorHotkey < 400)
		d::           Send,{home 2}+{end}^c
		; w::         sendinput,{right}{ctrldown}{left}{shiftdown}{right}{shiftup}{c}{Ctrlup}
		5::           sendinput, ^m^c
		4::           send, +{end}^c{esc}{F6 2}
		y::           sendinput,{home}+{end}^c{esc}{F6 3}
		w::           sendinput,{shiftdown}{altDown}{ctrldown}{s}{altup}{shiftup}{c}{Ctrlup}{esc}{F6 2}
		0::           sendinput, +{home}^c{esc}{F6 2}
	#If (A_PriorHotKey = "v" AND A_TimeSincePriorHotkey < 500)
		w::           send,{F17}
	#If (A_PriorHotKey = "g" AND A_TimeSincePriorHotkey < 500)
		g::             send, {shiftdown}{ctrldown}{end}{ctrlup}{shiftup}
		#If (A_PriorHotKey = "p" AND A_TimeSincePriorHotkey < 500)
		p::         send,{end}{enter}^v
			
	#If Getkeystate("F13","p")
	]::           send, {end}{return}{}}
	[::           send, {end}{{}
	y::           Clip_c()
	n::           send, {altdown}{ctrldown}{g}{ctrlup}{altup}
	tab::         send, {shiftdown}{altdown}{q}{altup}{shiftup}
	f20::         pgdn
	$lshift::     pgup
	p::           Vim.Paste()
	q::           send, {altdown}{,}{altup}
	1::           F1
	2::           F2
	w::           ^Right
	e::           Sendinput, ^{right}
	^e::          Sendinput, +^{right}
	a::           send,{altDown}{ctrldown}{a}{ctrlup}{altup}
	v::           send, {shiftdown}{altdown}{ctrldown}{v}{ctrlup}{altup}{shiftup}
	j::           down
	k::           Up
	t::           !down
	s::           send, {home}+{end}
	space::       send, {shiftdown}{altdown}{ctrldown}{6}{ctrlup}{altup}{shiftup}
	^space::      send, {shiftdown}{altdown}{ctrldown}{5}{ctrlup}{altup}{shiftup}
	h::           left
	l::           right
	x::           Delete
	g::           send, {ctrldown}{end}{ctrlup}
	4::           end
	^4::          +end
	^0::          +home ;Send
	0::           home ;Send
	d::           return
	F13 & Rshift::pgdn
	up::          +up
	down::        +down
	right::       +right
	left::        +left
	b::           sendinput,{ctrldown}{left}{Ctrlup}
	o::           Sendinput,{end}{enter}
	+o::          Sendinput,{Home}{enter}
	left::        sendinput,{ctrldown}{[}{Ctrlup}
	right::       sendinput,{ctrldown}{]}{Ctrlup}
	,::           sendinput,{Altdown}{ctrldown}{/}{ctrlup}{altup}
	f::           Vim.find("f")
	'::           send {shiftdown}{altdown}{ctrldown}{'}{ctrlup}{altup}{shiftup}
	m::           Sendinput,{shiftdown}{ctrldown}{altDown}{]}{Ctrlup}{altup}{shiftup}
	u::           sendinput,{shiftdown}{ctrldown}{altDown}{[}{altup}{Ctrlup}{shiftup}
	up::          sendinput,{Altdown}{shiftdown}{ctrldown}{up}{shiftup}{ctrlup}{altup}
	down::        sendinput,{Altdown}{shiftdown}{ctrldown}{down}{shiftup}{ctrlup}{altup}
	`;::          vim.GoToLine() ;+!g
	`::           send, {shiftdown}{altdown}{ctrldown}{i}{ctrlup}{altup}{shiftup} ;+!g
	i::           sendinput,{ctrldown}{i}{Ctrlup}
	5::           sendinput,{shiftdown}{ctrldown}{/}{ctrlup}{shiftup}
	r::           Vim.ChangeSelection()
	Enter::       sendinput,{shiftdown}{enter}{shiftup}
	; $F13::      send,{esc}{shiftup}{Ctrlup}{altup}
	; $<^k::      sendinput,{ctrldown}{up}{ctrlup}
	$<^up::       sendinput,{ctrldown}{up}{ctrlup}
	; $<^l::      sendinput,{ctrldown}{]}{ctrlup}
	$<^right::    sendinput,{ctrldown}{]}{ctrlup}
	; $<^h::      sendinput,{ctrldown}{[}{ctrlup}
	$<^left::     send,{ctrldown}{[}{ctrlup}
	; $<^j::      send,{ctrldown}{down}{ctrlup}
	$<^down::     send,{ctrldown}{down}{ctrlup}
	F19::         numpadadd
#if

	
#if Getkeystate("Lcontrol","p")
		z::send, {ctrldown}{z}{ctrlup}
		l::send, {ctrldown}{]}{ctrlup}
		h::send, {ctrldown}{[}{ctrlup}
		k::send, {ctrldown}{up}{ctrlup}
		j::send, {ctrldown}{down}{ctrlup}
#IF
#IfWinActive
F13::          sendinput, {shiftdown}{altdown}{ctrldown}{6}{ctrlup}{altup}{shiftup}
PsudoNumpad:
	#If Getkeystate("F19","p")
	0::           sendinput,{ctrldown}{0}{Ctrlup}
	m::           numpad1
	,::           numpad2
	.::           numpad3
	j::           numpad4
	k::           numpad5
	l::           numpad6
	u::           numpad7
	n::           numpad1
	i::           numpad8
	o::           numpad9
	`;::          sendinput,{numpad0}
	; n::           Numpaddiv
	y::           up
	b::           down
	/::           numpad0
	p::           numpaddot
	=::           =
	-::           -
	h::           sendinput,{-}
	'::           right
	Backspace::   backspace
	ENTER::       sendinput,{enter}
	RShift::      sendinput,{Tab}
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
			input, letter, L3 V T3,{lcontrol}{Rcontrol}{return}{up}{down}{left}{right}
			; sleep 200
			send, {Enter}
			; send,{ctrldown}{shiftdown}{lwindown}{c}{ctrlup}{shiftup}{lwinup}{esc}
			; , %letter%{a}
			; keywait, enter, d
			; send,{esc}
			return
		}
	
		ChangeSelection(){
		Clipsave:=ClipboardAll
		clipboard:=
			send, ^c
			clipwait, 0.25
				if errorlevel
					send, {shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
			send, {shiftdown}{altdown}{ctrldown}{r}{altup}{shiftup}{ctrlup}
			sleep 200
			send, ^v
			sleep 300
			Clipboard:=ClipSave
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