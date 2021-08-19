

KEY_Snipper:
 #IfWinActive, Snipper - Snipaste ; the capture screen
 sendlevel 1
 numpaddot::send, {esc} ;send, {lwindown}{click}{lwinup}
 $rbutton::send,{enter}
 F8::send,{ctrldown}{c}{ctrlup}{esc}
return

#IfWinActive, Paster - Snipaste ; the floating window

 sendlevel 1

;  F9 & wheelUp::Wheel("{click right}z1{click right}e{ctrl down}5{ctrl up}")
 F8::
 numpaddot::send, {lwindown}{click}{lwinup}
 sendlevel 0
 
  
;  F9::sendinput, ^c
 F7::sendinput, ^+{+}
 F6::sendinput, ^+{-}
#If MouseIsOver("Paster - Snipaste ahk_class")
 sendlevel 1
 numpaddot::send, {lwindown}{click}{lwinup}
  F8::send,{click}{esc}
 sendlevel 0

	

 #if

	Snip_groupChange(){
 send, {ctrl down}22{Ctrl up}
 TT("Snip Group Changed",2000)
 sleep 200
 return
 }

ClipTool:
#IfWinactive, C:\Users\mmignin\Documents\VQuest\lib\CL3\cl3.ahk,

;  F13 & j::send,{down}
;  F13 & k::send,{up}
;  F13 & l::send,{enter}
;  F13 & h::send,{esc}
 F13::esc
 #IfWinActive