#Ifwinactive,
return

#IfWinactive, Notes ahk_exe AutoHotkey.exe
  ; ~Lbutton::return
  Enter::
  F13 & j::tab
  F13 & k::+tab
  Media_next::send, {tab}
  Media_prev::send, `+{tab}
  F13::send, {altdown}{tab}{altup}
Media_Play_Pause::notes.Close() ;gosub, NotesGuiClose

  
  
#IfWinExist, Notes ahk_exe AutoHotkey.exe
Media_prev::
Media_next::
Media_Play_Pause::
setwindelay,0
winactivate, Notes ahk_exe AutoHotkey.exe
setwindelay,400
return  

#IfWinExist
#IfWinActive, 

 media_next::
 media_prev::
 Media_Play_Pause::notes.show()
 return
KEY_DEFAULT:
F19 & Media_Play_pause::
my_screenwidth:=A_ScreenWidth-215
my_screenheight:=A_Screenheight-115
IniWrite, %my_screenwidth%, data.ini, Locations, Notes_x
IniWrite, %my_screenheight%, data.ini, Locations, Notes_y
Return
~<+rshift::alttab
~>+lshift::ShiftAltTab

; #ifwinactive, Task Switching ahk_exe explorer.exe
; $lshift::left
; $rshift::right
; rshift & lshift::tab
; lshift & rshift::+tab
lshift & Appskey::Return
rshift & Appskey::return
; #IfWinActive, 
; lshift & Appskey::Return
; rshift & Appskey::return
;#IfWinExist ahk_group AltTabWindow  ; Indicates that the alt-tab menu is present on the screen.
;*space::AltTabMenuDismiss  ; The * prefix allows it to fire whether or not Alt is held down.
;#If

 <^;::sendinput, %Timestring%{space}
 ~Lbutton & left::sendinput, %SampleID%
 ~Lbutton & Down::sendinput, %Coated%
 ~Lbutton & right::sendinput, %Lot%
 ~Lbutton & up::sendinput, %SampleID%
F20 & /::send, %SampleID%
/ & Down::send, %Coated%
/ & right::send, %Lot%
/ & up::send, %SampleID%
; #MaxThreadsPerHotkey 2
 ` & 1::Test_1()
 ` & 2::Test_2()
 ` & 3::Test_3()
;  ~esc::esc
; #MaxThreadsPerHotkey 1

;[_Scrolllock_]
 ~>+lbutton::sendinput,{shiftDown}{click}{shiftup}
;  Scrolllock & F20::SendPassword()
;  Scrolllock & Lbutton::sendinput,{CtrlDown}{Lbutton}{CtrlUp}
;  Scrolllock & WheelDown::sendinput,{ctrldown}{WheelDown}{CtrlUp}
;  Scrolllock & Wheelup::sendinput,{ctrldown}{Wheelup}{CtrlUp}
;  ;Rbutton & F13::sendinput,{F21}
;  Scrolllock & F7::Wheel_Right()
;  Scrolllock & F6::Wheel_left()
; Scrolllock::Scrolllock
;[_Rbutton_]
 Rbutton & Wheelup::Wheel_cut() 
 Rbutton & Wheeldown::Wheel_paste()
 Rbutton & F19::VS_Code_WindowInfo() 
 Rbutton & F6::Backspace
 Rbutton & Lbutton::Enter
 Rbutton::Mouse_RbuttonUP()

 
 
 <^Space::menu.LMS()
 F9 & Lbutton::sendinput,{Ctrldown}{Click}{CtrlUp}
 F9 & Rbutton::sendinput,{shiftdown}{Click}{shiftup}
  #If (A_PriorHotKey = "F19 & Space" || A_PriorHotKey = "F20 & Space" && A_TimeSincePriorHotkey < 2000) 
  F19 & space::send, {enter}
  $space::send, {enter} 
  $rshift::send, {tab}
  F20 & Space::send, {enter}
#If (A_PriorHotKey = "F19 & F20" && A_TimeSincePriorHotkey < 2000) 
  F19 & F20::send, {enter}
  ; $space::send, {enter} 
  ; $rshift::send, {tab}
  ; F20 & Space::send, {enter}
  #If (A_PriorhotKey = "F19" || A_PriorHotKey = "F20" && A_TimeSincePriorHotkey < 2000) 
  $rshift::send, {tab}
  $space::send, {enter}
#if 
  ; #If (A_PriorhotKey = "F20 & 0" && A_TimeSincePriorHotkey < 600) 
#if 
F20 & 9::SaveWindow_Save()
F20 & 0::SavedWindow_Restore()
;[_F19 & F20_]
 F19 & \::CreditCard()
 F19 & Space::send, %product%
 F20 & Space::Sendinput, %batch%
 F19 & backspace::send,{delete}
 
;  F20 & F19::Menu.LMS()
 F20 & Rbutton::Clip("OCR")
; Rbutton & Appskey::return
 F20 & F7::Excel.NextSheet()
 F20 & F6::Excel.PreviousSheet()
 F20 & backspace::run, Taskmgr.exe
 F20 & Right::send, #{right}
 F20 & Left::send, #{Left}
 F20 & UP::send, #{UP}
 F20 & Down::send, #{Down}
 F20 & \::Sendpassword()
 F20 & .::VS_Code_WindowInfo()
;  F20 & /::varbar.reset()
 F20 & '::varbar.follow()
 F20 & o::OpenApp.Outlook()
 F20 & ,::LMS.Orient()
 F20 & =::sendinput,{CtrlDown}{=}{Ctrlup}
 F20 & -::sendinput,{CtrlDown}{-}{Ctrlup}
 F20 & l::OpenApp.LMS()
 F20 & F19::send, {F22}
F19 & F20::menu.Variables()
F19 & lbutton::^Lbutton
 ~F20::Clip_C()
 ~F19::Clip_V()

F13 & Lbutton::F13Click()









F13Click(){
  KeyWait, lbutton, T0.25
    If ErrorLevel
    {
       KeyWait, Lbutton, D
        If !ErrorLevel
          send, ^{click 3}
        exit
    }
    send, ^{Click 2}
    return
}

; F19::DoubleTab_Copy()

 DoubleTab_Copy(){
  global
  KeyWait,%A_ThisHotKey%,U T1
   if errorlevel
    clip("OCR")
  KeyWait,%A_ThisHotKey%,D T0.15
  If ErrorLevel
  {
   clip()d
   sleep 300
   return
 }
  else
  {
   if (Inverted = 1)
    send, ^#{c}
   sleep 50
   sendinput,{ShiftDown}{Ctrldown}{3}{CtrlUp}{ShiftUp}
; keywait, Lbutton, d
   sleep 50
   keywait, Lbutton, l
   sleep 50
   if (Inverted = 1)
    send, ^#{c}
  }
 }






BlockInput:
 N=0
return