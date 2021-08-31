; #ifwinexist, ahk_exe Teams.exe
#Ifwinactive,


_TestingZone:
Volume_Mute::
sendlevel 1
send, {F23}
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
; 	send, !
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
F12::send, {altdown}{tab}{altup}
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
	; F16::							send, !{tab}
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
	;Media_Next::					send, {shiftdown}{altdown}{tab}{altup}{shiftup}
	;Media_Prev::					send, {altdown}{tab}{altup}
	;Volume_Down::					send, {lwindown}{tab}{lwinup}
	$#F7::							send, {lwindown}{right}{lwinup}
	$#F6::							send, {lwindown}{left}{lwinup}
	$#F9::							send, {lwindown}{up}{lwinup}
	$#F8::							send, {lwindown}{down}{lwinup}
	$!F7::							send, {laltdown}{right}{laltup}
	$!F6::							send, {laltdown}{left}{laltup}
	$!F9::							send, {laltdown}{up}{laltup}
	$!F8::							send, {laltdown}{down}{laltup}
	+Backspace::					backspace
	+^z::								send, {shiftup}{Ctrldown}{y}{CtrlUp}
	~<+rshift::						send, {lwindown}{right}{lwinup}
	~>+lshift::						send, {lwindown}{left}{lwinup}
	~Rshift & up:: 			sendinput, %SampleID%
	~Rshift::
	lshift & Appskey::			Return
	rshift & Appskey::			return
	<^;::	 							sendinput, %DateString%{space}
	; / & up:: 			sendinput, %SampleID%
	; ~Lbutton & left:: 			sendinput, %SampleID%
	; ~Lbutton & Down:: 			sendinput, %Coated%
	; ~Lbutton & right::			sendinput, %Lot%
	; ~Lbutton & up::	 			sendinput, %SampleID%
	Lbutton & F20::          	send, {shiftdown}{ctrldown}{5}{ctrlup}{shiftup}
	Lbutton & F19::          	send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}
	Lbutton & left::           send, {shiftdown}{ctrldown}{5}{ctrlup}{shiftup}
	Lbutton & down::           send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}
	^Media_Next::					MakeTransparent()
	/ & space::						send, %Coated%
	/ & .::							send, {?}
	/ & right::	 					send, %Lot%
	/::	 							send, /
	` & space::						Test(Iteration) 
	` & 1::							Test_1()
	` & 2::							Test_2()
	` & 3::							Test_3()
	`::	 							sendraw, ``
	~>+lbutton::					send,{shiftDown}{click}{shiftup}
	; F19 & up::						send, %SampleID%
	F19 & left::					send, %lot%
	F19 & right::					send, %coated%
	F19 & s::	 					send, %SampleID%
	$Numlock::						4tap() ;Clip.Paste()      	
	F20 up:: 	               Clip.Copy()
	F19 up::      	       	Clip.paste()
	Mbutton::						3Tap() ;	TMbutton() ;	Clip.Paste()
	rbutton::						2tap()

	>+Space::             	varbar.focus("Product")
	F19 & F20::             varbar.focus("Product")

F19_And_F20:
	F20 & 9::             	SaveWindow_Save()
	F20 & 0::             	SavedWindow_Restore()
	; F20 & '::           	varbar.follow()
	F13 & esc::					Varbar.reset()	
	F19 & \::             	CreditCard()
	F19 & Space::         	send, %product%
	F20 & Space::         	Sendinput, %batch%
	F19 & backspace::     	send,{delete}
	F20 & Rshift::
	F20 & Insert::        	Clip("OCR")
	F20 & F7::            	Excel.NextSheet()
	F20 & F6::            	Excel.PrevSheet()
	F20 & esc::     			run, Taskmgr.exe
	F20 & backspace::     	send, {delete}
	F20 & Right::         	send, #{right}
	F20 & Left::          	send, #{Left}
	F20 & UP::            	send, #{UP}
	F20 & Down::          	send, #{Down}
	F20 & \::             	Sendpassword()
	F20 & .::             	WindowInfo()
	F20 & o:: 				 	OpenApp.Outlook()
	F20 & =::             	sendinput,{CtrlDown}{=}{Ctrlup}
	F20 & -::             	sendinput,{CtrlDown}{-}{Ctrlup}
	F19 & enter::			 	varbar.focus("Edit1")
	F20 & enter::			 	varbar.focus("Edit2")
	F20 & ,::					varbar.Focus("Edit2")


	F20 & l::             	OpenApp.LMS()
	F21 & l::             	OpenApp.LMS()
	F20 & F19::           	send, {F22}
	; F21 & F19::           	send, {F22}
	F19 & lbutton::       	^Lbutton

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
	F19 & space::           send, {enter}
	; $space::              send, {enter} 
	$rshift::               send, {tab}
	F20 & Space::           send, {enter}
	F21 & Space::           send, {enter}

#If (A_PriorhotKey = "F19" || A_PriorHotKey = "F20" || A_PriorHotKey = "F21 & Space") && (A_TimeSincePriorHotkey < 5000) 
	$rshift::								send, {tab}
	; $space::								send, {enter}
#if 

_Lbuton:
#If (A_PriorhotKey = "lbutton" && A_TimeSincePriorhotkey < 300) 
	~lbutton::
		sleep 200
		if getkeystate(lbutton, "P")
			tt("ye")
			return
#If getkeystate("lbutton","p") || (A_PriorhotKey = "lbutton" && A_TimeSincePriorhotkey < 800) 
  space::             send, {ctrldown}{click}{ctrlup}
  F19::               send, {F21}
  .::                 WindowInfo()
  v::                 send, {shiftdown}{altdown}{ctrldown}{v}{ctrlup}{altup}{shiftup}
  F20::               send, {shiftdown}{ctrldown}{4}{ctrlup}{shiftup}
  left::              send, {shiftdown}{ctrldown}{5}{ctrlup}{shiftup}
  down::              send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}
  e::                 send,{LWinDown}{e}{lwinup}
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
			send, {enter}
		else If WinActive("Test Definition Editor - \\Remote")
			clk(330, 619) ;click save
		else If WinActive("Results Definition - \\Remote")
			send, {enter}
		else if winactive("Register new samples - \\Remote")
			clk(502, 354)
		else if winactive("Select samples for test:")
			send % Clk(504, 324) "{click, 849, 661}"  ; add test.
		else	
			; send, {WheelRight}
		return
	}

	3left(){
			global
		If winactive("NuGenesis LMS - \\Remote")
			LMS.SearchBar(Product,"{enter}")
		else If winactive("Select methods tests - \\Remote")
			send, {esc}
		else If WinActive("Composition - \\Remote")
			send, {esc}
		else If WinActive("Test Definition Editor - \\Remote")
			send, {esc}
		else If WinActive("Results Definition - \\Remote")
			send, {esc}
		else if winactive("Edit test (Field Configuration:")
			send, {esc}
		else If winactive("Result Entry - \\Remote")  ;Enter Test Results window"
			WorkTab.ChangeTestResults("toggle")
		else if winactive("Register new samples - \\Remote")
			send, {esc}
		else if winactive("Select samples for test:")
			send, {esc}
		else 
			send, {wheelleft}
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
		send, ^{c}
		clip()
		return
	}
		else if winexist("Delete Test - \\Remote") { ; Press Okay
		WinActivate, Delete Test - \\Remote
		clk(229, 136)
		return
	}
		else if winexist("Release: 21") { ; Press Okay
		WinActivate, 
		clk(131, 144)
		return
	}
	else if Winactive("NuGenesis LMS - \\Remote") 
		Menu.Lms()
	else if winactive("ahk_exe firefox.exe") 
		send, {ctrldown}{click}{ctrlup}
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
			send, ^c
	else if Winactive("Snipper - Snipaste") 
			send, {enter}
	else if Winactive("Program Manager ahk_exe explorer.exe") || winactive("ahk_exe explorer.exe ahk_class CabinetWClass") 
		send, {lwindown}{e}{lwinup}
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
				send, {altdown}{F4}{altup}
			Else
				Send, ^v
		}

4Right(){
	global SwitchSpaces
		if (SwitchSpaces==1) {
			sendinput, #^{right}
			return
		}
		else 
		{ 
			If winactive("ahk_exe Code.exe")
				send, {numpadadd}
			else If winactive("ahk_exe OUTLOOK.EXE")
				WinMove, ahk_exe OUTLOOK.EXE, , 2197, 0, 363, 1554
			else
				excel.nextsheet()
		}
		return
}
4left(){
	global SwitchSpaces
		if (SwitchSpaces==1) {
			sendinput, #^{left}
			return
		}
		else
		{ 
			If winactive("ahk_exe Code.exe")
				send, {numpadsub}
			else If winactive("ahk_exe OUTLOOK.EXE")
				WinMove, ahk_exe OUTLOOK.EXE, ,965, -1098, 1629, 1080
			else 
				excel.Prevsheet()
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
			send, %batch%
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
			send, %Product%
		sleep 700
		return
		}
	}

2tap(){
	global
	If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 450)
	{
		send, {F21}
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
	F21 & Left::WinMove, A, , -283, -1196, 1662, 952
	+F19::lms.searchBar("")
	F19 & space::Send, %Product%{enter}
	F20 & space::Send, %Batch%{enter}
	F21 & space::Send, %Batch%{enter}
	F19 & /::Send, %lot%{enter}
	~Lbutton & F19::send,{enter}
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
	F20::send, ^c
	; space & lbutton::send, +{click}
	; space up::sendinput, ^{click}
	wheelright::clk(HScrollBarRightX, HScrollBarRightY,,1)     ;2right()
	wheelleft::clk(HScrollBarLeftX, HScrollBarLeftY,,1) ;2left()



_Results_Definition:
	#IfWinActive, Results Definition - \\Remote
		wheelup::Mouse_click("Edit")
		numlock::send, % clk(712, 663) "{esc}"


_Register_new_samples:
	#ifwinactive, Register new samples - \\Remote
		F7:: 
			clk(181, 104,2,2)
			sleep 300
			send, %Product%{enter}
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
	F20 & Space::			send, %Batch%
	F21 & Space::			send, %Batch%
	F19 & space::			send, %Product%
	F19 & up::				send, %sampleID%
	F19 & left::			send, %lot%
	F19 & right::			send, %coated%
	F19 & s::	 			send, %SampleID%
	F21 & /::	 			send, %SampleID%
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
	Rbutton & F6::        	send, Backspace
	Rbutton & Lbutton::   	send, Enter
	; Rbutton::             	Menu.Env() ;send % Mouse_RbuttonUP()


_MouseIsOver:
	return

#If MouseIsOver("ahk_exe firefox.exe")
	numpaddot::controlsend, ahk_exe firefox.exe,  ^{w}
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
	; space & lbutton::send, +{click}
	; space up::sendinput, ^{click}
#if
  #If MouseIsOver("Result Editor - \\Remote") || MouseIsOver("Test Definition Editor - \\Remote") || MouseIsOver("Edit Formulation - \\Remote")
    Wheeldown::LMS.ScrollDown()
  #if











~lbutton::return

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











