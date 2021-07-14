



#include <varbar>
#include <mouse>


Class Excel{

InfoLocations(){
	global
	GuiControl, -redraw, varbar
	Product:=XL.Range("B7").Value
	Batch:=XL.Range("C4").Value
	Lot:=XL.Range("E4").Value
	Coated:=xl.range("F4").value
	Name:=XL.Range("B2").Value
	Customer:=XL.Range("B3").Value
	ShipTo:=XL.Range("A3").Value
	weight:=XL.Range("B6").Text
	ShapeAndSize:=XL.Range("B5").Value
	Color:=XL.Range("B5").value
	GuiControl, Varbar:Text, lot, %lot%
	GuiControl, Varbar:Text, Product, %Product%
	GuiControl, Varbar:Text, Batch, %Batch%
	;EnvSet, ShipTo, %ShipTo%
	if Coated
		GuiControl, Varbar:Text, Coated, %coated%
	GuiControl, Varbar:Text, SampleID,
	GuiControl, Varbar:Text, name, %name%
	GuiControl, varbar:text, Color, %Color%
	GuiControl, Varbar:Text, customer, %Customer%
	GuiControl, varbar:text, weight, %weight%
	GuiControl, Varbar:Text, iteration, %iteration%
	GuiControl, varbar:text, ShapeSize, %shapeSize%
	EnvSet, PrevProduct, %Product%
	GuiControl, +redraw, varbar
}

Connect(reload:=0){
	Global
	Gui VarBar:+LastFound
	envget, PrevProduct, PrevProduct
	; envget, iteration, Iteration
	Products:=[]
	Path:="C:\Users\mmignin\OneDrive - Vitaquest International\"
	if WinExist("LMS Workbook.xlsb")
		ControlSend,ahk_parent,{esc}, LMS Workbook.xlsb
	else{
		TT("no notebook open",500,0,0,1)
				; VarBar.load()
				varbar.show()
				return
		}
	Try{
		XL := ComObjActive("Excel.Application")
		XL.Workbooks.Open("C:\Users\mmignin\OneDrive - Vitaquest International\LMS Workbook.xlsb")
		XL.Visible := True
		sht := XL.ActiveSheet.Name
	if (sht = "Sheet1" || sht = "Main" || sht = "Template" || sht = "Finished" || sht = "Micro Pending" || sht = "Sheet2" || sht = "Sheet1" || sht = "Item Code" || sht = "Scrap Sheet")
			xl.sheets(PrevProduct).select
			; Excel.PrevSheet()
	}
	Catch{
		; Excel.PrevSheet()
		TT("Didnt connect to workbook", 500,0,0,1)
		; excel.connect()
		; return
	}
												; For sheet in xl.ActiveWorkbook.Worksheets
												; 	Products.insert(Sheet.Name)
												; Products.remove(1)
												; Products.remove(1)
												; loop 3{
												; 	if (Products[A_index] = "Finished")
												; 		break
												; 	else
												; 		DDLProducts .= "|" Products[A_index]
												; }
	excel.InfoLocations()
	Gui VarBar:+LastFound
	if (Reload = 1)
		VarBar.show()
		; excel.MatchColor()
	return
}

SearchWorkbook(SearchWord:=""){
	send, ^{f}!{t}!{h}{right}{enter}!{s}{right}!{t}!{n}%searchWord%
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
			XL.Sheets(NextSheetname).activate
			; XL.Sheets(3).activate
	XL.Sheets(NextSheetname).activate
	Excel.MatchColor()
	excel.connect()
	;GuiControl, +redraw, varbar
}

PrevSheet(){
	global
	; Gui VarBar:+LastFound
	;GuiControl, -redraw, varbar
	PrevSheet:=xl.ActiveWorkbook.Activesheet.index -1
	PrevSheetName:=xl.activeworkbook.Worksheets(PrevSheet).name
	if (PrevSheetName = "Main")
		Xl.Sheets(PrevSheet).activate
		; exit
	Xl.Sheets(PrevSheet).activate
	Excel.MatchColor()
	excel.connect()
	; Excel.MatchColor()
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
			Gui, VarBar:color, fF8966 ;orange
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


}



