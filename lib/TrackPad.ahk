#IfWinActive, 
  TrouchPad:
  Media_Next::sendinput, {ShiftDown}{altdown}{pgdn}{altUp}{ShiftUp} ;3finger up
  Browser_Back::sendinput, {ShiftDown}{altdown}{home}{altUp}{ShiftUp} ;3finger left
  Browser_Forward::sendinput, {ShiftDown}{altDown}{end}{altup}{ShiftUp} ;3finger right
#If (A_PriorHotKey = "Media_Prev" AND A_TimeSincePriorHotkey < 1000)
 ; browser_forward::Send, !{tab}{space}
 ; browser_back::send, +!{tab}{space}
  ; Media_Prev::sendinput, {ShiftDown}{Ctrldown}{pgup}{CtrlUp}{ShiftUp} ;3fringer down
  media_Prev::Mouse_CloseWindow()
  #if
  Media_Prev::sendinput, {ShiftDown}{altdown}{pgup}{altUp}{ShiftUp} ;3fringer down
; #If (A_PriorHotKey = "Media_Play_Pause" AND A_TimeSincePriorHotkey < 1000)
;     ; Browser_forward::#right
;    ; Browser_back::#left
;     ;Media_Next::sendinput, #{up}
;     Media_Play_Pause::Menu()
;     Wheelup::tooltip(A_ThisHotkey)
;     Wheeldown::tooltip(A_ThisHotkey)
;     wheelleft::tooltip(A_ThisHotkey)
;     wheelright::tooltip(A_ThisHotkey)
;     Lbutton::tooltip(A_ThisHotkey)
;     Rbutton::tooltip(A_ThisHotkey)
;     mbutton::tooltip(A_ThisHotkey)
;     Xbutton2::tooltip(A_ThisHotkey)
;     Xbutton1::tooltip(A_ThisHotkey)
; #If (A_PriorHotKey = "Media_next" AND A_TimeSincePriorHotkey < 1000)
;   Media_next::Menu() ; Tooltip("Swipe",2000)  ;4finger up
;     #If
;     Media_Play_Pause::Tooltip("3Tap",2000)  ;3finger tap
  
;Sendlevel 0

  

  

  
