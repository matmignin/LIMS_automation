; #ifwinexist, ahk_exe Teams.exe
#Ifwinactive,

_TestingZone:
	f10::F21
	F11::F22
	F12::Send, {altdown}{tab}{altup}



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
		return
	}


_KEY_DEFAULT:
+^c::clip.Append()
!^c::clip.Append(A_Space)
#c::
if (winc_presses > 0) ; SetTimer already started, so we log the keypress instead.
{
    winc_presses += 1
    return
}
; Otherwise, this is the first press of a new series. Set count to 1 and start
; the timer:
winc_presses := 1
SetTimer, KeyWinC, -400 ; Wait for more presses within a 400 millisecond window.
return

KeyWinC:
if (winc_presses = 1) ; The key was pressed once.
{
    Clip.Copy()
}
else if (winc_presses = 2) ; The key was pressed twice.
{
    clip.Append()  
	 sleep 300 ; Open a different folder.
}
else if (winc_presses > 2)
{
    clip.Append(A_Space)
}
; Regardless of which action above was triggered, reset the count to
; prepare for the next series of presses:
winc_presses := 0
return





;#c::clip.Append()
#x::send % clip.Append() "{backspace}"
#b::clip.Append(A_space)
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
	#lbutton::						F18
	F13 & -::
	/ & down::   		      	Varbar.SubIteration(0)
	F13 & +::
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
	<+^z::							Send, {Ctrldown}{y}{CtrlUp} ;redu

	~rshift & lshift::shiftAltTab
	~lshift & Rshift::alttab				;Send, {lwindown}{right}{lwinup}  ;shift dance
	; ~>+lshift::alttabandmenu		;	Send, {lwindown}{left}{lwinup}   ;shift dance alttab
	; ~<+Rshift::AltTabAndMenu		;	Send, {lwindown}{left}{lwinup}   ;shift dance altta
; ~Rshift & up:: 			SendInput, %SampleID%
	lshift & Appskey::			return
	Lctrl & Appskey::				Return
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
	`::	 								sendraw, ``
	;F20 up:: 	               Clip.Copy()
	F19 up::      	       		Clip.paste()
	; <!c::                      clip.Append()

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
	F20 & /::	 					Send, %SampleID%
	F20 & up::						sendInput % Coated
	F20 & right::					sendInput % Lot
	F20 & left::					sendInput % product
	F20 & down::					sendInput % Batch
	F20 & 9::            		SaveWindow_Save()
	F20 & 0::            		SavedWindow_Restore()
	F13 & esc::						Varbar.reset()	
	F19 & \::            		CreditCard()
	F19 & backspace::    		Send,{delete}
	F20 & Rshift::
	F20 & Insert::       		Clip("OCR")
	F20 & F7::           		Excel.NextSheet()
	F20 & F6::           		Excel.PrevSheet()
	F20 & esc::     				run, Taskmgr.exe
	F20 & backspace::    		Send, {delete}
	F20 & \::            		Sendpassword()
	F20 & .::            		WindowInfo()
	F20 & o:: 						OpenApp.Outlook()
	F20 & =::            		Send,{CtrlDown}{=}{Ctrlup}
	F20 & -::            		Send,{CtrlDown}{-}{Ctrlup}
	F19 & enter::					varbar.focus("Edit1")
	F20 & enter::					varbar.focus("Edit2")
	F20 & ,::						varbar.Focus("Edit2")


	F20 & l::            		OpenApp.LMS()
	F20 & F19::          		Send, {F22}
	; F19 & lbutton::       	^Lbutton

	F19 & Media_Play_pause::
										my_screenwidth:=A_ScreenWidth-215
										my_screenheight:=A_Screenheight-115
										IniWrite, %my_screenwidth%, data.ini, Locations, Notes_x
										IniWrite, %my_screenheight%, data.ini, Locations, Notes_y
										Return
	

	F13 & `::					Test(iteration)









_Double_press_For_Enter:
#If (A_PriorHotKey = "F20 & up" || A_PriorHotKey = "F2O & Down" || A_PriorHotKey = "F20 & left" || A_PriorHotKey = "F20 & right") && (A_TimeSincePriorHotkey < 2000) 

	; F19 & up::           Send, {enter}
	; $up::              Send, {enter} 
	$rshift::               Send, {tab}
	F20 & up::	           Send, {enter}
	F20 & down::           Send, {enter}
	F20 & left::           Send, {enter}
	F20 & right::          Send, {enter}

#If (A_PriorHotKey = "F20") && (A_TimeSincePriorHotkey < 1000) 
	$rshift::								Send, {tab}
	; $space::								Send, {enter}
	; F20::										Send, ^v
#if 







;



_NuGenesis_LMS:
#Ifwinactive, NuGenesis LMS - \\Remote ;; _NuGenesis LMS
	Numlock::4tap() ;LMS.COA()
	; F20 & Left::WinMove, A, , -283, -1196, 1662, 952
	+F19::lms.searchBar("")
	F19 & space::Send, %Product%{enter}
	F20 & space::Send, %Batch%{enter}
	F19 & /::Send, %lot%{enter}
	~Lbutton & F19::Send,{enter}
	Enter::LMS.SaveCode()
	numpaddot::blockrepeat(500) excel.connect(1)
	; F20::LMS.SearchbarPaste()
	+^v::LMS.SearchbarPaste()
	; F19::LMS.Searchbar()
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

_Result_Entry:
	#Ifwinactive, Result Entry - \\Remote ;Enter Test Results window
		#MaxThreadsPerHotkey 2
      F9::WorkTab.ChangeTestResults("loop")
		#MaxThreadsPerHotkey 1 



_Results_Definition:
	#IfWinActive, Results Definition - \\Remote
		wheelup::Mouse_click("Edit")
		numlock::Send, % clk(712, 663) "{esc}"
		space::sendinput,{ctrldown}{click}{ctrlup}
		mbutton::Spectab.Table()


_Register_new_samples:
	#ifwinactive, Register new samples - \\Remote
		F7:: 
			clk(181, 104,2,2)
			sleep 300
			Send, %Product%{enter}
			return


_LMS_KEYS:
	#ifwinactive, Reason for Change - \\Remote
		F13 & v::
						send % "Verification" 
						sleep 200
						Click.Okay()
						return
#ifwinactive, Select tests for request: 
	; wheelright::3right()
	; wheelleft::WorkTab.SelectTestSample()
#ifwinactive, Select samples for test:
	; wheelright::3right()
	; wheelleft::WorkTab.SelectTestSample()
#if
_LMS:
  #IfWinActive, ahk_exe WFICA32.EXE,

	F19 & left::			excel.Nextsheet()
	F19 & right::			excel.Prevsheet()
	F19 & down::			Varbar.SubIteration(0)
	F19 & up::	 			Varbar.AddIteration(0)
	; Rbutton up::		Mouse_RbuttonUP()
	^`::						Varbar.reset()
	enter::					click.okay()
	esc::						click.esc()
	numpaddot::				closeWindow()
	<^r::						ReloadScript()
	numpadMult::			4up()
	F9::						Excel.Connect(1) ;3up()
	F8::						3Down()
	F7::						3Right()
	F6::						3Left()	
	^Wheeldown::			Blockrepeat(900) clip(0,2) GetSampleInfo() POP(Product,Batch " " Lot  " " Coated,3000) tt(Name " - " Customer ": " ShipToIndex,9000,1,1,3,200,"S") ;;	Pinch
	^wheelup::				LMS.SearchbarPaste() ;; Spread
	Rbutton & F19::       	send % WindowInfo() 
	Rbutton & F6::        	Send, {Backspace}
	Rbutton & Lbutton::   	Send, {Enter}
	; Rbutton::             	Menu.Env() ;send % Mouse_RbuttonUP()

#IfWinActive, Barcode Scanner - \\Remote
	enter::enter
	; F20::LMS.SearchbarPaste()
	^v::LMS.SearchbarPaste()



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
	; ~wheelup::Excel.Connect()
	; ~wheeldown::Excel.Connect()
	; ~wheelleft::Excel.Connect()
	; ~wheelright::Excel.Connect()
	; numpadadd::Excel.NextSheet()
	; numpadsub::Excel.PrevSheet()
; #If MouseIsOver("ahk_exe OUTLOOK.EXE")
			; Click 3
		; clip()
		; return
#If MouseIsOver("ahk_exe Snipaste.exe")
	F8::sendinput, {click}{esc}
	NumpadDot::sendinput, {click}{esc}
; #if
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











