
	; VIM:ahk_exe

; #IfWinActive, ahk_exe Code.exe
	#if MouseClip && winactive("ahk_exe Code.exe")
		Mbutton::Test_1()
	#if
#IfWinActive, ahk_exe Code.exe
  numpadsub::             numpadsub
  numpadadd::             numpadadd
  numpadmult::            send, {shiftdown}{altdown}{lwindown}{up}{-}{lwinup}{altup}{shiftup}
  numpaddiv::             numpaddiv
  ^numpaddiv::            send, {ctrldown}{w}{ctrlup}
  Mbutton::     					TrackPad.3Tap() 
  F19 up::                send, {F19}
  f8::                    send, {ctrldown}{d}{ctrlup}
  $^z::send, {ctrldown}{z}{ctrlup}
  $^l::send, {ctrldown}{]}{ctrlup}
  $^h::send, {ctrldown}{[}{ctrlup}
  ; $^k::send, {ctrldown}{up}{ctrlup}
  ; $^j::send, {ctrldown}{down}{ctrlup}
  $+^z::send, {shiftup}{Ctrldown}{y}{CtrlUp}
    
  $Lwin Up::            Send, {shiftdown}{altdown}{i}{lwinup}{altup}{shiftup}
  Tab & h::             send, {ctrldown}{[}{ctrlup}
  Tab & l::             send, {ctrldown}{]}{ctrlup}
  Tab & j::             down
  Tab & k::             up
  Tab & f13::           send, {shiftdown}{altdown}{lwindown}{q}{lwinup}{altup}{shiftup}
  Tab & 1::             send, {shiftdown}{altdown}{lwindown}{1}{lwinup}{altup}{shiftup}
  Tab & 2::             send, {shiftdown}{altdown}{lwindown}{2}{lwinup}{altup}{shiftup}
  Tab & 3::             send, {shiftdown}{altdown}{lwindown}{3}{lwinup}{altup}{shiftup}
  Tab & `::             send, {shiftdown}{altdown}{lwindown}{``}{lwinup}{altup}{shiftup}
  Tab & F15::           send, {ctrldown}{]}{ctrlup}
  F14::                 ReloadScript()
  ; F17::                 send, {shiftdown}{altdown}{ctrldown}{x}{ctrlup}{altup}{shiftup}
  ` & Tab::             send, {shiftdown}{altdown}{lwindown}{q}{lwinup}{altup}{shiftup}
  Tab & q::             send, {shiftdown}{altdown}{lwindown}{q}{lwinup}{altup}{shiftup}
  ; `::                 send, {``}
  $^F::                  
                        tt("`n -----------------------Find----------------- `n",2000,A_CaretX,A_Carety)
                        send, {ctrldown}{f}{ctrlup}
                        return
  F6::                  F6
  F7::                  F7
  F8::                  F8
  F9::                  F9
  F20 & Right::           WinMove, ahk_exe Code.exe, , 1858, -1080, 1642, 1087
  F21 & Right::           WinMove, ahk_exe Code.exe, , 1858, -1080, 1642, 1087
  F20 & Down::            WinMove, ahk_exe Code.exe, , 603, 14, 1963, 1354
  F21 & Down::            WinMove, ahk_exe Code.exe, , 603, 14, 1963, 1354
  F19 & left::            send, {shiftdown}{lwindown}{altdown}{left}{altup}{lwinup}{shiftup}
  F19 & up::              send, {shiftdown}{lwindown}{altdown}{up}{altup}{lwinup}{shiftup}
  F19 & down::            send, {shiftdown}{lwindown}{altdown}{down}{altup}{lwinup}{shiftup}
  F19 & right::           send, {shiftdown}{lwindown}{altdown}{right}{altup}{lwinup}{shiftup}
  F19 & -::               send, {ctrldown}{-}{ctrlup}
  F19 & =::               send, {ctrldown}{=}{ctrlup}
  F19 & y::               send, {ctrldown}{w}{ctrlup}
  F19 & /::               send, {shiftdown}{altdown}{ctrldown}{/}{ctrlup}{altup}{shiftup}
  F19 & i::               send, {numpad9}@
  F19 & p::               send, {numpad8}
  tab & f::                sendinput,{shiftdown}{altdown}{ctrldown}{]}{ctrlup}{altup}{shiftup}
  tab::                  tab
  `::                    send, {``}
  !t::                   TT(trackpadhints,5000)
  <^r::                  reloadscript()
  LCtrl & Appskey::     return
  <^f19::               send,{shiftdown}{ctrldown}{tab}{ctrlup}{shiftup}
  Lshift::              DoublePress("{ctrldown}{F6}{ctrlup}",,"Backward")
  ^Lshift::             send, {ctrldown}{y}{ctrlup}
  Rshift::              DoublePress("{ctrldown}{F7}{ctrlup}",,"Forward")
  LCtrl up::            doublepress("{altdown}{shiftdown}{up}{shiftup}{altup}")
  Lwin & Appskey::      return
  Lalt & Appskey::      return
  Lwin::                doublepress("{altdown}{shiftdown}{up}{shiftup}{altup}+{2}")
  rshift & space::      send,{shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
  <^lwin::              delete
  <+space::             send,{shiftdown}{altdown}{ctrldown}{e}{ctrlup}{altup}{shiftup}
  rbutton & f7::        wheel_2("!{right}",10)
  rbutton & f6::        wheel_2("!{left}",10)
  rbutton & lbutton::   sendinput,{shiftdown}{click}{shiftup}
  rbutton & wheeldown:: wheel_2("{ctrldown}v{ctrlup}",2000)
  rbutton & wheelup::   wheel_2("{ctrldown}x{ctrlup}",2000)
  rbutton & f19::       vs_code_windowinfo()
  rbutton up::          click R
  ^s::                  sendinput, {ctrldown}{end}{ctrlup}
  f9 & f6::             return
  F20 & h::             send, {shiftdown}{altdown}{lwindown}{left}{lwinup}{altup}{shiftup}
  F21 & h::             send, {shiftdown}{altdown}{lwindown}{left}{lwinup}{altup}{shiftup}
  F20 & k::             send, {shiftdown}{altdown}{lwindown}{up}{lwinup}{altup}{shiftup}
  F21 & k::             send, {shiftdown}{altdown}{lwindown}{up}{lwinup}{altup}{shiftup}
  F20 & j::             send, {shiftdown}{altdown}{lwindown}{down}{lwinup}{altup}{shiftup}
  F21 & j::             send, {shiftdown}{altdown}{lwindown}{down}{lwinup}{altup}{shiftup}
  F20 & l::             send, {shiftdown}{altdown}{lwindown}{right}{lwinup}{altup}{shiftup}
  F21 & l::             send, {shiftdown}{altdown}{lwindown}{right}{lwinup}{altup}{shiftup}
  F19 & k::             send, {shiftdown}{altdown}{lwindown}{up}{lwinup}{altup}{shiftup}
  F19 & j::             send, {shiftdown}{altdown}{lwindown}{down}{lwinup}{altup}{shiftup}
  F19 & l::             send, {shiftdown}{ctrldown}{pgdn}{ctrlup}{shiftup}
  F19 & h::             send, {shiftdown}{ctrldown}{pgup}{ctrlup}{shiftup}
  F20 & backspace::     delete
  F21 & backspace::     delete
  f19 & `::             send, ~
  f19 & r::             send, %process%
  f19 & c::             send, %mouseposition%
  f19 & t::             send, %wintitle%
  f19 & w::             send, %wininfo%
  f19 & n::             send, {shiftdown}{altdown}{lwindown}{m}{lwinup}{altup}{shiftup} ;navigate bookmarks
  f19 & f6::            send,{ctrldown}{[}{ctrlup}
  f19 & f7::            send,{ctrldown}{]}{ctrlup}
  f19 & wheeldown::     send,{ctrldown}{down}{ctrlup}
  f19 & wheelup::       send,{ctrldown}{up}{ctrlup}


; #If (A_PriorKey = "F19" AND A_TimeSincePriorkey < 950)
;   numpadsub::             numpadsub
;   numpadadd::             numpadadd
;   numpadmult::            send, {shiftdown}{altdown}{lwindown}{p}{lwinup}{altup}{shiftup}
;   numpaddiv::             send, {ctrldown}{w}{ctrlup}
;   F8::                    send, {ctrldown}{F8}{ctrlup}
;   F9::                    send, {ctrldown}{F9}{ctrlup}
;   F7::                    send, {ctrldown}{F7}{ctrlup}
;   F6::                    send, {ctrldown}{F6}{ctrlup}
;   ; wheeldown::             tt(yo)
;   #if

#ifwinactive

^F13:   
	#If Getkeystate("F13","p") && Getkeystate("LControl","p")
	j::           send,{shiftdown}{down}{shiftup}
	l::           send,{shiftdown}{right}{shiftup}
	h::           send,{shiftdown}{left}{shiftup}
	k::           send,{shiftdown}{up}{shiftup}
	w::           send,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}
	b::           send,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}
	o::           Send,{Home}{enter}
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
  #If 

; +F13:    
	; #If Getkeystate("F13","p") && Getkeystate("Lshift","p")
	; k::           send, {up 10}
	; +k::          send, {up 10}
	; j::           send, {down 10}
	; +j::          send, {down 10}

Capslock: 
#If (Getkeystate("F13","p") && A_PriorHotKey = "d" AND A_TimeSincePriorHotkey < 800)
		w::           send, {shiftdown}{altdown}{ctrldown}{7}{ctrlup}{altup}{shiftup}
		4::           send, +{end}^{x}
		5::           send, ^{m}^{x}
		0::           send, +{home}^{x}
		d::           Send, {shiftdown}{ctrldown}{lwindown}{d}{lwinup}{ctrlup}{shiftup}
		[::           send, {shiftdown}{altDown}{ctrldown}{9}{ctrlup}{altup}{shiftup}{delete}
		]::           send, {shiftdown}{altDown}{ctrldown}{9}{ctrlup}{altup}{shiftup}{delete}
#If (Getkeystate("F13","p") && A_PriorHotKey = "y" AND A_TimeSincePriorHotkey < 400)
		d::           Send,{home 2}+{end}^c
		; w::         send,{right}{ctrldown}{left}{shiftdown}{right}{shiftup}{c}{Ctrlup}
		5::           send, ^m^c
		4::           send, +{end}^c{esc}{F6 2}
		y::           send,{home}+{end}^c{esc}{F6 3}
		w::           send,{shiftdown}{altDown}{ctrldown}{s}{altup}{shiftup}{c}{Ctrlup}{esc}{F6 2}
		0::           send, +{home}^c{esc}{F6 2}
#If (Getkeystate("F13","p") && A_PriorHotKey = "v" AND A_TimeSincePriorHotkey < 500)
		w::           send,{F17}
#If (Getkeystate("F13","p") && A_PriorHotKey = "g" AND A_TimeSincePriorHotkey < 500)
    g::             send, {shiftdown}{ctrldown}{end}{ctrlup}{shiftup}
#If (Getkeystate("F13","p") && A_PriorHotKey = "p" AND A_TimeSincePriorHotkey < 500)
		p::         send,{end}{enter}^v
  #if
#If Getkeystate("F13","p")
  Rshift::pgdn
  f19 & lbutton::       ^lbutton
  p::              send, {shiftdown}{altdown}{lwindown}{9}{0}{lwinup}{altup}{shiftup}{ctrlup}
  space::         send, {shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
  ; $<^              shift
  ]::           send, {end}{return}{}}
  f::           Vim.Find()
  [::           send, {end}{{}
  y::           Clip_c()
  n::           send, {altdown}{ctrldown}{g}{ctrlup}{altup}
  tab::         send, {shiftdown}{altdown}{q}{altup}{shiftup}
  f20::         pgdn
  f21::         pgdn
  q::           send, {altdown}{,}{altup}
  1::           F1
  2::           F2
  w::           ^Right
  e::           Send, ^{right}
  a::           send,{altDown}{ctrldown}{a}{ctrlup}{altup}
  v::           send, {shiftdown}{altdown}{ctrldown}{v}{ctrlup}{altup}{shiftup}
  j::           down
  k::           Up
  t::           !down
  s::           send, {home}+{end}
  ;  space::       send, {shiftdown}{altdown}{ctrldown}{6}{ctrlup}{altup}{shiftup}
  h::           left
  l::           right
  x::           Delete
  g::           send, {ctrldown}{end}{ctrlup}
  4::           end
  0::           home ;Send
  d::           return
  ;  up::          +up
  ;  down::        +down
  ;  right::       +right
  ;  left::        +left
  b::           send,{ctrldown}{left}{Ctrlup}
  o::           Send,{end}{enter}
  ;  left::        send,{ctrldown}{[}{Ctrlup}
  ;  right::       send,{ctrldown}{]}{Ctrlup}
  ,::           send,{Altdown}{ctrldown}{/}{ctrlup}{altup}
  ; f::           Vim.find("f")
  '::           send {shiftdown}{altdown}{ctrldown}{'}{ctrlup}{altup}{shiftup}
  m::           Send,{shiftdown}{ctrldown}{altDown}{]}{Ctrlup}{altup}{shiftup}
  u::           send,{shiftdown}{ctrldown}{altDown}{[}{altup}{Ctrlup}{shiftup}
  up::          send,{Altdown}{shiftdown}{ctrldown}{up}{shiftup}{ctrlup}{altup}
  ;  down::        send,{Altdown}{shiftdown}{ctrldown}{down}{shiftup}{ctrlup}{altup}
  `;::          vim.GoToLine() 
  `::           send, {shiftdown}{altdown}{ctrldown}{i}{ctrlup}{altup}{shiftup} ;+!g
  i::           send,{ctrldown}{i}{Ctrlup}
  5::           send,{shiftdown}{ctrldown}{/}{ctrlup}{shiftup}
  r::           Vim.ChangeSelection()
	Enter::       send,{shiftdown}{enter}{shiftup}
  !F::          openapp.Firefox()
	; $F13::      send,{esc}{shiftup}{Ctrlup}{altup}
	; $<^k::      sendv,{ctrldown}{up}{ctrlup}
	; $<^l::      send,{ctrldown}{]}{ctrlup}
	; $<^h::      send,{ctrldown}{[}{ctrlup}
	; F19::         numpadadd
    ; $<^j::      send,{ctrldown}{down}{ctrlup}
	#If Getkeystate("F13","p")
  ^space::      send, {shiftdown}{altdown}{ctrldown}{5}{ctrlup}{altup}{shiftup}
	lshift::     pgup
	<^right::    send,{ctrldown}{]}{ctrlup}
	<^down::     send,{ctrldown}{down}{ctrlup}
	<^left::     send,{ctrldown}{[}{ctrlup}
	<^up::       send,{ctrldown}{up}{ctrlup}
	^4::          +end
	+o::          Send,{Home}{enter}
	^0::          +home ;Send
	^e::          Send, +^{right}
  ^j::           send,{shiftdown}{down}{shiftup}
  ^z::           send,{ctrldown}{z}{ctrlup}
	^l::           send,{shiftdown}{right}{shiftup}
	^h::           send,{shiftdown}{left}{shiftup}
	^k::           send,{shiftdown}{up}{shiftup}
	^w::           send,{shiftdown}{ctrldown}{right}{ctrlup}{shiftup}
	^b::           send,{shiftdown}{ctrldown}{left}{ctrlup}{shiftup}
	^o::           Send,{Home}{enter}
	^0::           send,{shiftdown}{Home}{shiftup}
	^4::           send,{shiftdown}{end}{shiftup} 
#if





#IfWinActive
F13::          send, {shiftdown}{altdown}{ctrldown}{6}{ctrlup}{altup}{shiftup}
PsudoNumpad:
	#If Getkeystate("F19","p")
	0::           send,{ctrldown}{0}{Ctrlup}
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
	`;::          send,{numpad0}
	; n::           Numpaddiv
	y::           numpaddot
	; b::           down
	/::           numpad0
	p::           numpad0
	=::           =
	-::           -
	h::           send,{-}
	'::           right
	Backspace::   backspace
	ENTER::       send,{enter}
	RShift::      send,{Tab}
	#if




VSCODE_Hotstrings:
  :*r:cd`;::{ctrldown}
  :*r:cu`;::{ctrlup}
  :*r:ad`;::{altdown}
  :*r:au`;::{altup}
  :*r:sd`;::{shiftdown}
  :*r:su`;::{shiftup}
  :*r:wd`;::{lwindown}
  :*r:wu`;::{lwinup}
  Modifier_Hotstrings:
  :*R:wt`;::
                        send, %wintitle%
                        return
  :*R:wm`;::
                        send, %wininfo%
                        return
  :*R:wp`;::
                        send, %process%
                        return
  :*R:mp`;::
                        send, %mouseposition%
                        return
  :*R:wc`;::
                        send, %Wincontrol%
                        return
  :*R:tt`;:: 
                        sendinput, tt(){left} 
                        return             
  :*R:hs`;::
                        InputBox, UserInput, New Hotstring,enter Hotstring,,,,,,,, 
                        sendinput, {end}{return}:`*R:%UserInput%``;::`n`t`t`t`t`t`t`t`t`t`t`tsendinput`, {enter}return{up}{end}{shiftup}{ctrldown}{v}{ctrlup}
                        return             
  :*R:we`;::
                        sendinput, WinExist(`"`"){left 2} 
                        return             
  :*R:wa`;:: 
                        sendinput, WinActive(`"`"){left 2} 
                        return                             
  :*R:tr`;::
                        sendraw, tt("")
                        sendinput, {left 2} 
                        return             
  :*R:c`;::               
                        sendraw,{ctrldown}{}{ctrlup}
                        sendinput,{left 9}
                        return
  :*R:w`;::              
                        sendraw,{lwindown}{}{lwinup}
                        sendinput,{left 9}
                        return
  :*r:a`;::              
                        sendraw,{altdown}{}{altup}
                        sendinput,{left 8}
                        return
  :*r:s`;::              
                        sendraw,{shiftdown}{}{shiftup}
                        sendinput,{left 10}
                        return
  :*r:csw`;::            
  :*r:cws`;::            
  :*r:scw`;::            
  :*r:swc`;::            
  :*r:wcs`;::            
  :*r:wsc`;::            
                        sendraw,{shiftdown}{ctrldown}{lwindown}{}{lwinup}{ctrlup}{shiftup}
                        sendinput,{left 26}
                        return
  :*r:asw`;::            
  :*r:aws`;::            
  :*r:saw`;::            
  :*r:swa`;::            
  :*r:was`;::            
  :*r:wsa`;::            
                        sendraw,{shiftdown}{altdown}{lwindown}{}{lwinup}{altup}{shiftup}
                        sendinput,{left 25}
                        return
  :*r:asc`;::            
  :*r:acs`;::            
  :*r:sac`;::            
  :*r:sca`;::            
  :*r:cas`;::            
  :*r:csa`;::            
                        sendraw,{shiftdown}{altdown}{ctrldown}{}{ctrlup}{altup}{shiftup}
                        sendinput,{left 25}
                        return
  :*r:sc`;::             
  :*r:cs`;::             
                        sendraw,{shiftdown}{ctrldown}{}{ctrlup}{shiftup}
                        sendinput,{left 18}
                        return
  :*r:sw`;::             
  :*r:ws`;::             
                        sendraw,{shiftdown}{lwindown}{}{lwinup}{shiftup}
                        sendinput,{left 18}
                        return
  :*r:sa`;::             
  :*r:as`;::             
                        sendraw,{shiftdown}{altdown}{}{altup}{shiftup}
                        sendinput,{left 17}
                        return
  :*r:ca`;::             
  :*r:ac`;::             
                        sendraw,{altdown}{ctrldown}{}{ctrlup}{altup}
                        sendinput,{left 16}
                        return
  :*r:wa`;::             
  :*r:aw`;::             
                        sendraw,{altdown}{lwindown}{}{lwinup}{altup}
                        sendinput,{left 16}
                        return
  :*R:main`;::           
                        sendraw, NuGenesis LMS - \\Remote
                        return
                        :*R:lms`;::            
                        sendraw, ahk_exe WFICA32.EXE
                        return
                        :*R:ifw`;::            
                        sendraw, ifwinactive,  
                        return
                        :*R:ifwe`;::           
                        sendraw, ifwinexists, 
                        return
                        :*R:#ifw`;::           
                        sendraw, #ifwinactive, 
                        return
                        :*R:err`;::            
                        sendraw, if ErrorLevel,
                        return
                        :*R:rtn::Return
                        return  
  #ifwinactive,


VS_Code_WindowInfo(){
	global
	CoordMode, mouse, window
	MouseGetPos, mX, mY, ,WinControl
	WinGetPos,wX,wY,wW,wH, A
	WinGetTitle, winTitle, A
	WinGetClass, Winclass, A
	WinGet, WinProcess, ProcessName, A
	MousePosition:=mX "`, " mY
	Sleep, 100
TT(MousePosition "`n Title: " winTitle " `n Process: " WinProcess " `n Control: "winControl " `n Class: " winclass "`nWindowPosition " wX ", " wY ", " wW ", " wH,3000,,,2)
	Process:= "ahk_exe " WinProcess
	WinInfo:="WinMove, " Wintitle ", , " wX ", " wY ", " wW ", " wH
	keywait, F20, U
	keywait, F21, U
	sleep 500
	; Tooltip,
	; SetTimer, RemoveToolTip, -2000
  }




DoublePress(action,SecondAction:="", ToolTip:=""){
  If (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<300){
    send, % action "{shiftup}{altup}{ctrlup}{lwinup}"
    tt(ToolTip)
  }
  Else
    send % SecondAction "{shiftup}{altup}{ctrlup}{lwinup}"
  Return
  }



FlashScreen(){
  send, #^{c}
  sleep 40
  send, #^{c}
  return
  }

TT(msg:="yo", time=1500, X=-100,Y=100,W:="") {
	global
  N=1
  CoordMode, ToolTip, Relative
	tooltip, %msg%, %X%, %Y%,%W%
	SetTimer, RemoveToolTip%W%, -%time% 
  return
  CoordMode, ToolTip, screen  
  RemoveToolTip:
  ToolTip
  N=0
  return
  RemoveToolTip1:
  ToolTip,,,,1
  N=0
  return
  RemoveToolTip2:
  ToolTip,,,,2
  N=0
  return
  RemoveToolTip3:
  ToolTip,,,,3
  N=0
  return
  RemoveToolTip4:
  ToolTip,,,,3
  N=0
  return
  }

ReloadScript(){
TT("Reload")
  IfWinExist, ahk_exe AutoHotkey.exe Vquest.ahk
    WinActivate,
  sendinput, ^s
  sleep 200
  run, VQuest.ahk
  send,{altup}{CtrlUp}{ShiftUp}{LWinUp}
  }



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