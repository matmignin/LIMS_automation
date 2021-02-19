#IfWinActive, New Products Workbook.xlsm - Excel
Rbutton & Lbutton::Excel_SetProductCode()

#ifwinactive, Find and Replace,
rbutton & Lbutton::sendinput, !i
enter::Sendinput, !i
Rbutton & F16::Send_ProductCode()

#Ifwinactive, Password ahk_class bosa_sdm_XL9 ;excell login password


#IfWinActive, ahk_exe EXCEL.EXE

	Rbutton & Mbutton::
	Excel_Set_ProductCode_Cell()
	click("SearchBar_ProductCode")
	return
	;F13 & F17::Send_batch()
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
	F13 & F16::Send_ProductCode()
#If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4000) && winactive("ahk_exe EXCEL.EXE")
			f13::wheel_copy() 
			Wheelup::VarSet_lot()
			Wheeldown::sendinput, #v
			
			F16::VarSet_ProductCode()
			Wheelleft::VarSet_ProductCode()
			F17::VarSet_Batch()
			Wheelright::VarSet_Batch()   
#if
#IfWinActive
/*
	F14::
	Sendinput, {F2}^a
	sleep 200
	VarSet_Batch()
	return
*/
