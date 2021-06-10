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
  space::send, ^{a}^{v}

	; left::send, %Product%
	; Down::send, %batch%
	; right::send, %Lot%
	; up::send, %SampleID%
  F19::send, {F21}
  F20::WindowInfo()
  /::varbar.reset()
  e::send, {LWinDown}{e}{lwinup}
  o::OpenApp.Outlook()
  d::LMS.Orient()
  f::OpenApp.firefox()
  w::OpenApp.Workbook()
  l::OpenApp.LMS()

SetDivider(){
global
    CoordMode, mouse, window
    MouseGetPos, xDivider, yDivider,
    sleep 100
  	IniWrite, %xDivider%, data.ini, Locations, xDivider
  	IniWrite, %yDivider%, data.ini, Locations, yDivider
    DividerLocation:=xDivider ", " yDivider
    tooltip("Divider Location Set: " DividerLocation)
    return
    }

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


#If (A_PriorHotKey = "F10" AND A_TimeSincePriorHotkey < 1000) ;4 finger swipe down
    Browser_back::send, {esc} ;4left
    Browser_forward::send, {enter} ;4right
    Media_Next::send, {esc} ;4down 
    Media_Prev:: ;4Up
    lbutton::send, ^{click}
    F10::Wheel_Copy() ;4tap
    F9::wheel_paste() ;3down
    F8::wheel_cut()   ;3up
    F7::send, ^y      ;3right
    F6::send, ^z      ;3left
    mbutton::send, +{click}
    rbutton::send % "{shiftDown}{click}{shiftup}" Mouse_RbuttonUP()
   #If
    F10::Tooltip("[4 Finger Tap]",800)  ;4tap

   
   
 ~lbutton::return

#IfWinActive, ahk_exe Code.exe
    Browser_back::send, {CtrlDown}{tab}{Ctrlup} ;4left
    Browser_forward::send, {shiftDown}{enter}{shiftup} ;4right
    $F9::ToggleDefinition()
    F19 & F9::send, {CtrlDown}{F9}{Ctrlup}
    <^F9::^j
    <^F8::^k
    F8::send, {Ctrldown}{t}{CtrlUp}
    F10::sendinput, {ShiftDown}{Ctrldown}{p}{CtrlUp}{ShiftUp}
    
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

  

  