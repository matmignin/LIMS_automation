
#ifwinactive, ahk_exe OUTLOOK.EXE ;{ 
Capslock::return
Mbutton::
sendinput, {click , 2}
Set_Batch()
return

Rbutton & WheelRight::
	;F13 & F16::Send_ProductCode()
	send_Batch()
	SENDINPUT, {space}is updated
	RETURN
	/*
		F16::
			SetScrollLockState, On
				SendInput {Left 3} 
			SetScrollLockState, Off 
			return
	
		F17::
			SetScrollLockState, On 
				SendInput {Right 3} 
			SetScrollLockState, Off 
			return
	#If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4000) && winactive("ahk_exe OUTLOOK.EXE")
				f13::wheel_copy() 
				Wheelup::Set_Lot()
				Wheeldown::sendinput, #v
				F16::Set_ProductCode()
				Wheelleft::Set_ProductCode()
				F17::Set_Batch()
				Wheelright::Set_Batch()   
	#if
	*/

#ifwinactive
	
