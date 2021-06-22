
 
 
 
 
;KEY_LMS:
return
 #Ifwinactive, NuGenesis LMS - \\Remote
  F20 & Left::WinMove, A, , -283, -1196, 1662, 952
  ; F6::LMS.SearchBar(Product,"{enter}")
  ; F7::LMS.SearchBar(Batch,"{enter}")
	; F8::LMS.FilterBar(Product)
  ; F9::LMS.ViewCoa()
  
  rshift & lbutton::sendinput,{shiftDown}{click}{shiftup}
  F20 & space::send, %Batch%{enter}
  F19 & ,::send, %Batch%{enter}
  ~Lbutton & F19::send,{enter}
  F19 & space::Send, %Product%{enter}
  ; Mbutton::menu.LMS()
  Enter::LMS.SaveCode()
	F19::
	lms.OrientBoxes()
	;lms.detectTab()
	; tooltip(Tab)
	return
 #Ifwinactive, Select methods tests - \\Remote
  ; F7::LMS.Methods()
  ; F6::esc
  #Ifwinactive, Edit Product - \\Remote
	; Mbutton::ProductTab_EditProduct()
#ifwinactive, Edit Formulation - \\Remote
  ; Mbutton::send, {tab}%product%{Tab 23}
 #IfWinActive, Composition - \\Remote
  ; F6::esc
  ; F7::enter
  numpaddiv::Mouse_Closewindow()
  ; Mbutton::Autofill()
;  #IfWinActive, Test Definition Editor - \\Remote
  ; F6::esc
  ; F7::click 330, 619 ;click save
 #IfWinActive, Results Definition - \\Remote
  ; F6::esc
  ; F7::enter
  wheelup::Mouse_click("Edit")
  WheelDown::
   Click, 1330, 592
   sleep 100
   click, 338, 619
   Return
;  #IfWinActive, Edit specification - \\Remote
 #ifwinactive, PDF Preview - \\Remote
  numpaddiv::Mouse_CloseWindow()
;  #ifwinactive, Edit test (Field Configuration:
  ; F9::Autofill()
  ; F6::esc
  ; Rbutton::WorkTab.ChangeTestResults("toggle")
  ; F6::WorkTab.ChangeTestResults("toggle")
  ; F7::WorkTab.ChangeTestResults()
 #ifwinactive, Register new samples - \\Remote
  F20 & wheelup::LMS.SearchBar()
  ; Mbutton::Autofill()
  ; F9::LMS.SearchBar(Product,"{enter}")
  ; F7::send, % Mouse_Save() "{click 502, 354}" Next
	; F8::Send,{click 194, 188}^a
  ; F6::esc
;  #IfWinActive, Select tests for request: R
;  F9::clk(638, 70)
  ; Mbutton::WorkTab.SelectTestSample()
;  #ifwinactive, Selectsamples for test:
  ; F7::Clk(504, 324) ; add test.
  ; F8::Clk(853, 657) ; click okay.
  ; F9::send % Clk(250, 70) "{up}" ; click okay.
  ; F6::esc
 #Ifwinactive, Result Entry - \\Remote ;Enter Test Results window
 #MaxThreadsPerHotkey 2
  F9::WorkTab.ChangeTestResults("loop")
 #MaxThreadsPerHotkey 1
 #IfWinActive, ahk_exe WFICA32.EXE, ;GENERIC LMS
  F19 & ,::send, %Batch%
  F20 & Space::send, %Batch%
  F19 & space::send, %Product%
  F19 & F20::menu.Variables()
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
  <^r::ReloadScript()
  Mbutton::LMS.3Tap()
  F9::lms.3up()
  F8::lms.3Down()
  F7::LMS.3Right()
  F6::LMS.3left()
#IfWinActive,
  ; sendlevel 1
 pause::reload
 ` & esc::Pause





Class LMS {
	
3Right(){
	global
	If winactive("Result Entry - \\Remote")
		WorkTab.ChangeTestResults()
	else If winactive("NuGenesis LMS - \\Remote")
		LMS.SearchBar(Batch,"{enter}")
	else If winactive("Select methods tests - \\Remote")
		LMS.Methods()
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
		send, {LMS.SearchBar(Product,"{enter}")}
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
		send, {WorkTab.ChangeTestResults("toggle")}
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
		LMS.FilterBar(Product)
	else if winactive("Select samples for test:")
		Clk(853, 657) ; click okay.
	; else If winactive("Select methods tests - \\Remote")
	; else if winactive("Edit Formulation - \\Remote")
	; else If WinActive("Composition - \\Remote")
	; else If WinActive("Results Definition - \\Remote")
	; else if winactive("PDF Preview - \\Remote")
	; else if winactive("Edit test (Field Configuration:")
	; else If winactive("Result Entry - \\Remote") ;Enter Test Results window
	; else if winactive("Register new samples - \\Remote")
		; Send,{click 194, 188}^a
	; else If WinActive("Select tests for request: R")
	else
		return
	return
		
}

3up(){
	global
	If winactive("NuGenesis LMS - \\Remote")
		LMS.ViewCoa()
	else if winactive("Edit test (Field Configuration:")
		Autofill()
	else if winactive("Register new samples - \\Remote")
		LMS.SearchBar(Product,"{enter}")
	else If WinActive("Select tests for request: R")
		clk(638, 70)
	else if winactive("Select samples for test:")
		send % Clk(250, 70) "{up}" ; click okay.
	; else If winactive("Result Entry - \\Remote")  ;Enter Test Results window
	; else If winactive("Select methods tests - \\Remote")
	; else if winactive("Edit Formulation - \\Remote")
	; else If WinActive("Composition - \\Remote")
	; else If WinActive("Results Definition - \\Remote")
	; else if winactive("PDF Preview - \\Remote")
	else
		return
	return
	
}

3tap(){
global
	If winactive("NuGenesis LMS - \\Remote")
		Menu.LMS()
	else if winactive("Edit Formulation - \\Remote")
		send, {tab}%product%{Tab 23}
	else if winactive("Edit Product - \\Remote")
		ProductTab_EditProduct()
	; else if winactive("Register new samples - \\Remote")
		; Autofill()
	else If WinActive("Select tests for request: R")
		WorkTab.SelectTestSample()
	; else If WinActive("Composition - \\Remote")
	; else If WinActive("Results Definition - \\Remote")
	; else If winactive("Select methods tests - \\Remote")
	; else if winactive("PDF Preview - \\Remote")
	; else if winactive("Edit test (Field Configuration:")
	; else If winactive("Result Entry - \\Remote") ;Enter Test Results window
	; else if winactive("Select samples for test:")
	Else
		Autofill()
	return

	
}


OrientBoxes(){
	global
	Ifwinactive, NuGenesis LMS - \\Remote
	if errorlevel
		return
	CoordMode, mouse, Window
	Tab:=
	Tab1:=
	Tab2:=
	Tab3:=
	Tab4:=
	Tab5:=
	Tab6:=
	WinGetPos,wX,wY,wW,wH, NuGenesis LMS - \\Remote
	xTabSelect:=WW-10
	yTabSelect:=75
	xSamplesTab:=(Ww/2)-80
	xRequestsTab:=(Ww/2)+20
	xDocumentsTab:=(Ww/3)+(Ww/3)-50
	xTestsTab:=(Ww/3)+(Ww/3)-220
	xResultsTab:=(Ww/3)+(Ww/3)-150
	yWorkTabs:=74
	xDivider:=(Ww/5)
	xTab1=150
	xTab2=350
	xtab3=550
	xtab4=750
	xtab5=950
	xtab6=1150
	xtab7=1550
	xtab8=358+1000
	xtab9=358+1200
	xtab10=358+1400
	yTabs:=36
		
	xWorkTab:=334, 47 ;1st
	yWorkTabFilterBar:=82
	yWorkTabSearch:=128
	XCoA:=(Ww-131)
	xClearfilter:=xDivider+16
	yClearfilter:=270
	
	xProductsSearch:=xDivider+180
	xSpecsSearch:=xDivider+183
	yProductsSearch:=93
	ySpecsSearch:=93
	xRequestsSearch:=xDivider+150 ;103
	xRequestSearch_default:=xDivider+151
	xSamplesSearch_default:=xDivider+145
	xResultsSearch_Default:=xDivider+130
	xSamplesSearch:=xDivider+145
	xResultsSearch:=xDivider+105
	xTestsSearch:=xDivider+125
	xDocumentsSearch:=xDivider+25
	
	yProductFilter:=181
	ySpecsFilter:=181
	
	xProductFilter:=xDivider+20
	xBatchFilter:=xDivider+60
	xLotFilter:=xDivider+100
	yMyWorkFilter:=182
	
	xDocumentsFilter:=xDivider+68
	yDocumentsFilter:=300
	xFormulationFilter:=xDivider+75
	xBatchFilter:=xDivider+168
	xLotFilter:=xDivider+229
	; xProductSearch:=xDivider+35
	
	xEdit_Composition:=76
	yEdit_Composition:=443 
	xAdd_methods:=74
	yAdd_methods:=565
	xEnter_Results:=57
	yEnter_Results:=630
	MouseMove, %xResultsTab%, %yWorktabs% 
	}

ClearFilter(){
	Global
	LMS.Filterstatus()
	Clk(xClearFilter,yClearFilter,"Right")
	sleep 200
	send, {shiftDown}{Tab 2}{shiftup}{enter}
}


SearchBar(Code:="",PostCmd:=""){
		Global
		WinActivate, ahk_exe WFICA32.EXE
		ControlGetText, Batch, Edit2, VarBar
		ControlGetText, Lot, Edit3, VarBar
		ControlGetText, Product, Edit1, VarBar
		; LMS.OrientBoxes()
		blockinput on
		if winactive("Select methods tests - \\Remote")
			clk(246,77, 2)
		else If winactive("Register new samples - \\Remote") {
			Clk(180, 103, 2)
			send, %Product%
		}
		else if winactive("NuGenesis LMS - \\Remote") {
			LMS.DetectTab()
			if (Tab="Products")
				clk(xProductsSearch,yProductsSearch)
			if (Tab="Specs")
				clk(xSpecSearch,yProductsSearch)
			if (Tab="Requests")
				clk(xRequestsSearch,yWorkTabSearch)
			if (Tab="Documents")
				clk(xDocumentsSearch,yWorkTabSearch)
			if (Tab="Samples")
				clk(xSamplesSearch,yWorkTabSearch)
			if (Tab="Results")
				clk(xResultsSearch,yWorkTabSearch)
			if (Tab="Tests")
				clk(xTestsSearch,yWorkTabSearch)
			; else
				; msgbox, no dice
			send, ^{a}%Code%^{a}
			if PostCmd!=""
				send % PostCmd
		sleep 300
		blockinput off
		}
	;   tooltip(Tab,,10,10,2)
		; sleep 300
		return
}

FilterBar(){
	global
	WinActivate, ahk_exe WFICA32.EXE
	ControlGetText, Batch, Edit2, VarBar
	ControlGetText, Lot, Edit3, VarBar
	ControlGetText, Product, Edit1, VarBar
	blockinput on
	lms.FilterStatus()
    LMS.DetectTab()
	Tooltip(Code " " Product "`n" Tab)
		if (Tab="Products")
			clk(xProductsFilter,yMyWorkFilter)
		else if (Tab="Specs")
      clk(xSpecsFilter,yMyWorkFilter)
		else if (Tab="Requests")
      clk(xRequestsFilter,yMyWorkFilter)
		else if (Tab="Documents")
      clk(xDocumentsFilter,yWoryMyWorkFilterkTabFilter)
		else if (Tab="Samples" AND Code==Product)
            clk(xFormulationFilter,yMyWorkFilter)
		else if (Tab="Samples" AND Code==Batch)
            clk(xBatchFilter,yMyWorkFilter)
		else if (Tab="Samples" AND Code==lot)
            clk(xLotFilter,yMyWorkFilter)
		else if (Tab="Results")
      clk(xResultsFilter,yMyWorkFilter)
		else if (Tab="Tests")
      clk(xTestsFilter,yMyWorkFilter)
    else
		send, ^{a}%Code%^{a}
		sleep 200
		send, %PostCMD%
	sleep 300
	blockinput off
	return
}

DetectTab(){
	global
tab:=
FoundSamples:=
FoundRequests:=
FoundDocuments:=
FoundResults:=
FoundTests:=
FoundSpecs:=
Tab1:=
TAB2:=
TAB3:=
TAB4:=
TAB5:=
TAB6:=
TAB7:=
	LMS.OrientBoxes()
	winactivate, ahk_exe WFICA32.EXE
	if WinActive("NuGenesis LMS - \\Remote")
	PixelSearch, Tab1, FoundY, xTab1, yTabs, XTab1+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			if Tab1 {
				Tab=Welcome
				return
				}
			PIXELSEARCH, Tab2, FoundY, XTAB2, YTabS, XTAB2+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
				if Tab2 {
					PixelSearch, FoundSamples, FoundY, xsamplesTab, yWorkTabs, xsamplesTab+2, yWorkTabs+2, 0xfffd353, 10, Fast RGB
					if FoundSamples {
						Tab=Samples 
						return
					}
					PixelSearch, FoundRequests, FoundY, xRequestsTab, yWorkTabs, xRequestsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
					If FoundRequests {
						Tab=Requests 
						return 
					}
					PixelSearch, FoundDocuments, FoundY, xDocumentsTab, yWorkTabs, xDocumentsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
					If FoundDocuments {
						Tab=Documents 
						return
					}
					PixelSearch, FoundResults, FoundY, xResultsTab, yWorkTabs, xResultsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
					If FoundResults {
						Tab=Results
						return
					}
					PixelSearch, FoundTests, FoundY, xTestsTab, yWorkTabs, xTestsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
					If FoundTests {
						Tab=Tests
						return
					}
					if Errorlevel
						Tab=SomethingElse
				return
				}
				; }
		PIXELSEARCH, Tab3, FoundY, XTAB3, YTabS, XTAB3+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			if Tab3 { 
					PIXELSEARCH, FoundSpecs, FoundY, 13, 355, 15, 358, 0xeaeff3, 10, Fast RGB ;icon on
						If FoundSpecs
							tab=Specs
						else	
							Tab=Products
				return
				}
		PIXELSEARCH, Tab4, FoundY, XTAB4, YTabS, XTAB4+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			if Tab4 {
					PIXELSEARCH, FoundSpecs, FoundY, 13, 355, 15, 358, 0xeaeff3, 10, Fast RGB ;icon on
						If FoundSpecs
							tab=Specs
						else	
							Tab=Products
				return
				}
		PIXELSEARCH, Tab5, FoundY, XTAB5, YTabS, XTAB5+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			if Tab5 {
				Tab=Tab5
				return
				}
		PIXELSEARCH, Tab6, FoundY, XTAB6, YTabS, XTAB6+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			if Tab6 {
				Tab=Tab6
				return
				}
		PIXELSEARCH, Tab7, FoundY, XTAB7, YTabS, XTAB7+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			if Tab7 {
				Tab=Tab7
				return
				}
			else
				Tab=SomethingElse
			; reMyWorkturn
	return
			; else
			; PixelSearch, FoundX, FoundY, xTab1, yTabs, xTab1+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			; if !Errorlevel
; If (Tab:="MyWork")
; 			{ 
; 				; errorlevel:= ; is work Tab?

; 				PixelSearch, SamplesX, FoundY, xsamplesTab, yWorkTabs, xsamplesTab+2, yWorkTabs+2, 0xfff8e3, 10, Fast RGB
; 					if SamplesX {
; 						Tab=Samples 
; 						return
; 					}
; 					PixelSearch, RequestsX, FoundY, xRequestsTab, yWorkTabs, xRequestsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
; 					If Requestsx {
; 						Tab=Requests 
; 						return 
; 					}
; 					PixelSearch, DocumentsX, FoundY, xDocumentsTab, yWorkTabs, xDocumentsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
; 					If DocumentsX {
; 						Tab=Documents 
; 						return
; 					}
; 					; PixelSearch, FoundX, FoundY, xResultsTab, yWorkTabs, xResultsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
; 					; If !ErrorLevel
; 					; 	Tab=Results
; 				; else 
; 				; 	PixelSearch, FoundX, FoundY, xTab, yWorkTabs, xTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
; 				; 	If !ErrorLevel
; 				; 		Tab=
; 					if Errorlevel
; 						Tab=SomethingElse
; 				return
; 			}
			msgbox, %tab%
		return
}

FilterStatus(){
 global
	WinActivate, NuGenesis LMS - \\Remote
   WinGetPos,wX,wY,wW,wH, NuGenesis LMS - \\Remote
   xFilterIcon:=Ww-22
   yFilterIcon:=131
	winactivate, ahk_exe WFICA32.EXE
	if WinActive("NuGenesis LMS - \\Remote")
		PixelSearch, FoundX, FoundY, %xFilterIcon%, %yFilterIcon%, %xFilterIcon%+2, %YFilterIcon%+2, 0xf9e681, 10, Fast RGB
		{
			If ErrorLevel  ;is yellow/on?
				clk(xFilterIcon,yFilterIcon)
			else ;is off/blue
				Return
		}
		return	
	return
}



CoA(){
	global
	Click
	sleep 100
	clk(xCoa, yWorkTabSearch)
	sleep 100
	send, +{Tab}{enter}
}

	ViewCoA(){
	global
	lms.DetectTab()
	if (Tab = "Samples")
		LMS.CoA()
	If (Tab= "Requests")
		clk(xEnter_Resulsts, yEnter_Resulsts)
	If (Tab = "Products")
		clk(xEdit_Composition,yEdit_Composition)
	If (Tab="Specs")
		clk(xAdd_Methods,yAdd_Methods)
	else
		tooltip(Tab)
		return
}

SaveCode(){
		Send, {CtrlDown}{a}{c}{Ctrlup}
		sleep 100
		send, {enter}
		FileAppend, %Clipboard%`n, Codes.txt
		return
}




AddCOASpace(){
	Global
	WinActivate, Composition - \\Remote
	click
	Mouse_Save()
	click 74, 64
	sleep 200
	send, {click 354, 336}{end}{enter}{click 283, 559}
	WinActivate, Composition - \\Remote
	send %mouseReturn%
	MouseMove, 0, 36, 0, r
	sleep 200
	return
}
RemoveCOASpace(){
	Global
	WinActivate, Composition - \\Remote
	click
	Mouse_Save()
	click 74, 64
	sleep 200
	send, {click 354, 336}{F8 2}{backspace}{click 283, 559}
	WinActivate, Composition - \\Remote
	send %mouseReturn%
	MouseMove, 0, 36, 0, r
	sleep 200
	return
}

Methods() {
	global
	; Mouse_Click("searchBar_SelectMethodsTest")
	WinActivate, Select methods tests - \\Remote
	click, 229, 72,2
	send, ^a
	Loop, Read, Methods.ini
	{
	If A_Index = 1
		Continue
	Method := StrSplit(A_LoopReadLine, "=")
	; MethodGroup := StrSplit(A_LoopReadLine, "|")
	Selection:= % Method[1]
	; Group:= % MethodGroup[2]
	Menu, Methodmenu, add, %Selection%, Methods
	}
	Menu, MethodMenu, Show,
	return
}


CheckDepartment(){
	global
	clipboard:=
Send, ^c
; sleep 300
clipwait
if (Regexmatch(Clipboard, "(\bAnalytical \(In Process\)|\bI, Analytical\b|\bIn Process, Analytical\b)", Anal) > 0)
	Department:="Analytical"
else if (Regexmatch(Clipboard, "(\bFinished, \bMicro\b|\bF, Micro\b|\bMicro \(Finished\)|\bMicro Lab\b)",Micr) > 0)
	Department:="Micro"
else if (Regexmatch(Clipboard, "(\bI, Retain\b|\bIn Process, Retain\b)", Retain) > 0)
	Department:="Retain"
else if (Regexmatch(Clipboard, "(\bI, Physical\b|In Process, Physical\b|\bPhysical \(In Process\))", Phys) > 0)
	Department:="Physical"
else if (Regexmatch(Clipboard, "(\bCT, Physical\b|Coated, Physical\b|\bCoated, Physical\b)", CTPhys) > 0)
	Department:="CTPhysical"
else if (Regexmatch(Clipboard, "(\bCT, Retain\|Coated, Retain\b)", CTRetain) > 0)
	Department:="CTRetain"
else {
	Tooltip(nope)

	sleep 300
	exit
}
}

DeleteRetain(){
	gLOBAL
	MouseGetPos, mx, mY
	InputBox, n, number of retains to delte, , , , , mx, my,
	loop %n%
	{
	sleep 100
	send, {click 61, 258}
	winwait, Delete Tests - \\Remote
	sleep 100
	send, {enter}
	sleep 800
	}
	return
}


}







Methods:
	sleep 200
	InputVar:=A_ThisMenuItem
	IniRead,vOutput, Methods.ini, Methods, %InputVar%
	Sendinput, %vOutput%{enter}
	sleep 300
	click 506, 341
	LMS.Methods()
	return


	Scroll_Fix:
	#If mouse_isover("Result Editor - \\Remote") || mouse_isover("Test Definition Editor - \\Remote") || mouse_isover("Edit Formulation - \\Remote") ||
	wheeldown::
	Mouse.Save()
	Wheel_scroll("130")

	wheelup::Wheel_scroll("-130")
	#if