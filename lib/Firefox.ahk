  
  
  
  
  
  
  
  #IfWinActive, ahk_exe firefox.exe
  Xbutton2 & WheelDown::Wheel("^w")
  F6::sendinput, !{left}
  ; Xbutton1 & WheelDOWN::Browser_Back
  F7::!right
  ; Xbutton2 & wheelUP::Browser_Forward
  Mbutton::Mbutton ;sendinput, ^{click}
  Rbutton::return
  
  

open_Firefox(){
  ifwinnotexist, ahk_exe firefox.exe 
    run, firefox.exe, "C:\Program Files\Mozilla Firefox\" 
  else
    WinActivate, ahk_exe firefox.exe
  ; sleep 200    
  WinWait, ahk_exe firefox.exe,,2
  sleep 200
    ; ControlSend, Control ^l, ahk_exe firefox.exe
    send, {CtrlDown}{l}{Ctrlup}
  return
  }