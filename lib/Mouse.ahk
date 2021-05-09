

Mouse_IsOver(WinTitle){ 
	MouseGetPos,,, Win
	Return WinExist(WinTitle . " ahk_id " . Win)
}


Mouse_RbuttonUP(){
	#inputlevel 1
	suspend, On
	sleep 50
	Click, Right
	; sleep 200
  MouseClick, Right,,,1, 0, U
	; sendinput, {esc}
	suspend, Off
	#inputlevel 0
	return
}
return
Mouse_CloseWindow() 
{

  if WinActive("Inbox - mmignin@vitaquest.com - Outlook") ; || winactive("ahk_exe OUTLOOK.EXE")
	{
    Return
	}
	else If WinActive("ahk_exe WFICA32.EXE")
	{
		send, {esc}
		sleep 400
		return
	}
	else if WinActive("ahk_exe firefox.exe") || winactive("ahk_exe msedge.exe")
	{
		sendinput, {ctrl down}w{ctrl up}
		sleep 400
		return
	}
	else if WinActive("ahk_exe explorer.exe") || winactive("ahk_exe OUTLOOK.EXE")
	{
		sendinput, !{F4}
		sleep 400
		return
	}	
	else if winactive("Settings ahk_class ApplicationFrameWindow")
	{
		winclose
		sleep 400
		return
	}
	else if winactive("ahk_exe Code.exe")
		sendinput, Wheel("^w")
	else if winactive("ahk_exe mstsc.exe") || winactive("ahk_exe EXCEL.EXE")
	{ 
		Send, ^v
		sleep 400
		return
	}
	else If winactive("NuGenesis LMS - \\Remote")
		Tooltip("nope")
	else
		return
	return
}

Mouse_Click(Link) {
	global
	if Link contains Save_ProductTab_EditProduct 
		click 275, 578	
else If link contains Results_Definition_edit
	click 78,63
else If link contains Result_Editor_Ok
	click 370,660
else If link contains Results_Definition_ok
	click 1336,592
else If link contains Requests_tab
	click 865,83
else If link contains MyWork_Tab
	click 761,44
else If link contains Mywork_Searchbar
	click 500,127, 2
	else if Link contains Save_Composition
		click 1236, 888
	else if Link contains Save_Composition
		click 
	else if Link Contains OK_ProductTab_EditIngredient
		click 265, 561
	else if Link contains OK_ResultEntry
		click, 1028, 808
	else if Link contains Orient_ResultEntry
		click 843, 202, 2
	else if Link contains main_enter_results
		click 74, 776
	else if Link contains ScrollDown_EditFormulation
		click 453, 444
	else if Link contains Dropdown_ProductTab_EditIngredient
		click 272, 67
	else if Link contains SearchBar_SelectMethodsTests
		click 225, 69, 2
	else if Link contains MoveOverTest_SelectMethodsTests
		Send, {Click}{click 506, 341}
	else if Link contains Add
		click 45, 65
	else if Link contains Edit
		click 84, 65
	else if Link Contains Main_EditTest
		Sendinput, {click, 56, 784 }
	else if Link Contains Add_Formulation
		click, 73, 280
	else if Link contains AddNewSampleTemplate
		click 103, 325
	else if Link contains Orient_SpecTab_TestDefinitionEditor
		Click, 187, 200 
	else if Link contains Save_SpecTab_TestDefinitionEditor 
		Click 341, 618
	else if Link contains Select_TestsForRequests 
	{
		sendinput, {Click 500, 340}{click, 845, 658}
		winwaitactive, Edit request - \\Remote, ,3
		sendinput, {tab}{enter}
	} 
	else if Link Contains Products_Tab
		Sendinput, {click, 550, 35}{tab}%Product%+{Tab 7} 
	else if Link contains SearchBar_Product 
	{
		if winactive("Select methods tests - \\Remote")
		{
			click, 246,77, 2
			return
		}
		else If WinActive("NuGenesis LMS - \\Remote")
		{
			;click 366, 44
			;sleep 300
			click 518, 89, 2
			sendinput, %Product%
			sleep 200
			send, {enter}
		}
		return
	}
	else if Link contains SearchBar_Batch		
	{
		if winactive("Select methods tests - \\Remote")
		{
			click, 246,77, 2
			return
		}
		else If WinActive("NuGenesis LMS - \\Remote")
		{
			click 783, 45
			sleep 400
			click 487, 125, 2
			sendinput, %Batch%
			sleep 200
			send, {enter}
			winwaitactive, Warning - \\Remote, ,2
			if errorlevel
				return
			else
				sendinput, {esc}
			return
		}
		Return
	}

	else
		msgbox, yo
	return
}

#IfWinActive