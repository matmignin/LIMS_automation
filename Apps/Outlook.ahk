
#ifwinactive,  outlook

F16::Wheelleft()
F17::Wheelright()
Rbutton & WheelRight::
	;F13 & F16::sendinput, % Varbar_Get(Product)()
	capslock::return
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
	*/
	#If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4000) && winactive("ahk_exe OUTLOOK.EXE")
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

#ifwinactive
	
