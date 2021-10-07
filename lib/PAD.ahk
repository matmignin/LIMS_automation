
_MouseIsOver:
	#If MouseIsOver("ahk_exe Snipaste.exe")
		F8::send, {click}{esc}
		NumpadDot::send, {click}{esc}
	#If MouseIsOver("ahk_exe firefox.exe")
		numpaddot::controlSend, ahk_exe firefox.exe,  ^{w}
	#If MouseIsOver("ahk_exe OUTLOOK.exe")
		^Wheeldown::Blockrepeat(500) clip()
		Numlock::
		Mbutton::
 					If !winactive("ahk_exe OUTLOOK.EXE")
						click
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

clipCheckIfEmpty(){
	clipboard:=
	sendinput, ^c
	clipwait, 0.25
	if errorlevel
	{
			send, {click 3}
		sendinput, ^c
		clipwait, 0.25
	}
}

#IfWinActive
;;		___3Fingers

3tap(){
	Global 
	setwindelay, 100
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
				; blockinput, on
				setwindelay, 400
				send, {click 124, 294} ;assign Requests
				sleep 500
				if !Winactive("Edit request - \\Remote")
					sleep 500
				send, {click, 258, 613}
				sleep 800
				if !WinActive("Select tests for request: R")
					sleep 500
				WinActivate, Select tests for request: R
					send, {click, 31, 102}
				setwindelay, 100
				; blockinput, off
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
		else If Winactive("Select tests for request: R") 
			WorkTab.SelectTestSample() 
		else if winexist("Release: ") { ; Press Okay
			WinActivate, 
			clk(131, 144)
			return
		}
	}

	else if winactive("ahk_exe Code.exe") {
		send, ^f
	}
	else 	if winactive("ahk_exe OUTLOOK.EXE") {
		clipCheckIfEmpty()
		clip()
		return
	}
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
		send % Clk(504, 324) "{click, 849, 661}"  ; add test. 
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
	else if winactive("Register new samples - \\Remote")
		Send, {esc}
	else if winactive("Select samples for test:")
		Send, {esc}
	else If winactive("Result Entry - \\Remote")  ;Enter Test Results window"
		WorkTab.ChangeTestResults("toggle")
	else if winactive("Select tests for request: R")
		send % Clk(40, 105) 
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
	else if winactive("ahk_exe Snipaste.exe")
		send, {esc}
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


;;		___4Fingers
4tap(){
	global 
	If winactive("NuGenesis LMS - \\Remote") {
		LMS.Detecttab()
		if (Tab="Requests") {
				if EnteringRotations {
					MouseGetPos, mx, mY
					send, {click 2}
					sleep 300
						if !winactive("Edit test (Field Configuration:")
							winactivate
						WorkTab.AddTestDescription("(on sample log)")
						sleep 300
						if winactive("NuGenesis LMS - \\Remote")
							mousemove, %mx%, %My% ,0 
						return
				}
				else
					clk(68, 630) ;enter results
				return
			}	
			; else If (tab:="Samples")
			; 	LMS.CoA()
		else if (Tab:="Products") {
				clk(86, 443) ;edit composition
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
		else 	if winactive("ahk_exe OUTLOOK.EXE") {
		clipCheckIfEmpty()
		clip()
		return
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
	global 
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
	global 
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

CloseWindow(){
	global
	SendLevel, 1
		if Winactive("Inbox - mmignin@vitaquest.com - Outlook")
			return
		else if winactive("ahk_exe Snipaste.exe")
			send, {esc}
		else if Winactive("PDF Preview - \\Remote") || winactive("ahk_exe OUTLOOK.EXE") || Winactive("OneNote for Windows 10")|| winactive("ahk_exe explorer.exe")
			Send, {altdown}{F4}{altup}
		else If winactive("ahk_exe WFICA32.EXE"){
			if Winactive("NuGenesis LMS - \\Remote")
				LMS.FilterClear()
			else If (winactive("Select methods tests - \\Remote") || WinActive("Composition - \\Remote") || WinActive("Test Definition Editor - \\Remote") || WinActive("Results Definition - \\Remote") || winactive("Edit test (Field Configuration:") || winactive("Register new samples - \\Remote") || winactive("Select samples for test:") || Winactive("Results Definition - \\Remote"))
				Send, {esc}
			}
		else if Winactive("ahk_exe firefox.exe") || Winactive("ahk_exe Code.exe") || Winactive("ahk_exe msedge.exe")
			Send, ^{w}
		else Winactive("Adobe Acrobat Reader:")
			send {esc}
		sendlevel, 0
		return
	}


/*   other close windows
	else if winactive("Composition - \\Remote"){
			clk(841, 895)
			sleep 50
			clk(946, 896)
			sleep 400
		}
		else If winactive("NuGenesis LMS - \\Remote")
			LMS.FilterClear()
		else if WinActive("ahk_exe firefox.exe") || winactive("ahk_exe msedge.exe") || winactive("ahk_exe Code.exe") {
			Send, ^{w}
			sleep 400
			return
		}
		else if WinActive("ahk_exe explorer.exe") || winactive("ahk_exe OUTLOOK.EXE") || winactive("OneNote for Windows 10") {
			Send, {altdown}{F4}{altup}
			sleep 400
			return
		}
		else if winactive("Settings ahk_class ApplicationFrameWindow"){
			winclose
			sleep 400
			return
		}
		else if winactive("ahk_exe EXCEL.EXE"){
			Send, {ctrldown}{down}{ctrlup}
			sleep 400
			return
		}
		else if winactive("Adobe Acrobat Reader"){
			Send, ^q
			sleep 400
		}
		else
			PostMessage, 0x112, 0xF060,,, A     ; ...so close window     
		return
		}
		
		
		CloseWindow(){
		global
		if WinActive("Inbox - mmignin@vitaquest.com - Outlook") ; || winactive("ahk_exe OUTLOOK.EXE")
			Return
		else if winexist("PDF Preview - \\Remote"){
			winactivate
			sleep 100
			Send, {altdown}{F4}{altup}
		}
		else if winactive("Results Definition - \\Remote"){
			Send, {esc}
			return
		}
		; else if winactive("Composition - \\Remote"){
			; 	clk(841, 895)
			; 	sleep 50
			; 	clk(946, 896)
			; 	sleep 400
			; }
		else If winactive("NuGenesis LMS - \\Remote")
			LMS.FilterClear()
		else if WinActive("ahk_exe firefox.exe") || winactive("ahk_exe msedge.exe") || winactive("ahk_exe Code.exe") {
			Send, ^{w}
			sleep 400
			return
		}
		else if WinActive("ahk_exe explorer.exe") || winactive("ahk_exe OUTLOOK.EXE") || winactive("OneNote for Windows 10") {
			Send, {altdown}{F4}{altup}
			sleep 400
			return
		}
		else if winactive("Settings ahk_class ApplicationFrameWindow"){
			winclose
			sleep 400
			return
		}
		else if winactive("ahk_exe EXCEL.EXE"){
			Send, {ctrldown}{down}{ctrlup}
			sleep 400
			return
		}
		else if winactive("Adobe Acrobat Reader"){
			Send, ^q
			sleep 400
		}
		else
			PostMessage, 0x112, 0xF060,,, A     ; ...so close window     
		return
		}
	 */




;;		___2Fingers

2tap(){
	global
	If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 450) ;double click right mouse
	{
		Send, {F|18}
	}
	else
		click Right
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
 
~lbutton::return