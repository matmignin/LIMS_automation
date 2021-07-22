


  ; Numlock::         4_tap() ;send, {altDown}{lwindown}{Ctrldown}{o}{CtrlUp}{lwinup}{altup}
  

; #If (A_PriorHotKey = "NumpadDiv" AND A_TimeSincePriorHotkey < 450) ;4 finger swipe down
; ;   F6::            send, #{left} ;4left
; ;   F7::            send, #{right}-
; ;   F8::            send, ^{home}
; ;   F9::            send, {altDown}{Ctrldown}{tab}{CtrlUp}{altup}
; ;   numpadsub::     send, +#{left} ;4left
; ;   numpadadd::     send, +#{right}
; ;   numpadmult::    send, {ShiftDown}{altDown}{up}{altup}{ShiftUp} ;4up
; ;   ; numpadmult::  send, +#{up} ;4up
; ;   lbutton::       send, ^{click}
; ;   ; m::           Send, +#{right}
; ;   Mbutton::       send, {shiftDown}{click}{shiftup}
; ;   ; rbutton::     send % "{shiftDown}{click}{shiftup}" ;Mouse_RbuttonUP()
; ;   #If
;   numpaddiv::       
;   TT("Down")
; ;   sleep 450
;   if (A_TimeSincePriorHotkey > 450)
;     send, {altDown}{lwindown}{Shiftdown}{down}{ShiftUp}{lwinup}{altup}
;     sleep 200
;   return



; #If (A_PriorHotKey = "Numpadmult" AND A_TimeSincePriorHotkey < 450) ;4 finger swipe down
;   F6::              send, #{left} ;4left
;   F7::              send, #{right}
;   F8::              send, ^{home}
;   F9::              send, {altDown}{Ctrldown}{tab}{CtrlUp}{altup}
;   numpadsub::       send, +#{left} ;4left
;   numpadadd::       send, +#{right}
;   ; numpadmult::    
;   numpaddiv::       CloseWindow() ;4down clear filter
;   lbutton::         send, ^{click}
;   ; Numlock::       Send, +#{right}
;   Mbutton::         send, {shiftDown}{click}{shiftup}
;   ; rbutton::       send % "{shiftDown}{click}{shiftup}" ;Mouse_RbuttonUP()
;   #If
;   numpadmult::      
;   TT("up")
;   sleep 450
;   if (A_TimeSincePriorHotkey > 450)
;     send, {altDown}{lwindown}{Shiftdown}{up}{ShiftUp}{lwinup}{altup}
;     sleep 200
;   return
  
  
  
  
  
; 4_Tap(){
    ;  TT(A_ThisHotkey,450,,,2)
    ;  Input, Akey, T0.95 ,{NumpadAdd}{Numpadsub}{Numpadmult}{numpad0}{numpad5}{numpad4}{numpad3}{Numpad2}{Numpad1}{numpad9}{numpad8}{numpad7}{numpad6}{Numpaddiv}{space}{Mbutton}{F6}{F7}{F8}{F9}{F19}{F20}{Lbutton}{Mbutton}{numlock}
      ; If InStr(ErrorLevel, "EndKey:")
      ; {
      ;   If InStr(ErrorLevel, "NumpadAdd")
      ;     send, {altdown}{ctrldown}{right}{ctrlup}{altup}
      ;   If InStr(ErrorLevel, "NumpadSub")
      ;     send, {altdown}{ctrldown}{left}{ctrlup}{altup}
      ;   If InStr(ErrorLevel, "NumpadMult")
      ;     send, {altdown}{ctrldown}{up}{ctrlup}{altup}
      ;   ; If InStr(ErrorLevel, "NumpadDiv")
      ;     ; send, {shiftdown}{ctrldown}{p}{ctrlup}{shiftup}
      ;   If InStr(ErrorLevel, "F6")
      ;     send, {altDown}{lwindown}{o}{lwinup}{altup}
      ;   If InStr(ErrorLevel, "F7")
      ;     send, {altDown}{lwindown}{F7}{lwinup}{altup}
      ;   If InStr(ErrorLevel, "F9")
      ;     send, {ctrldown}{w}{ctrlup}
      ;   If InStr(ErrorLevel, "F8")
      ;     send, {ctrldown}{`}{ctrlup}
      ;   If InStr(ErrorLevel, "WheelLeft")
      ;     send, {ctrldown}{altdown}{h}{altup}{ctrlup}
      ;   exit
      ; }
      ; If ErrorLevel = TimeOut
      ; {
          ; send, {altDown}{lwindown}{Ctrldown}{o}{CtrlUp}{lwinup}{altup}
          ; return
      ; }
      ; return
; }
  
  
  

  
  
  

; $numlock::          send, {altDown}{lwindown}{Ctrldown}{o}{CtrlUp}{lwinup}{altup}
  

#ifwinactive

