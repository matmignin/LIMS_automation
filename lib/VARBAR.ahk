
#IfWinActive, VarBar ahk_exe AutoHotkey.exe 
	enter::                           
							winactivate, %the_WinTitle%
							click, %caret_X%, %caret_y%
							return
	mbutton::
				Click
				if Toggle := !Toggle
				 Notes.SHow()
				else
					notes.Save()
				return
	#ifwinactive

#If Mouse_IsOver("VarBar ahk_exe AutoHotkey.exe")
	wheelleft::    Excel.PrevSheet()
	wheelRight::   excel.Nextsheet()
	WheelUp::      Varbar.AddIteration()
	Wheeldown::    Varbar.SubIteration()
	F9::           Excel.connect()
	F7::           Excel.NextSheet()
	F6::           Excel.PrevSheet()
	esc::          varbar.reset()
	F21::          Spectab.Table()
	lalt::     		 Varbar.Reset()
	F21 & F20::    ProductTab.Table()
	Rbutton::			menu.Varbar()
	numpaddiv::
	mbutton:: 
				if Toggle := !Toggle
				 Notes.Show()
				else
					notes.Save()
				return
				
	MouseClip()
	reload
	return
	
#If Mouse_IsOver("Notes ahk_exe AutoHotkey.exe")
		NumpadDiv::
		Mbutton::Notes.save()

	  ;send, {click}{altdown}{a}{altup}
	; F20 & F7::     SpecTab.Table()
	; lbutton::      send, {click}^{a}
	; Rbutton::    Menu.Tables() ; Excel.connect()
	; F9::         ReloadScript()
#if


;C_Varbar:
return

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
				Iniread, ShowSampleID, data.ini, Locations, ShowSampleID
				Iniread, ShowCoated, data.ini, Locations, ShowSampleID
				Iniread, ShowCoated, data.ini, Locations, ShowCoated
				Iniread, VarBar_X, data.ini, Locations, VarBar_X
				Iniread, VarBar_Y, data.ini, Locations, Varbar_Y
				Iniread, MouseClip, data.ini, Locations, MouseClip
			; }
			If (X=Mouse)
			{
				coordmode, mouse, Screen
				MouseGetPos,MousePos_X,ypos,w,h
				coordmode, mouse, Window
				Varbar_X:=xpos
				varbar_y:=ypos
				IniWrite, %Varbar_X%, data.ini, Locations, VarBar_X
				IniWrite, %Varbar_y%, data.ini, Locations, VarBar_Y
				coordmode, mouse, Window
			}
			if (Destroy:="Reset")
				GUI, VarBar:destroy
			; WinGetPos, LMS_X, LMS_Y, LMS_W,LMS_H, NuGenesis LMS - \\Remote
			; Varbar_X := LMS_X+1000
			if MouseClip {
				try GUI,Varbar:destroy
				Gui Varbar:Default
				Gui VarBar: +AlwaysOnTop -Caption +ToolWindow +owner +HwndGUIID
				WinSet, Transparent, 190, AHK_id %GUIID%
					GUI,VarBar:Font,				s8 cBlack,arial Narrow
					Gui, VarBar:color, 			B39D1B
						Gui,VarBar:add,Text,	vClipboard 				 R3 x1 H19 y-3 w145 left,  						%Clipboard%     ; edit6
				; edit6
			} Else {
				Gui Varbar:Default
				Gui VarBar: +AlwaysOnTop -Caption +ToolWindow +owner
				WinSet, Transparent, 190, Varbar
				Gui, VarBar:color, 			21a366
				GUI,VarBar:Font,				s15 cBlack Bold, Consolas
				Gui,VarBar:Add,edit, 		vProduct 				gproductVarBar left h28 x1 y1 w58 ,				%Product%  ; edit1
				GUI,VarBar:Font,				s10 cBlack,Consolas
				Gui,VarBar:add,Edit,	 	vBatch 					gbatchVarbar H19 x60 y-2 w70 limit8, 						%Batch% 	 ; edit2
				GUI,VarBar:Font,				s9 cBlack , Consolas
				Gui,VarBar:add,Edit,	 	vlot 						gLotVarbar x60 center H18 y15 w70, 							%Lot% 		 ; edit3
				GUI,VarBar:Font,				s11 cBlack, Consolas

				Gui,VarBar:Add,text, 		vIteration x265 y15 w18,																	%Iteration%	; Text1
					if ShowCoated 
					{
						GUI,VarBar:Font,				s8 cBlack,arial Narrow
					Gui,VarBar:add,Edit,	 	vCoated 				gCoatedVarbar x131 H18 y15 w60, 					%Coated%   ; edit4
					GuiControl, Hide, Edit4
					; Gui,VarBar:delete,Edit,	 	  vNote2 					gNotevarbar x133 H19 y15 w130,							%Note2%  		; edit7
						; Gui,VarBar:add,Edit,	vNote1 					gNotevarbar x222 H19 y-3 w60 left, 						%Note1%     ; edit6
					} else {
						GUI,VarBar:Font,				s8 cBlack,arial Narrow
					Gui,VarBar:add,Edit,	 	  vNote2 					gNotevarbar x133 H19 y15 w130,							%Note2%  		; edit7
					}
					; If Coated
				; GUI,VarBar:Font,				s9 cBlack, Consolas
				; Gui,VarBar:Add,text, 		vMouseClip x210 y14 w30,																	MouseClip	; Text1
				; GUI,VarBar:Font,				s8 cBlack,.
				; GUI,VarBar:Font,				s7 cBlack,arial
					if ShowSampleID
					{
						Gui,VarBar:add,Edit,	 	vSampleID 			gSampleIDVarbar x131 H18 y-3 w80, 				%SampleID%  ; edit5
						; Gui,VarBar:add,Edit,	vNote1 					gNotevarbar x222 H19 y-3 w60 left, 						%Note1%     ; edit6
						Gui,VarBar:add,Edit,	vNote1 					gNotevarbar x222 H19 y-3 w60 left, 						%Note1%     ; edit6
					}
					else
						Gui,VarBar:add,Edit,	vNote1 					gNotevarbar x133 H19 y-3 w145 left,  						%Note1%     ; edit6
			; 
			}
			CoordMode, mouse, screen
			; WinGetPos, VarBar_X, VarBar_Y,,, NuGenesis LMS - \\Remote,
			; varbar_x:= Varbar_x +100
			try
				Gui, VarBar:Show, h31 x%VarBar_X% y%VarBar_y% w280 NoActivate, VarBar
			; Gui, VarBar:Show, h30 x%offset_X% y%offset_y% w320 NoActivate, VarBar
			catch
			{
				Gui, VarBar:Show, h31 x1 y%A_screenwidth% w280 NoActivate, VarBar
				IniWrite, 1, data.ini, Locations, VarBar_X
				IniWrite, 1, data.ini, Locations, VarBar_Y
			}
			CoordMode, mouse, window
			; if (Follow=1)
			ControlsetText, Static1, %Iteration%,VarBar
			WinSet, Transparent, 190, AHK_id %GUIID%
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
				sleep 100
				IniWrite, %Iteration%, data.ini, SavedVariables, Iteration
				IniWrite, %VarBar_X%, data.ini, Locations, VarBar_X
				IniWrite, %VarBar_y%, data.ini, Locations, VarBar_Y
				; IniWrite, %Follow%, data.ini, Locations, Follow
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
		sleep 100

		return
		}	


	Reset(){
		Global
		; GUI, VarBar:destroy
			; if !xpos 
		; IniWrite, %xpos%, data.ini, Locations, VarBar_X
			tooltip, Place bar
		if !winactive("NuGenesis = \\Remote"){
			coordmode, mouse, Screen
			keywait, F13, U
			MouseGetPos,xpos,ypos,w,h
			send, {laltup}
		} else {
			WinGetPos, LMS_X, LMS_Y, LMS_W,LMS_H, NuGenesis LMS - \\Remote
			xpos := LMS_X+1000
			ypos := LMS_Y
		}
		tooltip,
		IniWrite, %ypos%, data.ini, Locations, VarBar_Y
		IniWrite, %xpos%, data.ini, Locations, VarBar_X
		; Gui, VarBar:Show, h30 x%xpos% y%ypos% w390 NoActivate
		; IniWrite, 0, data.ini, Locations, Follow
		VarBar.show(0)
		coordmode, mouse, window
		; Varbar.Relocate()
		return
		}



		Follow(){
			global

		; Varbar.Follow(Wintitle)
		;  }
			; }
			return
		}

		Relocate(){
			global
			; OnMessage(0x201, "VarBar.Relocate")
			keywait, space, 
				; MouseClick, Left, , , 1, 0, D
				; MouseClick, WhichButton [, X, Y, ClickCount, Speed, D|U, R]
				; if !errorlevel
				; {
					; keywait, Lbutton, U
					; PostMessage, 0xA1, 2
					wingetpos, Varbar_X, Varbar_Y,W,H, VarBar ahk_class AutoHotkeyGUI
					IniWrite, %Varbar_X%, data.ini, Locations, VarBar_X
					IniWrite, %Varbar_Y%, data.ini, Locations, VarBar_Y
					; return
				; }
				; send, {ctrldown}{a}{ctrlup}
				; send, {ctrldown}{a}{ctrlup}
				; MouseClick, Left, , , 1, 0, U
				
			; Excel.Connect()
			sleep 300
			Follow:=0
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
		ControlsetText, Static1,%Iteration%,VarBar
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

	}
