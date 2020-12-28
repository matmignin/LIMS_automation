
WheelPaste() {
    ifwinactive, ahk_exe explorer.exe
        sendinput, ^v
    sleep 300
        Send,{enter}
    ifwinactive, Find and Replace        
        Send,!n%Clipboard%!i
    else 
    {
    sendinput, ^v
   }
    sleep 800
    return
}
WheelCut() {
    global
    Sendinput,{ctrl down}x{Ctrl up}
    sleep 50
    VariableGet()
    ToolTip, %clipboard%
    sleep 800
    tooltip,,
    return
}
WheelCopy() {
    global
    Sendinput,{ctrl down}c{Ctrl up}
    sleep 50
    VariableGet()
    ToolTip, %clipboard%
    sleep 800
    tooltip,,
    return
}




CloseWindow() {
    IfWinActive, ahk_exe WFICA32.EXE
    {
	  sendinput, {esc}
	  sleep 800
	  return
    }
    IfWinActive, ahk_class MozillaWindowClass ahk_exe firefox.exe
    {
	  sendinput,{ctrl down}w{Ctrl up} 
	  sleep 800
	  return
    }
    ifwinactive, ahk_exe msedge.exe 
    {
	  sendinput,{ctrl down}w{Ctrl up}
	  sleep 800
	  return
    }
    else
	  Sendinput, !{F4}
    sleep 400
    return
}


