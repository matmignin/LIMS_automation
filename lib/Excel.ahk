Excel_Connect(reload:=1){
	Global
	Gui VarBar:+LastFound 
	Products:=[]
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
		XL.Workbooks.Open("C:\Users\mmignin\OneDrive - Vitaquest International\LMS Workbook.xlsm")
		XL.Visible := True		
		; XL:=XL.ActiveSheet	
	}
	Catch {
		Tooltip("no excel workbook open", 4000)
		exit
	}
	For sheet in xl.ActiveWorkbook.Worksheets 
		Products.insert(Sheet.Name)
	Products.remove(1)
	Products.remove(1)
	loop 10 {
		if (Products[A_index] = "Finished")
			break
		else 	
			DDLProducts .= "|" Products[A_index]

	}
	Product:=XL.Range("B7").Value
	Name:=XL.Range("B2").Value
	Batch:=XL.Range("C1").Value
	Lot:=XL.Range("E1").Value
	Customer:=XL.Range("B3").Value
	; gui,varbar:Submit,Nohide
	sleep 50
	if (Reload = 1)
		VarBar.show()
	return
}



; Excel_SetProduct(The_Product:=0){
; 	Global
; 	try {
; 		XLBook := ComObjActive("Excel.Application")
; 			;XLBook:=ComObjGet(%WorkbookPath%)
; 		if (The_product:=0)
; 			XL:=XLBook.ActiveSheet
; 		else
; 			XL:=XLBook.sheets(The_Product)
; 	} Catch { 
; 		return
; 	}			
; 	Visible := True		
; 		;Product:=XL.Range("B7").Value
; 	Name:=Xl.Range("B2").Value
; 	Batch:=Xl.Range("C1").value
; 	Lot:=Xl.Range("E1").Value
; 	Customer:=Xl.Range("B3").Value
; 	return
; }




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
