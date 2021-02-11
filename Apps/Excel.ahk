#IfWinActive, Mats Workbook.xlsm - Excel

Rbutton & Lbutton::set_ExcelProductCode()

#ifwinactive, Find and Replace,
rbutton & Lbutton::sendinput, !i
enter::Sendinput, !i


#IfWinActive, ahk_exe EXCEL.EXE
Enter::numpadenter
Rbutton & Mbutton::
Excel_set_ProductCode_Cell()
click("SearchBar_ProductCode")
return
mbutton::Excel_set_ProductCode_Cell()

F14::ExcelSearch()
Return
F13 & WheelLeft::Set_ProductCode()
F13 & WheelRight::
Sendinput, {F2}^a
sleep 200
Set_Batch()
return


