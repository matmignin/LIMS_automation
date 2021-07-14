Main_Screen:
#Ifwinactive, NuGenesis LMS - \\Remote
  F20 & Left::WinMove, A, , -283, -1196, 1662, 952
  F19 & space::Send, %Product%{enter}
  F20 & space::Send, %Batch%{enter}
  ~Lbutton & F19::send,{enter}
  Enter::LMS.SaveCode()
  numpaddiv::CloseWindow()

Results_Definition:
#IfWinActive, Results Definition - \\Remote
  wheelup::Mouse_click("Edit")
  ; WheelDown::pgdn
		; Click, 1330, 592
		; sleep 100
		; click, 338, 619
		; TT("wheeldown pressed")
		; Return
		numlock::send, % clk(712, 663) "{esc}"


Register_new_samples:
#ifwinactive, Register new samples - \\Remote
	F9::
		ControlGetText, Product, Edit1, VarBar
		clk(181, 104,2)
		sleep 300
		send, %Product%{enter}
		return

Result_Entry:
#Ifwinactive, Result Entry - \\Remote ;Enter Test Results window
	#MaxThreadsPerHotkey 2
		F9::WorkTab.ChangeTestResults("loop")
	#MaxThreadsPerHotkey 1 

LMS:
#IfWinActive, ahk_exe WFICA32.EXE, ;GENERIC LMS
  F19 & F20::send, %Batch%
  F19 & space::send, %Product%
  F19 & up::send, %sampleID%
  F19 & left::send, %lot%
  F19 & right::send, %coated%
  $Rbutton up::Mouse_RbuttonUP()
  enter::click.okay()
  esc::click.esc()
  left::left
  Down::down
  right::right
  up::up
		numpaddiv::closeWindow()
  <^r::ReloadScript()
  F9::TouchPad.3up()
  F8::TouchPad.3Down()
  F7::TouchPad.3Right()
  F6::TouchPad.3Left()
  ; ~Wheelleft::TouchPad.2left()
  ; ~Wheelright::TouchPad.2right()
  Scrolllock::TouchPad.3Tap()
	; numlock::LMS.Movetab("Home")
	numpadMult::LMS.Movetab("Home")
	Numpadadd::lms.MoveTab("Right")
	NumpadSub::lms.MoveTab("Left")
	; Media_Prev::varbar.SubIteration(20)
	; Media_next::Varbar.AddIteration(20)
	; numlock::touchpad.4tap()
#IfWinActive,



	Scroll_Fix:
  #If mouse_isover("Result Editor - \\Remote") || mouse_isover("Test Definition Editor - \\Remote") || mouse_isover("Edit Formulation - \\Remote")
    Wheeldown::LMS.ScrollDown()
  #if
