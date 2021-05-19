  
  
  
  
  
  
  
  #IfWinActive, ahk_exe firefox.exe
  Xbutton2 & WheelDown::Wheel("^w")
  F6::sendinput, !{left}
  ; Xbutton1 & WheelDOWN::Browser_Back
  F7::!right
  ; Xbutton2 & wheelUP::Browser_Forward
  Mbutton::Mbutton ;sendinput, ^{click}
  Rbutton::return
  
  

