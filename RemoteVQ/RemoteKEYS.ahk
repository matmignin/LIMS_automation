
		#ifwinactive,
F19 & left::								GetAllProducts()
F19 & right::								GetAllBatches()

		F10::
			; if (A_GuiEvent="DoubleClick"){

		; Rows_left:=((LV_GetCount()-A_EventInfo)*Autoenter)+1
		; Current_Row:=A_EventInfo
		; Loop % Rows_left {
			; Excel.Get_Current_row()
			; ArrayKeys:=["Ingredient_ID","Position","Name","Claim"]
			; LabelCopy:=[]
			loop, parse, clipboard, "`n"
			{
				line:=A_index
				Ingredient:=[]
				ingredient:=StrSplit(A_LoopField,"|")
				Name_%Line%:=ingredient[4]
				Claim_%Line%:=ingredient[5]
				Position_%Line%:=ingredient[3]
				IngredientID_%Line%:=ingredient[2]
			}
				; msgbox % " Name: " Name_%A_index% "`n Claim: " Claim_%A_index% "`n Position: " Position_%A_index% "`n IngredientID: " IngredientID_%A_index%
			loop, 5
			{
				sleep 200
				if (Name_%iteration%){
					ProductTab.EditIngredient(Name_%iteration%,Claim_%iteration%,Position_%iteration%,IngredientID_%iteration%)
					Varbar.AddIteration()
					sleep 300
					winactivate, Composition
				}
				else
				return
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
			
			
			
			
			
				Spec:=[]
				Spec:=StrSplit(A_LoopField,"/")
				Spec_MinLimit:=Spec[3]
				Spec_MaxLimit:=Spec[4]
				Spec_Units:=Spec[5]
				Spec_Percision:=Spec[6]
				Spec_Method:=Spec[7]
				Spec_Description:=Spec[2]
				SpecTab.TestDefinitionEditor(Spec_Description)
				SpecTab.ResultEditor(Spec_MinLimit,Spec_MaxLimit,Spec_Units,Spec_Percision,1,1)

			; if winactive("Duplicate Spec ID") || winactive("NuGenesis LMS") || winactive("Edit Formulation") || winactive("Warning")
				; break
			sleep 100
		return
;; _____________________________LMS KEYBINDINGS____________________________
	#Ifwinactive, NuGenesis LMS ;; ___Nugenesis
		; F10::4tap()
		mbutton:: 3tap()
		+mbutton::lms.Menu()
		F7::		 3Right()
		F6::		3Left()
		F20 & Space::Varbar.Focus(Product)
		F20 & left::Send, %Product%(on sample log)
		F20 & down::Send, %Batch%
		F20 & right::Send, %lot%
		>+F20::LMS.SearchbarPaste()
		+^v::LMS.SearchbarPaste()
		<^v::lms.searchbarPaste()


	#Ifwinactive,Select Iterations
		F20::LMS.PasteProductRotation()
	#Ifwinactive,Book
		F19::LMS.CopyProductRotation()

	#Ifwinactive, Result Entry ;;___Result_Entry
		wheelup::			sendInput % Blockrepeat(400) Varbar.AddIteration(10)
		wheeldown:: sendInput % Blockrepeat(400) Varbar.SubIteration(10)
		#MaxThreadsPerHotkey 2
		F10::WorkTab.ChangeTestResults("loop")
		#MaxThreadsPerHotkey 1
	#Ifwinactive, Results Definition ;;__Results_Definition:
		F10::lms.menu()
		+mbutton::lms.menu()
		space::sendinput,{ctrldown}{click}{ctrlup}
		mbutton::Spectab.Table()
	#ifwinactive, Register new samples ;;__Register_new_samples:
		F9::
		clk(181, 104,2,2)
		sleep 300
		Send, %Product%{enter}
		return
	#ifwinactive, Reason for Change
	#ifwinactive, Select tests for request:
		space::send, ^{click}
		rbutton::send, ^{click}
		Numpaddot::send, {click 837, 656}{
	#ifwinactive, Select samples for test:
	#Ifwinactive, ahk_exe eln.exe, ;;___LMS app
		^`::						Varbar.reset()
		enter::					 LMSclick.okay()
		esc::						 LMSclick.esc()
		F9::						3up()
		F8::						3down()
		F7::						3Right()
		F6::						3Left()
		; F10::						4tap()

	#Ifwinactive, Barcode Scanner
		enter::enter
		; F20::LMS.SearchbarPaste()
		^v::LMS.SearchbarPaste()
	#Ifwinactive,

		; Lbutton & Rbutton::       send, ^{x}

		;;	___Esc:
		esc::						esc
		; numpadsub:: 		4Left()
		; numpadadd:: 		4right()
		; numpadMult:: 		4up()
		; numpaddot:: 		4down()
		pause::						Suspend, Toggle
		#h::return
		#p::return
		#k::return
		>+Backspace::			Delete
		F20 & esc:: 			run, Taskmgr.exe
		F20 & backspace:: 		Send, {delete}
		F20 & =:: 		Send,{ctrldown}{=}{ctrlup}
		F20 & -:: 		Send,{ctrldown}{-}{ctrlup}
		F19 & Rshift::				Varbar.focus("Edit1")
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
					winactivate, Delete
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
			else if winactive("Login")
					menu.passwords()
			else if winactive("Result Entry") {
					MouseGetPos, xpos, ypos
					WorkTab.ChangeTestResults("toggle")
					mousemove, %xpos%, %yPos%+26,0
				}
			else if winactive("Edit specification") || winactive("Results Definition")
					lms.menu()
			else if winactive("Composition")
					ProductTab.Table()
			else If winactive("Select methods tests")
					SpecTab.Table()
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
		return
		}
	3left(){
		global
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
