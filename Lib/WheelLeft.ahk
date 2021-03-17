
#IfWinActive, ahk_exe WFICA32.EXE
F13::AutoLMS()

AutoLMS()
{
	global
	If Winactive("ahk_exe AHK-Studio.exe") {
		sendinput, !{left}
	} Else If Winexist("Password ahk_class bosa_sdm_XL9") || Winexist("Login - \\Remote") {
		Menu()
	} Else If winactive("ahk_exe explorer.exe"){
		;LMS ------------------------------------------------------------------------
	} Else If winactive("Result Entry - \\Remote"){
		SampleTab_ChangeTestResults()	
		;ProductTab ----------------------------------------------------------------
	} Else If winactive("Edit Product - \\Remote"){
		;iniread, Product, data.ini, Products, 1
		ProductTab_EditProduct()
	} Else If winactive("Edit Formulation - \\Remote"){
		sendinput,{tab}%Product%+{tab 7}
	} Else If winactive("Composition - \\Remote"){
		ProductTab_Table()
	} Else If winactive("Edit Ingredient - \\Remote"){
		ProductTab_Table()
		;SpecTab -------------------------------------------------------------------
	} Else If winactive("Result Editor - \\Remote") || winactive("Test Definition Editor - \\Remote") || winactive("Results Definition - \\Remote"){
		SpecTab_Table() 
	} Else If winactive("Edit sample template - \\Remote"){
		sendinput, {tab}{delete 4}%Product%{enter}
	} Else If winactive("Select methods tests - \\Remote"){
		Mouse_Click("SearchBar_SelectMethodsTests")
		;RotationTab -----------------------------------------------------------------
	} Else If winactive("Select Iterations - \\Remote"){
		Rotation_GetTable()
		
		;SampleTab -------------------------------------------------------------------
	} else if Winactive("Register new samples - \\Remote"){
		SampleTab_RegisterNewSample()
	} Else if winactive("Edit sample (Field Configuration: I`, Physical) - \\Remote"){		
		sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%{tab}
		;==================================================================
	} Else if WinActive("Edit sample (Field Configuration: CT`, Physical) - \\Remote"){
		sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%{tab}
	} Else if WinActive("Edit sample (Field Configuration: I`, Analytical) - \\Remote"){
		sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%{tab}
	} Else if Winactive("Edit sample (Field Configuration: F`, Micro) - \\Remote"){
		sendinput, {tab 2}{right}{click 277, 139}{tab 7}%Batch%{tab}%Lot%{tab}
	} Else if WinActive("Edit sample (Field Configuration: CT`, Retain) - \\Remote"){
		sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%{tab}
	} Else if WinActive("Edit sample (Field Configuration: I`, Retain) - \\Remote"){
		sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%{tab}
	} Else If winactive("Find and Replace") {
		sendinput, %Product%
	} Else If winactive("Select Product - \\Remote"){ ; rotation testing product select
		sendinput, {click 108, 67}%product%{enter 2}
	} Else If Winexist("Release:") {
		winactivate,
		sendinput, {tab}{enter}
		sleep 200
		ifwinactive, Sections Exceeding - \\Remote
			send, {enter}
		return
	} Else If Winexist("Opened Section found - \\Remote") {
		winactivate,
		Sendinput, {enter}
		sleep 400
	} Else If Winexist("Sign :") {
		winactivate,
		sendinput, {tab 2}{right 2}{tab 2}mmignin{tab}Kilgore7744{enter}
	} Else If winactive("Edit test (Field Configuration: F`, Micro) - \\Remote"){
		sendinput, {click 305, 294}{end}(on sample log){click 330, 617}
	} Else If winactive("Edit test (Field Configuration: I`, Analytical) - \\Remote"){
		sendinput, {click 305, 294}{end}(on sample log){click 330, 617}
	} Else If winactive("Edit test (Field Configuration: I`, Physical) - \\Remote"){
		sendinput, {click 305, 294}{end}(on sample log){click 330, 617}
	} Else If winactive("Register new samples - \\Remote ") {
		Sendinput, {tab 2}{space}
		winwaitactive, Error - \\Remote, , 4
		sendinput, {enter}
		RegisterNewSample()
		return
		
		
	} Else If winactive("Paster - Snipaste ahk_exe Snipaste.exe"){
		sendinput, ^-^-
		
	} else
		return
}
