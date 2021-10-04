
#Ifwinactive,
#if


	F10::F21
	F11::F22
	F12::Send, {altdown}{tab}{altup}


;;		___KEY_DEFAULT:
	+^c::clip.Append()
	!^c::clip.Append(A_Space)
	!^x::send % clip.Append() "{backspace}"
	;#b::clip.Append(A_space)
	;;___Esc:
	esc & 1::						send, {shiftdown}{altdown}{-}{altup}{shiftup}
	esc & 2::						send, {shiftdown}{altdown}{=}{altup}{shiftup}
	esc & 3::						send, {shiftdown}{altdown}{0}{altup}{shiftup}
	esc::								esc
	
	Media_Prev::					MakeTransparent()
	Media_Play_Pause::			F16
	Media_Next::					F17
	Volume_Down::					F18
	Volume_up::						F18
	#lbutton::						send % pop(Clipboard) "{F18}" ;click and paste
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
	F20 & \::            		Sendpassword()

	F20 & wheeldown::				send % Blockrepeat(500) "{numpadDot}"
	F20 & wheelup::				send % Blockrepeat(500) "{numpadmult}"
	
	F15 & Lbutton::				send, {shiftdown}{ctrldown}{5}{ctrlup}{shiftup}
	F16 & Lbutton::				send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}							

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
	~lshift & Rshift::alttab	

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
	` & 1::							Test(1)
	` & 2::							Test(2)
	` & 3::							Test(3)
	`::	 								sendraw, ``
	; <!c::                      clip.Append()


	;;___F19_And_F20:
	+F20 up:: 	            Clip.append()
	F20 up:: 	              Clip.Copy()
	F19 up::      	       	Clip.paste()
	+F19 up::      	       	lms.searchbarPaste()
	>+F20::             			varbar.focus("Batch")
	>+F19::            		 	varbar.focus("Product")
	F19 & wheeldown::				Send % Blockrepeat(500) "{F8}"
	F19 & wheelup::				send % Blockrepeat(500) "{F9}"
	F19 & wheelleft::				gosub, F6
	F19 & wheelright::			GoSub, F7  
	F20 & /::	 					Send, %SampleID%
	F20 & up::						sendInput % Coated
	F20 & right::					sendInput % Lot
	F20 & left::					sendInput % product
	F20 & down::					sendInput % Batch
	F20 & 9::            		SaveWindow_Save()
	F20 & 0::            		SavedWindow_Restore()
	F13 & esc::						Varbar.reset()	
	; F19 & \::            		CreditCard()
	F19 & backspace::    		Send,{delete}
	F20 & Rshift::
	F20 & Insert::       		Clip("OCR")
	F20 & F7::           		Excel.NextSheet()
	F20 & F6::           		Excel.PrevSheet()
	F20 & esc::     				run, Taskmgr.exe
	F20 & backspace::    		Send, {delete}
	F20 & .::            		WindowInfo()

	F20 & =::            		Send,{CtrlDown}{=}{Ctrlup}
	F20 & -::            		Send,{CtrlDown}{-}{Ctrlup}
	F19 & enter::					varbar.focus("Edit1")
	F20 & enter::					varbar.focus("Edit2")
	F20 & ,::						varbar.Focus("Edit2")
	F20 & F19::          		Send, {F22}

	F19 & Media_Play_pause::
										my_screenwidth:=A_ScreenWidth-215
										my_screenheight:=A_Screenheight-115
										IniWrite, %my_screenwidth%, data.ini, Locations, Notes_x
										IniWrite, %my_screenheight%, data.ini, Locations, Notes_y
										Return
	

	F13 & `::					Test(iteration)



	#If (A_PriorHotKey = "F20 & up" || A_PriorHotKey = "F2O & Down" || A_PriorHotKey = "F20 & left" || A_PriorHotKey = "F20 & right") && (A_TimeSincePriorHotkey < 2000) 
	$rshift::               Send, {tab}
	F20 & up::	           Send, {enter}
	F20 & down::           Send, {enter}
	F20 & left::           Send, {enter}
	F20 & right::          Send, {enter}

	; #If (A_PriorHotKey = "F20") && (A_TimeSincePriorHotkey < 1000) 
	; $rshift::								Send, {tab}
	; $space::								Send, {enter}
	; F20::										Send, ^v
	; #if 





;;			___LMS KEYS
#Ifwinactive, NuGenesis LMS - \\Remote ;; ___Nugenesis
	Numlock::4tap() ;LMS.COA()
	mbutton::3tap()
		F7::						3Right()
	F6::						3Left()	
	; F20 & Left::WinMove, A, , -283, -1196, 1662, 952
	+F19::lms.searchBar("")
	F20 & left::Send, %Product%
	F20 & down::Send, %Batch%
	F20 & right::Send, %lot%
	; ~Lbutton & F19::Send,{enter}
	Enter::LMS.SaveCode()
	>+F20::LMS.SearchbarPaste()
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


	#Ifwinactive, Result Entry - \\Remote ;;___Result_Entry 
		#MaxThreadsPerHotkey 2
      Numlock::WorkTab.ChangeTestResults("loop")
		#MaxThreadsPerHotkey 1 
	wheelup::				send % Blockrepeat(500) Varbar.AddIteration() 
	wheeldown::   			send % Blockrepeat(500) Varbar.SubIteration()




	#IfWinActive, Results Definition - \\Remote ;;__Results_Definition:
		wheelup::Mouse_click("Edit")
		numlock::Send, % clk(712, 663) "{esc}"
		space::sendinput,{ctrldown}{click}{ctrlup}
		mbutton::Spectab.Table()



	#ifwinactive, Register new samples - \\Remote ;;__Register_new_samples:
		F7:: 
			clk(181, 104,2,2)
			sleep 300
			Send, %Product%{enter}
			return



	#ifwinactive, Reason for Change - \\Remote
		F13 & v::
						send % "Verification" 
						sleep 200
						Click.Okay()
						return
	#ifwinactive, Select tests for request: 
		space::send, ^{click}
		rbutton::send, ^{click}
		Numpaddot::send, {click 837, 656}{
		; wheelright::3right()
		; wheelleft::WorkTab.SelectTestSample()
	#ifwinactive, Select samples for test:
		; wheelright::3right()
		; wheelleft::WorkTab.SelectTestSample()

	#IfWinActive, ahk_exe WFICA32.EXE, ;;___LMS app

		F19 & left::			excel.Nextsheet()
		F19 & right::			excel.Prevsheet()
		F19 & down::			Varbar.SubIteration(0)
		F19 & up::	 			Varbar.AddIteration(0)
		Rbutton up::		Mouse_RbuttonUP()
		F14::
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
		^Wheeldown::			Blockrepeat(900) clip(0,2) GetSampleInfo() POP(Product,Batch " " Lot  " " Coated,3000) tt(Name " - " Customer ": " ShipToIndex,9000,1,1,3,200,"S") ;	Pinch
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
	#If MouseIsOver("ahk_exe Snipaste.exe")
		F8::send, {click}{esc}
		NumpadDot::send, {click}{esc}
	#If MouseIsOver("ahk_exe firefox.exe")
		numpaddot::controlSend, ahk_exe firefox.exe,  ^{w}
	#If MouseIsOver("ahk_exe OUTLOOK.EXE")
		^Wheeldown::Blockrepeat(500) clip()
		Mbutton::
 					winactivate, ahk_exe OUTLOOK.EXE
 					3tap()
 					return
	#If MouseIsOver("NuGenesis LMS - \\Remote ahk_exe")
		F7::LMS.SearchBar(Batch,"{enter}")
		F6::LMS.SearchBar(Product,"{enter}")
		Numlock::4tap()
		^Wheeldown::send % Blockrepeat(500) "{click}" clip()
	#If MouseIsOver("Result Editor - \\Remote") || MouseIsOver("Test Definition Editor - \\Remote") || MouseIsOver("Edit Formulation - \\Remote")
		Wheeldown::LMS.ScrollDown()
	#if


#ifwinactive, 
	~lbutton::return
	$Numlock::				4tap()
	Mbutton::						3Tap() 
	rbutton::					2tap()
	rshift & Appskey::			return
;;	___Lbuton:
F19 & \:: Sendpassword()
	F19 & /::        	 	OCR()
	Lbutton & F20::          	Send % BlockRepeat() "{shiftdown}{ctrldown}{4}{ctrlup}{shiftup}"
	Lbutton & F19::          	Send % BlockRepeat() "{shiftdown}{ctrldown}{3}{ctrlup}{shiftup}"
	F19 & lbutton::       		send, {shiftdown}{ctrldown}{4}{ctrlup}{shiftup}
	F20 & lbutton::       		send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}
	; Lbutton & ,::         OCR()
	Lbutton & down::           Send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}
	; ~>+lbutton::					Send,{shiftDown}{click}{shiftup}
#If getkeystate("lbutton","p") || (A_PriorhotKey = "lbutton" && A_TimeSincePriorhotkey < 800)  ; DoubleClick while
	rshift::            	clip("ORC")
	; F20::               Send % BlockRepeat() "{shiftdown}{ctrldown}{4}{ctrlup}{shiftup}"
	; F19::               Send % BlockRepeat() "{shiftdown}{ctrldown}{3}{ctrlup}{shiftup}"
#If
