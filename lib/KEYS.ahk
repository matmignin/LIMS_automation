; #ifwinexist, ahk_exe Teams.exe
#Ifwinactive,


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
Media_Prev::MakeTransparent()
Media_Play_Pause::F16
Media_Next::F17
Volume_Down::F18
Volume_up::F18
/ & up::						Varbar.AddIteration(0)
/ & down::   		      Varbar.SubIteration(0)
F13 & wheelright::		Varbar.AddIteration(0) 
F13 & wheelleft::   		Varbar.SubIteration(0)
F13 & wheelup::			Varbar.AddIteration() 
F13 & wheeldown::   		Varbar.SubIteration()
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
	numpadsub::          4Left()
	numpadadd::          4right()
	numpadMult::         #up
	numpaddot::          #down
	pause::					Suspend, Toggle
	; F15::							+tab
	F17::								menu.Apps()
	; F16::							Send, !{tab}
	j & k::							esc
	j::j
	k::k
	F20 & wheeldown::				send % Blockrepeat(500) "{numpadDot}"
	F20 & wheelup::				send % Blockrepeat(500) "{numpadmult}"
	F20 & wheelright::			gosub, Numpadadd
	F20 & wheelleft::				gosub, Numpadsub
	F19 & wheeldown::				Send % Blockrepeat(500) "{F8}"
	F19 & wheelup::				send % Blockrepeat(500) "{F9}"
	F19 & wheelleft::				gosub, F6
	F19 & wheelright::			GoSub, F7  
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
	<^;::	 							SendInput, %DateString%
	rshift & Appskey::			return
	; / & up:: 			SendInput, %SampleID%
	; ~Lbutton & left:: 			SendInput, %SampleID%
	; ~Lbutton & Down:: 			SendInput, %Coated%
	; ~Lbutton & right::			SendInput, %Lot%
	; ~Lbutton & up::	 			SendInput, %SampleID%
	Lbutton & F20::          	
										BlockInput, on
										sleep 25
										Send, {shiftdown}{ctrldown}{5}{ctrlup}{shiftup}
										blockinput, off
										sleep 200
										return
	Lbutton & F19::          	SendInput, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}
	Lbutton & left::          	
	sleep 200
	clip("OCR")
	sleep 200
	return
	Lbutton & down::           Send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}
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
	F20 & up::						Send, %SampleID%
	F20 & left::					Send, %lot%
	F20 & right::					Send, %coated%
	F20 & s::	 					Send, %SampleID%
	$Numlock::						4tap() ;Clip.Paste()      	
	; F20 up:: 	               Clip.Copy()
	; F19 up::      	       		Clip.paste()
	Mbutton::						3Tap() ;	TMbutton() ;	Clip.Paste()
	rbutton::						2tap()

	>+F20::             	varbar.focus("Batch")
	>+F19::             	varbar.focus("Product")
	; F19 & F20::             varbar.focus("Product")

F19_And_F20:
	F20 & 9::             	SaveWindow_Save()
	F20 & 0::             	SavedWindow_Restore()
	F13 & esc::					Varbar.reset()	
	F19 & \::             	CreditCard()
	; F19 & Space::         	Send, %product%
	; F20 & Space::         	SendInput, %batch%
	F19 & backspace::     	Send,{delete}
	F20 & Rshift::
	F20 & Insert::        	Clip("OCR")
	F20 & F7::            	Excel.NextSheet()
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
	
	F13 & Lbutton::       	F13Click()
	F13 & `::					Test(iteration)









Double_press_For_Enter:
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

_Lbuton:
#If (A_PriorhotKey = "lbutton" && A_TimeSincePriorhotkey < 300) 
	~lbutton::
		sleep 200
		if getkeystate(lbutton, "P")
			tt("ye")
			return
#If getkeystate("lbutton","p") || (A_PriorhotKey = "lbutton" && A_TimeSincePriorhotkey < 800) 
;   space::             Send, {ctrldown}{click}{ctrlup}
  F19::               Send, {F21}
  .::                 WindowInfo()
  v::                 Send, {shiftdown}{altdown}{ctrldown}{v}{ctrlup}{altup}{shiftup}
  F20::               Send, {shiftdown}{ctrldown}{4}{ctrlup}{shiftup}
  left::              Send, {shiftdown}{ctrldown}{5}{ctrlup}{shiftup}
  down::              Send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}
  e::                 Send,{LWinDown}{e}{lwinup}
  o::                 OpenApp.Outlook()
  d::                 LMS.Orient()
  w::                 OpenApp.Workbook()
#If





; class TrackPad {
	3Right(){
		global
		If winactive("NuGenesis LMS - \\Remote")
			LMS.SearchBar(Batch,"{enter}")
		else If winactive("Result Entry - \\Remote")
			WorkTab.ChangeTestResults()
		else If winactive("Select methods tests - \\Remote")
			SpecTab.Methods()
		else If WinActive("Composition - \\Remote")
			Send, {enter}
		else If WinActive("Test Definition Editor - \\Remote")
			clk(330, 619) ;click save
		else If WinActive("Results Definition - \\Remote")
			Send, {enter}
		else if winactive("Register new samples - \\Remote")
			clk(502, 354)
		else if winactive("Select samples for test:")
			send % Clk(504, 324) "{click, 849, 661}"  ; add test.
		else	
			; Send, {WheelRight}
		return
	}

	3left(){
			global
		If winactive("NuGenesis LMS - \\Remote")
			LMS.SearchBar(Product,"{enter}")
		else If winactive("Select methods tests - \\Remote")
			Send, {esc}
		else If WinActive("Composition - \\Remote")
			Send, {esc}
		else If WinActive("Test Definition Editor - \\Remote")
			Send, {esc}
		else If WinActive("Results Definition - \\Remote")
			Send, {esc}
		else if winactive("Edit test (Field Configuration:")
			Send, {esc}
		else If winactive("Result Entry - \\Remote")  ;Enter Test Results window"
			WorkTab.ChangeTestResults("toggle")
		else if winactive("Register new samples - \\Remote")
			Send, {esc}
		else if winactive("Select samples for test:")
			Send, {esc}
		else 
			Send, {wheelleft}
		return
		}


	3Down(){
		global
		If winactive("NuGenesis LMS - \\Remote")
			LMS.Filter(Clear)
		else if winactive("Select samples for test:")
			Clk(853, 657) ; click okay.
		else
			return
		return
	}


	3up(){
		global
		If winactive("NuGenesis LMS - \\Remote")
			LMS.DetectTab()
				if (Tab="Requests"){
					click, 2
					sleep 200
					Autofill()
					return
				}
				else if (Tab="Products")
					LMS.ViewCoa()
		else if winactive("Edit test (Field Configuration:")
			Autofill()
		else if winactive("Register new samples - \\Remote")
			LMS.SearchBar(Product,"{enter}")
		else If WinActive("Select tests for request: R")
			clk(638, 70)
		else if winactive("Select samples for test:")
			send % Clk(250, 70) "{up}" ; click okay.
		else If WinActive("Composition - \\Remote")
			ProductTab.AddCOASpace()
		else
			return
		return
		
		}


	3tap(){
	Global 
	if winactive("ahk_exe OUTLOOK.EXE") {
		click 3
		Send, ^{c}
		clip()
		return
	}
		else if winexist("Delete Test - \\Remote") { ; Press Okay
		WinActivate, Delete Test - \\Remote
		clk(229, 136)
		return
	}
		else if winexist("Release: ") { ; Press Okay
		WinActivate, 
		clk(131, 144)
		return
	}
	else if Winactive("NuGenesis LMS - \\Remote") 
		Menu.Lms()
	else if winactive("ahk_exe firefox.exe") 
		Send, {ctrldown}{click}{ctrlup}
	else if Winexist("Sign :") || winexist("Windows Security") || winexist("CredentialUIBroker.exe") 
		Sendpassword()
	else If Winactive("LMS Workbook.xlsb") 
		excel.connect()
	else if Winactive("Register new samples - \\Remote") 
			WorkTab.registerNewSamples()
	else if Winactive("Login - \\Remote") 
		menu.passwords()
	else if Winactive("Result Entry - \\Remote") 
		WorkTab.ChangeTestResults("toggle")
	else if Winactive("Edit specification - \\Remote")  	
		menu.LMS()
	else if Winactive("Results Definition - \\Remote")  	
		menu.LMS()
	else if Winactive("Edit Formulation - \\Remote") 
	{
		mouseclick, left, 455, 472,2,0
		clk(250, 284)
	}
	else if Winactive("Select Product - \\Remote ahk_exe WFICA32.EXE") 
		send % clk(107, 66) Product "{enter}{enter}"
	else if Winactive("Edit Product - \\Remote") 
		ProductTab.EditProduct() 
	else If Winactive("Select tests for request: R") 
		WorkTab.SelectTestSample() 
	else If Winactive("Paster - Snipaste")
			Send, ^c
	else if Winactive("Snipper - Snipaste") 
			Send, {enter}
	else if Winactive("Program Manager ahk_exe explorer.exe") || winactive("ahk_exe explorer.exe ahk_class CabinetWClass") 
		Send, {lwindown}{e}{lwinup}
	Else 
	return
	; }
	}


	4tap(){
			If winactive("NuGenesis LMS - \\Remote") {
				LMS.Detecttab()
			if (Tab="Requests" || Tab:="Samples")
					LMS.CoA()
				; else if (Tab:="Samples")
					; LMS.CoA()
				else if (Tab:="Products")
					{
					clk(86, 443) ;edit composition
					Return
					}
				else if (Tab="Specs")
					{
					click
					clk(67, 754) ;edit results
					Return
					}
				else
					Menu.LMS()
			}
			else if winactive("PDF Preview - \\Remote")
				Send, {altdown}{F4}{altup}
			Else
				Send, ^v
		}

4Right(){
	global SwitchWorkSheets
		if (SwitchWorkSheets==1) {
				excel.nextsheet()
			return
		}
		else 
		{ 
			If winactive("ahk_exe Code.exe")
				Send, {numpadadd}
			else If winactive("ahk_exe OUTLOOK.EXE")
				WinMove, ahk_exe OUTLOOK.EXE, , 2197, 0, 363, 1554
			else If winactive("ahk_exe WFICA32.EXE")
				excel.nextsheet()
			else
			SendInput, #{right}
		}
		return
}
4left(){
	global SwitchWorkSheets
		if (SwitchWorkSheets==1) {
				excel.Prevsheet()
			return
		}
		else
		{ 
			If winactive("ahk_exe Code.exe")
				Send, {numpadsub}
			else If winactive("ahk_exe OUTLOOK.EXE")
				WinMove, ahk_exe OUTLOOK.EXE, ,965, -1098, 1629, 1080
			else If winactive("ahk_exe WFICA32.EXE")
				excel.Prevsheet()
			else 
			SendInput, #{left}
		}
			; lms.SampleRequestToggle()
		return
}

	2right(){
		global
		If winactive("NuGenesis LMS - \\Remote") {
		lms.DetectTab()
			if (Tab="Samples")
				clk(RequestsTab,yWorkTabs)
			else if (Tab="Requests")
				clk(56, 630)
			else
				lms.SearchBar(Batch,"{enter}")
			sleep 800
		}
		Else
			Send, %batch%
		sleep 700
		return
		}


	2Left(){
		global
		If winactive("NuGenesis LMS - \\Remote"){
			lms.DetectTab()
			if (Tab="Requests")
				clk(SamplesTab,yWorkTabs)
			else If (Tab="Samples")
				clk(70, 395)
		Else
			Send, %Product%
		sleep 700
		return
		}
	}

2tap(){
	global
	If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 450)
	{
		Send, {F21}
	}
	else
		click R
	Return
}


#IfWinActive, Barcode Scanner - \\Remote
	enter::enter


_Main_LMS_Screen:
#Ifwinactive, NuGenesis LMS - \\Remote
	$Numlock::4tap() ;LMS.COA()
	F20 & Left::WinMove, A, , -283, -1196, 1662, 952
	; +F19::lms.searchBar("")
	; F19 & space::Send, %Product%{enter}
	; F20 & space::Send, %Batch%{enter}
	F19 & /::Send, %lot%{enter}
	~Lbutton & F19::Send,{enter}
	Enter::LMS.SaveCode()
	numpaddot::blockrepeat(500) excel.connect(1)
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











