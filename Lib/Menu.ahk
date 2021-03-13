SetWorkingDir "C:\Users\mmignin\OneDrive - Vitaquest International\VQuest"
Menu() 
{
	Global
	try 
		menu, menu, deleteAll
	If Winexist("Password ahk_class bosa_sdm_XL9") || Winexist("Login - \\Remote") {
		Menu, Menu, Add, Samples, Menu
		Menu, Menu, Add, Tests, Menu
		Menu, Menu, Add, Visual, Menu
		Menu, Menu, Add, VQ Login, Menu
		Menu, Menu, Show,
	}		
	Else If Winactive("Edit sample template - \\Remote") || Winactive("Edit specification - \\Remote")
	{
		Excel_Connect()
		Menu, Menu, add, &Analytical, Menu
		Menu, Menu, add, &Physical, Menu
		Menu, Menu, add, &Micro, Menu
		Menu, Menu, add, &Retain, Menu		
		Menu, Menu, add, &Coated_Physical, Menu
		Menu, Menu, add, &Coated_Retain, Menu
		Menu, Menu, Show,
	}
	Else If winactive("Results Definition - \\Remote")
	{
		Menu, Menu, Add, USP Heavy Metal,Menu
		Menu, Menu, Add, Canada Heavy Metal,Menu
		Menu, Menu, Add, Prop65 Heavy Metal,Menu
		Menu, Menu, Add, Report Only Heavy Metal,Menu
		Menu, Menu, Show,
	}
	Else if WinActive("ahk_exe AHK-Studio.exe") || WinActive("AHK-Studio")
	{
		Menu, menu, Add, Mouse Location `t%MousePosition%, menu	
		Menu, menu, Add, Window Title `t%wintitle%, menu	
		Menu, menu, Add, Process `t%winProcess% , menu	
		Menu, menu, Add, Control `t%winControl%, menu	
		Menu, Menu, Add,
	}
	ELSE If WinActive("Remote Desktop Connection") {
		Menu, Menu, Add, TEST_Citrix (for Testing LMS), Menu
		Menu, Menu, Add, PRD_Citrix_One, Menu
		Menu, Menu, Add, PRD_Citrix_Two, Menu
		Menu, Menu, Add, PRD_Citrix_Three, Menu
		Menu, Menu, Add,
		menu, Menu, Add, Other Servers, Menu
		Menu, SubMenu, Add, TEST_LMS, Menu
		Menu, SubMenu, Add, TEST_NuGen, Menu
		Menu, SubMenu, Add, TEST_SDMS, Menu
		Menu, SubMenu, Add, LMS_PRD, Menu
		Menu, SubMenu, Add, NuGenesis, Menu
		Menu, SubMenu, Add, SDMS, Menu
		Menu, SubMenu, Add, PRD_EMPCitrix, Menu
		Menu, SubMenu, Add, Empower, Menu
		menu, Menu, add, Other Servers, :SubMenu
		Menu, Menu, Show,
	}
	else
		;menu, menu, icon, &Product Code`t%Product%, lib\Product.png,,0 
	;menu, menu, Add, Table&s`t%Product%, menu      ; submenu v
	menu, Menu, Add, &Product Table, menu
	menu, Menu, Add, &Spec Table, menu
	;menu, menu, add, Table&s`t%Product%, :Submenu   ; submenu ^
	
	;Menu, Menu, Add, &Name `t %Name%, Menu
	;Menu, Menu, Add, &Customer `t %Customer%, Menu
	menu, menu, add
	Menu, Menu, Add, Test &1, Menu
	Menu, Menu, Add, Test &2, Menu
	/*
		Menu, Menu, Add, QuickSelect, Menu
		Menu, SubMenu, Add, Enter Results, Menu
		Menu, Menu, Add, QuickSelect, :SubMenu
	*/
	Menu, Menu, Show,
	return
	
	Menu:
	if (A_ThisMenuItem = "Samples")
		sendinput, care{enter}
	else if (A_ThisMenuItem = "Tests")
		Sendinput, lab{enter}
	else if (A_ThisMenuItem = "Visual")
		Sendinput, open{enter}
	else if (A_ThisMenuItem = "VQ Login")
		Sendinput, ?Kilgore7744{enter}
	else if (A_ThisMenuItem = "USP Heavy Metal")
		SpecTab_HM_USP()
	else if (A_ThisMenuItem = "Canada Heavy Metal")
		SpecTab_HM_Canada()
	else if (A_ThisMenuItem = "Prop65 Heavy Metal")
		SpecTab_HM_Prop65()
	else if (A_ThisMenuItem = "Report Only Heavy Metal")
		SpecTab_HM_ReportOnly() 
	else if A_thismenuitem contains &Product Table
		ProductTab_Table()
	else if A_thismenuItem contains &Spec Table
		SpecTab_Table()
	else if A_thismenuitem contains &Analytical 
		SpecTab_Edit_Analytical()
	else if A_thismenuitem contains &Coated_Retain
		SpecTab_Edit_CoatedRetain()
	else if A_thismenuitem contains &Coated_Physical
		SpecTab_Edit_CoatedPhysical()
	else if A_thismenuitem contains &Retain
		SpecTab_Edit_Retain()
	else if A_thismenuitem contains &Micro
		SpecTab_Edit_Micro()
	else if A_thismenuitem contains &Physical
		SpecTab_Edit_Physical()		
	else if A_thismenuitem contains Test &1
		TRY Test_1()	
	else if A_thismenuitem contains Test &2
		Try Test_2()	
	else if A_thismenuItem contains Mouse Location `t%MousePosition%
		sendinput %MousePosition%
	else if A_thismenuItem contains Window Title `t%wintitle%
		Sendinput %WinTitle%
	else if A_thismenuItem contains Process `t%winProcess% 
		sendinput ahk_exe %WinProcess%
	else if A_thismenuItem contains Control `t%winControl%
		sendinput, %WinControl%
	If (A_thisMenuItem = "TEST_Citrix (for Testing LMS)") 
	{	
		Click 182, 97
		sendinput, 10.1.2.153
		return
	}
	Else if (A_thisMenuItem = "TEST_LMS") 
	{	
		Click 182, 97
		sendinput, 10.1.2.152
		return
	}
	Else if (A_thisMenuItem = "TEST_NuGen") 
	{	
		Click 182, 97
		sendinput, 10.1.2.150
		return
	}
	Else if (A_thisMenuItem = "TEST_SDMS") 
	{	
		Click 182, 97
		sendinput, 10.1.2.149
		return
	}
	Else if (A_thisMenuItem = "PRD_Citrix_One") 
	{	
		Click 182, 97
		sendinput, 10.1.2.134
		return
	}
	Else if (A_thisMenuItem = "PRD_Citrix_Two") 
	{	
		Click 182, 97
		sendinput, 10.1.2.226
		return
	}
	Else if (A_thisMenuItem = "PRD_Citrix_Three") 
	{	
		Click 182, 97
		sendinput, 10.1.2.227
		return
	}
	Else if (A_thisMenuItem = "LMS_PRD") 
	{	
		Click 182, 97
		sendinput, 10.1.2.138
		return
	}
	Else if (A_thisMenuItem = "NuGenesis") 
	{	
		Click 182, 97
		sendinput, 10.1.2.164
		return
	}
	Else if (A_thisMenuItem = "SDMS") 
	{	
		Click 182, 97
		sendinput, 10.1.2.142
		return
	}
	Else if (A_thisMenuItem = "PRD_EMPCitrix") 
	{	
		Click 182, 97
		sendinput, 10.1.2.242
		return
	}
	Else if (A_thisMenuItem = "Empower") 
	{	
		Click 182, 97
		sendinput, 10.1.2.228
		return
	}
	else
		menu, menu, deleteAll
	return
	
}
