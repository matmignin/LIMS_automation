

#IfWinActive, ahk_exe Code.exe
{
	Capslock & ,::^,
	Capslock & a::!^a
	^r::ReloadScript()
	^k::sendinput, ^{up}
	^j::sendinput, ^{down}
	+^j::+^down
	+^K::+^up
	^l::sendinput, {home}{tab}
	^h::sendinput, {home}+{tab}
	F17::Wheel_2("!{left}",90)
	F16::Wheel_2("!{right}",90)
	F14 & WheelDOWN::Wheel("{ctrl down}{down}{ctrl up}", 0)
	F14 & wheelUP::Wheel("{ctrl down}^{up}{ctrl up}", 0)
	F14 & F13::sendinput, #{tab}
	F14 & Mbutton::sendinput, !d
	F14 & Rbutton::+F8
	F14 & Lbutton::sendinput, ^{click}
	F14::menu()
	Mbutton & Wheeldown::Wheel_2("!d",1000)
	Mbutton & Wheelup::Wheel_2("+^d",1000)
	Mbutton & Rbutton::+!Down ; toggle bookmark
	+Mbutton::+^!m
	Mbutton::ShowDefinition()
  F18 & F16::Wheel_2("{F6}")
  F18 & F17::wheel_2("+{F11}")
	F13 & F18::F5
  F15::F6
  F18::ReloadScript()
	F14 & F18::F4
	Rbutton & F16::Wheel_2("^!l", 500)
	Rbutton & F17::Wheel_2("^!j", 500)
	Rbutton & Wheelup::Wheel_2("{ctrl down}x{ctrl up}",1000)
	Rbutton & wheeldown::Wheel_2("{ctrl down}v{ctrl up}",1000)
	Rbutton & Mbutton::sendinput, {click}{Home}+{end}^c
	$Rbutton::Click right
	capslock::sendinput, {esc}
	;rwin & Space::+^!m
	Rbutton & F18::Get_WindowInfo()
}




Get_WindowInfo() 
{
	global
	clipboard:=
	MouseGetPos, MouseLocationX, MouseLocationY
  CoordMode, mouse, window
	MouseClick, right,,, 1, 0, D  ; Hold down the right mouse button.
	Loop
	{
		if !GetKeyState("Rbutton", "P")  ; The key has been released, so break out of the loop.
			break
		MouseGetPos, MousePosX, MousePosY, , WinControl
		sleep 100
		MousePosition:=MousePosX "`, " MousePosY
		sleep 25
		WinGetTitle, winTitle, A
		WinGetClass, Winclass, A
		WinGet, WinProcess, ProcessName, A			
		Sleep, 200
		Tooltip, %MousePosition%`n Title: %winTitle% `n Process: %WinProcess% `n Control: %winControl% `n Class: %winclass%
		
	}
    WinGetTitle, winTitle, A
		WinGetClass, Winclass, A
		WinGet, WinProcess, ProcessName, A	
	MouseClick, Right,,, 1, 0, U ; Release the mouse button.
	;clipboard:=MousePosition
	mouseclick, right
	;sendinput, {esc}
	;MouseClick, left,,, 1, 0,
	sleep 2000
	tooltip
	return
}

ReloadScript(){
  ; global iteration
  ControlGetText, Iteration, Edit2, VarBar
		tooltip("Reload")
  if (iteration = -1)
  {
    sendinput, {F5}
    IniWrite, -2, data.ini, SavedVariables, Iteration
}
  else if (iteration < -1)
    sendinput, {F4}
  else
  {
		sendinput, ^s
		sleep 200
		run, VQuest.ahk
  }
	}

ShowDefinition(){
  If toggle := !toggle {
    sendinput, {esc}
	  sendinput ^d
  } else 
    sendinput, {esc}
return
  }
