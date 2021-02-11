#ifwinactive, Windows Security
F15::Sendinput, Kilgore7744{enter}
#IfWinActive, Remote Desktop Connection,
F15::
Menu, RemoteDesktopMenu, Add, TEST_Citrix, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, TEST_LMS, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, TEST_NuGen, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, TEST_SDMS, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, PRD_Citrix_One, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, PRD_Citrix_Two, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, PRD_Citrix_Three, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, LMS_PRD, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, NuGenesis, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, SDMS, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, PRD_EMPCitrix, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, Empower, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Show,
return

RemoteDesktopHandler:
If (A_thisMenuItem = "TEST_Citrix") 
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
	return

#ifwinactive,