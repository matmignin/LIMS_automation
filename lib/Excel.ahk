



#include <varbar>
#include <mouse>


Class Excel{

Connect(reload:=0){
	Global
	Gui VarBar:+LastFound 
	envget, PrevProduct, PrevProduct
	; envget, iteration, Iteration
	Products:=[]
	Path:="C:\Users\mmignin\OneDrive - Vitaquest International\"
	if WinExist("LMS Workbook.xlsb")
		ControlSend,ahk_parent, {esc}, LMS Workbook.xlsb
	else {
		tooltip("no notebook open",500)
			; msgbox,4,,open LMS Workbook?
			; IfMsgBox, Yes
			; IfMsgBox,No
			; 	runwait, LMS Workbook.xlsb, %Path%
			; 	exit
		}
	Try {
		XL := ComObjActive("Excel.Application")
		XL.Workbooks.Open("C:\Users\mmignin\OneDrive - Vitaquest International\LMS Workbook.xlsb")
		XL.Visible := True	
		sht := XL.ActiveSheet.Name
	if (sht = "Sheet1" || sht = "Main" || sht = "Template" || sht = "Finished" || sht = "Micro Pending" || sht = "Sheet2" || sht = "Sheet1" || sht = "Item Code")
			xl.sheets(PrevProduct).select
			; tooltip("[ " Product " ] `t" Batch "`t" lot)
	}
	Catch {
		Tooltip("no excel workbook open", 1000)
		return
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
	{
		GuiControl, Varbar:Text, Product, %Product%
		EnvSet, PrevProduct, %Product%	
	}
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
	ShipTo:=XL.Range("E3").Value	
		EnvSet, ShipTo, %ShipTo%
	GuiControl, Varbar:Text, iteration, %iteration%
		ShapeAndSize:=XL.Range("B5").Value	
GuiControl, varbar:text, ShapeSize, %shapeSize%
		Color:=XL.Range("B5").value	
GuiControl, varbar:text, Color, %Color%
	weight:=XL.Range("B6").Text	
GuiControl, varbar:text, weight, %weight%
	GuiControl, +redraw, varbar
	if (Reload = 1)
		VarBar.show()
		; excel.MatchColor()
	return
}

SearchWorkbook(SearchWord:=""){
	send, ^f!t!h{right}{enter}!s{right}!t!n%searchWord%
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
			XL.Sheets(3).activate
	XL.Sheets(NextSheetname).activate
	Excel.MatchColor()
	excel.connect()
	;GuiControl, +redraw, varbar
}

PreviousSheet(){
	global
	; Gui VarBar:+LastFound 
	;GuiControl, -redraw, varbar
	PreviousSheet:=xl.ActiveWorkbook.Activesheet.index -1
	if (PreviousSheet < 3) 
		exit
	Xl.Sheets(PreviousSheet).activate
	Excel.MatchColor()
	excel.connect()
	; Excel.MatchColor()
	; varbar.Update()
	;GuiControl, +redraw, varbar
	}

MatchColor(){
	Global
		TabColor:=XL.ActiveWorkbook.Activesheet.Tab.Color
		if (TabColor = 16764057) 
 			Gui, VarBar:color, 8ea9db; blue
		else if (TabColor = 65280) 	
			Gui, VarBar:color, 21a366 ;green
		else if (TabColor = 10092543) ;yellow	
			Gui, VarBar:color, ffff00 ;Yellow
		else if (TabColor = 26367) 	;orange
			Gui, VarBar:color, ff9966 ;orange
		else if (TabColor = 12632256) 	;greay
			Gui, VarBar:color, 808080 ;Gray
		if (TabColor = 0) 	;black
			Gui, VarBar:color, 808080 ;Gray
		else
			Gui, VarBar:color, ffffff ;White
}
Get_Current_row(){
	Global
	LV_GetText(Position, Current_row,1)	
	LV_GetText(Name, Current_row,2)
	LV_GetText(LabelClaim, Current_row,3)
	LV_GetText(LabelName, Current_row,4)
	LV_GetText(DropdownCount, Current_row,5)
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
		WinActivate, LMS Workbook.xlsb
		; SendLevel, 1
		send, ^v

		sleep 300
		; sendlevel, 0
		return
	}
		; If (Regexmatch(Clip(), "[DEGLHKJI]{1}\d{3}", ClipForProduct) > 0) 	
	; {
		; Product:=ClipforProduct
		; xl.ActiveWorkbook.Activesheet.Range("B7").value := Product
		; ControlSend, , {Enter}, ahk_class XLMAIN
	; }
	If (input = "xl")
			{
				send, ^c
				sleep 300
				Xl.CutCopyMode := False
	if WinActive("ahk_exe OUTLOOK.EXE") 
     xl.Run("'LMS Workbook.xlsb'!PasteRotation")
	else if WinActive("ahk_exe explorer.exe") 
		{
			xl.Range("B8").select
    	xl.Run("'LMS Workbook.xlsb'!PasteIngredients")
		}
		return
		}

	}
}



