#IfWinActive, ahk_exe explorer.exe
 Mbutton::send, {enter}
 F20 & up::WinMove, ahk_exe explorer.exe, , 668, -1200, 974, 577
 F20 & left::WinMove, ahk_exe explorer.exe, , -292, -943, 1175, 904
 F20 & down::WinMove, ahk_exe explorer.exe, , 1162, 427, 1405, 1140
 F20 & right::WinMove, ahk_exe explorer.exe, , 1836, -1080, 1664, 1087
 F9::send, {lwindown}{e}{lwinup}
 F6::send, {lwindown}{s}{lwinup}
 Media_Play_Pause::send,{space}
 F19 & Browser_Forward::Excel.NextSheet()
 F19 & Browser_Back::Excel.PreviousSheet()
 F7::
 send,{CtrlDown}{e}{Ctrlup}
 sleep 200
 sendinput, %product%{enter}
 return


	#IfWinActive, LMS Workbook.xlsb
	F9::Excel.Connect(1)
	MButton::Excel.Connect(1)
	F19 & backspace::delete
	F19 & down::^down
	F19 & up::^up
	F19 & left::^left
	F19 & right::^right
#ifwinactive, Book
			F7::sendinput, #{right}
			wheelright::sendinput, #{right}
			F6::sendinput, #{left}
			wheelleft::sendinput, #{left}
#ifwinactive, ahk_exe EXCEL.EXE
		$rbutton::Mouse_RbuttonUP()
	+Enter::sendinput, !{enter}
	$Enter::sendinput,{enter}
	; Numlock::Excel.SearchWorkbook(Product)
	F8::send,{shiftDown}{Ctrldown}{u}{CtrlUp}{ShiftUp}
	Media_Prev::send,{LWindown}{tab}{lwinup}
	F6::wheel("{wheelleft}",80)
	F7::wheel("{wheelRight}",80)
	F19 & F7::^F8 ;Excel.NextSheet()
	F19 & F6::^F9 ;Excel.PreviousSheet()
	F20 & down::WinMove, ahk_exe EXCEL.EXE, , 0, 0, 1942, 1547
#ifwinactive, Find and Replace,
	F20 & WheelUp::
	Send, !{n}%Product%
	sleep 400
	return
	F20 & WheelDown::
 ; Wheel("{alt down}n{alt up}")
	Sendinput % Batch
	return
	return::sendinput, !{i}
	rbutton & Lbutton::sendinput, !{i}


KEY_OUTLOOK:
	#IfWinActive, ahk_exe OUTLOOK.EXE
	Rbutton & Wheelup::Wheel("{ctrl down}x{ctrl up}")
	Rbutton & wheeldown::Wheel("{ctrl down}v{ctrl up}")
	F19 & enter::send, {ctrldown}{enter}{ctrlup}
	F20 & Space::sendinput % Trim(Batch, OmitChars = " `n") " is updated{ShiftDown}{Ctrldown}{left 2}{CtrlUp}{ShiftUp}"	
	F20 & Left::WinMove, ahk_exe OUTLOOK.EXE, ,1635, -1080, 1564, 1080 
	Mbutton::
	Click 3
	clip()
	return
	
	
	
#ifwinactive, OneNote for Windows 10
	Mbutton & Wheelup::Wheel_2("{shiftdown}{altdown}{ctrldown}{=}{altup}{shiftup}{ctrlup}",50)
	Mbutton & Wheeldown::Wheel_2("{altdown}{shiftdown}{ctrldown}{-}{altup}{shiftup}{ctrlup}",50)
	^1::send,{altDown}{Ctrldown}{1}{CtrlUp}{altup}
	^2::send,{altDown}{Ctrldown}{2}{CtrlUp}{altup}
	^3::send,{altDown}{Ctrldown}{0}{CtrlUp}{altup}
	^4::send,{Ctrldown}{1}{CtrlUp}
	^5::send,{Ctrldown}{3}{CtrlUp}
	^`::send,{altDown}{Ctrldown}{0}{CtrlUp}{altup}

KEY_OneNote:
	#IfWinActive, ahk_exe ONENOTE.EXE
	Mbutton & Wheelup::Wheel_2("{shiftdown}{altdown}{ctrldown}{=}{altup}{shiftup}{ctrlup}",50)
	Mbutton & Wheeldown::Wheel_2("{altdown}{shiftdown}{ctrldown}{-}{altup}{shiftup}{ctrlup}",50)
	F9 & Wheelup::Wheel_2("{F11}")
	F9::send,{AltDown}{w}{i}{Altup}
	F6::sendinput,{wheelleft 20}
	F7::sendinput,{Wheelright 10}
	^1::send,{altDown}{Ctrldown}{1}{CtrlUp}{altup}
	^2::send,{altDown}{Ctrldown}{2}{CtrlUp}{altup}
	^3::send,{altDown}{Ctrldown}{3}{CtrlUp}{altup}
	^4::send,{Ctrldown}{1}{CtrlUp}
	$mbutton up::sendinput,{ctrlup}
	F20 up::PasteScreenshot()
		PasteScreenshot(){
		sleep 200
		sendinput, +^{4}
		sleep 200
		KeyWait, LButton, d
		MouseClick, left,,, 1, 0, D
		; sleep 200
		KeyWait, LButton,
		; sleep 200
		sleep 200
		KeyWait, F20,
		MouseClick, left,,, 1, 0, u
		send,{enter}
		sleep 200 ;screenshot"}
		WinActivate, %mwin%
		sleep 200
		; CLICK, %Mx%, %My%
		send, ^v
		return
		}
#IfWinActive,


		KEY_Remote_DESKTOP:

		#ifwinactive, ahk_class #32770
			Mbutton::menu.Remote_Login()
			F19::menu.Remote_Login()
		#ifwinactive, ahk_class TscShellContainerClass
			F19::menu.Remote_Desktop()
			mbutton::menu.Remote_Desktop()

