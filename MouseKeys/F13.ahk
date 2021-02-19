/*
	F13_up(){
	If Winactive("hk_exe AHK-Studio.exe") {
		Sendinput, 
		
		
		} ELSE 
			Return
	}
	
	F13_down(){
	If Winactive("ahk_exe AHK-Studio.exe") {
		sendinput, 
	
	
		} ELSE 
			Return
	}
	
	F13_left(){
	If Winactive("ahk_exe AHK-Studio.exe") {
		sendinput,
	
	
		} ELSE 
		Return
	}
	
	F13_right(){
	If Winactive("ahk_exe AHK-Studio.exe") {
		sendinput, 
	
	
		} ELSE 
			Return
	}
	
	F13_lButton(){
	If Winactive("ahk_exe AHK-Studio.exe") {
		sendinput, 
	
	
		} ELSE 
			Return
	}
	
	F13_RButton(){
	If Winactive("ahk_exe AHK-Studio.exe") {
		sendinput, 
	
	
		} ELSE 
			Return
	}
	
	F13_MButtone(){}
	 
	If Winactive("ahk_exe AHK-Studio.exe") {
	
	
		} ELSE 
			Return
	}
	F13_F14(){
	}
	If Winactive(") {
	 


	} ELSE 
		Return
}
*/
 

;_________________________________________________________________________
;_________________________________________________________________________F13

F13 & LButton::	 
	If Winactive("ahk_exe AHK-Studio.exe") {
	msgbox, yo
	
		} ELSE 
			Sendinput, +^4 ;screenshot
	
Return
F13 & RButton::	 
	If Winactive("ahk_exe AHK-Studio.exe") {
	
	
		} ELSE 
			sendinput, ^{lbutton}
	
Return
F13 & MButton::	 
	If Winactive("ahk_exe AHK-Studio.exe") {
	
	
		} ELSE 
			Send_Productcode() ;+Lbutton ; sendinput, {F3}
	
Return
F13 & WheelLeft::	 
	If Winactive("ahk_exe AHK-Studio.exe") {
	
	
		} ELSE 
			Send_ProductCode()
	
Return
F13 & WheelRight::	 
	If Winactive("ahk_exe AHK-Studio.exe") {
	
	
		} ELSE 
			Send_Batch()
	
Return
F13 & WheelUp::	 
	If Winactive("ahk_exe AHK-Studio.exe") {
	
	
		} ELSE 
			Send_lot()
Return	
F13 & WheelDown::	 
	If Winactive("ahk_exe AHK-Studio.exe") {
	
	
		} ELSE 
			wheel_paste()
Return	
F13 & F17::	 
	If Winactive("ahk_exe AHK-Studio.exe") {
	
	
		} ELSE 
			Send_batch()
Return	
F13 & F16::	 
	If Winactive("ahk_exe AHK-Studio.exe") {
	
	
		} ELSE 
			Send_ProductCode()
Return	
	
	#If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4000)
		f13::wheel_copy() 
		Wheelup::VarSet_lot()
		Wheeldown::sendinput, #v
		F17::VarSet_ProductCode()
		Wheelleft::VarSet_ProductCode()
		F16::VarSet_Batch()
		Wheelright::VarSet_Batch() 
		mbutton::VarSet_ProductCode()
	#If
	F13:: 
		Tooltip, ☩
		sleep 4000
		tooltip,
		return
