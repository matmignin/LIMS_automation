






 #IfWinActive, ahk_exe firefox.exe
 NumpadDiv::CloseWindow()
 F6::sendinput, !{left}
 F7::send, !{right}

;  Mbutton::send,{CtrlDown}{click}{Ctrlup} ;sendinput, ^{click}
 Rbutton up::send,{click r}



