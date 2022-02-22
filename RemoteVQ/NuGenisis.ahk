Return

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
	IniRead,ShipToIndex, Data\customers.ini, Customers, %Customer%
	; if !ShipTo
	; ShipTo:=ShipToIndex
	return ShiptoIndex
}

Class LMS { 			;;_____________________Generl LMS_________________________

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
			Menu, Menu, add, Paste All &Products, F19 & left
			Menu, Menu, add, Paste All &Batches, F19 & right

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
			Menu, Menu, add, &Physical, AutoFill
			Menu, Menu, add, &Micro, AutoFill
			Menu, Menu, add, &Retain, AutoFill
			Menu, Menu, add, &Coated_Physical, AutoFill
			Menu, Menu, add, &Coated_Retain, AutoFill
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
		if winactive("Edit specification"){
			Menu,Menu, add, Departments, Autofill
			Menu, DepartmentsMenu, add, Analytical, AutoFill
			Menu, DepartmentsMenu, add, Physical, AutoFill
			Menu, DepartmentsMenu, add, Micro, AutoFill
			Menu, DepartmentsMenu, add, Retain, AutoFill
			Menu, DepartmentsMenu, add, Coated_Physical, AutoFill
			Menu, DepartmentsMenu, add, Coated_Retain, AutoFill
			Menu,Menu, add, departments, :DepartmentsMenu
			Try Menu,menu,show
			return
		}
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
		; if !winactive("ahk_exe eln.exe")
			; winactivate, ahk_exe eln.exe
		; if (Lms.Filter()=On) {
		; 	Lms.FilterBar(Code,PostCmd)
		; 	Send, {ctrlup}
		; 	return
		; }
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
		Batches:=[]
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
	; CoordMode, mouse, window
	; FoundSamples:=
	; FoundRequests:=
	; FoundDocuments:=
	; winGetPos,Nux,NuY,NuW,NuH, NuGenesis LMS
	winGetPos,Nux,NuY,NuW,NuH,NuGenesis LMS
	; winGetPos,WbX,WbY,WbW,WbH, Mats LMS Workbook.xlsb - Excel
	; winGetPos, VarBar_X, VarBar_Y,Varbar_W,Varbar_H, VarBar ahk_exe AutoHotkey.exe
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
	; PixelSearch, FoundSamples, FoundY, SamplesTab, MyWorkTabs, SamplesTab+2, MyWorkTabs+2, 0xfffd353, 10, Fast RGB
	; if FoundSamples
	; 	Tab:="Samples"
	; PixelSearch, FoundRequests, FoundY, RequestsTab, MyWorkTabs, RequestsTab+2, MyWorkTabs+2, 0xffd353, 10, Fast RGB
	; If FoundRequests
	; 	Tab:="Requests"
	; PixelSearch, FoundDocuments, FoundY, DocumentsTab, yWorkTabs, DocumentsTab+2, yWorkTabs+2, 0xffd353, 10, Fast RGB
	; If FoundDocuments
	; 	Tab:="Documents"
	; PIXELSEARCH, FoundSpecs, FoundY, 13, 355, 15, 358, 0xeaeff3, 10, Fast RGB ;icon on
	; tt(Tab)
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

Class ProductTab { ;;__________________ProductTab Class_____________________
	EditIngredient(Ingredient_Name,Ingredient_Claim,Ingredient_Position,Ingredient_Id){
		Global
		;; the final input window for adding ingredients

		; Ingredient_Name:=Trim(Ingredient_Name,"`r`n")
		; Ingredient_Id_count:=Trim(Ingredient_Id_count)
		; Ingredient_Id_count:=Format("{:d}", Ingredient_Id_count)
		; Ingredient_Claim:=Trim(Ingredient_Claim,"`r`n")
		; Ingredient_position:=Trim(Ingredient_Position,"`r`n")
		; sleep 120
		; ifwinactive, Edit Ingredient
		; ifwinactive, Edit Ingredient
			; this.DropdownSelect(Ingredient_Id_count)
		ifwinnotexist, Edit Ingredient
		{
			winactivate, Composition
			; Breaking.Point()
			click 57, 65
			;sleep 50
			sleep 50
			; Breaking.Point()
			this.DropdownSelect(Ingredient_Id)
		; winactivate, Edit Ingredient
			; sleep 100
		}
		; Excel.Get_Current_row()
		sleep 50
		if winactive("Composition")
		return

	Sendinput,{tab 6}^a%Ingredient_position%{tab}^a
	Sendinput,%Ingredient_Name%
	; sleep 100
	If Ingredient_Claim contains Heavy Metal,Allergens
		Sendinput,{tab}
	Sendinput,{tab 2}^a
	Sendinput,%Ingredient_Claim%

	; Current_Row:= Current_Row+1

	Breaking.Point()
	ifwinexist, Duplicate ingredient ID
		exit
	If !ManualInput
		Send,{enter}
	Tooltip,
	sleep 300
	ManualInput:=
	Breaking.Point()
	return
}

DropdownSelect(A_DropdownCount){
	global
	ifWinNotActive, Edit Ingredient
		winactivate, Edit Ingredient
	click, 150, 73 ;click dropdown box
	sleep 100
		; msgbox % a_DropdownCount
	AbsSelection:=Abs(A_DropdownCount)
	; Breaking.Point()
	if (A_DropdownCount > 0)
		Sendinput, {tab}{home}{right %A_DropdownCount%}
	Breaking.Point()
	if (A_DropdownCount < 0)
		Sendinput, {tab}{end}{left %AbsSelection%}
	Breaking.Point()
	if (A_DropdownCount = "-0")
		Sendinput, {tab}{end}
	if (a_DropdownCount = ""){
		; msgbox % a_DropdownCount
		this.Dropdown_Ingredient(Iteration)
		Breaking.Point()
		if Iteration >=20
			iteration:=0
		varbar.AddIteration(0)
	}
	Breaking.Point()
	return
}


Blends(n,Measurment){
	global ServingSize, Color, ShapeAndSize
	setwindelay, 260
	winactivate, Edit Formulation
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
	If !ShapeAndSize
		ShapeAndSize:= " g"
	Send, Each %textNumber% (%n%){space}%measurment%%plural% (%ShapeAndSize%) contains{left 12}{tab 2}^{a}%color%+{tab}^{a}Blend+{tab}
	setwindelay, 60
	exit
}

EditProduct(){ ;for naming Product code and customer,
	global Product, Name, Customer, ShapeAndSize, color
	setwindelay, 260
	Excel.Connect(1)
	click 120,80 ;click product box
	Sendinput,%Product%`,{space}%Name%{tab 2}%Customer%{tab 2}{right 2}{tab}{right 3}{tab}%Product%{tab 2}
	sleep 200
	Sendinput,%Name%{tab 8}
	sleep 400
	winwaitactive,NuGenesis LMS,,20
	winactivate, NuGenesis LMS
	click, 67, 283
	sleep 200
	Breaking.Point()
	This.EditFormulation()
	; clk(287, 578) ;click save
	Iteration:=1
	return
	setwindelay, 60
}

EditFormulation(){ ;then click on Edit Formulation, puts in code, then tabs to serving size
	global Product, ShapeAndSize, color, ServingSize, ServingType
	if !winactive("Edit Formulation") && winexist("Edit Formulation")
		winactivate, Edit Formulation,
	Send, {tab}%product%
	Send, {Tab 23} ;{click 268, 578}
	sleep 200
	Breaking.Point()
	; if (ServingSize=1 ? "(" ServingSize ")" : "Two (" ServingSize ")" ) ;|| ServingSize=2 || ServingSize=3 || ServingSize=4)
	;  send, Each %ServingType% {space} contains {ctrl down}{left}{ctrl up}{left}
	; if ShapeAndSize
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
	Producttab.Table()

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

Dropdown_Ingredient(IterationCount:=""){
	global

	; if (GeneralCount=2){
	; Sendinput,{tab}{Home}{right 2}{right 62}
	; return
	; }
	if !(IterationCount) {
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
		Menu,IngredientMenu,Add,Ingredient Note 1,IngredientMenuHandler
		Menu,IngredientMenu,Add,Ingredient Note 2,IngredientMenuHandler
		Menu,IngredientMenu,Add,Ingredient Note 3,IngredientMenuHandler
		Menu,IngredientMenu,Add,Ingredient Note 10,IngredientMenuHandler
		Menu,IngredientMenu,Add,Methylsulfonylmethane (MSM),IngredientMenuHandler
		Menu,IngredientMenu,Add,Protein,IngredientMenuHandler
		Menu,IngredientMenu,Add,Total Probiotic,IngredientMenuHandler
		Menu,IngredientMenu,Add,Manual,IngredientMenuHandler
		Menu,IngredientMenu,Add,STOP,IngredientMenuHandler
		Menu,IngredientMenu,Show,
		return
	}
	else {
		GeneralCount:=IterationCount
		gosub, IngredientMenuHandler
	}
	return
}

}

IngredientMenuHandler:
	Breaking.Point()
	; tt(GeneralCount)
	Click 150, 73
	Breaking.Point()
	; if !GeneralCount
	; clk(150, 73)
	; GeneralCount=1
	; tt(GeneralCount)
	if (A_ThisMenuItem ="Generic Ingredient &A" || GeneralCount=1)
		Sendinput,{tab}{Home}{right 10}{right 56}
	else if (A_ThisMenuItem ="Generic Ingredient &B" || GeneralCount=2)
		Sendinput,{tab}{Home}{right 10}{right 62}
	else if (A_ThisMenuItem ="Generic Ingredient &C" || GeneralCount=3)
		Sendinput,{tab}{Home}{right 10}{right 68}
	else if (A_ThisMenuItem ="Generic Ingredient &D" || GeneralCount=4)
		Sendinput,{tab}{home}{right 10}{right 74}
	else if (A_ThisMenuItem ="Generic Ingredient &E" || GeneralCount=5)
		Sendinput,{tab}{Home}{right 10}{right 80}
	else if (A_ThisMenuItem ="Generic Ingredient &F" || GeneralCount=6)
		Sendinput,{tab}{Home}{right 10}{right 86}
	else if (A_ThisMenuItem ="Generic Ingredient &G" || GeneralCount=7)
		Sendinput,{tab}{Home}{right 10}{right 92}
	else if (A_ThisMenuItem ="Generic Ingredient &H" || GeneralCount=8)
		Sendinput,{tab}{Home}{right 10}{right 93}
	else if (A_ThisMenuItem ="Generic Ingredient &I" || GeneralCount=9)
		Sendinput,{tab}{Home}{right 10}{right 95}
	else if (A_ThisMenuItem ="Generic Ingredient &J" || GeneralCount=10)
		Sendinput,{tab}{Home}{right 10}{right 97}
	else if (A_ThisMenuItem ="Generic Ingredient &K" || GeneralCount=11)
		Sendinput,{tab}{Home}{right 10}{right 99}
	else if (A_ThisMenuItem ="Generic Ingredient &L" || GeneralCount=12)
		Sendinput,{tab}{Home}{right 10}{right 100}
	else if (A_ThisMenuItem ="Generic Ingredient &M" || GeneralCount=13)
		Sendinput,{tab}{Home}{right 10}{right 101}
	else if (A_ThisMenuItem ="Generic Ingredient &N" || GeneralCount=14)
		Sendinput,{tab}{Home}{right 10}{right 102}
	else if (A_ThisMenuItem ="Generic Ingredient &O" || GeneralCount=15)
		Sendinput,{tab}{Home}{right 10}{right 103}
	else if (A_ThisMenuItem ="Generic Ingredient &P" || GeneralCount=16)
		Sendinput,{tab}{Home}{right 10}{right 104}
	else if (A_ThisMenuItem ="Generic Ingredient &Q" || GeneralCount=17)
		Sendinput,{tab}{Home}{right 10}{right 105}
	else if (A_ThisMenuItem ="Generic Ingredient &R" || GeneralCount=18)
		Sendinput,{tab}{Home}{right 10}{right 106}
	else if (A_ThisMenuItem ="Generic Ingredient &S" || GeneralCount=19)
		Sendinput,{tab}{Home}{right 10}{right 107}
	else if (A_ThisMenuItem ="Generic Ingredient &T" || GeneralCount=20)
		Sendinput,{tab}{Home}{right 10}{right 108}
	else if (A_ThisMenuItem ="Generic Ingredient &U" || GeneralCount=21)
		Sendinput,{tab}{Home}{right 10}{right 109}
	else if (A_ThisMenuItem ="Generic Ingredient &V" || GeneralCount=22)
		Sendinput,{tab}{Home}{right 10}{right 110}
	else if (A_ThisMenuItem ="Generic Ingredient &W" || GeneralCount=23)
		Sendinput,{tab}{Home}{right 10}{right 111}
	else if (A_ThisMenuItem ="Generic Ingredient &X" || GeneralCount=24)
		Sendinput,{tab}{Home}{right 10}{right 112}
	else if (A_ThisMenuItem ="Generic Ingredient &Y" || GeneralCount=25)
		Sendinput,{tab}{Home}{right 10}{right 113}
	else if (A_ThisMenuItem ="Generic Ingredient &Z" || GeneralCount=26)
		Sendinput,{tab}{Home}{right 10}{right 114}
	else if (A_ThisMenuItem ="Ingredient Note 1")
		Sendinput,{tab}{Home}{right 10}{right 140}
	else if (A_ThisMenuItem ="Ingredient Note 10")
		Sendinput,{tab}{Home}{right 10}{right 141}
	else if (A_ThisMenuItem ="Ingredient Note 2")
		Sendinput,{tab}{Home}{right 10}{right 143}
	else if (A_ThisMenuItem ="Ingredient Note 3")
		Sendinput,{tab}{Home}{right 10}{right 144}
	else if (A_ThisMenuItem ="Total Probiotic" || GeneralCount=-1)
		Sendinput,{tab}{End}{Left 20}
	else if (A_ThisMenuItem ="Manual"){
		Sendinput,{tab}{Home}
		ManualInput=1
	}
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
		GUI,Ingredient_Table:submit,NoHide
		Rows_left:=((LV_GetCount()-A_EventInfo)*Autoenter)+1
		Current_Row:=A_EventInfo
		Loop % Rows_left {
			Excel.Get_Current_row()
			ProductTab.EditIngredient(LabelName,LabelClaim,Position,DropdownCount)
			if winactive("Duplicate ingredient ID") || winactive("NuGenesis LMS") || winactive("Edit Formulation") || winactive("Warning")
				break
			sleep 100
		}
	}
return

Ingredient_TableGuiClose:
	sleep 100
	GUI,Ingredient_Table:destroy

return

return
class SpecTab { 	;;  	 ________________SpecTab class__________________
/*
	Table(){
		Global
		ShiftTable_X:=-350
		ShiftTable_Y:=50
		Try GUI, Spec_Table:destroy
		CoordMode, mouse, window
		;  CoordMode, , Screen
		ifwinnotactive, ahk_exe eln.exe
			winactivate, ahk_exe eln.exe
		winGetPos, LMS_X, LMS_Y, LMS_w, LMS_h, A

		; Iniread, SpecTable_X, Settings.ini, Locations, SpecTable_X
		; Iniread, SpecTable_Y, Settings.ini, Locations, SpecTable_Y
		CoordMode, mouse, window
		SpecTable_X:=LMS_w+LMS_X+ShiftTable_X
		SpecTable_Y:=LMS_Y+ShiftTable_Y
		Table_height=15
		CoordMode, mouse, screen
		Excel.Connect()
		SpecTab.GetExcelData()
		SpecTab.CreateGUI()
		SpecTab.ModifyColumns()
		SpecTab.ShowGUI()
		; sleep 100
		return
	}

	ShowGUI(){
		global
		CoordMode, mouse, screen
		ScreenEdge_X:=A_ScreenWidth-350
		ScreenEdge_Y:=A_Screenheight-150
		try GUI, Spec_Table:Show, x%SpecTable_X% y%SpecTable_Y% w350, %Product% Spec Table
		catch GUI, Spec_Table:Show, x%ScreenEdge_X% y%ScreenEdge_Y% w350, %Product% Spec Table
			CoordMode, mouse, window
		OnMessage(0x0201, "WM_Lbuttondown")
		return
	}

	CreateGUI(){
		global
		GUI, Spec_Table:Default
		Gui Spec_Table:+LastFound +Toolwindow +Owner +AlwaysOnTop -SysMenu +MinimizeBox
		GUI, Spec_Table:Add, ListView, x0 y0 r%Table_height% w380 checked Grid altSubmit gSpec_Table, `t%Product%|`t%Name%|MinLimit|MaxLimit|Units|Percision|Description|Method
		GUI, Spec_Table:Font, s16 cBlack Bold, Consolas
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
				; Iniwrite, %Temp%, Settings.ini, %Product%, %Test%
			}
		}
	}
 */
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
		click, 229, 72,2
		Send, ^a
		Loop, Read, data\Methods.ini
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
			IniRead,vOutput, data\Methods.ini, Methods, %InputVar%
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
		winwaitactive, Test Definition Editor,,0.25
		if errorlevel
			winactivate, Test Definition Editor
		; sleep 400
		click 418, 202
		Send, ^a^c
		Clipwait,1
		Description:=Clipboard
		sleep 200
		StrReplace(Description, "eurofins",intertek)
		; StrReplace(Description, "(Send out)","")
		; MouseClick, left, 464, 532,2,0
		MouseClick, left, 464, 533,1,0
		sleep 150
		MouseClick, left, 245, 489,1,0
		;  LMSclick.TestDefinitionEditor_Results()
		winactivate, Results Definition
		winWaitactive, Results Definition,,0.35
		if errorlevel
			winactivate, Results Definition
		winactivate, Results Definition
		click 282, 141 ; click row
		sleep 80
		clipboard:=
		sleep 20
		Send, ^c
		clipwait, 3
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
		blockinput off
		Send, {esc}
		copypastetoggle=1
		Critical, Off
		exit
		Return
	}

	PasteSpecs(){
		Global
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
		winwaitactive, Select methods tests,,0.25
		click 227, 69. 2 ; method search bar
		Sendinput, %MethodID%{enter}^{a}{click 506, 337}{click 851, 656} ; add test and hit okay
		sleep 200
		winactivate, NuGenesis LMS
		click 397, 591 ; click attrobutes
		return
	}

/*
;; Run through all the menues to add
	AutoFill(){
		global
		winactivate, ahk_exe eln.exe
		sleep 200
		;blockinput, on
		If winactive("NuGenesis LMS")
		{
			;Sendinput,{click, 565, 692}^a%Name%{enter}{click r, 270, 809}+{tab 2}{enter}
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
			; click 236, 246
			click 239, 246
			;  LMSclick.TestDefinitionEditor_Results()
			sleep 200
			Breaking.Point()
			winactivate, Results Definition

		}
		if winactive("Results Definition") ;Selection window
		{

			winactivate, Results Definition
			If Method contains ICP-MS 231
				Send,{click 217, 141}
			Send,{click 80, 66} ;click edit
			sleep 200
			Breaking.Point()
			winwaitactive, Result Editor,,0.5
			if !errorlevel
				SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,1,1)
			; blockinput, off
			Breaking.Point()
			sleep 400
		}
		If winactive("Result Editor") ;the editing window
		{
			winactivate, Result Editor
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
	GUI, Spec_Table:submit,NoHide
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
*/

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
	Send,{right 6}{Tab 2}{Space}{tab 2}{right}{tab}{right}
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
		; Sendinput, %Requirement%
	}
	sleep 100
	Breaking.Point()
	click 350, 660 ; click okay
	; winWaitClose, Results Definition,, 6
	; if errorlevel
	return
}

TestDefinitionEditor(The_Description){ ; 2nd window
	Global
	if The_description is space
	{
		MouseClick, left, 464, 532,2,0 ;click scrollbar
		click 239, 246 ;click results link
		;  LMSclick.TestDefinitionEditor_Results()
	}
	else
	{
		Breaking.Point()
		winactivate, Test Definition Editor
		DescriptionRaw:=The_Description
		Trimmed_Description:=RTrim(DescriptionRaw, "`r`n")
		Click, 187, 200 ;Orient_SpecTab.TestDefinitionEditor
		if Name contains Vitamin C
			Send,{Home}{Delete 12}%Trimmed_Description%
		else
			Send,^a%Trimmed_Description%
		sleep 300
		Breaking.Point()
	}
	;Send,{shift down}{Tab 15}{Shift up}{enter}
}

Edit_Physical(){
	Global
	winactivate, Edit specification
	Sendinput,{click 376, 87}{home}
	Send,%Product%`,{space}{shift down}I{shift up}n{shift down}{space}P{shift up}rocess`,{space}{shift down}P{shift up}hysical{tab 3}^a{backspace}
	Breaking.Point()
	Send,{tab}^a%Product%{tab 2}
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
	sleep 500
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
		sleep 300
	Breaking.Point()
	Sendinput,{tab}{delete 4}%Product%{enter}
	sleep 400
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
	Send,%Product%`,{space}{shift down}C{shift up}oated`,{space}{shift down}R{shift up}etain{tab 4}^a%Product%{tab}{enter}{tab}{space}{Return 2}
	sleep 400
	Send,{tab}{right}
	sleep 200
	Breaking.Point()
	Send,{tab}{right}{tab 3} ;{left 4}
	sleep 200
	Breaking.Point()
	click, 340, 622 ;click okay
	winwaitactive, NuGenesis LMS, ,12
	if !errorlevel
		LMSclick.EditSampleTemplate()
	Breaking.Point()
	Sendinput,{tab}^{a}%Product%`,{space}{Shift down}C{shift up}oated`,{space}{shift down}R{shift up}etain
	sleep 400
	Breaking.Point()
	send, {enter}
	sleep 400
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
	Send,%Product%`,{space}{shift down}C{shift up}oated`,{space}{shift down}P{shift up}hysical{tab 4}^a%Product%{tab}{enter}{tab}{space}{Return 2}
	sleep 400
	Send,{tab}{right}
	Breaking.Point()
	sleep 200
	Send,{tab}{right}{tab} ;{left 4}
	Breaking.Point()
	sleep 200
	Breaking.Point()
	click, 340, 622 ;click okay
	winwaitactive, NuGenesis LMS, ,12
	if !errorlevel
		LMSclick.EditSampleTemplate()
	Breaking.Point()
	Sendinput,{tab}^{a}%Product%`,{space}{Shift down}C{shift up}oated`,{space}{shift down}P{shift up}hysical
	sleep 400
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
	Send,%Product%`,{space}{shift down}I{shift up}n{space}{shift down}P{shift up}rocess`,{space}{shift down}R{shift up}etain{tab 4}^a%Product%{tab}{enter}{tab}{space}{Return 2}
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
	sleep 400
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
	sleep 400
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
	Send,^a%Description%
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
		; blockinput, on
		ControlGetText, Iteration, Static1, VarBar
		ifwinactive, Register new samples
			MouseGetPos, mx, my
		click 2
		sleep 200
		Breaking.Point()
		sleep 200
		winwaitactive, Edit sample `(Field Configuration,, 6
			if ErrorLevel
				exit
			Sendinput, {tab 2}{right}{click 277, 139}{tab 6}
			Ifwinactive, Edit sample `(Field Configuration: F`, Micro`)
				Send,{tab}^{a}
			Sendinput, ^{a}%Batch%{tab}^{a}
			Ifwinactive, Edit sample `(Field Configuration: F`, Micro`)
			{
				Sendinput,{ctrldown}{a}{ctrlup}%Lot%
				Sendinput,{tab 3}
				sleep 100
				if Coated
					Sendinput, ^{a}%Coated%
				sleep 100
				Sendinput, +{tab 2}
			}
			Ifwinactive, Edit sample `(Field Configuration: CT`,
			{
				; Sendinput,{ctrld;own}{a}{ctrlup}%Lot%
				Sendinput,{tab 3}
				sleep 100
				if Coated
					Sendinput, ^{a}%Coated%
				sleep 100
				Sendinput, +{tab 2}
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
			Sendinput, {enter}
			sleep 100
			blockinput, off
			winactivate, Register new samples
			sleep 300
			my:=my+30
			MouseMove, mx, my

			; return
		}

		CustomerMenu() { ;; create a dropdown from CustomerMenu ini datafile
			global
			try menu, Menu, DeleteAll
			if winactive("Edit sample (Field Configuration: F, Micro)")
				send {click 421, 504}
			else ;if winactive("Edit sample (Field Configuration")
				Send, {Click 425, 434}
			Loop, Read, C:\Users\mmignin\Documents\VQuest\Data\Customers.ini
			{
				If A_Index = 1
					Continue
				MenuItems := StrSplit(A_LoopReadLine, "=")
				Selection:= % MenuItems[1]
				Menu, Menu, add, &%Selection%, CustomerMenu
			}
			menu, menu, add
			menu, menu, add, E&xit, ExitMenu
			Menu, Menu, Show,
			return
			CustomerMenu:
				sleep 200
				InputVar:=StrReplace(A_ThisMenuItem, "&", "")
				; InputVar:=A_ThisMenuItem
				IniRead,CustomerPosition, C:\Users\mmignin\Documents\VQuest\Data\Customers.ini, Customers, %InputVar%
				sleep 20
				menu, Menu, DeleteAll
				sleep 200
				this.DropdownSelect(CustomerPosition)
			return
		}

		DropdownSelect(A_ShipTo){
			sleep 100
			; SetKeyDelay, 0, 0

			AbsSelection:=Abs(A_ShipTo)-1
			if (a_shipto = "-1")
				Sendinput,{end}
			else if (a_shipTo = "1")
				Sendinput,{home}
			else if (a_ShipTo > 1)
				Sendinput,{home}{right}{right %A_ShipTo%}
			else if (a_ShipTo < 1)
				Sendinput,{end}{left}{left %Absselection%}

			sleep 400
			if winactive("Edit sample `(Field Configuration:")
				sleep 400
			; SetKeyDelay, 1, 0.25
			return
		}

		DeleteRetain(){
			gLOBAL

			SetMouseDelay, -1
			SetDefaultMouseSpeed, 0
			CoordMode, mouse, Relative
			; Breaking.Preamble()
			winactivate, NuGenesis LMS
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
				; winactivate, ahk_exe eln.exe
				; ControlClick, x61 y258, ahk_exe eln.exe
				winactivate, NuGenesis LMS
				; clk(61, 258,,,"ahk_exe eln.exe")
				send, {click 61, 258}
				CoordMode, mouse, Screen
				; send, {click %mx%,%my%,0}
				MouseMove, %mX%, %mY%, 0,
				; send, {click %mx%,%my%,0}
				;clk(61, 258,,,"ahk_exe eln.exe")
				; previousProduct:=Product
				sleep 100
				winwait, Delete Tests,,1.5
				if errorlevel
				{
					sleep 100
					if winexist("Warning")
						ControlSend,, {enter}, Warning
					; winactivate, NuGenesis LMS
					; MouseClick, left, 0, 26, 1, 0, , R
				}
				; MouseClick, left, 0, 26, 1, 0, , R
				sleep 200
				if winExist("Delete Tests")
					ControlSend,, {enter}, Delete Tests
				; Send, {enter}
				sleep 100
				; sleep 500
				n--
				Breaking.Point()
			}
			setwindelay, 60
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
			sleep 50
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
			setwindelay, 60
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
		setwindelay, 60
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
				setwindelay, 60
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
	else if A_thismenuitem contains &Coated_Retain
		SpecTab.Edit_CoatedRetain()
	else if A_thismenuitem contains &Coated_Physical
		SpecTab.Edit_CoatedPhysical()
	else if A_thismenuitem contains &Retain
		SpecTab.Edit_Retain()
	else if A_thismenuitem contains &Micro
		SpecTab.Edit_Micro() ; copyMicro spec tests
	else if A_thismenuitem contains &Physical
		SpecTab.Edit_Physical()
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
