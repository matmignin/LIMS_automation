
Menu(){
	Global
	try menu, menu, deleteAll
			default()
		If Winactive("Password ahk_class bosa_sdm_XL9") || Winactive("Login - \\Remote") 
			passwords()
		Else If Winactive("Edit sample template - \\Remote") || Winactive("Edit specification - \\Remote") || winactive("NuGenesis LMS - \\Remote")
			autofill()
		Else If winactive("Results Definition - \\Remote")
			Heavy_meatals()
		Else if WinActive("ahk_exe Code.exe")
			VScode()
		ELSE If WinActive("Remote Desktop Connection") 
			remote_desktop()
		Menu, Menu, Show,
	return
}






default(){
	global
			menu, Menu, Add, WorkSheets, Sheets
				loop 10 {
					Worksheet:=Products[A_index]
					if worksheet != Finished
						menu, Work_Sheets, Add, %worksheet%, Sheets
				}
			menu, Menu, add, WorkSheets, :Work_sheets

		menu, Menu, Add, &Ingredient Table, Tables
		menu, Menu, Add, &Spec Table, Tables
		menu, menu, add,
		Menu, Menu, Add, &Product `t  %Product%, Variables
		Menu, Menu, Add, &Batch `t  %Batch%, Variables
		Menu, Menu, Add, &Lot `t  %Lot%, Variables
		Menu, Menu, Add, &Name `t  %name%, Variables

Variables:
	if A_thismenuItem contains &Product `t  %Product%,
		VarBar.send("Product")
	else if A_thismenuItem contains &Batch `t  %Batch%
		VarBar.send("Batch")
	else if A_thismenuItem contains &name `t  %name%
		VarBar.send("Name")
	else if A_thismenuItem contains &lot `t  %Lot%
		VarBar.send("Lot")
	else 
   try menu, menu, deleteAll
	;menu, menu, deleteAll
return

Tables:
	if A_thismenuitem contains &Ingredient Table
		ProductTab_Table()
	else if A_thismenuItem contains &Spec Table
		SpecTab_Table()
			else 
    menu, menu, deleteAll
	Return

Sheets:
		XL:=XL.Sheets(A_ThisMenuItem).activate
		Excel.Connect()
		;menu, menu, DeleteAll
return


}






passwords() {
	menu, menu, add,
		menu, menu, add,
		Menu, Menu, Add, Samples, Passwords
		Menu, Menu, Add, Tests, Passwords
		Menu, Menu, Add, Visual, Passwords
		Menu, Menu, Add, VQ Login, Passwords
		; Menu, Menu, Show,

Passwords:
	if (A_ThisMenuItem = "Samples")
		sendinput, care{enter}
	else if (A_ThisMenuItem = "Tests")
		Sendinput, lab{enter}
	else if (A_ThisMenuItem = "Visual")
		Sendinput, open{enter}
	else if (A_ThisMenuItem = "VQ Login")
		Sendinput, ?Kilgore7744{enter}
	else 
    menu, menu, deleteAll
		return

	}		

Heavy_meatals(){
	Global
		Menu, Menu, Add, USP Heavy Metal,Heavy_metals
		Menu, Menu, Add, Canada Heavy Metal,Heavy_metals
		Menu, Menu, Add, Prop65 Heavy Metal,Heavy_metals
		Menu, Menu, Add, Report Only Heavy Metal,Heavy_metals
Heavy_metals:
	if (A_ThisMenuItem = "USP Heavy Metal")
		SpecTab_HM_USP()
	else if (A_ThisMenuItem = "Canada Heavy Metal")
		SpecTab_HM_Canada()
	else if (A_ThisMenuItem = "Prop65 Heavy Metal")
		SpecTab_HM_Prop65()
	else if (A_ThisMenuItem = "Report Only Heavy Metal")
		SpecTab_HM_ReportOnly() 
	else 
    menu, menu, deleteAll
return
	}



	autofill(){
		Global
				menu, menu, add,
		;Excel.Connect()
		Menu, Menu, add, &Analytical, AutoFill
		Menu, Menu, add, &Physical, AutoFill
		Menu, Menu, add, &Micro, AutoFill
		Menu, Menu, add, &Retain, AutoFill		
		Menu, Menu, add, &Coated_Physical, AutoFill
		Menu, Menu, add, &Coated_Retain, AutoFill
		; Menu, Menu, Show,
Autofill:
	if A_thismenuitem contains &Analytical 
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
				else 
    menu, menu, deleteAll
	return
	}

	VScode(){
		Global
		menu, menu, add,
		try menu, menu, deleteAll
		Menu, menu, Add, Mouse Location, vscode
		Menu, menu, Add, Window Title, vscode
		Menu, menu, Add, Process, vscode
		Menu, menu, Add, Control, vscode
				menu, Menu, Add, Search Hotkeys, vscode
		Menu, hotkeyMenu, Add, F13, vscode
		Menu, hotkeyMenu, Add, F14, vscode
		Menu, hotkeyMenu, Add, F15, vscode
		Menu, hotkeyMenu, Add, F16, vscode
		Menu, hotkeyMenu, Add, F17, vscode
		Menu, hotkeyMenu, Add, F18, vscode
		Menu, hotkeyMenu, Add, Mbutton, vscode
		Menu, hotkeyMenu, Add, Rbutton, vscode
		Menu, hotkeyMenu, Add, Wheel, vscode
		menu, hotkeymenu, add, Exit, vscode
				menu, Menu, add, Search Hotkeys, :HotkeyMenu

VScode:
	if (A_thismenuitem = "F13")
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
	else if A_thismenuItem contains Mouse Location
		sendinput %MousePosition%
	else if A_thismenuItem contains Window Title
		Sendinput %WinTitle%
	else if A_thismenuItem contains Process
		sendinput ahk_exe %WinProcess%
	else if A_thismenuItem contains Control
		sendinput, %WinControl%
			else 
    menu, menu, deleteAll
return
	}

remote_desktop(){
		menu, menu, add,	
		Menu, Menu, Add, TEST_Citrix (for Testing LMS), Remote_desktop
		Menu, Menu, Add, PRD_Citrix_One, Remote_desktop
		Menu, Menu, Add, PRD_Citrix_Two, Remote_desktop
		Menu, Menu, Add, PRD_Citrix_Three, Remote_desktop
		menu, Menu, Add, Other Servers, Remote_desktop
			Menu, SubMenu, Add, TEST_LMS, Remote_desktop
			Menu, SubMenu, Add, TEST_NuGen, Remote_desktop
			Menu, SubMenu, Add, TEST_SDMS, Remote_desktop
			Menu, SubMenu, Add, LMS_PRD, Remote_desktop
			Menu, SubMenu, Add, NuGenesis, Remote_desktop`
			Menu, SubMenu, Add, SDMS, Remote_desktop
			Menu, SubMenu, Add, PRD_EMPCitrix, Remote_desktop
			Menu, SubMenu, Add, Empower, Remote_desktop
		menu, Menu, add, Other Servers, :SubMenu
		; Menu, Menu, Show,
Remote_Desktop:
	If (A_thisMenuItem = "TEST_Citrix (for Testing LMS)") 
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
			else 
    menu, menu, deleteAll
return
	}


	; if (A_ThisMenuItem = "Samples")
	; 	sendinput, care{enter}
	; else if (A_ThisMenuItem = "Tests")
	; 	Sendinput, lab{enter}
	; else if (A_ThisMenuItem = "Visual")
	; 	Sendinput, open{enter}
	; else if (A_ThisMenuItem = "VQ")
	; 	Sendinput, ?Kilgore7744{enter}



	




