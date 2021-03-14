

F15()
{
	global
	If winactive("Test Definition Editor - \\Remote ")
		Sendinput, {Click}^a
	else 
		Menu()
	return
}


#IfWinActive, 
	
F15 & WheelRIGHT:: 
{
	If Winactive("ahk_exe AHK-Studio.exe"){
		sendinput, {home}{tab}
	} Else If winactive("NuGenesis LMS - \\Remote"){
		sendinput, {click, 743, 41}
	} ELSE 
return
	return
}

F15 & WheelLEFT:: 
{
	If Winactive("ahk_exe AHK-Studio.exe"){
		sendinput, {home}+{tab}
	} Else If winactive("NuGenesis LMS - \\Remote"){
		sendinput, {Click 354, 44}
		sendinput, {home}+{tab}
	} ELSE 
		return
	Return
}

F15 & WheelDOWN:: 
{
	If Winactive("ahk_exe AHK-Studio.exe"){
		send, +^{down}
	} Else If winactive("NuGenesis LMS - \\Remote"){
		Sendinput, {Click 46, 855}
	} ELSE 
		return
	Return
}

F15 & wheelUP:: 
{
	If Winactive("ahk_exe AHK-Studio.exe"){
		send, +^{up}
	} Else If winactive("NuGenesis LMS - \\Remote"){
		sendinput, {click, 544, 41}
	} ELSE 
		return
	Return
}

F15 & Rbutton:: 
{
	If Winactive("ahk_exe AHK-Studio.exe"){
		
	} ELSE 
		Mouse_Closewindow()
	return
	Return
}

F15 & Lbutton:: 
{
	If Winactive("ahk_exe AHK-Studio.exe"){
		
	} ELSE 
		sendinput, ^{Lbutton}
	return
}

F15 & Mbutton:: 
{
	If Winactive("ahk_exe AHK-Studio.exe"){
		
		
		
	} ELSE 
		VarBar_Relocate()
	return
		Return
}

F15 & F14:: 
{
	If Winactive("ahk_exe AHK-Studio.exe"){
		
		sendinput, #{tab}
		
	} ELSE 
		sendinput, #{tab}
	
	return		
}
;_________________________________________________________________________
;_________________________________________________________________________F15	
#IfWinActive

F15::F15()
