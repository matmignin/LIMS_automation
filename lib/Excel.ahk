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
		sht := XL.ActiveSheet.Name
			Gui VarBar:+LastFound
		if (sht = "PriorMonths" || sht= "Sheet1" || sht = "Main" || sht = "Template" || sht = "Finished" || sht = "Micro Pending" || sht = "Sheet2" || sht = "Sheet1" || sht = "Item Code" || sht = "Scrap Sheet")
			; TT("MenuSheet")
			return
			; xl.sheets(PrevProduct).select
			; Gui, VarBar:color, 000000
			; return
		
			; Excel.PrevSheet()
	}
	Catch {
		; Excel.PrevSheet()
		TT("Didnt connect to workbook", 500,,,1)
		; excel.connect()
		; return
	}
	This.InfoLocations()
	Pop(Product "`n" Batch " " Lot  " " Coated,Name " " Customer) 
												/*  Get each sheet name and turn it into an array
												For sheet in xl.ActiveWorkbook.Worksheets
													Products.insert(Sheet.Name)
												Products.remove(1)
												Products.remove(1)
												loop 3{
													if (Products[A_index] = "Finished")
														break
													else
														DDLProducts .= "|" Products[A_index]
												} 
												*/

	Gui VarBar:+LastFound
	if (Reload = 1)
		VarBar.show()
		excel.MatchColor()
	return
	}
	RegexCell(vCell,n:=""){
		Global
		; RegExMatch(vCell, "i)\b[abdefghijkl]\d{3}\b", Product)
      RegExMatch(vCell, "i)(?<!Ct#)\d{3}-\d{4}\b", Batch%n%)
      RegExMatch(vCell, "i)(\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b)", lot%n%)
      RegExMatch(vCell, "i)(coated: |/?ct#/s|Ct#|ct/s|coated/s)\d{3}-\d{4}\b", ctCoated)
      RegExMatch(ctCoated,   "\d{3}-\d{4}", Coated%n%)
	}
InfoLocations(){
	global
	GuiControl, -redraw, varbar
		; Product:=XL.Range("B7").Value
		; This.RegexCell(XL.Range("B4").Value)
		; ; Batch:=XL.Range("C4").Value
		; ; Lot:=XL.Range("E4").Value
		; ; Coated:=xl.range("F4").value
		; Name:=XL.Range("B2").Value
		; Customer:=XL.Range("B3").Value
		; ShipTo:=XL.Range("A3").Value
		; ; weight:=XL.Range("B6").Text
		; ShapeAndSize:=XL.Range("B5").Value
		; Color:=XL.Range("B6").value
		Product:=XL.Range("B1").Value
		This.RegexCell(XL.Range("E1").Value)
		; This.RegexCell(XL.Range("E2").Value,2)
		Name:=XL.Range("B2").Value
		Customer:=XL.Range("B3").Value
		ShipTo:=XL.Range("C3").Value
		ServingSize:=XL.Range("B4").Value
		ShapeAndSize:=XL.Range("B5").Value
		Color:=XL.Range("B6").value

	GuiControl, Varbar:Text, lot, %lot%
	GuiControl, Varbar:Text, Product, %Product%
	GuiControl, Varbar:Text, Batch, %Batch%
	; if Coated
	GuiControl, Varbar:Text, Coated, %coated%
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
	if (nextsheetname != "Sheet1" || nextsheetname != "Main" || nextsheetname != "Template" || nextsheetname != "Finished" || nextsheetname != "Micro Pending" || nextsheetname != "Sheet2" || nextsheetname != "Sheet1" || nextsheetname != "Item Code" || nextsheetname != "Scrap Sheet")
		XL.Sheets(NextSheetname).activate
		excel.connect()
	Excel.MatchColor()
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
	if (prevSheetName != "Sheet1" || prevSheetName != "Main" || prevSheetName != "Template" || prevSheetName != "Finished" || prevSheetName != "Micro Pending" || prevSheetName != "Sheet2" || prevSheetName != "Sheet1" || prevSheetName != "Item Code" || prevSheetName != "Scrap Sheet")
		Xl.Sheets(PrevSheet).activate
		excel.connect()
	; TT(Product "`t" Batch "`t" Lot "`t" Coated "`n" Name "`t`t " Customer) 
	; Excel.MatchColor()
	Excel.MatchColor()
	GuiControl, +redraw, varbar
	}

MatchColor(){
	Global
	TabColor:=XL.ActiveWorkbook.Activesheet.Tab.Color
	if 		(TabColor = 16777215) ;white
		Gui, VarBar:color, F2F2F2 ; 
	else if	(TabColor = 16764057) ;Blue
		Gui, VarBar:color, 8ea9db ; 
	else if 	(TabColor = 13434828) ;light green
		Gui, VarBar:color, A9D08E ; 
	else if 	(TabColor = 65280) ;green
		Gui, VarBar:color, 21a366 
	else if 	(TabColor = 10092543) ;yellow
		Gui, VarBar:color, ffff00 
	else if 	(TabColor = 26367) 	;orange
		Gui, VarBar:color, fF8966 
	else if 	(TabColor = 12632256) 	;greay
		Gui, VarBar:color, 808080 
	else if 	(TabColor = 10498160) 	;purple
		Gui, VarBar:color, 7030A0 
	else if 	(TabColor = 16777215) 	;light purple
		Gui, VarBar:color, 9966FF 
	else if 	(TabColor = 0) 	;black
		Gui, VarBar:color, 000000 
	else
			Gui, VarBar:color, FF9999 ;pink
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



