#ifwinactive,
return
~RWin::Send {Blind}{vkFF}
~LWin::Send {Blind}{vkFF}
; +F4::ExitApp
^esc::ExitApp
!esc::Reload



	;;--------------------------------------------------
	;;[[              ClipBar keybindings                    ]]
#If MouseIsOver("Methods List ahk_exe VQ_Helper.exe")
	Lbutton::send, {ctrldown}{Lbutton}{ctrlup}

#If MouseIsOver("ClipBar ahk_exe VQ_Helper.exe")
	; wheelup::
	; critical
	; If NAdd
	;   {
	;   sleep 500
	;   return
	;   }
	;   NAdd:=1
	; ; ControlGetFocus,winControl,ClipBar
	; if (wincontrol="Edit5")
	;   Clipbar.AddIteration(500)
	; if (winControl="Edit1"){
	;   GetAllProducts(" ", 1)
	;     ; ControlsetText, Edit6,%GetAllProducts(" ")%,ClipBar
	;   }
	; if (winControl="Edit2"){
	;   GetAllBatches(" ", 1)
	;   ; ControlsetText, Edit6,%AllBatches%,ClipBar
	;   ; TT(AllBatches,2000,ClipBar_x2,35,2,250)
	; }
	; if (winControl="Edit3")
	;   PriorCodesMenu(1)
	; if (winControl="Edit4")
	;   PriorCodesMenu(1)
	; if (winControl="Edit6"){
	;   WholeBatchMenu()
	;     ; ControlsetText, Edit6,%AllBatches%,ClipBar
	;     ; TT(AllBatches,2000,ClipBar_x2,35,2,250)
	;   }
	; else ;(winControl="Edit3")
	;   sleep 500
	;   NAdd:=
	; return




	; wheeldown::
	; critical
	; If NAdd
	;   {
	;   sleep 500
	;   return
	;   }
	;   NAdd:=1
	; if (wincontrol="Edit5")
	;   Clipbar.SubIteration(200)
	;  if (winControl="Edit1")
	;   PriorCodesMenu(1)
	; if (winControl="Edit3")
	;   PriorCodesMenu(1)
	; if (winControl="Edit4")
	;   PriorCodesMenu(1)
	;  if (winControl="Edit6"){
	;   MsgBox, 4, Delete file, Do you want to delete WholeBatches.txt?
	;   IfMsgBox, OK
	;       FileDelete, WholeBatches.txt
	;   }
	; else ;(winControl="Edit3")
	;   sleep 500
	; NAdd:=



	Mbutton::
		; ControlGetFocus,winControl,ClipBar
		if (wincontrol="Edit5")
			worktab.CustomerMenu()
		else if (winControl="Edit1")
			GetAllProducts(" ")
		else if (winControl="Edit2")
			GetAllBatches(" ")
		else if (winControl="Edit3")
			ControlsetText, Edit3,,ClipBar
		else if (winControl="Edit4")
			ControlsetText, Edit4,,ClipBar
		else
			MenuCodeSelect()
	return


#if

#Ifwinactive, ClipBar ahk_exe VQ_Helper.exe
	enter::
		GUI, ClipBar:default
		Send, ^a^c
		LMS.Searchbar(clipboard,"{enter}")
	return
	+enter::
		GUI, ClipBar:default
		Send, ^a^c
		LMS.Searchbar(clipboard,"{enter}","False")
	return

	; 	Gui, ClipBar:submit, nohide
	; }
	; 	else if (winControl="Edit4"){
	; 		Coated:=
	; 		GUI, ClipBar:default
	;
	; 		Gui, ClipBar:submit, nohide
	; 		iniwrite, Coated, Settings.ini, SavedVariables, Coated
	; 	}
	; Mbutton::
	; 		; ControlGetFocus,winControl,ClipBar ahk_exe VQ_Helper
	; 		; MouseGetPos, , , winid, wincontrol
	; 		; if (winControl="Edit1") || (winControl="Edit2") || (winControl="Edit3"){
	; 			ClipBar.Menu()
	; 			return
	; }
	; else if (winControl="Edit4"){
	; Coated:=
	; GUI, ClipBar:default
	; ControlsetText, Edit4,%Coated%,ClipBar ahk_exe VQ_Helper
	; Gui, ClipBar:submit, nohide
	; iniwrite, Coated, Settings.ini, SavedVariables, Coated
	; }

	;;------------------------------------------------
	;;[[   		Windows KEYBINDINGS                 ]]
	;;------------------------------------------------

#ifWinExist, Select Product ahk_exe EXCEL.EXE
	Mbutton::
		WinActivate, Select Product ahk_exe EXCEL.EXE
		sendinput, {Click 112, 63}%Product%{enter}{enter}
		; SelectProductToggle:=
		WinWaitActive, Book ahk_class XLMAIN ahk_exe EXCEL.EXE, ,3
		if !Errorlevel
			WinMove, Book ahk_class XLMAIN ahk_exe EXCEL.EXE,, 4, 1, 1150, 1200
		WinMove, Book ahk_class XLMAIN ahk_exe EXCEL.EXE,, 4, 1, 1150, 1200
	return

#ifWinExist, LMS Actions ahk_exe EXCEL.EXE
	+enter::

	Mbutton::
		WinActivate, LMS Actions ahk_exe EXCEL.EXE
		sendinput, {click 45, 43}
		winwaitactive, Select Product ahk_exe EXCEL.EXE,, 5
		if !ErrorLevel
			sendinput, {Click 112, 63}%Product%{enter}{enter}
	return


#ifwinactive, Test Definition Editor ;;    Test Definition Editor
	wheeldown::clk(464, 532,,1) ;add scroll block
	; 		mbutton::mouseclick, left, 333, 615

#ifwinactive, Edit sample template ;;    Edit sample template
	F6::Sendinput,{Click 256,85}%Product%, `In Process, Analytical{tab 3}{right 6}{tab}{right}
	F7::Sendinput, %Product%
	:*:fm`;::
		Sendinput, `Finished, Micro{tab 3}{right 5}{tab}{right 2}
	Return
	:*:ia`;::
		sendinput, `In Process, Analytical{tab 3}{right 6}{tab}{right}
	Return
	:*:iaa`;::
		Sendinput, `In Process, Analytical (Annual){tab 3}{right 6}{tab}{right}
	Return
	:*:ip`;::
		Sendinput, `In Process, Physical{tab 3}{right 7}{tab}{right}
	Return

#ifwinactive, Edit specification ;;    Edit specification
	mbutton::SpecTab.Edit_Analytical()
	Enter::LMSClick.Okay()
	+Enter::Sendinput, {enter}



#ifwinactive, Composition ;;    Composition
	^v::
		Clk(56, 66) ;click add
		winwait, Edit Ingredient
		gosub, Paste_Clipped_Ingredient
	return
	mbutton::ProductTab.Table()

#Ifwinactive,Edit Ingredient
	Mbutton::
	Paste_Clipped_Ingredient:
		mouseclick, left, 244, 133,1,0
		sendinput, {tab 4}^{a}%clipped_Position%{tab}%clipped_LabelName%{tab 2}%clipped_LabelClaim% ;click potencty box
		if (clipped_IngredientGroup)
			Sendinput, {Tab}%clipped_IngredientGroup%	;ingredientgroup
		mousemove, 280, 558, 0
		Tooltip
	return
	F9::ProductTab.IngredientsMenu()
	; mbutton::productTab.AddNewFormulation()

#Ifwinactive, Edit Formulation

	:*:00e`;::00 elongated capsule / 0.995`" x 0.336`"
	:*:00`;::00 capsule / 0.917`" x 0.336`"
	:*:3`;::3 capsule / 0.626`" x 0.229`"
	:*:2`;::2 capsule / 0.709`" x 0.250`"
	:*:1`;::1 capsule / 0.765`" x 0.272`"
	:*:0`;::0 capsule / 0.854`" x 0.300`"
	:*:USP`;::Meets USP Requirements
	:*:fr`;::Fixing Rotation
	:*:7/16`;::`Round / 0.4375`"
	:*:5.5o`;::`Oblong / 0.750`" x 0.313`"
	:*:5.5ov`;::`Oval / 0.625`" x 0.344`"
	:*:5o`;::Oblong / 0.750`" x 0.250`"
	:*R:1c;::Each (1) capsule contains
	:*R:2c`;::Each two (2) capsules contains
	:*R:3c`;::Each three (3) capsules contains
	:*R:4c`;::Each four (4) capsules contains
	:*R:5c`;::Each five (5) capsules contains
	:*R:6c`;::Each six (6) capsules contains
	:*R:7c`;::Each seven (7) capsules contains
	:*R:1t`;::Each (1) tablet contains
	:*R:2t`;::Each two (2) tablets contains
	:*R:3t`;::Each three (3) tablets contains
	:*R:4t`;::Each four (4) tablets contains
	:*R:5t`;::Each five (5) tablets contains
	:*R:6t`;::Each six (6) tablets contains
	:*R:7t`;::Each seven (7) tablets contains
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



#ifwinactive, Select methods tests ;;    Select methods tests
	+enter::clk(854, 658,,2) ;select okay
	#enter::clk(854, 658,,2) ;select okay
	^enter::clk(854, 658,,2) ;select okay
	F7::clk(511, 337,,,,2) ;move over test
	F6::clk(511, 375,,,,2) ;move test back over
	F9::
	mbutton::Spectab.MethodsDropdown()

#ifwinactive, Select Product ahk_exe eln.exe ;;    Select Product
	mbutton::send % clk(107, 66) Product "{enter}{enter}"

#ifwinactive, Edit Product ;;    Edit Product
	mbutton::ProductTab.AddNewProduct()
#Ifwinactive, Edit Formulation ;;    Edit Formulation
	mbutton::ProductTab.AddNewFormulation()
	wheeldown::clk(452, 473,,1)  ;add scroll block
#Ifwinactive, Select samples for test:
	Mbutton::sendinput, {click 248, 68}{up} ;click dropdown then
	F8::Clk(853, 657) ;click okay
	F9::send % Clk(250, 70) "{up}" ; click okay.
	F7::SpecTab.Methods()
	F6::SpecTab.MethodsDropdown()


#IFwinexist, Release: Rotational Testing Schedule ;
	mbutton::
		winactivate,Release: Rotational Testing Schedule
		clk(128, 140)
	return
#ifwinexist, Release:
	mbutton::
		winactivate, Release:
		clk(128, 140)
	return

#ifwinexist, Sign :
	mbutton::Sendpassword()

#ifwinactive, ahk_exe explorer.exe ;;    ahk_exe explorer.exe
	F9::send, ^{e}
	F7::
		winactivate, explorer.exe,,VQ_Helper
		sendinput, ^{e}{*}%Product%{*}
		sleep 300
		sendinput, {tab 2}{right}{pgup 2}
	return
	F8::send, ^{F4}
	Mbutton::send, ^{e}{*}%Product%{*}{enter}{down 2}{up}
	; +Mbutton::SelectPreviewPane()
	F6::
		winactivate, ahk_exe explorer.exe,,VQ_Helper
		sendinput, ^{e}
		send, {tab 2}{right}
	return

#ifwinactive, Edit test `(Field Configuration ;;    Edit test (Field Configuration
	+Mbutton::
	; F10::Send,{Click, 402, 284}{end}{down 2}{shiftdown}{9}{shiftup}on sample log{shiftdown}{0}{shiftup}{click, 334, 618}
	; +F10::
	; 	sendinput, {click 384, 222}{tab 2}{end 2}
	; 	sendinput, {shiftdown}{9}{shiftup}on sample log{shiftdown}{0}{shiftup}
	; 	sendinput, {Click 334, 618}
	; 	return



#Ifwinactive,Select Iterations
	^F9::LMS.PasteProductRotation()
#Ifwinactive,Book
	+F9::LMS.CopyProductRotation()
#Ifwinactive,Test Definition Editor
	mbutton::
		sleep 200
		if (Description)
			SpecTab.TestDefinitionEditor(Description) ; the pre window
		Breaking.Point()
		sleep 200
		MouseClick, left, 464, 532,2,0 ;click scrollbar
		click 239, 246 ;results link
		sleep 200
		Breaking.Point()
		winactivate, Results Definition
		sleep 100
	return
	;enter::sendinput, {enter}

#Ifwinactive, Result Entry ;;    Result_Entry
	F7::numbermenu(6,"ToggleResults") ;WorkTab.CorrectTestResults("toggle", "Loop")
	F6::WorkTab.CorrectTestResults(0,5)
	F10::WorkTab.CorrectTestResults()
	Mbutton::WorkTab.CorrectTestResults("Toggle")
	F9::numbermenu(6)

#Ifwinactive, Results Definition ;;    Results_Definition:
	+mbutton::SpecTab.Autofill()
	; If InStr(Clipboard, "Use the limits from the test", true,1,1){
	; 	clip.ParseSpecsTable(1)
	; msgbox, after the clipboard
	; return

	; }
	; else
	; 	sendinput, ^v
	; return
	mbutton::                     ;ifor pasting clipboards into specs}}
		winactivate, Results Definition
		tooltip,
		Send,{click 80, 66} ;click edit
		sleep 200
		Breaking.Point()
		winwaitactive, Result Editor,,2
		if !errorlevel
			If (Clipped_specs){
				clipped_Specs:=
				sleep 100
			}
		If (MinLimit || MaxLimit) && !(FullRequirements)
			SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,1,1)
		else If (MinLimit || MaxLimit) && (FullRequirements)
			SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,1,FullRequirements)
		else If (!MinLimit && !MaxLimit)
		{
			inputbox, InputBoxString, inputstring, Min Limit,Max Limit,Units,Requirement
			ParsedString:=StrSplit(InputBoxString,",")
			MinLimit:=ParsedString[1]
			MaxLimit:=ParsedString[2]
			If ParsedString[3]
				FullRequirements:=ParsedString[3]
			Else
				FullRequirements:=1
			If ParsedString[4]
				Units:=ParsedString[4]
			Else
				Units:=""
			; inputbox, Units, Units, Units
			sleep 200
			Breaking.Point()
			SpecTab.ResultEditor(MinLimit,MaxLimit,Units,"",1,FullRequirements)
			minlimit:=
			maxlimit:=
			units:=
		}
		else
			return
	return
	F9::lms.menu()

#ifwinactive, Result Editor ;;    Result Editor
	mbutton::SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,1,FullRequirements)
	wheelDown::clk(503, 574,1) ;add scroll block
	F7::SpecTab.ResultEditor("","100,000","CFU/g",0,0,,1)


#ifwinactive, Register new samples ;;    Register new samples
	F6::
		clk(181, 104,2,2)
		sleep 300
		Send, %Product%{enter}
	return
	+Mbutton::
		loop, 4
		{
			Breaking.Point()
			WorkTab.regiwSamples()
			sleep 300
			Breaking.Point()
		}
		Breaking.Point()
	return
	mbutton::WorkTab.registerNewSamples()

#ifwinactive, Reason for Change ;;    Reason for Change
	F9::Sendinput, {Click 160 130}^{a}Fixing Rotation{Click 240 237 0}

#ifwinactive, Select tests for request: ;;    Select tests for request:
	; F10::sendinput, {click, 31, 102}
	F6::SpecTab.Methods()
	F7::SpecTab.MethodsDropdown()
	mbutton::WorkTab.SelectTestSample()
	F9::mouseclick, Left, 638, 70
#ifwinactive, Edit request ;;    Edit request
	mbutton::WorkTab.EditRequest()

#ifwinactive, Edit sample ( ;;    Edit sample
	F9::worktab.CustomerMenu()

; #ifwinactive, Select samples for test: ;;    Select samples for test:

	;;------------------------------------------------
	;;[[              Nugenesis MAIN                ]]
	;;------------------------------------------------



; #ifwinExist, ahk_class tooltips_class32



#Ifwinactive, NuGenesis LMS

	!F10::SpecTab.CopySpecTemplate()
	!F9::
		If (LMS.DetectTab() != "Requests"){
			send, {click 40 40}
			sleep 50
			send,{click 50 75 0}
			sleep 50
			send,{click 280 75 0}
			sleep 100
			send,{click 280 220}
		}
		else
			return
	return
	!Mbutton::SpecTab.Table()
	;^F10::LMS.AddSampleLog(15)
	+Mbutton::
		AutoInputTestResults(){ ;;{{Testing out auto input test results}}
			MouseGetPos, Prex, prey
			click, 57, 719 ;click Edit Test
			SelectedTestName:=
			winwaitactive, Test Definition Editor,, 2
			clipboard:=
			SimpleClip:=1
			send, {tab 1}^a^c
			ClipWait, 1
			SelectedTestName:=Clipboard
			ControlsetText, Edit6,%SelectedTestName%,ClipBar
			MatchingRow:=SpecTab.FindRowNumber(SelectedTestName)
			SpecTab.GetRowText(MatchingRow)
			if !MatchingRow
			{
				winactivate, Test Definition Editor
				MouseClick, left, 464, 532,2,0
				SpecTab.ShowSpecMenu()
				winactivate, Test Definition Editor
			}
			spectab.Autofill()
			preY+=26
			WinWaitActive, NuGenesis LMS,, 10
			if !errorlevel
				MouseMove, %preX%, %preY%, 1,
			return
		}
	return
	Mbutton::SpecTab.CopySpecTemplate()
	F9::lms.Menu()
	F6::LMS.SearchBar(Product,"{enter}",0)
	+F6::clk(54,734,"",1,"NuGenesis LMS",2)  ;:((Delete Test))
	F7::LMS.SearchBar(Batch,"{enter}",0)
	+F7::clk(66,750,"",1,"NuGenesis LMS",2) ;:((Enter Result))
	F8::LMS.SearchBar("",,"False")
	+#v::LMS.Searchbarpaste(";")
	+^v::LMS.Searchbarpaste(";")
	<^v::LMS.Searchbarpaste(A_space)


;;-------------------------------------------------------------------
;;[[                           LMS                                 ]]
;;-------------------------------------------------------------------





#Ifwinactive, ahk_exe eln.exe


	enter::LMSclick.okay()
	esc::LMSclick.esc()
	F7::3Right()
	F6::Send, %Product%
	+mbutton::lms.Menu()
	F9::lms.Menu()

	<!left::GetAllProducts()
	<!right::GetAllBatches()
	F13::breaking.point(1)
	+!F5::LMS.Menu()
	^Space::LMS.SearchBar("",,"False")
	!^Space::LMS.SearchBar("","{delete}","False")
	^+F16::GetAllProducts()
	^+F15::GetAllBatches()
	; ^1::sendinput % GetAllProducts(" ")
	; ^2::sendinput % GetAllBatches(" ")
	!F1::sendinput % GetAllProducts(" ")
	!F2::sendinput % GetAllBatches(" ")


		^`;::sendinput % GetAllProducts("`;")
		+^`;::sendinput % GetAllBatches("`;")
	^,::sendinput % GetAllProducts(", ")
	+^.::sendinput % GetAllBatches(", ")
	+^,::sendinput % GetAllBatches(", ")
	^.::sendinput % GetAllBatches(", ")

	; ^3::WholeBatchMenu()
	!F3::WholeBatchMenu()
	F5::WholeBatchMenu()
	#+!F10::LMS.AddDataFromClipboard()
	;#+^F10::clip.ParseSpecsTable()

	pause::						Suspend, Toggle
	#h::return
	#p::return
	#k::return
	>+Backspace::			Delete
	F8::esc




	:*:osl`;::`(On Sample Log)
	:*:fm`;::`Finished, Micro
	:*:ia`;::`In Process, Analytical
	;:*:pia`;::%product%`, In Process, Analytical
	:*:pm`;::
		Sendinput, %product%`, Finished, Micro{tab 3}{right 5}{tab}{right 2}
	Return
	Return
	:*:paa`;::
		Sendinput, %product%`, In Process, Analytical (Annual){tab 3}{right 6}{tab}{right}
	Return
	:*:pp`;::
		Sendinput, `In Process, Physical{tab 3}{right 7}{tab}{right}
	return
	:*:pr`;::
		Sendinput, `In Process, Retain{tab 3}{right 7}{tab}{right}
	return
	:*:iaa`;::`In Process, Analytical (Annual)
	;:*:piaa`;::%Product%`, In Process, Analytical (Annual)
	:*:ip`;::`In Process, Physical
	:*:ir`;::`In Process, Retain
	:*:st`;::`Stability
	:*:cr`;::`Coated, Retain
	:*:ca`;::`Coated, Analytical
	:*:cp`;::`Coated, Physical
	:*:in`;::`ingredient
	; :*:Pa`;::`P. aeruginosa
	:*:uc`;::`Update Total Coliforms Method




#ifwinactive



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







3Right(){
	global
	Critical
	if keep_running = y
	{
		keep_running = n ;signal other thread to stop
		return
	}
	keep_running = y
	If winactive("NuGenesis LMS")
		LMS.SearchBar(Batch,"{enter}")
	; else If winactive("Composition")
	; 	Send, {enter}
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
		send % Clk(504, 324) "{click, 849, 661}" ; add test.
	else if winactive("Edit request (Field Configuration:")
		send, {click 332, 617} ;click save
	else if winactive("Select tests for request: R"){
		send, {click 504, 338}{click 846, 659} ; add test.
		sleep 300
	}
	else
		Sendinput, %Batch%
	keep_running :=
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



;;------------------------------------------------------
;;[[                  MENU HANDLES                    ]]
;;------------------------------------------------------
Reloadsub(){
	reload
}
StopTimer(){
	SetTimer, activeCheck, Off
}
Exitsub(){
	global
	ifwinnotexist, ahk_exe explorer.exe
		run, explorer "\\10.1.2.118\users\vitaquest\mmignin\VQ_Helper"
	exitApp
}
mmigninFolder(){
	global
	if !winexist("VQ_Helper ahk_exe explorer.exe")
		run, explorer "\\10.1.2.118\users\vitaquest\mmignin\VQ_Helper"
	else
		winactivate, VQ_Helper ahk_exe explorer.exe
}
windowSpy(){
	Run, WS.exe
}

AllBatchesMsgbox:
	AllBatchesMsg:=Trim(GetAllBatches(" ",1))
	tt(AllBatchesMsg)
	; clip.EditBox(AllBatchesMsg)
return
AllBatchesNoMsgbox:
	AllBatchesMsg:=Trim(GetAllBatches(" "))
	tt(AllBatchesMsg)
	; clip.EditBox(AllBatchesMsg)
return
AllProductsMsgbox:
	AllProductsMsg:=Trim(GetAllProducts(" ",1))
	sleep 600
	tt(AllProductsMsg)
	; clip.EditBox(AllProductsMsg)
return
AllProductsNoMsgbox:
	AllProductsMsg:=Trim(GetAllProducts(" "))
	sleep 600
	tt(AllProductsMsg)
	; clip.EditBox(AllProductsMsg)
return
ShowWholeBatches:
	run, edit WholeBatches.txt
return
Add15SampleLog:
	LMS.AddsampleLog(15)
Return
ShowVariables:
	listvars
return
ListLines:
	ListLines
return
ShowFinalLabelCopy:
	; run, find "\\10.1.2.118\Label Copy Final"
	run, find "\\netapp\Label Copy Final"
	sleep 550
	; winmaximize, Search Results
	send, {*}%Product%{*}{enter}
	sleep 400
	send, ^{e}{tab 2}{right}
	; SelectPreviewPane(Product)
return
ShowScanLabelCopy:
	run, find "\\10.1.2.118\share\QC LAB\Label Copy Scans"
	sleep 250
	; winmaximize, Search Results
	sendinput, {*}%Product%{*}{enter}
	sleep 300
	send, ^{e}{tab 2}{right}
return
ShowManualCOA:
	run, explorer "\\10.1.2.118\coa-lot#"
return
DeletePriorCodes:
	FileDelete, PriorCodes.txt
	tt("Deleted")
Return
DeleteWholeBatches:
	FileDelete, WholeBatches.txt
	tt("Deleted")
Return
^F10::
F10 & Lbutton::
TestCode:
	sleep 500
	autohotkeyPath := "U:\VQ_Helper\RawFiles\AHK\AutoHotkeyU64.exe"
	scriptPath := "U:\VQ_Helper\RawFiles\TestingCode.ahk"
	RunWait, %autohotkeyPath% "%scriptPath%"
return
Showmfg:
	run, find "\\10.1.2.118\lms\Information\ECOPY\mfg"
	sleep 200
	sendinput, {*}%Product%{*}{enter}
	sleep 300
	send, ^{e}{tab 2}{right}
return
ShowGlobalVision:
	run, find "\\10.1.2.118\Globalvision Master Copy Files"
	sleep 200
	sendinput, {*}%Product%{*}{enter}
	; winmaximize, Search Results
	sleep 300
	send, ^{e}{tab 2}{right}
return
ShowFINAL_C_O_A:
	run, explorer "\\10.1.2.118\final_c_o_a\2023 CoAs"
return
ShowEditBox:
	clip.editbox()
return

FtenMenuHandler:
	Ften := A_ThisMenuItem
	IniWrite, %Ften%, Settings.ini, Config, Ften
return














;;-------------------------------------------------------------
;;[[                         Utilities                        ]]
;;------------------------------------------------------------


ReadIniFiles(){
	global
	iniRead, Product, Settings.ini, SavedVariables, Product
	iniRead, Batch, Settings.ini, SavedVariables, Batch
	iniRead, Lot, Settings.ini, SavedVariables, Lot
	iniRead, Coated, Settings.ini, SavedVariables, Coated
	iniRead, GeneralBox, Settings.ini, SavedVariables, GeneralBox
	iniRead, SampleID, Settings.ini, SavedVariables, SampleID
	iniRead, Iteration, Settings.ini, SavedVariables, Iteration
	iniRead, CompileTime, Settings.ini, Config, CompileTime
	iniRead, Version, Settings.ini, Config, Version
	iniRead, GeneralBox, Settings.ini, SavedVariables, GeneralBox
	; iniRead, SampleIDMode, Settings.ini, SavedVariables, SampleIDMode
	; iniread, PriorCodeString, Settings.ini, SavedVariables, PriorCodeString
	iniread, CodeString, Settings.ini, SavedVariables, CodeString
	iniRead, Ingredient_List_Adjustment, Settings.ini, Config, Ingredient_List_Adjustment
	; iniread, Ften, Settings.ini, Config, Ften

	; iniread, NormalWinDelay, Settings.ini, Config, NormalWinDelay
	iniread, ActiveTimerCheck, Settings.ini, Config, ActiveTimerCheck
	iniRead, IngredientNoteDropDownCount, Settings.ini, Config, IngredientNoteDropDownCount

	iniRead, NewSpecVersionDescriptionText, Settings.ini, SavedVariables, NewSpecVersionDescriptionText
	;iniRead, Iteration, Settings.ini, SavedVariables, Iteration
	; iniRead, Iteration, Settings.ini, SavedVariables, CustomerPosition

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
	iniread, WindowSpyPath, Settings.ini, FilePaths, WindowSpyPath
	iniread, AppIconPath, Settings.ini, FilePaths, AppIconPath
	iniread, CustomerListPath, Settings.ini, FilePaths, CustomerListPath
	iniread, CodeFile, Settings.ini, FilePaths, CodeFile
	; wholebatches = []
	; 	FileRead, WholeBatches, WholeBatches.txt
	; 	sleep 300
	; 	loop, parse, WholeBatches, "`n"
	;   	WholeBatches.insert(a_LoopField)

}

GetIniValue(IniFile,IniKey){
	Loop, Read, %IniFile%
	{
		If A_Index = 1
			Continue
		if instr(A_LoopReadLine, IniKey,false,1,1){
			MatchedLine := StrSplit(A_LoopReadLine, "=")
			tt(MatchedLine[2],2000,400,400,3)
			return MatchedLine[2]
		}
		else
			continue
	}
	return
}
;;-----------------------------------------------------------
;; [[                    Active Check                    ]]
;;-----------------------------------------------------------
activeCheck:
	If winexist("Delete Attribute ahk_exe eln.exe"){
		winactivate,
		sleep 200
		sendinput, {enter}
		; mousemove, 245, 137
		sleep 1000
	}
	else if winexist("Delete specification ahk_exe eln.exe"){
		MsgBox, 4, , Do you want to continue? (Press YES or NO),5
		IfMsgBox No
			exit
		IfMsgBox timeout
		{
			winactivate
			sendinput, {n}
		return
	}
	sleep 300
	return
}

else if MouseIsOver("ClipBar"){
	ClipBar_x1:=Clipbar_x-310
	ClipBar_x2:=Clipbar_x-150
	ClipBar_x6:=Clipbar_x+265
	if (winControl="Edit1"){
		GetAllProducts(" ")
		TT(AllProducts,4000,ClipBar_x1,35,2,250)
		sleep 1000
	}
	else if (winControl="Edit2"){
		GetAllBatches(" ")
		TT(AllBatches,4000,ClipBar_x2,35,2,250)
		sleep 1000
	}

	else if (winControl="Edit3")
		return
	else if (winControl="Edit4")
		return
	else if (winControl="Edit5")
		return
	else if (winControl="Edit6"){
		TT(GeneralBox,2000,ClipBar_x6,35,2,250)
		sleep 1000
	}
	return
}
else If winexist("Release: ahk_exe eln.exe"){
	winactivate
	click 128,146
	return
}
else If winactive("Delete Test ahk_exe eln.exe"){
	winactivate,
	sleep 100

	sendinput, {enter}
	; mousemove, 222, 138
	; click
	; sleep 1000
	return
}
else If winactive("Delete results ahk_exe eln.exe"){
	winactivate,
	sleep 100
	sendinput, {enter}
	; mousemove, 222, 138
	; click
	sleep 1000
	return
}
else If winactive("Delete ingredients ahk_exe eln.exe"){
	winactivate,
	sleep 200
	sendinput, {enter}
	; mousemove, 222, 138
	sleep 1000
	return
}
else if winactive("Lock specification ahk_exe eln.exe")
{
	sendinput, {n}
	sleep 1000
	return
}
else if winactive("Error ahk_exe eln.exe") {
	ControlSend,, {enter}, Error
	sleep 200
	if winExist("Register new samples") && Product{
		winactivate,
		Sendinput, {click 185, 103,2}%Product%{enter}
	}
	sleep 1000
	return
}
else if winActive("Information ahk_exe eln.exe"){
	winactivate,
	send, {enter}
}
else
	return

return













TT(msg:="yo", time=1500, X:="",Y:="",N:="", Transparent:="",Position:="S") {
	global
	my:=100
	Mx:=100
	if Simpleclip
		return
	MouseGetPos, mX, mY
	; CoordMode, Mouse, screen
	; CoordMode, ToolTip, screen
	; CoordMode, ToolTip, Relative
	sleep 20
	if Position = M
		tooltip, %msg%, %X%+%mX%, %Y%+%mY%,%N%
	else
		tooltip, %msg%, %X%+100, %Y%+100,%N%
	; X+=100

	; else
	hwnd := winExist("ahk_class tooltips_class32")
	if Transparent
		WinSet, Exstyle, 0x20, % "ahk_id" hwnd
	WinSet, AlwaysOnTop, On, % "ahk_id" hwnd
	winSet, Trans, %Transparent%, % "ahk_id" hwnd
	; WinSet, Transparent, 128, % "ahk_id" hwnd
	; winSet, TransColor, 0xE5513C 200, % "ahk_id" hwnd
	; winSet, Trans, 200, %W%
	; if Position = "S"
	if !(time=0)
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
	RemoveToolTip5:
	ToolTip,,,,5
	return
	RemoveToolTip6:
	ToolTip,,,,6
	return
	RemoveToolTip7:
	ToolTip,,,,7
	return
	RemoveToolTip8:
	ToolTip,,,,8
	return
	RemoveToolTip9:
	ToolTip,,,,9
	return
	RemoveToolTip10:
	ToolTip,,,,10
	return
	RemoveToolTip11:
	ToolTip,,,,11
	return
	RemoveToolTip12:
	ToolTip,,,,12
	return
	RemoveToolTip13:
	ToolTip,,,,13
	return
	RemoveToolTip14:
	ToolTip,,,,14
	return
	RemoveToolTip15:
	ToolTip,,,,15
	return
	RemoveToolTip16:
	ToolTip,,,,16
	return
	RemoveToolTip17:
	ToolTip,,,,17
	return
	RemoveToolTip18:
	ToolTip,,,,18
	return
	RemoveToolTip19:
	ToolTip,,,,19
	return
	RemoveToolTip20:
	ToolTip,,,,20
	return
	return
}


class Breaking {
	Point(break:=""){
		Global
		critical
		If GetKeyState("Lbutton", "P") || (break) || GetKeyState("RControl", "P") || GetKeyState("F13", "P")  || GetKeyState("LShift", "P")  || GetKeyState("RShift", "P") || GetKeyState("RWin", "P") || GetKeyState("Rbutton", "P") {
			TT("Broke",2000,-100,-100)
			blockinput, off
			; tooltip,
			exit
		}
		if keep_running = n ;another signal to stop
		{
			blockinput, off
			; tooltip,
			Exit
		}
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
	MouseGetPos,,, win, WinControl
	Return winExist(winTitle . " ahk_id " . win)
}

RemoveDuplicates(InputString,Delimiter:="`n"){
	Loop, Parse, InputString, Delimiter
	{
		If Output not contains %A_LoopReadLine%%Delimiter%
			Output .= A_LoopReadLine . Delimiter
	}
	Return Output
}

ListArray(The_Array,The_Delimeter:="n"){
	; global
	if (The_Delimeter<>"n"){
		for Each, Element in The_Array
			ArrayList .=Element The_Delimeter
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



BlockRepeat(Time:=300, ToolTipMessage:=""){
	Global N
	critical
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
			sleep 200 ; winactivate, %window%
	mouseclick, %Button%, %x%,%y%,%n%,0
	sleep 25
	if (window!="")
		winactivate, %mw%
	If (ReturnMouse=x)
		Return MouseReturn
	If (ReturnMouse=0)
		Return
	else
		mousemove,%mx%,%my%,0
}


showLabelCopy(FileDir,FileType‚ShowMultiple:=0){
	Global Product
	Loop, Files, %FileDir%*%Product%*.%FieType%*,R
	{
		If (A_LoopFileTimeCreated>Rec)
		{

			FPath=%A_LoopFileLongPath%
			Rec=%A_LoopFileTimeCreated%
		}
	}
	sleep 300
	Run, explore %Fpath%

	return
}

