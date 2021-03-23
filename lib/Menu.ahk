
Menu() 
{
	Global
	try 
		menu, menu, deleteAll
	If Winactive("Password ahk_class bosa_sdm_XL9") || Winactive("Login - \\Remote") {
		Menu, Menu, Add, Samples, Menu
		Menu, Menu, Add, Tests, Menu
		Menu, Menu, Add, Visual, Menu
		Menu, Menu, Add, VQ Login, Menu
		;Menu, Menu, Show,
	}		
	Else If Winactive("Edit sample template - \\Remote") || Winactive("Edit specification - \\Remote") || winactive("NuGenesis LMS - \\Remote")
	{
		Excel_Connect()
		Menu, Menu, add, &Analytical, Menu
		Menu, Menu, add, &Physical, Menu
		Menu, Menu, add, &Micro, Menu
		Menu, Menu, add, &Retain, Menu		
		Menu, Menu, add, &Coated_Physical, Menu
		Menu, Menu, add, &Coated_Retain, Menu
		;Menu, Menu, Show,
	}
	Else If winactive("Results Definition - \\Remote")
	{
		Menu, Menu, Add, USP Heavy Metal,Menu
		Menu, Menu, Add, Canada Heavy Metal,Menu
		Menu, Menu, Add, Prop65 Heavy Metal,Menu
		Menu, Menu, Add, Report Only Heavy Metal,Menu
	}
	Else if WinActive("ahk_exe AHK-Studio.exe") || WinActive("ahk_exe Code.exe") 
	{
		Menu, menu, Add, Mouse Location `t%MousePosition%, menu	
		Menu, menu, Add, Window Title `t%wintitle%, menu	
		Menu, menu, Add, Process `t%winProcess% , menu	
		Menu, menu, Add, Control `t%789221364003winControl%, menu	
		; Menu, Menu, Add,
	}
	ELSE If WinActive("Remote Desktop Connection") 
	{
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
		;Menu, Menu, Show,
	}
	else
	{
		menu, Menu, Add, &Ingredient Table, menu
		menu, Menu, Add, &Spec Table, menu
		
		Menu, Menu, Add, &Product `t  %Product%, Menu
		Menu, Menu, Add, &Batch `t  %Batch%, Menu
		Menu, Menu, Add, &Lot `t  %Lot%, Menu
		Menu, Menu, Add, &Name `t  %name%, Menu
		menu, menu, add
		Menu, Menu, Add, Test &1, Menu
		Menu, Menu, Add, Test &2, Menu
		Menu, Menu, Add, Test &3, Menu
		/*
			Menu, Menu, Add, QuickSelect, Menu
			Menu, SubMenu, Add, Enter Results, Menu
			Menu, Menu, Add, QuickSelect, :SubMenu
		*/
	}
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
	else if A_thismenuitem contains &Ingredient Table
		ProductTab_Table()
	else if A_thismenuItem contains &Spec Table
		SpecTab_Table()
	
	
	
	
	else if A_thismenuitem contains &Analytical 
		if Winactive("NuGenesis LMS - \\Remote")
			SampleTab_NewRequest("Analytical")
	else 
		SpecTab_Edit_Analytical()
	else if A_thismenuitem contains &Coated_Retain
		SpecTab_Edit_CoatedRetain()
	else if A_thismenuitem contains &Coated_Physical
		SpecTab_Edit_CoatedPhysical()
	else if A_thismenuitem contains &Retain
		SpecTab_Edit_Retain()
	else if A_thismenuitem contains &Micro
		if Winactive("NuGenesis LMS - \\Remote")		
			SampleTab_NewRequest("Micro")
	else
		SpecTab_Edit_Micro()
	else if A_thismenuitem contains &Physical
	{
		if Winactive("NuGenesis LMS - \\Remote")
			SampleTab_NewRequest("physical")
		else
			SpecTab_Edit_Physical()		
	}
	else if A_thismenuitem contains Test &1
		TRY Test(1)	
	else if A_thismenuitem contains Test &2
		Try Test(2)	
	else if A_thismenuitem contains Test &3
		Try Test(3)	
	else if A_thismenuItem contains Mouse Location `t%MousePosition%
		sendinput %MousePosition%
	else if A_thismenuItem contains Window Title `t%wintitle%
		Sendinput %WinTitle%
	else if A_thismenuItem contains Process `t%winProcess% 
		sendinput ahk_exe %WinProcess%
	else if A_thismenuItem contains Control `t%winControl%
		sendinput, %WinControl%
	else If (A_thisMenuItem = "TEST_Citrix (for Testing LMS)") 
		sendinput, {Click 182, 97}10.1.2.153
	Else if (A_thisMenuItem = "TEST_LMS") 
		sendinput, {Click 182, 97}10.1.2.152
	Else if (A_thisMenuItem = "TEST_NuGen")
		sendinput, {Click 182, 97}10.1.2.150
	Else if (A_thisMenuItem = "TEST_SDMS") 
		sendinput, {Click 182, 97}10.1.2.149
	Else if (A_thisMenuItem = "PRD_Citrix_One") 
		sendinput, {Click 182, 97}10.1.2.134
	Else if (A_thisMenuItem = "PRD_Citrix_Two") 
		sendinput, {Click 182, 97}10.1.2.226
	Else if (A_thisMenuItem = "PRD_Citrix_Three") 
		sendinput, {Click 182, 97}10.1.2.227
	Else if (A_thisMenuItem = "LMS_PRD") 
		sendinput, {Click 182, 97}10.1.2.138
	Else if (A_thisMenuItem = "NuGenesis") 
		sendinput, {Click 182, 97}10.1.2.164
	Else if (A_thisMenuItem = "SDMS") 
		sendinput, {Click 182, 97}10.1.2.142
	Else if (A_thisMenuItem = "PRD_EMPCitrix") 
		sendinput, {Click 182, 97}10.1.2.242
	Else if (A_thisMenuItem = "Empower") 
		sendinput, {Click 182, 97}10.1.2.228
	if (A_ThisMenuItem = "Samples")
		sendinput, care{enter}
	else if (A_ThisMenuItem = "Tests")
		Sendinput, lab{enter}
	else if (A_ThisMenuItem = "Visual")
		Sendinput, open{enter}
	else if (A_ThisMenuItem = "VQ")
		Sendinput, ?Kilgore7744{enter}
	else if A_thismenuItem contains &Product
		Sendinput, % Varbar_get("Product")
	else if A_thismenuItem contains &Batch 
		Sendinput, % Varbar_get("Batch")
	else if A_thismenuItem contains &name
		Sendinput, % Varbar_get("name")
	else if A_thismenuItem contains &lot
		Sendinput, % Varbar_get("lot")
	else
		menu, menu, deleteAll
	return
	
}
SampleTab_NewRequest(department)
{
	click, 64, 286 ;click Assign To New rewuest link
	winwaitactive, Edit request - \\Remote
	sleep 200
	click 238, 622 ;pick test
	winwaitactive, Select tests for request
	sleep 400
	click, right, 264, 590 ; click to show filer
	sleep 100
	send, {up}{enter}
	sleep 200
	click, 97, 125 ; click filter
	send, %Department%{enter}
	sleep 100
	click 152, 195
	send ^a
	click 504, 338 ; click arrow
	sleep 400
	click, right, 264, 590 ; click to clear filter
	sleep 100
	send, {up}{enter}
	;sleep 2000
	;click 854, 657  ; click okay
	winwaitclose, Select tests for request,,10
	if !Errorlevel
		sleep 400
	click 338, 619 ; click okay
	return
	
}