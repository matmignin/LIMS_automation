F14()
{
	global
	
	If Winactive("NuGenesis LMS - \\Remote"){
		click, 79, 440
	} Else If Winactive("ahk_exe AHK-Studio.exe") {
		sendinput, +^f

	} Else If Winactive("ahk_exe EXCEL.EXE") {
		Excel_Search()
	} Else If Winactive("Results Definition - \\Remote") {
		Sendinput, ^{Lbutton}
	} Else If Winexist("Result Entry - \\Remote"){
		winactivate,
		Mouse_Click("OK_ResultEntry")
	} Else If Winexist("Delete Test - \\Remote ") {
		winactivate,
		Sendinput, {enter}
	} Else If Winexist("Select Iterations - \\Remote") {
		winactivate,
		Rotation_GetTable()

	} Else If winactive("Select Product - \\Remote") {
		excel_Connect()
		sendinput, {click 106, 64}%Product%{enter}{enter}
		return
		
	} Else If winactive("Edit specification - \\Remote"){
		ProductTab_EditProduct() 
		
	} else
		return
	Return
	
}


;_________________________________________________________________________
;____	___return__________________________________________________________________F14

F14 & WheelRight:: 
If Winactive("ahk_exe AHK-Studio.exe"){
	Sendinput, #{right}
} Else If winactive("NuGenesis LMS - \\Remote"){
	sendinput, {click, 743, 41}
} ELSE 
	Sendinput, #{right}
return


F14 & WheelLeft:: 
If Winactive("ahk_exe AHK-Studio.exe"){
	Sendinput, #{left}
} Else If winactive("NuGenesis LMS - \\Remote"){
	sendinput, {Click 354, 44}
	
} ELSE 
	Sendinput, #{left}
return


F14 & Wheeldown:: 
If Winactive("ahk_exe AHK-Studio.exe"){
	Mouse_WheelZoomOut()
} Else If winactive("NuGenesis LMS - \\Remote"){
	Sendinput, {Click 46, 855}
} ELSE 
	Mouse_WheelZoomOut()
return


F14 & wheelup:: 
If Winactive("ahk_exe AHK-Studio.exe"){
	Mouse_WheelZoomIn()
} Else If winactive("NuGenesis LMS - \\Remote"){
	sendinput, {click, 544, 41}
} ELSE 
	Mouse_WheelZoomIn()
return


F14 & Rbutton:: 
If Winactive("ahk_exe AHK-Studio.exe"){
 test_1()
} ELSE 
	;Mouse_Closewindow()
return


F14 & Lbutton:: 
If Winactive("ahk_exe AHK-Studio.exe"){
	sendinput, ^{Click}
	
	
} ELSE 
	sendinput, #{down}
return


F14 & F15:: 
If Winactive("ahk_exe AHK-Studio.exe"){
	
	sendinput, !{tab}
	
} ELSE 
	sendinput, !{tab}

return		

#IfWinActive
F14::F14()


;_________________________________________________________________________Snipper

#IfWinActive,  Paster - Snipaste ahk_exe Snipaste.exe
F14::send, ^{rbutton}
#ifwinactive, 