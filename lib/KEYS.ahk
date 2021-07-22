#Ifwinactive,

KEY_DEFAULT:
	F15::+^!tab
  F16::!^tab  

	+Backspace::						backspace
	+^z::										send, {shiftup}{Ctrldown}{y}{CtrlUp}
	~<+rshift::							alttab
	~>+lshift::							ShiftAltTab
	lshift & Appskey::			Return
	rshift & Appskey::			return
	<^;::             			sendinput, %Timestring%{space}
	~Lbutton & left:: 			sendinput, %SampleID%~Lbutton & Down:: 			sendinput, %Coated%
	~Lbutton & right::			sendinput, %Lot%
	~Lbutton & up::   			sendinput, %SampleID%
	F20 & /::         			send, %SampleID%
	/ & Down::        			send, %Coated%
	/ & right::       			send, %Lot%
	/ & up::          			send, %SampleID%
	/::               			send, /
	` & 1::									Test_1()
	` & 2::									Test_2()
	` & 3::									Test_3()
	`::               			sendraw, ``
	~>+lbutton::          	sendinput,{shiftDown}{click}{shiftup}
	Rbutton & Wheelup::   	Wheel_cut() 
	Rbutton & Wheeldown:: 	Wheel_paste()
	Rbutton & F19::       	VS_Code_WindowInfo() 
	Rbutton & F6::        	Backspace
	Rbutton & Lbutton::   	Enter
	Rbutton::             	Mouse_RbuttonUP()
 Xbutton2 & Wheelup::			F9
	Xbutton2 & Wheeldown::	F8
	Xbutton2 & Wheelleft::	F6
	Xbutton2 & Wheelright::	F7
	Xbutton1 & Wheelup::		NumpadMult
	Xbutton1 & Wheeldown::	NumpadDiv
	Xbutton1 & Wheelleft::	Numpadsub
	Xbutton1 & Wheelright::	Numpadadd
	Media_Play_Pause::			
		send, ^{c}
		winactivate, screencaps
		sleep 200
		send, {down}{enter}^{v}
		return

	<^Space::              varbar.focus("Note1")
	F9 & Lbutton::         sendinput,{Ctrldown}{Click}{CtrlUp}
	F9 & Rbutton::         sendinput,{shiftdown}{Click}{shiftup}
	

       
	F20 & 9::              SaveWindow_Save()
	F20 & 0::              SavedWindow_Restore()
	F19_And_F20:
	F19 & \::              CreditCard()
	F19 & Space::          send, %product%
	F20 & Space::          Sendinput, %batch%
	F19 & backspace::      send,{delete}
	F20 & Rbutton::        Clip("OCR")
	F20 & F7::             Excel.NextSheet()
	F20 & F6::             Excel.PrevSheet()
	F20 & backspace::      run, Taskmgr.exe
	F20 & Right::          send, #{right}
	F20 & Left::           send, #{Left}
	F20 & UP::             send, #{UP}
	F20 & Down::           send, #{Down}
	F20 & \::              Sendpassword()
	F20 & .::              VS_Code_WindowInfo()
	F20 & '::              varbar.follow()
	F20 & o::							 OpenApp.Outlook()
	F20 & ,::              LMS.Orient()
	F20 & =::              sendinput,{CtrlDown}{=}{Ctrlup}
	F20 & -::              sendinput,{CtrlDown}{-}{Ctrlup}
	F20 & Rshift::         Test_2() 
	F20 & enter::					 varbar.focus("Edit5")
	F20 & l::              OpenApp.LMS()
	F20 & F19::            send, {F22}
	F19 & lbutton::        ^Lbutton
	F20::                  Clip_C()
	F19 up::               Clip_V()
	F19 & Media_Play_pause::
													my_screenwidth:=A_ScreenWidth-215
													my_screenheight:=A_Screenheight-115
													IniWrite, %my_screenwidth%, data.ini, Locations, Notes_x
													IniWrite, %my_screenheight%, data.ini, Locations, Notes_y
													Return
	
	
	
	
	F13 & Lbutton::        F13Click()


Double_press_For_Enter:
#If (A_PriorHotKey = "F19 & Space" && A_PriorHotKey = "F20 & Space" && A_TimeSincePriorHotkey < 5000) 
	F19 & space::           send, {enter}
	; $space::              send, {enter} 
	$rshift::               send, {tab}
	F20 & Space::           send, {enter}
; #If (A_PriorHotKey = "F19 & F20" && A_TimeSincePriorHotkey < 2000) 
	; F19 & F20::           send, {enter}
	; $space::              send, {enter} 
	; $rshift::             send, {tab}
	; F20 & Space::         send, {enter}
#If (A_PriorhotKey = "F19" && A_PriorHotKey = "F20" && A_TimeSincePriorHotkey < 5000) 
	$rshift::								send, {tab}
	$space::								send, {enter}
#if 

#If (A_PriorhotKey = "lbutton" && A_TimeSincePriorhotkey < 300) 
	~lbutton::
		sleep 200
		if getkeystate(lbutton, "P")
			tt("ye")
			return
#If getkeystate("lbutton","p") || (A_PriorhotKey = "lbutton" && A_TimeSincePriorhotkey < 800) 
  space::             send, {ctrldown}{click}{ctrlup}
  F19::               send, {F21}
  .::                 VS_Code_WindowInfo()
  v::                 send, {shiftdown}{altdown}{ctrldown}{v}{ctrlup}{altup}{shiftup}
  F20::               send, {shiftdown}{ctrldown}{4}{ctrlup}{shiftup}
  e::                 send,{LWinDown}{e}{lwinup}
  o::                 OpenApp.Outlook()
  d::                 LMS.Orient()
  w::                 OpenApp.Workbook()
#If
numpadsub::           #left
numpadadd::           #right
numpadMult::          #up
numpaddiv::           #down
	pause::                           reload
	` & esc::                         Pause

	VarBar:
#If Mouse_IsOver("VarBar ahk_exe AutoHotkey.exe")
	wheelleft::    Excel.PrevSheet()
	wheelRight::   excel.Nextsheet()
	WheelUp::      Varbar.AddIteration()
	Wheeldown::    Varbar.SubIteration()
	F9::           Excel.connect()
	F7::           Excel.NextSheet()
	F6::           Excel.PrevSheet()
	F20::          settimer, CheckActive, 500
	; Mbutton::      Varbar.LaunchTable()
	F20 & F6::     ProductTab.Table()
	; F20 & F7::     SpecTab.Table()
	lbutton::      send, {click}^{a}
	; Rbutton::    Menu.Tables() ; Excel.connect()
	; F9::         ReloadScript()
#if

#IfWinActive, VarBar ahk_exe AutoHotkey.exe 
	enter::                           
							winactivate, %the_WinTitle%
							click, %caret_X%, %caret_y%
							return




Notes:	
#IfWinactive, Notes ahk_exe AutoHotkey.exe
	F13 & j::       tab
	F13 & k::       +tab
	Media_next::    send, {tab}
	Media_prev::    send, `+{tab}
	F13::           send, {altdown}{tab}{altup}

#IfWinExist
#IfWinActive


~lbutton::           return
 
 
CloseWindow(){
	global
	if WinActive("Inbox - mmignin@vitaquest.com - Outlook") ; || winactive("ahk_exe OUTLOOK.EXE")
		Return
	else if winexist("PDF Preview - \\Remote"){
		winactivate
		clk(944, 11)
		sleep 400
	}
	else if winactive("Results Definition - \\Remote"){
    send, {esc}
    return
	}
	; else if winactive("Composition - \\Remote"){
    ; 	clk(841, 895)
    ; 	sleep 50
    ; 	clk(946, 896)
    ; 	sleep 400
    ; }
	else If winactive("NuGenesis LMS - \\Remote")
		LMS.FilterClear()
	else if WinActive("ahk_exe firefox.exe") || winactive("ahk_exe msedge.exe") || winactive("ahk_exe Code.exe") {
		send, ^{w}
		sleep 400
		return
	}
	else if WinActive("ahk_exe explorer.exe") || winactive("ahk_exe OUTLOOK.EXE") || winactive("OneNote for Windows 10") {
		sendinput, !{F4}
		sleep 400
		return
	}
	else if winactive("Settings ahk_class ApplicationFrameWindow"){
		winclose
		sleep 400
		return
	}
	else if winactive("ahk_exe EXCEL.EXE"){
		Send, {ctrldown}{down}{ctrlup}
		sleep 400
		return
	}
	else if winactive("Adobe Acrobat Reader"){
		send, ^q
		sleep 400
	}
	else
		PostMessage, 0x112, 0xF060,,, A     ; ...so close window     
	return
}



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


Sleep(time:="200"){
	sleep %time%
}




