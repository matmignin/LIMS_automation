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
		if winactive("ahk_exe EXCEL.EXE"){
			excel.Connect()
			tt(Product " " Batch " " Lot " " Coated "`n`t" Name " " Customer,1000,0,0,3,250,"R")
			return
		}
		If winactive("NuGenesis LMS - \\Remote") {
				Excel.Connect()
				TT(Product " " Batch "`n`t" Name " - " Customer)
				return
		}
	/* 
				LMS.DetectTab()
					if (Tab="Requests"){
						click, 2
						sleep 200
						Autofill()
						return
					}
					else if (Tab="Products")
						LMS.ViewCoa()
	*/
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
		else	
			return
		return
		
		}
; [] yolo

	3tap(){
	Global 
	if winactive("ahk_exe OUTLOOK.EXE") {
		click 3
		Send, ^{c}
		clip()
		return
	}
		else if winexist("Delete Test - \\Remote") || Winexist("Delete results - \\Remote") || Winexist("Delete sample templates - \\Remote") || WinExist("Delete specification - \\Remote") { ; Press Okay
		WinActivate, Delete
		send, y
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
	else if Winexist("Sign :") || winexist("Windows Security") || winexist("CredentialUIBroker.exe") || winexist("Map VQ drive.bat ahk_exe cmd.exe")
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
	else if Winactive("Composition - \\Remote")  	
		ProductTab.Table()
	else if Winactive("Results Definition - \\Remote")  	
		sendinput, {Blind}{ctrldown}{click}{ctrlup}
	else if Winactive("Edit Formulation - \\Remote") 
	{
		productTab.EditFormulation()
		; mouseclick, left, 455, 472,2,0
		; clk(250, 284)
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

~
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