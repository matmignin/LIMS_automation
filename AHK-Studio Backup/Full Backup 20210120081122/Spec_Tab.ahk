;#SingleInstance,Force
return


Spec_KeyBindings: ;{
#ifwinactive, Result Editor - \\Remote
	Wheelleft::Run, GUI_SpecTable.ahk ;GetIngredientMenu()
#ifwinactive, Results Definition - \\Remote    
	F15::
	Menu, Results_DefinitionMenu, Add, USP Heavy Metal, Results_DefinitionMenuHandler
	Menu, Results_DefinitionMenu, Show,
	return
											Results_DefinitionMenuHandler:
	if (A_ThisMenuItem = "USP Heavy Metal")
		HeavymetalsComponents()
	return
	Wheelright::Click("Add_ResultsDefinition") ;Click,45, 61 ;Add
	Wheelleft::sendinput, {Click}Click("Edit") ;Edit
	return
#ifwinactive, Test Definition Editor - \\Remote ;Formulation window, 
	Rbutton::Run, GUI_SpecTable.ahk 
	wheelright::TestDefinitionEditor(Description)
	enter::Click("Save_TestDefinitionEditor")
#ifwinactive, Edit sample template - \\Remote
	WheelLeft::sendinput, {tab}{delete 4}%ProductCode%{enter}
#ifwinactive, Select methods tests - \\Remote
	wheelleft::Click("SearchBar_SelectMethoodTests")
	
;}



Create_Specification_template:
#ifwinactive, ahk_exe WFICA32.EXE
:*:p\:: ;Physical Spec
	send,%ProductCode%`, In Process`, Physical{tab 4}^a%ProductCode%{tab 2}
	Sleep 200
	send,{Space}
	sleep 200
	winwait, Products List - \\Remote, , 8
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
	winwait, Edit specification, 2
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
	winwaitactive, Edit sample template - \\Remote,,4
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
	winwaitactive, Edit sample template - \\Remote,, 4
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
	winwait, Products List - \\Remote, ,4
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
	winwaitactive, Edit sample template - \\Remote,, 4
	if errorlevel
		return
	else
		sendinput, {tab}{delete 4}%ProductCode%{enter}
	return
:*:a\:: ;Analytical
	IfWinActive, Edit sample template - \\Remote
		EditSampleTemplate_A(ProductCode)
	IfWinActive, Edit specification - \\Remote
		EditSpecification_A(ProductCode)
	return
:*:ac\::
	sendinput, %ProductCode%`, In Process`, Analytical
	Sendinput,{tab 4}^a%ProductCode%{tab}{enter}{tab}{space}{enter 2}{tab}{right}
return ;}







#IfWinActive,
#include GUI_SpecTable.ahk