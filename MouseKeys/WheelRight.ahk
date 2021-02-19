WheelRight(){
global
	If winactive("ahk_exe AHK-Studio.exe"){
		sendinput, !{right}	
	} Else If winactive("ahk_exe explorer.exe"){
		sendinput, !{right}	
	} else if Winactive("Select tests for request"){
		Click("Select_TestsForRequests")
;LMS
} Else If winactive("NuGenesis LMS - \\Remote"){
		Main_EditResults()
	} Else If winactive("Result Entry - \\Remote"){
		ChangeTestResults("Toggle")	
;PRODUCT_TAB
	} else if winactive("Edit Formulation - \\Remote"){
		Product_Tab_tabletsizeMenu()
			
	} else if winactive("Composition - \\Remote"){
		click("Edit")
		
	} else if winactive("Edit Ingredient - \\Remote"){
		Product_Tab_DropDown_Ingredient()	
	} Else If winactive("Test Definition Editor - \\Remote "){
		Spec_Tab_TestDefinitionEditor(Description)
	} Else If winactive("Results Definition - \\Remote "){
		Click("Add")	
;=============================================================================
	} Else if Winexist("Edit sample (Field Configuration: I`, Physical) - \\Remote"){
		Winactivate,
		Excel_ConnectTo()
		sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%
		Sample_Tab_ShipToSelect(304, 437)
	} Else if Winexist("Edit sample (Field Configuration: CT`, Physical) - \\Remote"){
		Winactivate,
		Sample_Tab_ShipToSelect(304, 437)
	} Else if Winexist("Edit sample (Field Configuration: I`, Analytical) - \\Remote"){
		Winactivate,
		Sample_Tab_ShipToSelect(304, 444)
	} Else if Winexist("Edit sample (Field Configuration: F`, Micro) - \\Remote"){
		Winactivate,
		Sample_Tab_ShipToSelect(304, 504)
	} Else if Winexist("Edit sample (Field Configuration: CT`, Retain) - \\Remote, "){
		winactivate,
		Sample_Tab_ShipToSelect(304, 433)
	} Else if Winexist("Edit sample (Field Configuration: I`, Retain) - \\Remote"){
		winactivate,
		Sample_Tab_ShipToSelect(304, 433)

		
	} else
			return
		
	}