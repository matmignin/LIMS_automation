Mouse_Click(Link) 
{
	global
	if Link contains Save_ProductTab_EditProduct 
		click 275, 578
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
		click  453, 444
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
		Sendinput, {click, 75, 280}
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
		Sendinput, {click, 550, 35}{tab}%Product%+{Tab 7} ;{click 454, 475, 2}
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
			;msgbox, yo
		return
	}
	
	
	
	Mouse_WheelZoomOut() 
	{
		BlockInput, On
		sendinput, ^{Wheeldown}
		;send, ^-
		SLEEP 200
		blockinput, off
		return
	}
	Mouse_WheelZoomIn() 
	{
		blockinput, On
		sendinput, ^{Wheelup}
		;send, ^=
		SLEEP 200
		blockinput, off
		return
	}
	Mouse_WheelPaste() 
	{
		Global
		if winactive("ahk_exe WFICA32.EXE")
		{
			Clipboard := Trim((Clipboard, "`r`n"))
			sleep 150
			send, %Clipboard%
			tooltip("Paste")
		}
		else 
			send, ^v
		ToolTip("Paste")
		sleep 1000
		return
	}
	Mouse_WheelCut() 
	{
		global
		Send, ^x
		clipwait, 0.25
		ToolTip(clipboard)
		sleep 800
		
		return
	}
	Mouse_WheelCopy() 
	{
		global
		Send, ^c
		clipwait, 0.25
		ToolTip(clipboard)
		sleep 800
		return
	}
	
	Mouse_CloseWindow() 
	{
		
		If WinActive("ahk_exe WFICA32.EXE")
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
		else if WinActive("ahk_exe explorer.exe") || winactive("Inbox - mmignin@vitaquest.com - Outlook")
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
		else if winactive("ahk_exe mstsc.exe") ||  winactive("ahk_exe EXCEL.EXE")
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
	
	Mouse_Location_Get() 
	{
		global
		MouseGetPos, MouseLocationX, MouseLocationY
		MouseClick, right,,, 1, 0, D  ; Hold down the left mouse button.
		Loop
		{
			Sleep, 10
			if !GetKeyState("Rbutton", "P")  ; The key has been released, so break out of the loop.
				break
			MouseGetPos, MousePosX, MousePosY, , WinControl
			MousePosition:=MousePosX "`, " MousePosY
			WinGetTitle, winTitle, A
			WinGetClass, Winclass, A
			WinGet, WinProcess, ProcessName, A			
			Tooltip, %MousePosition%`n Title: %winTitle% `n Process: %WinProcess% `n Control: %winControl% `n Class: %winclass%
			
		}
		MouseClick, Right,,, 1, 0, U ; Release the mouse button.
		sendinput, {esc}
		;MouseClick, left,,, 1, 0,
		sleep 1000
		tooltip
		;WinGetTitle, Title, 
		;WinTitle:=Wintitle
		;WinProcess
		return
	}
	
	/*
		Mouse_Location_Show()
		{
			global
			AutoTrim, Off
			if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 250)
				Run, C:\Program Files\AutoHotkey\WindowSpy.ahk
			else 
			{
				;CoordMode, mouse, screen
				MouseGetPos, MouseLocationX, MouseLocationY, WindowTitle, MouseControl
				;WinGet, CurrentWindow, ProcessName, A
				WinGet, WindowProcess, ProcessName, A
				windowTitle:=Title
				MousePosition:=MouseLocationX "`, " MouseLocationY
				ToolTip, %CurrentWindow%`, %Title% `n Mouse: %MouseLocationX% `, %MouseLocationY%
				;CoordMode, mouse, window		
			}
			AutoTrim, On
			sleep 1000
			tooltip
			return
		}
	*/
	
	
	
	Mouse_Location_Set() {
		global
		;MouseGetPos, MouseX, MouseY
		MouseClick, right,,, 1, 0, D  ; Hold down the left mouse button.
		Loop
		{
			Sleep, 10
			if !GetKeyState("Rbutton", "P")  ; The key has been released, so break out of the loop.
				break
			MouseGetPos, MouseLocationX, MouseLocationY
			WinGetTitle, FullWinTitle, A
			Tooltip, %MouseLocationX% `, %MouseLocationY% `n%winTitle%
			; ... insert here any other actions you want repeated.
		}
		tooltip,
		MouseClick, Right,,, 1, 0, U ; Release the mouse button.
		WinTitle:=strreplace(FullwinTitle, A_space,"_")	
		WinTitle:=strreplace(winTitle, "(","")	
		WinTitle:=strsplit(WinTitle,"-","_")
		WinName:= WinTitle[1]
		%WinName%:= {X: MouseLocationX, Y: MouseLocationY, Win: FullWinTitle}
		;DebugWindow(%WinName%["Win"] "`n" %WinName%["X"] ", " %WinName%["Y"],1,0,10,0,0)
		
	}
	
	
	Mouse_Location_Go(){ 
		global
		WinGetTitle, WinTitle, A
		WinTitle:=strreplace(winTitle, A_space,"_")	
		WinTitle:=strreplace(winTitle, "(","")	
		WinTitle:=strsplit(WinTitle,"-","_")
		WinName:= WinTitle[1]
		;%WinName%:= {X: MouseLocationX, Y: MouseLocationY, Win: WinTitle[1]}
		;%Current_WinName%:= {X: MouseLocationX, Y: MouseLocationY, Win: FullWinTitle}
		
		MouseX:=%WinName%["X"]
		MouseY:=%WinName%["Y"]
		Click, %mouseX%, %MouseY%
		;DebugWindow(%WinName%["Win"],0,1,10,0,0)
		;DebugWindow(%WinName%["X"] ", " %WinName%["Y"],0,1,10,0,0)
		return
	}	
	
	
	RightClickText()
	{
		mousegetpos, mousex, mousey
		Click, %A_CaretX% %A_caretY%, right
		mousemove, %mousex%, %mousey%
		return
	}
	