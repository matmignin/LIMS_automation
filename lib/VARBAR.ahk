

Class VarBar{	
	Show(X:=1, Y:=1, Destroy:="Reset"){
			Global
				MidScreen:=A_ScreenWidth//2
				VarBar_H:=1
				VarBar_T:=235
				TopScreen:=1 ;A_ScreenHeight-35
			try Gui,VarBar:Destroy
			This.loadSavedVariables()
				Gui Varbar:Default
				Gui VarBar: +AlwaysOnTop -Caption +ToolWindow +owner +HwndGUIID 
				WinSet, Transparent, 100, %GUIID%
				Gui, VarBar:color,DC734F, 97BA7F     
				this.AddBoxes()
			CoordMode, mouse, screen
			IfWinexist, NuGenesis LMS - \\Remote
					LMS.Orient()
			Try Gui, VarBar:Show, h%varBar_H% x%Varbar_X% y%Varbar_y% w420 NoActivate, VarBar
		Catch 
			Gui, VarBar:Show, h%varBar_H% x%NuX%+500 y%Nuy% w420 NoActivate, VarBar
			; Gui, VarBar:Show, h%varBar_H% x%MidScreen% y%TopScreen% NoActivate, VarBar
		CoordMode, mouse, window
		ControlsetText, Static1, %Iteration%,VarBar
		OnMessage(0x0201, "WM_LBUTTONDOWN")
		OnMessage(0x203, "VariableBar_Relocate")
		WinSet, Transparent, %Varbar_T%, AHK_id %GUIID%
		return
	}
		AddEdit(Variable,Dimensions:="",Font:=""){
			global
				GUI,VarBar:Font,			 s%Font%  , consolas ;cBlack Bold, %Font%
				Gui,VarBar:Add,edit,		v%Variable% -wrap -multi	g%Variable%VarBar %Dimensions%,		%    %Variable% 
		}
		AddText(Variable,Dimensions:="",Font:=""){
			global
				GUI,VarBar:Font,			 s%Font%  ;cBlack Bold, %Font%
				Gui,VarBar:Add,Text,		v%Variable% 	%Dimensions%,		%    %Variable%  
		}
	AddBoxes(){
			global
			this.AddEdit("Product",	"left h29 x20 y0 w65",			"16 Bold")
			this.AddEdit("Batch",		"left h29 x+1 y1 w75", 			"11,Consolas")
						If !Lot
				 L_L:="w25"
			else 
					L_L:=
			this.AddEdit("Lot",			"left h29 x+1 y1 " L_L, 			"11, Consolas")
			If !Coated
				 C_L:="w25"
			else 
					C_L:=
				this.AddEdit("Coated",	"left h29 x+1 y1 " c_L,			"9, Arial Narrow")
			if ShowSampleID
			this.AddEdit("SampleID","H29 x+1 y1 w85",					"9, Arial Narrow")
			else
			this.AddEdit("SampleID","H29 x+1 y1 w0",					"9, Arial Narrow")
		; GUI,VarBar:Font,			
		This.AddText("Iteration","x+5 center y-3 w23",		"20 Bold 107C41, Consolas")	; Text1
		
		If !Note2
			Note2:="+"
		If !Note3
			Note3:="+"
		If !Note4
			Note4:="+"
		if !note1 || Note1="+"

			This.addedit("Note1","x+3 H29 y1 left" ,"9 cBlack,arial Narrow") ; edit6
		If Note1 
			This.addedit("Note2","X+2 H29 y1 left","9")			; edit7
		If Note2 && Note2!="+"
			This.addedit("Note3","X+2 H29 y1 left","9")				; edit8
		If Note3 && Note3!="+"
			This.addedit("Note4","X+2 H29 y1 left","9")		;edit9

			GUI,VarBar:Font,			 s9, Arial Narrow 
			Gui,VarBar:Add,edit,		vCurrentCodes +wrap gCurrentCodesVarbar x20 H30 y+2, %CurrentCodes% ; edit10
				;This.AddEdit("CurrentCodes","x20 H29 y+2") ; edit10
		Return
		
			ProductVarBar:
			BatchVarBar:
			LotVarBar:
			SampleIDVarBar:
			Note1VarBar:
			Note2VarBar:
			Note3VarBar:
			Note4VarBar:
			CoatedVarBar:
			CurrentCodesVarbar:
			sleep 100
			Gui, VarBar:submit,NoHide
					; WinGetPos, ,, varbar_W, Varbar_H, VarBar ahk_class AutoHotkeyGUI
						; NewWidth := Varbar_W - 30
						; NewHeight := Varbar_H - 20
						; tt(A_GuiWidth)
						; GuiControl, Move, CurrentCodes, W%NewWidth% H%NewHeight%
			return

			VarBarGuiClose:
				coordmode, mouse, Screen
				WinGetPos,VarBar_X,Varbar_Y,w,h
				sleep 100
				this.exit()
				coordmode, mouse, Window
				sleep 500
			return
		}



	loadSavedVariables(){
					global
			if !WinExist("LMS Workbook.xlsb"){
				Iniread, Batch, data.ini, SavedVariables, Batch
				Iniread, Product, data.ini, Products, Product
				Iniread, Batch0, data.ini, SavedVariables, Batch0
				Iniread, Batch1, data.ini, SavedVariables, Batch1
				Iniread, SampleID, data.ini, SavedVariables, SampleID
				Iniread, Lot, data.ini, SavedVariables, Lot
				Iniread, Coated, data.ini, SavedVariables, Coated
				; FileRead, CurrentCodes, CurrentCodes.txt 
				}
				Iniread, CurrentCodes, data.ini, SavedVariables, CurrentCodes
				Iniread, Iteration, data.ini, SavedVariables, Iteration
				Iniread, ShowSampleID, data.ini, Options, ShowSampleID
				Iniread, ShowCoated, data.ini, Options, ShowSampleID
				Iniread, ShowNote3, data.ini, Options, ShowNote3
				Iniread, SwitchWorkSheets, data.ini, Options, SwitchWorkSheets
				iniread, note1, data.ini, Notes, note1
				Iniread, note2, data.ini, Notes, note2
				Iniread, note3, data.ini, Notes, note3
				Iniread, note4, data.ini, Notes, note4
			}

	exit(){
		global

		wingetpos, Varbar_X, Varbar_Y,,, VarBar ahk_class AutoHotkeyGUI
		ControlGetText, Note1, Edit6, VarBar
		ControlGetText, Note2, Edit7, VarBar
		ControlGetText, Note3, Edit8, VarBar
		ControlGetText, Note4, Edit9, VarBar
		;ControlGetText, %CurrentCodes%, Edit10, VarBar
		IniWrite, %Varbar_X%, data.ini, Locations, VarBar_X
		IniWrite, %Varbar_Y%, data.ini, Locations, VarBar_Y
		iniwrite, %Product%, data.ini, Products, Product
		iniwrite, %Batch%, data.ini, Batches, Batch
		iniwrite, %Lot%, data.ini, SavedVariables, Lot
		iniwrite, %Coated%, data.ini, SavedVariables, Coated
		iniwrite, %SampleID%, data.ini, SavedVariables, SampleID
		IniWrite, %Iteration%, data.ini, SavedVariables, Iteration
		IniWrite, %CurrentCodes%, data.ini, SavedVariables, CurrentCodes
		IniWrite, %note1%, data.ini, Notes, note1
		IniWrite, %note2%, data.ini, Notes, note2
		IniWrite, %note3%, data.ini, Notes, note3
		IniWrite, %note4%, data.ini, Notes, note4
		IniWrite, %EnteringRotations%, data.ini, Options, EnteringRotations
		}



			
		

      FloatAtopWindow(FloatTime:=""){
			Global Varbar_X, Varbar_Y
    	  wingetpos, Varbar_X, Varbar_y, Varbar_w, Varbar_h, VarBar ahk_exe AutoHotkey.exe
      WinGetPos, VarBar_oX, VarBar_oY, Varbar_oW,Varbar_oH, A
      WinMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,varbar_oX+100, Varbar_oy
        WinWaitNotActive,  ;- \\Remote,, 20, NuGenesis LMS - \\Remote
				WinMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,varbar_x, Varbar_y
    }
		
		
		
		
		



	Reset(){
		Global
			tt("Place bar")
		if !winactive("NuGenesis = \\Remote"){
			coordmode, mouse, Screen
			keywait, F13, U T2
			MouseGetPos,Varbar_X,Varbar_Y
			Send, {laltup}
		} 
		else {
			WinGetPos, LMS_X, LMS_Y, LMS_W,LMS_H, NuGenesis LMS - \\Remote
			xpos := LMS_X+1000
			ypos := LMS_Y
		}
		tooltip,
		IniWrite, %ypos%, data.ini, Locations, VarBar_Y
		IniWrite, %xpos%, data.ini, Locations, VarBar_X
		IniWrite, %Xpos%, %A_ScriptDir%\ClipData\ClipChain\ClipChain.ini, Settings, ClipChainX
		IniWrite, %Ypos%, %A_ScriptDir%\ClipData\ClipChain\ClipChain.ini, Settings, ClipChainY

		VarBar.show(0)
		coordmode, mouse, window
		return
		}


		
	Focus(Control){
		global
		WinGetTitle, the_WinTitle, A
		caret_x:=A_CaretX
		caret_y:=A_Carety
		WinActivate, VarBar ahk_exe AutoHotkey.exe
		GuiControl Varbar:Focus, %Control%
		; sleep 100
		SendInput, ^{a}{ctrlup}{altup}
		return
		}	

	Relocate(){
		global
				PostMessage, 0xA1, 2
				; keywait, Lbutton, U T2
					Send, ^a
		return
	}
		

	LaunchTable(){
		global
		try GUI ingredient_table:destroy
		try GUI Spec_table:destroy
		excel.connect(1)
		if winexist("Result Editor - \\Remote") || Winactive("Test Definition Editor - \\Remote") || winactive("Results Definition - \\Remote")
			SpecTab.Table()
		if winexist("Composition - \\Remote") || WinActive("Edit Ingredient - \\Remote")
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

		AddIteration(speed:=350){
		global Iteration
		; GuiControl, -redraw, varbar
		sleep 10
		Iteration+=1
		ControlsetText, Static1,%Iteration%,VarBar
		Pop(Iteration)
		; tt(Iteration,300,Varbar_x,Varbar_y,2,200)
		sleep %Speed%
		IniWrite, %Iteration%, data.ini, SavedVariables, Iteration
		; GuiControl, +redraw, varbar
		return
		}
		SubIteration(speed:=350){
		global Iteration
		; GuiControl, -redraw, varbar
		sleep 10
		Iteration-=1
		ControlsetText, Static1,%Iteration%,VarBar
		; tt(Iteration,300,Varbar_x,Varbar_y,2,200)
		Pop(Iteration)
		sleep %speed%
		IniWrite, %Iteration%, data.ini, SavedVariables, Iteration
		; GuiControl, +redraw, varbar
		return
		}

	

HistoryMenuItem(){
	global
	sleep 200
	RegExMatch(A_ThisMenuItem, "i)[abdefghijkl]\d{3}\b", rProduct)
	ControlsetText, Edit1,%rProduct%, VarBar
	RegExMatch(A_ThisMenuItem, "i)(?<!Ct#)\b\d{3}-\d{4}\b", rBatch)
	ControlsetText, Edit2,%rBatch%, VarBar
	RegExMatch(A_ThisMenuItem, "i)(\b\d{4}\w\d\w?|\bBulk\b)", rlot)
	ControlsetText, Edit3,%rLot%, VarBar
	RegExMatch(A_ThisMenuItem, "i)(coated: |/?ct#/s|Ct#|ct/s|coated/s)\d{3}-\d{4}\b", rCoated)
	RegExMatch(rCoated,   "\d{3}-\d{4}", rCoated)
	ControlsetText, Edit4,%rCoated%, VarBar 
	Product:=rProduct
	Batch:=rBatch
	Lot:=rLot
	Coated:=rRoated 
	return
	}
	}
			
			
;; ___KEYBINDINGS
	#IfWinActive, VarBar ahk_exe AutoHotkey.exe 
		F19 & F20::Send, {tab}{shiftdown}{tab}{shiftup} ;varbar.focus("Batch")
	;	F19::varbar.focus("Product")
		; F20::varbar.focus("Batch")
		^enter::                           
								winactivate, %the_WinTitle%
								click, %caret_X%, %caret_y%
								return
		; mbutton::
					; Click
					; if Toggle := !Toggle
					;  Notes.SHow()
					; else
						; notes.Save()
					; return
		Mbutton::
			click
		enter::
			ControlGetFocus,WinControl,VarBar ahk_exe AutoHotkey.exe	
			if (WinControl="Edit1") || (WinControl="Edit2") || (WinControl="Edit3") ||(WinControl="Edit4"){
						Send, ^a^c
						winactivate, NuGenesis LMS - \\Remote			
				LMS.Searchbar(clipboard,"{enter}")
			}
			if (WinControl="Edit6") || (WinControl="Edit7") || (WinControl="Edit8") || (WinControl="Edit9")
				varbar.show()
			return
		Lbutton::click
	#ifwinactive
		; ^left::Lms.SelectTab("Left")
		; ^right::LMs.SelectTab("right")

	#If MouseIsOver("VarBar ahk_exe AutoHotkey.exe")
		; wheelleft::    Excel.PrevSheet()
		; wheelRight::   excel.Nextsheet()
		+Mbutton::
				MouseGetPos,,,,WinControl
				; ControlGetFocus,WinControl,VarBar ahk_exe AutoHotkey.exe
				if (WinControl="Edit1"){
					Product1:=Product
					if Toggle := !Toggle
						GuiControl, Varbar:Text, Product,%Product1%
					else
						GuiControl, Varbar:Text, Product,%Product0%
					}
				if (WinControl="Edit2"){
					Batch:=Batch0
					}
				if (WinControl="Edit3"){
					GuiControl, Varbar:Text, Lot,%Lot%
					}
				if (winControl="Edit4") {
					GuiControl, Varbar:Text, Coated,%Coated%
				}
				return
		Mbutton::
			MouseGetPos,,,,WinControl
				if (WinControl="Edit1") || (WinControl="Edit2") || (WinControl="Edit3"){
					click
					Send, ^a
					clip.regex()
					winactivate, NuGenesis LMS - \\Remote			
					LMS.Searchbar(clipboard,"{enter}")
					return
				}
				else if (winControl="Edit6") 
					TT(Wincontrol)
				else
					menu.varbar()
				return



		WheelUp::      send % Blockrepeat(600) Varbar.AddIteration()
		Wheeldown::    send % Blockrepeat(600) Varbar.SubIteration()
		; wheelright::	Varbar.AddIteration(0)
		; Wheelleft::   	Varbar.SubIteration(0)
		up::				Varbar.AddIteration(0)
		down::   		Varbar.SubIteration(0)
		F9::           Excel.connect()
		F7::           Excel.NextSheet()
		F6::           Excel.PrevSheet()
		F8::				Varbar.launchTable()
		Numlock::				send, {click}^a
			return
		Rbutton::		
		MouseGetPos,,,,WinControl
				if (WinControl="Edit1")
					menu.Products()	
				if (WinControl="Edit2") || (WinControl="Edit3")
					menu.Batches()
				If (WinControl="Edit4")
					menu.SetStatus()
				if (winControl="Edit6") {
					Gui,VarBar:add,Edit,		vNote2 		gNotevarbar2 		    W10 X+2 H29 y1 left,			  %Note2%
					; IniWrite, _, data.ini, Notes, note2
					varbar.show()
					; GuiControl, Varbar:Text, Coated,%Coated%
				}
				if (winControl="Static1") || (winControl="")
					menu.Varbar()

			return
		numpaddot:: 	 Openapp.Workbook()
	#if

  WM_LBUTTONDOWN(wParam, lParam){
				X := lParam & 0xFFFF
				Y := lParam >> 16
				if A_GuiControl
					Ctrl := "`n(in control " . A_GuiControl . ")"
				PostMessage, 0xA1, 2
				wingetpos, Varbar_X, Varbar_Y,W,H, VarBar ahk_class AutoHotkeyGUI
		return
} 
