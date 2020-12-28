

GetExcelData(){      ;gather excel data
	Global
	IfWinExist, Mats Workbook - Excel
		XL := ComObjActive("Excel.Application").Sheets("Ingredients")
	else
		{
		Path := "C:\Users\mmignin\OneDrive - Vitaquest International\Mats Workbook.xlsm"
		XL := ComObjCreate("Excel.Application")
		XL.Visible := False
		XL_Workbook := XL.Workbooks.Open(Path)
		XL_WorkSheet := XL_Workbook.Worksheets(1)
		}
	;XL.Visible := 1
	Name:=[]
	LabelClaim:=[]
	MinLimit:=[]
	MaxLimit:=[]
	Units:=[]
	Percision:=[]
	Position:=[]
	LabelName:=[]
	Description:=[]
	while (Xl.Range("N" . A_Index).Value != "") {
		Position[A_index]:=Xl.Range("M" . A_Index+1).Text
		Name[A_index]:=Xl.Range("N" . A_Index + 1).text
		LabelClaim[A_index]:=Xl.Range("O" . A_Index+1).Text
		MinLimit[A_index]:=Xl.Range("P" . A_Index+1).Text
		MaxLimit[A_index]:=Xl.Range("Q" . A_Index+1).Text
		Units[A_index]:=Xl.Range("R" . A_Index+1).Text
		Percision[A_index]:=Xl.Range("S" . A_Index+1).Text

		LabelName[A_index]:=Xl.Range("T" . A_Index+1).Text
		Description[A_index]:=Xl.Range("U" . A_Index+1).Text
		Total_rows:=A_index -1
		Table_Height:=A_index
		}
	  CreateGUITable()
	  ;Gui, Show
	Return
 }