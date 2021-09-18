AutoFill(Option:=0){
	global
	;LMS ------------------------------------------------------------------------
	If Winexist("Password ahk_class bosa_sdm_XL9") || Winexist("Login - \\Remote"){
		Menu.LMS()
	} Else If Winactive("NuGenesis LMS - \\Remote"){
		excel.connect()
		WorkTab.NewRequest()
		return ;click, 79, 440
	} Else If Winactive("ahk_exe EXCEL.EXE"){
		Excel.Search()
	} Else If Winactive("Results Definition - \\Remote"){
		menu.LMS()
	} Else If Winexist("Delete Test - \\Remote "){
		winactivate,
		SendInput,{enter}
	} Else If Winexist("Select Iterations - \\Remote"){
		winactivate,
		Send, +^v
	} Else If winactive("Select Product - \\Remote"){
		Excel.Connect()
		SendInput,{click 106, 64}%Product%{enter}{enter}
		return
	} Else If winactive("Edit specification - \\Remote"){
		; ProductTab.EditProduct()
		menu.LMS()
	} Else If winactive("New Document - \\Remote"){
		SendInput, %Product%
	} else if winactive("Microsoft Excel Security Notice - \\Remote"){
		Send, !y
		;------------------------------------------
	} Else If winactive("Edit Product - \\Remote"){
		;iniread, Product, data.ini, Products, 1
		ProductTab.EditProduct()
	} Else If winactive("Edit Formulation - \\Remote"){
		SendInput,{tab}%Product%+{tab 7}
	} Else If winactive("Composition - \\Remote"){
		ProductTab.Table()
	} Else If winactive("Edit Ingredient - \\Remote"){
		ProductTab.Table()



		;SpecTab -------------------------------------------------------------------
	} Else If winactive("Result Editor - \\Remote") || winactive("Test Definition Editor - \\Remote") || winactive("Results Definition - \\Remote"){
		SpecTab.Table()
	} Else If winactive("Edit sample template - \\Remote"){
		SendInput,{tab}{delete 4}%Product%{enter}
	} Else If winactive("Select methods tests - \\Remote"){
		clk(225, 69,, 2)
		; Mouse_Click("SearchBar_SelectMethodsTests") ;eliminating mouseclick funct


		;RotationTab -----------------------------------------------------------------
	} Else If winactive("Select Iterations - \\Remote"){
		Rotation_GetTable()



		;SampleTab -------------------------------------------------------------------
	} Else If winactive("Result Entry - \\Remote"){
		WorkTab.ChangeTestResults("toggle")
	} else if winexist("Reason For Change - \\Remote"){
		Menu.Reasons()
				return
	} else if Winactive("Register new samples - \\Remote"){
			If Option = 0
				WorkTab.registerNewSamples()
			else{
				SendInput,{Click 200, 134}
				sleep 300 ;register new sample
				WinWaitActive, Error - \\Remote,, 4
					if !ErrorLevel
						Send,{enter}
				sleep 200
				WinWaitNotActive, Error - \\Remote,,3
				sleep 200
				; RegisterNewSamples(){
					WinActivate, Register new samples - \\Remote
					click 181, 103, 2
					sleep 50
					; click 181, 103,
					sleep 300
					Send, %product%
					sleep 300
					Send, {enter}
					return
					; }
				; click.RegisterNewSamples()
				sleep 300
				return
			}


		;================================================================== make a method
	} Else if winactive("Edit sample (Field Configuration:"){
		WorkTab.registerNewSamples() ;

	} Else If winactive("Find and Replace"){
		SendInput, %Product%
	} Else If winactive("Select Product - \\Remote"){ ; rotation testing product select
		SendInput,{click 108, 67}%product%{enter 2}
	} Else If Winexist("Release:"){
		winactivate,
		SendInput,{tab}{enter}
		sleep 200
		ifwinactive, Sections Exceeding - \\Remote
			Send,{enter}
		return

	; } Else If Winexist("Approve specification - \\Remote"){
	} Else If Winexist("Opened Section found - \\Remote") || Winexist("Approve specification - \\Remote"){
		winactivate,
		Send,{enter}
		sleep 100
	} Else If Winexist("Error - \\Remote"){
		winactivate,
		Send,{enter}
		sleep 200
		ifwinnotactive, Register new samples - \\Remote
		winactivate, Register new samples - \\Remote
	} Else If Winexist("Sign :"){
		winactivate,
		SendInput,{tab 2}{right 2}{tab 2}mmignin{tab}Kilgore7744{enter}
	}	Else If winactive("Edit test (Field Configuration:"){
			WorkTab.AddTestDescription("(on sample log)")


	} Else If winactive("Paster - Snipaste ahk_exe Snipaste.exe"){
		Send, ^-^-

	} else
		return
}




