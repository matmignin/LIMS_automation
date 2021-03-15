
#Ifwinactive, ahk_exe AHK-Studio.exe 
{
	Rbutton & F14::Test(2)
	Rbutton & F13::Test(1)

}
F14 & Mbutton::Test(2)
Test(n=0)
{
	Global
	if (n=0) 
	{	
		listvars
	}
	else if (n=1)
	{
		varbar_set("lot")
		;debugwindow("lot: " lot)
	}
	else if (n=2)
	{
		DebugWindow("lot: " Varbar_getlot())
	}
	else if (n=3)
	{
debugwindow("lot: " varbar_get("lot"))
		
	}
	else
	{
		tooltip("yolo")
	}
	return
}


/*
	Test_DebugLoop(msg)
	{
		Global
		DebugWindow(msg,0,1,10)
		Loop, Read, test.ini   ; This loop retrieves each line from the file, one at a time.
		{
			DebugWindow(A_Index . "=" . Batches[A_Index],0,1,10)
		}
	}
	test_Excelsheets()
	{
		Global
		try {
			XL:= ComObjActive("Excel.Application")
			;XL:=XLBook.Active
			Visible := True
		} Catch  {
			DebugWindow("no excel Box")
			return
		}	
		For sheet in xl.ActiveWorkbook.Worksheets { 
			Products.insert(Sheet.Name)
		}		
		Products.remove(1)
		Products.remove(1)
		Products.remove(1)
		loop 5 {
			if (Products[A_index] = "Finished")
				break
			else 	
				Temp:=Products[A_index]
			iniwrite, %Temp%, data.ini, Products, %a_index%
		}
		return
	}
*/
debug(text,var)
{
global
Text:=Text ": "
Debugwindow(Text var, 0,1,10,0,0)
}

DebugWindow(Text,Clear:=0,LineBreak:=0,Sleep:=0,AutoHide:=0,MsgBox:=0){
	x:=ComObjActive("{DBD5A90A-A85C-11E4-B0C7-43449580656B}"),x.DebugWindow(Text,Clear,LineBreak,Sleep,AutoHide,MsgBox)
}