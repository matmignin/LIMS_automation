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
			DDLProducts .= "|" Products[A_Index]
	}
	return
}






