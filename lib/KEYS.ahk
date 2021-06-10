#ifwinactive


#IfWinActive,
	sendlevel 1
	pause::reload
	sendlevel 0

F23::

KEY_DEFAULT:
  <^;::sendinput, %Timestring%{space} 
	~Lbutton & left::sendinput, %Product%
	~Lbutton & Down::sendinput, %batch%
	~Lbutton & right::sendinput, %Lot%
	~Lbutton & up::sendinput, %SampleID%
;[_CapsLock_]
  Capslock & `::Test_1()
  ` & 1::Test_1()
  ` & 2::Test_2()
  ` & 3::Test_3()
	`::`
Numlock::reload
	
;[_Mbutton_]
  rshift & lbutton::sendinput, {shiftDown}{click}{shiftup}

	
  Mbutton & Xbutton1::SendPassword()
  Mbutton & Lbutton::sendinput, {CtrlDown}{Lbutton}{CtrlUp}
  Mbutton & WheelDown::sendinput, {ctrldown}{WheelDown}{CtrlUp}
  Mbutton & Wheelup::sendinput, {ctrldown}{Wheelup}{CtrlUp}
  Rbutton & F13::sendinput, {F21}
  Mbutton & F7::Wheel_Right()
  Mbutton & F6::Wheel_left()

;[_Rbutton_]
  Rbutton & Wheelup::Wheel_cut() 
  Rbutton & Wheeldown::Wheel_paste()
  Rbutton & Xbutton2::WindowInfo()
  Rbutton & F6::Backspace
  Rbutton & Lbutton::Enter
  Rbutton::Mouse_RbuttonUP()

;[_Xbutons_]
	Xbutton2 & Xbutton1::send, {Ctrldown}{Altdown}{tab}{CtrlUp}{AltUp}
	Xbutton1 & Xbutton2::WinActivate, ahk_exe WFICA32.EXE
	
  Xbutton1 & Rbutton::Clip("OCR") 
  ; Xbutton1 & LButton::Sendinput, {shiftdown}{ctrldown}4{CtrlUp}{shiftup} ;screenshot"
  Xbutton1 & lButton::Sendinput,  {shiftdown}{ctrldown}3{CtrlUp}{shiftup};screenshot"
  Xbutton1 & WheelUp::Wheel(Product)
  Xbutton1 & WheelDown::Wheel(Batch)
  Xbutton1 & wheelleft::Excel.PreviousSheet()
  Xbutton1 & wheelright::Excel.NextSheet()
  Xbutton1 & F7::Excel.NextSheet()
  Xbutton1 & F6::Excel.PreviousSheet()
	Xbutton1::Clip()
	
  Xbutton2 & Rbutton::WindowInfo()
  Xbutton2 & Mbutton::VarBar.Reset()
  Xbutton2 & wheelDown::Mouse_CloseWindow()
	Xbutton2::menu()
	; #If (A_PriorHotKey = "xbutton1" AND A_TimeSincePriorHotkey < 500) || (A_PriorHotKey = "F19" AND A_TimeSincePriorHotkey < 400)
	; xbutton1::sendinput, {shiftdown}{ctrldown}4{CtrlUp}{shiftup}
	; F20::sendinput, {shiftdown}{ctrldown}4{CtrlUp}{shiftup}
	; ; F19::Clip("OCR")
	; #If
	F8 & Lbutton::sendinput, {Ctrldown}{Click}{CtrlUp}
	F8 & Rbutton::sendinput, {shiftdown}{Click}{shiftup}
	
	;[_F19 & F20_]
	F19 & \::CreditCard()
	F19 & Space::send, %product%
	Lctrl & Space::send, {F21}
	F19 & backspace::send, {delete}
	F19 & lbutton::send, {shiftDown}{click}{shiftup}
	F20 & lbutton::send, {shiftDown}{click}{shiftup}
	F19::menu()

	F20 & backspace::run, Taskmgr.exe
	F20 & Space::Sendinput, %batch%
	; F20 & b::Sendinput, %batch%
	; F20 & c::Sendinput, %Coated%
	; F20 & p::Sendinput, %Product%
	; F20 & u::Sendinput, %Customer%
	F20 & Right::send, #{right}
	F20 & Left::send, #{Left}
	F20 & UP::send, #{UP}
	F20 & Down::send, #{Down}
	F20 & \::Sendpassword()
	F20 & .::WindowInfo()
	F20 & /::varbar.reset()
	F20 & '::varbar.follow()
	F20 & o::OpenApp.Outlook()
	F20 & ,::LMS.Orient()
	F20 & =::sendinput, {CtrlDown}{=}{Ctrlup}
	F20 & -::sendinput, {CtrlDown}{-}{Ctrlup}
	F20 & l::OpenApp.LMS()
	+F20::clip("OCR")
	F20::DoubleTab_Copy()
	
	DoubleTab_Copy(){
		global
		KeyWait,F20,U T1
			if errorlevel
				clip("OCR")
		KeyWait,F20,D T0.15
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
			sendinput, {ShiftDown}{Ctrldown}{3}{CtrlUp}{ShiftUp}
			; keywait, Lbutton, d
			sleep 50
			keywait, Lbutton, l
			sleep 50
			if (Inverted = 1)
				send, ^#{c}
		}	
	}

; F20::
; Critical
; KeyWait, F20
; KeyWait,F20,D T0.6
; If !ErrorLevel
;   Clip("OCR")
; Clip()
; Sleep 200
; Return
; F20::Clip()
; enter::enter
; capslock::esc




