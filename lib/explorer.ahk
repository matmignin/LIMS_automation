


#IfWinActive, ahk_exe explorer.exe
  Mbutton::send, {enter}
  Media_Play_Pause::send, {space}
  Xbutton2 & F7::Excel.NextSheet()
  Xbutton2 & F6::Excel.PreviousSheet()
  F8::
  send, {CtrlDown}{e}{Ctrlup}
  sleep 200
  sendinput, %product%{enter}
  return
  ; F8 uP::send, {space}

