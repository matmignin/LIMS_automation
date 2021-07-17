#Ifwinactive,

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

	<^;::sendinput, %Timestring%{space}
	~Lbutton & left::sendinput, %SampleID%
	~Lbutton & Down::sendinput, %Coated%
	~Lbutton & right::sendinput, %Lot%
	~Lbutton & up::sendinput, %SampleID%
	F20 & /::send, %SampleID%
	/ & Down::send, %Coated%
	/ & right::send, %Lot%
	/ & up::send, %SampleID%
	/::send, /
	; #MaxThreadsPerHotkey 2
	` & 1::Test_1()
	` & 2::Test_2()
	` & 3::Test_3()
	`::sendraw, ``
	;  ~esc::esc
	; #MaxThreadsPerHotkey 1

	;[_Mbutton_]
	~>+lbutton::sendinput,{shiftDown}{click}{shiftup}
	Rbutton & Wheelup::Wheel_cut() 
	Rbutton & Wheeldown::Wheel_paste()
	Rbutton & F19::VS_Code_WindowInfo() 
	Rbutton & F6::Backspace
	Rbutton & Lbutton::Enter
	Rbutton::Mouse_RbuttonUP()



	<^Space::menu.LMS()
	F9 & Lbutton::sendinput,{Ctrldown}{Click}{CtrlUp}
	F9 & Rbutton::sendinput,{shiftdown}{Click}{shiftup}
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
	F20 & F6::Excel.PrevSheet()
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
	F20 & Rshift::Test_2() 

	F20 & l::OpenApp.LMS()
	F20 & F19::send, {F22}
	; F19 & F20::menu.Variables()
	F19 & lbutton::^Lbutton
	lctrl up::Clip()
	F20::Clip_C()
	; sendlevel 1
	F19 up::Clip_V()
; sendlevel 0
	F13 & Lbutton::F13Click()


Double_press_For_Enter:
#If (A_PriorHotKey = "F19 & Space" || A_PriorHotKey = "F20 & Space" && A_TimeSincePriorHotkey < 9000) 
	F19 & space::send, {enter}
	; $space::send, {enter} 
	$rshift::send, {tab}
	F20 & Space::send, {enter}
; #If (A_PriorHotKey = "F19 & F20" && A_TimeSincePriorHotkey < 2000) 
	; F19 & F20::send, {enter}
	; $space::send, {enter} 
	; $rshift::send, {tab}
	; F20 & Space::send, {enter}
#If (A_PriorhotKey = "F19" || A_PriorHotKey = "F20" && A_TimeSincePriorHotkey < 2000) 
	$rshift::send, {tab}
	$space::send, {enter}
#if 






	pause::reload
	` & esc::Pause



	VarBar:
#If Mouse_IsOver("VarBar ahk_exe AutoHotkey.exe")
	wheelleft::Excel.PrevSheet()
	wheelRight::excel.Nextsheet()
	WheelUp::Varbar.AddIteration()
	Wheeldown::Varbar.SubIteration()
	F9::Excel.connect()
	F7::Excel.NextSheet()
	F6::Excel.PrevSheet()
	F20::settimer, CheckActive, 500
	Mbutton::Varbar.LaunchTable()
	F20 & F6::ProductTab.Table()
	F20 & F7::SpecTab.Table()
	lbutton::send, {click}^{a}
	; Rbutton::Menu.Tables() ; Excel.connect()
	; F9::ReloadScript()

#IfWinActive, VarBar ahk_exe AutoHotkey.exe 
	enter::
	winactivate, %the_WinTitle%
	click, %caret_X%, %caret_y%
	return




Notes:	
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







	class Breaking {
	Point(){
		Global
		If GetKeyState("Space", "P") || GetKeyState("Esc", "P") || GetKeyState("Lbutton", "P") {	
		TT("Broke")
			exit
		}
		if keep_running = n ;another signal to stop
				Exit
	}
	Preamble(){
		Global
		if keep_running = y
		{
			keep_running = n ;signal other thread to stop
			exit
		}
		keep_running = y
	}
	}








