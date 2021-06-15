






 #IfWinActive, ahk_exe firefox.exe
;  F19 & WheelDown::Wheel("^w")
 F6::sendinput, !{left}
 F7::send, !{right}

 Mbutton::send,{CtrlDown}{click}{Ctrlup} ;sendinput, ^{click}
 Rbutton up::send,{click r}



