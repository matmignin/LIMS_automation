KEY_LMS:
return
 #Ifwinactive, NuGenesis LMS - \\Remote
  F6::LMS.SearchBar(Product,"{enter}")
  F7::LMS.SearchBar(Batch,"{enter}")
  F8::LMS.FilterBar(Product)
  F9::LMS.ViewCoa()
  
  rshift & lbutton::sendinput,{shiftDown}{click}{shiftup}
  F20 & space::send, %Batch%{enter}
  ~Lbutton & Rbutton::send,{enter}
  F20 & WheelUp::LMS.SearchBar(Product,"{enter}")
  F20 & WheelDown::LMS.SearchBar(Batch,"{enter}")
  F20 & F6::LMS.SearchBar(Product,"{enter}",1)
  F20 & F7::LMS.SearchBar(Batch,"{enter}",1)
  F19 & wheeldown::Varbar.SubIteration()
  F19 & space::Send, %Product%{enter}
  Mbutton::menu.LMS()
  ; numpadadd::send % Mouse_Save() "{click 54, 747}{click 831, 689,0}" MouseReturn
  Enter::LMS.SaveCode()
 #Ifwinactive, Select methods tests - \\Remote
  F7::LMS.Methods()
  F6::esc
  #Ifwinactive, Edit Product - \\Remote
    Mbutton::ProductTab_EditProduct()
#ifwinactive, Edit Formulation - \\Remote
  Mbutton::send, {tab}%product%{Tab 23}
 #IfWinActive, Composition - \\Remote
  F6::esc
  F7::enter
  numpaddiv::Mouse_Closewindow()
  Mbutton::Autofill()
 #IfWinActive, Test Definition Editor - \\Remote
  F6::esc
  F7::click 330, 619 ;click save
 #IfWinActive, Results Definition - \\Remote
  F6::esc
  F7::enter
  wheelup::Mouse_click("Edit")
  WheelDown::
   Click, 1330, 592
   sleep 100
   click, 338, 619
   Return
 #IfWinActive, Edit specification - \\Remote
 #ifwinactive, PDF Preview - \\Remote
  numpaddiv::Mouse_CloseWindow()
 #ifwinactive, Edit test (Field Configuration:
  F9::Autofill()
  F6::esc
 #Ifwinactive, Result Entry - \\Remote ;Enter Test Results window
  Rbutton::WorkTab.ChangeTestResults("toggle")
  F6::WorkTab.ChangeTestResults("toggle")
 #MaxThreadsPerHotkey 2
  F9::WorkTab.ChangeTestResults("loop")
 #MaxThreadsPerHotkey 1
  F7::WorkTab.ChangeTestResults()
  F6::esc
 #ifwinactive, Register new samples - \\Remote
  F20 & wheelup::LMS.SearchBar()
  Mbutton::Autofill()
  F9::LMS.SearchBar(Product,"{enter}")
  F7::send, % Mouse_Save() "{click 502, 354}" Next
    F8::Send,{click 194, 188}^a
  F6::esc
 #IfWinActive, Select tests for request: R
  Mbutton::WorkTab.SelectTestSample()
 #ifwinactive, Select samples for test:
  F7::sendinput % Mouse_Save() "{click 504, 324}" MouseReturn ; add test.
  F6::esc
 #IfWinActive, ahk_exe WFICA32.EXE, ;GENERIC LMS
  F20 & F19::Sendinput, %Batch%
  F20 & space::Sendinput, %Product%
  F8::send,{enter}
  $Rbutton up::Mouse_RbuttonUP()
  Mbutton::Menu.LMS()
  enter::click.okay()
  esc::click.esc()
  left::left
  Down::down
  right::right
  up::up
  <^r::ReloadScript()
#IfWinActive,
  ; sendlevel 1
 pause::reload
 ` & esc::Pause
 
;  sendlevel 0





KEY_DEFAULT:
 <^;::sendinput, %Timestring%{space}
 ~Lbutton & left::sendinput, %Product%
 ~Lbutton & Down::sendinput, %batch%
 ~Lbutton & right::sendinput, %Lot%
 ~Lbutton & up::sendinput, %SampleID%
 ` & 1::Test_1()
 ` & 2::Test_2()
 ` & 3::Test_3()
 F13 & `::gosub, Test_%iteration% 
 `::`
;  Numlock::reload

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
 Lctrl & Space::send,{F21}
 F9 & Lbutton::sendinput,{Ctrldown}{Click}{CtrlUp}
 F9 & Rbutton::sendinput,{shiftdown}{Click}{shiftup}

;[_F19 & F20_]
 F19 & \::CreditCard()
 F19 & Space::send, %product%
 F19 & backspace::send,{delete}
 F19 & lbutton::send,{shiftDown}{click}{shiftup}
 F20 & F19::WinActivate, ahk_exe WFICA32.EXE
 F19 & Rbutton::Clip("OCR")
 F20 & WheelUp::Wheel(Product)
 F20 & WheelDown::Wheel(Batch)
 F20 & wheelleft::Excel.PreviousSheet()
 F20 & wheelright::Excel.NextSheet()
 F20 & F7::Excel.NextSheet()
 F20 & F6::Excel.PreviousSheet()
 F20 & backspace::run, Taskmgr.exe
 F20 & Space::Sendinput, %batch%
 F20 & Right::send, #{right}
 F20 & Left::send, #{Left}
 F20 & UP::send, #{UP}
 F20 & Down::send, #{Down}
 F20 & \::Sendpassword()
 F20 & .::VS_Code_WindowInfo()
 F20 & /::varbar.reset()
 F20 & '::varbar.follow()
 F20 & o::OpenApp.Outlook()
 F20 & ,::LMS.Orient()
 F20 & =::sendinput,{CtrlDown}{=}{Ctrlup}
 F20 & -::sendinput,{CtrlDown}{-}{Ctrlup}
 F20 & l::OpenApp.LMS()
 ~F20::Clip_key()
;  ~F19::F21


; F19::DoubleTab_Copy()

 DoubleTab_Copy(){
  global
  KeyWait,%A_ThisHotKey%,U T1
   if errorlevel
    clip("OCR")
  KeyWait,%A_ThisHotKey%,D T0.15
  If ErrorLevel
  {
   clip()
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