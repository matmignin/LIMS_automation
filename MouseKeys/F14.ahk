F14(){
global
	If Winactive("NuGenesis LMS - \\Remote"){
		MouseLocation_Go()
	} Else If Winactive("ahk_exe AHK-Studio.exe") {
		sendinput, +^f
	} Else If Winexist("Password ahk_class bosa_sdm_XL9") || Winexist("Login - \\Remote") {
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
		else if (A_ThisMenuItem = "VQ")
			Sendinput, ?Kilgore7744{enter}
		else	
			return
		menu, passwordmenu, deleteAll
	} Else If Winactive("ahk_exe EXCEL.EXE") {
		Excel_Search()
	} Else If Winexist("Result Entry - \\Remote"){
		winactivate,
		Click("OK_ResultEntry")
	} Else If Winexist("Delete Test - \\Remote ") {
		winactivate,
		Sendinput, {enter}
	} Else If Winexist("Select Iterations - \\Remote") {
		winactivate,
		Rotation_GetTable()
	} Else If Winexist("Release:") {
		winactivate,
		sendinput, {tab}{enter}
			sleep 200
		ifwinactive, Sections Exceeding - \\Remote
			send, {enter}
		return
	} Else If Winexist("Opened Section found - \\Remote") {
			winactivate,
			Sendinput, {enter}
			sleep 400
	} Else If Winexist("Sign :") {
		winactivate,
		sendinput, {tab 2}{right 2}{tab 2}mmignin{tab}Kilgore7744{enter}
	} Else If winactive("Edit test (Field Configuration: F`, Micro) - \\Remote"){
		sendinput, {click 305, 294}{end}(on sample log){click 330, 617}
	} Else If winactive("Edit test (Field Configuration: I`, Analytical) - \\Remote"){
		sendinput, {click 305, 294}{end}(on sample log){click 330, 617}
	} Else If winactive("Edit test (Field Configuration: I`, Physical) - \\Remote"){
		sendinput, {click 305, 294}{end}(on sample log){click 330, 617}
	} Else If winactive("Register new samples - \\Remote ") {
			Sendinput, {tab 2}{space}
			winwaitactive, Error - \\Remote, , 4
			sendinput, {enter}
			RegisterNewSample()
			return
	} Else If winactive("Select Product - \\Remote") {
		excel_ConnectTo()
		sendinput, {click 106, 64}%ProductCode%{enter}{enter}
		return
	}


		
		else
			MouseLocation_Go()
		Return
		
	}

/*
	_up::
	If Winactive("ahk_exe AHK-Studio.exe ") {
		Sendinput, 
		
		} ELSE 
			Retur
	}
	_down::
	If Winactive("ahk_exe AHK-Studio.exe ") {
		sendinput, 
		
		} ELSE 
			Retur
	}
	_left::
	If Winactive("ahk_exe AHK-Studio.exe ") {
		sendinput,
		
		} ELSE 
		Retur
	}
	_right::
	If Winactive("ahk_exe AHK-Studio.exe ") {
		sendinput, 
		
		} ELSE 
			Retur
	}
*/
;_________________________________________________________________________
;____	___return__________________________________________________________________F14

	F14 & WheelRight:: 
If Winactive("ahk_exe AHK-Studio.exe"){



	} ELSE 
		Sendinput, #{right}
	return

F14 & WheelLeft:: 
If Winactive("ahk_exe AHK-Studio.exe"){



	} ELSE 
		Sendinput, #{left}
	return

F14 & Wheeldown:: 
If Winactive("ahk_exe AHK-Studio.exe"){



	} ELSE 
		Wheel_ZoomOut()
	return

F14 & wheelup:: 
If Winactive("ahk_exe AHK-Studio.exe"){



	} ELSE 
		Wheel_ZoomIn()
	return

F14 & Rbutton:: 
If Winactive("ahk_exe AHK-Studio.exe"){



	} ELSE 
		CloseWindow()
	return

F14 & Lbutton:: 
If Winactive("ahk_exe AHK-Studio.exe"){



	} ELSE 
		sendinput, #{down}
	return

;F14::MouseLocation_Go() 
If Winactive("ahk_exe AHK-Studio.exe"){



	} ELSE 
	return
	
F14 & F15:: 
If Winactive("ahk_exe AHK-Studio.exe"){



	} ELSE 
		sendinput, !{tab}
	
return		