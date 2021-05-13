/* 
3Tap    mbutton
3up     F8
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
  wheelup::pgup
  wheeldown::pgdn
  Xbutton1::send, {shiftdown}{Ctrldown}{4}{CtrlUp}{shiftup}
  space::clip()
  F19::send, ^{v}
  F20::Send, {F21}

#If (A_PriorHotKey = "Rbutton" AND A_TimeSincePriorHotkey < 300)
    lbutton::Menu()
    Space::menu()
    F8::clip()
    F9::send, ^v
#If (A_PriorHotKey = "lbutton" AND A_TimeSincePriorHotkey < 300)
    rbutton::Menu()
    Space::clip()
    F8::clip()
    F19::send, ^{v}
    F10::send, {F21}
  
#If (A_PriorHotKey = "media_next" AND A_TimeSincePriorHotkey < 1000)
    Browser_forward::#right ;4right
    Browser_back::#left ;4left
    Media_Next::Mouse_CloseWindow() ;4down
    Media_Prev::#up ;4up
    Wheelup::msgbox, yo, wheelup
    lbutton::Menu() 
   #If
    $media_next::Tooltip("     `n`t`n`t      ",1000)  ;4tap
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
    F8::sendinput, {CtrlDown}{f}{Ctrlup}
    media_prev::sendinput, {CtrlDown}{p}{Ctrlup}
;  $Media_Prev::sendinput, {ctrldown}{p}{ctrlUp} ;4fringer up
; #If (A_PriorHotKey = "Media_next" AND A_TimeSincePriorHotkey < 1000)
;   Media_next::Menu() ; Tooltip("Swipe",2000)  ;4finger up
;Sendlevel 0

  

  