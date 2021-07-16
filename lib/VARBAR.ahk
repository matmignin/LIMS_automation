Class VarBar{	

	Show(X:=1, Y:=1, Destroy:="Reset"){
		Global
		try Gui,VarBar:Destroy
		; If (X<>0)
		; {
		; EnvGet, iteration, Iteration
		if !WinExist("LMS Workbook.xlsb"){
			Iniread, Batch, data.ini, SavedVariables, Batch
			Iniread, Product, data.ini, SavedVariables, Product
			Iniread, SampleID, data.ini, SavedVariables, SampleID
			Iniread, Lot, data.ini, SavedVariables, Lot
			Iniread, Coated, data.ini, SavedVariables, Coated
		}
			iniread, note1, data.ini, SavedVariables, note1
			Iniread, note2, data.ini, SavedVariables, note2
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
			Gui, VarBar:color, 			21a366
			GUI,VarBar:Font,				s15 cBlack Bold, Consolas
			Gui,VarBar:Add,edit, 		vProduct 				gproductVarBar left h28 x1 y1 w58,				%Product%  ; edit1
			GUI,VarBar:Font,				s10 cBlack,Consolas
			Gui,VarBar:add,Edit,	 	vBatch 					gbatchVarbar H19 x60 y-2 w70, 						%Batch% 	 ; edit2
			GUI,VarBar:Font,				s9 cBlack , Consolas
			Gui,VarBar:add,Edit,	 	vlot 						gLotVarbar x60 center H18 y15 w70, 							%Lot% 		 ; edit3
			GUI,VarBar:Font,				s8 cBlack,arial Narrow
				; If Coated
			Gui,VarBar:add,Edit,	 	vCoated 				gCoatedVarbar x131 H18 y15 w60, 					%Coated%   ; edit4
			GUI,VarBar:Font,				s7 cBlack,arial
				if sampleid
			Gui,VarBar:add,Edit,	 	vSampleID 			gSampleIDVarbar x135 H18 y-3 w80, 				%SampleID%  ; edit5
			GUI,VarBar:Font,				s11 cBlack, Consolas
			Gui,VarBar:Add,text, 		vIteration x203 y14 w18,																	%Iteration%	; Text1
			GUI,VarBar:Font,				s8 cBlack,Consolas 		
			Gui,VarBar:add,Edit,	 	vNote1 					gNotevarbar x220 H19 y-3 w60, 						%Note1%     ; edit6
			Gui,VarBar:add,Edit,	 	vNote2 					gNotevarbar x220 H19 y14 w60,							%Note2%  		; edit7
		OnMessage(0x203, "VarBar.Relocate")
		CoordMode, mouse, screen
		; WinGetPos, VarBar_X, VarBar_Y,,, NuGenesis LMS - \\Remote,
		; varbar_x:= Varbar_x +100
		try
			Gui, VarBar:Show, h30 x%VarBar_X% y%VarBar_y% w280 NoActivate, VarBar
		; Gui, VarBar:Show, h30 x%offset_X% y%offset_y% w320 NoActivate, VarBar
		catch
		{
			IniWrite, 1, data.ini, Locations, VarBar_X
			IniWrite, 1, data.ini, Locations, VarBar_Y
		}
		CoordMode, mouse, window
		if (Follow=1)
			varbar.follow()
		ControlsetText, Static1, %Iteration%,VarBar
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
		NoteVarBar:
			sleep 100
			; keywait, enter
			Gui, VarBar:submit,NoHide
		return
		CoatedVarBar:
			sleep 100
			Gui, VarBar:submit,NoHide
		return

		
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
			IniWrite, %Follow%, data.ini, Locations, Follow
			coordmode, mouse, Window
			sleep 500
			GUI, VarBar:destroy
		return
	}
Focus(Control){
	global
	WinGetTitle, the_WinTitle, A
	caret_x:=A_CaretX
	caret_y:=A_Carety
	WinActivate, VarBar ahk_exe AutoHotkey.exe
	GuiControl Varbar:Focus, %Control%, 
	send, {ctrldown}{a}{ctrlup}
	sleep 200

	return
}	


	Follow(WindowSelection){
		global
		; winactivate, 
		SetTimer, CheckActive, 500
	
		return
	}

	Relocate(){
		global
	
		settimer, checkactive, off
		PostMessage, 0xA1, 2
		keywait, Lbutton, U T0.20
			if !errorlevel
			{
				keywait, Lbutton, U
				wingetpos, Varbar_X, Varbar_Y,W,H, VarBar ahk_class AutoHotkeyGUI
				IniWrite, %Varbar_X%, data.ini, Locations, VarBar_X
				IniWrite, %Varbar_Y%, data.ini, Locations, VarBar_Y
				return
			}
			send, {tab}
			
		; Excel.Connect()
		sleep 300
		return
	}

	LaunchTable(){
		global
		try GUI ingredient_table:destroy
		try GUI Spec_table:destroy
		if winactive("Result Editor - \\Remote") || Winactive("Test Definition Editor - \\Remote") || winactive("Results Definition - \\Remote")
			SpecTab.Table()
		if winactive("Composition - \\Remote") || WinActive("Edit Ingredient - \\Remote")
			ProductTab.Table()
		else {
		ifwinnotactive, ahk_exe WFICA32.EXE 
			winactivate, ahk_exe WFICA32.EXE
		lms.DetectTab()
			If (Tab="Products")
				ProductTab.Table()
			else If (Tab="Specs")
				SpecTab.Table()
			else	
				Menu.Tables()
		}
		return
	}




	Search(input){
	global
	Clip()
	LMS.SearchBar(input)
	return
}

	AddIteration(speed:=550){
	global Iteration
	sleep 20
	Iteration+=1
	ControlsetText, Static1,%Iteration%,VarBar`~
	sleep %Speed%
	IniWrite, %Iteration%, data.ini, SavedVariables, Iteration
	return
}
	SubIteration(speed:=550){
	global Iteration
	sleep 10
	Iteration-=1
	ControlsetText, Static1,%Iteration%,VarBar
	sleep %speed%
	IniWrite, %Iteration%, data.ini, SavedVariables, Iteration
	return
}

Load(){
	Global
Iniread, Product, data.ini, SavedVariables, Product
Iniread, Batch, data.ini, SavedVariables, Batch
Iniread, Lot, data.ini, SavedVariables, Lot
Iniread, Coated, data.ini, SavedVariables, Coated
Iniread, SampleID, data.ini, SavedVariables, SampleID
Iniread, Iteration, data.ini, SavedVariables, Iteration
iniread, note1, data.ini, SavedVariables, note1
Iniread, note2, data.ini, SavedVariables, note2
iniread, Follow, data.ini, Locations, Follow
Iniread, VarBar_Y, data.ini, Locations, VarBar_Y
Iniread, VarBar_X, data.ini, Locations, VarBar_x
}

exit(){
global
iniwrite, %Product%, data.ini, SavedVariables, Product
iniwrite, %Batch%, data.ini, SavedVariables, Batch
iniwrite, %Lot%, data.ini, SavedVariables, Lot
iniwrite, %Coated%, data.ini, SavedVariables, Coated
iniwrite, %SampleID%, data.ini, SavedVariables, SampleID
IniWrite, %Iteration%, data.ini, SavedVariables, Iteration
IniWrite, %note1%, data.ini, SavedVariables, note1
IniWrite, %note2%, data.ini, SavedVariables, note2
iniwrite, %VarBar_Y%, data.ini, Locations, VarBar_Y
iniwrite, %VarBar_X%, data.ini, Locations, VarBar_x
iniwrite, %Follow%, data.ini, Locations, Follow
iniwrite, %Inverted%, data.ini, Locations, Inverted
Notes.Save()
	
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
 If WinActive("NuGenesis LMS - \\Remote") || Winactive("Register new samples - \\Remote") ;|| winactive("ahk_exe OUTLOOK.EXE") || winactive("ahk_exe Code.exe")
  ; If WinActive("ahk_exe WFICA32.EXE") ;|| Winactive("ahk_exe EXCEL.EXE") || winactive("ahk_exe OUTLOOK.EXE") || winactive("ahk_exe Code.exe")
 {
		; WinGetTitle, WinTitle, A
		WinGetPos, LMS_X, LMS_Y, LMS_W,LMS_H, A
		VarWin_X := LMS_X+(LMS_W/2)-400
		VarWin_Y := LMS_Y
		WinMove, VarBar ahk_class AutoHotkeyGUI,, VarWin_X, VarWin_Y,
  ; Varbar.Follow(Wintitle)
 }
 return
;  Else if WinActive("VarBar ahk_class AutoHotkeyGUI")
  ; exit
;  else
  ; return
 ; WinMove, VarBar ahk_class AutoHotkeyGUI,, %VarBar_X%, %VarBar_Y%
; Return