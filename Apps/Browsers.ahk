#IfWinActive, ahk_exe firefox.exe
F15 & WheelDown::
	send, ^w
	sleep 500
	return

Capslock::return
#ifwinactive, ahk_exe msedge.exe ; edge
#ifwinactive, ahk_exe explorer.exe ; explorer
#ifwinactive,