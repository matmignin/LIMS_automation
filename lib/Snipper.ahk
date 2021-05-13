

KEY_Snipper: 
  #IfWinActive, Snipper - Snipaste ; the capture screen
  rbutton::send, {CtrlDown}{c}{Ctrlup}
  ;WheelDown::wheel("^1")
  ;Wheelup::Wheel("^5")
  F8::excel.PasteValues("snip")
  #IfWinActive, Paster - Snipaste ahk_exe Snipaste.exe ; the floating window
  F8 & wheelUp::Wheel("{click right}z1{click right}e{ctrl down}5{ctrl up}")
  F8::send, {esc}
  Xbutton1::sendinput, ^c
  F7::sendinput, ^+{+}
  F6::sendinput, ^+{-}
#If mouse_isover("Paster - Snipaste ahk_class")
  ; sendlevel 1
  F8::Mbutton
  ; sendlevel 0
  #if
	
	
	
ClipTool:
#IfWinactive, C:\Users\mmignin\Documents\VQuest\lib\CL3\cl3.ahk,
  F19::send, {esc}
  F19 & j::send, {down}
  F19 & k::send, {up}
  F19 & l::send, {enter}
  F19 & h::send, {esc}
  Capslock & j::send, {down}
  Capslock & k::send, {up}
  capslock & l::send, {enter}
  capslock & h::send, {esc}
  capslock::esc
  #IfWinActive