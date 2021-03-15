#include <ProductTab>
#include <SampleTab>
#include <SpecTab>

#include <Rotation>

#IfWinActive





F20::Send_batch()
F19::sendinput, % Varbar_GetProduct

Return & Space::Send_Product()
Return & G::Enter_Product("G")
Return & H::Enter_Product("H")
Return & I::Enter_Product("I")
Return & J::Enter_Product("J")
Return & K::Enter_Product("K")
Return & L::Enter_Product("L")

Return & 1::return ;Enter_Batch("011")
;Return & 1::Enter_Batch("011")
Return & 2::Enter_Batch("002")
Return & 3::Enter_Batch("003")
Return & 4::Enter_Batch("004")
Return & 5::Enter_Batch("005")
Return & 6::Enter_Batch("006")
Return & 7::Enter_Batch("007")
Return & 8::Enter_Batch("008")
Return & 9::Enter_Batch("009")
Return & 0:: return
Return_0_Trigger:
#If (A_PriorHotKey = "Return & 0" AND A_TimeSincePriorHotkey < 4000)
Return & 0::Enter_Batch("010")
0::Enter_Batch("000")
Return_1_Trigger:
#If (A_PriorHotKey = "Return & 1" AND A_TimeSincePriorHotkey < 4000)
Return & 1::Enter_Batch("011")
Return & 0::Enter_Batch("010")
0::Enter_Batch("010")
1::Enter_Batch("011")
2::Enter_Batch("012")
#ifwinactive, NuGenesis LMS - \\Remote
F19::Mouse_Click("SearchBar_Product")	; rigth comm button)))
F20::Mouse_Click("SearchBar_Batch")     	   	     ; right alt button

F16::Mouse_wheel("left+^{left}")
#IfWinActive

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
	Save_Code("Batches", Batch)
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
	Save_Code("Products", Product)
	Sleep 200	
	IfWinActive, NuGenesis LMS - \\Remote
		sendinput, {ctrl down}a{ctrl up}%Product%{enter}
	VarBar()
	return
} 



#ifwinactive,  outlook
;capslock::return
F13 & WheelRight::
SENDINPUT % Varbar_get(Batch) " is updated"
RETURN


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
F14()
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
F14 & Wheeldown::Mouse_WheelZoomOut()
F14 & wheelup::Mouse_WheelZoomIn()
F14 & Rbutton:: 
F14 & Lbutton::Sendinput, #{down}
F14 & F15::sendinput, !{tab}
F14::F14()
;_________________________________________________________________________
;______________________________________________________________________F15
#Ifwinactive, NuGenesis LMS - \\Remote
F15 & WheelRIGHT::sendinput, {click, 743, 41}
F15 & WheelLEFT::sendinput, {Click 354, 44} 
F15 & WheelDOWN::Sendinput, {Click 46, 855}
F15 & wheelUP::sendinput, {click, 544, 41}
#IfWinActive
F15 & Rbutton:: 
F15 & Lbutton::sendinput, ^{Lbutton}
F15 & Mbutton:: 
F15 & F14::sendinput, #{tab}
F15::Menu()
