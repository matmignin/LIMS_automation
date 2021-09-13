

KEY_Snipper:
 #IfWinActive, Snipper - Snipaste ; the capture screen
 sendlevel 1
 numpaddot::Send, {esc} ;Send, {lwindown}{click}{lwinup}
 $rbutton::Send,{enter}
 F8::Send,{ctrldown}{c}{ctrlup}{esc}
return

#IfWinActive, Paster - Snipaste ; the floating window

 sendlevel 1

;  F9 & wheelUp::Wheel("{click right}z1{click right}e{ctrl down}5{ctrl up}")
 F8::
 numpaddot::Send, {lwindown}{click}{lwinup}
 sendlevel 0
 
  
;  F7::Send, ^+{+}
;  F6::Send, ^+{-}
#If MouseIsOver("Paster - Snipaste ahk_class")
 sendlevel 1
 numpaddot::Send, {lwindown}{click}{lwinup}
  F8::Send,{click}{esc}
 sendlevel 0

	

 #if

	Snip_groupChange(){
 Send, {ctrl down}22{Ctrl up}
 TT("Snip Group Changed",2000)
 sleep 200
 return
 }

ClipTool:
#IfWinactive, C:\Users\mmignin\Documents\VQuest\lib\CL3\cl3.ahk,

;  F13 & j::Send,{down}
;  F13 & k::Send,{up}
;  F13 & l::Send,{enter}
;  F13 & h::Send,{esc}
 F13::esc
 #IfWinActive