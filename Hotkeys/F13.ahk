
#ifwinactive, If winactive("ahk_exe explorer.exe")
Rbutton::Mbutton
;_________________________________________________________________________Snipper
#IfWinActive,  Paster - Snipaste ahk_exe Snipaste.exe
F13::sendinput, {enter}
F13 & Rbutton::Click, 2
#ifwinactive, 
;_________________________________________________________________________
;_________________________________________________________________________F13

F13 & LButton::	 
{
	If Winactive("ahk_exe AHK-Studio.exe") {
		Sendinput, +^4
		
	} ELSE 
		Sendinput, +^4 ;screenshot
	Return
}

F13 & RButton::	 
{
	If Winactive("ahk_exe AHK-Studio.exe") {
		
		
	} ELSE 
		sendinput, ^{lbutton}
	Return
}

F13 & MButton::	 
{
	If Winactive("ahk_exe AHK-Studio.exe") {
		
		
	} ELSE 
		Sendinput, % Varbar_get(Product) ;+Lbutton ; sendinput, {F3}
	Return
}

F13 & WheelLeft::	 
{
	If Winactive("ahk_exe AHK-Studio.exe") {
		
		
	} ELSE 
		Sendinput, % Varbar_get(Product)
	Return
}

F13 & WheelUp::	 
{
	If Winactive("ahk_exe AHK-Studio.exe") {
		
		
	} ELSE 
		Sendinput, % Varbar_get(lot)
	Return	
}
F13 & WheelDown::
{
	If Winactive("ahk_exe AHK-Studio.exe") {
		
		
	} ELSE 
		Mouse_Wheelpaste()
	Return	
}

F13 & WheelRight::	 
{
	If Winactive("ahk_exe AHK-Studio.exe") {
		
		
	} ELSE 
		Sendinput, % Varbar_get(Batch)
	Return
}

/*
	F13 & F16::	 
	{
		If Winactive("ahk_exe AHK-Studio.exe") {
			
			
		} ELSE 

		Return	
	}
	
	F13 & F17::	 
	{
		If Winactive("ahk_exe AHK-Studio.exe") { ;*[Vquest]
			
			
		} ELSE 
		Return
	}
*/


#If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4500)
{
	f13::Mouse_Wheelcopy() 
	Wheelup::Varbar_SetLot(Clip()) ;Set_lot()
	Wheeldown::sendinput, #v
	F16::
	Wheelleft::Varbar_SetProduct(Clip()) 
	F17::
	Wheelright::Varbar_SetBatch(Clip()) 
	
	mbutton::Varbar_SetProduct(Clip())
	#If
}
F13:: Tooltip("☩",4500)

