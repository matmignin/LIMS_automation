

KEY_Snipper:
 #IfWinActive, Snipper - Snipaste ; the capture screen
 numpadDiv::send, {altdown}{click}{altup}
 rbutton::send,{CtrlDown}{c}{Ctrlup}
 F8::send,{esc}
 mbutton::send, {altdown}{click}{altup}

 ;WheelDown::wheel("^1")
 
 ;Wheelup::Wheel("^5")
;  Mbutton::send, {Click, 2}
; For sheet in xl.ActiveWorkbook.Worksheets
												; 	Products.insert(Sheet.Name)
												; Products.remove(1)
												; Products.remove(1)
												; loop 3{
												; 	if (Products[A_index] = "Finished")
												; 		break
												; 	else
												; 		DDLProducts .= "|" Products[A_index]
#IfWinActive, Paster - Snipaste ; the floating window
;  Mbutton::send, {Click, R}{e}
 F9 & wheelUp::Wheel("{click right}z1{click right}e{ctrl down}5{ctrl up}")
 F8::send,{esc}
  Space::send, {esc}
 F19::sendinput, ^c
 F7::sendinput, ^+{+}
 F6::sendinput, ^+{-}
#If mouse_isover("Paster - Snipaste ahk_class")
 sendlevel 1
 numpadDiv::send, !{click}
  F8::send,{esc}
 sendlevel 0
 #if

	Snip_groupChange(){
 Wheel("{ctrl down}22{Ctrl up}")
 TT("Snip Group Changed",2000)
 return
 }

ClipTool:
#IfWinactive, C:\Users\mmignin\Documents\VQuest\lib\CL3\cl3.ahk,

 Capslock & j::send,{down}
 Capslock & k::send,{up}
 capslock & l::send,{enter}
 capslock & h::send,{esc}
 capslock::esc
 #IfWinActive