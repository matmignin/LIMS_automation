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
	Varbar.Update("Iteration")
	if (Reload = 1)
		VarBar.show()
	return
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
	varbar.Update()
	Gui, VarBar:color, 21a366 ;green
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
	varbar.Update()
	Gui, VarBar:color, 21a366 ;green
	;GuiControl, +redraw, varbar
}


Get_Current_row()
{
	Global
	LV_GetText(Position, Current_row,1)	
	LV_GetText(Name, Current_row,2)
	LV_GetText(LabelClaim, Current_row,3)
	LV_GetText(LabelName, Current_row,4)
	LV_Modify(Current_row, "Check")
	sleep 100
}
Search()
{
	BlockInput, on
	sendinput, ^f!t!h{right}{enter}!s{right}!t!n
	BlockInput, off
	sleep 200
}
}