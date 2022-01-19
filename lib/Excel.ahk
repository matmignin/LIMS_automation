#include <varbar>

Class Excel{
Connect(reload:=0){
	Global
		IF !winexist("Mats LMS Workbook.xlsb")
		Return
	; Gui VarBar:+LastFound
	Products:=[]
	Path:="C:\Users\mmignin\OneDrive - Vitaquest International\"
	if winExist("Mats LMS Workbook.xlsb") && ExcelConnect
		ControlSend,ahk_parent,{esc}, Mats LMS Workbook.xlsb
	else {
		TT("no notebook open",500)
				; VarBar.load()
				varbar.show()
				return
		}
	Try {
		XL := ComObjactive("Excel.Application")
		XL.Visible := True
		ComObjConnect(XL,"Excel.")
		sht := XL.activeSheet.Name
			; Gui VarBar:+LastFound
	}
	Catch
		TT("Didnt connect to workbook", 5000,,,1)
	This.InfoLocations()
	; Gui VarBar:+LastFound
	if (Reload = 1)
		VarBar.show()
	return
}

FindAndReplace(A_Find,A_Replace,A_Range,OffsetX:=0,OffsetY:=0){
	global
  XlWb:=ComObjactive("Excel.Application")
  CellToChange:=XlWb.activeSheet.Range(A_Range).Find(A_Find).offset(OffsetX,OffsetY)
	sleep 200
      CellToChange.value:=A_Replace
}



Sheetactivate(XL){
  global
  excel.InfoLocations()
  excel.RegexCell()
  excel.matchColor()
  ;pop(Product " " Batch)
}

GetAllSheets(){ ; Get each sheet name and turn it into an array
	global
	ProductSheets:=[]
	XL := ComObjactive("Excel.Application")
	For sheet in xl.activeWorkbook.Worksheets
		cSheet:=sheet.name
		; add something about getting sheets batches
	 AllWorkSheets:=listarray(ProductSheets,"")
	 Return AllWorkSheets
}

SheetChange(sht,Cell) {
	Global
	if (Cell.activeCell.Address = "$E$1") || (Cell.activeCell.Address = "$B$3") {
			excel.InfoLocations()
	Flovar(Cell.activeCell.value,1000)
	}
	else
		return
	; else
		; return
	; xcel.RegexCell()
	; POP(Cell.address)
	; ToolTip % "active Cell changed to " cell.address[5,1]
	; POP(cell.activeSheet.Range("E1").Address)		; XL := Excel_Get()
		; row_1 := XL.activeCell.Row
		; col_1 := XL.activeCell.Column
		; add_1 := XL.activeCell.Address[0,0]

		; cell_address := XL.Cells(1, col_1).Address[0,0]
		; stringtrimright, col_1, cell_address, 1

		; cross_hairs := add_1 "," row_1 ":" row_1 "," col_1 ":" col_1  "," add_1
		; XL.Range(cross_hairs).Select
	}


; CopySheetName(){
; 	SheetName:= xl.activeWorkbook.Worksheets.name
; }
	RegexCell(vCell,n:=""){
		Global
      RegExMatch(vCell, "i)(?<!Ct#)\d{3}-\d{4}\b", Batch%n%)
      RegExMatch(vCell, "i)(\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?)", lot%n%)
      ; RegExMatch(vCell, "i)(coated: |ct#\s|Ct#|ct\s|coated\s)(?\d{3}-\d{4}\b", ctCoated)
      RegExMatch(vCell, "i)(coated: |ct#\s|Ct#|ct\s|coated\s)(?P<oated>\d{3}-\d{4})", c)
      ; RegExMatch(ctCoated, "\d{3}-\d{4}", Coated%n%)
	}
InfoLocations(){
	global
		SheetName:=XL.activeSheet.Name
		; if !RegexMatch(SheetName,"i)[abdefghijkl]\d{3}\b")
			; return
	Batches:=[]
	GuiControl, -redraw, varbar
		Try Product:=XL.Range("B1").Value
		catch
			Return
		This.RegexCell(XL.Range("E1").Value)
		MoreBatches:=XL.range("H1").Value
		; Products:=[]
		loop, parse, MoreBatches, `r`n
		{
			RegExMatch(A_loopField, "i)(?<Batch>\d{3}-\d{4}).?(?<Lot>\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]? )?.?(Ct#)?(?<Coated>(\d{3}-\d{4})?)", s)
					if sBatch
						Batches.Insert(Product " " sBatch " " sLot " " sCoated)
		}
		;Clip.Parse(MoreBatches)
		 while (Xl.Range("BE" . A_index+7).Value != "")
			Batches[A_index]:=Xl.Range("BE" . A_index+7).Text
		Name:=XL.Range("B2").Value
		Customer:=XL.Range("B3").Value
		ShipTo:=XL.Range("C3").Value
		ShipToIndex:=
		ServingSizeType:=StrSplit(XL.Range("B4").Value, A_Space,"stick packet")
		if ServingSizeAndType.maxindex() < 2 {
			ServingSize:="1"
			ServingType:= ServingSizeType[1]
		}
		if ServingSizeAndType.maxindex() > 2 {
			ServingSize:=ServingSizeType[1]
			ServingType:= ServingSizeType[2] " " ServingSizeType[3]
		}
		else {
			ServingSize:=ServingSizeType[1]
			ServingType:= ServingSizeType[2]
		}
		; ServingSize:=XL.Range("C4").Value
		ShapeAndSize:=XL.Range("B5").Value
		Color:=XL.Range("B6").value

	GuiControl, Varbar:Text, Product, %Product%
	GuiControl, Varbar:Text, lot, %lot%
	GuiControl, Varbar:Text, Batch, %Batch%
	GuiControl, Varbar:Text, Coated, %coated%
	CodeString:=Trim(Product " " Batch " " Lot " " Coated)
	ControlsetText, Edit5,%CodeString%, VarBar
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
	Sendinput, ^{f}!{t}!{h}{right}{enter}!{s}{right}!{t}!{n}%searchWord%
	return
	}

SaveToDataBase(){
	global
;  iniread, full, Settings.ini, %Product%, ;ecc738
 Test_Specs:= strsplit(Full,"=")
 Test:=Test_Specs[1]
 Specs:= strsplit(Test_Specs[2],"|")
 msgbox % "test: " Test "`n`nLabelClaim: " Specs[1] "`nMinLimit: " Specs[2] "`nMaxLimit: " Specs[3] "`nUnits: " Specs[4] "`nPercision: " Specs[5] "`nDescription: " Specs[6] "`nMethod: " Specs[7] "`n" "`nTests: " Tests "`nTest_Specs[2]: " Test_Specs[2]

 LabelClaim[A_index] "|" MinLimit[A_index]"|" MaxLimit[A_index]"|" Units[A_index]"|" Percision[A_index] "|" Description[A_index] "|" Method[A_index]
	Return
	}

activeCell(){
	Global
	activeCell := Xl.activeCell.value
	activeCell := Trim((activeCell, "`r`n"))
	return activeCell
	}

NextSheet(){
	global
	Gui VarBar:+LastFound
	;GuiControl, -redraw, varbar
	NextSheet:=xl.activeWorkbook.activesheet.index +1
	NextSheetName:=xl.activeworkbook.Worksheets(NextSheet).name
	XL.Sheets(NextSheetname).activate
	if (nextsheetname != "Sheet1" || nextsheetname != "Main" || nextsheetname != "Template" || nextsheetname != "Finished" || nextsheetname != "Micro Pending" || nextsheetname != "Sheet2" || nextsheetname != "Vitamin A" || nextsheetname != "Sheet1" || nextsheetname != "Item Code" || nextsheetname != "Scrap Sheet") {
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
	PrevSheet:=xl.activeWorkbook.activesheet.index -1
	PrevSheetName:=xl.activeworkbook.Worksheets(PrevSheet).name
	Xl.Sheets(PrevSheet).activate
	if (prevSheetName != "Sheet1" || prevSheetName != "Main" || prevSheetName != "Template" || prevSheetName != "Finished" || prevSheetName != "Micro Pending" || prevSheetName != "Sheet2" || Prevsheetname != "Vitamin A" || prevSheetName != "Sheet1" || prevSheetName != "Item Code" || prevSheetName != "Scrap Sheet") {
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
	TabColor:=XL.activeWorkbook.activesheet.Tab.Color
	if (A_mode=="TempCode")
		GUI, VarBar:color,272822, FFFFFF
	else if  (TabColor = 16777215) ;white
		GUI, VarBar:color,, F2F2F2 ;
	else if	(TabColor = 16764057) || (TabColor = 13395456) ;Blue
		GUI, VarBar:color,, BDD7EE ;
	else if 	(TabColor = 13434828) || (TabColor = 32768) || 	(TabColor = 65280) ;light green
		GUI, VarBar:color,, 339966
	else if 	(TabColor = 10092543) ;yellow
		GUI, VarBar:color,, ffff00
	else if 	(TabColor = 39423) || (TabColor = 26367)	;orange
		GUI, VarBar:color,, EE8036
	else if 	(TabColor = 12632256) || (TabColor = 8421504) 	;greay
		GUI, VarBar:color,, 808080
	else if 	(TabColor = 10498160) 	;purple
		GUI, VarBar:color,, 7030A0
	else if 	(TabColor = 16777215) 	;light purple
		GUI, VarBar:color,, 9966FF
	else if 	(TabColor = 0) 	;black
		GUI, VarBar:color,, 323130
	else If (Mode=="Debugging")
		GUI, VarBar:color,, 808000 ;pink
	else
		GUI, VarBar:color,DC734F, 97BA7F
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
	Sendinput, ^f!t!h{right}{enter}!s{right}!t!n
	BlockInput, off
	sleep 200
	return
	}


}



