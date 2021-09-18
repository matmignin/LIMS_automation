; #ifwinexist, ahk_exe Teams.exe
#Ifwinactive,
#if Winactive("Results Definition - \\Remote")
	space::sendinput,{ctrldown}{click}{ctrlup}
	mbutton::Spectab.Table()
#if
_TestingZone:
	Volume_Mute::
	sendlevel 1
	Send, {F23}
	sendlevel 0
	return
	; drag_enabled := 0

	; +^#F22::
	; 	if(drag_enabled)
	; 	{
	; 		Click up
	; 		drag_enabled := 0
	; 	}
	; 	else
	; 	{
	; 		drag_enabled := 1
	; 		Click down
	; 	}
	; 	return

	; LButton::
	; 	if(drag_enabled)
	; 	{
	; 		Click up
	; 		drag_enabled := 0
	; 	}
	; 	else
	; 		click
	; 	return




	MouseGesture(LeftAction:="",RightAction:=""){
		global
		MouseGetPos, xi,yi
		sleep =
		While GetKeyState(A_ThisHotkey,"P")
		{
			MouseGetPos, Xf,Yf
		}
		if (xi>Xf){
			send % leftAction
			tt("Left")
			return
		}
		if (xi<Xf){
			send % RightAction
			tt("Right")
			return
		}
		; if (yi>Yf+50)
			; tt("Up")
		; if (yi<Yf-50)
			; tt("Down")
		return
	}
	; ^wheelup::   	
	; 	tt("wheelup", 500)
	; 	Send, !
	; 	blockinput, mousemove
	; 	sleep 500
	; 	blockinput, mousemoveoff
	; 	; SetKeyDelay, 1, 0
	; 	return
	; ~^wheeldown::  
	; 	TT("wheeldown",500)
	; 	blockinput, mousemove
	; 	sleep 500
	; 	blockinput, mousemoveoff
	; 	; SetKeyDelay, 1, 0
	; 	return
	; 	; sendlevel 0
	; ^wheeldown::Block(300,"^{c}")
	; ^wheeldown::Blockrepeat(500) clip()
	; ^wheeldown::send % Blockrepeat(900) "^{v}"
	; sleep 500
	; return
	f10::F21
	F11::F22
	F12::Send, {altdown}{tab}{altup}
	#if (N=1)
		wheelDown::return
		wheelup::return
	#if

KEY_DEFAULT:
F21::clip.Append()

_Esc:
	esc & 1::						send, {shiftdown}{altdown}{-}{altup}{shiftup}
	esc & 2::						send, {shiftdown}{altdown}{=}{altup}{shiftup}
	esc & 3::						send, {shiftdown}{altdown}{0}{altup}{shiftup}
	esc::								esc
	Media_Prev::					MakeTransparent()
	Media_Play_Pause::			F16
	Media_Next::					F17
	Volume_Down::					F18
	Volume_up::						F18
	/ & down::   		      	Varbar.SubIteration(0)
	/ & up::							Varbar.AddIteration(0)
	F13 & wheelright::			Varbar.AddIteration(250) 
	F13 & wheelleft::   			Varbar.SubIteration()
	F13 & wheelup::				send % Blockrepeat(300) Varbar.AddIteration() 
	F13 & wheeldown::   			send % Blockrepeat(300) Varbar.SubIteration()
	numpadsub::          		4Left()
	numpadadd::          		4right()
	numpadMult::         		#up
	numpaddot::          		#down
	pause::							Suspend, Toggle 
	; F15::							+tab
	F17::								sendinput, {altdown}{tab}{altup}
	; F16::							Send, !{tab}
	j & k::							esc
	j::j
	k::k
	F20 & wheeldown::				send % Blockrepeat(500) "{numpadDot}"
	F20 & wheelup::				send % Blockrepeat(500) "{numpadmult}"
	
	F15 & Lbutton::				send, {shiftdown}{ctrldown}{5}{ctrlup}{shiftup}
	F16 & Lbutton::				send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}							
	;Media_Next::					Send, {shiftdown}{altdown}{tab}{altup}{shiftup}
	;Media_Prev::					Send, {altdown}{tab}{altup}
	;Volume_Down::					Send, {lwindown}{tab}{lwinup}
	$#F7::							Send, {lwindown}{right}{lwinup}
	$#F6::							Send, {lwindown}{left}{lwinup}
	$#F9::							Send, {lwindown}{up}{lwinup}
	$#F8::							Send, {lwindown}{down}{lwinup}
	$!F7::							Send, {laltdown}{right}{laltup}
	$!F6::							Send, {laltdown}{left}{laltup}
	$!F9::							Send, {laltdown}{up}{laltup}
	$!F8::							Send, {laltdown}{down}{laltup}
	+Backspace::					backspace
	+^z::								Send, {shiftup}{Ctrldown}{y}{CtrlUp}
	~<+rshift::						Send, {lwindown}{right}{lwinup}
	~>+lshift::						Send, {lwindown}{left}{lwinup}
	; ~Rshift & up:: 			SendInput, %SampleID%
	lshift & Appskey::			Return
	<^`;::
	FormatTime, CurrentDateTime,, MM/d/yy
	SendInput %CurrentDateTime%
	return
	
	^Media_Next::					MakeTransparent()
	/ & space::						Send, %Coated%
	/ & .::							Send, {?}
	/ & right::	 					Send, %Lot%
	/::	 							Send, /
	; ` & space::						Test(Iteration) 
	` & 1::							Test_1()
	` & 2::							Test_2()
	` & 3::							Test_3()
	`::	 							sendraw, ``
	~>+lbutton::					Send,{shiftDown}{click}{shiftup}
	$Numlock::						4tap() ;Clip.Paste()      	
	F20 up:: 	               Clip.Copy()
	F19 up::      	       		Clip.paste()
	Mbutton::						3Tap() ;	TMbutton() ;	Clip.Paste()
	rbutton::						2tap()

	>+F20::             			varbar.focus("Batch")
	>+F19::            		 	varbar.focus("Product")
	; F19 & F20::             varbar.focus("Product")

F19_And_F20:
	F19 & wheeldown::				Send % Blockrepeat(500) "{F8}"
	F19 & wheelup::				send % Blockrepeat(500) "{F9}"
	F19 & wheelleft::				gosub, F6
	F19 & wheelright::			GoSub, F7  
	F19 & Lbutton::				send,{ctrldown}{click}{ctrlup}
	F19 & Rbutton::				send,{Shiftdown}{click}{shiftup}
	F20 & up::						Send, %SampleID%
	F20 & left::					Send, %lot%
	F20 & right::					Send, %coated%
	F20 & s::	 					Send, %SampleID%
	F20 & 9::             	SaveWindow_Save()
	F20 & 0::             	SavedWindow_Restore()
	F13 & esc::					Varbar.reset()	
	F19 & \::             	CreditCard()
	; F19 & Space::         	Send, %product%
	; F20 & Space::         	SendInput, %batch%
	F19 & backspace::     	Send,{delete}
	F20 & Rshift::
	F20 & Insert::        	Clip("OCR")
	F20 & F7::            	Excel.NextS7heet()
	F20 & F6::            	Excel.PrevSheet()
	F20 & esc::     			run, Taskmgr.exe
	F20 & backspace::     	Send, {delete}
	F20 & \::             	Sendpassword()
	F20 & .::             	WindowInfo()
	F20 & o:: 				 	OpenApp.Outlook()
	F20 & =::             	Send,{CtrlDown}{=}{Ctrlup}
	F20 & -::             	Send,{CtrlDown}{-}{Ctrlup}
	F19 & enter::			 	varbar.focus("Edit1")
	F20 & enter::			 	varbar.focus("Edit2")
	F20 & ,::					varbar.Focus("Edit2")


	F20 & l::             	OpenApp.LMS()
	F20 & F19::           	Send, {F22}
	; F19 & lbutton::       	^Lbutton

	F19 & Media_Play_pause::
									my_screenwidth:=A_ScreenWidth-215
									my_screenheight:=A_Screenheight-115
									IniWrite, %my_screenwidth%, data.ini, Locations, Notes_x
									IniWrite, %my_screenheight%, data.ini, Locations, Notes_y
									Return
	

	F13 & `::					Test(iteration)









_Double_press_For_Enter:
#If (A_PriorHotKey = "F19 & Space" || A_PriorHotKey = "F21 & Space" || A_PriorHotKey = "F20 & Space") && (A_TimeSincePriorHotkey < 2000) 
	; F19 & space::           Send, {enter}
	; $space::              Send, {enter} 
	$rshift::               Send, {tab}
	F20 & Space::           Send, {enter}
	F21 & Space::           Send, {enter}

#If (A_PriorhotKey = "F19" || A_PriorHotKey = "F20" || A_PriorHotKey = "F21 & Space") && (A_TimeSincePriorHotkey < 5000) 
	$rshift::								Send, {tab}
	; $space::								Send, {enter}
#if 







;


#IfWinActive, Barcode Scanner - \\Remote
	enter::enter
	F20::LMS.SearchbarPaste()
	^v::LMS.SearchbarPaste()

_Main_LMS_Screen:
#Ifwinactive, NuGenesis LMS - \\Remote
	$Numlock::4tap() ;LMS.COA()
	F20 & Left::WinMove, A, , -283, -1196, 1662, 952
	+F19::lms.searchBar("")
	F19 & space::Send, %Product%{enter}
	F20 & space::Send, %Batch%{enter}
	F19 & /::Send, %lot%{enter}
	~Lbutton & F19::Send,{enter}
	Enter::LMS.SaveCode()
	numpaddot::blockrepeat(500) excel.connect(1)
	F20::LMS.SearchbarPaste()
	^v::LMS.SearchbarPaste()
	F19::LMS.Searchbar()
	; numpadadd::
	; 	if SwitchWorkSheets
	; 		excel.NextSheet()
	; 	else
	; 		lms.ProductSpecToggle()
	; 	return
	; numpadsub::
	; 	if SwitchWorkSheets
	; 		excel.Prevsheet()
	; 	else
	; 		lms.SampleRequestToggle()
	; 	return
	; F20::Send, ^c  
	; space & lbutton::Send, +{click}
	; space up::SendInput, ^{click}
	wheelright::clk(HScrollBarRightX, HScrollBarRightY,,1)     ;2right()
	wheelleft::clk(HScrollBarLeftX, HScrollBarLeftY,,1) ;2left()



_Results_Definition:
	#IfWinActive, Results Definition - \\Remote
		wheelup::Mouse_click("Edit")
		numlock::Send, % clk(712, 663) "{esc}"


_Register_new_samples:
	#ifwinactive, Register new samples - \\Remote
		F7:: 
			clk(181, 104,2,2)
			sleep 300
			Send, %Product%{enter}
			return

_Result_Entry:
	#Ifwinactive, Result Entry - \\Remote ;Enter Test Results window
		#MaxThreadsPerHotkey 2
      F9::WorkTab.ChangeTestResults("loop")
		#MaxThreadsPerHotkey 1 

_LMS_KEYS:
	#ifwinactive, Reason for Change - \\Remote
		F13 & v::
						send % "Verification" 
						sleep 200
						Click.Okay()
						return
_WFICA32:
  #IfWinActive, ahk_exe WFICA32.EXE, ;GENERIC LMS
	; F20 & Space::			Send, %Batch%
	; F19 & space::			Send, %Product%
	F19 & up::				Send, %sampleID%
	F19 & left::			Send, %lot%
	F19 & right::			Send, %coated%
	F19 & s::	 			Send, %SampleID%
	F21 & /::	 			Send, %SampleID%
	; $Rbutton up::		Mouse_RbuttonUP()
	^`::						Varbar.reset()
	enter::					click.okay()
	esc::						click.esc()
	; left::						left
	; Down::						down
	; right::					right
	; up::						up
	numpaddot::				closeWindow()
	<^r::						ReloadScript()
	F9::						3up()
	F8::						3Down()
	F7::						3Right()
	F6::						3Left()	
	^Wheeldown::			Blockrepeat(500) clip()
	^wheelup::				menu.lms()
	numpadMult::excel.connect()
	Rbutton & F19::       	send % WindowInfo() 
	Rbutton & F6::        	Send, {Backspace}
	Rbutton & Lbutton::   	Send, {Enter}
	; Rbutton::             	Menu.Env() ;send % Mouse_RbuttonUP()
F20 & wheelUp::				sendInput % Lot
	F20 & wheelRight::			sendInput % Batch
	F20 & wheelleft::				sendInput % product
	F20 & wheelDown::				sendInput % Coated
#IfWinActive,

_MouseIsOver:
	return

#If MouseIsOver("ahk_exe firefox.exe")
	numpaddot::controlSend, ahk_exe firefox.exe,  ^{w}
#If MouseIsOver("ahk_exe OUTLOOK.EXE")
	^Wheeldown::Blockrepeat(500) clip()
	Mbutton::
		winactivate, ahk_exe OUTLOOK.EXE
		3tap()
		return
		#if
; #If MouseIsOver("LMS Workbook.xlsb")
	; numpadadd::Excel.NextSheet()
	; numpadsub::Excel.PrevSheet()
; #If MouseIsOver("ahk_exe OUTLOOK.EXE")
			; Click 3
		; clip()
		; return
#if
#If MouseIsOver("NuGenesis LMS - \\Remote ahk_exe")
	F7::LMS.SearchBar(Batch,"{enter}")
	F6::LMS.SearchBar(Product,"{enter}")
	; numpadadd::lms.ProductSpecToggle()
	; numpadsub::lms.SampleRequestToggle()
	Numlock::4tap()
	^Wheeldown::send % Blockrepeat(500) "{click}" clip()
	; 	click
	; 	sleep 300
	; 	4tap()
	; 	return
	; space & lbutton::Send, +{click}
	; space up::SendInput, ^{click}
#if
  #If MouseIsOver("Result Editor - \\Remote") || MouseIsOver("Test Definition Editor - \\Remote") || MouseIsOver("Edit Formulation - \\Remote")
    Wheeldown::LMS.ScrollDown()
  #if











~lbutton::return

F13Click(){
KeyWait, lbutton, T0.25
	If ErrorLevel
	{
		KeyWait, Lbutton, D T5
		If !ErrorLevel 
		{
			Send, ^{click 3}
			Send, {CtrlUp}
		}
		exit
	}
	Send, ^{Click 2}
	Send, {CtrlUp}
	return
	}











