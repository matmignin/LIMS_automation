
_MouseIsOver:
	#if mouseisover("ahk_class Shell_TrayWnd") || MouseIsOver("ahk_class Shell_SecondaryTrayWnd")
		mbutton::
		F15::menu.TaskBar()
		;Space::Send, {lwin down}d{lwin up}
	#If MouseIsOver("ahk_exe Snipaste.exe")
		F8::send, {click}{esc}
		NumpadDot::send, {click}{esc}
		wheeldown::send % Blockrepeat(50) "{wheeldown}"
		wheelup::send % Blockrepeat(50) "{Wheelup}"
		^wheeldown::
			winactivate, ahk_exe Snipaste.exe
			send, ^{wheeldown}
			return
		^wheelup::
			winactivate, ahk_exe Snipaste.exe
			send, ^{wheelup}
			return

	#If MouseIsOver("ahk_exe OUTLOOK.exe")
		;^Wheeldown::Blockrepeat(500) clip()
		Numlock::
			If !winactive("ahk_exe OUTLOOK.EXE")
			click
			3tap()
			winactivate, NuGenesis LMS - \\Remote
			LMS.Searchbar(clipboard,"{enter}")
			return
		F15::
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
	; #If MouseIsOver("Result Editor - \\Remote") || MouseIsOver("Test Definition Editor - \\Remote") || MouseIsOver("Edit Formulation - \\Remote")
		; Wheeldown::LMS.Scrolldown()
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

#Ifwinactive
;;	_____3Fingers

	3tap(){
		Global
		; setwindelay, 100
		If winactive("ahk_exe WFICA32.EXE") {
			if winactive("NuGenesis LMS - \\Remote"){ ; If Nugeneses
				LMS.DetectTab()
				; if (Tab="Samples")
					; Menu, Menu, add, New &Request, AutoFill
				if (Tab="Tests"){
					Menu,Menu, add, &Delete Retain, Autofill
					Try Menu,menu,show
				}
				else if (Tab="Specs") {
					if (Mode:="EnteringRotations")
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
					if !winactive("Edit request - \\Remote")
						sleep 500
					send, {click, 258, 613}
					sleep 800
					if !winactive("Select tests for request: R")
						sleep 500
					winactivate, Select tests for request: R
						send, {click, 31, 102}
					setwindelay, 100
					; blockinput, off
				return
				}
			}
			else if winexist("Delete Test - \\Remote") || winexist("Delete Tests - \\Remote") || winexist("Delete results - \\Remote") || winexist("Delete sample templates - \\Remote") || winExist("Delete specification - \\Remote") { ; Press Okay
				winactivate, Delete
				send, y
				clk(229, 136)
				return
			}
			else if winactive("Result Editor - \\Remote") && (copyPasteToggle=1) {
				SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,1,FullRequirements)
				winWaitactive, NuGenesis LMS - \\Remote, 10
				copyPasteToggle=0
			}
			else if winactive("Register new samples - \\Remote")
					WorkTab.registerNewSamples()
			else if winactive("Login - \\Remote")
				menu.passwords()
			else if winactive("Result Entry - \\Remote")
				WorkTab.ChangeTestResults("toggle")
			else if winactive("Edit specification - \\Remote")
				menu.LMS()
			else if winactive("Composition - \\Remote")
				ProductTab.Table()
			else if winactive("Results Definition - \\Remote")
				sendinput, {Blind}{ctrldown}{click}{ctrlup}
			else if winactive("Edit Formulation - \\Remote")
				productTab.EditFormulation()
			else if winactive("Select Product - \\Remote ahk_exe WFICA32.EXE")
				send % clk(107, 66) Product "{enter}{enter}"
			else if winactive("Edit Product - \\Remote")
				ProductTab.EditProduct()
			else If winactive("Select tests for request: R")
				WorkTab.SelectTestSample()
			else if winexist("Release: ") || winexist("Release: Rotational Testing Schedule - \\Remote") { ; Press Okay
				winactivate,
				clk(131, 144)
			}
			else if winexist("Sign :") || winexist("windows Security") || winexist("CredentialUIBroker.exe") || winexist("Map VQ drive.bat ahk_exe cmd.exe")
				Sendpassword()
		}
		else if winactive("ahk_exe Jaspersoft Studio.exe") || winactive("Parameter: REQUESTGUID")
			REQUESTGUID()
		else 	if winactive("ahk_exe OUTLOOK.EXE") {
			clipCheckIfEmpty()
			clip()
			return
		}
		else If winactive("Mats LMS Workbook.xlsb")
			Sendinput, +{click}
		else If winactive("Paster - Snipaste")
				Send, ^c
		else if winactive("Snipper - Snipaste")
				Send, {enter}
		else if winactive("Program Manager ahk_exe explorer.exe") || winactive("ahk_exe explorer.exe ahk_class CabinetWClass")
			Send, {lwindown}{e}{lwinup}
		else if winactive("ahk_class TscShellContainerClass") || winactive("ahk_class #32770") || winactive("Remote Desktop Connection")
				menu.Remote_Desktop()
		else if winactive("ahk_exe Code.exe")
				sendinput, +{F9}
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
		else If winactive("Composition - \\Remote")
			Send, {enter}
		else If winactive("Test Definition Editor - \\Remote")
			clk(330, 619) ;click save
		else If winactive("Results Definition - \\Remote"){
			Send, {enter}
			sleep 200
			winactivate, "Test Definition Editor - \\Remote"
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
		else If winactive("Composition - \\Remote")
			Send, {esc}
		else If winactive("Test Definition Editor - \\Remote")
			Send, {esc}
		else If winactive("Results Definition - \\Remote")
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
		else if winactive("ahk_exe WFICA32.EXE")
			Send, %Product%
		else if winactive("ahk_exe explorer.exe")
			ExplorerSearch(Product)
		else
			send, %Product%
		return
	}


	3down(){
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
		else If winactive("Select tests for request: R")
			clk(638, 70)
		else if winactive("Select samples for test:")
			send % Clk(250, 70) "{up}" ; click okay.
		else If winactive("Composition - \\Remote")
			ProductTab.AddCOASpace()
		else if winactive("Results Definition - \\Remote")
			menu.LMS()
		else If ConnectExcel {
			Excel.Connect(1)
			tt(Product " " Batch " " Lot " " Coated "`n`t" Name " " Customer,1000,0,0,3,250,"R")
		}
		return

	}


;;	_____4Fingers
	4tap(){
		global
		If winactive("NuGenesis LMS - \\Remote") {
			LMS.Detecttab()
			if (Tab="Requests") {
					if (Mode:="EnteringRotations") {
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
				else If (tab:="Samples")
					menu.Setstatus()
			else if (Tab:="Products") {
					clk(86, 443) ;edit composition
				Return
				}
			else if (Tab="Specs") {
					if (Mode:="EnteringRotations")
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

		else if winactive("Composition - \\Remote")
			ProductTab.AddCOASpace()
		else if winactive("Mats LMS Workbook.xlsb - Excel")
			menu.SetStatus()


		else if winactive("Edit test (Field Configuration: ")
			send % "{click 384, 222}{tab 2}{end 2}(on sample log){Click 334, 618}"
			; AddSampleLog(count)
			; LMS.AddSampleLog(1)
		else 	if winactive("ahk_exe OUTLOOK.EXE") {
			clipCheckIfEmpty()
			clip()
			return
		}
		else if winactive("PDF Preview - \\Remote")
			Send, {altdown}{F4}{altup}
	}

	4up(){
		global
		If winactive("NuGenesis LMS - \\Remote") {
			LMS.Detecttab()
			if (Tab="Requests") || (Tab:="Samples")
				; LMS.SampleRequestToggle()
				LMS.ViewCoA()
			else if (Tab:="Products")
				{
				Pop("Products")
				; clk(86, 443) ;edit composition
				Return
				}
			else if (Tab="Specs")
				{
				Pop("specs")
				; click
				; clk(67, 754) ;edit results
				Return
				}
			else
				Pop("nothing")
		}
			else if winactive("Results Definition - \\Remote")
			menu.lms()
		else if winactive("PDF Preview - \\Remote")
			Send, {altdown}{F4}{altup}
		Else
			Sendinput, #{up}
			return
	}
	4Right(){
		global
			If winactive("ahk_exe Code.exe")
				Sendinput, ^{d} ;go to Definition
			if (Mode:="SwitchWorkSheets") {
					excel.nextsheet()
				return
			}
			else {
				If winactive("ahk_exe OUTLOOK.EXE")
					winMove, ahk_exe OUTLOOK.EXE, , 2197, 0, 363, 1554
				else If winactive("NuGenesis LMS - \\Remote") ;{
						LMS.SearchBar(Batch,"{enter}","Add")
					; LMS.Detecttab()
					; if (Tab="Requests" || Tab:="Samples")
					; 	LMS.SampleRequestToggle()
					; 	; LMS.ViewCoA()
					; else if (Tab:="Products")
					; 	{
					; 	Pop("Products")
					; 	; clk(86, 443) ;edit composition
					; 	Return
					; 	}
					; else if (Tab="Specs")
					; 	{
					; 	Pop(" specs")
					; 	; click
					; 	; clk(67, 754) ;edit results
					; 	Return
					; 	}
			; else
				; Pop("nothing")
		; }
			If winactive("ahk_exe WFICA32.EXE")
				excel.nextsheet()
			else
				Sendinput, #{right}
			}
			return
		}
	4left(){
		global
			If winactive("ahk_exe Code.exe")
				Sendinput, !^{d} ;go to reference
			if (Mode:="SwitchWorkSheets") {
					excel.Prevsheet()
				return
			}
			else {
				If winactive("ahk_exe OUTLOOK.EXE")
					winMove, ahk_exe OUTLOOK.EXE, ,965, -1098, 1629, 1080
				else If winactive("NuGenesis LMS - \\Remote")
					LMS.SearchBar(Product,"{enter}","Add")
						; lms.SampleRequestToggle()
				else If winactive("ahk_exe WFICA32.EXE")
					excel.Prevsheet()
				else
				Sendinput, {lwindown}{left}{lwinup}
			}
				; lms.SampleRequestToggle()
			return
		}

	4down(){
		global
		SendLevel, 1
			if winactive("Inbox - mmignin@vitaquest.com - Outlook")
				return
			else if winactive("ahk_exe Snipaste.exe")
				send, {esc}
			else if winactive("PDF Preview - \\Remote") || winactive("ahk_exe OUTLOOK.EXE") || winactive("OneNote for windows 10")|| winactive("ahk_exe explorer.exe")
				Send, {altdown}{F4}{altup}
			else If winactive("ahk_exe WFICA32.EXE"){
				if winactive("NuGenesis LMS - \\Remote")
					LMS.FilterClear()
				else If (winactive("Select methods tests - \\Remote") || winactive("Composition - \\Remote") || winactive("Test Definition Editor - \\Remote") || winactive("Results Definition - \\Remote") || winactive("Edit test (Field Configuration:") || winactive("Register new samples - \\Remote") || winactive("Select samples for test:") || winactive("Results Definition - \\Remote"))
					Send, {esc}
				}
			else if winactive("ahk_exe firefox.exe") || winactive("ahk_exe Code.exe") || winactive("ahk_exe msedge.exe")
				Send, ^{w}
			else winactive("Adobe Acrobat Reader:")
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
		else if winactive("ahk_exe firefox.exe") || winactive("ahk_exe msedge.exe") || winactive("ahk_exe Code.exe") {
			Send, ^{w}
			sleep 400
			return
		}
		else if winactive("ahk_exe explorer.exe") || winactive("ahk_exe OUTLOOK.EXE") || winactive("OneNote for windows 10") {
			Send, {altdown}{F4}{altup}
			sleep 400
			return
		}
		else if winactive("Settings ahk_class ApplicationFramewindow"){
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


		4down(){
		global
		if winactive("Inbox - mmignin@vitaquest.com - Outlook") ; || winactive("ahk_exe OUTLOOK.EXE")
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
		else if winactive("ahk_exe firefox.exe") || winactive("ahk_exe msedge.exe") || winactive("ahk_exe Code.exe") {
			Send, ^{w}
			sleep 400
			return
		}
		else if winactive("ahk_exe explorer.exe") || winactive("ahk_exe OUTLOOK.EXE") || winactive("OneNote for windows 10") {
			Send, {altdown}{F4}{altup}
			sleep 400
			return
		}
		else if winactive("Settings ahk_class ApplicationFramewindow"){
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




;;	______2Fingers

2tap(){
	global
If MouseIsOver("VarBar ahk_exe AutoHotkey.exe"){
					MouseGetPos,,,,winControl
				; ControlGetFocus,winControl,VarBar ahk_exe AutoHotkey.exe
				if (winControl="Edit1")
					menu.ProductSelection()
				else if (winControl="Edit2")
					menu.ProductSelection()
				else if (winControl="Edit3") || (winControl="Edit4")
					menu.ProductSelection()
				else if (winControl="Edit6") || (winControl="Edit7")
					menu.ProductSelection()
				else
					VarBar.Menu()
				return
	}
	If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 550) ;double click right mouse
	{
		If MouseIsOver("NuGenesis LMS - \\Remote")
			menu.LMS()
		else
			Send, {F18}
		return
	}
	; else if (A_PriorHotKey != A_ThisHotKey and A_TimeSincePriorHotkey < 550)
		; return
	; else if (A_PriorHotKey = A_ThisHotKey AND A_TimeSincePriorHotkey > 450)
		; return
	else if (A_TimeSincePriorHotkey > 550)
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
  ;sdf
}

F21::clip("OCR")


