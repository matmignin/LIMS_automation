






 #IfWinActive, ahk_exe firefox.exe
 numpaddot::CloseWindow()
 F6::sendinput, !{left}
 F7::send, !{right}
 F13::send, {ctrldown}{/}{ctrlup}
 +F13::send, {esc}

;  Mbutton::send,{CtrlDown}{click}{Ctrlup} ;sendinput, ^{click}
;  Rbutton up::send,{click r}



