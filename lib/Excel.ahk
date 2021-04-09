



#include <varbar>


Class Excel{

Connect(reload:=0){
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
		; XL:=XL.ActiveSheet	
		XL.Visible := True		
	}
	Catch {
		Tooltip("no excel workbook open", 4000)
		exit
	}
	
	
	
	; For sheet in xl.ActiveWorkbook.Worksheets 
		; Products.insert(Sheet.Name)
	; Products.remove(1)
	; Products.remove(1)
	; loop 10 {
		; if (Products[A_index] = "Finished")
			; break
		; else 	
			; DDLProducts .= "|" Products[A_index]
	; }
	Gui VarBar:+LastFound
	GuiControl, -redraw, varbar
	Product:=XL.Range("B7").Value
		ControlSetText, Edit1,%Product%, VarBar
	Batch:=XL.Range("C1").Value
		ControlSetText, Static1,%Batch%, VarBar
	Lot:=XL.Range("C2").Value
		ControlSetText, Static2,%lot%, VarBar
	Coated:=xl.range("E2").value
		ControlSetText, Static3,%Coated%, VarBar
	Name:=XL.Range("B2").Value
		ControlSetText, Static4,%Name%, VarBar
	Customer:=XL.Range("B3").Value	
		ControlSetText, Static5,%Customer%, VarBar
	; Gui, varbar:submit, nohide
	; if (Skip := "Iteration")
		; ControlSetText, Edit2,%Iteration%, VarBar
	; Varbar.Update(Iteration)
	GuiControl, +redraw, varbar
	if (Reload = 1)
		VarBar.show()
	return
}






ActiveCell(){
	Global
	ActiveCell := Xl.ActiveCell.value
	ActiveCell := Trim((ActiveCell, "`r`n"))
return ActiveCell
}

NextSheet(){
	global 
	Gui VarBar:+LastFound 
	;GuiControl, -redraw, varbar
	NextSheet:=xl.ActiveWorkbook.Activesheet.index +1
	NextSheetName:=xl.activeworkbook.Worksheets(NextSheet).name
	if (nextsheetname = "Finished")
		exit
	XL.Sheets(NextSheetname).activate
	; varbar.Update()
	Gui, VarBar:color, 21a366 ;green
	excel.connect()
	;GuiControl, +redraw, varbar
}

PreviousSheet(){
	global
	Gui VarBar:+LastFound 
	;GuiControl, -redraw, varbar
	PreviousSheet:=xl.ActiveWorkbook.Activesheet.index -1
	if (PreviousSheet < 3) 
		exit
	XL.Sheets(PreviousSheet).activate
	; varbar.Update()
	Gui, VarBar:color, 21a366 ;green
	excel.connect()
	;GuiControl, +redraw, varbar
}


Get_Current_row(){
	Global
	LV_GetText(Position, Current_row,1)	
	LV_GetText(Name, Current_row,2)
	LV_GetText(LabelClaim, Current_row,3)
	LV_GetText(LabelName, Current_row,4)
	;LV_Modify(Current_row, "Check")
	sleep 100
	return
}
Search(){
	BlockInput, on
	sendinput, ^f!t!h{right}{enter}!s{right}!t!n
	BlockInput, off
	sleep 200
	return
}

PasteValues() {
	global
;	excel.connect()
			If (Regexmatch(Clip(), "[EGLHKJI]{1}\d{3}", ClipForProduct) > 0) 	
			{
				Product:=ClipforProduct
				xl.ActiveWorkbook.Activesheet.Range("B7").value := Product
				ControlSend, , {Enter}, ahk_class XLMAIN
			}
			else 
			{
				send, ^c
				clipwait, 1
				Xl.CutCopyMode := False
	if WinActive("ahk_exe OUTLOOK.EXE") 
     xl.Run("'LMS Workbook.xlsm'!PasteRotation")
	else if WinActive("ahk_exe explorer.exe") 
	{
		xl.ActiveWorkbook.Activesheet.Range("B8").select
    xl.Run("'LMS Workbook.xlsm'!PasteIngredients")
	}
		return
}

}
}



