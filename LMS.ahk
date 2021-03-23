#include <ProductTab>
#include <SampleTab>
#include <SpecTab>
#include <Rotation>
#include <Excel>
#IfWinActive
Hotstrings:
{
; F19::return
Return & G::Enter_Product("G")
Return & H::Enter_Product("H")
Return & I::Enter_Product("I")
Return & J::Enter_Product("J")
Return & K::Enter_Product("K")
Return & L::Enter_Product("L")

}


#ifwinactive, NuGenesis LMS - \\Remote
; F19::Mouse_Click("SearchBar_Product")	; rigth comm button)))
F20::Mouse_Click("SearchBar_Batch")     	   	     ; right alt button
F16::Mouse_wheel("{left}+^{left}")
#IfWinActive, outlook
F13 & F16::SENDINPUT % Varbar_get(Batch) " is updated"
#IfWinActive, [ WinTitle, WinText]

Enter_Batch(key) 
{
	global
	MouseGetPos,MouseLocationX,MouseLocationY
	sleep 200
	; make varbar location + y35	
	inputbox,Batch,, %key%-,,70,130,%MouseLocationX%,%MouseLocationY%,,,%Batch%
	if ErrorLevel
		return
	else
		Batch:=key . "-" . Batch
	;Save_Code("Batches", Batch)
	;Envset, Batch, %Batch%
	Sleep 100		
	VarBar()
	return
}
Enter_Product(key)
{
	global
	MouseGetPos,MouseLocationX,MouseLocationY
	sleep 200
	; make varbar location + y35
	inputbox,Code,,  %key%`t ,,70,130,%MouseLocationX%,%MouseLocationY%,,,%Code%
	if !ErrorLevel
		Product:=key . Code
	;Save_Code("Products", Product)
	Sleep 200	
	IfWinActive, NuGenesis LMS - \\Remote
		sendinput, {ctrl down}a{ctrl up}%Product%{enter}
	VarBar()
	return
} 
Main_EditResults() 
{
	sendinput, {click}{click 77, 751} ;edit results
	winwaitactive, Results Definition - \\Remote
	return
}
RegisterNewSample() 
{
	global
	winactivate, Register new samples - \\Remote
	Send, {click 179, 105}{click}%Product%{enter}
}

#IfWinActive
;_________________________________________________________________________
;______________________________________________________________________F14

F14 & WheelRight:: 
Ifwinactive, NuGenesis LMS - \\Remote
	sendinput, {click, 743, 41}
ELSE 
	Sendinput, #{right}
return
F14 & WheelLeft:: 
Ifwinactive,NuGenesis LMS - \\Remote
	sendinput, {Click 354, 44}
ELSE 
	Sendinput, #{left}
return
F14 & WheelDOWN::Sendinput, {Click 46, 855}
F14 & wheelUP::sendinput, {click, 544, 41}

#Ifwinactive, NuGenesis LMS - \\Remote
F14 & WheelRIGHT::sendinput, {click, 743, 41}
F14 & WheelLEFT::sendinput, {Click 354, 44} 
#IfWinActive


LMS_AutoClick()
{
	global
	If Winactive("NuGenesis LMS - \\Remote"){
		click, 79, 440

	} Else If Winactive("ahk_exe EXCEL.EXE") {
		Excel_Search()
	} Else If Winactive("Results Definition - \\Remote") {
		Sendinput, ^{Lbutton}
	} Else If Winexist("Result Entry - \\Remote"){
		winactivate,
		Mouse_Click("OK_ResultEntry")
	} Else If Winexist("Delete Test - \\Remote ") {
		winactivate,
		Sendinput, {enter}
	} Else If Winexist("Select Iterations - \\Remote") {
		winactivate,
		Rotation_GetTable()
	} Else If winactive("Select Product - \\Remote") {
		excel_Connect()
		sendinput, {click 106, 64}%Product%{enter}{enter}
		return
	} Else If winactive("Edit specification - \\Remote"){
		ProductTab_EditProduct() 
	} else
		return
	Return
}

#IfWinActive, ahk_exe WFICA32.EXE
F13::LMS_AutoFill()



LMS_AutoFill()
{
	global
	If Winexist("Password ahk_class bosa_sdm_XL9") || Winexist("Login - \\Remote") {
		Menu()
		;LMS ------------------------------------------------------------------------
			} Else If winactive("NuGenesis LMS - \\Remote"){
				;Mouse_click("SearchBar_Product")
				;sendinput, %Product%{Enter}
				menu()
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
	} Else If winactive("Result Entry - \\Remote"){
		SampleTab_ChangeTestResults()	
	} else if Winactive("Register new samples - \\Remote"){
		SampleTab_RegisterNewSample()
		;================================================================== make a method
			} Else if winactive("Edit sample (Field Configuration: I`, Physical) - \\Remote"){		
				sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%{tab}
				SampleTab_SelectShipTo(6,9)
			} Else if WinActive("Edit sample (Field Configuration: CT`, Physical) - \\Remote"){
				sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%{tab}
				SampleTab_SelectShipTo(6,9)
			} Else if WinActive("Edit sample (Field Configuration: I`, Analytical) - \\Remote"){
				sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%{tab}
				SampleTab_SelectShipTo(6,9)
			} Else if Winactive("Edit sample (Field Configuration: F`, Micro) - \\Remote"){
				sendinput, {tab 2}{right}{click 277, 139}{tab 7}%Batch%{tab}%Lot%{tab}
				SampleTab_SelectShipTo(6,9)
			} Else if WinActive("Edit sample (Field Configuration: CT`, Retain) - \\Remote"){
				sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%{tab}
				SampleTab_SelectShipTo(6,9)
			} Else if WinActive("Edit sample (Field Configuration: I`, Retain) - \\Remote"){
				sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%{tab}
				SampleTab_SelectShipTo(6,9) ;equalife = 6,9
		;================================================================== make a method
		
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
