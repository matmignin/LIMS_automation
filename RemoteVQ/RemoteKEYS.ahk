
		#ifwinactive,
	~RWin::Send {Blind}{vkFF}
	<!left::GetAllProducts()
	<!right::GetAllBatches()
	; F1::sendinput, %Product%
	; F1::CountFiles()
	+F1::GetAllProducts()
	!F1::GetAllProducts("`n")
	^F1::Varbar.Focus("Edit1")
	F2::sendinput, %Batch%
	+F2::GetAllBatches()
	; !F2::GetAllBatches("`n")
	; ^F2::Varbar.Focus("Edit2")
	F3::sendinput, %Lot%
	^F3::Varbar.Focus("Edit3")
	F4::sendinput, %Coated%
	^F4::Varbar.Focus("Edit4")
	; !F2::GetAllBatches()
	+F3::3tap()
	!F3::4tap()
	+F4::4tap()
	+F9::
		Sendinput, ^{c}
		sleep 100
		TT(Clipboard)
		return
	^F2::AddToList()
	; +F15::AddToList()
	^F9::send, ^v
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
		click, 63, 754 ;; edit results
	else
		sleep 600
	sleep 450
	if winactive("NuGenesis LMS") && !winexist("Results Definition")
		return
	; if !winexist("Results Definition")
		; exit
	click, 111, 96 ;; sort Seq
	sleep 300
	click, 128, 65 ;; Remove
	Breaking.Point()
	; winactivate, Delete results
	if winexist("Delete results")
		sendinput, {enter}
	else
		sleep 400
	sleep 200
	Breaking.Point()
	; if winactive("NuGenesis LMS")
		; exit
	; else
	if winactive("Results Definition")
		send, {enter}
	Else
		; {
			tt("ended cuz it was too long")
			sleep 400
			; if winactive("Results Definition")
				; send, {enter}


	winwaitactive, NuGenesis LMS,,5
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
	NewSpecVersion()
	if winexist("Delete specification") || winexist("Edit specification") || winexist("Lock specification") || winexist("Approve specification")
		exit
	if winactive("Delete specification")
		exit
	sleep 700
	; winwaitactive, NuGenesis LMS,,3
	; if errorlevel
		; return
	sleep 500
	RemoveTestSpec()

	sleep 700
	Breaking.Point()
	if !winactive("NuGenesis LMS")
		sleep 500
	; my:= my
	; Mousemove, %mx%, %my%,0
	ApproveSpecVersion()
	; TT("Done")
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
		if !(Iteration)
			FullRemoveTest()
		else
		{
			loop, %iteration%
				{
					FullRemoveTest()
					sleep 2000
					Breaking.Point()
				}
		}
			return
		+F10::ApproveSpecVersion()
		^F10::NewSpecVersion()
		!F10::RemoveTestSpec()
		+F3::AddToList()
		mbutton:: 3tap()
		+mbutton::lms.Menu()
		F7::		 3Right()
		F6::		3Left()
		Enter::LMS.SaveCode()
		>+F20::LMS.SearchbarPaste()
		+^v::LMS.SearchbarPaste()
		<^v::lms.searchbarPaste()
		^F9::LMS.SearchBar()
		^d::sendinput, {click 81, 1061} ; delete test


	#Ifwinactive,Select Iterations
		^F9::LMS.PasteProductRotation()
	#Ifwinactive,Book
		+F9::LMS.CopyProductRotation()
	#Ifwinactive,Test Definition Editor
		enter::clk(333,615)
		mbutton::
			clk(338,617)
			sleep 400
			clk(910,668)
			return
		+enter::sendinput, {enter}
	#Ifwinactive, Result Entry ;;___Result_Entry
		#MaxThreadsPerHotkey 2
		F10::WorkTab.ChangeTestResults("loop")
		#MaxThreadsPerHotkey 1
	#Ifwinactive, Results Definition ;;__Results_Definition:
		Enter::
		mbutton::clk(910,668)
		F10::lms.menu()
		+mbutton::lms.menu()
		+enter::sendinput, {enter}
; space::sendinput,{ctrldown}{click}{ctrlup}
	#ifwinactive, Register new samples ;;__Register_new_samples:
		F9::
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
	#ifwinactive, Select samples for test:
	#Ifwinactive, ahk_exe eln.exe ;;___LMS app
		;;^`::						Varbar.reset()
		enter::						LMSclick.okay()
		+enter::					sendinput, {enter}
		^enter::					sendinput, {enter}
		esc::						LMSclick.esc()
		F9::						3up()
		F8::						3down()
		F7::						3Right()
		F6::						3Left()
		F10::						4tap()
		+^F10::						4tap()
		mbutton::					3tap()
		+!F10::						3tap()
	#Ifwinactive,
		;;	___Esc:
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
		^+F9::				Varbar.focus("Edit2")
		F20 & enter::
			Varbar.focus("Edit5")
			send, {esc}{home}^{right}
		return



;;____________________TouchPad BINDINGS__________________________________________
	3tap(){
		Global
		; FlashScreen("3-Tap")

		If winactive("ahk_exe eln.exe") {
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
					; blockinput, on

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

					; blockinput, off
				return
				}
				}
			else if winexist("Delete Test") || winexist("Delete Tests") || winexist("Delete results") || winexist("Delete sample templates") || winExist("Delete specification") { ; Press Okay
					winactivate,
					send, y
					clk(229, 136)
					return
				}
			else if winactive("Result Editor") && (copyPasteToggle=1) {
					SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,1,FullRequirements)
					winWaitactive, NuGenesis LMS, 10
					copyPasteToggle=0
				}
			else if winactive("Register new samples")
					WorkTab.registerNewSamples()
			else if winactive("Test Definition Editor")
					mouseclick, left, 333, 615
			else if winactive("Login")
					menu.passwords()
			else if winactive("Result Entry") {
					MouseGetPos, xpos, ypos
					WorkTab.ChangeTestResults("toggle")
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
					productTab.EditFormulation()
			else if winactive("Select Product ahk_exe eln.exe")
					send % clk(107, 66) Product "{enter}{enter}"
			else if winactive("Edit Product")
					ProductTab.EditProduct()
			else If winactive("Select tests for request: R")
					WorkTab.SelectTestSample()
			else if winexist("Release: ") || winexist("Release: Rotational Testing Schedule") { ; Press Okay
					winactivate,
					clk(131, 144)
				}
			else if winexist("Sign :") || winexist("windows Security") || winexist("CredentialUIBroker.exe") || winexist("Map VQ drive.bat ahk_exe cmd.exe")
					Sendpassword()
			}
		else if winactive("VarBar ahk_exe AutoHotkey.exe"){
				click
				sleep 100
				Varbar.WM_LBUTTONDBLCLK()
		}
	}


	3Right(){
		global
		if keep_running = y
		{
			keep_running = n ;signal other thread to stop
			return
		}
		keep_running = y
		; FlashScreen("3-Right")
		If winactive("NuGenesis LMS")
			LMS.SearchBar(Batch,"{enter}")
		else If winactive("Result Entry")
			WorkTab.ChangeTestResults()
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
		keep_running = n
		return
		}
	3left(){
		global
		if keep_running = y
		{
			keep_running = n ;signal other thread to stop
			return
		}
		keep_running = y
		; FlashScreen("3-Left")
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
			Send, {esc}
		else if winactive("Register new samples")
			Send, {esc}
		else if winactive("Select samples for test:")
			Send, {esc}
		else If winactive("Result Entry")   ;Enter Test Results window"
			WorkTab.ChangeTestResults("toggle")
		else if winactive("ahk_exe eln.exe")
			Send, %Product%
		else
			send, %Product%
		keep_running = n
		return
	}
	3down(){
		global
		FlashScreen("3-Down")
		if winactive("Select samples for test:")
			Clk(853, 657) ; click okay.
		return
	}
	3up(){
		global
		FlashScreen("3-Up")
		if winexist("Mats LMS Workbook.xlsb"){
			excel.Connect(1)
			tt(Product " " Batch " " Lot " " Coated "`n`t" Name " " Customer,1000)
			excel.MatchColor()
			return
		}
		else if winactive("Results Definition")
			lms.menu()
		else if winactive("Result Entry")
			return
		else if winactive("Register new samples")
			LMS.SearchBar(Product,"{enter}")
		else If winactive("Select tests for request: R")
			mouseclick, Left, 638, 70
		else if winactive("Select samples for test:")
			send % Clk(250, 70) "{up}" ; click okay.
		else If winactive("Composition")
			return
		else
			return
	}
		;;	_____4Fingers
	4tap(){
		global
		; FlashScreen(tab)
			If winactive("NuGenesis LMS") {
				LMS.Detecttab()
				if (Tab="Requests") {
							MouseGetPos, mx, mY
							send, {click 2}
							sleep 300
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
						; Excel.setstatus()
				else if (Tab:="Products") {
						clk(86, 443) ;edit composition
					Return
					}
				else if (Tab="Specs") {
						lms.menu()
					}
				else
					lms.menu()
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
			else if winactive("PDF Preview")
				Sendinput, {altdown}{F4}{altup}
		else
			return
	}



#ifwinactive, ahk_exe eln.exe
	:*:osl`;::`(On Sample Log)
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
		PreClip:=Clipboard
		sleep 50
  while pos := RegexMatch(Haystack, "i)(?<!Ct#)\b\d{3}-\d{4}\b", aBatch, pos+1) ; {
      regBatches.insert(aBatch)
  ; }
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
		sleep 200
		send, ^v
    sleep 400
    SimpleClip:=1
    clipboard:=PreClip
		return AllBatches
}

GetAllProducts(Delimiter:=" ",File:=""){
  global
  regProducts:=[]
  pos=0
		Haystack:=Clipboard
    PreClip:=Clipboard
		sleep 50
  while pos := RegexMatch(Haystack, RegexProduct, aProduct, pos+1) ; {
      regProducts.insert(aProduct)
  ; }
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
    send, ^v
    sleep 400
    SimpleClip:=1
    clipboard:=Preclip
		Return AllProducts
}
