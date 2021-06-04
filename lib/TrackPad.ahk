/* 
3Tap    mbutton
3up     F8 'or thumb mouse
3down   f9
3right  f7
3left   f6

4tap    F10
4up     Media_Prev
4down   Media_Next
4right  browswer forward :xbutton1
4left   browser back     :xbutton2
 */

#IfWinActive, 
~wheelup::return
  TrouchPad:
#If Getkeystate("lbutton","p")
  Xbutton1::send, {shiftdown}{Ctrldown}{4}{CtrlUp}{shiftup}
  space::clip()
  left::send, %Product%
  right::send, %batch%
  F19::sendinput, {F21}
  up::send, %Lot%
  down::send, %Lot%
  F20::Send, {F21}
  .::getWindowInfo()
  /::varbar.reset()
  c::OpenApp.Clickup()
  e::send, {LWinDown}{e}{lwinup}
  o::OpenApp.Outlook()
  v::OpenApp.VScode()
  d::OpenApp.Display()
  f::OpenApp.firefox()
  w::OpenApp.Workbook()
  l::OpenApp.LMS()


; #If (A_PriorHotKey = "lbutton" AND A_TimeSincePriorHotkey < 300)
;     Space::clip()
; 	  F8::send, ^x
;     F9::send, ^v
;     ;F8::clip()
;     wheelup::^x
;     wheeldown::^v
;     F7::^y
;     F6::^z
;     F19::send, {F21}     
;     #if




#If (A_PriorHotKey = "Media_Next" AND A_TimeSincePriorHotkey < 1000) ;4 finger swipe down
    Browser_back::send, +#{left} ;4left
    Browser_forward::send, +#{right}
    Media_Next::Mouse_CloseWindow() ;4down clear filter
    Media_Prev::send, #{up 2} ;4up
    lbutton::send, ^{click}
    F10::WinMaximize, A
    F9::send, ^j
    F8::send, ^k
    mbutton::WinMinimize, A
    rbutton::send % "{shiftDown}{click}{shiftup}" Mouse_RbuttonUP()
   #If
    Media_Next::Tooltip("     `n`t`n`t      ",1000)  ;4tap
 ~lbutton::return
    
  $Browser_Back::
    sendlevel 1
    send, {xbutton2}
	tooltip(Clipboard)
    sendlevel 0
    return
  $Browser_Forward::
    sendlevel 1
    send, {xbutton1}
    tooltip(Clipboard)
    sendlevel 0
    return
    ;   $Media_next::
    ; sendlevel 1
    ; send, {F8}
    ; ;Tooltip("4Tap",1000)  ;4tap
    ; sendlevel 0
    ; return
  
#IfWinActive, ahk_exe Code.exe
    ; Browser_forward::
    ; if (A_TimeSincePriorHotkey < 1000)
    ; {
    ;   tooltip("Over")
    ;   if
    ;   sleep 1100
    ;   send, #+{right}
    ; }
    ;   else
    ;   {
    ;   tooltip("Under")
    ;   sleep 400
    ;   ; send, #{right}

    ;   }
    ;   return
    $F9::ToggleDefinition()
    F19 & F9::send, {CtrlDown}{F9}{Ctrlup}
    <^F9::^j
    <^F8::^k
    F8::send, {ShiftDown}{Ctrldown}{f}{CtrlUp}{ShiftUp}
    Browser_Back::sendinput, {ShiftDown}{Ctrldown}{p}{CtrlUp}{ShiftUp}
    Browser_Forward::send {CtrlDown}{f}{Ctrlup}
    media_prev::send, {ShiftDown}{altDown}{up}{altup}{ShiftUp}
    #If (A_PriorHotKey = "Media_Prev" AND A_TimeSincePriorHotkey < 800) ;4 finger swipe down
    Media_Prev::send {down}{enter}
#If (A_PriorHotKey = "Browser_Forward" AND A_TimeSincePriorHotkey < 2000) ;4 finger swipe down
    Browser_Back::send {CtrlDown}{k}{Ctrlup}
#If (A_PriorHotKey = "Browser_back" AND A_TimeSincePriorHotkey < 2000) ;4 finger swipe down
    Browser_Back::send {CtrlDown}{k}{Ctrlup}
    #if
;  $Media_Prev::sendinput, {ctrldown}{p}{ctrlUp} ;4fringer up
; #If (A_PriorHotKey = "Media_next" AND A_TimeSincePriorHotkey < 1000)
;   Media_next::menu() ; Tooltip("Swipe",2000)  ;4finger up
;Sendlevel 0

  

  