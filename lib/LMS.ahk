  GetSampleInfo(){
    global Customer, Name, ShipToIndex
    ParsedSample:=[]
    ; clipboard:=
    ; send, ^c 
    ; clipwait, 2
      ; if errorlevel
        ; sleep 400
    Loop, parse, Clipboard, `t
    ParsedSample.insert(A_LoopField)
    TotalColumns:=Parsedsample.maxindex()//2
    
    Customer:=ParsedSample[HasValue(ParsedSample, "Ship To") + TotalColumns]
    Name:=ParsedSample[HasValue(ParsedSample, "Product Trade Name") + TotalColumns]
    IniRead,ShipToIndex, lib\data\customers.ini, Customers, %Customer%
    ; if !ShipTo
      ; ShipTo:=ShipToIndex
    return ShiptoIndex
  }

;; _____________________________LMS KEYBINDINGS____________________________
	#Ifwinactive, NuGenesis LMS - \\Remote ;; ___Nugenesis
		Numlock::4tap() ;LMS.COA()
		mbutton::3tap()
			F7::		  3Right()
		F6::			  3Left()	
		+F19::lms.searchBar("")
		F19 & Space::lms.searchBar("")
		F20 & Space::Varbar.Focus(Product)
		F20 & left::Send, %Product%
		F20 & down::Send, %Batch%
		F20 & right::Send, %lot%
		Enter::LMS.SaveCode()
		>+F20::LMS.SearchbarPaste()
		+^v::LMS.SearchbarPaste()
		<^v::      	       	lms.searchbarPaste()
		wheelright::clk(HScrollBarRightX, HScrollBarRightY,,1)     ;2right()
		wheelleft::clk(HScrollBarLeftX, HScrollBarLeftY,,1) ;2left()


	#Ifwinactive, Result Entry - \\Remote ;;___Result_Entry 
			#MaxThreadsPerHotkey 2
				Numlock::WorkTab.ChangeTestResults("loop")
			#MaxThreadsPerHotkey 1 
		wheelup::				send % Blockrepeat(500) Varbar.AddIteration() 
		wheeldown::   			send % Blockrepeat(500) Varbar.SubIteration()




	#IfWinActive, Results Definition - \\Remote ;;__Results_Definition:
	; wheelup::Mouse_click("Edit")
		numlock::Send, % clk(712, 663) "{esc}"
		space::sendinput,{ctrldown}{click}{ctrlup}
		mbutton::Spectab.Table()



	#ifwinactive, Register new samples - \\Remote ;;__Register_new_samples:
		F7:: 
			clk(181, 104,2,2) 
			sleep 300
			Send, %Product%{enter}
			return



	#ifwinactive, Reason for Change - \\Remote
		F13 & v::
						send % "Verification" 
						sleep 200
						Click.Okay()
						return
	#ifwinactive, Select tests for request: 
		space::send, ^{click}
		rbutton::send, ^{click}
		Numpaddot::send, {click 837, 656}{
		; wheelright::3right()
		; wheelleft::WorkTab.SelectTestSample()
	#ifwinactive, Select samples for test:
		; wheelright::3right()
		; wheelleft::WorkTab.SelectTestSample()

	#IfWinActive, ahk_exe WFICA32.EXE, ;;___LMS app

			; F19 & left::			excel.Nextsheet()
			; F19 & right::			excel.Prevsheet()
			; F19 & down::			Varbar.SubIteration(0)
			; F19 & up::	 			Varbar.AddIteration(0)
			Rbutton up::		Mouse_RbuttonUP()
			F14::
			^`::						Varbar.reset()
			enter::					click.okay()
			esc::						click.esc()
			numpaddot::				closeWindow()
			<^r::						ReloadScript()
			numpadMult::			4up()
			F9::						Excel.Connect(1) ;3up()
			F8::						3Down()
			F7::						3Right()
			F6::						3Left()	
		^Wheeldown::			Blockrepeat(900) clip(0,2) GetSampleInfo() POP(Product,Batch " " Lot  " " Coated,3000) tt(Name " - " Customer ": " ShipToIndex,9000,1,1,3,200,"S") ;	Pinch
			^wheelup::				LMS.SearchbarPaste() ;; Spread
			Rbutton & F19::       	send % WindowInfo() 
			Rbutton & F6::        	Send, {Backspace}


		#IfWinActive, Barcode Scanner - \\Remote
			enter::enter
			; F20::LMS.SearchbarPaste()
			^v::LMS.SearchbarPaste()
	#IfWinActive,


Class LMS {    			;;_____________________Generl LMS_________________________

	SearchBar(Code:="",PostCmd:="",Overwrite:="Overwrite"){
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
						Send, {ctrldown}{a}{ctrlup}
						If Overwrite=Add
							Send, ^{x}	
						Send, %Product%{ctrldown}{a}{ctrlup}
						If Overwrite=Add
							send, {right}{space}^{v}^{a}^{c}
						if PostCmd!=""
							send % PostCmd
						ControlsetText, Edit8,%Clipboard%,VarBar	
						Send, {ctrlup}	
					exit
					}
						If (Code=Batch) { ;click something edit comp
						clk(40, 384)
						sleep 200
						clk(455, 472,,2)
						exit
					}
				}
				if (Tab="Specs") {
					; If (Code=Product) {
					clk(x%Tab%Search,yProductsSearch)
						Send, {ctrldown}{a}{ctrlup}
						If Overwrite=Add
							Send, ^{x}	
						Send, %Product%{ctrldown}{a}{ctrlup}
						If Overwrite=Add
							send, {right}{space}^{v}^{a}^{c}
						if PostCmd!=""
							send % PostCmd
						ControlsetText, Edit8,%Clipboard%,VarBar	
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
						Send, {ctrldown}{a}{ctrlup}
						If Overwrite=Add
							Send, ^{x}	
						Send, %Code%{ctrldown}{a}{ctrlup}
						If Overwrite=Add
							send, {right}{space}^{v}^{a}^{c}
						if PostCmd!=""
							send % PostCmd
						ControlsetText, Edit8,%Clipboard%,VarBar	
						Send, {ctrlup}	
					; 	; clk(x%Tab%Search,yWorkTabSearch)
					; Send,{ctrldown}{a}{ctrlup}%code%
					; if PostCmd!=""
					; 	send % PostCmd
					; 			Send, {ctrlup}
					exit
				}
				If (Tab="Requests") {
						clk(x%Tab%Search-40,yWorkTabSearch,,2)
						sleep 20
						Send, {ctrldown}{a}{ctrlup}
						If Overwrite=Add
							Send, ^{x}	
						Send, %Code%{ctrldown}{a}{ctrlup}
						If Overwrite=Add
							send, {right}{space}^{v}^{a}^{c}
						if PostCmd!=""
							send % PostCmd
						ControlsetText, Edit8,%Clipboard%,VarBar	
						Send, {ctrlup}	
					; 	clk(x%Tab%Search,yWorkTabSearch)
					; Send,{ctrldown}{a}{ctrlup}%Code%
					; if PostCmd!=""
					; 	send % PostCmd
					; 	Send, {ctrlup}
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
		if Tab=Samples
			This.CoA()
		else If Tab=Requests
			; clk(xEnter_Resulsts, yEnter_Resulsts)
			This.CoA()
		else If Tab=Products
			clk(xEdit_Composition,yEdit_Composition)
		else If Tab=Specs
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
			Send, {enter}
			; FileAppend, %Batch% `n, Batch.txt
			; FileAppend, %product% `n, lib\data\Products.txt
			; iniwrite, %Batch%, lib\codes.ini, %Batch%,
			; iniwrite, %Product%, lib\codes.ini, %Product%, 
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
		WinGetPos,WbX,WbY,WbW,WbH, Mats LMS Workbook.xlsb - Excel
		; WinGetPos, VarBar_X, VarBar_Y,Varbar_W,Varbar_H, VarBar ahk_exe AutoHotkey.exe
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







Class ProductTab {  ;;__________________ProductTab Class_____________________

  Table(){
    Global
    ShiftTable_X:=-250
    ShiftTable_Y:=200
    try GUI, Ingredient_table:destroy
    CoordMode, mouse, Window
    ; CoordMode, , Screen
    ifwinnotactive, ahk_exe WFICA32.EXE 
      WinActivate, ahk_exe WFICA32.EXE
    WinGetPos, LMS_X, LMS_Y, LMS_w, LMS_h, A
    Table_height=10
    ProductTable_X:= LMS_w+LMS_X+ShiftTable_X
    ProductTable_Y:= LMS_Y+ShiftTable_Y
    Excel.Connect()
    Name:=		 	    []
    LabelClaim:=  	[]
    Position:=		  []
    LabelName:=		  []
    DropDownCount:= []
    Sub_Table_height:=0
      while (Xl.Range("AK" . A_Index+7).Value != "") {
        Position[A_index]     :=  Xl.Range("AD" . A_Index+7).Text
        Name[A_index]         :=  Xl.Range("AI" . A_Index+7).text
        LabelClaim[A_index]   :=	Xl.Range("AJ" . A_Index+7).Text
        LabelName[A_index]    :=	Xl.Range("AK" . A_Index+7).Text
        DropDownCount[A_index]:=	Xl.Range("AM" . A_Index+7).Text
        Total_rows            :=	A_index +1
        Table_Height          :=	A_index
        if (Xl.Range("AD" . A_Index+7).text = "")
          Sub_Table_Height:=Sub_Table_Height+1
      }
    Table_Height:=Table_height-Sub_table_Height
    Gui,Ingredient_Table:Default
    Gui,Ingredient_Table:+LastFound +ToolWindow +Owner +AlwaysOnTop ;-SysMenu
    GUI,Ingredient_Table:Font,s10 cBlack arial ;Consolas
    Gui,Ingredient_Table:Add,ListView,x0 y0 r%Table_height% W400 Grid NoSortHdr -hdr checked gIngredient_Table, Position|Name|LabelClaim|LabelName|DropdownCount
    loop,%Total_Rows% {
      if Position[A_index] =""
      {
        Total_rows:=total_rows - 1
        continue
      }
      else
        LV_Insert(A_index,"",Position[A_index],Name[A_index],LabelClaim[A_index],LabelName[A_index],DropDownCount[A_index])
    }
    Gui,Ingredient_Table:Add,Checkbox,vAutoEnter x20 checked,Auto-Enter Results?
    LV_ModifyCol(1,50)
    LV_ModifyCol(2,180)
    LV_ModifyCol(3,100)
    LV_ModifyCol(4,2)
    LV_ModifyCol(5,2)
    sleep 100
    CoordMode,mouse,screen
    ScreenEdge_X:=A_ScreenWidth-550
    ScreenEdge_Y:=A_Screenheight-450
    try Gui,Ingredient_Table:Show,x%ProductTable_X% y%ProductTable_Y% w320,%Product% Ingredient Table
    catch Gui,Ingredient_Table:Show,x%ScreenEdge_X% y%ScreenEdge_Y% w380, %Product% Ingredient Table
    CoordMode,mouse,window
    return
  }





    EditIngredient(Ingredient_Name,Ingredient_Claim,Ingredient_Position,Dropdown_count){  
  ;; the final input window for adding ingredients
      Global
      Ingredient_Name:=Trim(Ingredient_Name,"`r`n")
      Ingredient_Claim:=Trim(Ingredient_Claim,"`r`n")
      Ingredient_position:=Trim(Ingredient_Position,"`r`n")
      ifWinnotexist, Edit Ingredient - \\Remote
      {
      WinActivate, Composition - \\Remote
      Breaking.Point()
      sleep 200
      click 57, 65 
      sleep 150
      Breaking.Point()
      this.DropdownSelect(Dropdown_count)
      ; sleep 200
      }
        Winactivate, Edit Ingredient - \\Remote
      Excel.Get_Current_row()
      sleep 150
      if winactive("Composition - \\Remote")
        return
      Send,{tab 6}^a%Ingredient_position%{tab}^a
      SendInput,%Ingredient_Name%
      sleep 100
      If Ingredient_Claim contains Heavy Metal,Allergens
      Send,{tab}
      Send,{tab 2}^a
      Send,%Ingredient_Claim%
      Sleep 200
      Current_Row:= Current_Row+1
      Breaking.Point()
      Send,{enter}
      Tooltip,
      return
      }

    DropdownSelect(A_DropdownCount){
      global
      click, 150, 73 ;click dropdown box
      sleep 100
      Breaking.Point()

      AbsSelection:=Abs(A_DropdownCount)
      if (A_DropdownCount > 0)
      SendInput, {tab}{home}{right %A_DropdownCount%}
      if (A_DropdownCount < 0)
      SendInput, {tab}{end}{left %AbsSelection%}
      if (A_DropdownCount = "-0")
      SendInput, {tab}{end}
      if (a_DropdownCount = "")
      this.DropDown_Ingredient()
      Breaking.Point()
      return
      }


    AddCOASpace(){
      Global
      SetWinDelay, 450
      ControlGetText, Iteration, Static1, VarBar
      ; WinActivate, Composition - \\Remote
      click
      Mouse_Save()
      click 74, 64
      sleep 200
      ifwinnotactive, Edit Ingredient - \\Remote
      WinActivate, Edit Ingredient - \\Remote
      if (Iteration > 0)
        SendInput, {Tab 7}{pgdn 2}{end}{enter}{click 283, 559}
      if (Iteration < 0)
        SendInput, {tab 7}{pgdn 2}{end}{backspace}{click 283, 559}
        sleep 200
      ifwinnotactive, Composition - \\Remote
      WinActivate, Composition - \\Remote
      send %mouseReturn%
      MouseMove, 0, 36, 0, r
      sleep 200
      return
    }


  Blends(n,Measurment){
    global ServingSize, Color, ShapeAndSize
    SetWinDelay, 450
    winactivate, Edit Formulation - \\Remote
    click 450, 462, 3
    Send, {click 385, 347}
    if (N!=1)
      Plural:="s"
    if (n=1)
      TextNumber:="{backspace}"
    if (n=2)
      TextNumber:="two"
    if (n=3)
      TextNumber:="three"
    if (n=4)
      TextNumber:="four"
    if (n=5)
      TextNumber:="five"
    if (n=6)
      TextNumber:="six"
    if (n=7)
      TextNumber:="seven"
    if !color
      Color:="PENDING"
    If !ServingSize
      ServingSize:= " g"
    Send, Each %textNumber% (%n%){space}%measurment%%plural% (%ServingSize%) contains{left 12}{tab 2}^{a}%color%+{tab}^{a}Blend+{tab}
    setwindelay, 250
    exit
  }




    EditProduct(){ ;for naming Product code and customer, 
      global Product, Name, Customer, ShapeAndSize, color
      SetWinDelay, 450
      ; Excel.Connect(1)
      click 120,80 ;click product box
      SendInput,%Product%`,{space}%Name%{tab 2}%Customer%{tab 2}{right 2}{tab}{right 3}{tab}%Product%{tab 2}
      sleep 200
      SendInput,%Name%{tab 8}
      sleep 400
      winwaitactive,NuGenesis LMS - \\Remote,,16
      WinActivate, NuGenesis LMS - \\Remote
      click, 67, 283
      sleep 200
      Breaking.Point()
      This.EditFormulation()
      ; clk(287, 578) ;click save
      return
      ;setwindelay, 200
    } 

    EditFormulation(){ ;then click on Edit Formulation, puts in code, then tabs to serving size
      global Product, ShapeAndSize, color, ServingSize
      if !winactive("Edit Formulation - \\Remote") && winexist("Edit Formulation - \\Remote")
        winactivate, Edit Formulation - \\Remote,
      Send, {tab}%product%
        Send, {Tab 23} ;{click 268, 578}
        sleep 200
      Breaking.Point()
      ; if (ServingSize=1 ? "(" ServingSize ")" : "Two (" ServingSize ")" ) ;|| ServingSize=2 || ServingSize=3 || ServingSize=4)
        ; send, Each %ServingSize% {space} contains {ctrl down}{left}{ctrl up}{left}
      send, {tab}^a%ShapeAndSize%{shiftdown}{tab}{shiftup}
      ; ShapeAndsize:=  
      sleep 200
      If !Color
        color:="Pending"
      else
        send, {tab 2}^a%Color%{shiftdown}{tab 2}{shiftup}
      sleep 200
      ; clk(287, 578) ;click save
      return
      ;setwindelay, 200
    } 

    HM_ReportOnly(){ 
    SetWinDelay, 450 ;testing out
    click 125,120 ;click 1st row
    
    clk(45, 65)
    winwaitactive, Edit Ingredient - \\Remote,,4
    SendInput,{click 150,73}{tab}{right 11} ;arsenic
    Breaking.Point()
    WinWaitClose, Edit Ingredient - \\Remote,,4
    click 125,140 ;click 2nd row
    clk(45, 65)
    winwaitactive, Edit Ingredient - \\Remote,,4
    SendInput,{click 150,73}{tab}{right 167} ;lead
    Breaking.Point()
    click 390, 659	;click okay
    WinWaitClose, Edit Ingredient - \\Remote,,4
    click 125,180 ;click 3rd row
    clk(45, 65)
    winwaitactive, Edit Ingredient - \\Remote,,4
    SendInput,{click 150,73}{tab}{right 23} ;cadmium
    Breaking.Point()
    click 390, 659	;click okay
    WinWaitClose, Edit Ingredient - \\Remote,,4
    click 125,200 ;click 4th row
    clk(45, 65)
    winwaitactive, Edit Ingredient - \\Remote,,4
    SendInput,{click 150,73}{tab}{right 189} ;mercury
    Breaking.Point()

    click 390, 659	;click okay
    return
    }

    DropDown_Ingredient(){
    global
      SetWinDelay, 450
    ; if (GeneralCount=2){
      ; SendInput,{tab}{Home}{right 2}{right 62}
      ; return
    ; }
    ;Menu,IngredientMenu,Add,Creatine, IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &A,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &B,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &C,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &D,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &E,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &F,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &G,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &H,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &I,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &J,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &K,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &L,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &M,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &N,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &O,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &P,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &Q,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &R,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &S,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &T,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &U,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &V,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &W,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &X,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &Y,IngredientMenuHandler
    Menu,IngredientMenu,Add,Generic Ingredient &Z,IngredientMenuHandler
    ; Menu,IngredientMenu,Add,Glucosamine,IngredientMenuHandler
    Menu,IngredientMenu,Add,Ingredient Note 1,IngredientMenuHandler
    Menu,IngredientMenu,Add,Ingredient Note 2,IngredientMenuHandler
    Menu,IngredientMenu,Add,Ingredient Note 3,IngredientMenuHandler
    Menu,IngredientMenu,Add,Methylsulfonylmethane (MSM),IngredientMenuHandler
    ; Menu,IngredientMenu,Add,Molybdenum,IngredientMenuHandler
    ;Menu,IngredientMenu,Add,PABA,IngredientMenuHandler
    Menu,IngredientMenu,Add,Protein,IngredientMenuHandler
    ; Menu,IngredientMenu,Add,Quercetin Dihydrate,IngredientMenuHandler
    ; Menu,IngredientMenu,Add,Taurine,IngredientMenuHandler
    Menu,IngredientMenu,Add,Total Probiotic,IngredientMenuHandler
      Menu,IngredientMenu,Add,STOP,IngredientMenuHandler
    Menu,IngredientMenu,Show,
    return
    }


  }






  IngredientMenuHandler:
  ; tt(GeneralCount)
  Click 150, 73
  ; if !GeneralCount
  ; clk(150, 73)
    ; GeneralCount=1
  ; tt(GeneralCount)
  if (A_ThisMenuItem ="Generic Ingredient &A")
    SendInput,{tab}{Home}{right 6}{right 56}
  else if (A_ThisMenuItem ="Generic Ingredient &B") || (GeneralCount=2)
    SendInput,{tab}{Home}{right 6}{right 62}
  else if (A_ThisMenuItem ="Generic Ingredient &C") || (GeneralCount=3)
    SendInput,{tab}{Home}{right 6}{right 68}
  else if (A_ThisMenuItem ="Generic Ingredient &D") || (GeneralCount=4)
    SendInput,{tab}{home}{right 6}{right 74}
  else if (A_ThisMenuItem ="Generic Ingredient &E" || GeneralCount==5)
    SendInput,{tab}{Home}{right 6}{right 80}
  else if (A_ThisMenuItem ="Generic Ingredient &F" || GeneralCount==6)
    SendInput,{tab}{Home}{right 6}{right 86}
  else if (A_ThisMenuItem ="Generic Ingredient &G" || GeneralCount==7)
    SendInput,{tab}{Home}{right 6}{right 92}
  else if (A_ThisMenuItem ="Generic Ingredient &H" || GeneralCount==8)
    SendInput,{tab}{Home}{right 6}{right 93}
  else if (A_ThisMenuItem ="Generic Ingredient &I" || GeneralCount==9)
    SendInput,{tab}{Home}{right 6}{right 95}
  else if (A_ThisMenuItem ="Generic Ingredient &J" || GeneralCount==10)
    SendInput,{tab}{Home}{right 6}{right 97}
  else if (A_ThisMenuItem ="Generic Ingredient &K" || GeneralCount==11)
    SendInput,{tab}{Home}{right 6}{right 99}
  else if (A_ThisMenuItem ="Generic Ingredient &L" || GeneralCount==12)
    SendInput,{tab}{Home}{right 6}{right 100}
  else if (A_ThisMenuItem ="Generic Ingredient &M" || GeneralCount==13)
    SendInput,{tab}{Home}{right 6}{right 101}
  else if (A_ThisMenuItem ="Generic Ingredient &N" || GeneralCount==14)
    SendInput,{tab}{Home}{right 6}{right 102}
  else if (A_ThisMenuItem ="Generic Ingredient &O" || GeneralCount==15)
    SendInput,{tab}{Home}{right 6}{right 103}
  else if (A_ThisMenuItem ="Generic Ingredient &P" || GeneralCount==16)
    SendInput,{tab}{Home}{right 6}{right 104}
  else if (A_ThisMenuItem ="Generic Ingredient &Q" || GeneralCount==17)
    SendInput,{tab}{Home}{right 6}{right 105}
  else if (A_ThisMenuItem ="Generic Ingredient &R" || GeneralCount==18)
    SendInput,{tab}{Home}{right 6}{right 106}
  else if (A_ThisMenuItem ="Generic Ingredient &S" || GeneralCount==19)
    SendInput,{tab}{Home}{right 6}{right 107}
  else if (A_ThisMenuItem ="Generic Ingredient &T" || GeneralCount==20)
    SendInput,{tab}{Home}{right 6}{right 108}
  else if (A_ThisMenuItem ="Generic Ingredient &U" || GeneralCount==21)
    SendInput,{tab}{Home}{right 6}{right 109}
  else if (A_ThisMenuItem ="Generic Ingredient &V" || GeneralCount==22)
    SendInput,{tab}{Home}{right 6}{right 110}
  else if (A_ThisMenuItem ="Generic Ingredient &W" || GeneralCount==23)
    SendInput,{tab}{Home}{right 6}{right 111}
  else if (A_ThisMenuItem ="Generic Ingredient &X" || GeneralCount==24)
    SendInput,{tab}{Home}{right 6}{right 112}
  else if (A_ThisMenuItem ="Generic Ingredient &Y" || GeneralCount==25)
    SendInput,{tab}{Home}{right 6}{right 113}
  else if (A_ThisMenuItem ="Generic Ingredient &Z" || GeneralCount==26)
    SendInput,{tab}{Home}{right 6}{right 114}
  else if (A_ThisMenuItem ="Ingredient Note 1")
    SendInput,{tab}{Home}{right 6}{right 139}
  else if (A_ThisMenuItem ="Ingredient Note 2")
    SendInput,{tab}{Home}{right 6}{right 141}
  else if (A_ThisMenuItem ="Ingredient Note 3")
    SendInput,{tab}{Home}{right 6}{right 142}
  else if (A_ThisMenuItem ="Total Probiotic")
    SendInput,{tab}{Home}{right 258}
  else if (A_ThisMenuItem ="STOP")
    Reload
  else
    return
  ; tt(GeneralCount,,0,0,2)
  ; GeneralCount++  
  ; tt(GeneralCount)
  return


  Ingredient_table:
    if (A_GuiEvent="DoubleClick"){
    Gui,Ingredient_Table:submit,NoHide
    Send, {space}
    Rows_left:=((LV_GetCount()-A_EventInfo)*Autoenter)+1
    Current_Row:=A_EventInfo
    Loop % Rows_left {
      Excel.Get_Current_row()
      ProductTab.EditIngredient(LabelName,LabelClaim,Position,DropdownCount)
      if Winactive("Duplicate ingredient ID - \\Remote") || Winactive("NuGenesis LMS - \\Remote") || WinActive("Edit Formulation - \\Remote") || winactive("Warning - \\Remote")
      break
      sleep 300
    }
  } 
  return

  Ingredient_TableGuiClose:
  sleep 100
  GUI,Ingredient_Table:destroy
    ;setwindelay, 200
  return





















	return
class SpecTab {   	;;  	 ________________SpecTab class__________________
	
	Table(){
		Global
		ShiftTable_X:=-350
		ShiftTable_Y:=50
		Try GUI, Spec_Table:destroy
		CoordMode, mouse, Window
	;  CoordMode, , Screen
	ifwinnotactive, ahk_exe WFICA32.EXE 
		WinActivate, ahk_exe WFICA32.EXE
	WinGetPos, LMS_X, LMS_Y, LMS_w, LMS_h, A
	
		; Iniread, SpecTable_X, data.ini, Locations, SpecTable_X
		; Iniread, SpecTable_Y, data.ini, Locations, SpecTable_Y
			CoordMode, mouse, window
		SpecTable_X:=LMS_w+LMS_X+ShiftTable_X
		SpecTable_Y:=LMS_Y+ShiftTable_Y
		Table_height=10
			CoordMode, mouse, screen
		Excel.Connect()
		SpecTab.GetExcelData()
			SpecTab.CreateGUI()
			SpecTab.ModifyColumns()
			SpecTab.ShowGUI()
			sleep 100
		return
	}


		ShowGUI(){
			global
			CoordMode, mouse, screen
			ScreenEdge_X:=A_ScreenWidth-350
			ScreenEdge_Y:=A_Screenheight-150
			try Gui, Spec_Table:Show, x%SpecTable_X% y%SpecTable_Y% w350, %Product% Spec Table
			catch Gui, Spec_Table:Show, x%ScreenEdge_X% y%ScreenEdge_Y% w350, %Product% Spec Table
			CoordMode, mouse, window
			OnMessage(0x0201, "WM_Lbuttondown")
			return
			}
			
	CreateGUI(){
		global
		Gui, Spec_Table:Default
		Gui Spec_Table:+LastFound +ToolWindow +Owner +AlwaysOnTop -SysMenu +MinimizeBox
		Gui, Spec_Table:Add, ListView, x0 y0 r%Table_height% w380 checked Grid AltSubmit gSpec_Table, `t%Product%|`t%Name%|MinLimit|MaxLimit|Units|Percision|Description|Method
		GUI, Spec_Table:Font, s14 cBlack Bold, Consolas
		loop, %Total_Rows%{
			if Position[A_index] =""
			{
				Table_height:=table_height+1
				Total_rows:=total_rows-1
				continue
			}
		if Method[A_index] =""
		{
		Total_rows:=total_rows - 1
		continue
		}
			else
			{
				LV_add(,""Name[A_index],LabelClaim[A_index], MinLimit[A_index],MaxLimit[A_index],Units[A_index],Percision[A_index],Description[A_index],Method[A_index])
				temp:=LabelClaim[A_index] "|" MinLimit[A_index]"|" MaxLimit[A_index]"|" Units[A_index]"|" Percision[A_index] "|" Description[A_index] "|" Method[A_index]
				Test:= Name[A_index]
				; Iniwrite, %Temp%, data.ini, %Product%, %Test%
			}
		}
	}




	Methods() {
		global
		WinActivate, Select methods tests - \\Remote
		click, 229, 72,2
		Send, ^a
		Loop, Read, lib\data\Methods.ini
		{
		If A_Index = 1
			Continue
		Method := StrSplit(A_LoopReadLine, "=")
		; MethodGroup := StrSplit(A_LoopReadLine, "|") ;for a 2nd split
		Selection:= % Method[1]
		; Group:= % MethodGroup[2] ;for a second split
		Menu, Methodmenu, add, %Selection%, Methods
		}
		Menu, MethodMenu, Show,
		return

		Methods:
			sleep 200
			InputVar:=A_ThisMenuItem
			IniRead,vOutput, lib\data\Methods.ini, Methods, %InputVar%
			SendInput, %vOutput%{enter}
			sleep 300
			click 506, 341
			SpecTab.Methods()
			return
	}



	CopySpecTemplate(){
		global 
		Critical
		sleep 100
		if WinActive("NuGenesis LMS - \\Remote"){
			; click
			; Send, ^c
			; clipwait,1.5 ; Tooltip, %Clipboard%
			clip("Department")
			sleep 200
			TT(department)
			Breaking.Point()
		}
		If !errorlevel
			click 102, 289
		sleep 400
		Breaking.Point()
		sleep 200
		If (Department = "Analytical")
			SpecTab.Edit_Analytical()
		else If (Department = "Physical (Coated)")
			SpecTab.Edit_CoatedPhysical()
		else If (Department = "Physical")
			SpecTab.Edit_Physical()
		else If (Department = "CTPhysical")
			SpecTab.Edit_CoatedPhysical()
		else if (Department = "Micro")
			SpecTab.Edit_Micro()
		else If (Department = "Retain (Coated)")
			SpecTab.Edit_CoatedRetain()
		else If (Department = "Retain")
			SpecTab.Edit_Retain()
		else If (Department = "CTRetain")
			SpecTab.Edit_CoatedRetain()
		else If Department Contains Analytical
			SpecTab.Edit_Analytical()
		else If Department contains Physical (Coated)
			SpecTab.Edit_CoatedPhysical()
		else If Department contains Physical
			SpecTab.Edit_Physical()
		else If Department contains CTPhysical
			SpecTab.Edit_CoatedPhysical()
		else if Department contains Micro
			SpecTab.Edit_Micro()
		else If Department Contains Retain (Coated)
			SpecTab.Edit_CoatedRetain()
		else If Department Contains Retain
			SpecTab.Edit_Retain()
		else If Department Contains CTRetain
			SpecTab.Edit_CoatedRetain()
		sleep 500
		;excel.NextSheet()
		
		;TT(Product)
		return
	}
	
	

	CopySpecs(){
		global
		WinActivate, NuGenesis LMS - \\Remote
		; BlockInput, on
		clipboard:=
		click 57, 715 ; edit Test
		; click 57, 750 ; edit results
		winwaitactive, Test Definition Editor - \\Remote,,0.25
		if errorlevel
			WinActivate, Test Definition Editor - \\Remote
		; sleep 400
		click 418, 202
		Send, ^a^c
		Clipwait,1
		Description:=Clipboard
		sleep 200
		StrReplace(Description, "eurofins",Note1) 
		; StrReplace(Description, "(Send out)","") 
		MouseClick, left, 464, 532,2,0
		sleep 150
		click.TestDefinitionEditor_Results()
		WinActivate, Results Definition - \\Remote
		WinWaitActive, Results Definition,,0.25
		if errorlevel
			WinActivate, Results Definition
		WinActivate, Results Definition - \\Remote
		click 282, 141 ; click row
		sleep 80
		clipboard:=
		sleep 20
		Send, ^c
		clipwait, 1
		if ErrorLevel
			msgbox, yo
		; sendlevel,0
		sleep 200
		Send,{esc}
		ParsedSpecs:=[]
		Loop, parse, Clipboard, `t
			ParsedSpecs.insert(A_LoopField)
		MinLimit:=Parsedspecs[17]
		MaxLimit:=Parsedspecs[18]
		Percision:=Parsedspecs[19]
		FullRequirements:=Parsedspecs[20]
		Units:=Parsedspecs[21]
		sleep 200
		; blockinput off
		Send, {esc}
		copypastetoggle=1
		exit
		Return
	}

		PasteSpecs(){
		Global
		WinActivate, NuGenesis LMS - \\Remote
		click 57, 715 ; edit Test
		winwaitactive, Test Definition Editor - \\Remote,,0.25
			if errorlevel
				WinActivate, Test Definition Editor - \\Remote
		sleep 400
		click 418, 202
		SpecTab.TestDefinitionEditor(Description) ; the pre window
		sleep 200
		MouseClick, left, 464, 532,2,0
		sleep 200
		click 232, 244 ;click resulst
		sleep 200
		WinActivate, Results Definition - \\Remote
		WinWaitActive, Results Definition,,0.25
			if errorlevel
				WinActivate, Results Definition
		click 84, 65
		winwaitactive, Result Editor - \\Remote,,0.25
			if errorlevel
				WinActivate, Result Editor - \\Remote
		sleep 400
		Breaking.Point()
		SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,1,FullRequirements)
		CopyPasteToggle=0
		exit
		return
	}

		AddMethod(MethodID){
		WinActivate, NuGenesis LMS - \\Remote
		click 67, 562 ; Add Methods
		winwaitactive, Select methods tests - \\Remote,,0.25
		click 227, 69. 2 ; method search bar
		SendInput, %MethodID%{enter}^{a}{click 506, 337}{click 851, 656} ; add test and hit okay
		sleep 200
		WinActivate, NuGenesis LMS - \\Remote
		click 397, 591 ; click attrobutes
		return
	}

	;; Run through all the menues to add 
	AutoFill(){  
		global
		WinActivate, ahk_exe WFICA32.EXE
			sleep 200
			;blockinput, on
		If Winactive("NuGenesis LMS - \\Remote")
			{
				;SendInput,{click, 565, 692}^a%Name%{enter}{click r, 270, 809}+{tab 2}{enter}
				sleep 200
				Breaking.Point()
				click, 57, 719 ;click Edit Test
				Sleep 200
				Breaking.Point()
				WinActivate, Test Definition Editor - \\Remote
				sleep 200
			}
		If Winactive("Test Definition Editor - \\Remote")
		{
			sleep 200
			Breaking.Point()
			SpecTab.TestDefinitionEditor(Description) ; the pre window
			sleep 200
			MouseClick, left, 464, 532,2,0
				; click 236, 246
				Breaking.Point()
				click.TestDefinitionEditor_Results()
				sleep 200
				WinActivate, Results Definition - \\Remote

		}
		if winactive("Results Definition - \\Remote") ;Selection window
		{

				WinActivate, Results Definition - \\Remote
				If Method contains ICP-MS 231
					Send,{click 217, 141}
				Send,{click 80, 66} ;click edit
				sleep 200
				Breaking.Point()
				winwaitactive, Result Editor - \\Remote,,0.5
					if !errorlevel
				SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,1,1)
				; blockinput, off
				Breaking.Point()
				sleep 400
		}
		If Winactive("Result Editor - \\Remote") ;the editing window
			{
			winactivate, Result Editor - \\Remote
			Breaking.Point()
				SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,,1)
				; blockinput, off
				Breaking.Point()
				return
		}
		else
		; Blockinput,off
			return
	}



	ModifyColumns(){
		Global
		LV_ModifyCol(1,130)
		LV_ModifyCol(2,0)
		LV_ModifyCol(6,0)
		LV_ModifyCol(7,0)
		LV_ModifyCol(8,80)
		LV_ModifyCol(9,0)
		LV_Delete(Table_Height)
	}

	GetRowText(){
		global
		LV_GetText(Name, 				A_EventInfo,1)
		LV_GetText(LabelClaim, 		A_EventInfo,2)
		LV_GetText(MinLimit, 		A_EventInfo,3)
		LV_GetText(MaxLimit, 		A_EventInfo,4)
		LV_GetText(Units, 			A_EventInfo,5)
		LV_GetText(Percision, 		A_EventInfo,6)
		LV_GetText(Description, 	A_EventInfo,7)
		LV_GetText(Method, 			A_EventInfo,8)
		Gui, Spec_Table:submit,NoHide
	}
	GetExcelData(){
		Global
		Name:=			[]
		Position:=		[]
		LabelClaim:=	[]
		MinLimit:=		[]
		MaxLimit:=		[]
		Units:=			[]
		Percision:=		[]
		LabelName:=		[]
		Description:=	[]
		Requirement:=	[]
		method:= 		[]
			while (Xl.Range("AK" . A_Index+6).Value != ""){
				Position[A_index]:=				Xl.Range("AD" . A_Index+7).Text
				Name[A_index]:=					Xl.Range("AI" . A_Index+7).text
				LabelClaim[A_index]:=			Xl.Range("AJ" . A_Index+7).Text
				MinLimit[A_index]:=				Xl.Range("AE" . A_Index+7).Text
				MaxLimit[A_index]:=				Xl.Range("AF" . A_Index+7).Text
				Units[A_index]:=					Xl.Range("AG" . A_Index+7).Text
				Percision[A_index]:=				Xl.Range("AH" . A_Index+7).Text
				Description[A_index]:=			Xl.Range("AL" . A_Index+7).Text
				Method[A_index]:=					Xl.Range("AB" . A_Index+7).Text
				Total_rows:=A_index
				Table_Height:=A_index
				if (Table_Height > 20)
					Table_Height = 20
			}
		; }
		
		}









	EditSampleTemplate_A(){
		global
		winactivate, Edit sample template - \\Remote
		Breaking.Point()
		SendInput,{click 377, 82}{home}%Product%`,{space}{Shift down}I{Shift up}n{space}{Shift down}P{Shift up}rocess`,{space}{Shift down}A{Shift up}nalytical{tab 2}{Right 6}{tab}{right 6}{tab}{right}{enter}
		WinWaitActive, NuGenesis LMS - \\Remote,,8
		Breaking.Point()
		if !errorlevel
			click, 73, 562
		return
	}

	EditSpecification_Analytical(){
		global
		winactivate, Edit specification - \\Remote
		SendInput,{click 376, 87}{home}
		SendInput, %Product%`,{space}{Shift down}I{Shift up}n{space}{Shift down}P{Shift up}rocess`,{space}{Shift down}A{Shift up}nalytical{tab 4}^a%Product%{tab}{enter}{tab}{space}{enter 2}{Tab}{right}{tab}{right 4}{tab}
		Breaking.Point()
		Send,{right 6}{Tab 2}{Space}{tab 2}{right}{tab}{right}
		Breaking.Point()
		click, 340, 622 ;click okay
		Breaking.Point()
		winwaitactive, NuGenesis LMS - \\Remote, ,8
		if !ErrorLevel
			click, 88, 327 ; click add sample template
		Breaking.Point()
		winwaitactive, Edit sample template - \\Remote,, 8
		if !errorlevel
			SpecTab.EditSampleTemplate_A()
		return
	}

	;; ___Fill In Test Specs
	ResultEditor(Min_Limit,Max_Limit,The_Units,The_Percision,UseLimitsBox:=0,CreateRequirements:=1){ ; 3rd window
		Global
		; TT(CreateRequirements)
			; normal
		sleep 200
		click, 250, 140 ; click id box to orient
		sleep 200
		if (Uselimitsbox := 0)
			Send,{tab 2}%The_units%{tab}^{a}%The_Percision%{tab 7}^{a}%Min_Limit%{tab}^a%Max_Limit%{tab 5}^a ;normal
										Send,{tab 2}%The_units%{tab}^{a}%The_Percision%{tab 5}
		sleep 200
		If (UseLimitsBox:=1)
			Send,{space}
		sleep 200
			Send,{tab 2}^a%Min_Limit%{tab}^a%Max_Limit%{tab 5}^a ;normal
		if (Max_limit = ""){
			SendInput, NLT %Min_Limit% %The_Units%
			exit
			}
		else if (Min_limit = "<"){
			SendInput, %min_limit%%Max_Limit% %The_Units%
			exit
			}
		else if (Min_limit = ""){
			SendInput, NMT %Max_Limit% %The_Units%
			Exit
			}
		Else
			{
				If CreateRequirements=1
					SendInput, %Min_Limit% - %Max_Limit% %The_Units%
				else if CreateRequirements!=1)
					SendInput, %CreateRequirements%
			; SendInput, %Requirement%
			}
		sleep 100
		Breaking.Point()
		click 350, 660 ; click okay
		; WinWaitClose, Results Definition,, 6
			; if errorlevel
				return
	}

	TestDefinitionEditor(The_Description){ ; 2nd window
		Global
		if The_description is space
			{
			MouseClick, left, 464, 532,2,0
			Breaking.Point()
			click.TestDefinitionEditor_Results()
			return
			}
		else
		{
			WinActivate, Test Definition Editor - \\Remote
			DescriptionRaw:=The_Description
			Trimmed_Description:=RTrim(DescriptionRaw, "`r`n")
			Breaking.Point()
			Click, 187, 200 ;Orient_SpecTab.TestDefinitionEditor
			if Name contains Vitamin C
				Send,{Home}{Delete 12}%Trimmed_Description%
			else
				Send,^a%Trimmed_Description%
				Breaking.Point()
			sleep 300
		}
		return
		;Send,{shift down}{Tab 15}{Shift up}{enter}
	}

	Edit_Physical(){
		Global
		winactivate, Edit specification - \\Remote
		SendInput,{click 376, 87}{home}
		Send,%Product%`,{space}{shift down}I{shift Up}n{shift down}{space}P{shift Up}rocess`,{space}{shift down}P{shift Up}hysical{tab 3}^a{backspace}
		Breaking.Point()
		Send,{tab}^a%Product%{tab 2}
		Breaking.Point()
		Sleep 200
		Send,{Space}
		sleep 200
		Breaking.Point()
		winwaitactive, Products List - \\Remote, , 8
		if !errorlevel
			sleep 300
		Send,{enter 2}
		sleep 200
		Breaking.Point()
		Send,{tab}
		sleep 200
		Send,{right}
		sleep 500
		Breaking.Point()
		click, 340, 622 ;click okay
		winwaitactive, NuGenesis LMS - \\Remote, ,8
		if !errorlevel
			sleep 300
			Breaking.Point()
		click, 70, 518 ;edit sample method
		sleep 499
		winwaitactive, Edit sample template - \\Remote,,4
		if !errorlevel
			sleep 300
		SendInput,{tab}{delete 4}%Product%{enter}
		return
	}

	Edit_CoatedRetain(){
		global
		winactivate, Edit specification - \\Remote
		SendInput,{click 376, 87}{home}
		Breaking.Point()
		Send,%Product%`,{space}{shift down}C{shift Up}oated`,{space}{shift down}R{shift Up}etain{tab 4}^a%Product%{tab}{enter}{tab}{space}{Return 2}
		sleep 400
		Send,{tab}{right}
		sleep 200
		Breaking.Point()
		Send,{tab}{right}{tab 3} ;{left 4}
		sleep 200
		Breaking.Point()
		click, 340, 622 ;click okay
		winwaitactive, NuGenesis LMS - \\Remote, ,12
		if !errorlevel
			click.EditSampleTemplate()
			Breaking.Point()
			SendInput,{tab}^{a}%Product%`,{space}{Shift down}C{shift up}oated`,{space}{shift down}R{shift Up}etain
		return
	}

	Edit_CoatedPhysical(){
		global
		winactivate, Edit specification - \\Remote
		SendInput,{click 376, 87}{home}
		Send,%Product%`,{space}{shift down}C{shift Up}oated`,{space}{shift down}P{shift Up}hysical{tab 4}^a%Product%{tab}{enter}{tab}{space}{Return 2}
		sleep 400
		Send,{tab}{right}
		Breaking.Point()
		sleep 200
		Send,{tab}{right}{tab} ;{left 4}
		Breaking.Point()
		sleep 200
		Breaking.Point()
		click, 340, 622 ;click okay
		winwaitactive, NuGenesis LMS - \\Remote, ,12
		if !errorlevel
		click.EditSampleTemplate()
		Breaking.Point()
			SendInput,{tab}^{a}%Product%`,{space}{Shift down}C{shift up}oated`,{space}{shift down}P{shift Up}hysical
		return
	}

	Edit_Retain(){
		Global
		winactivate, Edit specification - \\Remote
		SendInput,{click 376, 87}{home}
		Send,%Product%`,{space}{shift down}I{shift Up}n{space}{shift down}P{shift Up}rocess`,{space}{shift down}R{shift Up}etain{tab 4}^a%Product%{tab}{enter}{tab}{space}{Return 2}
		Breaking.Point()
		sleep 200
		Send,{tab}{right}
		sleep 400
		Send,{tab}{right}
		sleep 1500
		Breaking.Point()
		WinWaitactive, Edit specification - \\Remote,, 1
		if !errorlevel
			click, 340, 622 ;click okay
			Breaking.Point()
		winwaitactive, NuGenesis LMS - \\Remote, ,4
		if !errorlevel
			sleep 300
			Breaking.Point()
		click.EditSampleTemplate()
			sleep 300
			Breaking.Point()
		SendInput,{tab}{delete 4}%Product%{enter}
		return
		}
	Edit_Analytical(){
		Global
		Breaking.Point()
		If WinActive("Edit sample template - \\Remote")
			SpecTab.EditSampleTemplate_A()
		else If winexist("Edit specification - \\Remote")
		{
			winactivate,
			Breaking.Point()
			SpecTab.EditSpecification_Analytical()
		}
		return
	}

	Edit_Micro(){
		Global
		winactivate, Edit specification - \\Remote
		SendInput,{click 376, 87}{home}
		Send,%Product%`,{space}{shift down}F{shift Up}inished`,{space}{shift down}M{shift Up}icro{tab 4}^a%Product%{tab 2}
		Sleep 200
		Send,{Space}
		sleep 200
		winwaitactive, Products List - \\Remote, ,2
		Send,{enter 2}
		sleep 200
		Send,{tab}
		sleep 200
		Breaking.Point()
		Send,{right}{tab}{left 2}{enter}
		winwaitactive, NuGenesis LMS - \\Remote, ,4
		if !errorlevel
			sleep 300
			Breaking.Point()
		click.EditSampleTemplate()
			sleep 300
		SendInput,{tab}{delete 4}%Product%{enter}
		return
	}

	InsertDescription(){
		Global
		DescriptionRaw:=Description
		Description:=RTrim(DescriptionRaw, "`r`n")
		Send,^a%Description%
		Return
	}

	HM_ReportOnly(){
		click 125,130 ;click 1st row
		click 80,70 ;Edit
		Breaking.Point()
		winwaitactive, Result Editor - \\Remote,,4
		SendInput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
		click 390, 659	;click okay
		WinWaitClose, Result Editor - \\Remote,,4
		click 125,130 ;click 1st row
		click 80,70 ;Edit
		Breaking.Point()
		winwaitactive, Result Editor - \\Remote,,4
		SendInput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
		click 390, 659	;click okay
		WinWaitClose, Result Editor - \\Remote,,4
		click 125,130 ;click 1st row
		click 80,70 ;Edit
		Breaking.Point()
		winwaitactive, Result Editor - \\Remote,,4
		SendInput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
		click 390, 659	;click okay
		WinWaitClose, Result Editor - \\Remote,,4
		click 125,130 ;click 1st row
		click 80,70 ;Edit
		Breaking.Point()
		winwaitactive, Result Editor - \\Remote,,4
		SendInput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
		click 390, 659	;click okay
		return
	}

	HM_USP(){
		click 125,130 ;click 1st row
		click 80,70 ;Edit
		Breaking.Point()
		winwaitactive, Result Editor - \\Remote,,4
		SendInput,{tab 5}mcg/day{tab 7}{space}{tab 3}15{tab 5}NMT 15 mcg/day
		click 390, 659	;click okay
		WinWaitClose, Result Editor - \\Remote,,4
		click 125,130 ;click 1st row
		; click 125,150 ;click 2nd row
		click 80,70 ;Edit
		Breaking.Point()
		winwaitactive, Result Editor - \\Remote,,4
		SendInput,{tab 5}mcg/day{tab 7}{space}{tab 3}5{tab 5}NMT 5 mcg/day
		click 390, 659	;click okay
		WinWaitClose, Result Editor - \\Remote,,4
		click 125,130 ;click 1st row
		; click 125,190 ;click 3rd row
		click 80,70 ;Edit
		Breaking.Point()
		winwaitactive, Result Editor - \\Remote,,4
		SendInput,{tab 5}mcg/day{tab 7}{space}{tab 3}5{tab 5}NMT 5 mcg/day
		click 390, 659	;click okay
		WinWaitClose, Result Editor - \\Remote,,4
		click 125,130 ;click 1st row
		; click 125,210 ;click 4th row
		click 80,70 ;Edit
		Breaking.Point()
		winwaitactive, Result Editor - \\Remote,,4
		SendInput,{tab 5}mcg/day{tab 7}{space}{tab 3}15{tab 5}NMT 15 mcg/day
		click 390, 659	;click okay
		return
	}

	HM_Canada(){
		click 125,130 ;click 1st row
		click 80,70 ;Edit
		Breaking.Point()
		winwaitactive, Result Editor - \\Remote,,4
		SendInput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab}9.8{tab 5}NMT 9.8 mcg/day
		click 390, 659	;click okay
		Breaking.Point()
		WinWaitClose, Result Editor - \\Remote,,4
		click 125,130 ;click 1st row
		click 80,70 ;Edit
		Breaking.Point()
		Breaking.Point()
		winwaitactive, Result Editor - \\Remote,,4
		SendInput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab}9.8{tab 5}NMT 9.8 mcg/day
		click 390, 659	;click okay
		WinWaitClose, Result Editor - \\Remote,,4
		click 125,130 ;click 1st row
		click 80,70 ;Edit
		Breaking.Point()
		Breaking.Point()
		winwaitactive, Result Editor - \\Remote,,4
		SendInput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab}6.3{tab 5}NMT 6.3 mcg/day
		click 390, 659	;click okay
		WinWaitClose, Result Editor - \\Remote,,4
		click 125,130 ;click 1st row
		click 80,70 ;Edit
		Breaking.Point()
		Breaking.Point()
		winwaitactive, Result Editor - \\Remote,,4
		SendInput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab}20.3{tab 5}NMT 20.3 mcg/day
		click 390, 659	;click okay
		return
	}

	HM_Prop65(){
		click 125,130 ;click 1st row
		click 80,70 ;Edit
		Breaking.Point()
		winactivate, Result Editor - \\Remote
		winwaitactive, Result Editor - \\Remote,,4
		SendInput,{tab 12}{space}{tab 2}^{a}
		;SendInput,{tab 5}mcg/day{tab 7}{tab 2}^a
		SendInput, 0{tab}^{a}
		sleep 100
		SendInput, 9.999{tab 5}^a<10 mcg/day
		click 390, 659	;click okay
		WinWaitClose, Result Editor - \\Remote,,4
		winactivate, Result Definition - \\Remote
		click 125,130 ;click 1st row
		click 80,70 ;Edit
		Breaking.Point()
		winwaitactive, Result Editor - \\Remote,,4
		SendInput,{tab 12}{space}{tab 2}^a
		;SendInput,{tab 5}mcg/day{tab 7}{tab 2}^a
		SendInput, 0{tab}^a
		sleep 100
		SendInput, 0.499{tab 5}^a<0.5 mcg/day
		click 390, 659	;click okay
		WinWaitClose, Result Editor - \\Remote,,4
		winactivate, Result Definition - \\Remote
		click 125,130 ;click 1st row
		click 80,70 ;Edit
		Breaking.Point()
		winwaitactive, Result Editor - \\Remote,,4
		SendInput,{tab 12}{space}{tab 2}^a
		;SendInput,{tab 5}mcg/day{tab 7}{tab 2}^a
		SendInput, 0{tab}^a
		sleep 100
		SendInput, 4.099{tab 5}^a<4.1 mcg/day
		click 390, 659	;click okay
		WinWaitClose, Result Editor - \\Remote,,4
		winactivate, Result Definition - \\Remote
		click 125,130 ;click 1st row
		click 80,70 ;Edit
		Breaking.Point()
		winwaitactive, Result Editor - \\Remote,,4
		SendInput,{tab 12}{space}{tab 2}^a
		;SendInput,{tab 5}mcg/day{tab 7}{tab 2}^a
		SendInput, 0{tab}^a
		sleep 100
		SendInput, 0.299{tab 5}^a<0.3 mcg/day
		click 390, 659	;click okay
		return
	}
	}

	WM_LbuttonDown:
	Spec_Table:
		if (A_GuiEvent = "NORMAL" ){
		; if (A_GuiEvent := "I" ){
		
			SendInput,{space}
		SpecTab.GetRowText()
		SpecTab.AutoFill()
		}
		Return

	Spec_TableGuiClose:
		GUI, Spec_Table:destroy
		coordmode, mouse, window
		return









Class WorkTab { 		;;___________________WorkTab Class______________________
  registerNewSamples(){
    global
    SetWinDelay, 450
    mx:=
    my:=
    If Coated = "ERROR"
      Coated:=
    If Lot = "ERROR"
      lot:=
      ; blockinput, on
    ControlGetText, Iteration, Static1, VarBar
    ifwinactive, Register new samples - \\Remote
    MouseGetPos, mx, my
    click 2
    sleep 200
    Breaking.Point()
    sleep 200
    winwaitactive, Edit sample `(Field Configuration,, 6 
      if ErrorLevel
        exit
    SendInput, {tab 2}{right}{click 277, 139}{tab 6}
    IfWinActive, Edit sample `(Field Configuration: F`, Micro`) - \\Remote
      Send,{tab}^{a}
    SendInput, ^{a}%Batch%{tab}^{a}
    IfWinActive, Edit sample `(Field Configuration: F`, Micro`) - \\Remote
    {
      SendInput,{CtrlDown}{a}{Ctrlup}%Lot%
      SendInput,{tab 3}
      sleep 100
    if Coated
      SendInput, ^{a}%Coated%
      sleep 100
      SendInput, +{tab 2}
    }
    Breaking.Point()
    sleep 200
    If !ShipTo && !ShipToIndex
      return
    else if ShipToIndex
      This.DropdownSelect(ShipToIndex)
    else
      This.DropdownSelect(ShipTo)
    sleep 200
    Breaking.Point()
    SendInput, {enter}
    ; sleep 200
    ; blockinput, off
    ; winactivate, Register new samples - \\Remote
    ; sleep 300
    ; my:=my+30
    ; MouseMove, mx, my  

      ; return
  }


  DropdownSelect(A_ShipTo){
    sleep 100
      ; SetKeyDelay, 0, 0
      ; SetWinDelay, 500
  AbsSelection:=Abs(A_ShipTo)-1
  if (a_shipto = "-1")
    Sendinput,{end}
  else if (a_shipTo = "1")
    Sendinput,{home}
  else if (a_ShipTo > 1)
    Sendinput,{home}{right}{right %A_ShipTo%}
  else if (a_ShipTo < 1)
    Sendinput,{end}{left}{left %Absselection%}
      ; setwindelay, 200
      sleep 400
  if winactive("Edit sample `(Field Configuration:")
    sleep 400
        ; SetKeyDelay, 1, 0.25
      return
  }

  DeleteRetain(){
    gLOBAL
    SetWinDelay, 25
      SetMouseDelay, -1
    SetDefaultMouseSpeed, 0
    CoordMode, mouse, Relative
    ; Breaking.Preamble()
    Winactivate, NuGenesis LMS - \\Remote
    MouseGetPos, mx, mY  
  ; InputBox, n, number of retains to delte, , , , , mx, my,,,50
    n:=Iteration*10
    SetControlDelay -1
    loop %n%,
    {
    CoordMode, mouse, Screen
    MouseGetPos, mx, mY  
    CoordMode, mouse, relative
      ; TT(n,800)
      ; Breaking.Point()
      ; Winactivate, ahk_exe WFICA32.EXE
        ; ControlClick, x61 y258, ahk_exe WFICA32.EXE
    Winactivate, NuGenesis LMS - \\Remote
      ; clk(61, 258,,,"ahk_exe WFICA32.EXE")
      send, {click 61, 258}
    CoordMode, mouse, Screen
      ; send, {click %mx%,%my%,0}
      MouseMove, %mX%, %mY%, 0,
      ; send, {click %mx%,%my%,0}
      ;clk(61, 258,,,"ahk_exe WFICA32.EXE")
      ; previousProduct:=Product
      sleep 100
      winwait, Delete Tests - \\Remote,,1.5
      if errorlevel
      {
        sleep 100
        if winexist("Warning - \\Remote")
          ControlSend,, {enter}, Warning - \\Remote
        ; Winactivate, NuGenesis LMS - \\Remote
        ; MouseClick, left, 0, 26, 1, 0, , R
      }
        ; MouseClick, left, 0, 26, 1, 0, , R
        sleep 200
        if WinExist("Delete Tests - \\Remote")
          ControlSend,, {enter}, Delete Tests - \\Remote
        ; Send, {enter}
      sleep 100
      ; sleep 500
      n--
        Breaking.Point()
    }
        setwindelay, 200
  }


  NewRequest(){
  global
  SetWinDelay, 550
  department:= ; Clip()
  Clipboard:=
  WinActivate, NuGenesis LMS - \\Remote
  click 
  Send, ^c
  clip()
  sleep 50
  sleep 400
  click 64, 300 ;click Assign To New rewuest link
  Breaking.Point()
  winwaitactive, Edit request - \\Remote,,3
    if !Errorlevel
  sleep 200
  WinActivate, Edit request - \\Remote,
  click 238, 622 ;pick test
  Breaking.Point()
  winwaitactive, Select tests for request,,3
    if !Errorlevel
    sleep 100
  click, right, 264, 590 ; click to show filer
  sleep 100
  Breaking.Point()
  Send,{up}{enter}
  sleep 100
  click, 97, 125 ; click filter
  Send, %Department%{enter}{tab 2}
  sleep 100
  Breaking.Point()
  Send, %product%{enter}
  Send,{tab}{CtrlDown}{a}{Ctrlup}
  input, , V T3,{Lbutton}{enter}
  click 504, 338 ; click arrow
  WinActivate, Select tests for request
  click, right, 264, 590 ; click to clear filter
  Send,{up}{enter}
  sleep 100
  WinActivate, Select tests for request
  sleep 100
  WinActivate, Select tests for request
  Breaking.Point()
  click 854, 657 ; click okay
  winwaitclose, Select tests for request,,3
    if !Errorlevel
    WinWaitActive, Edit request
    Breaking.Point()
  While GetKeyState("Lbutton", "p")
  sleep 100
  IfWinnotActive, Edit request
    exit
  Sleep 100
    winactivate, Edit request
    Breaking.Point()
    Send,{tab}{enter}
    ; tooltip,
    setwindelay, 200
    return
  }

  ChangeTestResults(Checkbox_Toggle:=0,MoveNext:=""){
    global
    SetWinDelay, 550
    if (Iteration = "ERROR")
    InputBox, Iteration, enter iteration, number please,, , , , , , , 1
    if errorlevel
      reload
    if checkbox_toggle contains loop
    {
      if keep_running = y
    {
      keep_running = n ;signal other thread to stop
      return
    }
    keep_running = y
    MouseGetPos, xpos, ypos
    loop 25,
    {
    blockinput on
    if keep_running = n ;another signal to stop
    return
    click
		click 843, 202, 2
    if keep_running = n ;another signal to stop
    return
    Send,{tab}{Space}{tab}{Space}
    Send,{tab 10}^a
    sleep 100
    Send, %Iteration%
    if keep_running = n ;another signal to stop
    return
    sleep 100
    ypos:=ypos+26
    if keep_running = n ;another signal to stop
    return
    mousemove, xpos, ypos,0
    sleep 200
    blockinput off
    }
    Breaking.Point()
    if keep_running = n ;another signal to stop
    return
    click
    return
    }
    MouseGetPos, xpos, ypos
    click
		click 843, 202, 2
    if Checkbox_Toggle Contains Toggle
      SendInput,{tab}{Space}{tab}{Space}
    else
      SendInput,{tab}{tab}
    SendInput,{tab 10}^a
    sleep 100
    if Checkbox_Toggle Contains toggle
      return
    Send, %Iteration%
    sleep 100
    if Checkbox_Toggle Not Contains Toggle
      mousemove, xpos, ypos+26 
    setwindelay, 200
    return
    }

  AddSampleLog(count)
  {
  global
    setwindelay, 200
  loop, %count%
  {
    click 46, 877
		if !winactive("Edit test (Field Configuration: ")
    	winwaitactive, Edit test (Field Configuration: ,, 2
    Send,{Click, 402, 284}{end}(on sample log){click, 334, 618}
    winwaitactive, NuGenesis LMS - \\Remote,,2
    sleep 300
    winactivate, NuGenesis LMS - \\Remote
    sleep 500
    Send,{click, 1290, 703}{down %A_index%}
  }
  return
  }

  Main_EditResults()
  {
  SendInput,{click}{click 77, 751} ;edit results
  winwaitactive, Results Definition - \\Remote,,3
  return
  }
    AddTestDescription(Text){
      SendInput,{click 305, 294}{end}%TEXT%{click 330, 617}
      sleep 300
    }




  SelectTestSample(){
  global
  blockinput on
  click 647, 75 ;click assign Samples
    winactivate, Select samples for test:
  sleep 900
    click 467, 71 ;Click Filter button
    sleep 200
  Breaking.Point()
  send, {click 248, 68} ;click dropdown then
  sleep 200
  send, {click 212, 188}  ; select Batches
  sleep 400
  Send, {click 136, 119}^a ;flick filter box
  if WinActive("Select samples for test: Organoleptic Sensory Test  - \\Remote") || WinActive("Select samples for test: Average Capsule Weight  - \\Remote") || WinActive("Select samples for test: Average Tablet Weight  - \\Remote")
    Department:="Physical"
  if WinActive("Select samples for test: Microbiological  - \\Remote")
    Department:="Micro"
  send, %Department%{enter} ; send department
  sleep 200
  Breaking.Point() 
  sleep 200
  send, {click 504, 324} 
  Breaking.Point() 
  sleep 200
  send, {click, 849, 661}
  Breaking.Point() 
  Pop(Department)
    blockinput off
    setwindelay, 200
  return
  }

  }