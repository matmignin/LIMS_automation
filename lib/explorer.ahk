


#IfWinActive, ahk_exe explorer.exe
  Mbutton::send, {enter}
  Media_Play_Pause::send, {space}
  Xbutton2 & F17::Excel.NextSheet()
  Xbutton2 & F16::Excel.PreviousSheet()
  ; F18 uP::send, {space}
 #IfWinActive, C:\Users\mmignin\Desktop\Label Copy\All Label Copy ahk_exe explorer.exe OR - search ahk_exe explorer.exe
 Xbutton1 & Wheelup:: ;LabelCopySearch(){
  ; Excel.Connect()
  winactivate, ahk_exe explorer.exe
  blockinput, on
  ControlClick, ModernSearchBox1, ahk_exe explorer.exe, ,Left, 1
  ControlSetText, ModernSearchBox1, %Product%,ahk_exe explorer.exe,
  ; send, ^a%Product%
  sleep 100
  send, {enter}

  sleep 400
   blockinput, Off
  return
