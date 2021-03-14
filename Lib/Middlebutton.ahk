



Mbutton()
{
	global
	If Winactive("Test Definition Editor - \\Remote"){
		return 
		
	} Else If winactive("Edit sample template - \\Remote"){
		menu()
	} Else If winactive("Results Definition - \\Remote"){
		Sendinput, {Click}^a
	} Else If winactive("NuGenesis LMS - \\Remote"){
		keywait, Lbutton, U
		Sendinput, ^{click}
		
	} else
		return
	return
}


Mbutton & F15::Varbar_Reset()



#IfWinActive, LMS Products Workbook.xlsm - Excel	
;Mbutton::Excel_Connect()

#IfWinActive, NuGenesis LMS - \\Remote
Mbutton::Mbutton()


#IfWinActive,  Paster - Snipaste ahk_exe Snipaste.exe

Mbutton::Sendinput, {click right}z1{click right}e{ctrl down}5{ctrl up}
#ifwinactive, 