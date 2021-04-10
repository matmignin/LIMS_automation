Test(n:=0) {
	Global
	; Rotation_GetTable()
	Rotation_table()
return
}
;Sendinput,{click 150,73}{tab}{right 204}


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

Click_OK(){
	if winactive("Results Definition - \\Remote")
		click 1336,592
	else if winactive("Result Editor - \\Remote")
		click 370,660
		sleep 200
		return
}



/* 
WinActivate, NuGenesis LMS - \\Remote ahk_class Transparent Windows Client
 Click, 60, 521,	
WinwaitActive, Results Definition - \\Remote ahk_class Transparent Windows Client
click 78,63
WinwaitActive, Result Editor - \\Remote ahk_class Transparent Windows Client
click 32, 410 ;use limits for test
Click_ok()
WinwaitActive, Results Definition - \\Remote ahk_class Transparent Windows Client
click_ok()
; sendinput, {esc}
return
 */