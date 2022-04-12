Return

GetSampleInfo(){ ;on the lms main menu
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
	IniRead,ShipToIndex, Data\customers.ini, Customers, %Customer%
	; if !ShipTo
	; ShipTo:=ShipToIndex
	return ShiptoIndex
}

Class LMS { ;;__________Generl LMS__________________

	Menu(){
		Global
		try Menu,Menu, deleteAll
		if winactive("NuGenesis LMS"){
			LMS.Orient()
			LMS.DetectTab()
			;Menu,Menu, add, Copy &Template, autofill
			If CopyPasteToggle=1
				Menu,Menu, add, Paste &Specs, Autofill
			If CopyPasteToggle=0
				Menu,Menu, add, Copy &Specs, Autofill
			Menu, Menu, add, Paste All &Products, +F1
			Menu, Menu, add, Paste All &Batches, +F2

			; msgbox, %Tab%
			; click
			if (Tab="Samples")
				Menu, Menu, add, New &Request, AutoFill
			else if (Tab="Tests")
				Menu,Menu, add, &Delete Retain, Autofill
			else if (Tab="Specs"){
				this.CopyPasteSpec()
				Menu,Menu, add, &Delete Retain, Autofill
			}

			else {
				Menu,Menu, add, &Production Server, LMS_Env
		Menu,Menu, add, &Test Server, LMS_Env
			}
			; Menu, Menu, add, Paste All &WorkSheets, F19 & up
			Try Menu,menu,show
		}
		if winactive("Edit specification"){
			Menu, Menu, add, &Analytical, AutoFill
			Try Menu,menu,show
		}
		if winactive("Results Definition") || winactive("Composition"){
			; This.add("&Spec Table","Tests")
			Menu,Menu, add
			Menu, Menu, Add, &USP Heavy Metal,Autofill
			Menu, Menu, Add, &Canada Heavy Metal,Autofill
			Menu, Menu, Add, &Prop65 Heavy Metal,Autofill
			Menu, Menu, Add, &Report Only Heavy Metal,Autofill
			Try Menu,menu,show
			return
		}
		; if winactive("Edit specification"){
		; 	;Menu,Menu, add, Departments, Autofill
		; 	Menu, DepartmentsMenu, add, Analytical, AutoFill
		; 	; Menu, DepartmentsMenu, add, Physical, AutoFill
		; 	; Menu, DepartmentsMenu, add, Micro, AutoFill
		; 	; Menu, DepartmentsMenu, add, Retain, AutoFill
		; 	; Menu, DepartmentsMenu, add, Coated_Physical, AutoFill
		; 	; Menu, DepartmentsMenu, add, Coated_Retain, AutoFill
		; 	Menu,Menu, add, departments, :DepartmentsMenu
		; 	Try Menu,menu,show
		; 	return
		; }
		if winactive("Login"){
			Menu,Menu, add, &Login, LMS_Env
			Menu,Menu, add, &Production Server, LMS_Env
			Menu,Menu, add, &Test Server, LMS_Env
			Try Menu,menu,show
		}
		else
			return
	}



	SearchBar(Code:="",PostCmd:="",Overwrite:="true"){
		Global
		if winactive("Select methods tests")
			clk(246,77, 2)
		else If winactive("Register new samples") {
			Clk(180, 103, 2)
			Send, {click 180, 103,2}%Product%{enter}
		}
		else if winactive("NuGenesis LMS") {
			LMS.DetectTab()
			if (Tab="Products") {
				If (Code=Product){
					clk(x%Tab%Search,yProductsSearch)
					Sendinput, {ctrldown}{a}{ctrlup}
					If Overwrite=true
						Sendinput, ^{x}
					Sendinput, %Product%{ctrldown}{a}{ctrlup}
					If Overwrite=true
						sendinput, {right}{space}^{v}^{a}^{c}
					if PostCmd!=""
						sendinput % PostCmd
					return
				}
				If (Code=Batch) { ;click something edit comp
					clk(40, 384)
					sleep 200
					clk(455, 472,,2)
					return
				}
			}
			if (Tab="Specs") {
				; If (Code=Product) {
				clk(x%Tab%Search,yProductsSearch)
				Sendinput, {ctrldown}{a}{ctrlup}
				If Overwrite=Add
					Sendinput, ^{x}
				Sendinput, %Product%{ctrldown}{a}{ctrlup}
				If Overwrite=Add
					sendinput, {right}{space}^{v}^{a}^{c}
				if PostCmd!=""
					send % PostCmd
				return
			}
			If (Tab="Tests"|| Tab="Samples" || Tab="Results" || Tab="Documents") {
				clk(x%Tab%Search,yWorkTabSearch,,2)
				Send, {ctrldown}{a}{ctrlup}
				If Overwrite=Add
					Sendinput, ^{x}
				Send, %Code%{ctrldown}{a}{ctrlup}
				If Overwrite=Add
					sendinput, {right}{space}^{v}^{a}^{c}
				if PostCmd!=""
					sendinput % PostCmd
				return
			}
			If (Tab="Requests") {
				clk(x%Tab%Search-40,yWorkTabSearch,,2)
				sleep 20
				Sendinput, {ctrldown}{a}{ctrlup}
				If Overwrite=Add
					Send, ^{x}
				Send, %Code%{ctrldown}{a}{ctrlup}
				If Overwrite=Add
					sendinput, {right}{space}^{v}^{a}^{c}
				if PostCmd!=""
					sendinput % PostCmd
				return
			}
			else
				sendinput, %Code%
		}

	}
	SaveCode(){
		global
		Send, {ctrldown}{a}{ctrlup}
		sleep 20
		send, ^c
		sleep 200
		Send, {enter}
		return
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

DetectTab(){
	global
	winSet, Transparent, Off, ahk_exe eln.exe
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
	; ifwinnotactive, ahk_exe eln.exe
		; winactivate, ahk_exe eln.exe
	LMS.Orient()
	; CoordMode, pixel, window
	if winactive("NuGenesis LMS") {
		PIXELSEARCH, Tab2, FoundY, XTAB2, YTabS, XTAB2+3, yTabs+5, 0xfff8c3, 10, Fast RGB ;icon on
		if !Tab1 {
			PixelSearch, FoundSamples, FoundY, SamplesTab, yMyWorkTabs, SamplesTab+2, yMyWorkTabs+2, 0xfffd353, 10, Fast RGB
			PixelSearch, FoundRequests, FoundY, RequestsTab, yMyWorkTabs, RequestsTab+2, yMyWorkTabs+2, 0xffd353, 10, Fast RGB
			if FoundSamples {
				Tab:="Samples"
				return Tab
			}
			else
			{
				If FoundRequests {
					Tab:="Requests"
					return Tab
				}
				PixelSearch, FoundDocuments, FoundY, DocumentsTab, yWorkTabs, DocumentsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
				If FoundDocuments {
					Tab=Documents
					return tab
				}
				PixelSearch, FoundResults, FoundY, ResultsTab, yWorkTabs, ResultsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
				If FoundResults {
					Tab:="Results"
					return tab
				}
				PixelSearch, FoundTests, FoundY, TestsTab, yWorkTabs, TestsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
				If FoundTests {
					Tab:="Tests"
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
						PIXELSEARCH, FoundSpecs, FoundY, 14, 351, 16, 353, 0x0D77AF, 10, Fast RGB ;icon on
						; PIXELSEARCH, FoundSpecs, FoundY, 13, 355, 15, 358, 0xeaeff3, 10, Fast RGB ;icon on
						If FoundSpecs
							Tab:="Products"
						else
							tab:="Specs"
						return Tab
					}
				}
				; else
					; return
			}
		}
	}
	return Tab
}




Orient(){
	global
	winGetPos,Nux,NuY,NuW,NuH,NuGenesis LMS
	WbX:=WbX+400
	Flovar_x:= NuX +900
	Flovar_y:= NuH + NuY -28
	varBar_nuX:=NuX+450
	varBar_nuY:=NuY
	TabSelect:=NuW-10
	yTabSelect:=45
	yTabDropdown:=45
	SamplesTab:=(NuW/2)-80
	RequestsTab:=(NuW/2)+20
	DocumentsTab:=(NuW/3)+(NuW/3)-50
	TestsTab:=(NuW/3)+(NuW/3)-220
	ResultsTab:=(NuW/3)+(NuW/3)-150
	HScrollBarRightX:=NuW-40
	HScrollBarLeftX:=(NuW/5)+35
	HScrollBarRightY:=HScrollBarLeftY:=(Nuh/2)+38
	yWorkTabs:=71
	MyWorkTabs:=71
	yMyWorkTabs:=71
	yMyWorkTab:=71
	xDivider:=(NuW/5)
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
	XCoA:=(NuW-131)
	xClearfilter:=xDivider+16
	yClearfilter:=270
	xFilterIcon:=NuW-22
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
	return
}

Scrolldown(){
	Global
	if winactive("Result Editor") {
		clk(503, 574,1)
		Sleep 800
		return
	}
	if winactive("Test Definition Editor") {
		clk(464, 532,,2)
		Sleep 800
		return
	}
	if winactive("Edit Formulation") {
		clk(452, 473,,2)
		Sleep 800
		return
	}
	else
		return
}
}

Class ProductTab { ;;________ProductTab Class_______________
AddProduct(){
	Global
    loop, parse, clipboard, "`n"
		{
			SheetInfo:=[]
			SheetInfo:=StrSplit(A_LoopField,"|")
      Product:=SheetInfo[2]
      ProductName:=SheetInfo[3]
      Customer:=SheetInfo[4]
      CustomerPosition:=SheetInfo[5]
      ShapeAndSize:=SheetInfo[6]
      Color:=SheetInfo[7]
      ServingSize:=SheetInfo[8]
      clip.codesRegex(SheetInfo[9])
      Iteration:=CustomerPosition
      ; ControlsetText, Static1,%CustomerPosition%,VarBar
      GuiControl,Varbar:Text, Iteration, %Iteration%
    }
    if winactive("NuGenesis LMS"){
      Lms.detectTab()
			tt(Tab)
      if (Tab="Product"){
        click 74, 153
        sleep 1000
      }
      else
        return
    }
	Breaking.Point()
    if Winactive("Edit Product")
      ProductTab.EditProduct()
    else if winactive("Edit Formulation")
      ProductTab.EditFormulation()
    else
      return
  }

AddIngredient(){
	global
	Pointer:=Clipboard
  		if RegexMatch(Pointer, "<<LabelCopy>>"){
			Name:=			[]
			IngredientID:=	[]
			Position:=		[]
			LabelClaim:=	[]
			MinLimit:=		[]
			MaxLimit:=		[]
			Units:=			[]
			Percision:=		[]
			LabelName:=		[]
			Description:=	[]
			Assay:=			[]
			Requirement:=	[]
			Method:= 		[]
      Table_height=0
		loop, parse, clipboard, "`n"
		{
			Line:=A_index
			Ingredient:=[]
			ingredient:=StrSplit(A_LoopField,"|")
			Name[Line]:=ingredient[2]
			IngredientID[Line]:=ingredient[3]
			Position[Line]:=ingredient[4]
			LabelName[Line]:=ingredient[5]
			labelClaim[Line]:=ingredient[6]
			if !ingredient[7]
				continue
			Assay[Line]:=ingredient[7]
			Method[Line]:=ingredient[8]
			Description[Line]:=ingredient[9]
			MinLimit[Line]:=ingredient[10]
			MaxLimit[Line]:=ingredient[11]
			Units[Line]:=ingredient[12]
			Percision[Line]:=ingredient[13]
			Requirement[Line]:=ingredient[14]
    		  Table_height+=1
			}
			  Lms.detectTab()
			tt(Tab)
			If winactive("Edit Ingredient"){
				winactivate "Edit Ingredient"
				sleep 250
				ProductTab.EditIngredient(LabelName[1],LabelClaim[1],Position[1],IngredientID[1],1)
				sleep 320
				return
				}
			else if Winactive("Composition"){
				winactivate "Composition"
				loop % Line
				{
					If !Position[A_index]
						return
					ProductTab.EditIngredient(LabelName[a_index],LabelClaim[a_index],Position[a_index],IngredientID[a_index])
					sleep 150
					ifwinnotactive, Composition
					winactivate, Composition
					sleep 150
					}
				}
			else if (Tab="Specs") || winactive("Result Editor") || winactive("Results Definition") || winactive("Test Definition Editor") {
        SpecTab.Table()
        return
		  }
		  }
			sleep 100
		return

}




EditIngredient(Ingredient_Name,Ingredient_Claim,Ingredient_Position,Ingredient_Id,Dont_Hit_Okay:=""){
	Global
	ifwinnotexist, Edit Ingredient
	{
		if winactive("Composition"){
			winactivate, Composition
			click 57, 65
		}
			sleep 200
	}
	if Dont_Hit_Okay
		click, 150, 73
	else
		ProductTab.Dropdown_IngredientSelect(Ingredient_Id)
	sleep 100
	Send,{tab 6}^{a}
	sleep 40
	sendinput, %Ingredient_position%{tab}^a
	Sendinput,%Ingredient_Name%
	sleep 200
	if Strlen(Ingredient_Name) > 250
		sleep 500
	If Ingredient_Claim contains Heavy Metal,Allergens
		Sendinput,{tab}
	Send,{tab 2}^a
	Send,%Ingredient_Claim%
	sleep 150
	Breaking.Point()
	If !Dont_Hit_Okay
		Sendinput,{enter}
	Breaking.Point()
	sleep 150
	ifwinexist, Duplicate ingredient ID
		exit

	return
}

Dropdown_IngredientSelect(A_DropdownCount){
	global
	SetKeyDelay,-1,-1
	ifWinNotActive, Edit Ingredient
		winactivate, Edit Ingredient
	click, 150, 73 ;click dropdown box
	sleep 110
	AbsSelection:=Abs(A_DropdownCount)
	if (A_DropdownCount > 0){
		Sendinput, {tab}{home}{right %A_DropdownCount%}
		}
	if (A_DropdownCount < 0){
		Sendinput, {tab}{end}{left %AbsSelection%}
	}
	if (A_DropdownCount = "-0")
		Sendinput, {tab}{end}
	if (a_DropdownCount = ""){
		if Iteration >25
			iteration:=1
		sleep 50
		this.Dropdown_GenericIngredient(Iteration)
		Breaking.Point()
		varbar.AddIteration(0)
	}
	SetKeyDelay,0,0
	sleep 200
	Breaking.Point()
	return
}




EditProduct(){ ;for naming Product code and customer,
	global Product, ProductName, Customer, ShapeAndSize, color
	setwindelay, 260
	click 120,80 ;click product box
	Sendinput,%Product%`,{space}
	sendraw, %ProductName%
	sleep 20
	sendinput, {tab 2}%Customer%{tab 2}{right 2}{tab}{right 3}{tab}%Product%{tab 2}
	sleep 200
	Sendraw,%ProductName%
	sendinput, {tab 8}
	sleep 300
	Breaking.Point()
	winwaitactive,NuGenesis LMS,,15
	winactivate, NuGenesis LMS
	Breaking.Point()
	click, 67, 283
	sleep 200
	Breaking.Point()
	This.EditFormulation()
	; clk(287, 578) ;click save
	Iteration:=1
	return
	setwindelay, 100
}

EditFormulation(){     ;then click on Edit Formulation, puts in code, then tabs to serving size
	global Product, ShapeAndSize, color, ServingSize, ServingType
	if !winactive("Edit Formulation") && winexist("Edit Formulation")
		winactivate, Edit Formulation,
	Sendinput, {tab}%product%
	Sendinput, {Tab 23} ;{click 268, 578}
	sleep 200
	sendinput, {tab}^a
	sendraw, %ShapeAndSize%
	sendinput, {shiftdown}{tab}{shiftup}
	sleep 200
	If !Color
		color:="Pending"
	else
		send, {tab 2}^a%Color%{shiftdown}{tab 2}{shiftup}
	sleep 900
	Breaking.Point()
	clk(287, 578) ;click save
	return

}

HM_ReportOnly(){
	setwindelay, 260 ;testing out
	click 125,120 ;click 1st row

	clk(45, 65)
	winwaitactive, Edit Ingredient,,4
	Sendinput,{click 150,73}{tab}{right 11} ;arsenic
	Breaking.Point()
	winWaitClose, Edit Ingredient,,4
	click 125,140 ;click 2nd row
	clk(45, 65)
	winwaitactive, Edit Ingredient,,4
	Sendinput,{click 150,73}{tab}{right 167} ;lead
	Breaking.Point()
	click 390, 659	;click okay
	winWaitClose, Edit Ingredient,,4
	click 125,180 ;click 3rd row
	clk(45, 65)
	winwaitactive, Edit Ingredient,,4
	Sendinput,{click 150,73}{tab}{right 23} ;cadmium
	Breaking.Point()
	click 390, 659	;click okay
	winWaitClose, Edit Ingredient,,4
	click 125,200 ;click 4th row
	clk(45, 65)
	winwaitactive, Edit Ingredient,,4
	Sendinput,{click 150,73}{tab}{right 189} ;mercury
	Breaking.Point()

	click 390, 659	;click okay
	return
}

Dropdown_GenericIngredient(IterationCount:=""){
	global
	GeneralCount:=IterationCount
	Click 150, 73
	sleep 50
	Sendinput,{tab}{Home}{right 11}
	sleep 80
	if GeneralCount=1			; Generic ingredient A.1
		Sendinput, {right 56}
	else if GeneralCount=2
		Sendinput, {right 62}
	else if GeneralCount=3
		Sendinput, {right 68}
	else if GeneralCount=4
		Sendinput, {right 74}
	else if GeneralCount=5
		Sendinput, {right 80}
	else if GeneralCount=6
		Sendinput, {right 86}
	else if GeneralCount=7
		Sendinput, {right 92}
	else if GeneralCount=8
		Sendinput, {right 93}
	else if GeneralCount=9
		Sendinput, {right 95}
	else if GeneralCount=10
		Sendinput, {right 97}
	else if GeneralCount=11
		Sendinput, {right 99}
	else if GeneralCount=12
		Sendinput, {right 100}
	else if GeneralCount=13
		Sendinput, {right 101}
	else if GeneralCount=14
		Sendinput, {right 102}
	else if GeneralCount=15
		Sendinput, {right 103}
	else if GeneralCount=16
		Sendinput, {right 104}
	else if GeneralCount=17
		Sendinput, {right 105}
	else if GeneralCount=18
		Sendinput, {right 106}
	else if GeneralCount=19
		Sendinput, {right 107}
	else if GeneralCount=20
		Sendinput, {right 108}
	else if GeneralCount=21
		Sendinput, {right 109}
	else if GeneralCount=22
		Sendinput, {right 110}
	else if GeneralCount=23
		Sendinput, {right 111}
	else if GeneralCount=24
		Sendinput, {right 112}
	else if GeneralCount=25
		Sendinput, {right 113}
	else if GeneralCount=26
		Sendinput, {right 114}
	else
		exit
	sleep 400
	return
}

}


return
class SpecTab { 	;; _________SpecTab class_______

	Table(){
		Global
		ShiftTable_X:=-355
		ShiftTable_Y:=250
		Try GUI, Spec_Table:destroy
		CoordMode, mouse, window
		ifwinnotactive, ahk_exe eln.exe
			winactivate, ahk_exe eln.exe
		winGetPos, LMS_X, LMS_Y, LMS_w, LMS_h, A
		CoordMode, mouse, window
		SpecTable_X:=LMS_w+LMS_X+ShiftTable_X
		SpecTable_Y:=LMS_Y+ShiftTable_Y

		CoordMode, mouse, screen
		;Excel.Connect()
		; SpecTab.GetExcelData()
		SpecTab.CreateGUI()
		SpecTab.ModifyColumns()
		SpecTab.ShowGUI()
		; sleep 100
		return
	}

	ShowGUI(){
		global
		CoordMode, mouse, screen
		ScreenEdge_X:=A_ScreenWidth-15
		ScreenEdge_Y:=A_Screenheight-150
		try GUI, Spec_Table:Show, x%SpecTable_X% y%SpecTable_Y% w352, %Product% Spec Table
		catch GUI, Spec_Table:Show, x%ScreenEdge_X% y%ScreenEdge_Y% w352, %Product% Spec Table
			CoordMode, mouse, window
		OnMessage(0x0201, "WM_Lbuttondown")
		return
	}

	CreateGUI(){
		global
		Try GUI, Spec_Table:destroy
		GUI, Spec_Table:Default
		if Table_height > 8
			Table_height =12
		if !Table_height
			Table_height = 8
		Gui Spec_Table:+LastFound +Toolwindow +Owner +AlwaysOnTop -SysMenu +MinimizeBox
		GUI, Spec_Table:Font, s11 cBlack, Arial Narrow
		GUI, Spec_Table:Add, ListView, x0 y0 w360 r%table_height% checked Grid altSubmit -hdr gSpec_Table, `t%Product%|`t%Name%|MinLimit|MaxLimit|Units|Percision|Description|Method
		loop % Name.Maxindex(){
			if !(Requirement[A_index])
				continue
			LV_add(,""Name[A_index], Requirement[A_index], MinLimit[A_index],MaxLimit[A_index],Units[A_index],Percision[A_index],Description[A_index],Method[A_index])
			temp:=LabelClaim[A_index] "|" MinLimit[A_index]"|" MaxLimit[A_index]"|" Units[A_index]"|" Percision[A_index] "|" Description[A_index] "|" Method[A_index]
			Test:= Name[A_index]
			}
		}

ModifyColumns(){
	Global
	LV_ModifyCol(1,140)
	LV_ModifyCol(2,200)
	LV_ModifyCol(3,0)
	LV_ModifyCol(4,0)
	LV_ModifyCol(5,0)
	LV_ModifyCol(6,0)
	LV_ModifyCol(7,0)
	LV_ModifyCol(8,0)
	LV_ModifyCol(9,0)
	; LV_Delete(Table_Height)
}

GetRowText(){
	global
	LV_GetText(Name, 			A_EventInfo,1)
	LV_GetText(LabelClaim, 		A_EventInfo,2)
	LV_GetText(MinLimit, 		A_EventInfo,3)
	LV_GetText(MaxLimit, 		A_EventInfo,4)
	LV_GetText(Units, 			A_EventInfo,5)
	LV_GetText(Percision, 		A_EventInfo,6)
	LV_GetText(Description, 	A_EventInfo,7)
	LV_GetText(Method, 			A_EventInfo,8)
	GUI, Spec_Table:submit,NoHide
}


	CopyPasteSpec(){
		global copypasteToggle
		click
		try Menu,Menu, deleteAll
		Menu,Menu, add, Copy &Template, autofill
		If CopyPasteToggle=1
			Menu,Menu, add, Paste &Specs, Autofill
		If CopyPasteToggle=0
			Menu,Menu, add, Copy &Specs, Autofill
		return
	}

	Methods() {
		global
		winactivate, Select methods tests
		click, 235, 72
		Send, ^a
		Loop, Read, Methods.ini
		{
			If A_Index = 1
				Continue
			Methodmenu := StrSplit(A_LoopReadLine, "=")
			Selection:= % MethodMenu[1]
			Menu, Methodmenu, add, %Selection%, Methods
		}
		; sleep 300
		Menu, MethodMenu, Show
		return

		Methods:
			sleep 200
			InputVar:=A_ThisMenuItem
			IniRead,vOutput, Methods.ini, Methods, %InputVar%
			click, 235, 72
			sleep 100
			Sendinput, %vOutput%{enter}
			sleep 300
			click 506, 341
			SpecTab.Methods()
		return
	}

	CopySpecTemplate(){
		global
		Critical, On
		clipboard:=
		; sleep 100
		if winactive("NuGenesis LMS"){
			MouseGetPos, premx, premy
			click
			Sendinput, {ctrldown}{c}{ctrlup}
			clipwait,1 ; Tooltip, %Clipboard%
			if !ErrorLevel
				Breaking.Point()
		}
		If !errorlevel
			click 102, 289
		sleep 400
		clip.Department()
		Breaking.Point()
		sleep 100
		; If (clip.Department() = "Analytical")
		; SpecTab.Edit_Analytical()
		If (Department = "ctPhysical")
			SpecTab.Edit_CoatedPhysical()
		else If (Department = "Physical")
			SpecTab.Edit_Physical()
		else if (Department = "Micro")
			SpecTab.Edit_Micro()
		else If (Department = "ctRetain")
			SpecTab.Edit_CoatedRetain()
		else If (Department = "Retain")
			SpecTab.Edit_Retain()
		sleep 50
		; Breaking.Point()
		; WinActivate, NuGenesis LMS
		;excel.NextSheet()
		; excel.connect(0)
		Breaking.Point()
		excel.infolocations()
		;TT(Product)
		Critical, Off
		return
	}

	CopySpecs(){
		global
		winactivate, NuGenesis LMS
		BlockInput, on
		critical, On
		clipboard:=
		click 57, 715 ; edit Test
		; click 57, 750 ; edit results
		winwaitactive, Test Definition Editor,,0.45
		if errorlevel
			winactivate, Test Definition Editor
		sleep 400
		SimpleClip:=1
		click 418, 202
		Send, ^a
		sleep 100
		Send, ^c
		; Clipwait,1
		Description:=Clipboard
		sleep 200
		StrReplace(Description, "eurofins", "intertek")
		; MouseClick, left, 464, 532,2,0
		MouseClick, left, 464, 533,1,0
		sleep 150
		MouseClick, left, 245, 489,1,0
		;  LMSclick.TestDefinitionEditor_Results()
		winactivate, Results Definition
		winWaitactive, Results Definition,,0.35
		if errorlevel
			winactivate, Results Definition
		click 282, 141 ; click row
		sleep 80
		clipboard:=
		sleep 20
		Send, ^c
		clipwait, 3
		sleep 200
		Sendinput,{esc}
		ParsedSpecs:=[]
		Loop, parse, Clipboard, `t
			ParsedSpecs.insert(A_LoopField)
		MinLimit:=Parsedspecs[17]
		MaxLimit:=Parsedspecs[18]
		Percision:=Parsedspecs[19]
		FullRequirements:=Parsedspecs[20]
		Units:=Parsedspecs[21]
		sleep 200
		blockinput off
		Sendinput, {esc}
		SimpleClip:=
		copypastetoggle=1
		Critical, Off
		exit
		Return
	}

	PasteSpecs(){
		global
		Critical, On
		winactivate, NuGenesis LMS
		click 57, 715 ; edit Test
		winwaitactive, Test Definition Editor,,0.35
		; if errorlevel
			winactivate, Test Definition Editor
		sleep 400
		click 418, 202
		SpecTab.TestDefinitionEditor(Description) ; the pre window
		sleep 200
		MouseClick, left, 464, 533,1,0
		sleep 250
		MouseClick, left, 245, 489,1,0
		winactivate, Results Definition
		winWaitactive, Results Definition,,0.25
		if errorlevel
			winactivate, Results Definition
		click 84, 65
		winwaitactive, Result Editor,,0.25
		if errorlevel
			winactivate, Result Editor
		sleep 400
		Breaking.Point()
		SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,1,FullRequirements)
		CopyPasteToggle=0
		Critical, Off
		exit
		return
	}

	AddMethod(MethodID){
		winactivate, NuGenesis LMS
		click 67, 562 ; Add Methods
		winwaitactive, Select methods tests,,0.45
		click 235, 69. 2 ; method search bar
		Sendinput, %MethodID%{enter}^{a}{click 506, 337}{click 851, 656} ; add test and hit okay
		sleep 200
		winactivate, NuGenesis LMS
		click 397, 591 ; click attrobutes
		return
	}


;; Run through all the menues to add
	AutoFill(){
		global
		winactivate, ahk_exe eln.exe
		sleep 200
		If winactive("NuGenesis LMS")
		{
			sleep 200
			Breaking.Point()
			click, 57, 719 ;click Edit Test
			Sleep 200
			Breaking.Point()
			winactivate, Test Definition Editor
			sleep 200
		}
		If winactive("Test Definition Editor")
		{
			sleep 200
			Breaking.Point()
			SpecTab.TestDefinitionEditor(Description) ; the pre window
			sleep 200
			MouseClick, left, 464, 532,2,0 ;click scrollbar
			click 239, 246  ;results link
			sleep 200
			winactivate, Results Definition
			sleep 100
			Breaking.Point()

		}
		if winactive("Results Definition") ;Selection window
		{
			winactivate, Results Definition
			sleep 100
			If Method contains ICP-MS 231
				Send,{click 217, 141}
			Send,{click 80, 66} ;click edit
			sleep 200
			winwaitactive, Result Editor,,0.5
			if !errorlevel
				SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,1,1)
			Breaking.Point()
			sleep 400
		}
		If winactive("Result Editor") ;the editing window
		{
			winactivate, Result Editor
			Breaking.Point()
			SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,,1)
			Breaking.Point()
		return
	}
	else
		; Blockinput,off
	return
}


EditSampleTemplate_A(){
	global
	winactivate, Edit sample template
	Breaking.Point()
	Sendinput,{click 377, 82}{home}%Product%`,{space}{Shift down}I{Shift up}n{space}{Shift down}P{Shift up}rocess`,{space}{Shift down}A{Shift up}nalytical{tab 2}{Right 6}{tab}{right 6}{tab}{right}{enter}
	winWaitactive, NuGenesis LMS,,8
	Breaking.Point()
	if !errorlevel
		click, 73, 562
	return
}

EditSpecification_Analytical(){
	global
	winactivate, Edit specification
	Sendinput,{click 376, 87}{home}
	Sendinput, %Product%`,{space}{Shift down}I{Shift up}n{space}{Shift down}P{Shift up}rocess`,{space}{Shift down}A{Shift up}nalytical{tab 4}^a%Product%{tab}{enter}{tab}{space}{enter 2}{Tab}{right}{tab}{right 4}{tab}
	Breaking.Point()
	Sendinput,{right 6}{Tab 2}{Space}{tab 2}{right}{tab}{right}
	Breaking.Point()
	click, 340, 622 ;click okay
	Breaking.Point()
	winwaitactive, NuGenesis LMS, ,8
	if !ErrorLevel
		click, 88, 327 ; click add sample template
	Breaking.Point()
	winwaitactive, Edit sample template,, 8
	if !errorlevel
		SpecTab.EditSampleTemplate_A()
	return
}

;; ___Fill In Test Specs
ResultEditor(Min_Limit,Max_Limit,The_Units,The_Percision,UseLimitsBox:=0,CreateRequirements:=1){ ; 3rd window
	Global
	sleep 200
	click, 250, 140 ; click id box to orient
	sleep 200
	if (Uselimitsbox := 0)
		Sendinput,{tab 2}%The_units%{tab}^{a}%The_Percision%{tab 7}^{a}%Min_Limit%{tab}^a%Max_Limit%{tab 5}^a ;normal
	Sendinput,{tab 2}%The_units%{tab}^{a}%The_Percision%{tab 5}
	sleep 200
	If (UseLimitsBox:=1)
		Send,{space}
	sleep 200
	Sendinput,{tab 2}^a%Min_Limit%{tab}^a%Max_Limit%{tab 5}^a ;normal
	if (Max_limit = ""){
		Sendinput, NLT %Min_Limit% %The_Units%
		exit
	}
	else if (Min_limit = "<"){
		Sendinput, %min_limit%%Max_Limit% %The_Units%
		exit
	}
	else if (Min_limit = ""){
		Sendinput, NMT %Max_Limit% %The_Units%
		Exit
	}
	Else
	{
		If CreateRequirements=1
			Sendinput, %Min_Limit% - %Max_Limit% %The_Units%
		else if CreateRequirements!=1
			Sendinput, %CreateRequirements%
	}
	sleep 400
	Breaking.Point()
	Mouseclick, left, 378, 667,1,0 ; click okay
	sleep 400
	Breaking.Point()
	mousemove, 910, 668
	WinWaitClose, Results Definition,, 8
	winactivate, Test Definition Editor
	mousemove, 335, 617

	return
}

TestDefinitionEditor(The_Description){ ; 2nd window
	Global
	if !(The_description)
	{
		; MouseClick, left, 464, 532,2,0 	;click scrollbar
		sleep 100
		; click 239, 246 					;click results link
		; sleep 100
		return
	}
	else
	{
		winactivate, Test Definition Editor
		DescriptionRaw:=The_Description
		Trimmed_Description:=RTrim(DescriptionRaw, "`r`n")
		sleep 85
		Click, 187, 200
		sleep 200	;Orient
		if Name contains Vitamin C
			Sendinput,{Home}{Delete 12}
		else
			Send, ^{a}
		sleep 100
		sendinput, %Trimmed_Description%
		if strLen(Trimmed_Description) > 100
			sleep 300
		Breaking.Point()
		; MouseClick, left, 464, 532,2,0 	;click scrollbar
		sleep 100
		; click 239, 246 					;click results link
	}
	;Send,{shift down}{Tab 15}{Shift up}{enter}
}

Edit_Physical(){
	Global
	winactivate, Edit specification
	Sendinput,{click 376, 87}{home}
	Sendinput,%Product%`,{space}{shift down}I{shift up}n{shift down}{space}P{shift up}rocess`,{space}{shift down}P{shift up}hysical{tab 3}^a{backspace}
	Breaking.Point()
	Sendinput,{tab}^a%Product%{tab 2}
	Breaking.Point()
	Sleep 200
	Send,{Space}
	sleep 200
	Breaking.Point()
	winwaitactive, Products List, , 8
	if !errorlevel
		sleep 300
	Send,{enter 2}
	sleep 200
	Breaking.Point()
	Send,{tab}
	sleep 200
	Send,{right}
	sleep 300
	Breaking.Point()
	click, 340, 622 ;click okay
	winwaitactive, NuGenesis LMS, ,8
	if !errorlevel
		sleep 300
	Breaking.Point()
	click, 70, 518 ;edit sample method
	sleep 499
	winwaitactive, Edit sample template,,4
	if !errorlevel
		sleep 200
	Breaking.Point()
	Sendinput,{tab}{delete 4}%Product%{enter}
	sleep 200
	Breaking.Point()
	winwaitactive, NuGenesis LMS,,5
	If !ErrorLevel
		MouseMove, %premx%, %premy%, 0
	click
	return
}

Edit_CoatedRetain(){
	global
	winactivate, Edit specification
	Sendinput,{click 376, 87}{home}
	Breaking.Point()
	Sendinput,%Product%`,{space}{shift down}C{shift up}oated`,{space}{shift down}R{shift up}etain{tab 4}^a%Product%{tab}{enter}{tab}{space}{Return 2}
	sleep 400
	Send,{tab}{right}
	sleep 200
	Breaking.Point()
	Send,{tab}{right}{tab 3} ;{left 4}
	sleep 200
	Breaking.Point()
	click, 340, 622 ;click okay
	winwaitactive, NuGenesis LMS, ,5
	if !errorlevel
		LMSclick.EditSampleTemplate()
	Breaking.Point()
	Sendinput,{tab}^{a}%Product%`,{space}{Shift down}C{shift up}oated`,{space}{shift down}R{shift up}etain
	sleep 300
	Breaking.Point()
	send, {enter}
	sleep 300
	winwaitactive, NuGenesis LMS,,5
	If !ErrorLevel
		MouseMove, %premx%, %premy%, 0
	; click
	Breaking.Point()
	return
}

Edit_CoatedPhysical(){
	global
	winactivate, Edit specification
	Sendinput,{click 376, 87}{home}
	Sendinput,%Product%`,{space}{shift down}C{shift up}oated`,{space}{shift down}P{shift up}hysical{tab 4}^a%Product%{tab}{enter}{tab}{space}{Return 2}
	sleep 400
	Send,{tab}{right}
	Breaking.Point()
	sleep 200
	Send,{tab}{right}{tab} ;{left 4}
	Breaking.Point()
	sleep 200
	Breaking.Point()
	click, 340, 622 ;click okay
	sleep 50
	winwaitactive, NuGenesis LMS,,5
	if !errorlevel
		LMSclick.EditSampleTemplate()
	Breaking.Point()
	Sendinput,{tab}^{a}%Product%`,{space}{Shift down}C{shift up}oated`,{space}{shift down}P{shift up}hysical
	sleep 300
	winwaitactive, NuGenesis LMS,,5
	If !ErrorLevel
		MouseMove, %premx%, %premy%, 0
	; click
	return
}

Edit_Retain(){
	Global
	winactivate, Edit specification
	Sendinput,{click 376, 87}{home}
	Sendinput,%Product%`,{space}{shift down}I{shift up}n{space}{shift down}P{shift up}rocess`,{space}{shift down}R{shift up}etain{tab 4}^a%Product%{tab}{enter}{tab}{space}{Return 2}
	Breaking.Point()
	sleep 200
	Send,{tab}{right}
	sleep 400
	Send,{tab}{right}
	sleep 1500
	Breaking.Point()
	winWaitactive, Edit specification,, 1
	if !errorlevel
		click, 340, 622 ;click okay
	Breaking.Point()
	winwaitactive, NuGenesis LMS, ,4
	if !errorlevel
		sleep 300
	Breaking.Point()
	LMSclick.EditSampleTemplate()
	sleep 300
	Breaking.Point()
	Sendinput,{tab}{delete 4}%Product%{enter}
	sleep 300
	winwaitactive, NuGenesis LMS,,5
	If !ErrorLevel
		MouseMove, %premx%, %premy%, 0
	; click
	return
}
Edit_Analytical(){
	Global
	Breaking.Point()
	If winactive("Edit sample template")
		SpecTab.EditSampleTemplate_A()
	else If winexist("Edit specification")
	{
		winactivate,
		Breaking.Point()
		SpecTab.EditSpecification_Analytical()
	}
	return
}

Edit_Micro(){
	Global
	winactivate, Edit specification
	Sendinput,{click 376, 87}{home}
	Send,%Product%`,{space}{shift down}F{shift up}inished`,{space}{shift down}M{shift up}icro{tab 4}^a%Product%{tab 2}
	Sleep 200
	Send,{Space}
	sleep 200
	winwaitactive, Products List, ,2
	Send,{enter 2}
	sleep 200
	Send,{tab}
	sleep 200
	Breaking.Point()
	Send,{right}{tab}{left 2}{enter}
	winwaitactive, NuGenesis LMS, ,4
	if !errorlevel
		sleep 300
	Breaking.Point()
	LMSclick.EditSampleTemplate()
	sleep 300
	Breaking.Point()
	Sendinput,{tab}{delete 4}%Product%{enter}
	sleep 300
	winwaitactive, NuGenesis LMS,,5
	If !ErrorLevel
		MouseMove, %premx%, %premy%, 0
	; click
	return
}

InsertDescription(){
	Global
	DescriptionRaw:=Description
	Description:=RTrim(DescriptionRaw, "`r`n")
	Sendinput,^a%Description%
	Return
}

HM_ReportOnly(){
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor,,4
	Sendinput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	click 390, 659	;click okay
	winWaitClose, Result Editor,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor,,4
	Sendinput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	click 390, 659	;click okay
	winWaitClose, Result Editor,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor,,4
	Sendinput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	click 390, 659	;click okay
	winWaitClose, Result Editor,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor,,4
	Sendinput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	click 390, 659	;click okay
	return
}

HM_USP(){
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor,,4
	Sendinput,{tab 5}mcg/day{tab 7}{space}{tab 3}15{tab 5}NMT 15 mcg/day
	click 390, 659	;click okay
	winWaitClose, Result Editor,,4
	click 125,130 ;click 1st row
	; click 125,150 ;click 2nd row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor,,4
	Sendinput,{tab 5}mcg/day{tab 7}{space}{tab 3}5{tab 5}NMT 5 mcg/day
	click 390, 659	;click okay
	winWaitClose, Result Editor,,4
	click 125,130 ;click 1st row
	; click 125,190 ;click 3rd row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor,,4
	Sendinput,{tab 5}mcg/day{tab 7}{space}{tab 3}5{tab 5}NMT 5 mcg/day
	click 390, 659	;click okay
	winWaitClose, Result Editor,,4
	click 125,130 ;click 1st row
	; click 125,210 ;click 4th row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor,,4
	Sendinput,{tab 5}mcg/day{tab 7}{space}{tab 3}15{tab 5}NMT 15 mcg/day
	click 390, 659	;click okay
	return
}

HM_Canada(){
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor,,4
	Sendinput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab}9.8{tab 5}NMT 9.8 mcg/day
	click 390, 659	;click okay
	Breaking.Point()
	winWaitClose, Result Editor,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	Breaking.Point()
	winwaitactive, Result Editor,,4
	Sendinput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab}9.8{tab 5}NMT 9.8 mcg/day
	click 390, 659	;click okay
	winWaitClose, Result Editor,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	Breaking.Point()
	winwaitactive, Result Editor,,4
	Sendinput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab}6.3{tab 5}NMT 6.3 mcg/day
	click 390, 659	;click okay
	winWaitClose, Result Editor,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	Breaking.Point()
	winwaitactive, Result Editor,,4
	Sendinput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab}20.3{tab 5}NMT 20.3 mcg/day
	click 390, 659	;click okay
	return
}

HM_Prop65(){
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winactivate, Result Editor
	winwaitactive, Result Editor,,4
	Sendinput,{tab 12}{space}{tab 2}^{a}
	;Sendinput,{tab 5}mcg/day{tab 7}{tab 2}^a
	Sendinput, 0{tab}^{a}
	sleep 100
	Sendinput, 9.999{tab 5}^a<10 mcg/day
	click 390, 659	;click okay
	winWaitClose, Result Editor,,4
	winactivate, Result Definition
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor,,4
	Sendinput,{tab 12}{space}{tab 2}^a
	;Sendinput,{tab 5}mcg/day{tab 7}{tab 2}^a
	Sendinput, 0{tab}^a
	sleep 100
	Sendinput, 0.499{tab 5}^a<0.5 mcg/day
	click 390, 659	;click okay
	winWaitClose, Result Editor,,4
	winactivate, Result Definition
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor,,4
	Sendinput,{tab 12}{space}{tab 2}^a
	;Sendinput,{tab 5}mcg/day{tab 7}{tab 2}^a
	Sendinput, 0{tab}^a
	sleep 100
	Sendinput, 4.099{tab 5}^a<4.1 mcg/day
	click 390, 659	;click okay
	winWaitClose, Result Editor,,4
	winactivate, Result Definition
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor,,4
	Sendinput,{tab 12}{space}{tab 2}^a
	;Sendinput,{tab 5}mcg/day{tab 7}{tab 2}^a
	Sendinput, 0{tab}^a
	sleep 100
	Sendinput, 0.299{tab 5}^a<0.3 mcg/day
	click 390, 659	;click okay
	return
}
}
WM_Lbuttondown:
Spec_Table:
	if (A_GuiEvent = "NORMAL" ){
		; if (A_GuiEvent := "I" ){

		Sendinput,{space}
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
		mx:=
		my:=
		If Coated = "ERROR"
		Coated:=
		If Lot = "ERROR"
		lot:=
		setwindelay, 280
		; blockinput, on
		ControlGetText, Iteration, Edit5, VarBar
		ifwinactive, Register new samples
			MouseGetPos, mx, my
		click 2
		sleep 200
		sleep 200
		winwaitactive, Edit sample (Field Configuration,, 2
			if ErrorLevel
				sleep 800
			Sendinput, {tab 2}{right}{click 277, 139}{tab 6}
			Ifwinactive, Edit sample (Field Configuration: F`, Micro)
				Send, {tab}^{a}
			Sendinput, ^{a}%Batch%{tab}^{a}
			Ifwinactive, Edit sample (Field Configuration: F`, Micro)
				{
					Sendinput,^{a}%Lot%{tab 3}
					sleep 100
					if Coated
						Sendinput, ^{a}%Coated%
					sleep 100
					Sendinput, +{tab 2}
				}
			Ifwinactive, Edit sample (Field Configuration: CT`,
				{
					Sendinput, {tab}
					Send, ^{a}%Coated%
					Sendinput, +{tab}
				}
			Breaking.Point()
			sleep 200
			; If !CustomerPosition
				; This.CustomerMenu()
			; else				if CustomerPosition > 0
				if Iteration > 0
					CustomerPosition:= Iteration + 1
				if Iteration < 0
					CustomerPosition:= Iteration - 1
					; Iteration-=1
			WorkTab.Dropdown_CustomerSelect(CustomerPosition)
			Breaking.Point()
			; sleep 800
			Send, {enter}
			sleep 200
			; blockinput, off
			winactivate, Register new samples
			; sleep 300
			my:=my+30
			MouseMove, mx, my
			setwindelay, 100

			return
		}

		CustomerMenu() { ;; create a dropdown from CustomerMenu ini datafile
			global
			try menu, Menu, DeleteAll
			if winactive("Edit sample (Field Configuration: F, Micro)")
				send {click 421, 504}
			else ;if winactive("Edit sample (Field Configuration")
				Send, {Click 425, 434}
			Loop, Read, \\10.1.2.118\users\vitaquest\mmignin\RemoteVQ\Customers.ini
			{
				If A_Index = 1
					Continue
				MenuItems := StrSplit(A_LoopReadLine, "=")
				Selection:= % MenuItems[1]
				Menu, Menu, add, &%Selection%, CustomerMenu
			}
			Menu, Menu, Show,
			return
			CustomerMenu:
				sleep 200
				InputVar:=StrReplace(A_ThisMenuItem, "&", "")
				; InputVar:=A_ThisMenuItem
				IniRead,CustomerPosition, \\10.1.2.118\users\vitaquest\mmignin\RemoteVQ\Customers.ini, Customers, %InputVar%
				sleep 20
				menu, Menu, DeleteAll
				if CustomerPosition > 0
					customerPosition+=1
				if CustomerPosition < 0
					customerPosition-=1
				sleep 200
				this.Dropdown_CustomerSelect(CustomerPosition)
			return
		}

		Dropdown_CustomerSelect(A_ShipTo){
			sleep 100
			Critical, on
			setkeydelay, -1,-1
			AbsSelection:=Abs(A_ShipTo)-1
			if (a_shipto = "-1")
				Sendinput,{end}
			else if (a_shipTo = 1)
				Sendinput,{home}
			else if (a_ShipTo > 1)
				Sendinput,{home}{right %A_ShipTo%}
			else if (a_ShipTo < 1)
				Sendinput,{end}{left %Absselection%}
			; else
				; sleep 400
			; if (a_shipto > 175) || (absselection > 175)
			; 	sleep 500
			; if winactive("Edit sample `(Field Configuration:")
				; sleep 800
			setkeydelay, 0, 0
			critical, off
			return
		}

		NewRequest(){
			global
			SetwinDelay, 550
			department:= ; Clip()
			Clipboard:=
			winactivate, NuGenesis LMS
			click
			Send, ^c
			clip()
			sleep 400
			click 64, 300 ;click Assign To New rewuest link
			Breaking.Point()
			winwaitactive, Edit request,,3
			if !Errorlevel
				sleep 200
			winactivate, Edit request,
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
			Send,{tab}{ctrldown}{a}{ctrlup}
			input, , V T3,{Lbutton}{enter}
			click 504, 338 ; click arrow
			winactivate, Select tests for request
				click, right, 264, 590 ; click to clear filter
			Send,{up}{enter}
			sleep 100
			winactivate, Select tests for request
				sleep 100
			winactivate, Select tests for request
				Breaking.Point()
			click 854, 657 ; click okay
			winwaitclose, Select tests for request,,3
				if !Errorlevel
				winWaitactive, Edit request
			Breaking.Point()
			While GetKeyState("Lbutton", "p")
				sleep 100
			Ifwinnotactive, Edit request
				exit
			Sleep 100
			winactivate, Edit request
			Breaking.Point()
			Send,{tab}{enter}
			; tooltip,
			setwindelay, 100
			return
		}

		ChangeTestResults(Checkbox_Toggle:=0,MoveNext:=""){
			global

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
					sleep 100
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
			Sendinput,{tab}{Space}{tab}{Space}
		else
			Sendinput,{tab}{tab}
		Sendinput,{tab 10}^a
		sleep 100
		if Checkbox_Toggle Contains toggle
			return
		Send, %Iteration%
		sleep 100
		if Checkbox_Toggle Not Contains toggle
			mousemove, xpos, ypos+26,0

		return
	}

	AddSampleLog(count)
	{
		global
		setwindelay, 100
		loop, %count%
		{
			click 46, 877
			if !winactive("Edit test (Field Configuration: ")
				winwaitactive, Edit test (Field Configuration: ,, 2
				Send,{Click, 402, 284}{end}(on sample log){click, 334, 618}
				winwaitactive, NuGenesis LMS,,2
				sleep 300
				winactivate, NuGenesis LMS
				sleep 500
				Send,{click, 1290, 703}{down %A_index%}
			}
			return
		}

		Main_EditResults()
		{
			Sendinput,{click}{click 77, 751} ;edit results
			winwaitactive, Results Definition,,3
			return
		}
		AddTestDescription(Text){
			Sendinput,{click 305, 294}{end}%TEXT%{click 330, 617}
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
				send, {click 212, 188} ; select Batches
				sleep 400
				Send, {click 136, 119}^a ;flick filter box
				if winactive("Select samples for test: Organoleptic Sensory Test") || winactive("Select samples for test: Average Capsule Weight") || winactive("Select samples for test: Average Tablet Weight")
					Department:="Physical"
				if winactive("Select samples for test: Microbiological")
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
				tt(Department)
				blockinput off
				setwindelay, 100
			return
		}

		CopyProductRotation(){
			global
			clipboard:=
			send, ^c
			clipwait, 1
			sleep 400
			filename:= "C:\Users\mmignin\Documents\VQuest\Data\Rotations\" Product ".txt"
			FileDelete, %FileName%
			FileAppend, %Clipboard%, %Filename%
			LMSwb:=ComObjactive("Excel.Application")
			Rotation:=lmswb.activeSheet.Range("A:A").Find(Product).offset(0,5)
			Rotation.Value:=Product ".txt"
			; iniwrite %Clipboard%, Settings.ini, Rotations, %Product%
		}

		PasteProductRotation(){
			global
			filename:= "C:\Users\mmignin\Documents\VQuest\Data\Rotations\" Product ".txt"
			FileRead, Clipboard, %Filename%
			; iniread Clipboard,Settings.ini, Rotations, %Product%
			LMSwb:=ComObjactive("Excel.Application")
			RotationDone:=lmswb.activeSheet.Range("A:A").Find(Product).offset(0,6)
			RotationDone.Value:="1"
			sleep 200
			send, ^v
		}
	}

	;;edit

	class LMSclick {
		OKay(sleeptime:=""){
			global
			sleep %Sleeptime%
			if winactive("Results Definition")
				clk(1336,592)
			else If winactive("Result Editor")
				clk(370,660)
			else if Edit Ingredient
				clk(265, 561)
			else if winactive("Result Entry")
				clk(1028, 860)
			else if winexist("Delete Test") {
				winactivate, Delete Test
				clk(229, 136)
			}
			else if winactive("Results Definition")
				clk(951, 751)
			; else if winactive("Barcode Scanner")
			; Send, {enter},
			else if winactive("Microsoft Excel Security Notice")
				Send, !y
			else if winactive("Reason For Change")
				clk(229, 236)
			else if winactive("New Document")
				clk(415, 360)
			else if winactive("Edit specification")
				clk(323, 621)
			else if winactive("Reason for Change")
			Return clk(170, 331)
		else if winexist("Error") {
			winactivate
			clk(148, 104)
			winactivate, Register new samples
			clk(181, 104, 2)
			Send, %product%{enter}
		}
		else if winexist("Change Configuration")
			clk(131, 296,"Change Configuration")
		Else
			Send,{enter}
		return
	}

	esc(){
		if winexist("Change Configuration")
			click 342, 296
		Else
			Send,{esc}
		return
	}

	Save(){
		if winactive("Edit Product")
			click 275, 578
		else If winactive("Composition")
			click 1236, 888
		else If winactive("Test Definition Editor ")
			Click 341, 618
		Else
			return
	}
	edit(){
		if winactive("Results Definition")
			click 78,63
		else
			click 84, 65
		return
	}
	Add(){
		if winactive("Formulation")
			click, 73, 280
		else
			click 45, 65
		return
	}
	Requests_tab(){
		click 865,83
		return
	}
	MyWork_Tab(){
		click 761,44
		return
	}
	Mywork_Searchbar(){
		click 500,127, 2
		return
	}
	EditTest_1(){
		ifwinnotactive, NuGenesis LMS
			winactivate, NuGenesis LMS
		Send,{click, 56, 784 }
		return
	}
	EnterResults(){
		winactivate, NuGenesis LMS
		winactivate, NuGenesis LMS
		click 74, 900
		return
	}

	Orient(){
		if winactive("Result Entry")
			click 843, 202, 2
		else if winactive("Test Definition Editor")
			Click, 187, 200

		Else
			return
	}
	CopySpecTemplate(){
		winactivate, NuGenesis LMS
		click 102, 289 ;copy into new spec
		winWaitactive, Edit specification - Remote, ,1
		if ErrorLevel
			winactivate, Edit specification - Remote
		; click 317, 83
		; sleep 100
		return
	}
	NewSampleTemplate(){
		winactivate, NuGenesis LMS
		click 103, 325
		return
	}

	EditSampleTemplate(){
		winactivate, NuGenesis LMS
		click 70, 518
		winwaitactive, Edit sample template,, 5
		return
	}
}

Heavy_metals:
	if (A_ThisMenuItem = "USP Heavy Metal")
		SpecTab.HM_USP()
	else if (A_ThisMenuItem = "Canada Heavy Metal")
		SpecTab.HM_Canada()
	else if (A_ThisMenuItem = "Prop65 Heavy Metal")
		SpecTab.HM_Prop65()
	else if (A_ThisMenuItem = "Report Only Heavy Metal")
		SpecTab.HM_ReportOnly()
	else
		Menu,Menu, deleteAll
return

Autofill:
	if A_thismenuitem contains &Analytical
		SpecTab.Edit_Analytical()
	; else if A_thismenuitem contains &Coated_Retain
	; 	SpecTab.Edit_CoatedRetain()
	; else if A_thismenuitem contains &Coated_Physical
	; 	SpecTab.Edit_CoatedPhysical()
	; else if A_thismenuitem contains &Retain
	; 	SpecTab.Edit_Retain()
	; else if A_thismenuitem contains &Micro
	; 	SpecTab.Edit_Micro() ; copyMicro spec tests
	; else if A_thismenuitem contains &Physical
	; 	SpecTab.Edit_Physical()
	else if A_thismenuitem contains Copy &Specs
		SpecTab.CopySpecs()
	else if A_thismenuitem contains Paste &Specs
		SpecTab.PasteSpecs()
	else if A_thismenuitem contains Copy &Template
		SpecTab.CopySpecTemplate()
	else if A_thismenuitem contains New &Request
		WorkTab.NewRequest()
	else if (A_ThisMenuItem = "&USP Heavy Metal")
		SpecTab.HM_USP()
	else if (A_ThisMenuItem = "&Canada Heavy Metal")
		SpecTab.HM_Canada()
	else if (A_ThisMenuItem = "&Prop65 Heavy Metal")
		SpecTab.HM_Prop65()
	else if (A_ThisMenuItem = "&Report Only Heavy Metal")
		SpecTab.HM_ReportOnly()
	else if (A_ThisMenuItem = "&Delete Retain")
		WorkTab.DeleteRetain()
	Menu,Menu, deleteAll
return



LMS_Env:
	IfwinExist, Login,
		winactivate, Login
	sleep 200
	Send,mmignin{tab}Kilgore7744
	if A_thismenuItem contains &Login
		Send,{enter}
	else if A_thismenuItem contains &Production Server
		SwitchEnv("Prd")
	else if A_thismenuItem contains &Test Server
		SwitchEnv("Test")
	else
		Menu,Menu, deleteall
return


SwitchEnv(ServerEnv){
	sleep 200
	Send,{Tab}{Tab}{down} ; winwaitactive, Change Configuration ahk_class Transparent windows Client
	sleep 200
	Send,{Home}{Right}{Right}{Right}{Right}{LShift down}{End}{End}{LShift up}%ServerEnv%{Tab}{Tab}{Tab}{Tab}{Enter}
	sleep 200 ; winwaitactive, Login ahk_class Transparent windows Client
	Send,{Enter}
}
