Test(n:=0) {
	Global
	clip:= Clip()
	BatchClip:=clip()
	sleep 100
	Regexmatch(BatchClip, "\b\d{3}-\d{4}\b", Batchclip) 
	ProductClip:=Clip()
	sleep 100
	Regexmatch(ProductClip, "\b[EGLHKJI]{1}\d{3}\b", Productclip) 
sleep 100
msgbox, %productclip% : %Batchclip%


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
		;	Temp:=Products[A_index]
			DDLProducts .= "|" Products[A_Index]
		;iniwrite, %Temp%, data.ini, ExcelWorkSheets, %a_index%
	}
	return
}



Worksheet_menu:
; Worksheet:= A_ThisMenuItem
		XL:= ComObjActive("Excel.Application")
		Visible := True
		XL:=XL.Sheets(A_ThisMenuItem).activate
				; XL.Visible := True	
		;menu, menu, DeleteAll
return


