KEY_Varbar:
	#If Mouse_IsOver("VarBar ahk_class AutoHotkeyGUI")
		wheelleft::Excel.PreviousSheet()
	wheelRight::excel.Nextsheet()
	WheelUp::Varbar.AddIteration()
	Wheeldown::Varbar.SubIteration()
	F7::Excel.NextSheet()
	F6::Excel.previoussheet()
	F20::Varbar.Follow()
	mbutton::Varbar.LaunchTable()
	F20 & F6::ProductTab_Table()
	F20 & F7::SpecTab_Table()
	Rbutton::Menu.Tables() ; Excel.connect()
F9::ReloadScript()
#if

Class VarBar{

	Show(X:=1, Y:=1, Destroy:="Reset"){
		Global
		try Gui,VarBar:Destroy
		; If (X<>0)
		; {
		; EnvGet, iteration, Iteration
			Iniread, Iteration, data.ini, SavedVariables, Iteration

			Iniread, VarBar_X, data.ini, Locations, VarBar_X
			Iniread, VarBar_Y, data.ini, Locations, Varbar_Y
		; }
		If (X=)
		{
			coordmode, mouse, Screen
			MouseGetPos,MousePos_X,MousePos_Y,w,h
			coordmode, mouse, Window
			Varbar_X:=MousePos_X
			varbar_y:=MousePos_Y-10
			IniWrite, %Varbar_X%, data.ini, Locations, VarBar_X
			IniWrite, %Varbar_y%, data.ini, Locations, VarBar_Y
		}
		if (Destroy:="Reset")
			GUI, VarBar:destroy
		Gui Varbar:Default
		Gui VarBar: +LastFound +AlwaysOnTop -Caption +ToolWindow +owner
		; WinGetPos, LMS_X, LMS_Y, LMS_W,LMS_H, NuGenesis LMS - \\Remote
		; Varbar_X := LMS_X+1000
		WinSet, Transparent, 200
		Gui, VarBar:color, 21a366
		; Varbar_Y := LMS_Y
		GUI, VarBar:Font, s14 cBlack Bold, Consolas
		Gui, VarBar:Add, edit, vProduct gproductVarBar left h24 x0 y0 w62, %product%
		GUI, VarBar:Font, s10 cBlack Bold, Consolas
		Gui, VarBar:add, Text, vBatch2 x68 y0 w100, %Batch2%
		Gui, VarBar:add, Edit, vBatch gbatchVarbar H19 x62 y-2 w70, %Batch%
		GUI, VarBar:Font, s10 cBlack , Consolas
		; Gui, VarBar:add, Text, vlot x70 y16 w70, %Lot%
		Gui, VarBar:add, Edit, vlot gLotVarbar x132 H19 y-2 w60, %Lot%
		GUI, VarBar:Font, s7 cBlack , Consolas
		Gui, VarBar:add, Edit, vSampleID gSampleIDVarbar x193 H19 y-2 w90, %SampleID%
		GUI, VarBar:Font, s7 cBlack , arial
		Gui, VarBar:add, Text, vCoated -wrap Right x132 y15 w80, %Coated%
		GUI, VarBar:Font, s8 cBlack , arial Narrow
		Gui, VarBar:add, Text, vname x65 -wrap y15 w160, %Name%
		; Gui, VarBar:add, Text, vcustomer x200 -wrap y16 w160, %Customer%
		GUI, VarBar:Font, s8 cBlack , arial Narrow
		Gui, VarBar:add, Text, vColor x190 -wrap y18 w90, %Color%
		GUI, VarBar:Font, s7 cBlack , arial
			; If Coated
				; Gui, VarBar:add, Edit, vCoated gCoatedVarbar x132 H19 y15 w60, %Coated%
		GUI, VarBar:Font, s8 cBlack , Consolas
		GUI, VarBar:Font, s12 cBlack Bold, Consolas
				Gui, VarBar:Add, text, vIteration x310 y-1 w70, 
		GUI, VarBar:Font, s8 cBlack , arial Narrow
		Gui, VarBar:Add, text, vDepartment x320 right y3 w80, %Department%
		; Gui, VarBar:Add, UpDown, vIterationUpDown x300 h30 y0 w1 Range0-6, %Iteration%
		OnMessage(0x203, "VarBar.Relocate")
		CoordMode, mouse, screen
		; WinGetPos, VarBar_X, VarBar_Y,,, NuGenesis LMS - \\Remote,
		; varbar_x:= Varbar_x +100
		try
			Gui, VarBar:Show, h28 x%VarBar_X% y%VarBar_y% w330 NoActivate, VarBar
		; Gui, VarBar:Show, h30 x%offset_X% y%offset_y% w320 NoActivate, VarBar
		catch
		{
			IniWrite, 1, data.ini, Locations, VarBar_X
			IniWrite, 1, data.ini, Locations, VarBar_Y
		}
		CoordMode, mouse, window
		ControlsetText, Static5, %Iteration%,VarBar
		return

		ProductVarBar:
			sleep 100
			Gui, VarBar:submit,NoHide
		return
		BatchVarBar:
			sleep 100
			Gui, VarBar:submit,NoHide
		return
		LotVarBar:
			sleep 100
			Gui, VarBar:submit,NoHide
		return
		SampleIDVarBar:
			sleep 100
			Gui, VarBar:submit,NoHide
		return
		CoatedVarBar:
			sleep 100
			Gui, VarBar:submit,NoHide
		return
		; IterationVarBar:
		; sleep 600
		; Gui, VarBar:Submit,Nohide
		; ; ControlGetText, Iteration, Edit2, VarBar
		; sleep 100
		; IniWrite, %Iteration%, data.ini, SavedVariables, Iteration
		; return
		VarBarGuiClose:
			coordmode, mouse, Screen
			; WinGetPos,VarBar_X,Varbar_Y,w,h
			; WinGetPos, LMS_X, LMS_Y, LMS_W,LMS_H, NuGenesis LMS - \\Remote
			; Varbar_X := LMS_X+1000
			; Varbar_Y := LMS_Y
			sleep 100
			IniWrite, %Iteration%, data.ini, SavedVariables, Iteration
			IniWrite, %VarBar_X%, data.ini, Locations, VarBar_X
			IniWrite, %VarBar_y%, data.ini, Locations, VarBar_Y
			coordmode, mouse, Window
			sleep 500
			GUI, VarBar:destroy
		return
	}

	Follow(){
		global
		SetTimer, CheckActive, 600
		WinGetPos, LMS_X, LMS_Y, LMS_W,LMS_H, A
		VarWin_X := LMS_X+(LMS_W/2)-400
		VarWin_Y := LMS_Y
		WinMove, VarBar ahk_class AutoHotkeyGUI,, VarWin_X, VarWin_Y,
		return
	}

	Relocate(){
		global
		settimer, checkactive, off
		PostMessage, 0xA1, 2
		keywait, Lbutton, U
		wingetpos, Varbar_X, Varbar_Y,W,H, VarBar ahk_class AutoHotkeyGUI
		; Excel.Connect()
		IniWrite, %Varbar_X%, data.ini, Locations, VarBar_X
		IniWrite, %Varbar_Y%, data.ini, Locations, VarBar_Y
		sleep 300
		return
	}

	LaunchTable(){
		global
		try GUI ingredient_table:destroy
		try GUI Spec_table:destroy
		if winactive("Result Editor - \\Remote") || Winactive("Test Definition Editor - \\Remote") || winactive("Results Definition - \\Remote")
			SpecTab_Table()
		if winactive("Composition - \\Remote") || WinActive("Edit Ingredient - \\Remote")
			ProductTab_Table()
		else
			Menu.Tables()
		return
	}




	Search(input){
	global
	Clip()
	; WinActivate, NuGenesis LMS - \\Remote
	; click 746, 47
	; sleep 200
	LMS.SearchBar(input)
	return
}

	AddIteration(){
	global Iteration
	; GuiControl, Varbar:Text, iteration, %iteration%
	sleep 20
	; CoordMode, tooltip, screen
	Iteration+=1
	ControlsetText, Static5,%Iteration%,VarBar
	sleep 550
	; sleep 200
	; envset, iteration, %iteration%
	IniWrite, %Iteration%, data.ini, SavedVariables, Iteration
	; tooltip(Iteration, 3000,(Varbar_x+80),Varbar_y)
	return
}
	SubIteration(){
	global Iteration
	sleep 10
	; CoordMode, tooltip, screen
	; 3GuiControl, Varbar:Text, iteration, %iteration%
	Iteration-=1
	ControlsetText, Static5,%Iteration%,VarBar
	sleep 550
	; sleep 200
	; envset, iteration, %iteration%
	IniWrite, %Iteration%, data.ini, SavedVariables, Iteration
	; tooltip(Iteration,3000,((Varbar_x+80)),Varbar_y)
	return
}

	Reset(){
	Global
	GUI, VarBar:destroy
	coordmode, mouse, Screen
	MouseGetPos,MousePos_X,MousePos_Y,w,h
	coordmode, mouse, Window

	IniWrite, %MousePos_X%, data.ini, Locations, VarBar_X
	IniWrite, %MousePos_Y%, data.ini, Locations, VarBar_Y
	IniWrite, MousePos_X+50, data.ini, Locations, ProductTable_X
	IniWrite, MousePos_Y+50, data.ini, Locations, ProductTable_Y
	IniWrite, MousePos_X+50, data.ini, Locations, SpecTable_X
	IniWrite, MousePos_Y+50, data.ini, Locations, SpecTable_Y
			; Excel.Connect()
	Gui, VarBar:Show, h30 x%MousePos_X% y%MousePos_Y% w390 ; NoActivate
	VarBar.show(0)
	; Varbar.Relocate()
	return
}
}



CheckActive:
 If WinActive("NuGenesis LMS - \\Remote") ;|| Winactive("ahk_exe EXCEL.EXE") || winactive("ahk_exe OUTLOOK.EXE") || winactive("ahk_exe Code.exe")
  ; If WinActive("ahk_exe WFICA32.EXE") ;|| Winactive("ahk_exe EXCEL.EXE") || winactive("ahk_exe OUTLOOK.EXE") || winactive("ahk_exe Code.exe")
 {
  Varbar.Follow()
  return
 }
 Else if WinActive("VarBar ahk_class AutoHotkeyGUI")
  exit
 else
  return
 ; WinMove, VarBar ahk_class AutoHotkeyGUI,, %VarBar_X%, %VarBar_Y%
Return