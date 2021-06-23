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
		else If WinActive("Composition - \\Remote")
			ProductTab.AddCOASpace()
		; else If WinActive("Results Definition - \\Remote")
		; else if winactive("PDF Preview - \\Remote")
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
			if (Tab="Products" )
				clk(86, 443) ;edit composition
			else
				Menu.LMS()
		}
		else if winactive("Edit Formulation - \\Remote")
			send, {tab}%product%{Tab 23}
		else if winactive("Edit Product - \\Remote")
			ProductTab.EditProduct()
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


	4tap(){
		global
		If winactive("NuGenesis LMS - \\Remote")
			lms.MoveTab("Home")
		; else if winactive("Edit Formulation - \\Remote")
			; send, {tab}%product%{Tab 23}
		; else if winactive("Edit Product - \\Remote")
			; ProductTab.EditProduct()
		; else if winactive("Register new samples - \\Remote")
			; Autofill()
		; else If WinActive("Select tests for request: R")
			; WorkTab.SelectTestSample()
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


	2right(){
		global
		If winactive("NuGenesis LMS - \\Remote")
			lms.SearchBar(Batch,"{enter}")
		; else if winactive("Edit Formulation - \\Remote")
			; send, {tab}%product%{Tab 23}
		; else if winactive("Edit Product - \\Remote")
			; ProductTab.EditProduct()
		; else if winactive("Register new samples - \\Remote")
			; Autofill()
		; else If WinActive("Select tests for request: R")
			; WorkTab.SelectTestSample()
		; else If WinActive("Composition - \\Remote")
		; else If WinActive("Results Definition - \\Remote")
		; else If winactive("Select methods tests - \\Remote")
		; else if winactive("PDF Preview - \\Remote")
		; else if winactive("Edit test (Field Configuration:")
		; else If winactive("Result Entry - \\Remote") ;Enter Test Results window
		; else if winactive("Select samples for test:")
		Else
			send, %batch%
		return
		}


	2Left(){
		global
		If winactive("NuGenesis LMS - \\Remote")
			lms.SearchBar(Product,"{enter}")
		; else if winactive("Edit Formulation - \\Remote")
			; send, {tab}%product%{Tab 23}
		; else if winactive("Edit Product - \\Remote")
			; ProductTab.EditProduct()
		; else if winactive("Register new samples - \\Remote")
			; Autofill()
		; else If WinActive("Select tests for request: R")
			; WorkTab.SelectTestSample()
		; else If WinActive("Composition - \\Remote")
		; else If WinActive("Results Definition - \\Remote")
		; else If winactive("Select methods tests - \\Remote")
		; else if winactive("PDF Preview - \\Remote")
		; else if winactive("Edit test (Field Configuration:")
		; else If winactive("Result Entry - \\Remote") ;Enter Test Results window
		; else if winactive("Select samples for test:")
		Else
			send, %Product%
		return
		}


}
 
 
 
 
;KEY_LMS:
return
#Ifwinactive, NuGenesis LMS - \\Remote
  F20 & Left::WinMove, A, , -283, -1196, 1662, 952
  ; rshift & lbutton::sendinput,{shiftDown}{click}{shiftup}
  ; F20 & space::send, %Batch%{enter}
  F19 & space::Send, %Product%{enter}
  F20 & space::Send, %Batch%{enter}
  ; F19 & ,::send, %Batch%{enter}
  ~Lbutton & F19::send,{enter}
  Enter::LMS.SaveCode()
	; F19:: ; msgbox % lms.DetectTab() " " tab
	; lms.Filter(Clear)
			; ~wheelright::msgbox, %A_ThisHotkey%
		; ~wheelleft::msgbox, %A_ThisHotkey%
	return
  numpaddiv::CloseWindow()

~Wheelleft::
var++
If var>=39
   {
   click 326, 120
   }
SetTimer, clearVar, -40
return
~wheelright::
var++
If var>=35
   {
   click 21, 115
   }
SetTimer, clearVar, -40
return
 
clearVar:
var:=0
return

#IfWinActive, Results Definition - \\Remote
  wheelup::Mouse_click("Edit")
  WheelDown::
		Click, 1330, 592
		sleep 100
		click, 338, 619
		TT("wheeldown pressed")
		Return
; #IfWinActive, Edit specification - \\Remote
; #ifwinactive, PDF Preview - \\Remote
; #ifwinactive, Register new samples - \\Remote
	; wheelup::LMS.SearchBar()
#Ifwinactive, Result Entry - \\Remote ;Enter Test Results window
	; #MaxThreadsPerHotkey 2
		F9::WorkTab.ChangeTestResults("loop")
	; #MaxThreadsPerHotkey 1 
#IfWinActive, ahk_exe WFICA32.EXE, ;GENERIC LMS
  F19 & F20::menu.Variables()
  F19 & space::send, %Product%
  F19 & ,::send, %Batch%
  F19 & up::send, %sampleID%
  F19 & left::send, %lot%
  F19 & right::send, %coated%
  ; F20 & Space::send, %Batch%
  $Rbutton up::Mouse_RbuttonUP()
  enter::click.okay()
  esc::click.esc()
  left::left
  Down::down
  right::right
  up::up
  <^r::ReloadScript()
  F9::TouchPad.3up()
  F8::TouchPad.3Down()
  F7::TouchPad.3Right()
  F6::TouchPad.3Left()
  ; ~Wheelleft::TouchPad.2left()
  ; ~Wheelright::TouchPad.2right()
  Mbutton::TouchPad.3Tap()
	; numlock::LMS.Movetab("Home")
	numpadMult::LMS.Movetab("Home")
	Numpadadd::lms.MoveTab("Right")
	NumpadSub::lms.MoveTab("Left")
	; Move
	; WinGetPos,wX,wY,wW,wH, NuGenesis LMS - \\Remote
	; xTabSelect:=WW-10
	; lms.DetectTab()
	numlock::return
#IfWinActive,
	pause::reload
	` & esc::Pause





Class LMS {
	


; SearchBar(Code:="",PostCmd:=""){
; 		Global
; 		WinActivate, ahk_exe WFICA32.EXE
; 		ControlGetText, Batch, Edit2, VarBar
; 		ControlGetText, Lot, Edit3, VarBar
; 		ControlGetText, Product, Edit1, VarBar
; 		; LMS.Orient()
; 		If Code:=Product
; 			Filtercode:="Product"
; 		If Code:=Batch
; 			Filtercode:="Batch"
; 		If Code:=Lot
; 			Filtercode:="Lot"
; 		if winactive("Select methods tests - \\Remote")
; 			clk(246,77, 2)
; 		else If winactive("Register new samples - \\Remote") {
; 			Clk(180, 103, 2)
; 			send, %Product%
; 		}
; 		else if winactive("NuGenesis LMS - \\Remote") {
; 			LMS.DetectTab()
; 			if (Tab="Products" || Tab="Specs") {
; 				clk(x%Tab%Search,yProductsSearch)
; 							send, ^{a}%Product%^{a}
; 							if PostCmd!=""
; 								send % PostCmd
; 				exit
; 			}
; 			If (Tab="Requests" || Tab="Tests"|| Tab="Samples" || Tab="Results" || Tab="Documents") {
				
; 				if (Lms.Filter()=Off){
; 					clk(x%Tab%SearchDefault,yWorkTabSearch,,2)
; 					; clk(x%Tab%Search,yWorkTabSearch)
; 				}
; 				if (Lms.Filter()=On) {
; 					clk(x%FilterCode%Filter,yWorkTabFilter)
; 				}
; 				send, ^{a}%Code%^{a}
; 				if PostCmd!=""
; 					send % PostCmd
; 				exit
; 			}
; 		}
; }
SearchBar(Code:="",PostCmd:=""){
		Global
		WinActivate, ahk_exe WFICA32.EXE
		ControlGetText, Batch, Edit2, VarBar
		ControlGetText, Lot, Edit3, VarBar
		ControlGetText, Product, Edit1, VarBar

		; LMS.Orient()
		if (Lms.Filter()=On) {
			Lms.FilterBar(Code,PostCmd)
			exit
		}
		if winactive("Select methods tests - \\Remote")
			clk(246,77, 2)
		else If winactive("Register new samples - \\Remote") {
			Clk(180, 103, 2)
			send, %Product%
		}
		else if winactive("NuGenesis LMS - \\Remote") {
			LMS.DetectTab()
			if (Tab="Products" || Tab="Specs") {
				clk(x%Tab%Search,yProductsSearch)
							send, ^{a}%Product%^{a}
							if PostCmd!=""
								send % PostCmd
				exit
			}
			If (Tab="Requests" || Tab="Tests"|| Tab="Samples" || Tab="Results" || Tab="Documents")
					clk(x%Tab%Search,yWorkTabSearch,,2)
					; clk(x%Tab%Search,yWorkTabSearch)
				send, ^{a}%Code%^{a}
				if PostCmd!=""
					send % PostCmd
				exit
			}
}








	MoveTab(Direction){
		global
	lms.DetectTab()
	If (Direction="Right") {
		If Tab2
			clk(xTab3,47) ;"{down 3}{enter}"
		else If Tab3
			clk(xTab4,47) ;"{down 4}{enter}"
		else if Tab4
			clk(xTab5,47) ;"{down 5}{enter}"
		else if Tab5
			clk(xTab6,47) ;"{down 6}{enter}"
		else if Tab6
			clk(xTab7,47) ;"{down 7}{enter}"
		else if Tab7
			clk(xTab8,47) ;"{down 8}{enter}"
		else if Tab8
			clk(xTab9,47) ;"{down 9}{enter}"
		else if Tab1
			clk(xTab2,47) ;"{down 9}{enter}"
		else 
			sendinput % clk(xTabSelect,47) "{up}{enter}"
		return
		}
	if (Direction="Left") {
		If Tab2
			sendinput % clk(xTabSelect,47) "{Up}{enter}"
		else if Tab3
			clk(xTab2,47) ; "{down 2}{enter}"
		else if Tab4
			clk(xTab3,47) ; "{down 3}{enter}"
		else if Tab5
			clk(xTab4,47) ; "{down 4}{enter}"
		else if Tab6
			clk(xTab2,47) ; "{down 5}{enter}"
		else if Tab7
			clk(xTab2,47) ; "{down 6}{enter}"
		else if Tab8
			clk(xTab2,47) ; "{down 7}{enter}"
		else if Tab9
			clk(xTab2,47) ; "{down 8}{enter}"
		else if Tab1
			clk(xTab4,47) ; "{down 8}{enter}"
		else
			clk(xTabSelect,47) "{up}{enter}"
		return
	}
	if (Direction="Home") {
		if Tab2
		{
			if (Tab="Samples"){
				Mouse_Save()
				send, {click 83, 708}{click, %xRequestsTab%, %yMyWorkTabs%}%MouseReturn%
			return	
			}
			else
				clk(xSamplesTab,yMyWorkTabs)
			Return
		}
		else
			clk(xTab2,47) ;'"{Down 2}{enter}"
		return
	}
	return
	}






FilterBar(Code:="",PostCmd:=""){
	global
	WinActivate, ahk_exe WFICA32.EXE
	ControlGetText, Batch, Edit2, VarBar
	ControlGetText, Lot, Edit3, VarBar
	ControlGetText, Product, Edit1, VarBar
	blockinput on
	; lms.FilterStatus()
    LMS.DetectTab()
	; TT(Code " " Product "`n" Tab)
		if (Tab="Products" || Tab="Specs")
			clk(x%Tab%Filter,y%Tab%Filter)
		else if (Tab="Requests")
      clk(xRequestsFilter,yMyWorkFilter)
		else if (Tab="Documents")
      clk(xDocumentsFilter,yMyWorkFilterkTabFilter)
		else if (Tab="Samples" AND Code==Product)
            clk(xProductFilter,yMyWorkFilter)
		else if (Tab="Samples" AND Code==Batch)
            clk(xBatchFilter,yMyWorkFilter)
		else if (Tab="Samples" AND Code==lot)
            clk(xLotFilter,yMyWorkFilter)
		else if (Tab="Results")
      clk(xResultsFilter,yMyWorkFilter)
		else if (Tab="Tests")
      clk(xTestsFilter,yMyWorkFilter)
    else
			return
			
		send, ^{a}%Code%^{a}
		sleep 200
		if PostCmd!=""
					send % PostCmd
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
	; LMS.Orient()
	winactivate, ahk_exe WFICA32.EXE
	if WinActive("NuGenesis LMS - \\Remote")
			PIXELSEARCH, Tab2, FoundY, XTAB2, YTabS, XTAB2+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
				if Tab2 {
					PixelSearch, FoundSamples, FoundY, xsamplesTab, yWorkTabs, xsamplesTab+2, yWorkTabs+2, 0xfffd353, 10, Fast RGB
					if FoundSamples {
						Tab=Samples 
						return Tab
					}
					else {
					PixelSearch, FoundRequests, FoundY, xRequestsTab, yWorkTabs, xRequestsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
					If FoundRequests {
						Tab=Requests 
						return tab
					}
					PixelSearch, FoundDocuments, FoundY, xDocumentsTab, yWorkTabs, xDocumentsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
					If FoundDocuments {
						Tab=Documents 
						return tab
					}
					PixelSearch, FoundResults, FoundY, xResultsTab, yWorkTabs, xResultsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
					If FoundResults {
						Tab=Results
						return tab
					}
					PixelSearch, FoundTests, FoundY, xTestsTab, yWorkTabs, xTestsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
					If FoundTests {
						Tab=Tests
						return tab
					}
					else if Errorlevel
						Tab=SomethingElse
					else
						return	
				exit
				}
				}
				; }
		PIXELSEARCH, Tab3, FoundY, XTAB3, YTabS, XTAB3+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			if Tab3 { 
					PIXELSEARCH, FoundSpecs, FoundY, 13, 355, 15, 358, 0xeaeff3, 10, Fast RGB ;icon on
						If FoundSpecs
							tab=Specs
						else	
							Tab=Products
				return Tab
				}
		PIXELSEARCH, Tab4, FoundY, XTAB4, YTabS, XTAB4+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			if Tab4 {
					PIXELSEARCH, FoundSpecs, FoundY, 13, 355, 15, 358, 0xeaeff3, 10, Fast RGB ;icon on
						If FoundSpecs
							tab=Specs
						else	
							Tab=Products
				return %Tab%
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
	PixelSearch, Tab1, FoundY, xTab1, yTabs, XTab1+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			if Tab1 {
				Tab=Welcome
				return tab
				}
			else
				Tab=SomethingElse
			; reMyWorkturn
	return
			; msgbox, %tab%
		return Tab
}

FilterStatus(){
 global
	FilterOn:=
	Filter:=
	winactivate, ahk_exe WFICA32.EXE
	if WinActive("NuGenesis LMS - \\Remote")
		PixelSearch, FilterOn, FoundY, %xFilterIcon%, %yFilterIcon%, %xFilterIcon%+2, %YFilterIcon%+2, 0xf9e681, 10, Fast RGB
			if FilterOn
				Return "On"
			else 
				Return "Off" 
				; clk(xFilterIcon,yFilterIcon)
				; Return FilterOff
				
			; If ErrorLevel  ;is yellow/on?
			; {
				; FilterOn="on"
			; }
			; else ;is off/blue
	; return
}
Filter(x:="Status"){
 global
	FilterOn:=
	FilterOff:=
	if !WinActive("NuGenesis LMS - \\Remote")
		return
	If (x="On") {
			PixelSearch, FilterOn, FoundY, %xFilterIcon%, %yFilterIcon%, %xFilterIcon%+2, %YFilterIcon%+2, 0xf9e681, 10, Fast RGB
				if !FilterOn
					clk(xFilterIcon,yFilterIcon)
		return
	}
	if (x="Clear"){	
		; if (LMS.Filter()=Off)
			; LMS.Filter(On)
		If WinActive("Select samples for request")
			Clk(35, 275,"Right")
		if winactive("NuGenesis LMS - \\Remote")	
			Clk(xClearFilter,yClearFilter,"Right")
		sleep 100
		send, {shiftDown}{Tab 2}{shiftup}{enter}
		sleep 400
		; if (LMS.Filter()=Off)
			; LMS.Filter(On)
		exit
	}
	if (x="Off"){	
			PixelSearch, FilterOn, FoundY, %xFilterIcon%, %yFilterIcon%, %xFilterIcon%+2, %YFilterIcon%+2, 0xf9e681, 10, Fast RGB
				if FilterOn
					clk(xFilterIcon,yFilterIcon)				
		return
	}
	if (x="Status"){	
		PixelSearch, FilterOn, FoundY, %xFilterIcon%, %yFilterIcon%, %xFilterIcon%+2, %YFilterIcon%+2, 0xf9e681, 10, Fast RGB
			if FilterOn
				Return "On"
			else 
				Return "Off" 
	}
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
		TT(Tab)
		return
}

SaveCode(){
	global
	Batches:=[]
		Send, {CtrlDown}{a}{Ctrlup}
		clip(1)
		sleep 200
		send, {enter}
		FileAppend, %Batch% `n, Batch.txt
		FileAppend, %product% `n, Product.txt
		iniwrite, %Batch%, Codes.ini, Batch,
		iniwrite, %Product%, Codes.ini, Product, 
		return
		                    ;  creating an array and resorting without duplicates
;  oArray := ["a","B","c","A","B","C",1,1.0,"1","1.0"]

		; Batches:= StrSplit(A_LoopReadLine, "`n") 


; oArray2 := [], oTemp := {}
; for vKey, vValue in oArray
; {
; 	if (ObjGetCapacity([vValue], 1) = "") ;is numeric
; 	{
; 		if !ObjHasKey(oTemp, vValue+0)
; 			oArray2.Push(vValue+0), oTemp[vValue+0] := ""
; 	}
; 	else
; 	{
; 		if !ObjHasKey(oTemp, "" vValue)
; 			oArray2.Push("" vValue), oTemp["" vValue] := ""
; 	}
; }
; vOutput := ""
; for vKey, vValue in oArray2
; 	vOutput .= vKey " " vValue "`r`n"
; MsgBox, % vOutput
; return

		
		
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
	TT(nope)

	sleep 300
	exit
}
}




Orient(){
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
	yMyWorkTabs:=74
	xDivider:=(Ww/5)
	xTab1=150
	xTab2=350
	xTab3=550
	xTab4=750
	xTab5=950
	xTab6=1150
	xTab7=1550
	xTab8=358+1000
	xTab9=358+1200
	xTab10=358+1400
	yTabs:=36
		
	xWorkTab:=334, 47 ;1st
	yWorkTabSearch:=128
	XCoA:=(Ww-131)
	xClearfilter:=xDivider+16
	yClearfilter:=270
	xFilterIcon:=Ww-22
  yFilterIcon:=131
	
	xProductsSearch:=xDivider+180
	xSpecsSearch:=xDivider+183
	yProductsSearch:=93
	ySpecsSearch:=93
	xRequestsSearch:=xDivider+175 ;103
	xRequestsSearchDefault:=xDivider+155 ;103
	xSamplesSearch:=xDivider+145
	xResultsSearch:=xDivider+185
	xResultsSearch:=xDivider+185
	xTestsSearch:=xDivider+125
	xDocumentsSearch:=xDivider+25
	
	yProductsFilter:=181
	ySpecsFilter:=181
	
	xFormulationFilter:=xDivider+75
	xProductFilter:=xDivider+75
	xBatchFilter:=xDivider+168
	xLotFilter:=xDivider+229
	; xBatchFilter:=xDivider+60
	; xLotFilter:=xDivider+100
	yMyWorkTabFilter:=182
	yMyWorkFilter:=182
	; yWorkTabFilter:=82
	yWorkTabFilter:=182
	
	xDocumentsFilter:=xDivider+68
	; yDocumentsFilter:=300
	; xProductSearch:=xDivider+35
	
	xEdit_Composition:=76
	yEdit_Composition:=443 
	xAdd_methods:=74
	yAdd_methods:=565
	xEnter_Results:=57
	yEnter_Results:=630
}


}










	Scroll_Fix:
	#If mouse_isover("Result Editor - \\Remote") || mouse_isover("Test Definition Editor - \\Remote") || mouse_isover("Edit Formulation - \\Remote") ||
	wheeldown::
	Mouse.Save()
	Wheel_scroll("130")

	wheelup::Wheel_scroll("-130")
	#if