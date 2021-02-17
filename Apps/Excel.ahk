#IfWinActive, New Products Workbook.xlsm - Excel

Rbutton & Lbutton::set_ExcelProductCode()

#ifwinactive, Find and Replace,
rbutton & Lbutton::sendinput, !i
enter::Sendinput, !i
Rbutton & F16::Send_ProductCode()

#Ifwinactive, Password ahk_class bosa_sdm_XL9 ;excell login password


#IfWinActive, ahk_exe EXCEL.EXE
	Enter::numpadenter
	Rbutton & Mbutton::
	Excel_set_ProductCode_Cell()
	click("SearchBar_ProductCode")
	return
	mbutton::Excel_set_ProductCode_Cell()
	Return
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
			Wheelup::Set_Lot()
			Wheeldown::sendinput, #v
			
			F16::Set_ProductCode()
			Wheelleft::Set_ProductCode()
			F17::Set_Batch()
			Wheelright::Set_Batch()   
#if
#IfWinActive
/*
	F14::
	Sendinput, {F2}^a
	sleep 200
	Set_Batch()
	return
*/
