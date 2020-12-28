    #IfWinActive,   ahk_class AutoHotkeyGUI 
	  Capslock & ,::send, ^j
    	  Wheelleft::
	  Wheelright::Tab
	  Rbutton & Lbutton::SaveRestart()  
	  Rbutton & WheelUp::WheelCut()
	  Rbutton & Mbutton::Rbutton
	  F13 & lbutton::!h
	  F13 & Rbutton::+!h
	  F13 & F14::^b
	  
	  ;Rbutton::wheelCopy()
	  :*:#ifw::`#IfWinActive, 
	  PrintScreen::SaveRestart()
	  Mbutton::Sendinput, !m
	  Capslock & `;::SaveRestart()
	  Insert::
	  Rshift & Enter::SaveRestart()
	  F15 & Wheelright::Sendinput,{home}+{end}
    #ifwinactive,
	  Rshift & Enter::SaveRestart()
	  F9::Send,% ShowMouseLocation()
	  enter & \::SaveRestart() 
	  +backspace::ExitApp
	  
	  
SaveRestart(){
	sendinput, ^s
    sleep 100
    ;WinMenuSelectItem, ahk_class AutoHotkeyGUI, ,4&, 8&
	    traytip, restart,Restart
	    sleep 300
	    reload
	    return
    }
ShowMouseLocation(){
	  global
	  if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 250)
	    Run, C:\Users\MMIGNIN\OneDrive - Vitaquest International\AHK\Autohotkey\WindowSpy.ahk
	  else 
	  {
		
		MouseGetPos, MouseLocationX, MouseLocationY
		WinGet, CurrentWindow, ProcessName, A
		WinGetTitle, Title, A
		Clipboard:="ahk_exe " . CurrentWindow " " Title
		TrayTip, %CurrentWindow%, Mouse: %MouselocationX% `, %MouselocationY%
	  }
    return
    }
    