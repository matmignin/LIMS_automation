
 
;KEY_LMS:
return
 #Ifwinactive, NuGenesis LMS - \\Remote
  F20 & Left::WinMove, A, , -283, -1196, 1662, 952
  F6::LMS.SearchBar(Product,"{enter}")
  F7::LMS.SearchBar(Batch,"{enter}")
  F8::LMS.FilterBar(Product)
  F9::LMS.ViewCoa()
  
  rshift & lbutton::sendinput,{shiftDown}{click}{shiftup}
  F20 & space::send, %Batch%{enter}
  ~Lbutton & F19::send,{enter}
  F19 & space::Send, %Product%{enter}
  Mbutton::menu.LMS()
  Enter::LMS.SaveCode()
 #Ifwinactive, Select methods tests - \\Remote
  F7::LMS.Methods()
  F6::esc
  #Ifwinactive, Edit Product - \\Remote
    Mbutton::ProductTab_EditProduct()
#ifwinactive, Edit Formulation - \\Remote
  Mbutton::send, {tab}%product%{Tab 23}
 #IfWinActive, Composition - \\Remote
  F6::esc
  F7::enter
  numpaddiv::Mouse_Closewindow()
  Mbutton::Autofill()
 #IfWinActive, Test Definition Editor - \\Remote
  F6::esc
  F7::click 330, 619 ;click save
 #IfWinActive, Results Definition - \\Remote
  F6::esc
  F7::enter
  wheelup::Mouse_click("Edit")
  WheelDown::
   Click, 1330, 592
   sleep 100
   click, 338, 619
   Return
 #IfWinActive, Edit specification - \\Remote
 #ifwinactive, PDF Preview - \\Remote
  numpaddiv::Mouse_CloseWindow()
 #ifwinactive, Edit test (Field Configuration:
  F9::Autofill()
  F6::esc
 #Ifwinactive, Result Entry - \\Remote ;Enter Test Results window
  Rbutton::WorkTab.ChangeTestResults("toggle")
  F6::WorkTab.ChangeTestResults("toggle")
 #MaxThreadsPerHotkey 2
  F9::WorkTab.ChangeTestResults("loop")
 #MaxThreadsPerHotkey 1
  F7::WorkTab.ChangeTestResults()
  F6::esc
 #ifwinactive, Register new samples - \\Remote
  F20 & wheelup::LMS.SearchBar()
  Mbutton::Autofill()
  F9::LMS.SearchBar(Product,"{enter}")
  F7::send, % Mouse_Save() "{click 502, 354}" Next
    F8::Send,{click 194, 188}^a
  F6::esc
 #IfWinActive, Select tests for request: R
  Mbutton::WorkTab.SelectTestSample()
 #ifwinactive, Select samples for test:
  F7::sendinput % Mouse_Save() "{click 504, 324}" MouseReturn ; add test.
  F6::esc
 #IfWinActive, ahk_exe WFICA32.EXE, ;GENERIC LMS
  F20 & Space::send, %Batch%
  F19 & space::send, %Product%
  F19 & F20::menu.Variables()
  F19 & up::send, %sampleID%
  F19 & left::send, %lot%
  F19 & right::send, %coated%
  F8::send,{enter}
  $Rbutton up::Mouse_RbuttonUP()
  Mbutton::autofill()
  enter::click.okay()
  esc::click.esc()
  left::left
  Down::down
  right::right
  up::up
  <^r::ReloadScript()
  
#IfWinActive,
  ; sendlevel 1
 pause::reload
 ` & esc::Pause





Class LMS {
	
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
	xTabSelect:=WW-5
	yTabSelect:=75
	xSamplesTab:=(Ww/2)-80
	xRequestsTab:=(Ww/2)+20
	xDocumentsTab:=(Ww/3)+(Ww/3)-50
	xResultsTab:=(Ww/3)+(Ww/3)-50
	yWorkTabs:=74
	xDivider:=(Ww/5)
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
			else
				msgbox, no dice
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

	LMS.OrientBoxes()
	winactivate, ahk_exe WFICA32.EXE
	if WinActive("NuGenesis LMS - \\Remote")
	PixelSearch, Tab1, FoundY, xTab2, yTabs, XTab2+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			if Tab1 {
				Tab=MyWork
				return
				}
	PIXELSEARCH, Tab2, FoundY, XTAB3, YTabS, XTAB3+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			if Tab2 {
				Tab=Product
				return
				}
	PIXELSEARCH, Tab3, FoundY, XTAB4, YTabS, XTAB4+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			if Tab3 { 
				Tab=Specs
				return
				}
	PIXELSEARCH, Tab4, FoundY, XTAB5, YTabS, XTAB5+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			if Tab4 {
				Tab=Tab4
				return
				}
	PIXELSEARCH, Tab5, FoundY, XTAB6, YTabS, XTAB6+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			if Tab5 {
				Tab=Tab5
				return
				}
	PIXELSEARCH, Tab6, FoundY, XTAB7, YTabS, XTAB7+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			if Tab6 {
				Tab=Tab6
				return
				}
	PIXELSEARCH, Tab7, FoundY, XTAB8, YTabS, XTAB8+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			if Tab7 {
				Tab=Tab7
				return
				}
			else
				Tab=SomethingElse
			return
	return
			; else
			; PixelSearch, FoundX, FoundY, xTab1, yTabs, xTab1+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
			; if !Errorlevel
If Tab=MyWork
			{ 
				errorlevel:= ; is work Tab?

				PixelSearch, FoundX, FoundY, xsamplesTab, yWorkTabs, xsamplesTab+2, yWorkTabs+2, 0xfff8e3, 10, Fast RGB
				If !ErrorLevel
					Tab=Samples 
					PixelSearch, FoundX, FoundY, xRequestsTab, yWorkTabs, xRequestsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
					If !ErrorLevel
						Tab=Requests 
					PixelSearch, FoundX, FoundY, xDocumentsTab, yWorkTabs, xDocumentsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
					If !ErrorLevel
						Tab=Documents 
					; PixelSearch, FoundX, FoundY, xResultsTab, yWorkTabs, xResultsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
					; If !ErrorLevel
					; 	Tab=Results
				; else 
				; 	PixelSearch, FoundX, FoundY, xTab, yWorkTabs, xTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
				; 	If !ErrorLevel
				; 		Tab=
					if Errorlevel
						Tab=SomethingElse
				return
			}
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