#include <varbar>

Class Excel2SmartDoc{
Connect(reload:=0){
	Global
	Gui VarBar:+LastFound
	envget, PrevProduct, PrevProduct
	; envget, iteration, Iteration
	Wb:="Reagents.xlsx"
	Products:=[]
	Path:="C:\Users\mmignin\OneDrive - Vitaquest International\"
	if WinExist(Wb)
		ControlSend,ahk_parent,{esc}, %Wb%
	else {
		TT("no notebook open",500) 
				; VarBar.load()
				varbar.show()
				return
		}
	Try {
		XL := ComObjActive("Excel.Application")
		XL.Visible := True
		sht := XL.ActiveSheet.B
			Gui VarBar:+LastFound
	}
	Catch {
		TT("Didnt connect to workbook", 500,,,1)
	}
	This.InfoLocations()
	Gui VarBar:+LastFound
	if (Reload = 1)
		VarBar.show()
	return
	}
InfoLocations(){
	global
	GuiControl, -redraw, varbar
	Product:=XL.Range("B7").Value
	Batch:=XL.Range("C4").Value
	Lot:=XL.Range("E4").Value
	Coated:=xl.range("F4").value
	B:=XL.Range("B2").Value
	Customer:=XL.Range("B3").Value
	ShipTo:=XL.Range("A3").Value
	; weight:=XL.Range("B6").Text
	ShapeAndSize:=XL.Range("B5").Value
	Color:=XL.Range("B6").value
	GuiControl, Varbar:Text, lot, %lot%
	GuiControl, Varbar:Text, Product, %Product%
	GuiControl, Varbar:Text, Batch, %Batch%
	; EnvSet, ShipTo, %ShipTo%
	GuiControl, Varbar:Text, Coated, %coated%
	GuiControl, Varbar:Text, SampleID,
	GuiControl, Varbar:Text, B, %B%
	GuiControl, varbar:text, Color, %Color%
	GuiControl, Varbar:Text, customer, %Customer%
	GuiControl, Varbar:Text, iteration, %iteration%
	GuiControl, varbar:text, ShapeSize, %shapeSize%
	EnvSet, PrevProduct, %Product%
	GuiControl, +redraw, varbar
	; this.SaveToDataBase()
	}


CreateTable(MaxRow,Header:=0){
  Global
  try GUI, Table:destroy
  CoordMode, mouse, Window
  ; CoordMode, , Screen
;   ifwinnotactive, ahk_exe WFICA32.EXE 
   ;  WinActivate, ahk_exe WFICA32.EXE
  WinGetPos, LMS_X, LMS_Y, LMS_w, LMS_h, A
  Table_height=10
  Table_X:= LMS_w+LMS_X-50
  Table_Y:= LMS_Y+100
  Excel.Connect()
  A:=	[]
  B:=	[]
  C:= []
  D:=	[]
  E:= []
  F:= []
  G:= []
;   Sub_Table_height:=0 ;for skpping blank rows or something
;   while (Xl.Range("M" . A_Index).Value != "") {    
	loop % MaxRow
    A[A_index]:=	Xl.Range("A" . A_Index+Header).Text
    B[A_index]:=	Xl.Range("B" . A_Index+Header).text
    C[A_index]:=	Xl.Range("C" . A_Index+Header).Text
    D[A_index]:=	Xl.Range("D" . A_Index+Header).Text
    E[A_index]:=	Xl.Range("E" . A_Index+Header).Text
    F[A_index]:=	Xl.Range("F" . A_Index+Header).Text
    G[A_index]:=	Xl.Range("G" . A_Index+Header).Text
    Total_rows:=		  	A_index +1
    Table_Height:=		 	A_index
   ;  if (Xl.Range("F" . A_Index).text = "") ;for skipping blank rows or somethign
      ; Sub_Table_Height:=Sub_Table_Height+1
  }
  Table_Height:=Table_height-Sub_table_Height
  Gui,Table:Default
  Gui,Table:+LastFound +ToolWindow +Owner +AlwaysOnTop ;-SysMenu
  GUI,Table:Font,s10 cBlack arial ;Consolas
  Gui,Table:Add,ListView,x0 y0 r%Table_height% W400 Grid NoSortHdr -hdr checked gTable, A|B|C|D|E|F|G
  loop,%Total_Rows% {
    if A[A_index] =""
    {
      Total_rows:=total_rows - 1
      continue
    }
    else
      LV_Insert(A_index,"",A[A_index],B[A_index],C[A_index],D[A_index],E[A_index],F[A_index],G[A_index])
  }
  Gui,Table:Add,Checkbox,vAutoEnter x20,Auto-Enter Results?
;   LV_ModifyCol(1,50)
;   LV_ModifyCol(2,180)
;   LV_ModifyCol(3,100)
;   LV_ModifyCol(4,0)
;   LV_ModifyCol(5,0)
  sleep 100
  CoordMode,mouse,screen
  ScreenEdge_X:=A_ScreenWidth-350
  ScreenEdge_Y:=A_Screenheight-150
  try Gui,Table:Show,x%Table_X% y%Table_Y% w320,%Product% Table
  catch Gui,Table:Show,x%ScreenEdge_X% y%ScreenEdge_Y% w380, %Product% Table
  CoordMode,mouse,window
  return
}





SaveToDataBase(){
	global
;  iniread, full, data.ini, %Product%, ;ecc738
 Test_Specs:= strsplit(Full,"=")
 Test:=Test_Specs[1]
 Specs:= strsplit(Test_Specs[2],"|")
 msgbox % "test: " Test "`n`nC: " Specs[1] "`nMinLimit: " Specs[2] "`nMaxLimit: " Specs[3] "`nUnits: " Specs[4] "`nPercision: " Specs[5] "`nDescription: " Specs[6] "`nMethod: " Specs[7] "`n" "`nTests: " Tests "`nTest_Specs[2]: " Test_Specs[2]

 C[A_index] "|" MinLimit[A_index]"|" MaxLimit[A_index]"|" Units[A_index]"|" Percision[A_index] "|" Description[A_index] "|" Method[A_index]
	Return 
	}

ActiveCell(){
	Global
	ActiveCell := Xl.ActiveCell.value
	ActiveCell := Trim((ActiveCell, "`r`n"))
	return ActiveCell
	}






Get_Current_row(){
	Global
	LV_GetText(A, Current_row,1)
	LV_GetText(B, Current_row,2)
	LV_GetText(C, Current_row,3)
	LV_GetText(D, Current_row,4)
	LV_GetText(E, Current_row,5)
	LV_GetText(F, Current_row,6)
	LV_GetText(G, Current_row,7)
	;LV_Modify(Current_row, "Check")
	sleep 100
	return
	}



}



