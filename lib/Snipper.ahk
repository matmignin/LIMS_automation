

KEY_Snipper: 
  #IfWinActive, Snipper - Snipaste ; the capture screen
  rbutton::send, ^c
  WheelDown::wheel("^1")
  Wheelup::Wheel("^5")
  F18::excel.PasteValues("snip")
  #IfWinActive, Paster - Snipaste ahk_exe Snipaste.exe ; the floating window
  F18 & wheelUp::Wheel("{click right}z1{click right}e{ctrl down}5{ctrl up}")
  F18::send, {esc}
  Xbutton1::sendinput, ^c
  F17::sendinput, ^+{+}
  F16::sendinput, ^+{-}
#If mouse_isover(" Paster - Snipaste ahk_class")
  ; sendlevel 1
  F18::send, !{click}
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