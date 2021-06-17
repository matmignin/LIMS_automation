

#IfWinActive,
  #If (A_PriorHotKey = "Numlock" || A_PriorHotkey = "Mbutton" && A_TimeSincePriorHotkey < 500) ;4 finger swipe down
  F6::send, {F6} 
  F7::send, {F7} 
  F8::send, {F8} 
  F9::send, {F9} 
  numpadsub::send, {NumpadSub}
  numpadadd::send, {NumpadAdd}
  numpadmult::send, {numpadmult} 
  numpaddiv::send, {numpaddiv}  ;4down clear filter
  lbutton::send, {Lbutton}
  Numlock::Send, {Numlock}
  mbutton::send, {mbutton}
  wheelup::send, {WheelUp}
  ; rbutton::send % "{shiftDown}{click}{shiftup}" ;Mouse_RbuttonUP()
  #If
 TrouchPad:
#If getkeystate("lbutton","p")
  space::click
  F19::send, {altdown}{ctrldown}{4}{ctrlup}{altup}
  .::VS_Code_WindowInfo()
  ; Lwin::^x
  v::send, {shiftdown}{altdown}{ctrldown}{v}{ctrlup}{altup}{shiftup}
  ;  F20::Wheel_Paste()
  /::varbar.reset()
  e::send,{LWinDown}{e}{lwinup}
  o::OpenApp.Outlook()
  d::LMS.Orient()
  ;  f::OpenApp.firefox()
  w::OpenApp.Workbook()
  
#If
#IfWinActive,

#If (A_PriorHotKey = "NumpadDiv" AND A_TimeSincePriorHotkey < 450) ;4 finger swipe down
  F6::send, #{left} ;4left
  F7::send, #{right}
  F8::send, ^{home}
  F9::send, {altDown}{Ctrldown}{tab}{CtrlUp}{altup}
  numpadsub::send, +#{left} ;4left
  numpadadd::send, +#{right}
  numpadmult::send, {ShiftDown}{altDown}{up}{altup}{ShiftUp} ;4up
  ; numpadmult::send, +#{up} ;4up
  numpaddiv::Mouse_CloseWindow() ;4down clear filter
  lbutton::send, ^{click}
  ; Numlock::Send, +#{right}
  mbutton::send, {shiftDown}{click}{shiftup}
  ; rbutton::send % "{shiftDown}{click}{shiftup}" ;Mouse_RbuttonUP()
  #If
  numpaddiv::
  tooltip("Down")
  sleep 450
  if (A_TimeSincePriorHotkey > 450)
    send, {altDown}{lwindown}{Shiftdown}{down}{ShiftUp}{lwinup}{altup}
    sleep 200
  return



#If (A_PriorHotKey = "Numpadmult" AND A_TimeSincePriorHotkey < 450) ;4 finger swipe down
  F6::send, #{left} ;4left
  F7::send, #{right}
  F8::send, ^{home}
  F9::send, {altDown}{Ctrldown}{tab}{CtrlUp}{altup}
  numpadsub::send, +#{left} ;4left
  numpadadd::send, +#{right}
  ; numpadmult::
  $numpadMult:: send, {ShiftDown}{altDown}{up}{altup}{ShiftUp}  ;4up
  numpaddiv::Mouse_CloseWindow() ;4down clear filter
  lbutton::send, ^{click}
  ; Numlock::Send, +#{right}
  mbutton::send, {shiftDown}{click}{shiftup}
  ; rbutton::send % "{shiftDown}{click}{shiftup}" ;Mouse_RbuttonUP()
  #If
  numpadmult::
  tooltip("up")
  sleep 450
  if (A_TimeSincePriorHotkey > 450)
    send, {altDown}{lwindown}{Shiftdown}{up}{ShiftUp}{lwinup}{altup}
    sleep 200
  return
  
  
  
  
  
  
  
  

  
  
#IfWinActive, ahk_exe Code.exe


  Numlock::4_tap() ;send, {altDown}{lwindown}{Ctrldown}{o}{CtrlUp}{lwinup}{altup}

4_Tap(){
     tooltip(A_ThisHotkey,650,,,2)
     Input, Akey, V T0.45 ,{NumpadAdd}{Numpadsub}{Numpadmult}{numpad0}{numpad5}{numpad4}{numpad3}{Numpad2}{Numpad1}{numpad9}{numpad8}{numpad7}{numpad6}{Numpaddiv}{space}{Mbutton}{F6}{F7}{F8}{F9}{F19}{F20}{Lbutton}{Mbutton}
      If InStr(ErrorLevel, "EndKey:")
      {
        If InStr(ErrorLevel, "NumpadAdd")
          send, {altdown}{ctrldown}{right}{ctrlup}{altup}
        If InStr(ErrorLevel, "NumpadSub")
          send, {altdown}{ctrldown}{left}{ctrlup}{altup}
        If InStr(ErrorLevel, "NumpadMult")
          send, {altdown}{ctrldown}{up}{ctrlup}{altup}
        If InStr(ErrorLevel, "NumpadDiv")
          send, {ctrldown}{w}{ctrlup}
        If InStr(ErrorLevel, "F6")
          send, {altDown}{lwindown}{o}{lwinup}{altup}
        If InStr(ErrorLevel, "F7")
          send, {altDown}{lwindown}{F7}{lwinup}{altup}
        If InStr(ErrorLevel, "F9")
          send, {ctrldown}{w}{ctrlup}
        If InStr(ErrorLevel, "F8")
          send, {ctrldown}{`}{ctrlup}
        exit
      }
      If ErrorLevel = TimeOut
      {
        ; tooltip("\\ ")
          send, {altDown}{lwindown}{Ctrldown}{o}{CtrlUp}{lwinup}{altup}
          ; send, {numlock}
          exit
      }
      return
}


  Mbutton:: 
     tooltip(A_ThisHotkey,550,,,2)
     Input, Akey, V T0.5 ,{NumpadAdd}{Numpadsub}{Numpadmult}{numpad0}{numpad5}{numpad4}{numpad3}{Numpad2}{Numpad1}{numpad9}{numpad8}{numpad7}{numpad6}{Numpaddiv}{space}{Mbutton}{F6}{F7}{F8}{F9}{F19}{F20}{Lbutton}{numlock}
      If InStr(ErrorLevel, "EndKey:")
      {
        ; If InStr(ErrorLevel, "NumpadAdd")
        ; If InStr(ErrorLevel, "NumpadSub")
        If InStr(ErrorLevel, "F8") {
          send, {shiftdown}{altdown}{ctrldown}{v}{ctrlup}{altup}{shiftup}
          tooltip("column select",3000)
        }
        If InStr(ErrorLevel, "F9")
          send, {ShiftDown}{altDown}{up}{altup}{ShiftUp}
        If InStr(ErrorLevel, "F6")
          send, {altDown}{lwindown}{o}{lwinup}{altup}
        If InStr(ErrorLevel, "F7")
          send, {ctrldown}{f}{ctrlup}
        exit
      }
      If ErrorLevel = TimeOut
      {
          ToggleDefinition()
          ; send, {numlock}
          exit
      }
      return
  ; Mbutton::sendinput, {shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup} ;search
  F6::send, {altDown}{left}{altup} ;4right
  F7::send, {altDown}{right}{altup} ;4right
  F8::pgdn
  F9::pgup
  numpadadd::send, {altDown}{lwindown}{Shiftdown}{right}{ShiftUp}{lwinup}{altup}
  numpadsub::send, {altDown}{lwindown}{Shiftdown}{left}{ShiftUp}{lwinup}{altup}
  ; numpaddiv::send, {altDown}{lwindown}{Shiftdown}{down}{ShiftUp}{lwinup}{altup}
  
  

; $numlock::send, {altDown}{lwindown}{Ctrldown}{o}{CtrlUp}{lwinup}{altup}
  

#ifwinactive

 ~lbutton::return