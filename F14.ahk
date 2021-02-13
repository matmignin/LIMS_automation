F14(){
global
	If Winactive("NuGenesis LMS - \\Remote")
	{
		MouseLocation_Go()
	}
	Else If Winactive("ahk_exe AHK-Studio.exe")
	{
		sendinput, +^f
	}
	Else If Winexist("Password ahk_class bosa_sdm_XL9") ;excel log password prompt
	{
		winactivate, Password ahk_class bosa_sdm_XL9
		sendinput, lab{enter 2}
	}
	Else If Winactive("ahk_exe EXCEL.EXE")
	{
		ExcelSearch()
	}
	Else If Winexist("Result Entry - \\Remote")
	{
		winactivate,
		Click("OK_ResultEntry")
	}
	
	
	
	
	else
		MouseLocation_Go()
	Return
	
}

