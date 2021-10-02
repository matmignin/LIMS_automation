
#ifwinactive, 
	$Numlock::						4tap()
	Mbutton::						3Tap() ;	TMbutton() ;	Clip.Paste()
	rbutton::						2tap()
	rshift & Appskey::			return
;;	___Lbuton:
	lbutton & /::        	 	clip("ORC")
	Lbutton & F20::          	Send % BlockRepeat() "{shiftdown}{ctrldown}{4}{ctrlup}{shiftup}"
	Lbutton & F19::          	Send % BlockRepeat() "{shiftdown}{ctrldown}{3}{ctrlup}{shiftup}"
	F19 & lbutton::       		send, {shiftdown}{ctrldown}{4}{ctrlup}{shiftup}
	F20 & lbutton::       		send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}
	Lbutton & ,::          		send % BlockRepeat() clip("OCR")
	Lbutton & down::           Send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}
	; ~>+lbutton::					Send,{shiftDown}{click}{shiftup}
#If getkeystate("lbutton","p") || (A_PriorhotKey = "lbutton" && A_TimeSincePriorhotkey < 800)  ; DoubleClick while
	rshift & appskey::            	clip("ORC")
	F20::               Send % BlockRepeat() "{shiftdown}{ctrldown}{4}{ctrlup}{shiftup}"
	F19::               Send % BlockRepeat() "{shiftdown}{ctrldown}{3}{ctrlup}{shiftup}"
#If



;;	___3Fingers

3tap(){
	Global 
	setwindelay, 100
	if winactive("ahk_exe OUTLOOK.EXE") {
		click 3
		Send, ^{c}
		clip()
		return
	}
	if WinActive("ahk_exe WFICA32.EXE") {
		if Winactive("NuGenesis LMS - \\Remote"){ ; If Nugeneses
			LMS.DetectTab()
			; if (Tab="Samples")
				; Menu, Menu, add, New &Request, AutoFill
			if (Tab="Tests"){
				Menu,Menu, add, &Delete Retain, Autofill
				Try Menu,menu,show
			}
			else if (Tab="Specs") {
				if EnteringRotations
					SpecTab.CopySpecTemplate()
				else
					menu.lms()
				return
			}
			else if (Tab="Requests")
				clk(61, 635) ;enter results
			else if (Tab="Products")
				clk(67, 754) ;edit results
			else if (Tab="Samples"){
					clk(124, 294) ;assign Requests
					sleep 500
					if !Winactive("Edit request - \\Remote")
						sleep 500
					clk(258, 613,,,"Edit request - \\Remote")
					sleep 500
					if !WinActive("Select tests for request:")
						sleep 500
					clk(31, 102,,,"Select tests for request:")
			return
			}
		}
		else if winexist("Delete Test - \\Remote") || winexist("Delete Tests - \\Remote") || Winexist("Delete results - \\Remote") || Winexist("Delete sample templates - \\Remote") || WinExist("Delete specification - \\Remote") { ; Press Okay
			WinActivate, Delete
			send, y
			clk(229, 136)
			return
		}
		else if Winactive("Register new samples - \\Remote") 
				WorkTab.registerNewSamples()
		else if Winactive("Login - \\Remote") 
			menu.passwords()
		else if Winactive("Result Entry - \\Remote") 
			WorkTab.ChangeTestResults("toggle")
		else if Winactive("Edit specification - \\Remote")  	
			menu.LMS()
		else if Winactive("Composition - \\Remote")  	
			ProductTab.Table()
		else if Winactive("Results Definition - \\Remote")  	
			sendinput, {Blind}{ctrldown}{click}{ctrlup}
		else if Winactive("Edit Formulation - \\Remote") 
			productTab.EditFormulation()
		else if Winactive("Select Product - \\Remote ahk_exe WFICA32.EXE") 
			send % clk(107, 66) Product "{enter}{enter}"
		else if Winactive("Edit Product - \\Remote") 
			ProductTab.EditProduct() 
		else If Winactive("Select tests for request:") 
			WorkTab.SelectTestSample() 
		else if winexist("Release: ") { ; Press Okay
			WinActivate, 
			clk(131, 144)
			return
		}
	}
	else if Winexist("Sign :") || winexist("Windows Security") || winexist("CredentialUIBroker.exe")
		Sendpassword()
	else if winactive("ahk_exe firefox.exe") 
		Send, {ctrldown}{click}{ctrlup}
	else if Winexist("Sign :") || winexist("Windows Security") || winexist("CredentialUIBroker.exe") || winexist("Map VQ drive.bat ahk_exe cmd.exe")
		Sendpassword()
	else If Winactive("LMS Workbook.xlsb") 
		Sendinput, +{click}
	else If Winactive("Paster - Snipaste")
			Send, ^c
	else if Winactive("Snipper - Snipaste") 
			Send, {enter}
	else if Winactive("Program Manager ahk_exe explorer.exe") || winactive("ahk_exe explorer.exe ahk_class CabinetWClass") 
		Send, {lwindown}{e}{lwinup}
	else if winactive("ahk_class TscShellContainerClass") || winactive("ahk_class #32770") || winactive("Remote Desktop Connection")
			menu.Remote_Desktop()
		Else 
			return
		}


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
	else If WinActive("Results Definition - \\Remote"){
		Send, {enter}
		sleep 200
		WinActivate, "Test Definition Editor - \\Remote"
		clk(330, 619)
	}
	else if winactive("Register new samples - \\Remote")
		clk(502, 354)
	else if winactive("Select samples for test:") ; selecting the physical or micro
		send % "{click, 849, 661}"  ; add test. Clk(504, 324) 
	else if winactive("Select tests for request: R")
		send % Clk(504, 338)  ; add test.
	else if winactive("ahk_exe WFICA32.EXE") 
		Send, %Batch%
	else 
		Send, %Batch%
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
	else if WinActive("ahk_exe WFICA32.EXE")
		Send, %Product%
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
	; if winactive("ahk_exe EXCEL.EXE"){
	; 	excel.Connect(1)
	; 	tt(Product " " Batch " " Lot " " Coated "`n`t" Name " " Customer,1000,0,0,3,250,"R")
	; 	return
	; }
	if winactive("Result Entry - \\Remote")
		return
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
	else if Winactive("Results Definition - \\Remote")  	
		menu.LMS()
	else {
		Excel.Connect(1)
		tt(Product " " Batch " " Lot " " Coated "`n`t" Name " " Customer,1000,0,0,3,250,"R")wq
	}
	return
	
}


;;	___4Fingers
4tap(){
	If winactive("NuGenesis LMS - \\Remote") {
		LMS.Detecttab()
		if (Tab="Requests" || Tab:="Samples")
			; LMS.CoA()
			TT("LMS COA")
		else if (Tab:="Products") {
			TT("edit Compisition")
			; clk(86, 443) ;edit composition
			Return
			}
		else if (Tab="Specs") {
				if EnteringRotations
					menu.Products()
				else
					clk(67, 754) ;edit results
			return
			; click
			; Return
				; menu.lms()
			}
		else
			Menu.LMS()
	}
	else if winactive("PDF Preview - \\Remote")
		Send, {altdown}{F4}{altup}
	Else
		Sendinput, {altdown}{ctrldown}{tab}{ctrlup}{altup}
}

4Up(){
	global
	If winactive("NuGenesis LMS - \\Remote") {
		LMS.Detecttab()
		if (Tab="Requests" || Tab:="Samples")
			LMS.SampleRequestToggle()
			; LMS.ViewCoA()
		else if (Tab:="Products")
			{
			Pop("Products")
			; clk(86, 443) ;edit composition
			Return
			}
		else if (Tab="Specs")
			{
			Pop(" specs")
			; click
			; clk(67, 754) ;edit results
			Return
			}
		else
			Pop("nothing")
	}
	else if winactive("PDF Preview - \\Remote")
		Send, {altdown}{F4}{altup}
	Else
		Sendinput, {altdown}{ctrldown}{tab}{ctrlup}{altup}
		return
}
4Right(){
	global SwitchWorkSheets
		If winactive("ahk_exe Code.exe")
			SendInput, ^{d} ;go to Deffinition
		if (SwitchWorkSheets==1) {
				excel.nextsheet()
			return
		}
		else { 
			If winactive("ahk_exe OUTLOOK.EXE")
				WinMove, ahk_exe OUTLOOK.EXE, , 2197, 0, 363, 1554
			else If winactive("NuGenesis LMS - \\Remote") {
				LMS.Detecttab()
				if (Tab="Requests" || Tab:="Samples")
					LMS.SampleRequestToggle()
					; LMS.ViewCoA()
				else if (Tab:="Products")
					{
					Pop("Products")
					; clk(86, 443) ;edit composition
					Return
					}
				else if (Tab="Specs")
					{
					Pop(" specs")
					; click
					; clk(67, 754) ;edit results
					Return
					}
		else
			Pop("nothing")
	}
		If winactive("ahk_exe WFICA32.EXE")
			excel.nextsheet()
		else
			SendInput, #{right}
		}
		return
	}
4left(){
	global SwitchWorkSheets
		If winactive("ahk_exe Code.exe")
			SendInput, !^{d} ;go to reference
		if (SwitchWorkSheets==1) {
				excel.Prevsheet()
			return
		}
		else { 
			If winactive("ahk_exe OUTLOOK.EXE")
				WinMove, ahk_exe OUTLOOK.EXE, ,965, -1098, 1629, 1080
			else If winactive("NuGenesis LMS - \\Remote")
					lms.SampleRequestToggle()
			else If winactive("ahk_exe WFICA32.EXE")
				excel.Prevsheet()
			else 
			SendInput, #{left}
		}
			; lms.SampleRequestToggle()
		return
	}


;;	___2Fingers

2tap(){
	global
	If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 450)
	{
		Send, {F18}
	}
	else
		click R
	Return
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