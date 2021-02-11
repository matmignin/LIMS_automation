

return
#ifwinactive,
Numpad0 & \::Sendinput, mmignin{tab}Kilgore7744
+!^F2::^Lbutton
enter::enter
#IfWinActive, ahk_exe firefox.exe
Capslock::return
#ifwinactive, ahk_exe OUTLOOK.EXE
Capslock::return

#ifwinactive, ahk_exe explorer.exe








ONENOTE:
#IfWinActive ,ahk_exe ONENOTE.EXE
Lwin & x::
lalt & x::send, ^4
lalt & Space::send, ^1
Lwin & z::
lalt & z::send,^2
Lwin & c::
lalt & c::SendInput, {U+02713}
Mbutton::^tab
lalt::return
;F13 & Lbutton::sendinput, ^!h
Rbutton::Rbutton









EXCEL: 
#IfWinActive, ahk_exe EXCEL.EXE
Enter::numpadenter
;F13 & WheelLeft::Set_ProductCode()
;F13 & WheelRight::Set_Batch()
;F13 & WheelUp::wheelcut()
;F13 & WheelDown::wheelpaste()
Mbutton::^tab
Mbutton & Wheelright::^tab
Mbutton & Wheelleft::+^tab
F14::ExcelSearch()
#ifwinactive, Find and Replace,
enter::Send,!i





Remote_Desktop:
#IfWinActive, Remote Desktop Connection,
f15::
Menu, RemoteDesktopMenu, Add, Citrix-Test, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, LMS-Test, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, NuGen-Test, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, SDMS-Test, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, PRDCitrix1, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, PRDCitrix2, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, PRDCitrix3, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, LMS-PRD, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, NuGenesis, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, SDMS, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, PRD-EMPCitrix, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Add, Empower, RemoteDesktopHandler
Menu, RemoteDesktopMenu, Show,
return

VRemoteDesktopHandler:
If (A_thismenuItem contains  Citrix-Test) 
{	
	Click 182, 97
	sendinput, 10.1.2.153
return
}
Else if (A_thismenuItem contains  LMS-Test) 
{	
	Click 182, 97
	sendinput, 10.1.2.152
return
}
Else if (A_thismenuItem contains  NuGen-Test) 
{	
	Click 182, 97
	sendinput, 10.1.2.150
return
}
Else if (A_thismenuItem contains  SDMS-Test) 
{	
	Click 182, 97
	sendinput, 10.1.2.149
return
}
Else if (A_thismenuItem contains  PRDCitrix1) 
{	
	Click 182, 97
	sendinput, 10.1.2.134
return
}
Else if (A_thismenuItem contains  PRDCitrix2) 
{	
	Click 182, 97
	sendinput, 10.1.2.226
return
}
Else if (A_thismenuItem contains  PRDCitrix3) 
{	
	Click 182, 97
	sendinput, 10.1.2.227
return
}
Else if (A_thismenuItem contains  LMS-PRD) 
{	
	Click 182, 97
	sendinput, 10.1.2.138
return
}
Else if (A_thismenuItem contains  NuGenesis) 
{	
	Click 182, 97
	sendinput, 10.1.2.164
return
}
Else if (A_thismenuItem contains  SDMS) 
{	
	Click 182, 97
	sendinput, 10.1.2.142
return
}
Else if (A_thismenuItem contains  PRD-EMPCitrix) 
{	
	Click 182, 97
	sendinput, 10.1.2.242
return
}
Else if (A_thismenuItem contains  Empower) 
{	
	Click 182, 97
	sendinput, 10.1.2.228
return
}









EDITOR:
#IfWinActive, ahk_exe AHK-Studio.exe

F15 & WheelDown::
F15 & Wheelup::
f15 & lbutton::SaveRestart()
Rbutton::
suspend, On
sleep 30
send, {Rbutton}
sleep 500
suspend, Off
return
Media_Prev::+^F1
F1::+^F1 ;search Help
PrintScreen & Space::sendinput, !m
Numpad0::Send, %mousePosition% 
PrintScreen::Send, %WindowTitle%
F15 & wheelright::Send, %WindowTitle%
F15 & Wheelleft::Send, %mousePosition%
^space::
F14::sendinput, +^f
Mbutton::^!o
;F13 & Wheelright::WinMenuSelectItem, ahk_class AutoHotkeyGUI ahk_exe AHK-Studio.exe, ,4&, 2&
;F13 & Wheelleft::WinMenuSelectItem, ahk_class AutoHotkeyGUI ahk_exe AHK-Studio.exe, ,4&, 3&

+enter::SaveRestart() 
#ifwinactive,
f11::SaveRestart()
Media_Next::ShowMouseLocation()
F12::ShowMouseLocation()
Media_Play_Pause::SaveRestart()

enter & \::SaveRestart() 
F10::Exitapp 
