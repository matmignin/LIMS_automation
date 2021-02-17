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

		Menu, PasswordMenu, Add, Sample to QC, PasswordMenuHandler
		Menu, PasswordMenu, Add, SAMPLE LOG, PasswordMenuHandler
		Menu, PasswordMenu, Add, Visual, PasswordMenuHandler
		Menu, PasswordMenu, Add, VQ, PasswordMenuHandler
		Menu, PasswordMenu, Show,return
		
		PasswordMenuHandler:
		if (A_ThisMenuItem = "Sample to QC")
			sendinput, care{enter}
		else if (A_ThisMenuItem = "SAMPLE LOG")
			Sendinput, lab{enter}
		else if (A_ThisMenuItem = "Visual")
			Sendinput, open{enter}
		else if (A_ThisMenuItem = "Visual")
			Sendinput, ?Kilgore7744{enter}
		else	
			return
		menu, passwordmenu, deleteAll
		return	
			
	
	
		;winactivate, Password ahk_class bosa_sdm_XL9
		;sendinput, lab{enter 2}
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
	Else If Winexist("Delete Test - \\Remote ")
	{
		winactivate,
		Sendinput, {enter}
	}
	Else If Winexist("Select Iterations - \\Remote")
	{
		winactivate,
		Rotation_GetTable()
	}
Else If Winexist("Release:")
{
	winactivate,
	sendinput, {tab}{enter}
		sleep 200
	ifwinactive, Sections Exceeding - \\Remote
		send, {enter}
	return
}
Else If Winexist("Opened Section found - \\Remote")
{
		winactivate,
		Sendinput, {enter}
		sleep 400
}
Else If Winexist("Sign :")
{
	winactivate,
	sendinput, {tab 2}{right 2}{tab 2}mmignin{tab}Kilgore7744{enter}
}
Else If winactive("Edit test (Field Configuration: F`, Micro) - \\Remote")
	sendinput, {click 305, 294}{end}(on sample log){click 330, 617}
Else If winactive("Edit test (Field Configuration: I`, Analytical) - \\Remote")
	sendinput, {click 305, 294}{end}(on sample log){click 330, 617}
Else If winactive("Edit test (Field Configuration: I`, Physical) - \\Remote")
	sendinput, {click 305, 294}{end}(on sample log){click 330, 617}

Else If winactive("Register new samples - \\Remote ")
{
		Sendinput, {tab 2}{space}
		winwaitactive, Error - \\Remote, , 4
		sendinput, {enter}
		RegisterNewSample()
		return
}
Else If winactive("Select Product - \\Remote")
{
	excel_ConnectTo()
	sendinput, {click 106, 64}%ProductCode%{enter}{enter}
	return
}


	
	else
		MouseLocation_Go()
	Return
	
}
