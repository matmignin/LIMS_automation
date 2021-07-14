Class LMS {

SearchBar(Code:="",PostCmd:=""){
		Global
		ifwinnotactive, ahk_exe WFICA32.EXE 
			WinActivate, ahk_exe WFICA32.EXE
		ControlGetText, Batch, Edit2, VarBar
		ControlGetText, Lot, Edit3, VarBar
		ControlGetText, Product, Edit1, VarBar
		ControlGetText, Coated, Edit4, VarBar
		ControlGetText, SampleId, Edit5, VarBar
		if !winactive("ahk_exe WFICA32.EXE")
			winactivate, ahk_exe WFICA32.EXE
		if (Lms.Filter()=On) {
			Lms.FilterBar(Code,PostCmd)
					send, {ctrlup}
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
			if (Tab="Products") {
				If (Code=Product){
				clk(x%Tab%Search,yProductsSearch)
							send, ^{a}%Product%^{a}
							if PostCmd!=""
								send % PostCmd
									send, {ctrlup}	
				exit
				}
					If (Code=Batch) {
					clk(40, 384)
					sleep 200
					clk(455, 472,,2)
					exit
				}
			}
			if (Tab="Specs") {
				If (Code=Product) {
				clk(x%Tab%Search,yProductsSearch)
							send, ^{a}%Product%^{a}
							if PostCmd!=""
								send % PostCmd
									send, {ctrlup}	
				exit
				}
				If (Code=Batch) {
					clk(53, 756)
					exit
				}
			}
			If (Tab="Tests"|| Tab="Samples" || Tab="Results" || Tab="Documents") {
					clk(x%Tab%Search,yWorkTabSearch,,2)
					; clk(x%Tab%Search,yWorkTabSearch)
				send, ^{a}%Code%
				if PostCmd!=""
					send % PostCmd
							send, {ctrlup}
				exit
			}
			If (Tab="Requests") {
					clk(x%Tab%Search-40,yWorkTabSearch,,2)
					sleep 20
					clk(x%Tab%Search,yWorkTabSearch)
				send, ^{a}%Code%
				if PostCmd!=""
					send % PostCmd
							send, {ctrlup}
				exit
			}
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
	ifwinnotactive, ahk_exe WFICA32.EXE 
		WinActivate, ahk_exe WFICA32.EXE
	ControlGetText, Batch, Edit2, VarBar
	ControlGetText, Lot, Edit3, VarBar
	ControlGetText, Product, Edit1, VarBar
	ControlGetText, Coated, Edit4, VarBar
	ControlGetText, SampleId, Edit5, VarBar
	ControlGetText, Note1, Edit6, VarBar
	ControlGetText, Note2, Edit7, VarBar
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
	ifwinnotactive, ahk_exe WFICA32.EXE
		winactivate, ahk_exe WFICA32.EXE
	if WinActive("NuGenesis LMS - \\Remote") {
			PIXELSEARCH, Tab2, FoundY, XTAB2, YTabS, XTAB2+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
				if !Tab1 {
	
					
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
					{
					PIXELSEARCH, FoundSpecs, FoundY, 13, 355, 15, 358, 0xeaeff3, 10, Fast RGB ;icon on
						If FoundSpecs
							tab=Specs
						else	
							Tab=Products
						return Tab	
						}
					else 
				return
				exit
				}
				}
				}
		return Tab
}

FilterStatus(){
 global
	FilterOn:=
	Filter:=
	ifwinnotactive, ahk_exe WFICA32.EXE 
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
	global Department
	clipboard:=
	Send, ^c
	sleep 200
	clipwait, 3
	Regexmatch(Clipboard, "(\bAnalytical \(In Process\)|\bI, Analytical\b|\bIn Process, Analytical\b)", cAnalytical)
	Regexmatch(Clipboard, "((?!\bFinished, )Micro\b|(?!\bF, )Micro\b|\bMicro(?= \(Finished\))|\bMicro(?= Lab\b))",cMicro)
	Regexmatch(Clipboard, "(\bI, Retain\b|\bIn Process, Retain\b|\bRetain \(In)", cRetain)
	Regexmatch(Clipboard, "(\bI, Physical\b|In Process, Physical\b|\bPhysical \(In Process\))", cPhysical)
	Regexmatch(Clipboard, "(\bCT, Physical\b|Coated, Physical\b|\bCoated, Physical\b)", cCTPhysical)
	Regexmatch(Clipboard, "(\bCT, Retain\|Coated, Retain\b)", cCTRetain)
  If cAnalytical
    Department=Analytical
  If cMicro
    Department=Micro
  If cRetain
    Department=Retain
  If cCTRetain
    Department:="Retain (Coated)"
  If cPhysical
    Department=Physical
  If cCTPhysical
    Department:="Physical (Coated)"
  If cCTRetain
    Department=CTRetain
	return Department
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

	yMyWorkTabFilter:=182
	yMyWorkFilter:=182
	yWorkTabFilter:=182
	
	xDocumentsFilter:=xDivider+68

	xEdit_Composition:=76
	yEdit_Composition:=443 
	xAdd_methods:=74
	yAdd_methods:=565
	xEnter_Results:=57
	yEnter_Results:=630
}


ScrollDown(){
	Global
if winactive("Result Editor - \\Remote") {
	clk(503, 574,1)
	Sleep 800
	return
	}
if winactive("Test Definition Editor - \\Remote") {
	clk(464, 532,,2)
	Sleep 800
	return
}
if winactive("Edit Formulation - \\Remote") {
	clk(452, 473,,2)
		Sleep 800
	return
}
else
	return
}



}










