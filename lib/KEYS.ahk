
#if

#ifwinactive, 

	$Numlock::				4tap()
	Mbutton::						3Tap() 
	rbutton::					2tap()
	rshift & Appskey::			return
;;	___Lbuton:
	F19 & \:: Sendpassword()
	F19 & /::        	 	OCR()
	Lbutton & F18::          	Send % BlockRepeat() "{shiftdown}{ctrldown}{4}{ctrlup}{shiftup}"
	Lbutton & F19::          	Send % BlockRepeat() "{shiftdown}{ctrldown}{3}{ctrlup}{shiftup}"
	F19 & lbutton::       		send, {shiftdown}{ctrldown}{4}{ctrlup}{shiftup}
	F18 & lbutton::       		send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}
	; Lbutton & ,::        		 OCR()
	Lbutton & down::           Send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}
	; ~>+lbutton::							Send,{shiftDown}{click}{shiftup}
; #If getkeystate("lbutton","p") || (A_PriorhotKey = "lbutton" && A_TimeSincePriorhotkey < 800)  ; DoubleClick while
; 	rshift::            	clip("ORC")
; 	; F18::               Send % BlockRepeat() "{shiftdown}{ctrldown}{4}{ctrlup}{shiftup}"
; 	; F19::               Send % BlockRepeat() "{shiftdown}{ctrldown}{3}{ctrlup}{shiftup}"
; #If
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

	; ~rshift & lshift::shiftAltTab
	; ~lshift & Rshift::alttab	

	; lshift & Appskey::			return
	; Lctrl & Appskey::				Return
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


	;;___F19_And_F18:
	F18 & \::            		Sendpassword()
	F18 & wheeldown::				send % Blockrepeat(500) "{numpadDot}"
	F18 & wheelup::				send % Blockrepeat(500) "{numpadmult}"
	F19 up::      	       	Clip.paste()
	+F19 up::      	       	lms.searchbarPaste()
	>+F18::             			varbar.focus("Batch")
	>+F19::            		 	varbar.focus("Product")
	F19 & wheeldown::				Send % Blockrepeat(500) "{F8}"
	F19 & wheelup::				send % Blockrepeat(500) "{F9}"
	F19 & wheelleft::				gosub, F6
	F19 & wheelright::			GoSub, F7  
	F18 & up::						sendInput % Coated
	F18 & right::					sendInput % Lot
	F18 & left::					sendInput % product
	F18 & down::					sendInput % Batch
	F13 & esc::						Varbar.reset()	
	; F19 & \::            		CreditCard()
	F19 & backspace::    		Send,{delete}
	; F18 & Rshift::
	F18 & Insert::       		Clip("OCR")
	F18 & F7::           		Excel.NextSheet()
	F18 & F6::           		Excel.PrevSheet()
	F18 & esc::     				run, Taskmgr.exe
	F18 & backspace::    		Send, {delete}
	F18 & .::            		WindowInfo()

	F18 & =::            		Send,{CtrlDown}{=}{Ctrlup}
	F18 & -::            		Send,{CtrlDown}{-}{Ctrlup}
	F19 & enter::					varbar.focus("Edit1")
	F18 & enter::					varbar.focus("Edit2")
	; F18 & ,::						varbar.Focus("Edit2")
	F18 & F19::          		Send, {F22}

	; +F18 up:: 	            Clip.append()
	; F18:: 	              Clip.Copy()
	F19 & Media_Play_pause::
										my_screenwidth:=A_ScreenWidth-215
										my_screenheight:=A_Screenheight-115
										IniWrite, %my_screenwidth%, data.ini, Locations, Notes_x
										IniWrite, %my_screenheight%, data.ini, Locations, Notes_y
										Return
	

	F13 & `::					Test(iteration)



; 	#If (A_PriorHotKey = "F18 & up" || A_PriorHotKey = "F2O & Down" || A_PriorHotKey = "F18 & left" || A_PriorHotKey = "F18 & right") && (A_TimeSincePriorHotkey < 2000) 
; 	$rshift::               Send, {tab}
; 	F18 & up::	           Send, {enter}
; 	F18 & down::           Send, {enter}
; 	F18 & left::           Send, {enter}
; 	F18 & right::          Send, {enter}

; 	; #If (A_PriorHotKey = "F18") && (A_TimeSincePriorHotkey < 1000) 
; 	; $rshift::								Send, {tab}
; 	; $space::								Send, {enter}
; 	; F18::										Send, ^v
; #if 





;;			___LMS KEYS
#Ifwinactive, NuGenesis LMS - \\Remote ;; ___Nugenesis
	Numlock::4tap() ;LMS.COA()
	mbutton::3tap()
		F7::						3Right()
	F6::						3Left()	
	; F18 & Left::WinMove, A, , -283, -1196, 1662, 952
	+F19::lms.searchBar("")
	F18 & left::Send, %Product%
	F18 & down::Send, %Batch%
	F18 & right::Send, %lot%
	; ~Lbutton & F19::Send,{enter}
	Enter::LMS.SaveCode()
	>+F18::LMS.SearchbarPaste()
	+^v::LMS.SearchbarPaste()
	; F19::LMS.Searchbar()
	; F18::Send, ^c  
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
		; Rbutton & Lbutton::   	Send, {Enter}
		; Rbutton::             ;send % Mouse_RbuttonUP()

	#IfWinActive, Barcode Scanner - \\Remote
		enter::enter
		; F18::LMS.SearchbarPaste()
		^v::LMS.SearchbarPaste()
#IfWinActive,







