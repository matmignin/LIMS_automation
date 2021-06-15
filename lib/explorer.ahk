


#IfWinActive, ahk_exe explorer.exe
 Mbutton::send,{enter}
 Media_Play_Pause::send,{space}
 F19 & Browser_Forward::Excel.NextSheet()
 F19 & Browser_Back::Excel.PreviousSheet()
 F9::
 send,{CtrlDown}{e}{Ctrlup}
 sleep 200
 sendinput, %product%{enter}
 return
 ; F9 uP::send,{space}

