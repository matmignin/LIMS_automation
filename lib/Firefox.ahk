  
  
  
  
  
  
  
  #IfWinActive, ahk_exe firefox.exe
  Xbutton2 & WheelDown::Wheel("^w")
  F16::sendinput, !{left}
  Xbutton1 & WheelDOWN::Browser_Back
  F17::!right
  Xbutton2 & wheelUP::Browser_Forward
  Mbutton::Mbutton ;sendinput, ^{click}
  
  

open_Firefox(){
  ifwinnotexist, ahk_exe firefox.exe
    run, firefox.exe, "C:\Program Files\Mozilla Firefox\" 
  else 
    WinActivate, ahk_exe firefox.exe

  return
  }