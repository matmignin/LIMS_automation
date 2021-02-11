;#SingleInstance,Force
return



#ifwinactive, Result Editor - \\Remote
Wheelleft::Run, LMS\GUI_SpecTable.ahk ;GetIngredientMenu()
#ifwinactive, Results Definition - \\Remote  
F15::
Menu, Results_DefinitionMenu, Add, USP Heavy Metal, Results_DefinitionMenuHandler
Menu, Results_DefinitionMenu, Add, Canada Heavy Metal, Results_DefinitionMenuHandler
Menu, Results_DefinitionMenu, Add, Prop65 Heavy Metal, Results_DefinitionMenuHandler
Menu, Results_DefinitionMenu, Show,
return
Results_DefinitionMenuHandler:
if (A_ThisMenuItem = "USP Heavy Metal")
	Spec_Tab_HeavymetalsComponents_US()
else if (A_ThisMenuItem = "Canada Heavy Metal")
	Spec_Tab_HeavymetalsComponents_Canada()
else if (A_ThisMenuItem = "Prop65 Heavy Metal")
	Spec_Tab_HeavymetalsComponents_Prop65()
return
return





Wheelright::Click("Add") ;Click,45, 61 ;Add
Wheelleft::Run, LMS\GUI_SpecTable.ahk 
return
#ifwinactive, Test Definition Editor - \\Remote ;Formulation window, 
WheelLeft::Run, LMS\GUI_SpecTable.ahk 
enter::Click("Save_Spec_Tab_TestDefinitionEditor")
wheelright::Spec_Tab_TestDefinitionEditor(Description)
#ifwinactive, Edit sample template - \\Remote
WheelLeft::sendinput, {tab}{delete 4}%ProductCode%{enter}
#ifwinactive, Select methods tests - \\Remote
wheelleft::Click("SearchBar_SelectMethodsTests")
													;	wheelRight::AddAvonTest() ; Click("MoveOverTest_SelectMethodsTests")       ;      method edit      avon




Create_Specification_template: ;{
		#ifwinactive, ahk_exe WFICA32.EXE
:*:p\:: ;Physical Spec
		send,%ProductCode%`, In Process`, Physical{tab 4}^a%ProductCode%{tab 2}
		Sleep 200
		send,{Space}
		sleep 200
		winwaitactive, Products List - \\Remote, , 8
				if errorlevel
			return
		else
		send, {enter 2}
		sleep 200
		send,{tab}
		sleep 200
		send,{right} 
		sleep 300
		winwaitactive, NuGenesis LMS - \\Remote, ,8
		if errorlevel 
			return
		else
			click, 90 , 514 ;edit sample method 
		sleep 499
		winwaitactive, Edit sample template - \\Remote,,4
		if errorlevel
			return
		else
			sendinput, {tab}{delete 4}%ProductCode%{enter}
		return
:*:cp\::  ;Coated Physical Spec
		send,%ProductCode%`, Coated`, Physical{tab 4}^a%ProductCode%{tab}{enter}{tab}{space}{Return 2}
		winwaitactive, Edit specification, 2
		sleep 200
		send,{tab 2}{right} 
		return
:*:r\:: ;Retain
		send,%ProductCode%`, In Process`, Retain{tab 4}^a%ProductCode%{tab}{enter}{tab}{space}{Return 2}
		sleep 200
		send,{tab}{right} 
		sleep 400
		send,{tab}{right}
		winwaitactive, NuGenesis LMS - \\Remote, ,8
		if errorlevel 
			return
		else
			click, 70, 520 ;click edit sample template
		winwaitactive, Edit sample template - \\Remote,,5
		if errorlevel
			return
		else
			sendinput, {tab}{delete 4}%ProductCode%{enter}
		return
	:*:cr\:: ;Coated Retain
		send,%ProductCode%`, Coated`, Retain{tab 4}^a%ProductCode%{tab}{enter}{tab}{space}{Return 2}
		sleep 400
		send,{tab}{right} 
		sleep 200
		send,{tab}{right}
		winwaitactive, NuGenesis LMS - \\Remote, ,8
		if errorlevel 
			return
		else
			click, 70, 520 ;click edit sample template
		winwaitactive, Edit sample template - \\Remote,, 5
		if errorlevel
			return
		else
			sendinput, {tab}{delete 4}%ProductCode%{enter}
		return
:*:m\:: ;Micro
		send,%ProductCode%`, Finished`, Micro{tab 4}^a%ProductCode%{tab 2}
		Sleep 200
		send,{Space}
		sleep 200
		winwaitactive, Products List - \\Remote, ,5
		send, {enter 2}
		sleep 200
		send,{tab}
		sleep 200
		send,{right} {tab}{left 2}
		winwaitactive, NuGenesis LMS - \\Remote, ,8
		if errorlevel 
			return
		else
			click, 70, 520 ;click edit sample template
		winwaitactive, Edit sample template - \\Remote,, 5
		if errorlevel
			return
		else
			sendinput, {tab}{delete 4}%ProductCode%{enter}
		return
:*:a\:: ;Analytical
		If WinActive("Edit sample template - \\Remote")
			Spec_Tab_EditSampleTemplate_A(ProductCode)
		else If winactive("Edit specification - \\Remote")
		{		
			Spec_Tab_EditSpecification_A_A(ProductCode)
			;winwaitactive, NuGenesis LMS - \\Remote, ,8
			;if errorlevel
				;return
			;else
			;{
				;sleep 300
				;click("AddNewSampleTemplate")
				;winwaitactive, Edit sample template - \\Remote,, 5
				;Spec_Tab_EditSampleTemplate_A(ProductCode)
				;return
			;}
		}
		return
:*:ac\::
		sendinput, %ProductCode%`, In Process`, Analytical
		Sendinput, {tab 4}^a%ProductCode%{tab}{enter}{tab}{space}{enter 2}{tab}{right}
	return ;}
	
	
	
	
	
	
	
	#IfWinActive,
	#include LMS\GUI_SpecTable.ahk