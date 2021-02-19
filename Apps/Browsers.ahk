#IfWinActive, ahk_exe firefox.exe
F15 & WheelDown::
	send, ^w
	sleep 500
	return
F15 & Wheelleft::Browser_Back
F15 & wheelright::Browser_Forward
F14 & Rbutton::send, ^w
Capslock::return
#ifwinactive, ahk_exe msedge.exe ; edge
#ifwinactive, ahk_exe explorer.exe ; explorer
#ifwinactive,
