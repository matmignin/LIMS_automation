#IfWinActive, 
  TrouchPad:
 ; SendLevel, 1
    ; Home::msgbox, yo ; tooltip
    ; pgup::tooltip(A_ThisHotkey)
    ; pgdn::tooltip(A_ThisHotkey)
    ; end::tooltip(A_ThisHotkey)
  Media_Prev::F7 ;3fringer down
  ; Media_Next:: ;3finger up
  ;Browser_Back::+!tab ;3finger left
 ; Browser_Forward::^!tab ;3finger right
#If (A_PriorHotKey = "Browser_forward" AND A_TimeSincePriorHotkey < 1000)
 ; browser_forward::Send, !{tab}{space}
 ; browser_back::send, +!{tab}{space}
  media_Next::Mouse_CloseWindow()
  
#If (A_PriorHotKey = "Media_Play_Pause" AND A_TimeSincePriorHotkey < 1000)
    ; Browser_forward::#right
   ; Browser_back::#left
    ;Media_Next::sendinput, #{up}
    Wheelup::tooltip(A_ThisHotkey)
    Wheeldown::tooltip(A_ThisHotkey)
    wheelleft::tooltip(A_ThisHotkey)
    wheelright::tooltip(A_ThisHotkey)
    Lbutton::tooltip(A_ThisHotkey)
    Rbutton::tooltip(A_ThisHotkey)
    mbutton::tooltip(A_ThisHotkey)
    Xbutton2::tooltip(A_ThisHotkey)
    Xbutton1::tooltip(A_ThisHotkey)
#If (A_PriorHotKey = "Media_next" AND A_TimeSincePriorHotkey < 1000)
    #If
  Media_next::Menu() ; Tooltip("Swipe",2000)  ;4finger up
    Media_Play_Pause::Tooltip("3Tap",2000)  ;3finger tap
  
;Sendlevel 0

  
ToggleTrackpsd(){
  WinActivate, ahk_exe exploer.exe
  Send, !{f12}
  sleep 300
  winactivate, Settings
  sleep 800
  send, {space}!{F4}
  Tooltip("TrackPad Toggled",2000)
  return
   }