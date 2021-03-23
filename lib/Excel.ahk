#ifwinactive, ahk_exe EXCEL.EXE
	+Enter::sendinput, !{enter}
	$Enter::sendinput, {enter}
	F13::Excel_Search()
	`::esc
#IfWinActive, LMS Workbook.xlsm - Excel
	F18::Excel_Connect()

#ifwinactive, Find and Replace,
	rbutton & Lbutton::sendinput, !i
#IfWinActive

/*
	#If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4000) && winactive("ahk_exe EXCEL.EXE")
	{
		f13::Mouse_Wheelcopy() 
		Wheelup::Set_lot()
		Wheeldown::sendinput, #v
		Wheelleft::Save_Code("Products") 
		F17::Save_Code("Batches")  
		Wheelright::Save_Code("Batches")   
		#if
	}
	
	#IfWinActive, ahk_exe EXCEL.EXE
	Rbutton & Mbutton::Excel_Set_Product_Cell()
	F16::AutoLMS()
	F17::Wheel_Right()
	F13 & F16::Send_Product()


;Try XL := ComObjCreate("Excel.Application").Open(Path) 
;else
;XL:=XL.Sheets(sheet).activate
;}
*/

Excel_Connect(){
	Global
	Path:="C:\Users\mmignin\OneDrive - Vitaquest International\"
	if WinExist("LMS Workbook.xlsm - Excel")
		ControlSend,ahk_parent, {esc}, LMS Workbook.xlsm - Excel
	else{
			msgbox,4,,open LMS Workbook?
			IfMsgBox, Yes
				runwait, LMS Workbook.xlsm, %Path%
			IfMsgBox,No
				exit
		}
	Try {
		XL := ComObjActive("Excel.Application")
		XL.Visible := True		
		XL:=XL.ActiveSheet
	}
	Catch {
		Tooltip("no excel workbook open", 4000)
		exit
	}
	Product:=XL.Range("B7").Value
	Name:=XL.Range("B2").Value
	Batch:=XL.Range("C1").Value
	Lot:=XL.Range("E1").Value
	Customer:=XL.Range("B3").Value
	sleep 200
	VarBar()
	return
}



Excel_SetProduct(The_Product:=0){
	Global
	try {
		XLBook := ComObjActive("Excel.Application")
			;XLBook:=ComObjGet(%WorkbookPath%)
		if (The_product:=0)
			XL:=XLBook.ActiveSheet
		else
			XL:=XLBook.sheets(The_Product)
	} Catch { 
		return
	}			
	Visible := True		
		;Product:=XL.Range("B7").Value
	Name:=Xl.Range("B2").Value
	Batch:=Xl.Range("C1").value
	Lot:=Xl.Range("E1").Value
	Customer:=Xl.Range("B3").Value
	return
}
/* 
Excel_ConnectToCode(option:=1)
{
	Global
	try {
		XLBook := ComObjActive("Excel.Application")
			;XLBook:=ComObjGet(%WorkbookPath%)
		XL:=XLBook.ActiveSheet
		Visible := True		
	} Catch  {
		if (option:=0)
			exit
		else	{
			msgbox, no Excel Sheet found	;if there is no excel sheet found
			exit	
		}
	}
	Product:=XL.Range("B7").Value
	Name:=Xl.Range("B2").Value
	Batch:=Xl.Range("C1").Value
	Lot:=Xl.Range("E1").Value
	Customer:=Xl.Range("B3").Value
	sleep 200
	if (option:=2)
		return
	VarBar()
	return
}


Excel_Set_Product_Cell()
{
	Global
	click
	try {
		XL := ComObjActive("Excel.Application")
		Visible := True		
	} Catch  ;if there is no excel sheet found
		return
	Product:=XL.ActiveCell.Text
	Sleep 200
	VarBar()
	return
}
 */
Excel_Get_Current_row()
{
	Global
	LV_GetText(Position, Current_row,1)	
	LV_GetText(Name, Current_row,2)
	LV_GetText(LabelClaim, Current_row,3)
	LV_GetText(LabelName, Current_row,4)
	LV_Modify(Current_row, "Check")
	sleep 200
}
Excel_Search()
{
	BlockInput, on
	sendinput, ^f!t!h{right}{enter}!s{right}!t!n
	BlockInput, off
	sleep 400
}



	;Excel_ConnectTo(Product_Code){
	;global
	;try {
	;XL := ComObjActive("Excel.Application").Sheets(Product_Code)
	;Visible := True		
	;} Catch 
;return
;Name:=Xl.Range("B2").text
;Batch:=Xl.Range("B4").text
;Lot:=Xl.Range("B5").text
;Customer:=Xl.Range("B3").text
;ServingSize:=Xl.Range("B6").text
;}
