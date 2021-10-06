



Class LMS {

SearchBar(Code:="",PostCmd:=""){
		Global
		if !winactive("ahk_exe WFICA32.EXE")
			winactivate, ahk_exe WFICA32.EXE
		ControlGetText, Product, Edit1, VarBar
		ControlGetText, Batch, Edit2, VarBar
		ControlGetText, Lot, Edit3, VarBar
		ControlGetText, Coated, Edit4, VarBar
		if Showsampleid=1
			ControlGetText, SampleId, Edit5, VarBar
		if (Lms.Filter()=On) {
			Lms.FilterBar(Code,PostCmd)
					Send, {ctrlup}
			exit
		}
		if winactive("Select methods tests - \\Remote")
			clk(246,77, 2)
		else If winactive("Register new samples - \\Remote") {
			; Clk(180, 103, 2)
			Send, {click 180, 103,2}%Product%{enter}
		}
		else if winactive("NuGenesis LMS - \\Remote") {
			; LMS.Orient()
			LMS.DetectTab()
			if (Tab="Products") {
				If (Code=Product){
					clk(x%Tab%Search,yProductsSearch)
					Send, {ctrldown}{a}{ctrlup}%Product%{ctrldown}{a}{ctrlup}
					if PostCmd!=""
						send % PostCmd
					Send, {ctrlup}	
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
				; If (Code=Product) {
				clk(x%Tab%Search,yProductsSearch)
					Send, {ctrldown}{a}{ctrlup}%Product%{ctrldown}{a}{ctrlup}
					if PostCmd!=""
						send % PostCmd
					Send, {ctrlup}	
				exit
				; }
				; If (Code=Batch) {
				; 	clk(53, 756)
				; 	exit
				; }
			}
			If (Tab="Tests"|| Tab="Samples" || Tab="Results" || Tab="Documents") {
					clk(x%Tab%Search,yWorkTabSearch,,2)
					; clk(x%Tab%Search,yWorkTabSearch)
				Send,{ctrldown}{a}{ctrlup}%code%
				if PostCmd!=""
					send % PostCmd
							Send, {ctrlup}
				exit
			}
			If (Tab="Requests") {
					clk(x%Tab%Search-40,yWorkTabSearch,,2)
					sleep 20
					clk(x%Tab%Search,yWorkTabSearch)
				Send,{ctrldown}{a}{ctrlup}%Code%
				if PostCmd!=""
					send % PostCmd
					Send, {ctrlup}
				exit
			}
		}
		
	}

	SearchbarPaste(){
		Clipboard := StrReplace(Clipboard, "`r`n", A_Space)
		Clipboard := StrReplace(Clipboard, "`n", A_Space)
		Clipboard := StrReplace(Clipboard, ", ", A_Space)
		Clipboard := StrReplace(Clipboard, ",", A_Space)
		Clipboard := StrReplace(Clipboard, "|", "")
		Clipboard := StrReplace(Clipboard, "/", "")
		Clipboard := StrReplace(Clipboard, A_tab, A_Space)
		Clipboard := StrReplace(Clipboard, A_space A_space, A_Space)
		sleep 200
		send, ^v
		sleep 100
		;send, {enter}
		return clipboard
	}
SearchRequest(Code){    
		Global            
		winactivate, NuGenesis LMS - \\Remote
		this.detectTab()
		sleep 200
		clk(xtab2,ytabs)
		if (tab!="Request")
			clk(RequestsTab, yMyWorkTabs)
		else
		sleep 500
		THIS.searchbar(code)
		Send, {ctrlup}{enter}
		return
	}

ProductSpecToggle(){
	global
	WinActivate, NuGenesis LMS - \\Remote
	; this.detectTab()
		; if Tab2 
	; {
		; this.SelectTab(3)
		; sleep 100
	; }
	if (tabToggle == 0)
	{
		this.SelectTab(4)
		tabtoggle:=1
	} 
	else 
	{
		this.SelectTab(3)
		tabtoggle:=0
	}
	return
	; If lms.DetectTab() = "Product"
	; else
	}
	
SampleRequestToggle(){
	global
	WinActivate, NuGenesis LMS - \\Remote
	this.detectTab()
		if !Tab2 
	{
		this.SelectTab(2)
		; clk(xtab2,ytabselect)
		sleep 80
	}
	If lms.DetectTab() = "Samples"
		clk(RequestsTab,yWorkTabs)
	else
		clk(SamplesTab,yWorkTabs)
	}
	
SelectTab(Direction){
	global TabSelect, yTabSelect
	winactivate, NuGenesis LMS - \\Remote
	send % clk(TabSelect,45)
	Send, {down %direction%}
	sleep 60
	Send, {ctrldown}{enter}{ctrlup}
}
SelectWorkTab(TabSelect){
	global
	; TabSelect:=SamplesTab
	winactivate, NuGenesis LMS - \\Remote
	lms.detecttab()
	if !Tab2 
	{
		this.SelectTab(2)
		; clk(xtab2,ytabselect)
		sleep 100
	}
	clk(TabSelect,yWorkTabs)
	sleep 400

}



MoveTab2(Direction){
			global
			WinActivate, ahk_exe WFICA32.EXE
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
				SendInput % clk(TabSelect,47) "{up}{enter}"
			return
			}
		if (Direction="Left") {
			If Tab2
				SendInput % clk(TabSelect,47) "{Up}{enter}"
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
				clk(TabSelect,47) "{up}{enter}"
			return
		}
		if (Direction="Home") {
			if Tab2
			{
				if (Tab="Samples"){
					Mouse_Save()
					Send, {click 83, 708}{click, %RequestsTab%, %yMyWorkTabs%}%MouseReturn%
				return	
				}
				else
					clk(SamplesTab,yMyWorkTabs)
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
	if !winactive("ahk_exe WFICA32.EXE")
		winactivate, ahk_exe WFICA32.EXE
	ControlGetText, Batch, Edit2, VarBar
	ControlGetText, Lot, Edit3, VarBar
	ControlGetText, Product, Edit1, VarBar
	ControlGetText, Coated, Edit4, VarBar
	ControlGetText, SampleId, Edit5, VarBar
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
			
		Send, ^{a}%Code%^{a}
		sleep 200
		if PostCmd!=""
					send % PostCmd
	sleep 300
	; blockinput off
	return
	}

DetectTab(){
	global  
	WinSet, Transparent, Off, ahk_exe WFICA32.EXE
	tab:=
	FoundSamples:=
	FoundRequests:=
	FoundDocuments:=
	FoundResults:=
	FoundTests:=
	FoundSpecs:=
	FoundReagents:=
	Tab1:=
	TAB2:=
	TAB3:=
	TAB4:=
	TAB5:=
	TAB6:=
	TAB7:=
	ifwinnotactive, ahk_exe WFICA32.EXE
		winactivate, ahk_exe WFICA32.EXE
	LMS.Orient()
	; CoordMode, pixel, Window
	if WinActive("NuGenesis LMS - \\Remote") {
			PIXELSEARCH, Tab2, FoundY, XTAB2, YTabS, XTAB2+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
				if !Tab1 {
					PixelSearch, FoundSamples, FoundY, SamplesTab, yWorkTabs, SamplesTab+2, yWorkTabs+2, 0xfffd353, 10, Fast RGB
					if FoundSamples {
						Tab=Samples 
						return Tab
					}					
					else 
					{
					PixelSearch, FoundRequests, FoundY, RequestsTab, yWorkTabs, RequestsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
					If FoundRequests {
						Tab=Requests 
						return tab
					}
					PixelSearch, FoundDocuments, FoundY, DocumentsTab, yWorkTabs, DocumentsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
					If FoundDocuments {
						Tab=Documents 
						return tab
					}
					PixelSearch, FoundResults, FoundY, ResultsTab, yWorkTabs, ResultsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
					If FoundResults {
						Tab=Results
						return tab
					}
					PixelSearch, FoundTests, FoundY, TestsTab, yWorkTabs, TestsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
					If FoundTests {
						Tab=Tests
						return tab
					}
					else if Errorlevel
					{
					PIXELSEARCH, FoundReagents, FoundY, 600, 75, 610, 79, 0xF0F0F0, 10, Fast RGB ;icon on
						if FoundReagents {
							tab=Reagents
							; msgbox, %tab% "reagent check"
							return tab
						}
						else {
					PIXELSEARCH, FoundSpecs, FoundY, 13, 355, 15, 358, 0xeaeff3, 10, Fast RGB ;icon on
						If FoundSpecs
							tab=Specs
						else
							Tab=Products
						return Tab	
						}
					}
					else 
				return
				exit
				}
				}
				}
		return Tab
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
		If WinActive("Select samples for request")
			Clk(35, 275,"Right")
		if winactive("NuGenesis LMS - \\Remote")	
			Clk(xClearFilter,yClearFilter,"Right")
		sleep 100
		Send, {shiftDown}{Tab 2}{shiftup}{enter}
		sleep 400
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
	; Click
	; sleep 100
	clk(xCoa, yWorkTabSearch)
	sleep 100
	Send, +{Tab}{enter}
	}

	ViewCoA(){
	global
	lms.DetectTab()
	if (Tab = "Samples")
		This.CoA()
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
	RegBatches:=[]
	RegProducts:=[]
		Send, {CtrlDown}{a}{Ctrlup}
		clip(1)
		sleep 200
		Send, {enter}
		FileAppend, %RegBatch% `n, Batch.txt
		FileAppend, %Regproduct% `n, Products.txt
		iniwrite, %RegBatch%, Codes.ini, %Batch%,
		iniwrite, %RegProduct%, Codes.ini, %Product%, 
		return

	}












Orient(){
	global
	; ifwinnotactive, NuGenesis LMS - \\Remote
		; Switch:=1
	; IfWinExist, NuGenesis LMS - \\Remote
		; winactivate
	; if errorlevel
		; return
	CoordMode, mouse, Window
	Tab:=
	Tab1:=
	Tab2:=
	Tab3:=
	Tab4:=
	Tab5:=
	Tab6:=
	WinGetPos,wx,wY,wW,wH, NuGenesis LMS - \\Remote
	WinGetPos,Nux,NuY,NuW,NuH, NuGenesis LMS - \\Remote
	WinGetPos,WbX,WbY,WbW,WbH, LMS Workbook.xlsb - Excel
	; WinGetPos, VarBar_X, VarBar_Y,Varbar_W,Varbar_H, NuGenesis LMS - \\Remote,
	WbX:=WbX+400
	Flovar_x:= wX +900
	Flovar_y:= wH + wY -28
	varBar_nuX:=wX+450
	varBar_nuY:=wY
	TabSelect:=WW-10
	yTabSelect:=45
	yTabDropDown:=45
	SamplesTab:=(Ww/2)-80
	RequestsTab:=(Ww/2)+20
	DocumentsTab:=(Ww/3)+(Ww/3)-50
	TestsTab:=(Ww/3)+(Ww/3)-220
	ResultsTab:=(Ww/3)+(Ww/3)-150
	HScrollBarRightX:=Ww-40
	HScrollBarLeftX:=(Ww/5)+35
	HScrollBarRightY:=HScrollBarLeftY:=(Wh/2)+38
	yWorkTabs:=74
	yMyWorkTabs:=74
	xDivider:=(Ww/5)
	xTab1=150
	xTab2=350
	MyWorkTab=350
	xTab3=550
	ProductsTab=550
	xTab4=750
	SpecsTab=750
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
	xRequestsSearch:=xDivider+190 ;175 ;103
	xRequestsSearchDefault:=xDivider+170 ;155 ;103
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


