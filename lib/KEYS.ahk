#Ifwinactive,


KEY_DEFAULT:
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
 Media_Play_Pause::Test(iteration)
 `::`
 /::/


;[_Mbutton_]
 rshift & lbutton::sendinput,{shiftDown}{click}{shiftup}
 Mbutton & F20::SendPassword()
 Mbutton & Lbutton::sendinput,{CtrlDown}{Lbutton}{CtrlUp}
 Mbutton & WheelDown::sendinput,{ctrldown}{WheelDown}{CtrlUp}
 Mbutton & Wheelup::sendinput,{ctrldown}{Wheelup}{CtrlUp}
 ;Rbutton & F13::sendinput,{F21}
 Mbutton & F7::Wheel_Right()
 Mbutton & F6::Wheel_left()

;[_Rbutton_]
 Rbutton & Wheelup::Wheel_cut()
 Rbutton & Wheeldown::Wheel_paste()
 Rbutton & F19::VS_Code_WindowInfo()
 Rbutton & F6::Backspace
 Rbutton & Lbutton::Enter
 Rbutton::Mouse_RbuttonUP()
 Lctrl & Space::menu.LMS()
 F9 & Lbutton::sendinput,{Ctrldown}{Click}{CtrlUp}
 F9 & Rbutton::sendinput,{shiftdown}{Click}{shiftup}
  #If (A_PriorHotKey = "F19 & Space" && A_TimeSincePriorHotkey < 600) 
  F19 & space::send, {enter}
  F20 & Space::send, {enter}
#if
;[_F19 & F20_]
 F19 & \::CreditCard()
 F19 & Space::send, %product%
 F20 & Space::Sendinput, %batch%
 F19 & backspace::send,{delete}
 F19 & lbutton::send,{shiftDown}{click}{shiftup}
 F20 & F19::Menu.LMS()
 F19 & Rbutton::Clip("OCR")
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
F19 & F20::menu.Variables()
 ~F20::Clip_C()
 ~F19::Clip_V()

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