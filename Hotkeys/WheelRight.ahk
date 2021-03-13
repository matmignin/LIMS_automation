WheelRight(){
	global
	If winactive("ahk_exe AHK-Studio.exe"){
		sendinput, !{right}	
	} Else If winactive("ahk_exe explorer.exe"){
		sendinput, !{right}	
	} Else If winactive("ahk_exe EXCEL.EXE"){
		SetScrollLockState, On
		Send, {right 1} 
		SetScrollLockState, Off 
		return
	} Else If winactive("outlook"){
		Send, {wheelright} 
	} else if Winactive("Select tests for request"){
		Mouse_Click("Select_TestsForRequests")
		;LMS
	} Else If winactive("NuGenesis LMS - \\Remote"){
		Main_EditResults()
	} Else If winactive("Result Entry - \\Remote"){
		SampleTab_ChangeTestResults("Toggle")	
		;ProductTab
	} else if winactive("Edit Formulation - \\Remote"){
		ProductTab_tabletsizeMenu()
		
	} else if winactive("Composition - \\Remote"){
		Mouse_Click("Edit")
		
	} else if winactive("Edit Ingredient - \\Remote"){
		ProductTab_DropDown_Ingredient()	
	} Else If winactive("Test Definition Editor - \\Remote "){
		SpecTab_TestDefinitionEditor(Description)
	} Else If winactive("Results Definition - \\Remote "){
		Mouse_Click("Add")	
	} Else If winactive("Paster - Snipaste ahk_exe Snipaste.exe"){
		sendinput, ^=^=
		
		
		
		
		
		
		;=============================================================================
	} Else if winactive("Edit sample (Field Configuration: I`, Physical) - \\Remote"){
		Excel_Connect()
		sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%
		SampleTab_ShipToSelect()
	} Else if winactive("Edit sample (Field Configuration: CT`, Physical) - \\Remote"){
		SampleTab_ShipToSelect()
	} Else if winactive("Edit sample (Field Configuration: I`, Analytical) - \\Remote"){
		SampleTab_ShipToSelect()
	} Else if winactive("Edit sample (Field Configuration: F`, Micro) - \\Remote"){
		SampleTab_ShipToSelect(504)
	} Else if winactive("Edit sample (Field Configuration: CT`, Retain) - \\Remote, "){
		SampleTab_ShipToSelect()
	} Else if winactive("Edit sample (Field Configuration: I`, Retain) - \\Remote"){
		SampleTab_ShipToSelect()
	} else
		return
	
}







#IfWinActive
wheelright::WHeelright()
#ifwinactive,  outlook
F17::Wheelright()