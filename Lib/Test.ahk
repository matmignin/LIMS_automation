F14 & Mbutton::Test2()

Test(){
	Global
	
	
}
Test2(){
	Global
	Sendinput, %  Varbar_get(Product)
}






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



Test_Varbar()
{
	global
	;DebugWindow("Varbar_x : " Locations1 "`nVarbar_Y:" Locations2,0,1,10,0,0)
	;Batchlist := "Batch|"
	;Loop, % Batch.MaxIndex()
	;BatchList .= "|" Batch[A_Index]
	;Gui, Add, DropDownList, vBatch x24 y110 w90, %BatchList%
}




DebugWindow(Text,Clear:=0,LineBreak:=1,Sleep:=10,AutoHide:=0,MsgBox:=0){
	x:=ComObjActive("{DBD5A90A-A85C-11E4-B0C7-43449580656B}"),x.DebugWindow(Text,Clear,LineBreak,Sleep,AutoHide,MsgBox)
}