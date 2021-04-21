
return
#IfWinActive, ahk_exe Code.exe
    Capslock & ,::sendinput, !^b
    Capslock & a::!^a
    Capslock & 8::F3
    Capslock & 3::+F3
    capslock::esc
    ^r::ReloadScript()
    ^k::sendinput, ^{up}
    ^l::sendinput, ^]
    ^h::sendinput, ^[
    ^j::sendinput, ^{down}
    +^j::+^down
    +^K::+^up
    +^l::^+#`;
    Mbutton & Wheeldown::Wheel_2("!d",1000)
    +^h::^+#h
    Mbutton & Wheelup::wheel_2("^m",2000)
    Mbutton & Rbutton::+^m ; toggle bookmark
    Mbutton::ToggleDefinition()
    Rbutton & F16::Wheel_2("{backspace}", 20)
      Rbutton & F17::Wheel_2("^]", 20)
    Rbutton & wheeldown::Wheel_2("{ctrl down}v{ctrl up}",1000)
    Rbutton & Wheelup::Wheel_2("{ctrl down}x{ctrl up}",1000)
    Rbutton & F14::Get_WindowInfo()
    $Rbutton::Click right
    F14 & wheelUP::Wheel("{ctrl down}^{up}{ctrl up}", 0)
    F14 & WheelDOWN::Wheel("{ctrl down}{down}{ctrl up}", 0)

    F14 & Mbutton::sendinput, !d
    F14 & Rbutton::+F8
    F14 & Lbutton::sendinput, ^{click}
    F14 & F18::F4
    F14::menu()
    F13 & F18::F5
    F13::sendinput, {F13}
    F13 & Lbutton::^+4
    F17::Wheel_2("!{right}",100)
    F16::Wheel_2("!{left}",100)
    F14 & F17::Wheel_2("^]")
    F14 & F16::wheel_2("^[")
    F18::ReloadScript()
    F20 & space::^+p
    F20 & h::sendinput, +!{left}
    F20 & k::sendinput, +!{up}
    F20 & j::sendinput, +!{down}
    F20 & l::sendinput, +!{right}
    F19 & k::F3
    F19 & j::+F3
    F20::Menu()
 


#if winactive("ahk_exe code.exe") && getkeystate("capslock","p") ;edit  or
{
	,::sendinput, +!/,
	m::+!down
	n::+!n
	u::+!up
	'::+^!n
	.::+f1
	up::^+up
	down::^+down
	/::sendinput, !^w
	5::^+/
}




#if




  Get_WindowInfo() 
  {
    global
    ;clipboard:=
    
    CoordMode, mouse, window
    MouseClick, right,,, 1, 0, D ; Hold down the right mouse button.
    Loop
    {
      if !GetKeyState("Rbutton", "P") ; The key has been released, so break out of the loop.
        break
      MouseGetPos, MousePosX, MousePosY, , WinControl
      sleep 100
      sleep 25
      WinGetTitle, winTitle, A
      WinGetClass, Winclass, A
      WinGet, WinProcess, ProcessName, A			
      Sleep, 200
      MousePosition:=MousePosX "`, " MousePosY
      Tooltip, %MousePosition%`n Title: %winTitle% `n Process: %WinProcess% `n Control: %winControl% `n Class: %winclass%

    }
    winTitle:=Wintitle
    Winclass:=Winclass
    WinGet, WinProcess, ProcessName, A	
    MouseClick, Right,,, 1, 0, U ; Release the mouse button.
    ;clipboard:=MousePosition
    mouseclick, right
    ;sendinput, {esc}
    ;MouseClick, left,,, 1, 0,
    sleep 10000
    tooltip
    return
  }

  ReloadScript(){
   global iteration
    ControlGetText, Iteration, Edit2, VarBar
    tooltip("Reload")
    if (iteration = -1)
    {
      sendinput, {F5}
      IniWrite, -2, data.ini, SavedVariables, Iteration
    }
    else if (iteration = -2)
      sendinput, {F4}
    else
    {
      sendinput, ^s
      sleep 200
      run, VQuest.ahk
    }
  }

ToggleDefinition(){
    global
    If toggle := !toggle
      sendinput ^d
    else 
      sendinput, +{esc}
    return
  }






















VIM:
#ifwinactive, 
#If (A_PriorHotKey = "d" AND A_TimeSincePriorHotkey < 4000)
{
	d::Send, {home 2}+{end}{Delete}
	w::sendinput, {right}^{left}+^{right}{backspace}
	4::sendinput, +{end}^x
	5::sendinput, ^m^x
	0::sendinput, +{home}^x
}
#If (A_PriorHotKey = "y" AND A_TimeSincePriorHotkey < 400)
{
	d::Send, {home 2}+{end}^c
	w::sendinput, {right}^{left}+^{right}+{left}^c 
	5::sendinput, ^m^c
	4::sendinput, +{end}^c{right}
	y::
	Send {home}+{end}^c
	sleep 25
	ClipWait, 1
	send, {right}
	return
	Capslock & 0::sendinput, +{home}^c
	0::sendinput, +{home}^c
}	
#If (A_PriorHotKey = "g" AND A_TimeSincePriorHotkey < 500)
	Capslock & g::Send, ^{home}

#If (A_PriorHotKey = "p" AND A_TimeSincePriorHotkey < 500)
  capslock & p::Sendinput, {esc}p{esc}

  
  
#If Getkeystate("Capslock","p")
{
	p::return
	1::F1
	2::F2
	3::F3
	`::esc
	Enter::sendinput, +^enter
	j::down
	k::Up
	h::left
	l::right
	x::Delete
	g::send, ^{end}
	4::end
	0::home
	y::return
	d::return ; Send, {home 2}+{end}^x{delete}
	w::Send {right}^{right 2}{left}
	e::Send ^{right}
	u::Send ^z
	up::+up
	down::+down
	right::+right
	left::+left
	b::^left
	Shift & o::sendinput, {home}{enter}{up}
	5::Send ^m
	o::Send, {end}{enter}
  +o::Send, {Home}{enter}
	Shift & ,::sendinput, +{F1}
	left::sendinput, {home}+{Tab}
	right::sendinput, {home}{Tab}
v up::
	while GetKeyState("Capslock","p")
		sendinput, {Shift down}
	sleep 200
	sendinput, {shift up}
	return
#if
}



#If Getkeystate("F19","p") || getkeystate("Capslock", "T")=True ;AND A_TimeSincePriorHotkey < 1000) || (A_PriorHotKey = "Numpad4" AND A_TimeSincePriorHotkey < 1000)    ;________________________________________Psudo Numpad
	;sendlevel 1
   m::numpad1
	 ,::numpad2
	 .::numpad3
	 j::numpad4
	 k::numpad5
	 l::numpad6
	 u::numpad7
   h::numpadsub
	 i::numpad8
	 o::numpad9
	 `;::sendinput, {numpad0}
	 n::Numpaddiv
	 /::,
	 p::numpadmult
	 '::numpadDot
  ~ENTER::sendinput, {enter}
   F19::
   F20::
   space::
  Capslock::
   SetCapsLockState off
   tooltip
   return

    
   ;sendlevel 0
		#if
#IfWinActive,
F19::
   SetCapsLockState % !GetKeyState("CapsLock", "T")
   tooltip, NUMLOCK
  return
  
return
CapslockTimer:
while (A_TimeSincePriorHotkey < 900)
  sleep 800
SetCapsLockState Off
return

	F20 & \::Sendinput, mmignin{tab}Kilgore7744
	F19 & \::Sendinput, ?Kilgore7744
	#!\::Login()
  
  
  
  
DoublePress(){
	if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 400) 
	{
		Sendinput, {%A_ThisHotkey%}
		return
	}
	return
}


Login(){
		sendinput, 4130220009588038
		trayTip, ,11/21  127
		return
	}
