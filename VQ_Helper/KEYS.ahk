#ifwinactive,
return
~RWin::Send {Blind}{vkFF}
~LWin::Send {Blind}{vkFF}
; +F4::ExitApp
^+esc::ExitApp
^esc::Reload
^+`::
	sleep 800
	Run, "U:\VQ_Helper\RawFiles\COMPILE.exe"
	exitapp
	Return
; enter::sendinput, {enter}

	^+w::gosub, get_window_info
	^+e::gosub, get_mouse_info

LabelCopyDoc:
msgbox, % copyLabelCopyDoc(1)
return
copyLabelCopyDocRegex:
Msgbox % copyLabelCopyDocRegex(1)
Return




GetRequirements:
GetRequirements()
return



F7::
	Winactivate, NuGenesis LMS
	preclk()
	LMS.SearchBar(Batch,"{enter}",0)
	postclk()
	Return
F6::
	Winactivate, NuGenesis LMS
	preclk()
	LMS.SearchBar(Product,"{enter}",0)
	postclk()
	Return
F8::
	Winactivate, NuGenesis LMS
	preclk()
	LMS.SearchBar("",,"False")
	postclk()
	Return



	;;--------------------------------------------------
	;;[[              ClipBar keybindings                    ]]
#If MouseIsOver("Methods List ahk_exe VQ Helper.exe")
Lbutton::send, {ctrldown}{Lbutton}{ctrlup}


#If MouseIsOver("ClipBar ahk_exe VQ Helper.exe")
	; F7::copyLabelCopyDoc()
	wheelup::
	If NAdd
	  {
		; sleep 500
	  return
	  }
		NAdd:=1
		blockinput, On
	ControlGetFocus,winControl,ClipBar
	settimer, Block_Input,-500
if (wincontrol="Edit5"){
	Clipbar.AddIteration(100)
	return
	}

	if (winControl="Edit1"){
		sleep 400
	  GetAllProducts(" ", 1)
		clipboard:=AllProducts
	TT(AllProducts,2000,ClipBar_x2,35,2,250)
		return
	  }
if (winControl="Edit2"){
	GetAllBatches(" ", 1)
		sleep 400
		clipboard:=AllBatches
	TT(AllBatches,2000,ClipBar_x2,35,2,250)
		return
	}
	if (winControl="Edit3")
	  PriorCodesMenu(1)
	if (winControl="Edit4")
	  PriorCodesMenu(1)
	if (winControl="Edit6"){
	  WholeBatchMenu()
	    ; ControlsetText, Edit6,%AllBatches%,ClipBar
	    ; TT(AllBatches,2000,ClipBar_x2,35,2,250)
	  }
else ;(winControl="Edit3")
	wincontrol:=
	  sleep 500
	  ; NAdd:=
	return




	wheeldown::
	If Nsub
	  {
		; sleep 500
	  Return
	  }
	ControlGetFocus,winControl,ClipBar
Nsub:=1
		settimer, Block_Input,-500
if (wincontrol="Edit5"){
	Clipbar.SubIteration(100)
	return
}
	if (winControl="Edit1"){
		sleep 400
	  GetAllProducts("`r`n")
		clipboard:=AllProducts
	; TT(AllProducts,2000,ClipBar_x2,35,2,250)
		return
	  }
if (winControl="Edit2"){
	GetAllBatches("`r`n")
		sleep 400
		clipboard:=AllBatches
	; TT(AllBatches,2000,ClipBar_x2,35,2,250)
	return
}
	if (winControl="Edit3")
	  PriorCodesMenu(1)
; 	if (winControl="Edit4")
; 	  PriorCodesMenu(1)
; 	 if (winControl="Edit6"){
; 	  MsgBox, 4, Delete file, Do you want to delete WholeBatches.txt?
; 	  IfMsgBox, OK
; 	      FileDelete, WholeBatches.txt
; 	  }
; else ;(winControl="Edit3")
; 	wincontrol:=
; 	  sleep 500
return


Mbutton::
	ControlGetFocus,winControl,ClipBar
		if (wincontrol="Edit5")
			worktab.CustomerMenu()
		else if (winControl="Edit1")
			LMS.SearchBar(Product,"{enter}",0)
		else if (winControl="Edit2")
			LMS.SearchBar(Batch,"{enter}",0)
		else if (winControl="Edit3")
			ControlsetText, Edit3,,ClipBar
		else if (winControl="Edit4")
			ControlsetText, Edit4,,ClipBar
		else
			MenuCodeSelect()
	return


#if

#Ifwinactive, ClipBar ahk_exe VQ Helper.exe
	enter::
		GUI, ClipBar:default
	Send, ^{a}^{c}
		sleep 100
		LMS.Searchbar(clipboard,"{enter}")
	return
	+enter::
		GUI, ClipBar:default
		sleep 100
		Send, ^a^c
		LMS.Searchbar(clipboard,"{enter}","False")
	return
; F7::copyLabelCopyDoc()
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
	; 		; ControlGetFocus,winControl,ClipBar ahk_exe VQ Helper
	; 		; MouseGetPos, , , winid, wincontrol
	; 		; if (winControl="Edit1") || (winControl="Edit2") || (winControl="Edit3"){
	; 			ClipBar.Menu()
	; 			return
	; }
	; else if (winControl="Edit4"){
	; Coated:=
	; GUI, ClipBar:default
	; ControlsetText, Edit4,%Coated%,ClipBar ahk_exe VQ Helper
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
	WinWaitActive, ahk_class XLMAIN ahk_exe EXCEL.EXE, ,3
		; if !Errorlevel
		WinRestore, ahk_class XLMAIN ahk_exe EXCEL.EXE
			WinMove, Book ahk_class XLMAIN ahk_exe EXCEL.EXE,, 4, 1, 1150, 1200
		; WinMove, Book ahk_class XLMAIN ahk_exe EXCEL.EXE,, 4, 1, 1150, 1200
	return
#ifwinactive, ahk_class XLMAIN ahk_exe EXCEL.EXE
F6::
	XL.Range("G28").Select
	send, ^{v}
		return
F7::WinMove, ahk_class XLMAIN ahk_exe EXCEL.EXE,, %NuX%, %NuY%, 1250, 1200
		; MouseGetPos, mx, mY

#ifWinExist, LMS Actions ahk_exe EXCEL.EXE
	+enter::

	Mbutton::
		WinActivate, LMS Actions ahk_exe EXCEL.EXE
		sendinput, {click 45, 43}
		winwaitactive, Select Product ahk_exe EXCEL.EXE,, 5
		if !ErrorLevel
			sendinput, {Click 112, 63}%Product%{enter}{enter}
	return




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
	Enter::LMSClick.OK()
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
#Ifwinactive, Edit Ingredient
	:*:1s`;::
		sendinput, ^{a}* Heavy Metals results are based on a daily dose of (1) scoop (%ShapeAndSize% g){left 2}
	return
	:*:2s`;::
		sendinput, ^{a}* Heavy Metals results are based on a daily dose of two (2) scoops (%ShapeAndSize% g){left 2}
	return
	:*:3s`;::
		sendinput, ^{a}* Heavy Metals results are based on a daily dose of three (3) scoops (%ShapeAndSize% g){left 2}
	return
	:*:1p`;::
		sendinput, ^{a}* Heavy Metals results are based on a daily dose of (1) pouch (%ShapeAndSize% g){left 2}
	return
	:*:1j`;::
		sendinput, ^{a}* Heavy Metals results are based on a daily dose of (1) jar (%ShapeAndSize% g){left 2}
	return
	:*:1sp`;::
		sendinput, ^{a}* Heavy Metals results are based on a daily dose of (1) stick packet (%ShapeAndSize% g){left 2}
	return
	:*:1ps`;::
		sendinput, ^{a}* Heavy Metals results are based on a daily dose of (1) packet or scoop (%ShapeAndSize% g){left 2}
	return
	:*:2sp`;::
		sendinput, ^{a}* Heavy Metals results are based on a daily dose of two (2) stick packet (%ShapeAndSize% g){left 2}
	return
	:*:3sp`;::
		sendinput, ^{a}* Heavy Metals results are based on a daily dose of three (3) stick packet (%ShapeAndSize% g){left 2}
	return
#Ifwinactive, Edit Formulation

	:*:00e`;::00 elongated capsule / 0.995`" x 0.336`"
	:*:00`;::00 capsule / 0.917`" x 0.336`"
	:*:3`;::3 capsule / 0.626`" x 0.229`"
	:*:2`;::2 capsule / 0.709`" x 0.250`"
	:*:1`;::1 capsule / 0.765`" x 0.272`"
	:*:0`;::0 capsule / 0.854`" x 0.300`"
	:*:USP`;::Meets USP Requirements
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
		sendinput, `Each two (2) scoops (%ShapeAndSize% g) contains{tab}^{a}Blend{tab}^{a}%color%+{tab 2}^{left 3}{left}
	return
	:*:3s`;::
		sendinput, `Each three (3) scoops (%ShapeAndSize% g) contains{tab}^{a}Blend{tab}^{a}%color%+{tab 2}^{left 3}{left}
	return
	:*:1p`;::
		sendinput, `Each (1) pouch (%ShapeAndSize% g) contains{tab}^{a}Blend{tab}^{a}%color%+{tab 2}^{left 3}{left}
	return
	:*:1j`;::
		sendinput, `Each (1) jar (%ShapeAndSize% g) contains{tab}^{a}Blend{tab}^{a}%color%+{tab 2}^{left 3}{left}
	return
	:*:1sp`;::
		sendinput, `Each (1) stick packet (%ShapeAndSize% g) contains{tab}^{a}Blend{tab}^{a}%color%+{tab 2}^{left 3}{left}
	return
	:*:1ps`;::
		sendinput, `Each (1) packet or scoop (%ShapeAndSize% g) contains{tab}^{a}Blend{tab}^{a}%color%+{tab 2}^{left 3}{left}
	return
	:*:2sp`;::
		sendinput, `Each two (2) stick packet (%ShapeAndSize% g) contains{tab}^{a}Blend{tab}^{a}%color%+{tab 2}^{left 3}{left}
	return
	:*:3sp`;::
		sendinput, `Each three (3) stick packet (%ShapeAndSize% g) contains{tab}^{a}Blend{tab}^{a}%color%+{tab 2}^{left 3}{left}
	return

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
	mbutton::LMSClick.password()

;;\\ 	              Select methods tests
#ifwinactive, Select methods tests
	+enter::clk2(854, 658) ;select okay
	#enter::clk2(854, 658) ;select okay
^enter::clk2(854, 658) ;select okay
	F7::clk2(511, 337) ;move over test
	F6::clk2(511, 375) ;move test back over
	F9::
	F8::
	mbutton::Spectab.MethodsDropdown()
;;\\ 		      Select samples for test
#Ifwinactive, Select samples for test:
	Mbutton::sendinput, {click 248, 68}{up} ;click dropdown then
	F8::Clk(853, 657) ;click okay
	F9::send % Clk(250, 70) "{up}" ; click okay.
	F7::SpecTab.Methods()
	F6::SpecTab.MethodsDropdown()
;;\\       	      Select tests for request:
#ifwinactive, Select tests for request:
	 F10::
	 click, 31, 102
	 sleep 700
	 click 511, 336
	 sleep 300
	 Click 668, 151
	 sleep 800
	 WorkTab.SelectTestSample()
	 sleep 1000
	 mousemove 837, 655
	 return

	F6::SpecTab.Methods()
	F7::SpecTab.MethodsDropdown()
	mbutton::WorkTab.SelectTestSample()
F9::mouseclick, Left, 638, 70
;;\\ 	              Select Product
#ifwinactive, Select Product ahk_exe eln.exe
	mbutton::send % clk(107, 66) Product "{enter}{enter}"


;;\\ 	           Edit Product
#ifwinactive, Edit Product
	mbutton::ProductTab.AddNewProduct()
	Enter::clk2(285, 574, 1)
	+Enter::sendinput, {enter}
;;\\ 	           Edit Formulation
#Ifwinactive, Edit Formulation
	mbutton::ProductTab.AddNewFormulation()
	wheeldown::
			if MouseMoved=1
			{
				sendinput, {wheeldown}
				Return
			}
			else
			clk(452, 473,,1)  ;add scroll block
			MouseMoved:=1
			winwaitclose,
			MouseMoved:=
			return
;;\\               Edit request
#ifwinactive, Edit request
	mbutton::WorkTab.EditRequest()
	F10::
	winactivate, Edit request
	click 239, 617
	return
;;\\ 	           Edit sample
#ifwinactive, Edit sample (
F9::worktab.CustomerMenu()
Mbutton::Worktab.Dropdown_CustomerSelect(Iteration)
		; 	winactivate, Edit sample
		; 	Ifwinactive, Edit sample (Field Configuration: F`, Micro)
		; 		send, {Click 253, 138}{tab}
		; 	Ifwinactive, Edit sample (Field Configuration: CT
		; 		send, {Click 253, 138}{tab}
		; 	else
		; 		send, {Click 253, 138}{tab}
		; 	sleep 200
		; WorkTab.Dropdown_CustomerSelect(Iteration)
		; breaking.point()
		; sleep 300
		; 	send, {enter}
return
;;\\ 	           Edit test (Field Configuration
#ifwinactive, Edit test (Field Configuration
; lctrl::
printscreen::
	F10::Send,{Click, 402, 284}{end}{down 2}{shiftdown}{9}{shiftup}on sample log{shiftdown}{0}{shiftup}{click, 334, 618}
	; +F10::
	; 	sendinput, {click 384, 222}{tab 2}{end 2}
	; 	sendinput, {shiftdown}{9}{shiftup}on sample log{shiftdown}{0}{shiftup}
	; 	sendinput, {Click 334, 618}
	; 	return
	; wheelright::
	F7::
	winactivate, Edit Test
	mbutton::
			preclk()
			MouseClick, left, 464, 533,1,0 ; Click scrollbar
			; MouseClick, left, 245, 485,1,0  ; click results
			sleep 20
			click 239, 538 ; click results
			postclk()
return


;;\\ 	              Result Entry
#Ifwinactive, Result Entry
	F7::numbermenu(6,"toggle") ;WorkTab.CorrectTestResults("toggle", "Loop")
	F6::numbermenu(6,0) ;WorkTab.CorrectTestResults("toggle", "Loop")
	; F6::WorkTab.CorrectTestResults(0,5)
	F10::WorkTab.CorrectTestResults()
	Mbutton::WorkTab.CorrectTestResults("Toggle")
	F9::numbermenu(6)
;;\\ 	              Results Definition:
#Ifwinactive, Results Definition
	+mbutton::SpecTab.Autofill()
	Mbutton::SpecTab.AutoInputResultEditor()
 ;mbutton::Spectab.PasteClipboardIntoSpec()
	F7::lmsclick.edit()
	F9::lms.menu()
	Backspace::LMSClick.Remove()
 ;Backspace::sendinput, {Click %RemoveButton%}
#ifwinactive, Results
	F7::lmsclick.edit()
	F9::lms.menu()
	Mbutton::SpecTab.AutoInputResultEditor()
	+mbutton::SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,1,FullRequirements)
;;\\ 	              Result Editor
#ifwinactive, Result Editor
	mbutton::SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,1,FullRequirements)
wheelDown::
	if Mousemoved=1
		return
	Else
		clk(503, 574,1,,,0)
		; clk(288, 318,1,2,,0)
		mousemoved:=1
	SetTimer, Block_Input, -5000
return
	`;::clk(405, 534,,2)
	+`;::sendraw, :
+F6::spectab.toggleUseLimitsFromTheTest()

;;\\              Test Definition Editor
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
Enter::Clk2(343, 616)
+Enter::sendinput, {Enter}

wheeldown::
	if Mousemoved
	{
			sendinput, {wheeldown}
			return
	}
	else
	{
		clk(464, 532,,2,"Test Definition Editor",0)
		mousemove, 245, 246, 0
	mousemoved:=1
	winwaitclose,
	mousemoved:=
	}
return
F7::
	clk(464, 532,,2,"Test Definition Editor",0)
	click, 245, 246
	sleep 500 ;add scroll block
	return
	; 		mbutton::mouseclick, left, 333, 615



;;\\ 	             Register new samples
#ifwinactive, Register new samples
F7::sendinput,{Click 505, 356}{Click 860, 661}
F6::
		clk(181, 104,2,2)
		sleep 300
		Send, %Product%{enter}
	return
	F10::
+Mbutton::
	if Lot
		loopingCount:=4
	else
		LoopingCount:=3
		loop, %LoopingCount%
		{
			MouseGetPos, rnmx, rnmy
			Breaking.Point()
			WorkTab.registerNewSamples()
			sleep 300
			Breaking.Point()
			rnmy:=RnMy+26
			MouseMove, %Rnmx%, %rnmy%, 0
			sleep 100
		}
		Breaking.Point()
	return
	mbutton::WorkTab.registerNewSamples()

;;\\  		     Reason for Change
#ifwinactive, Reason For Change
	F6::Sendinput, {Click 160 130}^{a}Fixing Rotation{Click 240 237 0}





;;[[_____________ Nugenesis MAIN _______________]]
#Ifwinactive, NuGenesis LMS
+^F11::LMS.OrientSearchbar()
!F4::Return
^F9::
	send, ^c
	sleep 500
		If (SampleguID){
				; FileRead, PreviousSampleguIDs, % PreviousSampleguIDsFile
				  ; {
				; NewPreviousSampleguIDs:=Trim(RemoveDuplicates(PreviousSampleguIDs)"`n"SampleguID)
					FileDelete, %PreviousSampleguIDsFile%
					sleep 200
					FileAppend, %NewPreviousSampleguIDs%, %PreviousSampleguIDsFile%
						; return
			; }
		}
		clipboard:=sampleguid
		TT(Sampleguid)
	return
	+!F10::LMS.AddsampleLog(5)
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
^Mbutton::FileRead, Clipboard, U:\VQ_Helper\ClippedExcelData.txt
	; SpecTab.Table()
	;^F10::LMS.AddSampleLog(15)
	; F10::
	mbutton::
	if winexist("Spec Table ahk_class AutoHotkeyGUI") {
	If winactive("Test Definition Editor") || winactive("NuGenesis LMS")
			SpecTab.AutoInputTestDefinitionEditor()
	else if winactive("Result Editor") || winactive("Results Definition")
		SpecTab.AutoInputResultEditor()
	; else if winactive("Edit request")

	; else winactive("NuGenesis LMS")
			; SpecTab.AutoInputSpecResults()
		return
	}
	else
		SpecTab.CopySpecTemplate()
	; Else
		; Send, ^{mbutton}
return

	F9::lms.Menu()
	F7::LMS.SearchBar(Batch,"{enter}",0)
	F6::LMS.SearchBar(Product,"{enter}",0)
	+F6::sendinput % GetAllProducts(" ")
	+F7::sendinput % GetAllBatches(" ")

		F8::LMS.SearchBar("",,"False")
	; +F6::LMSClick.EnterResults()


		; clk(54,734,"",1,"NuGenesis LMS",2)  ;:((Delete Test))

	+F8::LMS.SearchBar("",,"False")

	+#v::LMS.Searchbarpaste(";")
	+^v::LMS.Searchbarpaste(";")
	<^v::LMS.Searchbarpaste(A_space)
	Enter::LMS.SaveCode()


;;[[_________________ELN.EXE___________________________]]
#Ifwinactive, ahk_exe eln.exe
	F1::Sendinput, %Product%
	F2::Sendinput, %Batch%
	F3::Sendinput, %lot%
	F4::Sendinput, %Coated%
	+F1::sendinput % GetAllProducts(" ")
	+F2::sendinput % GetAllBatches(" ")
	+^F1::sendinput % GetAllProducts("`;")
	+!F1::sendinput % GetAllProducts("`n")
	+^F2::sendinput % GetAllBatches("`;")





	^+F10::lms.ChangePercision(3)
	+F10::lms.ChangePercision(2)
	^F10::
		loop 20
		{
		breaking.point()
		lms.ChangePercision(2)
		WinWaitActive, NuGenesis LMS,,10
		if errorlevel
			exit
		sleep 1300
		breaking.point()
		}
		return

; Enter::LMS.SaveCode()
	enter::LMSclick.OK()
	esc::LMSclick.esc()
	; F7::3Right()
	; F6::Send, %Product%
+F5::Sendinput, %SampleGUID%
^F5::Clipboard:=SampleGUID
	+mbutton::lms.Menu()
	+F9::lms.Menu()
	F9::lms.Menu()

	<!left::GetAllProducts()
	<!right::GetAllBatches()
	F13::breaking.point(1)
	+!F5::LMS.Menu()
	^Space::LMS.SearchBar("",,"False")
	!^Space::LMS.SearchBar("","{delete}","False")
	!F10::LMS.AddDataFromClipboard()

	pause::						Suspend, Toggle
	#h::return
	#p::return
	#k::return
	>+Backspace::			Delete
	;F8::esc




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

;;\\________________explorer.exe______________
#ifwinactive, ahk_class CabinetWClass ahk_exe explorer.exe
	+F9::send, ^e
	^w::Sendinput, {esc}^{w}
	F7::
		winactivate, *%Product%* ahk_exe explorer.exe
		sleep 200
		send ^{e}
		sleep 340
		sendinput, {*}%Product%{*}
		sleep 700
		send, ^{e}{enter}{down 2}{up}
		; sendinput, {tab 2}{right}{pgup 2}
	return
	F8::send, ^{F4}
Mbutton::
	send, ^{e}{*}%Product%{*}
	sleep 800
	send, ^{e}{enter}{down 2}{up}^a
	return
	; +Mbutton::SelectPreviewPane()
	+F6::
		winactivate, ahk_class CabinetWClass ahk_exe explorer.exe,,VQ_Helper
		send, ^{e}
		sleep 700
	send, {enter}{down 2}{up}
	sleep 700
		send ^{a}^{c}
	return
	F6::WinMove, ahk_exe explorer.exe,, 5, 10, 1250, 1200
#ifwinexist, Search Results ahk_exe explorer.exe
+F6::
	winactivate, ahk_exe explorer.exe
	sleep 400
	send, ^{e}{*}%Product%{*}
	sleep 900
	send, ^{e}{enter}{down 2}{up}
return


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
	; Critical
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
CopyGUID(){
	global
	Clipboard:=SampleGUID
}
mmigninFolder(){
	global
	if !winexist("VQ_Helper ahk_exe explorer.exe")
		run, explorer "\\10.1.2.118\users\vitaquest\mmignin\VQ_Helper"
	else
		winactivate, VQ_Help   er ahk_exe explorer.exe
}
SettingsFile(){
		Run , Edit "\\10.1.2.118\users\vitaquest\mmignin\VQ_Helper\Settings.ini"
}
EditMethodList(){
		Run , Edit "\\10.1.2.118\users\vitaquest\mmignin\VQ_Helper\Methods.ini"
}
windowSpy(){
	Run, WS.exe
}
get_window_info:
	if !getTitle
		WingetTitle getTitle, A
	simpleclip:=1
	Clipboard:=getTitle
	Clipwait,1
	sleep 500
	simpleclip:=
	tt(getTitle,1000,100,100)
return

get_mouse_info:
	MouseGetPos, getX, getY, getWin
	simpleclip:=1
	Clipboard:=getX ", " GetY
	clipwait,1
	sleep 300
	simpleclip:=
	tt(getX ", " GetY,2000,100,50,,,"M")
	return

return
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
ShowHotkeys:
msgbox, %HotkeysTip%
ShowFinalLabelCopy:
	; run, find "\\10.1.2.118\Label Copy Final"
	runwait, find "\\netapp\Label Copy Final"
	sleep 550
	; winmaximize, Search Results
	winactivate, ahk_class CabinetWClass ahk_exe explorer.exe
	send, {*}%Product%{*}{enter}
	sleep 400
	send, ^{e}{tab 2}{right}
	; SelectPreviewPane(Product)
return
ShowScanLabelCopy:
	runwait, find "\\10.1.2.118\share\QC LAB\Label Copy Scans"
	; runwait, find "\\netapp\share\QC LAB\Label Copy Scans"
	sleep 250
	; winmaximize, Search Results
	WinMove, *%Product%* ahk_exe explorer.exe,, 5, 10, 1250, 1200
	winactivate, *%Product%* ahk_exe explorer.exe
	send, {*}%Product%{*}{enter}
	sleep 700
	send, ^{e}{tab 2}{Right}
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
	runwait, find "\\10.1.2.118\Globalvision Master Copy Files"
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


ReadIniFiles(){
	global
	iniRead, Product, Settings.ini, SavedVariables, Product
	iniRead, Batch, Settings.ini, SavedVariables, Batch
	iniRead, Lot, Settings.ini, SavedVariables, Lot
	iniRead, Coated, Settings.ini, SavedVariables, Coated
	; iniRead, GeneralBox, Settings.ini, SavedVariables, GeneralBox
	iniRead, SampleGUID, Settings.ini, SavedVariables, SampleGUID
	iniRead, Iteration, Settings.ini, SavedVariables, Iteration
	iniRead, CompileTime, Settings.ini, Config, CompileTime
	; iniRead, Version, Settings.ini, Config, Version
	; iniRead, GeneralBox, Settings.ini, SavedVariables, GeneralBox
	; iniRead, SampleGUIDMode, Settings.ini, SavedVariables, SampleGUIDMode
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
			; tt(MatchedLine[2],2000,400,400,3)
			return MatchedLine[2]
		}
		else
			continue
	}
	return
}











TT(msg:="yo", time=1500, X:="",Y:="",N:="", Transparent:=240,Position:="S") {
	global simpleclip
	ttMx:=100
	ttmy:=1
	winGetPos, ttwinx,ttwiny, ttwinw, ttwinh, A
	ttx:=Floor(ttwinx+X)
	tty:=Floor(ttwiny+y)
	if Position="S" || Position="M"
	{
		; CoordMode, tooltip, screen
		CoordMode, tooltip, Window
		; CoordMode, Mouse, screen
	}
	if Position="W"
	{
		CoordMode, tooltip, window
		; CoordMode, Mouse, window
	}
	MouseGetPos, mX, mY
	if Simpleclip
		return
	ttx:=Floor(mx+X)
	tty:=Floor(my+y)
	; CoordMode, ToolTip, Window
	sleep 20
	; CoordMode, mouse, window
	if Position = "M"
		tooltip, %msg%, %ttx%, %tty%,%N%
	else
		tooltip, %msg%, %ttMX%, %ttmY%,%N%
	; X+=100

	; else
	hwnd := winExist("ahk_class tooltips_class32")
	; if Transparent
		WinSet, Exstyle, 0x20, % "ahk_id" hwnd
	WinSet, AlwaysOnTop, On, % "ahk_id" hwnd
	winSet, Trans, %Transparent%, % "ahk_id" hwnd
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
	; critical
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
	mouseGetPos, mx, my, mw,
	MouseReturn:="{click " Mx ", " My ",0}"
	if window
		if !winactive(window)
			sleep 200 ; winactivate, %window%
	click, %x% %y% %n%
	; mouseclick, %Button%, %x%,%y%,%n%,0
	sleep 25
	if (window!="")
		winactivate, %mw%
	If (ReturnMouse=x)
		Return MouseReturn
	If (ReturnMouse=0)
		Return
	else
		mousemove,%mx%,%my%,0,
		return
}

preClk(){
	Global Premx, premy
		CoordMode, Mouse, Screen
		mouseGetPos, PREmx, PREmy, PREmw
		CoordMode, Mouse, window
		return
}
PostClk(){
	Global Premx, premy
	sleep 100
		CoordMode, Mouse, Screen
		mousemove,%PreMx%,%PreMy%,0
		CoordMode, Mouse, window
		PreMX:=
		PreMy:=
		return
}




Clk2(x,y,returnMouse:=1, n:=1){
		Global ClkMx, ClkMy, clkMw
	If (ReturnMouse=1){
		CoordMode, Mouse, Screen
		mouseGetPos, clkmx, clkmy, clkmw
		CoordMode, Mouse, window
	}
	click, %x% %y% %n%
	sleep 2
	if (ReturnMouse=1){
	winactivate, %clkmw%
	CoordMode, Mouse, Screen
	mousemove,%clkmx%,%clkmy%,0
	CoordMode, Mouse, window
		}
	if (ReturnMouse=2){
	winactivate, %clkmw%
	CoordMode, Mouse, Screen
	mousemove,%clkmx%,%clkmy%,0
	CoordMode, Mouse, window
		}
	else
		return
}

class Breaking {
	Point(break:=""){
		Global
		critical
		SimpleClip:=
		If GetKeyState("Lbutton", "P") || break || GetKeyState("Shift", "P") || GetKeyState("RShift", "P") || GetKeyState("LShift", "P") || (A_PriorKey="Shift") {
			blockinput, off
			exit
		}
		if keep_running = n ;another signal to stop
		{
			blockinput, off
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

