WheelLeft(){
global
	If Winactive("ahk_exe AHK-Studio.exe") {
		sendinput, !{left}
	} Else If winactive("ahk_exe EXCEL.EXE"){
		
	} Else If winactive("ahk_exe explorer.exe"){

;LMS
	} Else If winactive("Result Entry - \\Remote"){
		ChangeTestResults()

;PRODUCT_TAB:
	} Else If winactive("Edit Product - \\Remote"){
		Product_Tab_EditProduct(ProductCode)
	} Else If winactive("Edit Formulation - \\Remote"){
		sendinput,{tab}%ProductCode%+{tab 7}
	} Else If winactive("Composition - \\Remote"){
		run, LMS\GUI_ProductTable.ahk
	} Else If winactive("Edit Ingredient - \\Remote"){
		run, LMS\GUI_ProductTable.ahk
	} Else If winactive("ahk_exe WFICA32.EXE"){
		

;SPEC_TAB:
	} Else If winactive("Result Editor - \\Remote") || winactive("Test Definition Editor - \\Remote") || winactive("Results Definition - \\Remote"){
		Run, LMS\GUI_SpecTable.ahk ;GetIngredientMenu()


	} Else If winactive("Edit sample template - \\Remote"){
		sendinput, {tab}{delete 4}%ProductCode%{enter}
	} Else If winactive("Select methods tests - \\Remote"){
		Click("SearchBar_SelectMethodsTests")

	} Else If winactive("ahk_exe WFICA32.EXE"){
		
;SAMPLE_TAB
	} else if Winactive("Register new samples - \\Remote"){
		RegisterNewSample()
	} Else if Winexist("Edit sample (Field Configuration: I`, Physical) - \\Remote"){
		Winactivate,
		Excel_ConnectTo()
		sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%
		SelectCustomer()
	} Else if Winexist("Edit sample (Field Configuration: CT`, Physical) - \\Remote"){
		Winactivate,
		Excel_ConnectTo()
		sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%
		SelectCustomer()
	} Else if Winexist("Edit sample (Field Configuration: I`, Analytical) - \\Remote"){
		Winactivate,
		Excel_ConnectTo()
		sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%
		SelectCustomer()
	} Else if Winexist("Edit sample (Field Configuration: F`, Micro) - \\Remote"){
		Winactivate,
		Excel_ConnectTo()
		sendinput, {tab 2}{right}{click 277, 139}{tab 7}%Batch%{tab}%Lot%
		SelectCustomer()
	} Else if Winexist("Edit sample (Field Configuration: CT`, Retain) - \\Remote, "){
		winactivate,
		Excel_ConnectTo()
		sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%
		SelectCustomer()
	} Else if Winexist("Edit sample (Field Configuration: I`, Retain) - \\Remote"){
		winactivate,
		Excel_ConnectTo()
		sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%
		SelectCustomer()
		



	;==================================================================
	} Else If Winexist("Find and Replace") {
		WinActivate,

	} Else If Winexist("") {
		WinActivate,

	} Else If Winexist("") {
		WinActivate,

	} Else If Winexist("") {
		WinActivate,

	} Else If Winexist("") {
		WinActivate,

	} Else If Winexist("") {
		WinActivate,

	} Else If Winexist("") {
		WinActivate,

	} Else If Winexist("") {
		WinActivate,

	} Else If Winexist("") {
		WinActivate,
		
	} Else If Winexist("") {
		WinActivate,
		


	;SAMPLE_TAB

		
	} else
		return
}
