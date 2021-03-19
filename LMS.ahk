#include <ProductTab>
#include <SampleTab>
#include <SpecTab>
#include <Rotation>
#include <Excel>
#IfWinActive
Hotstrings:
{
F19::return
Return & G::Enter_Product("G")
Return & H::Enter_Product("H")
Return & I::Enter_Product("I")
Return & J::Enter_Product("J")
Return & K::Enter_Product("K")
Return & L::Enter_Product("L")

}


#ifwinactive, NuGenesis LMS - \\Remote
F19::Mouse_Click("SearchBar_Product")	; rigth comm button)))
F20::Mouse_Click("SearchBar_Batch")     	   	     ; right alt button
F16::Mouse_wheel("{left}+^{left}")
#IfWinActive
F13 & WheelRight::
SENDINPUT % Varbar_get(Batch) " is updated"
RETURN

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


F14 & Rbutton:: 
F14 & Lbutton::Sendinput, #{down}
F13 & F14::sendinput, !{tab}

;_________________________________________________________________________
;______________________________________________________________________F18
#Ifwinactive, NuGenesis LMS - \\Remote
F14 & WheelRIGHT::sendinput, {click, 743, 41}
F14 & WheelLEFT::sendinput, {Click 354, 44} 
#IfWinActive
F18 & Rbutton:: 
F18 & Lbutton::sendinput, ^{Lbutton}
F18 & Mbutton:: 
F14 & F13::sendinput, #{tab}

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