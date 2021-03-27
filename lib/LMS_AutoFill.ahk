LMS_AutoFill()
{
	global






		;LMS ------------------------------------------------------------------------
	If Winexist("Password ahk_class bosa_sdm_XL9") || Winexist("Login - \\Remote") {
		Menu()
	} Else If Winactive("NuGenesis LMS - \\Remote"){
		click, 79, 440

	} Else If Winactive("ahk_exe EXCEL.EXE") {
		Excel.Search()
	} Else If Winactive("Results Definition - \\Remote") {
		Sendinput, ^{Lbutton}
	} Else If Winexist("Delete Test - \\Remote ") {
		winactivate,
		Sendinput, {enter}
	} Else If Winexist("Select Iterations - \\Remote") {
		winactivate,
		Rotation_GetTable()
	} Else If winactive("Select Product - \\Remote") {
		Excel.Connect()
		sendinput, {click 106, 64}%Product%{enter}{enter}
		return
	} Else If winactive("Edit specification - \\Remote"){
		ProductTab_EditProduct() 




		;------------------------------------------
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
	} Else If winactive("Result Entry - \\Remote"){
		WorkTab_ChangeTestResults("toggle")	
	} else if Winactive("Register new samples - \\Remote"){
		WorkTab_RegisterNewSample()






		;================================================================== make a method
	} Else if winactive("Edit sample (Field Configuration:") {
		WorkTab_EditSample() ;
	
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
	} Else If Winexist("Error - \\Remote") {
		winactivate,
		Sendinput, {enter}
		sleep 300
	} Else If Winexist("Sign :") {
		winactivate,
		sendinput, {tab 2}{right 2}{tab 2}mmignin{tab}Kilgore7744{enter}
	} Else If winactive("Edit test (Field Configuration:"){
		sendinput, {click 305, 294}{end}(on sample log){click 330, 617}
	} Else If winactive("Register new samples - \\Remote ") {
		Sendinput, {tab 2}{space}
		winwaitactive, Error - \\Remote, , 4
		sendinput, {enter}
		workTab_RegisterNewSample()
		return
		
		
	} Else If winactive("Paster - Snipaste ahk_exe Snipaste.exe"){
		sendinput, ^-^-
		










		
	} else
	
		return
}
