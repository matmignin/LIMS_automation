
Menu() 
{
	Global
	try menu, menu, deleteAll


			menu, Menu, Add, Excel Sheets, Menu
				loop 10
				{
				Worksheet:=Products[A_index]
				menu, SubMenu, Add, %worksheet%, Worksheet_menu
				}
			menu, Menu, add, Excel Sheets, :SubMenu
		menu, Menu, Add, &Ingredient Table, menu
		menu, Menu, Add, &Spec Table, menu
		menu, menu, add,
		Menu, Menu, Add, &Product `t  %Product%, Menu
		Menu, Menu, Add, &Batch `t  %Batch%, Menu
		Menu, Menu, Add, &Lot `t  %Lot%, Menu
		Menu, Menu, Add, &Name `t  %name%, Menu


	If Winactive("Password ahk_class bosa_sdm_XL9") || Winactive("Login - \\Remote") {
				menu, menu, add,
		Menu, Menu, Add, Samples, Menu
		Menu, Menu, Add, Tests, Menu
		Menu, Menu, Add, Visual, Menu
		Menu, Menu, Add, VQ Login, Menu
		; Menu, Menu, Show,
	}		









	Else If Winactive("Edit sample template - \\Remote") || Winactive("Edit specification - \\Remote") || winactive("NuGenesis LMS - \\Remote")
	{
				menu, menu, add,
		;Excel_Connect()
		Menu, Menu, add, &Analytical, Menu
		Menu, Menu, add, &Physical, Menu
		Menu, Menu, add, &Micro, Menu
		Menu, Menu, add, &Retain, Menu		
		Menu, Menu, add, &Coated_Physical, Menu
		Menu, Menu, add, &Coated_Retain, Menu
		; Menu, Menu, Show,
	}









	Else If winactive("Results Definition - \\Remote")
	{
		Menu, Menu, Add, USP Heavy Metal,Menu
		Menu, Menu, Add, Canada Heavy Metal,Menu
		Menu, Menu, Add, Prop65 Heavy Metal,Menu
		Menu, Menu, Add, Report Only Heavy Metal,Menu



	}








	Else if WinActive("ahk_exe Code.exe") 
	{
	;	try menu, menu, deleteAll
		Menu, menu, Add, Mouse Location `t%MousePosition%, menu	
		Menu, menu, Add, Window Title `t%wintitle%, menu	
		Menu, menu, Add, Process `t%winProcess% , menu	
		Menu, menu, Add, Control `t%winControl%, menu	
		Menu, Menu, Add, Test &1, Menu
		Menu, Menu, Add, Test &2, Menu
		Menu, Menu, Add, Test &3, Menu
				menu, Menu, Add, Search Hotkeys, Menu
		Menu, hotkeyMenu, Add, F13, Menu
		Menu, hotkeyMenu, Add, F14, Menu
		Menu, hotkeyMenu, Add, F15, Menu
		Menu, hotkeyMenu, Add, F16, Menu
		Menu, hotkeyMenu, Add, F17, Menu
		Menu, hotkeyMenu, Add, F18, Menu
		Menu, hotkeyMenu, Add, Mbutton, Menu
		Menu, hotkeyMenu, Add, Rbutton, Menu
		Menu, hotkeyMenu, Add, Wheel, Menu
		menu, hotkeymenu, add, Exit, menu
				menu, Menu, add, Search Hotkeys, :HotkeyMenu

	}











	ELSE If WinActive("Remote Desktop Connection") 
	{
		Menu, Menu, Add, TEST_Citrix (for Testing LMS), Menu
		Menu, Menu, Add, PRD_Citrix_One, Menu
		Menu, Menu, Add, PRD_Citrix_Two, Menu
		Menu, Menu, Add, PRD_Citrix_Three, Menu
		menu, Menu, Add, Other Servers, Menu
			Menu, SubMenu, Add, TEST_LMS, Menu
			Menu, SubMenu, Add, TEST_NuGen, Menu
			Menu, SubMenu, Add, TEST_SDMS, Menu
			Menu, SubMenu, Add, LMS_PRD, Menu
			Menu, SubMenu, Add, NuGenesis, Menu`
			Menu, SubMenu, Add, SDMS, Menu
			Menu, SubMenu, Add, PRD_EMPCitrix, Menu
			Menu, SubMenu, Add, Empower, Menu
		menu, Menu, add, Other Servers, :SubMenu
		; Menu, Menu, Show,
	}
	;else
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



	else if A_thismenuitem contains &Ingredient Table
		ProductTab_Table()
	else if A_thismenuItem contains &Spec Table
		SpecTab_Table()
	


	else if A_thismenuitem contains &Analytical 
		if Winactive("NuGenesis LMS - \\Remote")
			WorkTab_NewRequest("Analytical")
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
			WorkTab_NewRequest("Micro")
		else
		SpecTab_Edit_Micro()
	else if A_thismenuitem contains &Physical
		if Winactive("NuGenesis LMS - \\Remote")
			WorkTab_NewRequest("physical")
		else
			SpecTab_Edit_Physical()		




	else if A_thismenuitem contains Test &1
		TRY Test(1)	
	else if A_thismenuitem contains Test &2
		Try Test(2)	
	else if A_thismenuitem contains Test &3
		Try Test(3)	
	else if (A_thismenuitem = "F13")
			Sendinput, ^fF13`:`:{enter}
				else if (A_thismenuitem = "F13")
			Sendinput, ^fF13`:`:{enter}
				else if (A_thismenuitem = "F14")
			Sendinput, ^fF14`:`:{enter}
				else if (A_thismenuitem = "F15")
			Sendinput, ^fF15`:`:{enter}
				else if (A_thismenuitem = "F16")
			Sendinput, ^fF16`:`:{enter}
				else if (A_thismenuitem = "F17")
			Sendinput, ^fF17`:`:{enter}
				else if (A_thismenuitem = "F18")
			Sendinput, ^fF18`:`:{enter}
				else if (A_thismenuitem = "Mbutton")
			Sendinput, ^fMbutton{enter}
			else if (A_thismenuitem = "Rbutton")
			Sendinput, ^fRbutton{enter}
			else if (A_thismenuitem = "Wheel")
			Sendinput, ^fWheel`:`:{enter}
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



	; if (A_ThisMenuItem = "Samples")
	; 	sendinput, care{enter}
	; else if (A_ThisMenuItem = "Tests")
	; 	Sendinput, lab{enter}
	; else if (A_ThisMenuItem = "Visual")
	; 	Sendinput, open{enter}
	; else if (A_ThisMenuItem = "VQ")
	; 	Sendinput, ?Kilgore7744{enter}


;menu
	else if A_thismenuItem contains &Product `t  %Product%,
		VarBar.send("Product")
	else if A_thismenuItem contains &Batch `t  %Batch%
		VarBar.send("Batch")
	else if A_thismenuItem contains &name `t  %name%
		VarBar.send("Name")
	else if A_thismenuItem contains &lot `t  %Lot%
		VarBar.send("Lot")
	else {
    menu, menu, deleteAll
	}
	;menu, menu, deleteAll
return
	
}



Worksheet_menu:
; Worksheet:= A_ThisMenuItem
	;	XL:= ComObjActive("Excel.Application")
	;	Visible := True
		XL:=XL.Sheets(A_ThisMenuItem).activate
		Excel_Connect()
				; XL.Visible := True	
		;menu, menu, DeleteAll
return