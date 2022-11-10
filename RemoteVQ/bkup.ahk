if A_username != mmignin
	exitapp
	#SingleInstance,Force
	#Persistent
	Process, Priority, , High
	#NoEnv
	Thread, NoTimers
	; Iteration=1
	; #ErrorStdOut
	; #KeyHistory 500
	#InstallKeybdHook
	#InstallMouseHook
	#ClipboardTimeout 5500
	; #HotkeyModifierTimeout
	SetKeyDelay,0,0
	#maxthreadsperhotkey, 2
	SetTitleMatchMode, 2
	FormatTime, DayString,, MM/d/yy
	FormatTime, TimeString, R
	FormatTime, CurrentDateTime,, MM/dd/yy
	FormatTime, The_Day,, MMMM d
	FormatTime, The_Hour,, htt
	FormatTime, The_Time,, hh:mm
	SetNumlockState, on
	SetscrolllockState, off
	CrLf=`r`n
	SetNumlockState Alwayson
	setcapslockstate alwaysoff
	CoordMode, mouse, Window
	CoordMode, Tooltip, relative
	SetWorkingDir, %A_ScriptDir%
	#winactivateForce
	SetscrolllockState, alwaysoff
	AutoTrim, On
	Menu, Tray, Add, windowSpy, windowSpy
	Menu, Tray, Add, All Batches, AllBatchesMsgbox
	Menu, Tray, Add, All Products, AllProductsMsgbox
	Menu, Tray, Add, &Reload, ReloadSub
	; Menu, Tray, add, Enter Specs, EnterSpecs
	Menu, Tray, add, Show Final Label Copy, ShowFinalLabelCopy
	Menu, Tray, add, Show Scan Label Copy, ShowScanLabelCopy
	Menu, Tray, add, Show Total CoAs, ShowFINAL_C_O_A
	Menu, Tray, add, Show EditBox, ShowEditBox
	Menu, Tray, add, AddClipBoardToList, AddToList
	Menu, Tray, Add, Show Variables, ShowVariables
	Menu, Tray, Default, &Reload
	copypasteToggle:=0
	RegexProduct:="i)(?<=[\w\d]{3})?(?P<Product>[abcdefghijkl]\d{3})"
	RegexBatch:= "i)(?<!Ct#)(?P<Batch>\d{3}-\d{4}\b)"
	RegexLot:= "i)(?P<Lot>\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d)"
	RegexCoated:= "i)(\d{4}\w\d\w?.|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d\s|coated: |ct#|ct\s?|coated\s?|ct#/s)(?P<Coated>\d{3}-\d{4})"
	; Menu, Tray, Add, Test_1, test_1
	OnClipboardChange("clipChange")
	PasteTime:=A_TickCount
	; CodeFile:= "\\10.1.2.118\users\vitaquest\mmignin\RemoteVQ\Code.txt"
	OnExit("ClipBar.SaveVariables")
	SetTimer,activeCheck, %ActiveTimerCheck%
	ReadIniFiles()



	; Menu, Tray, Add, E&xit, ExitSub
	LMS.Orient()
	sleep 200
	ClipBar.Show()
	try Menu, Tray, Icon, %AppIconPath%
	#include Nugenisis.ahk
	#include ClipBar.ahk
	#include CodeClip.ahk
	#Include RemoteKEYS.ahk
	SetWinDelay, %NormalWinDelay%


	; RegexCoated = "i)(?:\d{4}\w\d\w?.|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d\s|coated:?\s?|ct\#?\s?)(?P<Coated>\d{3}-\d{4})"



return
ReadIniFiles(){
	global
	iniRead, Product, Settings.ini, SavedVariables, Product
	iniRead, Batch, Settings.ini, SavedVariables, Batch
	iniRead, Lot, Settings.ini, SavedVariables, Lot
	iniRead, Coated, Settings.ini, SavedVariables, Coated
	; iniread, PriorCodeString, Settings.ini, SavedVariables, PriorCodeString
	; iniread, CodeString, Settings.ini, SavedVariables, CodeString
	iniRead, Ingredient_List_Adjustment, Settings.ini, Config, Ingredient_List_Adjustment
	iniread, NormalWinDelay, Settings.ini, Config, NormalWinDelay
	iniread, ActiveTimerCheck, Settings.ini, Config, ActiveTimerCheck
	iniRead, IngredientNoteDropDownCount, Settings.ini, Config, IngredientNoteDropDownCount

	iniRead, DescriptionTextInput, Settings.ini, SavedVariables, DescriptionTextInput
	iniRead, Iteration, Settings.ini, SavedVariables, Iteration

	iniRead, HM_Units, Settings.ini, HeavyMetal_Variables, HM_Units
	iniRead, HM_Lower_Limit, Settings.ini, HeavyMetal_Variables, HM_Lower_Limit
	iniRead, Arsenic_Limit, Settings.ini, HeavyMetal_Variables, Arsenic_Limit
	iniRead, Arsenic_Requirement, Settings.ini, HeavyMetal_Variables, Arsenic_Requirement
	iniRead, Lead_Limit, Settings.ini, HeavyMetal_Variables, Lead_Limit
	iniRead, Lead_Requirement, Settings.ini, HeavyMetal_Variables, Lead_Requirement
	iniRead, Cadmium_Limit, Settings.ini, HeavyMetal_Variables, Cadmium_Limit
	iniRead, Cadmium_Requirement, Settings.ini, HeavyMetal_Variables, Cadmium_Requirement
	iniRead, Mercury_Limit, Settings.ini, HeavyMetal_Variables, Mercury_Limit
	iniRead, Mercury_Requirement, Settings.ini, HeavyMetal_Variables, Mercury_Requirement

	iniRead, ScansLabelCopyPath, Settings.ini, FilePaths, ScansLabelCopyPath
	iniread, FinalLabelCopyPath, Settings.ini, FilePaths, FinalLabelCopyPath
	iniread, 2022_Final_C_O_APath, Settings.ini, FilePaths, 2022_Final_C_O_APath
	iniread, FinishedLabelCopyPath, Settings.ini, FilePaths, FinishedLabelCopyPath
	iniread, ManualCOAPath, Settings.ini, FilePaths, ManualCOAPath
	iniread, mfgPath, Settings.ini, FilePaths, mfgPath
	iniread, WindowSpyPath, Settings.ini, FilePaths, WindowSpyPath
	iniread, AppIconPath, Settings.ini, FilePaths, AppIconPath
	iniread, CustomerListPath, Settings.ini, FilePaths, CustomerListPath
	iniread, CodeFile, Settings.ini, FilePaths, CodeFile
}



Reloadsub(){
	global
	reload
  }
Exitsub(){
	global
	exitapp
  }
windowSpy(){
  Run, WS.exe,%WindowSpyPath%\
  }

AllBatchesMsgbox:
	AllBatchesMsg:=GetAllBatches(" ")
	sleep 400
	tt(AllBatchesMsg)
	; clip.EditBox(AllBatchesMsg)
	return
AllProductsMsgbox:
	AllProductsMsg:=GetAllProducts(" ")
	sleep 400
	tt(AllProductsMsg)
	; clip.EditBox(AllProductsMsg)
	return
ShowVariables:
	run, edit Settings.ini
	sleep 200
	WinWaitNotActive, Settings - Notepad,, 10
			; ControlSend, Edit1, {ctrl down}s{ctrl up}, Settings - Notepad,
	; winwaitclose, Settings - Notepad,,10
		; if errorlevel
		; ControlSend, Edit1, {ctrl down}s{ctrl up}, Settings - Notepad,
		readInIFiles()
		LMS.Orient()
		ClipBar.Show()
	return
ShowFinalLabelCopy:
	run, find "\\10.1.2.118\Label Copy Final"
	sleep 200
	sendinput, %Product%{enter}
	return
ShowScanLabelCopy:
	run, find %ScansLabelCopyPath%
	sleep 200
	sendinput, %Product%{enter}
	return

ShowFINAL_C_O_A:
	run, explorer %2022_Final_C_O_APath%
	return
ShowEditBox:
	clip.editbox()
	return

activeCheck:
	If winexist("Delete Attribute"){
		winactivate,
		sleep 200
		sendinput, {enter}
		; mousemove, 245, 137
		sleep 1000
	}
	else if winexist("Delete specification"){
		;sleep 4000
		reload
		return
	}
	else If winexist("Release: Rotational Testing Schedule"){
		winactivate,
		click 131, 141 ;click release
		sleep 800
		click %DocumentMenuSection_X%, %DocumentMenu_Y% ;click dropdown for Section menu
		sendinput, {down}{enter}
		winwaitactive, Sign:,,3
		Sendpassword()
		click %DocumentMenuDocument_X%, %DocumentMenu_Y% ;click dropdown for Document Menu
		sendinput, {down}{enter}
		return
	}
	else If winexist("Release: ahk_exe eln.exe"){
		winactivate
		click 128,146
		return
	}
	else If winexist("Delete Test"){
		winactivate,
		sleep 200
		sendinput, {enter}
		; mousemove, 222, 138
		; click
		sleep 1000
	}
	else If winexist("Delete results"){
		winactivate,
		sleep 200
		sendinput, {enter}
		; mousemove, 222, 138
		; click
		sleep 1000
	}
	else If winexist("Delete ingredients"){
		winactivate,
		sleep 200
		sendinput, {enter}
		; mousemove, 222, 138
		sleep 1000
	}
	else if winexist("Lock specification")
	{
		sendinput, !{n}
		sleep 1000
		return
	}
	else if winactive("Error") {
		ControlSend,, {enter}, Error
		sleep 200
		if winExist("Register new samples") && Product{
			winactivate,
			Sendinput, {click 185, 103,2}%Product%{enter}
		}
		sleep 2000
	}
	else if winexist("Information"){
		winactivate,
		send, {enter}
	}
	; else if winactive("Settings - Notepad"){
			; WinWaitNotActive, Settings - Notepad,,
			; ControlSend, Edit1, {ctrl down}s{ctrl up}, Settings - Notepad,
			; readInIFiles()
			; LMS.Orient()
			; ClipBar.Show()
	; }
	; else if winactive("NuGenesis LMS") && (A_TimeIdle > 6000){
	; 	LMS.Orient()
	; 	sleep 300
	; 	SetKeyDelay,0,0
	; 	ReadIniFiles()
	; 	CoordMode, mouse, Window
	; 	CoordMode, Tooltip, relative
	; 	#maxthreadsperhotkey, 2
	; 	SetTitleMatchMode, 2
	; 	; winMove, ClipBar ahk_class ClipBar ahk_exe RemoteVQ.exe, ,%ClipBar_nuX%, %ClipBar_nuY%
	; 	SetWinDelay, %NormalWinDelay%
	; 	}
		; return
return










































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
AddDataFromClipboard(Pointer:="<\^>",Source:=""){
	/*
	[2] Name
	[3] IngredientID
	[4] Position
	[5] LabelName
	[6] labelClaim
	[7] Assay
	[8] Method
	[9] Description
	[10] MinLimit
	[11] MaxLimit
	[12] Units
	[13] Percision
	[14] Requirement
	*/
	global
	if !Source
		Source:=Clipboard
	sleep 100
	if RegexMatch(Source, Pointer){
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
			if !ingredient[7] 					;If there are spec tabs
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
			If winactive("Edit Ingredient"){
				winactivate "Edit Ingredient"
				sleep 250
				ProductTab.AddNewIngredient(LabelName[1],LabelClaim[1],Position[1],IngredientID[1],1)
				sleep 320
				return
				}
			else if Winactive("Composition"){
				winactivate "Composition"
				loop % Line
				{
					If !Position[A_index]
						return
					ProductTab.AddNewIngredient(LabelName[a_index],LabelClaim[a_index],Position[a_index],IngredientID[a_index])
					sleep 150
					ifwinnotactive, Composition
					winactivate, Composition
					sleep 150
					}
				}
			else if winactive("Result Editor") || winactive("Results Definition") || winactive("Test Definition Editor"){
				SpecData:=[]
				SpecData:=StrSplit(clipboard,"|")
				Name:=SpecData[2]
				IngredientID:=SpecData[3]
				Method:=SpecData[8]
				Description:=SpecData[9]
				MinLimit:=SpecData[10]
				MaxLimit:=SpecData[11]
				Units:=SpecData[12]
				Percision:=SpecData[13]
				Requirement:=SpecData[14]
				SpecTab.AutoFill()

			}
			else if (Tab="Specs") {
				Try GUI, Spec_Table:destroy
				SpecTab.Table()
				return
		  }
		  }
	else
		clip.codesRegex()
	sleep 100
	return

}




	Menu(){
		Global
		try Menu,Menu, deleteAll
		if winactive("NuGenesis LMS"){
			LMS.Orient()
			LMS.DetectTab()
			;Menu,Menu, add, Copy &Template, autofill
			; If CopyPasteToggle=1
				Menu,Menu, add, Paste &Specs, Autofill
			; If CopyPasteToggle=0
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
				Menu,Menu, add, ApproveSpecVersion, +#F11
				Menu,Menu, add, NewSpecVersion, ^#F11
				Menu,Menu, add, RemoveTestSpec, !#F11
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
			Menu, Menu, Add, Custom Heavy Metal,Autofill
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
		sleep 300
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
	ClipBar_nuX:=NuX+450
	ClipBar_nuY:=NuY
	TabSelect:=NuW-10
	DocumentMenuSection_X:=NuW-200
	DocumentMenuDocument_X:=NuW-140
	DocumentMenu_Y:=110
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


/*
      [2] Product
      [3] ProductName
      [4] Customer
      [5] CustomerPosition
      [6] ShapeAndSize
      [7] Color
      [8] ServingSize
      [9] clip.codesRegex
 */
AddProductFromClipboard(){
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
      ; ControlsetText, Static1,%CustomerPosition%,ClipBar
      GuiControl,ClipBar:Text, Iteration, %Iteration%
		if CustomerPosition
			IniWrite, %Iteration%, Settings.ini, SavedVariables, Iteration
    }
    if winactive("NuGenesis LMS"){
      Lms.detectTab()
      if (Tab="Product"){
        click 74, 153
        sleep 1000
      }
      else
        return
    }
	sleep 200
	Breaking.Point()
    if Winactive("Edit Product")
      ProductTab.AddNewProduct()
    else if winactive("Edit Formulation")
      ProductTab.AddNewFormulation()
    else
      return
  }






AddNewIngredient(Ingredient_Name,Ingredient_Claim,Ingredient_Position,Ingredient_Id,Dont_Hit_Okay:=""){
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
	If Ingredient_Claim contains Heavy Metal,Allergens,Other
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
	if (a_DropdownCount = "i"){
			if !(IngredientNoteCount) || (IngredientNoteCount >8)
				IngredientNoteCount:=1
			sleep 50
			this.Dropdown_GenericIngredient(IngredientNoteCount,1)
			IngredientNoteCount+=1
		}
	if (a_DropdownCount = ""){
		if Iteration >25
			iteration:=1
		sleep 50
		this.Dropdown_GenericIngredient(Iteration)
		ClipBar.AddIteration(0)
	}
	SetKeyDelay,0,0
	sleep 200
	return
}




AddNewProduct(){ ;for naming Product code and customer,
	global Product, ProductName, Customer, ShapeAndSize, color
	SetWinDelay, 260
	click 120,80 ;click product box
	Sendinput,%Product%`,{space}
	sendraw, %ProductName%
	sleep 20
	; old code ; sendinput, {tab 2}%Customer%{tab 2}{right 2}{tab}{right 3}{tab}%Product%{tab 2}
	sendinput, {tab 2}%Customer%{tab 2}{End}{tab}{right 3}{tab}%Product%{tab 2} ; new vitaquest selection
	sleep 200
	Sendraw,%ProductName%
	sendinput, {tab 8}
	sleep 300
	Breaking.Point()
	winwaitactive,NuGenesis LMS,,10
	  if errorlevel
	    Exit
	winactivate, NuGenesis LMS
	Breaking.Point()
	click, 67, 283
	sleep 200
	Breaking.Point()
	This.AddNewFormulation()
	; clk(287, 578) ;click save
	Iteration:=1
	return
	SetWinDelay, %NormalWinDelay%
}

AddNewFormulation(){     ;then click on Edit Formulation, puts in code, then tabs to serving size
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
	SetWinDelay, %NormalWinDelay% ;testing out
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

Dropdown_GenericIngredient(IterationCount:="",IngredientNote:=""){ ;; Generic List
	global
	GeneralCount:=IterationCount
	Click 150, 73
	sleep 50
	Sendinput,{tab}{Home}{right %Ingredient_List_Adjustment%}
	sleep 80
	if IngredientNote
	{
	  Sendinput, {right %IngredientNoteDropDownCount%}{right %IterationCount%}
	  sleep 505
	  return
	  }
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
		ShiftTable_Y:=200
		Try GUI, Spec_Table:destroy
		CoordMode, mouse, window
		ifwinnotactive, ahk_exe eln.exe
			winactivate, ahk_exe eln.exe
		winGetPos, LMS_X, LMS_Y, LMS_w, LMS_h, A
		SpecTable_X:=LMS_w+LMS_X+ShiftTable_X
		SpecTable_Y:=LMS_Y+ShiftTable_Y
		CoordMode, mouse, screen

		SpecTab.CreateGUI()
		SpecTab.ModifyColumns()
		SpecTab.ShowGUI()
		CoordMode, mouse, window
		; sleep 100
		return
	}

	ShowGUI(){
		global
		CoordMode, mouse, screen
		ScreenEdge_X:=A_ScreenWidth-15
		ScreenEdge_Y:=A_Screenheight-180
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
		GUI, Spec_Table:Add, ListView, x0 y0 w360 r%table_height% Grid checked altSubmit -hdr gSpec_Table, `t%Product%|`t%Name%|MinLimit|MaxLimit|Units|Percision|Description|Method
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




	Methods() {
		global
		winactivate, Select methods tests
		click, 235, 72
		sleep 100
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
			menu, Methodmenu, deleteAll
			SpecTab.Methods()

		return
	}
		;; ____Copy spec template
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
		If (Department = "Analytical")
			SpecTab.Edit_Analytical_Copy()
		else If (Department = "ctPhysical")
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
		; WinActivate, NuGenesis LMS
		Breaking.Point()
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
		; StrReplace(Description, "eurofins", "intertek")
		iniwrite, %Description%, Settings.ini, CopiedSpecs, Description
		; MouseClick, left, 464, 532,2,0
		MouseClick, left, 464, 533,1,0
		sleep 150
		MouseClick, left, 245, 489,1,0
		;  LMSclick.TestDefinitionEditor_Results()
		winactivate, Results Definition
		winWaitactive, Results Definition,,0.45
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
		clip.ParseSpecsTable()

		sleep 200
		blockinput off
		Sendinput, {esc}

		Critical, Off
		tt(FullRequirements " " Percision,2000)
		exit
		Return
	}


	PasteSpecs(){
		global
		Critical, On
		iniread, MinLimit, Settings.ini, CopiedSpecs, MinLimit
		iniread, MaxLimit, Settings.ini, CopiedSpecs, MaxLimit
		iniread, Percision, Settings.ini, CopiedSpecs, Percision
		iniread, Requirement, Settings.ini, CopiedSpecs, Requirement
		iniread, Units, Settings.ini, CopiedSpecs, Units
		if winactive("NuGenesis LMS"){
			winactivate, NuGenesis LMS
			click 57, 715 ; edit Test
			sleep 400
			winactivate, Test Definition Editor
			Breaking.Point()
			; winwaitactive, Test Definition Editor,,0.95
		}
		if winactive("Test Definition Editor"){
			click 418, 202 			;click description box
			SpecTab.TestDefinitionEditor(Description) ; the pre window
			sleep 200
			MouseClick, left, 464, 533,1,0 ; Click scrollbar
			sleep 250
			MouseClick, left, 245, 485,1,0  ; click results
			winactivate, Results Definition
			sleep 300
			Breaking.Point()
		}
		if winactive("Results Definition"){
			winactivate, Results Definition
			; winWaitactive, Results Definition,,0.75
			; if errorlevel
			click 84, 65  ;click Edit
			sleep 300
			}
			; winwaitactive, Result Editor,,0.75
			; if errorlevel
		if winactive("Results Editor"){
			winactivate, Result Editor
			sleep 400
			SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,1,Requirement)
			Breaking.Point()
		}
		CopyPasteToggle=0
		Critical, Off
		exit
		return
	}

	AddMethod(MethodID){
		winactivate, NuGenesis LMS
		click 67, 562 ; Add Methods
		winwaitactive, Select methods tests,,0.65
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
		CoordMode, mouse, window
		sleep 200
		If winactive("NuGenesis LMS")
		{
			sleep 200
			Breaking.Point()
			click, 57, 755 ;click Edit Test
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
			Breaking.Point()
			winactivate, Results Definition
			;sleep 100

		}
		if winactive("Results Definition") ;Selection window
		{
			winactivate, Results Definition
			;sleep 100
			If Method contains ICP-MS 231
				Send,{click 217, 141}
			Send,{click 80, 66} ;click edit
			sleep 200
			Breaking.Point()
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
		return
	}
	else
		return
		; msgbox, got returned
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

;;___Fill In Test Specs
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
	If Method contains ICP-MS 231
		return
	WinWaitClose, Results Definition,, 8
	winactivate, Test Definition Editor
	mousemove, 335, 617
	; sleep 500
	; Breaking.Point()
	; click
	return
}

TestDefinitionEditor(The_Description){ ;,Department:=""){ ; 2nd window
	Global
	if !(The_description) ; && !(Department)
	{
		MouseClick, left, 464, 532,2,0 	;click scrollbar
		sleep 100
		click 239, 246 					;click results link
		sleep 100
		return
	}
	else
	{
		winactivate, Test Definition Editor
		DescriptionRaw:=The_Description
		Trimmed_Description:=RTrim(DescriptionRaw, "`r`n")
		sleep 85
		Click, 187, 200  ;click description box
		sleep 200	;Orient
		if Name contains Vitamin C
			Sendinput,{Home}{Delete 12}
		else
			Send, ^{a}
		sleep 100
		sendinput, %Trimmed_Description%
		if strLen(Trimmed_Description) > 100
			sleep 300
		; if (Department="Stability"){
			; Sendinput, +{tab}^{a}Stability
			; sleep 400
			; click, 347, 287 ; click Department dropdown
			; sleep 400
			; sendinput, {pgdn}{up}{enter} ;select stability
			; sleep 300
		; }

		Breaking.Point()
		; MouseClick, left, 464, 532,2,0 	;click scrollbar
		sleep 100
		; click 239, 246 					;click results link
	}
	;Send,{shift down}{Tab 15}{Shift up}{enter}
}
TestDefinitionEditor_Stability(){ ;,Department:=""){ ; 2nd window
	Global
	if Winactive("NuGenesis LMS")
		mouseclick, left, 61, 715,1,0
		sleep 400
		winwaitactive, Test Definition Editor,,2
			if errorlevel
				winactivate, Test Definition Editor
		; CoordMode, Mouse, Screen
		; DescriptionRaw:=The_Description
		; Trimmed_Description:=RTrim(DescriptionRaw, "`r`n")
		; sleep 85
		mouseclick, left, 187, 200,1,0
		sleep 100  ;click description box
		sendinput, +{tab}^{a}Stability ;Stability Test Group
		sleep 200	;Orient
		mouseclick, left, 366, 280, 2,0 ;click department
		sleep 200
		sendinput, {down 15}{up}
		; if Name contains Vitamin C
			; Sendinput,{Home}{Delete 12}
		; else
			; Send, ^{a}
		; sleep 100
		; sendinput, %Trimmed_Description%
		; if strLen(Trimmed_Description) > 100
			; sleep 300
		; if (Department="Stability"){
			; Sendinput, +{tab}^{a}Stability
			sleep 400
			; click, 347, 287 ; click Department dropdown
			; sleep 400
			; sendinput, {pgdn}{up}{enter} ;select stability
			; sleep 300
		; }

		Breaking.Point()
		MouseClick, left, 464, 532,2,0 	;click scrollbar
		; sleep 100
		click 239, 246 					;click results link
	;Send,{shift down}{Tab 15}{Shift up}{enter}
}

Edit_Analytical_Copy(){
	Global
	winactivate, Edit specification
	Sendinput,{click 376, 87}{home}
	Sendinput,%Product%`,{space}{shift down}I{shift up}n{shift down}{space}P{shift up}rocess`,{space}{shift down}A{Shift up}nalytical{tab 3}^a{backspace}
	Breaking.Point()
	Sendinput,{tab}^a%Product%{tab 2}
	Breaking.Point()
	Sleep 200
	Send,{Space}
	sleep 200
	Breaking.Point()
	winwaitactive, Products List, , 3
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
	click, 340, 622 ;click Save
	ifwinactive, Warning,
		return
	winwaitactive, NuGenesis LMS, ,8
	if !errorlevel
		sleep 300
	Breaking.Point()
	click, 70, 518 ;edit sample method
	sleep 499
	winwaitactive, Edit sample template,,8
	if !errorlevel
		sleep 200
	Breaking.Point()
	Sendinput,{tab}{delete 4}%Product%{enter}
	sleep 200
	Breaking.Point()
	return
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
		ifwinactive, Warning,
		return
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
	sleep 300
	Breaking.Point()
	send, {enter}
	winwaitactive, NuGenesis LMS,,5
	; If !ErrorLevel
		; MouseMove, %premx%, %premy%, 0
	; click
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
		ifwinactive, Warning,
		return
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
	; If !ErrorLevel
		; MouseMove, %premx%, %premy%, 0
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
		ifwinactive, Warning,
		return
	winwaitactive, NuGenesis LMS,,5
	if !errorlevel
		LMSclick.EditSampleTemplate()
	Breaking.Point()
	Sendinput,{tab}^{a}%Product%`,{space}{Shift down}C{shift up}oated`,{space}{shift down}P{shift up}hysical
	sleep 300
	send, {enter}
	winwaitactive, NuGenesis LMS,,5
	; If !ErrorLevel
		; MouseMove, %premx%, %premy%, 0
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
	sleep 900
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
	; If !ErrorLevel
		; MouseMove, %premx%, %premy%, 0
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
	; If !ErrorLevel
		; MouseMove, %premx%, %premy%, 0
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

HM_Custom(){
	global HM_Units, Arsenic_Limit, Arsenic_Requirement, Lead_Limit, Lead_Requirement, Cadmium_Limit, Cadmium_Requirement, Mercury_Limit, Mercury_Requirement,HM_Lower_Limit
	if !HM_Lower_Limit
		HM_Lower_Limit:=""
	winactivate, Result Definition
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor,,2
	Sendinput,{tab 5}%HM_Units%{tab 7}{space}{tab 2}%HM_Lower_Limit%{tab}%Arsenic_Limit%{tab 5}%Arsenic_Requirement%%A_space%%HM_Units%
	click 390, 659	;click okay
	Breaking.Point()
	winWaitClose, Result Editor,,2
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	Breaking.Point()
	winwaitactive, Result Editor,,2
	Sendinput,{tab 5}%HM_Units%{tab 7}{space}{tab 2}%HM_Lower_Limit%{tab}%Lead_Limit%{tab 5}%Lead_Requirement%%A_space%%HM_Units%
	click 390, 659	;click okay
	winWaitClose, Result Editor,,2
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	Breaking.Point()
	winwaitactive, Result Editor,,2
	Sendinput,{tab 5}%HM_Units%{tab 7}{space}{tab 2}%HM_Lower_Limit%{tab}%Cadmium_Limit%{tab 5}%Cadmium_Requirement%%A_space%%HM_Units%
	click 390, 659	;click okay
	winWaitClose, Result Editor,,2
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	Breaking.Point()
	winwaitactive, Result Editor,,2
	Sendinput,{tab 5}%HM_Units%{tab 7}{space}{tab 2}%HM_Lower_Limit%{tab}%Mercury_Limit%{tab 5}%Mercury_Requirement%%A_space%%HM_Units%
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
;_____Remove tests from spec
	NewSpecVersion(){
		Global DescriptionTextInput
			click, 69, 249 ; new version
			sleep 200
		if winexist("Delete specification") || winexist("Lock specification") || winexist("Approve specification")
			exit
		if winactive("Delete specification")
			exit
		sleep 300
		winactivate, Edit specification
		if !winactive("Edit specification")
			exit
		click, 393, 177 ; click description
		send, ^{a}
		sleep 300
		sendinput, %DescriptionTextInput%
		sleep 200
		Breaking.Point()
		if !winactive("Edit specification")
			exit
		click, 331, 617 ;click okay
			sleep 600
			Breaking.Point()
		winwaitactive, NuGenesis LMS,,3
			if errorlevel
				return
		return
		}

	RemoveTestSpec(){
		if winactive("NuGenesis LMS")
			click, 63, 754   ; edit results
		else
			sleep 600
		sleep 450
		; if winactive("NuGenesis LMS") && !winexist("Results Definition")
			; msgbox, LMS window active, not Results window
		; ifwinactive, Results Definition
		mouseclick, left, 111, 95,1,0
			; Sendinput, {click 111, 96} ; sort Seq
			; exit
		sleep 300
		sendinput, {click 128, 65} ; Remove
		Breaking.Point()
		sleep 200
		; winactivate, Delete results
		if winexist("Delete results")
			send, {enter}
		else
			sleep 400
		if winexist("Delete results")
			send, {enter}
		sleep 400
		Breaking.Point()
		; if winactive("NuGenesis LMS")
			; exit
		; else
		if winactive("Results Definition")
			send, {enter}
		Else
			; {
				; tt("ended cuz it was too long")
				sleep 400
				; if winactive("Results Definition")
					; send, {enter}


		winwaitactive, NuGenesis LMS,,6
			if errorlevel
				exit
		sleep 300
		return
		; sleep 300
	}
		ApproveSpecVersion(){
			global NuGenesis_w, Nugenesis_Y
			; wingetpos, Nugenesis_X, Nugenesis_y, Nugenesis_w, Nugenesis_h, NuGenesis LMS
			ScrollBarTop_X:=Nugenesis_W - 5
			TopListItem_X:=Nugenesis_W - 50
			ScrollBarTop_Y:=Nugenesis_y + 190
			Click, 76,269 ;click Approve Specification
			sleep 300
			if winexist("Delete specification") || winexist("Lock specification") ; || winexist("Approve specification") ; || !winexist("Approve specification")
				exit
			if winexist("Approve specification")
				sendinput, {enter}
			; ifwinexist("Approve secification")
			; Breaking.Point()
			sleep 500
			; if Winactive("NuGenesis LMS")
			; {
				; msgbox, 3 `n %ScrollBarTop_x% `n %TopListItem_X% `n %ScrollBarTop_Y%
				; exit
				; }
			CoordMode, mouse, screen
			; Click, %ScrollBarTop_X%, %ScrollBarTop_Y%
			sleep 300
			Click, %TopListItem_X%, %ScrollBarTop_Y%
			CoordMode, mouse, Window

		}

	FullRemoveTest(){
		global
		sleep 200
		MouseGetPos, m_x, m_Y
		click, 62, 717 ; click View test
		sleep 200
		if winactive("NuGenesis LMS")
			{
				CoordMode, mouse, screen
				click, %m_x%, %m_y%
				sendinput, {down}
				CoordMode, mouse, window
				return
			}
		if winactive("Test Definition Viewer")
				send, {escape}
		sleep 200
		this.NewSpecVersion()
		if winexist("Delete specification") || winexist("Edit specification") || winexist("Lock specification") || winexist("Approve specification")
			exit
		if winactive("Delete specification")
			exit
		sleep 700
		; winwaitactive, NuGenesis LMS,,3
		; if errorlevel
			; return
		sleep 500
		this.RemoveTestSpec()

		sleep 700
		Breaking.Point()
		if !winactive("NuGenesis LMS")
			sleep 500
		; my:= my
		; Mousemove, %mx%, %my%,0
		this.ApproveSpecVersion()
		; TT("Done")
		return
	}


}


WM_Lbuttondown:
Spec_Table:
	if (A_GuiEvent = "NORMAL" ){
		; if (A_GuiEvent := "I" ){
		Sendinput,{space}
		SpecTab.GetRowText()
		; tt(ShowVariables,1000)

		SpecTab.AutoFill()
	}
Return


Spec_TableGuiClose:
	GUI, Spec_Table:destroy
	coordmode, mouse, window
return


Class WorkTab { 		;;______WorkTab Class______________
	NewTestRequestLink(){
		Global
		winactivate, Register new samples
		MouseClick, Left, 351, 621
		; sleep 200
		if !Product
			return
		winwaitactive, Edit request,,3
		sendinput, {tab 4}%Product%{tab 2}{space}{enter 2}{tab}{down}{tab 2}%batch%
		if !Batch
			return
		sleep 500
		MouseClick, Left, 356, 619
		return
	}
	registerNewSamples(){
		global
		mx:=
		my:=
		If Coated = "ERROR"
		Coated:=
		If Lot = "ERROR"
		lot:=
		SetWinDelay, %NormalWinDelay%
		blockinput, on
		ControlGetText, Iteration, Edit5, ClipBar
		ifwinactive, Register new samples
			MouseGetPos, mx, my
		click 2
		sleep 200
		sleep 200
		winwaitactive, Edit sample (Field Configuration,, 2
			if ErrorLevel
				sleep 800
			Sendinput, {tab 2}{right}{click 277, 139}{tab 7}
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
			sleep 300
			; If !(Iteration)
			; {
				; msgbox, no Iteration
				; Worktab.CustomerMenu()
				; return
				; }
			; else				if CustomerPosition > 0
				if (Iteration > 0)
					CustomerPosition:= Iteration + 1
				if (Iteration < 0)
					CustomerPosition:= Iteration - 1
					; Iteration-=1
			sleep 150
			WorkTab.Dropdown_CustomerSelect(CustomerPosition)
			blockinput, off
			sleep 800
			Breaking.Point()
			Send, {enter}
			sleep 200
			; winactivate, Register new samples
			; sleep 300
			; my:=my+30
			; MouseMove, mx, my
			SetWinDelay, %NormalWinDelay%

			return
		}

		CustomerMenu() { ;; create a dropdown from CustomerMenu ini datafile
			global
			try menu, CustomersMenu, DeleteAll
			send, {pgup 2}
			sleep 20
			send, {click 250, 150}
			; if winactive("Edit sample (Field Configuration: F, Micro)")
				; send, {click 421, 504}
			; else ;if winactive("Edit sample (Field Configuration")
				; Send, {Click 425, 434}
			Loop, Read, %CustomerListPath%
			{
				If A_Index = 1
					Continue
				MenuItems := StrSplit(A_LoopReadLine, "=")
				Selection:= % MenuItems[1]
				Count:= % MenuItems[2]
				Menu, CustomersMenu, add, %Count% `t &%Selection%, CustomerMenu
			}
			Menu, CustomersMenu, Show,
			return
			CustomerMenu:
				sleep 200
				MenuSelection:=[]
				; InputVar:=StrReplace(A_ThisMenuItem,"&",)
				MenuSelection:=StrSplit(A_ThisMenuItem, "&")
				inputVar:=MenuSelection[2]
				; InputVar:=A_ThisMenuItem
				IniRead,CustomerPosition, %CustomerListPath%, Customers, %InputVar%
				sleep 30
				if winactive("Edit sample (Field Configuration: F, Micro)")
					send, {tab 9}
				else
					send, {tab 7}
				sleep 20
				menu, CustomersMenu, DeleteAll
				if CustomerPosition > 0
					customerPosition+=1
				if CustomerPosition < 0
					customerPosition-=1
				sleep 200
				Iteration:=CustomerPosition
				sleep 200
				GuiControl,ClipBar:Text, Iteration, %CustomerPosition%
				; GUI, ClipBar:submit,NoHide
				iniwrite, %Iteration%, Settings.ini, SavedVariables, Iteration
				mouseclick, Left, 431, 541,1,0
				this.Dropdown_CustomerSelect(CustomerPosition)
			return
		}

		Dropdown_CustomerSelect(A_ShipTo){
			sleep 100
			Critical, on
			; msgbox, shipto %A_shipto% `niteration: %iteration% `nAbsselection: %Absselection% `n customerPosition:  %CustomerPosition%
			setkeydelay, -1,-1
			AbsSelection:=Abs(A_ShipTo)-1
			if (a_shipto = "-1")
				; msgbox %A_shipto% -1
				Sendinput,{end}
			else if (a_shipTo = 1)
				; msgbox %A_shipto% 1
				Sendinput,{home}
			else if (a_ShipTo > 1)
				; msgbox %A_shipto% >1
				Sendinput,{home}{right %A_ShipTo%}
			else if (a_ShipTo < 1)
				; msgbox %A_shipto% <1
				Sendinput,{end}{left %Absselection%}
			else if (a_ShipTo = "")
				; msgbox %A_shipto% blank
				worktab.CustomerMenu()
			else if (a_ShipTo = 0)
				; msgbox %A_shipto% 0
				worktab.CustomerMenu()
			else
			{
			setkeydelay, 0, 0
				critical, off
				exit
			}
			; else
				; sleep 400
			; if (a_shipto > 175) || (absselection > 175)
			; 	sleep 500
			; if winactive("Edit sample `(Field Configuration:")
				; sleep 800
			critical, off
			setkeydelay, 0, 0
			return
		}
	EditRequest(){
		Global
		mouseclick, left, 369, 139,1,0
		winactivate, Edit request
		sendinput, {tab 2}%Product%{tab 2}{space}{enter 2}{tab}{down}{tab 2}%batch%
		if !Batch
			return
		sleep 500
		MouseClick, Left, 356, 619
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
				winWaitactive, Edit request,,8
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
			SetWinDelay, %NormalWinDelay%
			return
		}

		CorrectTestResults(Checkbox_Toggle:=0,LoopThrough:=""){
			global

			if (Iteration = "ERROR")
				InputBox, Iteration, enter iteration, number please,, , , , , , , 1
			if errorlevel
				reload
			if LoopThrough
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
					if Checkbox_Toggle ;Contains Toggle
						Send,{tab}{Space}{tab}{Space}
					else
						Sendinput,{tab}{tab}
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
		if Checkbox_Toggle ;Contains Toggle
			Sendinput,{tab}{Space}{tab}{Space}
		else
			Sendinput,{tab}{tab}
		Sendinput,{tab 10}^a
		sleep 100
		if Checkbox_Toggle ; Contains toggle
			return
		Send, %Iteration%
		sleep 100
		if !Checkbox_Toggle ; Not Contains toggle
			mousemove, xpos, ypos+26,0

		return
	}

	AddSampleLog(count)
	{
		global
		SetWinDelay, %NormalWinDelay%
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
			Click
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
				SetWinDelay, %NormalWinDelay%
			return
		}

		CopyProductRotation(){
			global
			clipboard:=
			send, ^c
			clipwait, 1
			sleep 400
			filename:= "Rotations\" Product ".txt"
			FileDelete, %FileName%
			FileAppend, %Clipboard%, %Filename%
			LMSwb:=ComObjactive("Excel.Application")
			Rotation:=lmswb.activeSheet.Range("A:A").Find(Product).offset(0,5)
			Rotation.Value:=Product ".txt"
			;iniwrite %Clipboard%, Settings.ini, Rotations, %Product%
		}

		PasteProductRotation(){
			global
			filename:= "Rotations\" Product ".txt"
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
			else if winactive("Edit Ingredient")
				clk(277, 557)
			else If winactive("Test Definition Editor ")
				Click 341, 618
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
	else if (A_ThisMenuItem = "Custom Heavy Metal")
		SpecTab.HM_Custom()
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
	else if (A_ThisMenuItem = "Custom Heavy Metal")
		SpecTab.HM_Custom()
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




;_______________________________________Other__________

TT(msg:="yo", time=1500, X:="",Y:="",N:="", Transparent:="",Position:="S") {
	global
  if Simpleclip
	return
	sleep 20
		tooltip, %msg%, %X%, %Y%,%N%
	hwnd := winExist("ahk_class tooltips_class32")
	if Transparent
		winSet, Trans, %Transparent%, % "ahk_id" hwnd
	; winSet, TransColor, FFFFFF 200, % "ahk_id" hwnd
	; winSet, Trans, 200, %W%
	CoordMode, ToolTip, screen
	; CoordMode, ToolTip, Relative
	SetTimer, RemoveToolTip%N%, -%time%
return
RemoveToolTip:
	ToolTip
return
RemoveToolTip1:
	ToolTip,,,,1
return
RemoveToolTip2:
	ToolTip,,,,2
return
RemoveToolTip3:
	ToolTip,,,,3
return
RemoveToolTip4:
	ToolTip,,,,4
return
}

FlashScreen(Text:="",Color:="Black", ToolTipTime:=250){
	global
	SplashImage,,B w%A_ScreenWidth% h%A_ScreenHeight% cw%Color%
	if !Text
		Text:=A_ThisHotkey
	tt(Text,ToolTipTime,A_caretx,A_caretY,4)
	Sleep,10
	SplashImage,off
return
}

class Breaking {
	Point(){
		Global
		If (GetKeyState("Lbutton", "P") || GetKeyState("Space", "P")) {
			TT("Broke",3000)
			SetWinDelay, %NormalWinDelay%
			SetKeyDelay, 0,0
			Critical, Off
			CoordMode, mouse, window
			CoordMode, Tooltip, window
			exit
		}
		if keep_running = n ;another signal to stop
			Exit
	}
	Preamble(){
		Global
		if keep_running = y
		{
			keep_running = n ;signal other thread to stop
			exit
		}
		keep_running = y
	}
}
MouseIsOver(winTitle){
	Global
	MouseGetPos,,, win
Return winExist(winTitle . " ahk_id " . win)
}

SendPassword(){
	if winExist("Login"){
		winactivate
		Sendinput, mmignin{tab}{-}{K}ilgore7744{enter}
	}
	Else If winexist("Sign :"){
		winactivate,
		Sendinput,{tab 2}{right 2}{tab 2}mmignin{tab}{-}Kilgore7744{enter}
	}
	else if winexist("windows Security"){
		winactivate,
		Sendinput, {-}Kilgore7744{enter}
	}
	else if winexist("CredentialUIBroker.exe"){
		winactivate,
		Sendinput, {-}Kilgore7744{enter}
	}

	else
		Sendinput, -{K}ilgore7744{enter}
return
}

ClickText(Button:="Lbutton", Count:="1"){
	mousegetpos, mousex, mousey
	SetDefaultMouseSpeed, 0
	mouseClick, %Button%, %A_CaretX%, %A_caretY%, %Count%
	mousemove, %mousex%, %mousey%, 0
	SetDefaultMouseSpeed, 1
}

ListArray(The_Array,Option:="n"){
	; global
	if (option<>"n"){
		for Each, Element in The_Array
			ArrayList .=Element " " Option " "
		return ArrayList
	}
	else {
  For Each, Element In The_Array {
        ArrayList .= "`n" A_index ": "
    ArrayList .= Element
  }
	return ArrayList
  }
}

HasValue(haystack, needle) {
	for index, value in haystack
		if (value = needle)
		return index
	if !(IsObject(haystack))
		throw Exception("Bad haystack!", -1, haystack)
return 0
}
Block(Time:=300, action:=""){
	Global N
	If N
		exit
	If action
		send % action
		sleep 100
		; TT(TooltipMessage)
	N:=1
	SetTimer, Block, -%time%
	return

	Block:
		N:=
		return
}

BlockRepeat(Time:=300, ToolTipMessage:=""){
	Global N
	sleep 25
	If N
		exit
	If ToolTipMessage
		TT(TooltipMessage)
	N:=1
	SetTimer, BlockTheInput, -%time%
	sleep 50
	return

	BlockTheInput:
		N:=
		return
}

Clk(x,y,Button:="Left",n=1,window:="",returnMouse:=1){
	global
	MouseGetPos, mx, my, mw,
	MouseReturn:="{click " Mx ", " My ",0}"
	if window
		if !winactive(window)
			sleep 500 ; winactivate, %window%
	mouseclick, %Button%, %x%,%y%,%n%,0
	sleep 25
	if (window!="")
		winactivate, %mw%
	If (ReturnMouse=0)
		Return MouseReturn
	else
		mousemove,%mx%,%my%,0
}







































		#ifwinactive,
	+#F11::SpecTab.ApproveSpecVersion()
	^#F11::SpecTab.NewSpecVersion()
	!#F11::SpecTab.RemoveTestSpec()
	~RWin::Send {Blind}{vkFF}
	<!left::GetAllProducts()
	<!right::GetAllBatches()
	; F1::sendinput, %Product%
	; F1::CountFiles()
	; +F1::GetAllProducts()
	; +F1::
		; SpecTab.GetRowText()
		; SpecTab.AutoFill()
		; return
	^+s::specTab.TestDefinitionEditor_Stability()
	!F1::GetAllProducts("`n")
	+F1::worktab.NewTestRequestLink()
	;F2::sendinput, %Batch%
	+F2::GetAllBatches()
	; !F2::GetAllBatches("`n")
	; F3::sendinput, %Lot%
	!1::ClipBar.Focus("Edit1")
	!2::ClipBar.Focus("Edit2")
	!3::ClipBar.Focus("Edit3")
	!4::ClipBar.Focus("Edit4")
	!5::ClipBar.Focus("Edit5")
	F4::sendinput, %Coated%
	; +F3::3tap()

	+F10::spectab.Autofill()
	; if !(Requirement)
	    ; iniread, MinLimit, Settings.ini, CopiedSpecs, MinLimit
        ; iniread, MaxLimit, Settings.ini, CopiedSpecs, MaxLimit
        ; iniread, Percision, Settings.ini, CopiedSpecs, Percision
        ; iniread, Requirement, Settings.ini, CopiedSpecs, Requirement
        ; iniread, Units, Settings.ini, CopiedSpecs, Units
        ; iniread, Description, Settings.ini, CopiedSpecs, Description
        ; iniread, ResultID, Settings.ini, CopiedSpecs, ResultID
        ; iniread, SeqNo, Settings.ini, CopiedSpecs, SeqNo
        ; iniread, Method, Settings.ini, CopiedSpecs, Method
	  ;copiedText:= ResultID "`t" Description "`n MinLimit: " MinLimit "`n MaxLimit: " MaxLimit "`n Requirement: " Requirement "`n Percision: " Percision "`n Units: " Units
	 ; TT(CopiedText,2000,1,1,1)

		; return
	+F4::4tap()
	+F9::worktab.CustomerMenu()
		; Sendinput, ^{c}
		; sleep 100
		; TT(Clipboard)
		; return
	^F8::AddToList()
	; +F15::AddToList()
	; ^F9::send, ^v
	$LWin::return





Test_msgbox(msg){
	global
	; msgbox % " Name: " Name[] "`n Claim: " Claim[] "`n Position: " Position[] "`n IngredientID: " IngredientID[]
	; TT(Listarray(Name))
	TT(msg,2000)
	; listarray(Position),1000,300,300,2,,"R")
	return
}
Ctest_1:
	return


showLabelCopy(FileDir,FileType‚ShowMultiple:=0){
  Global Product
  Loop, Files, %FileDir%*%Product%*.%FieType%*,R
  {
	; If (A_LoopFileTimeCreated=Rec)
		; {
		; if FPath2
			; FPath3=%FPath2%
		; FPath2=%A_LoopFileFullPath%
		; Rec=%A_LoopFileTimeCreated%
		; }
	If (A_LoopFileTimeCreated>Rec)
		{
		; if FPath
		; FPathB=%FPath%
		FPath=%A_LoopFileLongPath%
		Rec=%A_LoopFileTimeCreated%
		}
	}
	sleep 300
	Run, explore %Fpath%
;   if !ShowMultiple
    ; Return
;   Else
;   Sleep 500
;   if FPath2
    ; Run, explore %Fpath2%
;   if FPath3
    ; Run, explore %Fpath3%
;   if FPathB
    ; Run, explore %FpathB%
  return
  }




AddToList(){
	; ListItem:=[]
	TT("AddToList")
	; ListItem:=StrSplit(ParseText,"`n")
	CoordMode, mouse, window
	Loop, parse, clipboard, "`n"
	{
		TT(A_index ": `n" A_LoopField,2000)
		Breaking.Point()
		click, 407, 73 ;click New Value
		sleep 200
		click, 608, 201 ;click First EditBox
		sleep 200
		sendinput, %A_loopField%
		sleep 400
		Breaking.Point()
	}
	return
		; CoordMode, mouse, Screen
}



; CountFiles(){
; 	global
; 	currentfile:="\\10.1.2.118\Final_C_O_A"
; 	currentfile3:="\\10.1.2.118\Final_C_O_A\*.pdf"
; ; msgBox, % ComObjCreate("Scripting.FileSystemObject").GetFolder("\\10.1.2.118\Final_C_O_A").Files.Count
; ; MsgBox, % ComObjCreate("Shell.Application").NameSpace("\\10.1.2.118\Final_C_O_A").Items.Count
; Loop, %currentfile3%{
; oOwner:=ComObjGet("winmgmts:").ExecQuery("Associators Of {" "Win32_LogicalFileSecuritySetting='" %Currentfile% A_LoopFileName "'} Where As" "socClass= Win32_LogicalFileOwner ResultRole=Owner")
; For itm in oOwner
;   Owner:=itm.ReferencedDomainName . "\" . itm.AccountName

; msgbox % Owner
; }

; }
;; _____________________________LMS KEYBINDINGS____________________________
	#Ifwinactive, NuGenesis LMS ;; ___Nugenesis
		+^F10::
		if !(Iteration) ; || (Iteration > 20) || (iteration < 1)
			SpecTab.FullRemoveTest()
		else
		{
			loop, %iteration%
				{
					SpecTab.FullRemoveTest()
					sleep 2000
					Breaking.Point()
				}
		}
			return


		; +F3::AddToList()
		mbutton:: 3tap()
		^mbutton::lms.Menu()
		; F19::lms.Menu()
		F7::3Right()
		F6::3Left()
		Enter::LMS.SaveCode()
		; >+F20::LMS.SearchbarPaste()
		; +^v::LMS.SearchbarPaste()
		; <^v::lms.searchbarPaste()


	#Ifwinactive,Select Iterations
		^F9::LMS.PasteProductRotation()
	; #Ifwinactive,Book
		; +F9::LMS.CopyProductRotation()
	#Ifwinactive,Test Definition Editor
		enter::clk(333,615)
		mbutton::
			clk(338,617)
			sleep 400
			clk(910,668)
			return
		+enter::sendinput, {enter}
	#Ifwinactive, Result Entry ;;___Result_Entry
		; #MaxThreadsPerHotkey 2
		+Mbutton::
		F10::WorkTab.CorrectTestResults("loop")
		; #MaxThreadsPerHotkey 1
	#Ifwinactive, Results Definition ;;__Results_Definition:
		Enter::
		mbutton::clk(910,668)
		; F10::lms.menu()
		+mbutton::lms.menu()
		+enter::sendinput, {enter}
; space::sendinput,{ctrldown}{click}{ctrlup}
	#ifwinactive, Register new samples ;;__Register_new_samples:
		F6::
			clk(181, 104,2,2)
			sleep 300
			Send, %Product%{enter}
			return

	#ifwinactive, New Document
		Enter::
			LMS.SaveCode()
			LMSclick.okay()
			return
		+enter::sendinput, {enter}
	#ifwinactive, Reason for Change
	#ifwinactive, Select tests for request:
		; space::send, ^{click}
		; rbutton::send, ^{click}
		; Numpaddot::send, {click 837, 656}{
	#ifwinactive, Edit request
		F10::Worktab.EditRequest()
	#ifwinactive, Select samples for test:
	#Ifwinactive, ahk_exe eln.exe ;;___LMS app
		;;^`::						ClipBar.reset()
		enter::						LMSclick.okay()
		+enter::					sendinput, {enter}
		^enter::					sendinput, {enter}
		esc::						LMSclick.esc()
		F8::						3down()
		F7::						3Right()
		F6::						3Left()
		+Mbutton::					4tap()
		^F10::						4tap()
		mbutton::					3tap()
		; +!F10::					3tap()
	#Ifwinactive,
		esc::						esc
		pause::						Suspend, Toggle
		#h::return
		#p::return
		#k::return
		>+Backspace::			Delete
		F20 & esc:: 			run, Taskmgr.exe
		F20 & backspace:: 		Send, {delete}
		F20 & =:: 		Send,{ctrldown}{=}{ctrlup}
		F20 & -:: 		Send,{ctrldown}{-}{ctrlup}
		return



;;____________________TouchPad BINDINGS__________________________________________
	3tap(){
		Global
			if winactive("NuGenesis LMS"){ ; If Nugeneses
				LMS.DetectTab()
				; if (Tab="Samples")
					; Menu, Menu, add, New &Request, AutoFill
				if (Tab="Tests"){
					Menu,Menu, add, &Delete Retain, Autofill
					Try Menu,menu,show
				}
				else if (Tab="Specs") {
						SpecTab.CopySpecTemplate()
					return
				}
				else if (Tab="Requests")
					clk(61, 635) ;enter results
				else if (Tab="Products")
					clk(67, 754) ;edit results
				else if (Tab="Samples"){
					send, {click 124, 294} ;assign Requests
					sleep 500
					if !winactive("Edit request")
						sleep 500
					send, {click, 258, 613}
					sleep 800
					if !winactive("Select tests for request: R")
						sleep 500
					winactivate, Select tests for request: R
						send, {click, 31, 102}
					return
				}

			}
			if winexist("Delete Test") || winexist("Delete Tests") || winexist("Delete results") || winexist("Delete sample templates") || winExist("Delete specification") { ; Press Okay
					winactivate,
					send, y
					clk(229, 136)
					return
				}
			else if winactive("Result Editor")
					SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,1,FullRequirements)
					; winWaitactive, NuGenesis LMS, 5
					; copyPasteToggle=0

			else if winactive("Register new samples")
					WorkTab.registerNewSamples()
			else if winactive("Test Definition Editor")
					mouseclick, left, 333, 615
			; else if winactive("Login")
			; 		menu.passwords()
			else if winactive("Result Entry") {
					MouseGetPos, xpos, ypos
					WorkTab.CorrectTestResults("toggle")
					mousemove, %xpos%, %yPos%+26,0
				}
			else if winactive("Edit specification")
					SpecTab.Edit_Analytical()
			else if winactive("Results Definition")
					lms.menu()
			else if winactive("Composition")
					ProductTab.Table()
			else if winactive("Select methods tests")
					clk(854, 658)
			; else If winactive("Select methods tests")
					; SpecTab.Table()
			else if winactive("Edit Formulation")
					productTab.AddNewFormulation()
			else if winactive("Select Product")
					send % clk(107, 66) Product "{enter}{enter}"
			else if winactive("Edit request")
					WorkTab.EditRequest()
			else if winactive("Edit Product")
					ProductTab.AddNewProduct()
			else If winactive("Select tests for request: R")
					WorkTab.SelectTestSample()
			else if winexist("Release: ") || winexist("Release: Rotational Testing Schedule") { ; Press Okay
					winactivate,
					clk(131, 144)
				}
			else if winexist("Sign :") || winexist("windows Security")
					Sendpassword()
				; return
			; }
		; else if winactive("ClipBar ahk_exe RemoteVQ.exe"){
		; 		click
		; 		sleep 100
		; 		ClipBar.WM_LBUTTONDBLCLK()
		; }
	}


	3Right(){
		global
		If winactive("NuGenesis LMS")
			LMS.SearchBar(Batch,"{enter}")
		else If winactive("Result Entry")
			WorkTab.CorrectTestResults()
		else If winactive("Select methods tests")
			SpecTab.Methods()
		else If winactive("Composition")
			Send, {enter}
		else If winactive("Test Definition Editor")
			clk(330, 619) ;click save
		else If winactive("Results Definition"){
			Send, {enter}
			sleep 200
			winactivate, "Test Definition Editor"
			clk(330, 619)
		}
		else if winactive("Register new samples")
			clk(502, 354)
		else if winactive("Select samples for test:") ; selecting the physical or micro
			send % Clk(504, 324) "{click, 849, 661}"  ; add test.
		else if winactive("Edit request (Field Configuration:")
			send, {click 332, 617} ;click save
		else if winactive("Select tests for request: R"){
				send, {click 504, 338}{click 846, 659}  ; add test.
				sleep 300
		}
		else if winactive("ahk_exe eln.exe")
			Send, %Batch%
		else
			Send, %Batch%
		return
		}
	3left(){
		global
		if winactive("NuGenesis LMS")
				LMS.SearchBar(Product,"{enter}",0)
		else If winactive("Select methods tests")
			Send, {esc}
		else If winactive("Composition")
			Send, {esc}
		else If winactive("Test Definition Editor")
			Send, {esc}
		else If winactive("Results Definition")
			Send, {esc}
		else if winactive("Edit test (Field Configuration:")
			send, {esc}
		else if winactive("Edit sample template")
			Sendinput, {click 438, 84}{home}{delete 4}%Product%{enter}
		else if winactive("Register new samples")
			Send, {esc}
		else if winactive("Select samples for test:")
			Send, {esc}
		else If winactive("Result Entry")   ;Enter Test Results window"
			WorkTab.CorrectTestResults("toggle")
		else if winactive("ahk_exe eln.exe")
			Send, %Product%
		else
			send, %Product%
		return
	}
	3down(){
		global
		; FlashScreen("3-Down")
		if winactive("Select samples for test:")
			Clk(853, 657) ; click okay.
		return
	}
	; 3up(){
	; 	global
	; 	; FlashScreen("3-Up")
	; 	; if winactive("Results Definition")
	; 	; 	lms.menu()
	; 	; if winactive("Register new samples")
	; 	; 	LMS.SearchBar(Product,"{enter}")
	; 	; else If winactive("Select tests for request: R")
	; 	; 	mouseclick, Left, 638, 70
	; 	; else if winactive("Select samples for test:")
	; 	; 	send % Clk(250, 70) "{up}" ; click okay.
	; 	; else if winactive("Result Entry")
	; 	; 	return
	; 	; else If winactive("Composition")
	; 	; 	return
	; 	; else
	; 		return
	; }
		;;	_____4Fingers
		4tap(){
		global
		; FlashScreen(tab)
			If winactive("NuGenesis LMS") {
				LMS.Detecttab()
				if (Tab="Requests") {
							MouseGetPos, mx, mY
							send, {click 2}
							sleep 500
								if !winactive("Edit test")
									winactivate
								sleep 300
								if winactive("NuGenesis LMS")
									mousemove, %mx%, %My% ,0
								return
						return
					}
					else If (tab:="Samples")
					lms.menu()
				else if (Tab:="Products")
						mouseclick, left, 78, 443 ;edit compositi
				else if (Tab="Specs")
						lms.menu()
				else
					return
			}
			else if winactive("Edit sample")
				worktab.CustomerMenu()
			else if winactive("Composition")
				ProductTab.AddCOASpace()
			else if winactive("Register new samples"){
				Send, {click}
				Excel.Batches()
				winactivate, Register new samples
					sleep 200
					WorkTab.registerNewSamples()
					return
			}
			else if winactive("Edit test"){
				sendinput,{click 384, 222}{tab 2}{end 2}
				sendinput % "(on sample log)"
				sendinput, {Click 334, 618}
			}
			return
	}



#ifwinactive, ahk_exe eln.exe
	:*:sl`;::`(On Sample Log)
	:*:fm`;::`Finished, Micro
	:*:ia`;::`In Process, Analytical
	:*:iaa`;::`In Process, Analytical (Annual)
	:*:ip`;::`In Process, Physical
	:*:ir`;::`In Process, Retain
	:*:cr`;::`Coated, Retain
	:*:ca`;::`Coated, Analytical
	:*:cp`;::`Coated, Physical
	:*:in`;::`ingredient
#Ifwinactive, Edit Formulation
	:*R:00`;::`#00 capsule / 0.917`" x 0.336`"
	:*R:00e`;::`#00 elongated capsule / 0.995`" x 0.336`"
	:*R:3`;::`#3 capsule / 0.626`" x 0.229`"
	:*R:2`;::`#2 capsule / 0.709`" x 0.250`"
	:*R:1`;::`#1 capsule / 0.765`" x 0.272`"
	:*R:0`;::`#0 capsule / 0.854`" x 0.300`"
	:*R:USP`;::`Meets USP Requirements
	:*R:fr`;::`Fixing Rotation
	:*R:7/16`;::`Round / 0.4375`"
	:*R:5.5o`;::`Oblong / 0.750`" x 0.313`"
	:*R:5.5ov`;::`Oval / 0.625`" x 0.344`"
	:*RR:5o`;::`Oblong / 0.750`" x 0.250`"
	:*:1s`;::
	sendinput, `Each (1) scoop (%ShapeAndSize% g) contains{tab}^{a}Blend{tab}^{a}%color%+{tab 2}^{left 3}{left}
	return
	:*:2s`;::
	sendinput, `Each two (2) scoop (%ShapeAndSize% g) contains{tab}^{a}Blend{tab}^{a}%color%+{tab 2}^{left 3}{left}
	return
	:*:3s`;::
	sendinput, `Each three (3) scoop (%ShapeAndSize% g) contains{tab}^{a}Blend{tab}^{a}%color%+{tab 2}^{left 3}{left}
	return
	:*:1sp`;::
	sendinput, `Each (1) stick packet (%ShapeAndSize% g) contains{tab}^{a}Blend{tab}^{a}%color%+{tab 2}^{left 3}{left}
	return
	:*:2sp`;::
	sendinput, `Each two (2) stick packet (%ShapeAndSize% g) contains{tab}^{a}Blend{tab}^{a}%color%+{tab 2}^{left 3}{left}
	return
	:*:3sp`;::
	sendinput, `Each three (3) stick packet (%ShapeAndSize% g) contains{tab}^{a}Blend{tab}^{a}%color%+{tab 2}^{left 3}{left}
	return
	:*:1c`;::`Each (1) capsule contains
	:*:2c`;::`Each two (2) capsules contains
	:*:3c`;::`Each three (3) capsules contains
	:*:4c`;::`Each four (4) capsules contains
	:*:5c`;::`Each five (5) capsules contains
	:*:6c`;::`Each six (6) capsules contains
	:*:7c`;::`Each seven (7) capsules contains
	:*:1t`;::`Each (1) tablet contains
	:*:2t`;::`Each two (2) tablets contains
	:*:3t`;::`Each three (3) tablets contains
	:*:4t`;::`Each four (4) tablets contains
	:*:5t`;::`Each five (5) tablets contains
	:*:6t`;::`Each six (6) tablets contains
	:*:7t`;::`Each seven (7) tablets contains

#ifwinactive


GetAllBatches(Delimiter:=" ",File:=""){
  global
  regBatches:=[]
		Haystack:=Clipboard
		; PreClip:=Clipboard
		sleep 50
  while pos := RegexMatch(Haystack, "i)(?<!Ct#)\b\d{3}-\d{4}\b", aBatch, pos+1)
      regBatches.insert(aBatch)
      AllBatches:=[], oTemp := {}
      for vKey, vValue in regBatches
      {
          if (ObjGetCapacity([vValue], 1) = "") ;is numeric
          {
              if !ObjHasKey(oTemp, vValue+0)
                  AllBatches.Push(vValue+0), oTemp[vValue+0] := ""
          }
          else
          {
              if !ObjHasKey(oTemp, "" vValue)
                  AllBatches.Push("" vValue), oTemp["" vValue] := ""
          }
        }
    AllBatches:=Listarray(AllBatches,"")
    AllBatches:= StrReplace(AllBatches, A_space A_space, Delimiter)
    AllBatchesDDL:= StrReplace(AllBatches, A_space A_space, "`r`n")


    SimpleClip:=1
    sleep 20
		clipboard:=AllBatches
		; LMS.Searchbar(AllBatches)
		sleep 200
		; send, ^v
		; TT(AllBatches)
    sleep 400
    SimpleClip:=0
    ;clipboard:=PreClip
		return AllBatches
}

GetAllProducts(Delimiter:=" ",File:=""){
  global
  regProducts:=[]
  pos=0
		Haystack:=Clipboard
    ; PreClip:=Clipboard
		sleep 50
  while pos := RegexMatch(Haystack, RegexProduct, aProduct, pos+1)
      regProducts.insert(aProduct)
      AllProducts:=[], oTemp := {}
      for vKey, vValue in regProducts
      {
          if (ObjGetCapacity([vValue], 1) = "") ;is numeric
          {
              if !ObjHasKey(oTemp, vValue+0)
                  AllProducts.Push(vValue+0), oTemp[vValue+0] := ""
          }
          else
          {
              if !ObjHasKey(oTemp, "" vValue)
                  AllProducts.Push("" vValue), oTemp["" vValue] := ""
          }
        }
    AllProducts:=Listarray(AllProducts,"")
    AllProducts:= StrReplace(AllProducts, A_space A_space, Delimiter)
    SimpleClip:=1
    sleep 20
    clipboard:=AllProducts
    sleep 200
	; LMS.Searchbar(AllProducts)
    ;send, ^v
	; TT(AllProducts)
    sleep 400
    SimpleClip:=0
    ;clipboard:=Preclip
		Return AllProducts
}