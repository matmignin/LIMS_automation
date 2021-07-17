explorer:
#IfWinActive, ahk_exe explorer.exe
	Mbutton::			send, 		{enter}
	F20 & up::		WinMove,  ahk_exe explorer.exe, , 668, -1200, 974, 577
	F20 & left::	WinMove,  ahk_exe explorer.exe, , -292, -943, 1175, 904
	F20 & down::	WinMove,  ahk_exe explorer.exe, , 1162, 427, 1405, 1140
	F20 & right::	WinMove,  ahk_exe explorer.exe, , 1836, -1080, 1664, 1087
	F9::					send, 		{lwindown}{e}{lwinup}
	F7::					send, 		{lwindown}{s}{lwinup}
;  Media_Play_Pause::send,{space}
	F6::					Varbar.SearchExplorer()

#IfWinActive, Word ahk_exe WINWORD.EXE
F19::						Clip_v()
Mbutton::				clippaste()


Excel:
	#If (A_PriorHotKey = "Mbutton" AND A_TimeSincePriorHotkey < 9000 AND winactive("LMS Workbook.xlsb"))
	F6::
		winactivate, NuGenesis LMS - \\Remote
		sleep 200
		click, xTab3,yTabs
		; excel.connect()
		lms.SearchBar(Product,"{enter}")
		sleep 200
		send, {click, 87, 676, 0}
		return
	F7::
		winactivate, NuGenesis LMS - \\Remote
		sleep 200
		click, xTab4,yTabs
		; excel.connect()
		lms.SearchBar(Product,"{enter}")
		sleep 200
		send, {click, 87, 676, 0}
		return
	#if
	#IfWinActive, LMS Workbook.xlsb
	F9::
		winactivate, SAMPLE LOG 2021.xlsx
		excel.search()
		return
	Mbutton::Excel.Connect(1)
	F19 & backspace::delete
	F19 & down::^down
	F19 & up::^up
	F19 & left::^left
	F19 & right::^right
	F7::Excel.NextSheet()
	F6::Excel.PrevSheet()
	numlock::send, {altdown}{down 2}{altup} 
#ifwinactive, Book
			numpadadd::send, #{right}
			numpadsub::send, #{left}
#ifwinactive, ahk_exe EXCEL.EXE
Mbutton::
F9::
excel.search()
sleep 200
F7::send, {lwindown}{right}{lwinup}
; MoveFindReplace()

return
		$rbutton::Mouse_RbuttonUP()
	+Enter::sendinput, !{enter}
	$Enter::sendinput,{enter}
	; Numlock::Excel.SearchWorkbook(Product)
	F8::send,{shiftDown}{Ctrldown}{u}{CtrlUp}{ShiftUp}
	Media_Prev::send,{LWindown}{tab}{lwinup}
	
	
	F19 & F7::^F8 ;Excel.NextSheet()
	F19 & F6::^F9 ;Excel.PrevSheet()
	; F20 & down::WinMove, Find and Replace, , A_ScreenWidth-466, A_ScreenHeight/2+633, 466, 633
#ifwinactive, Find and Replace ahk_exe EXCEL.EXE,
F7::MoveFindReplace()
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
	
MoveFindReplace(){
	; wina
; WinGetPos, Win_X, win_Y, win_w, Win_H, "SAMPLE LOG 2021.xlsx"
; EdgeofWindow:=A_ScreenWidth-466
; BottomofWindow:=(A_Screenhight/3)+(A_Screenhight/3)
; excel.Search()
; winMove, Find and Replace, , %EdgeofWindow%, %BottomofWindow%, %EdgeofWindow%+466, %BottomofWindow%
}
OUTLOOK:
	#IfWinActive, ahk_exe OUTLOOK.EXE

	F19 & enter::send, {ctrldown}{enter}{ctrlup}
	F20 & F19::sendinput % Trim(Batch, OmitChars = " `n") " is updated.{ShiftDown}{Ctrldown}{left 2}{CtrlUp}{ShiftUp}"	
	; F19 & ,::sendinput % Trim(Batch, OmitChars = " `n") " is updated{ShiftDown}{Ctrldown}{left 2}{CtrlUp}{ShiftUp}"	
	F20 & Left::WinMove, ahk_exe OUTLOOK.EXE, 1313, -1080, 1439, 1080 
	F20::Clip()
	Mbutton::
		Click 3
		clip()
		return
	F7::
		winactivate, NuGenesis LMS - \\Remote
		sleep 200
		lms.searchbar(Batch)
		return
	F6::
		winactivate, NuGenesis LMS - \\Remote
		sleep 200
		lms.searchbar(Product)
		return
	F8::
		winactivate, NuGenesis LMS - \\Remote
		sleep 200
		clk(xRequestsTab, yMyWorkTabs)
		sleep 300
		lms.searchbar(Batch)
		send, {ctrlup}
		return
	
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
	F20 & right::WinMove, OneNote for Windows 10, , 1521, -1080, 1605, 1087

OneNote:
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
	$Mbutton up::sendinput,{ctrlup}
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
F20 & Right::WinMove, OneNote 10, , 1626, -1080, 1612, 1087

#IfWinActive,

Remote_DESKTOPs:
#IfWinActive, Remote Desktop Connection
Mbutton::menu.Remote_Desktop()
F13::TT("`n PRDCitrix1 `t 10.1.2.134`n PRDCitrix2 `t 10.1.2.226`n PRDCitrix3 `t 10.1.2.227 `n LMS-Test `t 10.1.2.152",6000)
#ifwinactive, ahk_class #32770
	Mbutton::menu.Remote_Login()
	; F19::menu.Remote_Login()
#ifwinactive, ahk_class TscShellContainerClass
	; F19::menu.Remote_Desktop()
	Mbutton::menu.Remote_Desktop()

