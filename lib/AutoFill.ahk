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
		Sendinput,{enter}
	} Else If Winexist("Select Iterations - \\Remote"){
		winactivate,
		send, +^v
	}Else If winactive("Select Product - \\Remote"){
		Excel.Connect()
		sendinput,{click 106, 64}%Product%{enter}{enter}
		return
	} Else If winactive("Edit specification - \\Remote"){
		; ProductTab.EditProduct()
		menu.LMS()

	} Else If winactive("New Document - \\Remote"){
		sendinput, %Product%
	} else if winactive("Microsoft Excel Security Notice - \\Remote"){
		send, !y

		;------------------------------------------
	} Else If winactive("Edit Product - \\Remote"){
		;iniread, Product, data.ini, Products, 1
		ProductTab.EditProduct()
	} Else If winactive("Edit Formulation - \\Remote"){
		sendinput,{tab}%Product%+{tab 7}
	} Else If winactive("Composition - \\Remote"){
		ProductTab.Table()
	} Else If winactive("Edit Ingredient - \\Remote"){
		ProductTab.Table()



		;SpecTab -------------------------------------------------------------------
	} Else If winactive("Result Editor - \\Remote") || winactive("Test Definition Editor - \\Remote") || winactive("Results Definition - \\Remote"){
		SpecTab.Table()
	} Else If winactive("Edit sample template - \\Remote"){
		sendinput,{tab}{delete 4}%Product%{enter}
	} Else If winactive("Select methods tests - \\Remote"){
		Mouse_Click("SearchBar_SelectMethodsTests")


		;RotationTab -----------------------------------------------------------------
	} Else If winactive("Select Iterations - \\Remote"){
		Rotation_GetTable()



		;SampleTab -------------------------------------------------------------------
	} Else If winactive("Result Entry - \\Remote"){
		WorkTab.ChangeTestResults("toggle")
	} else if winexist("Reason For Change - \\Remote"){
		winactivate, Reason For Change - \\Remote
		sendinput,{click 143, 118}Fixing Rotation{click 240, 239}
		TT("Fixing Rotation",2000)
				return
	} else if Winactive("Register new samples - \\Remote"){
			If Option = 0
				WorkTab.registerNewSamples()
			else{
				sendinput,{Click 200, 134}
				sleep 300 ;register new sample
				WinWaitActive, Error - \\Remote,, 4
					if !ErrorLevel
						Send,{enter}
				sleep 200
				WinWaitNotActive, Error - \\Remote,,3
				sleep 200
				click.RegisterNewSamples()
				sleep 300
				return
			}


		;================================================================== make a method
	} Else if winactive("Edit sample (Field Configuration:"){
		WorkTab.registerNewSamples() ;

	} Else If winactive("Find and Replace"){
		sendinput, %Product%
	} Else If winactive("Select Product - \\Remote"){ ; rotation testing product select
		sendinput,{click 108, 67}%product%{enter 2}
	} Else If Winexist("Release:"){
		winactivate,
		sendinput,{tab}{enter}
		sleep 200
		ifwinactive, Sections Exceeding - \\Remote
			send,{enter}
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
		winactivate, Register new samples - \\Remote
	} Else If Winexist("Sign :"){
		winactivate,
		sendinput,{tab 2}{right 2}{tab 2}mmignin{tab}Kilgore7744{enter}
	}	Else If winactive("Edit test (Field Configuration:"){
			WorkTab.AddTestDescription("(on sample log)")


	} Else If winactive("Paster - Snipaste ahk_exe Snipaste.exe"){
		sendinput, ^-^-

	} else
		return
}




