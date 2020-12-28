insert::WinActivate, ahk_exe ONENOTE.EXE
    #IfWinActive,ahk_exe ONENOTE.EXE
    F15 & Wheelleft::SendInput,{lwin down}{left 3}{lwin up}
    F15 & Wheelright::sendinput,{lwin down}{right 3}{lwin up}  
       Rbutton & WheelUp::PasteAndRotateScreenshot()
	
    Lwin & x::
    lalt & x::send,^4
    Rbutton & LButton::
    lalt & Space::send,^1
    Lwin & z::
    lalt & z::send,^2
    Lwin & c::
    lalt & c::SendInput ,{U+02713}
    Mbutton::
	  click, 3
	  sendinput,{ctrl down}{alt down}h{alnot up}{ctrl up}
	  return
    F13 & Lbutton::sendinput,^!h
    capslock & n::Down
    
    
    PasteAndRotateScreenshot() {
	 send, {ctrl down}v{ctrl up}
	 sleep 200
	 sendinput,{click}
	  sleep 200
	  sendinput, {lalt}07
		sleep 800
	  }