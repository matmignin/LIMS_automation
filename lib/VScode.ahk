

#IfWinActive, ahk_exe Code.exe
    Capslock & ,::^,
    Capslock & a::!^a
    ^r::ReloadScript()
    ^k::sendinput, ^{up}
    ^l::sendinput, ^]
    ^h::sendinput, ^[
    ^j::sendinput, ^{down}
    +^j::+^down
    +^K::+^up
    +^l::^+#`;
    +^h::^+#h
    Mbutton & Wheeldown::Wheel_2("!d",1000)
    Mbutton & Wheelup::^m
    Mbutton & Rbutton::+^m ; toggle bookmark
    Mbutton::ShowDefinition()
    Rbutton & F16::Wheel_2("{backspace}", 10)
    Rbutton & F17::Wheel_2("{delete}", 10)
    Rbutton & Wheelup::Wheel_2("{ctrl down}x{ctrl up}",1000)
    Rbutton & wheeldown::Wheel_2("{ctrl down}v{ctrl up}",1000)
    Rbutton & F14::Get_WindowInfo()
    $Rbutton::Click right
    F14 & WheelDOWN::Wheel("{ctrl down}{down}{ctrl up}", 0)
    F14 & wheelUP::Wheel("{ctrl down}^{up}{ctrl up}", 0)
    F14 & F13::sendinput, #{tab}
    F14 & Mbutton::sendinput, !d
    F14 & Rbutton::+F8
    F14 & Lbutton::sendinput, ^{click}
    F14 & F18::F4
    F14::menu()
    F13 & F18::F5
    F13::sendinput, {F13}
    F13 & Lbutton::^+4
    F17::Wheel_2("!{right}",90)
    F16::Wheel_2("!{left}",90)
    F14 & F17::Wheel_2("^]")
    F14 & F16::wheel_2("^[")
    F18::ReloadScript()
    F19 & space::^+p
    F19 & h::sendinput, +!{left}
    F19 & k::sendinput, +!{up}
    F19 & j::sendinput, +!{down}
    F19 & l::sendinput, +!{right}
    F19::!left
    F20::!right
    capslock::sendinput, {esc}
    





#If WinActive("ahk_exe Code.exe") && Getkeystate("Capslock","p") ;editor
{
	,::sendinput, !`,
	m::+!down
	n::+!n
	u::+!up
	'::+^!n
	.::+F1
	up::^+up
	down::^+down
	/::sendinput, !^w
	5::^+/
}







  Get_WindowInfo() 
  {
    global
    clipboard:=
    
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

  ShowDefinition(){
    global
    If toggle := !toggle
      sendinput ^d
    else 
      sendinput, {esc}
    return
  }
