



#include <varbar>
#include <mouse>


Class Excel{

Connect(reload:=0){
	Global
	Gui VarBar:+LastFound 
	Products:=[]
	Path:="C:\Users\mmignin\OneDrive - Vitaquest International\"
	if WinExist("LMS Workbook.xlsm")
		ControlSend,ahk_parent, {esc}, LMS Workbook.xlsm
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
	}
	Catch {
		Tooltip("no excel workbook open", 4000)
		exit
	}	
	; For sheet in xl.ActiveWorkbook.Worksheets 
	; 	Products.insert(Sheet.Name)
	; Products.remove(1)
	; Products.remove(1)
	; loop 3 {
	; 	if (Products[A_index] = "Finished")
	; 		break
	; 	else 	
	; 		DDLProducts .= "|" Products[A_index]
	; }
	Gui VarBar:+LastFound
	GuiControl, -redraw, varbar
;	if (xl.ActiveWorkbook.Activesheet.Name = "Finished")
		;		Excel.PreviousSheet()
;	While (Regexmatch(XL.Range("B7").Value, "[ADEGLHKJI]\d{3}", ExcelSheet) = 0)
	;			Excel.NextSheet()
	Product:=XL.Range("B7").Value
		GuiControl, Varbar:Text, Product, %Product%
	Batch:=XL.Range("C4").Value
		GuiControl, Varbar:Text, Batch, %Batch%
	Lot:=XL.Range("E4").Value
		GuiControl, Varbar:Text, lot, %lot%
	Coated:=xl.range("F4").value
		GuiControl, Varbar:Text, Coated, %coated%
	Name:=XL.Range("B2").Value
			GuiControl, Varbar:Text, name, %name%
	Customer:=XL.Range("B3").Value	
			GuiControl, Varbar:Text, customer, %Customer%
	ShipTo:=XL.Range("C3").Value	
		EnvSet, ShipTo, %ShipTo%
	GuiControl, Varbar:Text, iteration, %iteration%
		ShapeAndSize:=XL.Range("C5").Value	
GuiControl, varbar:text, ShapeSize, %shapeSize%
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

PasteValues(input:=0) {
	global
	if (input:="Snip")
	{
		send, ^c
	excel.connect()
		sleep 200
		xl.Range("C66").Select
		; WinActivate, LMS Workbook.xlsm
		SendLevel, 1
		ControlSend,ahk_parent, {esc}{up 4}, LMS Workbook.xlsm
		Xl.ActiveSheet.Paste
		sleep 300
		sendlevel, 0
		return
	}
	; If (Regexmatch(Clip(), "[DEGLHKJI]{1}\d{3}", ClipForProduct) > 0) 	
	; {
		; Product:=ClipforProduct
		; xl.ActiveWorkbook.Activesheet.Range("B7").value := Product
		; ControlSend, , {Enter}, ahk_class XLMAIN
	; }
			else 
			{
				send, ^c
				sleep 300
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



