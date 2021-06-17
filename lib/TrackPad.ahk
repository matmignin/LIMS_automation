

#IfWinActive,
  #If (A_PriorHotKey = "Numlock" AND A_TimeSincePriorHotkey < 1000) ;4 finger swipe down
  F6::send, {F6} 
  F7::send, {F7} 
  F8::send, {F8} 
  F9::send, {F9} 
  numpadsub::send, {NumpadSub}
  numpadadd::send, {NumpadAdd}
  numpadmult::send, {numpadmult} 
  numpaddiv::send, {numpaddiv}  ;4down clear filter
  lbutton::send, {Lbutton}
  ; Numlock::Send, +#{right}
  mbutton::send, {shiftDown}{click}{shiftup}
  ; rbutton::send % "{shiftDown}{click}{shiftup}" ;Mouse_RbuttonUP()
  #If
 ; ~wheelup::return
 TrouchPad:
#If getkeystate("lbutton","p")
 space::click
 ;F19::send, {F21}
 .::VS_Code_WindowInfo()
 Lwin::^x
;  F20::Wheel_Paste()
 /::varbar.reset()
 e::send,{LWinDown}{e}{lwinup}
 o::OpenApp.Outlook()
 d::LMS.Orient()
;  f::OpenApp.firefox()
 w::OpenApp.Workbook()
;  l::OpenApp.LMS()
#if
#IfWinActive,

#If (A_PriorHotKey = "NumpadDiv" AND A_TimeSincePriorHotkey < 1000) ;4 finger swipe down
  F6::send, #{left} ;4left
  F7::send, #{right}
  F8::send, ^{home}
  F9::send, {altDown}{Ctrldown}{tab}{CtrlUp}{altup}
  numpadsub::send, +#{left} ;4left
  numpadadd::send, +#{right}
  numpadmult::send, +#{up} ;4up
  numpaddiv::Mouse_CloseWindow() ;4down clear filter
  lbutton::send, ^{click}
  ; Numlock::Send, +#{right}
  mbutton::send, {shiftDown}{click}{shiftup}
  ; rbutton::send % "{shiftDown}{click}{shiftup}" ;Mouse_RbuttonUP()
  #If

  Numlock:: ;send, {altDown}{lwindown}{Ctrldown}{o}{CtrlUp}{lwinup}{altup}
     tooltip(A_ThisHotkey,1000,,,2)
     Input, Akey, T0.55 ,{NumpadAdd}{Numpadsub}{Numpadmult}{Numpaddiv}{space}{Mbutton}{F6}{F7}{F8}{F9}{F19}{F20}{Lbutton}{Mbutton}
      If ErrorLevel = TimeOut
      {
        tooltip("Fill Screen")
          send, {altDown}{lwindown}{Ctrldown}{o}{CtrlUp}{lwinup}{altup}
          ; send, {numlock}
          exit
      }
      If InStr(ErrorLevel, "EndKey:")
      {
        If InStr(ErrorLevel, "NumpadAdd")
          send, {altDown}{lwindown}{Shiftdown}{right}{ShiftUp}{lwinup}{altup}
        If InStr(ErrorLevel, "NumpadSub")
          send, {altDown}{lwindown}{Shiftdown}{left}{ShiftUp}{lwinup}{altup}
        If InStr(ErrorLevel, "NumpadMult")
          send, {altDown}{lwindown}{Shiftdown}{up}{ShiftUp}{lwinup}{altup}
        If InStr(ErrorLevel, "NumpadDiv")
          send, {altDown}{lwindown}{Shiftdown}{down}{ShiftUp}{lwinup}{altup}
        If InStr(ErrorLevel, "F6")
          send, {altDown}{lwindown}{o}{lwinup}{altup}
        If InStr(ErrorLevel, "F7")
          send, {altDown}{lwindown}{F7}{lwinup}{altup}
        exit
      }
      else
        msgbox % A_ThisHotkey " | " A_PriorHotkey " | " A_PriorKey "`n" Akey 
      return
      

  numpaddiv::Tooltip(A_ThisHotkey,1000) ;4tap

#IfWinActive, ahk_exe Code.exe
  
  Mbutton::sendinput, {CtrlDown}{f}{Ctrlup} ;search
  F7::send, {altDown}{right}{altup} ;4right
  F8::pgdn
  F9::pgup
  numpadadd::ToggleDefinition()
  numpaddiv::Tooltip(A_ThisHotkey,1000) ;4tap
; $numlock::send, {altDown}{lwindown}{Ctrldown}{o}{CtrlUp}{lwinup}{altup}
  numpadsub::sendinput, {ShiftDown}{Ctrldown}{p}{CtrlUp}{ShiftUp}
  numpadmult::send, {ShiftDown}{altDown}{up}{altup}{ShiftUp}

#ifwinactive

 ~lbutton::return

