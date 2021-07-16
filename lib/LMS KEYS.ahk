class TouchPad {
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
			send, {WheelRight}
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
		global
		If winactive("NuGenesis LMS - \\Remote") {
			LMS.Detecttab()
			if (Tab="Requests")
				clk(61, 635) ;enter results
			else if (Tab="Products")
				clk(67, 754) ;edit results
			else if (Tab="Samples")
					clk(107, 319) ;assign Requests
			else if (Tab="Welcome") {
			Menu,Menu, add, &Production Server, LMS_Env
			Menu,Menu, add, &Test Server, LMS_Env
			Menu.show()
			} 
			else
				Menu.LMS()
		} 
		if winactive("Edit Formulation - \\Remote") {
			mouseclick, left, 455, 472,2,0
			clk(250, 284)
		} else if Winactive("Register new samples - \\Remote"){
				WorkTab.registerNewSamples()
		} else if winactive("Edit Product - \\Remote") {
			ProductTab.EditProduct() 
		} else If WinActive("Select tests for request: R") {
			WorkTab.SelectTestSample() 
		} else If WinActive("Paster - Snipaste") || WINACTIVE("Snipper - Snipaste") {
			; sendlevel 1
        send, {ctrldown}{7}{ctrlup}
      ; sendlevel 0
		} Else 
			Autofill()
		return
		
		}


	4tap(){
		global
		If winactive("NuGenesis LMS - \\Remote") {
			LMS.Detecttab()
			if (Tab="Requests")
				{
				click
				clk(61, 635) ;enter results
				Return
				}
			else if (Tab="Samples")
				{
				clk(83, 753) ;Show Requests
				Return
				}
			else if (Tab="Products")
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
		Else
			Autofill()
		return
		}



	2right(){
		global
		If winactive("NuGenesis LMS - \\Remote") {
		lms.DetectTab()
			if (Tab="Samples")
				clk(xRequestsTab,yWorkTabs)
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
				clk(xSamplesTab,yWorkTabs)
			else If (Tab="Samples")
				clk(70, 395)
		Else
			send, %Product%
		sleep 700
		return
		}
	}


}

Main_Screen:
  #Ifwinactive, NuGenesis LMS - \\Remote
  F20 & Left::WinMove, A, , -283, -1196, 1662, 952
  F19 & space::Send, %Product%{enter}
  F20 & space::Send, %Batch%{enter}
  ~Lbutton & F19::send,{enter}
  Enter::LMS.SaveCode()
  numpaddiv::CloseWindow()
	wheelright::Touchpad.2right()
	wheelleft::Touchpad.2left()
	space & lbutton::send, +{click}
	space up::sendinput, ^{click}


Results_Definition:
  #IfWinActive, Results Definition - \\Remote
  wheelup::Mouse_click("Edit")
  numlock::send, % clk(712, 663) "{esc}"


Register_new_samples:
  #ifwinactive, Register new samples - \\Remote
	F9::
		ControlGetText, Product, Edit1, VarBar
		clk(181, 104,2,2)
		sleep 300
		send, %Product%{enter}
		return

Result_Entry:
  #Ifwinactive, Result Entry - \\Remote ;Enter Test Results window
    #MaxThreadsPerHotkey 2
      F9::WorkTab.ChangeTestResults("loop")
    #MaxThreadsPerHotkey 1 

LMS:
  #IfWinActive, ahk_exe WFICA32.EXE, ;GENERIC LMS
  F20 & Space::send, %Batch%
  F19 & space::send, %Product%
  F19 & up::send, %sampleID%
  F19 & left::send, %lot%
  F19 & right::send, %coated%
  $Rbutton up::Mouse_RbuttonUP()
  enter::click.okay()
  esc::click.esc()
  left::left
  Down::down
  right::right
  up::up
    numpaddiv::closeWindow()
  <^r::ReloadScript()
  F9::TouchPad.3up()
  F8::TouchPad.3Down()
  F7::TouchPad.3Right()
  F6::TouchPad.3Left()


  Scrolllock::TouchPad.3Tap()
  ; numlock::LMS.Movetab("Home")
	numpadMult::excel.connect()
  ; Numpadadd::lms.MoveTab("Right")
  ; NumpadSub::lms.MoveTab("Left")
		numpadadd::Excel.NextSheet()
		numpadsub::Excel.PrevSheet()
  ; Media_Prev::varbar.SubIteration(20)
  ; Media_next::Varbar.AddIteration(20)
  numlock::touchpad.4tap()




Scroll_Fix:
#If Mouse_IsOver("LMS Workbook.xlsb")
	numpadadd::Excel.NextSheet()
	numpadsub::Excel.PrevSheet()
#If Mouse_IsOver("NuGenesis LMS - \\Remote ahk_exe WFICA32.EXE")
	Numlock::
		click
		sleep 300
		touchpad.4tap()
		return
	space & lbutton::send, +{click}

	space up::sendinput, ^{click}
  #If mouse_isover("Result Editor - \\Remote") || mouse_isover("Test Definition Editor - \\Remote") || mouse_isover("Edit Formulation - \\Remote")
    Wheeldown::LMS.ScrollDown()
  #if






