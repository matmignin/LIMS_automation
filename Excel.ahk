    #IfWinActive, ahk_exe EXCEL.EXE
	  Home::reload
	  Enter::numpadenter
	  F1::SendInput, ^f!t!h{right}{enter}!s{right}!t!n
	  Numlock::Sendinput, ^f!t!h{right}{enter}!S{right}!t!n
	  `::esc
	  Mbutton & WheelUp::Send,^{up}
	  Mbutton & Wheeldown::Send,{pgdn}
	  F13 & WheelDown::CloseWindow()
	  ;~ F15 & WheelDown::
		;~ send,{shift down}{ctrl down}{down}{ctrl up}{shift up}
		;~ sleep 200
		;~ return
	  Rbutton & F13::sendinput,{delete}
	  Rbutton::click,right
    #ifwinactive, Find and Replace,

	  enter::Send,!i
	  Numpadenter::!i
	  Home::
	  Numlock::winclose
    #ifwinactive