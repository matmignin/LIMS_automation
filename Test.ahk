Test(n=0)
{
	Global
	if (n=0) 
	{	
		listvars
	}
	else if (n=1)
	{
		test_Excelsheets()
		
	}
	else if (n=2)
	{
		loop % Products.MaxIndex()
		{
			Worksheet:=Products[A_index]
			menu, Menu, Add, %worksheet%, Worksheet_menu
		}
					Menu, Menu, Show,
	}
	else if (n=3)
	{
		
	}
	else
	{
		sendinput, %n%
	}
	return
}


debug(text,var)
{
global
Text:=Text ": "
Debugwindow(Text var, 0,1,10,0,0)
}

;DebugWindow(Text,Clear:=0,LineBreak:=0,Sleep:=0,AutoHide:=0,MsgBox:=0){
	;x:=ComObjActive("{DBD5A90A-A85C-11E4-B0C7-43449580656B}"),x.DebugWindow(Text,Clear,LineBreak,Sleep,AutoHide,MsgBox)
;}


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
			Temp:=Products[A_index]
		iniwrite, %Temp%, data.ini, ExcelWorkSheets, %a_index%
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