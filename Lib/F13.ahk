#include <Mouse>

#ifwinactive, If winactive("ahk_exe explorer.exe")
;Rbutton::Mbutton
;_________________________________________________________________________Snipper
#IfWinActive,  Paster - Snipaste ahk_exe Snipaste.exe
F13::sendinput, {enter}
F13 & Rbutton::Click, 2
#ifwinactive, 
;_________________________________________________________________________
;_________________________________________________________________________F13

F13 & LButton::Sendinput, +^4 ;screenshot
F13 & RButton::OCR()
F13 & MButton::Sendinput, % Varbar_get(Product)
F13 & WheelLeft::Sendinput, % Varbar_get(Product)
F13 & WheelUp::Sendinput, % Varbar_get(lot)

F13 & WheelRight::Sendinput, % Varbar_get(Batch)


#If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4000) && winactive("ahk_exe OUTLOOK.EXE")
{
	f13::Mouse_Wheelcopy() 
	Wheelup::Set_lot()
	Wheeldown::sendinput, #v
	F16::
	Wheelleft::
	Save_Code("Products") ;
	Set_Product()
	return
	F17::
	Wheelright::
	sendinput, ^+{right 2}
	Save_Code("Batches") 
	return  
#if
}
#If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4500)
{
	f13::Mouse_Wheelcopy() 
	Wheelup::Varbar_SetLot(Mouse_clip()) ;Set_lot()
	Wheeldown::sendinput, #v
	F16::
	Wheelleft::Varbar_SetProduct(Mouse_clip()) 
	F17::
	Wheelright::Varbar_SetBatch(Mouse_clip()) 
	
	mbutton::Varbar_SetProduct(Mouse_clip())
	#If
}
F13:: Tooltip("☩",4500)
