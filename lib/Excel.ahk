#include <varbar>

Class Excel{
Connect(reload:=0){
	Global
	Gui VarBar:+LastFound
	envget, PrevProduct, PrevProduct
	; envget, iteration, Iteration
	Products:=[]
	Path:="C:\Users\mmignin\OneDrive - Vitaquest International\"
	if WinExist("LMS Workbook.xlsb")
		ControlSend,ahk_parent,{esc}, LMS Workbook.xlsb
	else {
		TT("no notebook open",500) 
				; VarBar.load()
				varbar.show()
				return
		}
	Try {
		XL := ComObjActive("Excel.Application")
		; XL.Workbooks.Open("C:\Users\mmignin\OneDrive - Vitaquest International\LMS Workbook.xlsb")
		XL.Visible := True
		ComObjConnect(XL,"Excel.")
		sht := XL.ActiveSheet.Name
		;btch:= XL.ActiveSheet.Range.("E1")
			Gui VarBar:+LastFound
		; if ((sht := "PriorMonths") || (sht:= "Sheet1") || (sht := "Main") || (sht := "Template") || (sht := "Finished") || (sht := "Micro Pending") || (sht := "Sheet2") || (sht := "Sheet1") || (sht := "Item Code") || (sht := "Scrap Sheet")) {
				
			; this.NextSheet()
		; }
	}
	Catch {
		TT("Didnt connect to workbook", 5000,,,1)
	}
	This.InfoLocations()
	;Pop(Product "`n" Batch " " Lot  " " Coated,Name " " Customer) 
												; /*  Get each sheet name and turn it into an array
											;	For sheet in xl.ActiveWorkbook.Worksheets
											;	{
											;		If (Sheet.name := "Main") || (Sheet.name := "Template") || (Sheet.name := "Finished") || (Sheet.name := "Micro Pending") || (Sheet.name := "PriorMonths")
											;			continue
											;		Products.insert(Sheet.Name)
											;	}
												; Products.remove(1)
												; Products.remove(1)
												; loop 10{
												; 	;; if (Products[A_index] = "Finished") || (Products[A_index] = "PriorMonths")
												; 		; Products.remove(A_Index)
												; 	; else
												; 		A__DDLXLProducts .= "|" Products[A_index]
												; } 
												; */

	Gui VarBar:+LastFound
	if (Reload = 1)
		VarBar.show()

	return


}
SheetActivate(XL) {
  global
  excel.Infolocations()
  excel.RegexCell()
  excel.matchColor()
  ;pop(Product " " Batch)
}


SheetChange(sht,Cell) {
	Global
	if (Cell.ActiveCell.Address = "$E$1" || Cell.ActiveCell.Address = "$B$3"){
		excel.Infolocations()
	POP(Cell.ActiveCell.value,Shipto)
	}
	else
		return
	; else
		; return
	; xcel.RegexCell()
	; POP(Cell.address)
	; ToolTip % "Active Cell changed to " cell.address[5,1]
	; POP(cell.ActiveSheet.Range("E1").Address)		; XL := Excel_Get()
		; row_1 := XL.ActiveCell.Row
		; col_1 := XL.ActiveCell.Column
		; add_1 := XL.ActiveCell.Address[0,0]
		
		; cell_address := XL.Cells(1, col_1).Address[0,0]
		; stringtrimright, col_1, cell_address, 1

		; cross_hairs := add_1 "," row_1 ":" row_1 "," col_1 ":" col_1  "," add_1
		; XL.Range(cross_hairs).Select
	}


; CopySheetName(){
; 	SheetName:= xl.ActiveWorkbook.Worksheets.name
; }
	RegexCell(vCell,n:=""){
		Global
      RegExMatch(vCell, "i)(?<!Ct#)\d{3}-\d{4}\b", Batch%n%)
      RegExMatch(vCell, "i)(\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b)", lot%n%)
      RegExMatch(vCell, "i)(coated: |/?ct#/s|Ct#|ct/s|coated/s)(?\d{3}-\d{4}\b", ctCoated)
      RegExMatch(ctCoated, "\d{3}-\d{4}", Coated%n%)
	}
InfoLocations(){
	global
	Batches:=[]
	GuiControl, -redraw, varbar
		clipboard:=XL.range("H1").Value
		Product:=XL.Range("B1").Value
		This.RegexCell(XL.Range("E1").Value)
		; while (Xl.Range("BE" . A_index+7).Value != "")
			; Batches[A_index]:=Xl.Range("BE" . A_index+7).Text
		Name:=XL.Range("B2").Value
		Customer:=XL.Range("B3").Value
		ShipTo:=XL.Range("C3").Value
		ShipToIndex:=
		ServingSize:=XL.Range("B4").Value
		ShapeAndSize:=XL.Range("B5").Value
		Color:=XL.Range("B6").value

	GuiControl, Varbar:Text, Product, %Product%
	GuiControl, Varbar:Text, lot, %lot%
	GuiControl, Varbar:Text, Batch, %Batch%
	GuiControl, Varbar:Text, Coated, %coated%
	; if Coated
	GuiControl, Varbar:Text, SampleID,
	GuiControl, Varbar:Text, name, %name%
	GuiControl, varbar:text, Color, %Color%
	GuiControl, Varbar:Text, customer, %Customer%
	; GuiControl, varbar:text, weight, %weight%
	GuiControl, Varbar:Text, iteration, %iteration%
	GuiControl, varbar:text, ShapeSize, %shapeSize%
	GuiControl, +redraw, varbar
	; this.SaveToDataBase()
	}

SearchWorkbook(SearchWord:=""){
	SendInput, ^{f}!{t}!{h}{right}{enter}!{s}{right}!{t}!{n}%searchWord%
	return
	}

SaveToDataBase(){
	global
;  iniread, full, data.ini, %Product%, ;ecc738
 Test_Specs:= strsplit(Full,"=")
 Test:=Test_Specs[1]
 Specs:= strsplit(Test_Specs[2],"|")
 msgbox % "test: " Test "`n`nLabelClaim: " Specs[1] "`nMinLimit: " Specs[2] "`nMaxLimit: " Specs[3] "`nUnits: " Specs[4] "`nPercision: " Specs[5] "`nDescription: " Specs[6] "`nMethod: " Specs[7] "`n" "`nTests: " Tests "`nTest_Specs[2]: " Test_Specs[2]

 LabelClaim[A_index] "|" MinLimit[A_index]"|" MaxLimit[A_index]"|" Units[A_index]"|" Percision[A_index] "|" Description[A_index] "|" Method[A_index]
	Return 
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
	XL.Sheets(NextSheetname).activate
	if (nextsheetname != "Sheet1" || nextsheetname != "Main" || nextsheetname != "Template" || nextsheetname != "Finished" || nextsheetname != "Micro Pending" || nextsheetname != "Sheet2" || nextsheetname != "Sheet1" || nextsheetname != "Item Code" || nextsheetname != "Scrap Sheet") {
		XL.Sheets(NextSheetname).activate
		;excel.connect()
	Excel.MatchColor()
	}
	; TT(Product "`t" Batch "`n" Name "`t" Customer, 2000,Varbar_x,Varbar_y+20,1,250,"R") 
	; TT(Product "`t" Batch "`t" Lot "`t" Coated "`n" Name "`t`t" Customer) 
	GuiControl, +redraw, varbar
	}

PrevSheet(){
	global
	Gui VarBar:+LastFound
	;GuiControl, -redraw, varbar
	PrevSheet:=xl.ActiveWorkbook.Activesheet.index -1
	PrevSheetName:=xl.activeworkbook.Worksheets(PrevSheet).name
	Xl.Sheets(PrevSheet).activate
	if (prevSheetName != "Sheet1" || prevSheetName != "Main" || prevSheetName != "Template" || prevSheetName != "Finished" || prevSheetName != "Micro Pending" || prevSheetName != "Sheet2" || prevSheetName != "Sheet1" || prevSheetName != "Item Code" || prevSheetName != "Scrap Sheet") {
		Xl.Sheets(PrevSheet).activate
		;excel.connect()
	Excel.MatchColor()
}
	; TT(Product "`t" Batch "`t" Lot "`t" Coated "`n" Name "`t`t " Customer) 
	; Excel.MatchColor()
	GuiControl, +redraw, varbar
	}

MatchColor(){
	Global
	TabColor:=XL.ActiveWorkbook.Activesheet.Tab.Color
	if 		(TabColor = 16777215) ;white
		Gui, VarBar:color,, F2F2F2 ; 
	else if	(TabColor = 16764057) || (TabColor = 13395456) ;Blue
		Gui, VarBar:color,, BDD7EE ; 
	else if 	(TabColor = 13434828) || (TabColor = 32768) || 	(TabColor = 65280) ;light green
		Gui, VarBar:color,, 339966 
	else if 	(TabColor = 10092543) ;yellow
		Gui, VarBar:color,, ffff00 
	else if 	(TabColor = 39423) || (TabColor = 26367)	;orange
		Gui, VarBar:color,, EE8036 
	else if 	(TabColor = 12632256) || (TabColor = 8421504) 	;greay
		Gui, VarBar:color,, 808080 
	else if 	(TabColor = 10498160) 	;purple
		Gui, VarBar:color,, 7030A0 
	else if 	(TabColor = 16777215) 	;light purple
		Gui, VarBar:color,, 9966FF 
	else if 	(TabColor = 0) 	;black
		Gui, VarBar:color,, 323130 
	else
			Gui, VarBar:color, 808000 ;pink
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
	SendInput, ^f!t!h{right}{enter}!s{right}!t!n
	BlockInput, off
	sleep 200
	return
	}


}



