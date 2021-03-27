Test(n:=0) {
	Global
Excel.connect()
; currentsheet:=xl.ActiveWorkbook.Activesheet.index +1
XL.Sheets(xl.ActiveWorkbook.Activesheet.index +1).activate
;msgbox, %currentSheet%
return

}


test_Excelsheets()
{
	Global
	Products:=[]
	;	Path:="C:\Users\mmignin\OneDrive - Vitaquest International\"
		XL:= ComObjActive("Excel.Application")
		Visible := True
		;XL:=XL.Active

	For sheet in xl.ActiveWorkbook.Worksheets { 
		Products.insert(Sheet.Name)
	}		
	Products.remove(1)
	Products.remove(1)
	loop 12 {
		if (Products[A_index] = "Finished")
			break
		else 	
			DDLProducts .= "|" Products[A_Index]
	}
	return
}






