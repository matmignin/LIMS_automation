
#ifwinactive,  outlook



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
				Wheelup::VarSet_lot()
				Wheeldown::sendinput, #v
				F16::VarSet_ProductCode()
				Wheelleft::VarSet_ProductCode()
				F17::VarSet_Batch()
				Wheelright::VarSet_Batch()   
	#if
	*/

#ifwinactive
	
