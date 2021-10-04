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
	~Lbutton & F19::Send,{enter}
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

