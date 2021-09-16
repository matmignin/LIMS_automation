

#IfWinActive, VarBar ahk_exe AutoHotkey.exe 
	F19 & F20::Send, {tab}{shiftdown}{tab}{shiftup} ;varbar.focus("Batch")
	F19::varbar.focus("Product")
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
	numlock::
			MouseGetPos,,,,WinControl
			; ControlGetFocus,WinControl,VarBar ahk_exe AutoHotkey.exe
			msgbox, %Wincontrol%
			Send, ^{a}{backspace}{enter}

			ControlsetText, Wincontrol,,VarBar

	Return
		enter::
		Send, ^a
		clip()
		winactivate, NuGenesis LMS - \\Remote			
		LMS.Searchbar(clipboard,"{enter}")
	return
	Lbutton::click
#ifwinactive
	^left::Lms.SelectTab("Left")
	^right::LMs.SelectTab("right")

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

	mbutton::		Varbar.launchTable()
	WheelUp::      Varbar.AddIteration(500)
	up::				Varbar.AddIteration(2)
	down::   		Varbar.SubIteration(2)
	Wheeldown::    Varbar.SubIteration(500)
	F9::           Excel.connect()
	F7::           Excel.NextSheet()
	F6::           Excel.PrevSheet()
	esc::          varbar.reset()
	F21::          Spectab.Table()
	lalt::     		 Varbar.Reset()
	F20 & F19::
		IniWrite, 0, %A_ScriptDir%\ClipData\ClipChain\ClipChain.ini, Settings, ClipChainX
		IniWrite, 0, %A_ScriptDir%\ClipData\ClipChain\ClipChain.ini, Settings, ClipChainY
		; Send, {F22}
		return
	Rbutton::		menu.Varbar()	


	return
	numpaddot:: 	 Openapp.Workbook()

	
		; Mbutton::Notes.save()
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
				Iniread, Product, data.ini, Products, Product
	
				Iniread, Batch0, data.ini, SavedVariables, Batch0
				Iniread, Batch1, data.ini, SavedVariables, Batch1
				Iniread, SampleID, data.ini, SavedVariables, SampleID
				Iniread, Lot, data.ini, SavedVariables, Lot
				Iniread, Coated, data.ini, SavedVariables, Coated
			}
				iniread, note1, data.ini, SavedVariables, note1
				Iniread, note2, data.ini, SavedVariables, note2
				Iniread, Iteration, data.ini, SavedVariables, Iteration
				Iniread, ShowSampleID, data.ini, Options, ShowSampleID
				Iniread, ShowCoated, data.ini, Options, ShowSampleID
				Iniread, ShowCoated, data.ini, Options, ShowCoated
				Iniread, VarBar_X, data.ini, Locations, VarBar_X
				Iniread, VarBar_Y, data.ini, Locations, Varbar_Y
				Iniread, SwitchWorkSheets, data.ini, Options, SwitchWorkSheets
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
			; {
				Gui Varbar:Default
				Gui VarBar: +AlwaysOnTop -Caption +ToolWindow +owner +HwndGUIID
				WinSet, Transparent, 100, %GUIID%
				Gui, VarBar:color,DC734F, 97BA7F   
				; Gui, VarBar:color,016D07, 97BA7F   
				GUI,VarBar:Font,s16 cBlack Bold, Consolas
				Gui,VarBar:Add,edit, 		vProduct 				gproductVarBar left h27 x20 y0  w62 ,				%Product%  ; edit1
				GUI,VarBar:Font,s11 cBlack,Consolas
				Gui,VarBar:add,Edit,	 		vBatch 					gbatchVarbar left H27 x+1 y1 w73, 					%Batch% 	 ; edit2
				GUI,VarBar:Font,s10 cBlack , Consolas
				Gui,VarBar:add,Edit,	 		vlot 						gLotVarbar x+1 left H27 y1 w63, 				%Lot% 		 ; edit3
					GUI,VarBar:Font,s9 cBlack,arial Narrow
				if !Coated
					Gui,VarBar:add,Edit,	 	vCoated 					gCoatedVarbar left x+1 H27 y1 w23, 					%Coated%   ; edit4
				else
					Gui,VarBar:add,Edit,	 	vCoated 					gCoatedVarbar center x+1 H27 y1 w63, 					%Coated%   ; edit4
				if ShowSampleID
					Gui,VarBar:add,Edit,	 	vSampleID 				gSampleIDVarbar x+1 H27 y1 w83, 				%SampleID%  ; edit5
				else
					Gui,VarBar:add,Edit,	 	vSampleID 				gSampleIDVarbar x+1 H27 y1 w0, 				%SampleID%  ; edit5
			GUI,VarBar:Font,s20 107C41, Consolas
				; GUI,VarBar:Font,s19 cEF6950, Consolas
			Gui,VarBar:Add,text, vIteration x+5 65 center y-3 w23,											%Iteration%	; Text1
			GUI,VarBar:Font,s8.5 cBlack,arial Narrow
			Gui,VarBar:add,Edit,		vNote1 					gNotevarbar1  x+3 H27 y1 w150 right, 				%Note1%     ; edit6
			Gui,VarBar:add,Edit,	 	vNote2 					gNotevarbar2 X+2 H27 y1 w150 right,					%Note2%  	; edit7
			CoordMode, mouse, screen
			IfWinexist, NuGenesis LMS - \\Remote
				{
					WinGetPos, VarBar_X, VarBar_Y,,, NuGenesis LMS - \\Remote,
					varbar_x:= Varbar_x +700
					if ShowSampleID || !Coated
						Gui, VarBar:Show, h26 x%VarBar_X% y%VarBar_y% w700 NoActivate, VarBar
					else
					Gui, VarBar:Show, h26 x%VarBar_X% y%VarBar_y% w700 NoActivate, VarBar
					ActiveWin:="LMS"
			}
			else
			{
				MidScreen:=A_ScreenWidth /2
				Gui, VarBar:Show, h26 x%MidScreen% y1 w700 NoActivate, VarBar
				ActiveWin:="VScode"
			}
			CoordMode, mouse, window
			ControlsetText, Static1, %Iteration%,VarBar
			OnMessage(0x0201, "WM_LBUTTONDOWN")
			OnMessage(0x203, "VariableBar_Relocate")
			WinSet, Transparent, 235, AHK_id %GUIID%
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
			NoteVarBar1:
				sleep 100
				; keywait, enter
				Gui, VarBar:submit,NoHide
			return
			NoteVarBar2:
				sleep 100
				; keywait, enter
				Gui, VarBar:submit,NoHide
			return
			CoatedVarBar:
				sleep 100
				Gui, VarBar:submit,NoHide
				; varbar.Show()
			return

			
			VarBarGuiClose:
				coordmode, mouse, Screen
				; WinGetPos,VarBar_X,Varbar_Y,w,h
				sleep 100
				IniWrite, %Iteration%, data.ini, SavedVariables, Iteration
				IniWrite, %VarBar_X%, data.ini, Locations, VarBar_X
				IniWrite, %VarBar_y%, data.ini, Locations, VarBar_Y
				; IniWrite, %Follow%, data.ini, Locations, Follow
				this.exit()
				coordmode, mouse, Window
				sleep 500
				GUI, VarBar:destroy
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


	Reset(){
		Global
		; GUI, VarBar:destroy
			; if !xpos 
		; IniWrite, %xpos%, data.ini, Locations, VarBar_X
			tooltip, Place bar
		if !winactive("NuGenesis = \\Remote"){
			coordmode, mouse, Screen
			keywait, F13, U T5
			MouseGetPos,xpos,ypos,w,h
			Send, {laltup}
		} else {
			WinGetPos, LMS_X, LMS_Y, LMS_W,LMS_H, NuGenesis LMS - \\Remote
			xpos := LMS_X+1000
			ypos := LMS_Y
		}
		tooltip,
		IniWrite, %ypos%, data.ini, Locations, VarBar_Y
		IniWrite, %xpos%, data.ini, Locations, VarBar_X
		IniWrite, %Xpos%, %A_ScriptDir%\ClipData\ClipChain\ClipChain.ini, Settings, ClipChainX
		IniWrite, %Ypos%, %A_ScriptDir%\ClipData\ClipChain\ClipChain.ini, Settings, ClipChainY
		; Gui, VarBar:Show, h30 x%xpos% y%ypos% w390 NoActivate
		; IniWrite, 0, data.ini, Locations, Follow
		VarBar.show(0)
		coordmode, mouse, window
		; Varbar.Relocate()
		return
		}



		Follow(){
			global
			return
		}

		Relocate(){
			global
					PostMessage, 0xA1, 2
					keywait, Lbutton, U T5
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
		GuiControl, -redraw, varbar
		sleep 10
		Iteration+=1
		ControlsetText, Static1,%Iteration%,VarBar
		tt(Iteration,300,Varbar_x,Varbar_y,2,200)
		BlockInput, on
		sleep %Speed%
		BlockInput, off
		IniWrite, %Iteration%, data.ini, SavedVariables, Iteration
		GuiControl, +redraw, varbar
		return
		}
		SubIteration(speed:=350){
		global Iteration
		sleep 10
		Iteration-=1
		ControlsetText, Static1,%Iteration%,VarBar
		tt(Iteration,300,Varbar_x,Varbar_y,2,200)
		BlockInput, on
		sleep %speed%
		blockinput, off
		IniWrite, %Iteration%, data.ini, SavedVariables, Iteration
		return
		}

	Load(){
		Global
		; Iniread, Product, data.ini, SavedVariables, Product
		Iniread, Batch, data.ini, Batches, Batch
		Iniread, Product, data.ini, Products, Product
		Iniread, Product0, data.ini, Products, Product0
		Iniread, Product1, data.ini, Products, Product1
		Iniread, Product2, data.ini, Products, Product2
		Iniread, Product3, data.ini, Products, Product3
		Iniread, Batch4, data.ini, Batches, Batch4
		Iniread, Batch1, data.ini, Batches, Batch1
		Iniread, Batch2, data.ini, Batches, Batch2
		Iniread, Batch3, data.ini, Batches, Batch3
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
		wingetpos, Varbar_X, Varbar_Y,W,H, VarBar ahk_class AutoHotkeyGUI
		IniWrite, %Varbar_X%, data.ini, Locations, VarBar_X
		IniWrite, %Varbar_Y%, data.ini, Locations, VarBar_Y
		iniwrite, %Product%, data.ini, Products, Product
		iniwrite, %Batch%, data.ini, Batches, Batch
		; iniwrite, %Batch1%, data.ini, SavedVariables, Batch1
		; loop 3 {
			; n:=A_index
			; Item:=Product%n%
			; iniwrite, %Item%, data.ini, Products, Product%n%
			; Item:=Batch%n%
			; iniwrite, %Item%, data.ini, Batches, Batch%n%
			; }	
		; iniwrite, %Product0%, data.ini, Products, Product0
		; iniwrite, %Product1%, data.ini, Products, Product1
		; iniwrite, %Product2%, data.ini, Products, Product2
		; iniwrite, %Product3%, data.ini, Products, Product3
		; iniwrite, %Batch0%, data.ini, SavedVariables, Batch0
		iniwrite, %Lot%, data.ini, SavedVariables, Lot
		iniwrite, %Coated%, data.ini, SavedVariables, Coated
		iniwrite, %SampleID%, data.ini, SavedVariables, SampleID
		IniWrite, %Iteration%, data.ini, SavedVariables, Iteration
		IniWrite, %note1%, data.ini, SavedVariables, note1
		IniWrite, %note2%, data.ini, SavedVariables, note2
		iniwrite, %VarBar_Y%, data.ini, Locations, VarBar_Y
		iniwrite, %VarBar_X%, data.ini, Locations, VarBar_x
		FileRead, OutputVar, Products.txt  
		Sort, OutputVar, u
		FileDelete, Products.txt
		sleep, 300
		FileAppend, %OutputVar%, Products.txt
		Notes.Save()
		}

	}
			
			
			
Class Notes{
	Show(){  ;array - remove duplicates (case insensitive)
		global
		try, GUI, Notes:destroy
		Iniread, Notes_X, data.ini, Locations, Notes_X
		Iniread, Notes_Y, data.ini, Locations, Notes_Y
		my_screenwidth:=Notes_x
		my_screenheight:=Notes_y
		MyArray:=[]
		FileRead, LoadedNotes, lib/Notes.txt
		MyArray := StrSplit(LoadedNotes,"`r`n")
		; loop % myarray.maxindex() {
			; LoadedNotes1:=MyArray[A_index]
		; }
		LoadedNotes1:=MyArray[1]
		LoadedNotes2:=MyArray[2]
		LoadedNotes3:=MyArray[3]
		; LoadedNotes4:=MyArray[4]
		; LoadedNotes5:=MyArray[5]
		; LoadedNotes6:=MyArray[6]
		; LoadedNotes7:=MyArray[7]
		; LoadedNotes8:=MyArray[8]
		gui Notes:+LastFound +AlwaysOnTop -Caption -ToolWindow +owner
		gui, Notes:add, button, Hidden default gNotesButtonOK, OK 
		gui, Notes:add, edit, y2 x2 w140 -Choose -VScroll +resize vMyEdit1, %LoadedNotes1%
		; gui, Notes:add, edit, w140 -Choose -VScroll +resize vMyedit2, %LoadedNotes2%
		; gui, Notes:add, edit, w140 -Choose -VScroll +resize vMyedit3, %LoadedNotes3%
		loop 2 {
			n:=A_index + 1
			Myedit=myedit%n%
			Note:=myArray[n]
			gui, Notes:add, edit, w140 -Choose -VScroll +resize v%Myedit%, % myarray[n]	
		}
		; OnMessage(0x84, "WM_NCHITTEST")
		; OnMessage(0x83, "WM_NCCALCSIZE")
		gui, Notes:color, 21a366
		; OnMessage(0x203, "Notes.Relocate")
		Notes_x:=Varbar_x+136
		Notes_y:=Varbar_Y+30
		gui, Notes:show, w145 x%Notes_x% y%Notes_y% ,Notes
		WinSet, Transparent, 195
		return
		
	}
	Add(){
		global
		; notes.close()
		; notes.show
		; n:=4
		Myedit:="vmyedit4"
		loadedNotes:="loadednotes4"
			gui, Notes:add, edit, w140 -Choose -VScroll +resize %Myedit%, %LoadedNotes%
		return
		
		
	}

	close(){
		global
			gui, Notes:submit, nohide
	Filedelete, lib/Notes.txt
		sleep 200
		; loop 4
		IniWrite, %Notes_X%, data.ini, Locations, Notes_X
		IniWrite, %Notes_y%, data.ini, Locations, Notes_Y
		Fileappend, %MyEdit1%`n, lib/Notes.txt
		Fileappend, %MyEdit2%`n, lib/Notes.txt
		Fileappend, %Myedit3%`n, lib/Notes.txt
		; Fileappend, %Myedit4%`n, lib/Notes.txt
		; Fileappend, %Myedit5%`n, lib/Notes.txt
		gui, Notes:destroy
	return
	} 

		Save(){
			global
		gui, Notes:submit, nohide
		Filedelete, lib/Notes.txt
		sleep 200
		Fileappend, %MyEdit1%`n, lib/Notes.txt
		Fileappend, %MyEdit2%`n, lib/Notes.txt
		Fileappend, %Myedit3%`n, lib/Notes.txt
		; Fileappend, %Myedit4%`n, lib/Notes.txt
		; Fileappend, %Myedit5%`n, lib/Notes.txt
		; Fileappend, %Myedit6%`n, lib/Notes.txt
		; Fileappend, %Myedit7%`n, lib/Notes.txt
		; Fileappend, %Myedit8%`n, lib/Notes.txt
		; Fileappend, %Myedit9%`n, lib/Notes.txt
		; Fileappend, %Myedit10%`n, lib/Notes.txt
		gui, Notes:destroy
		return
	}

	Relocate(){
			global
			; PostMessage, 0xA1, 2
			; keywait, Lbutton, U
			wingetpos, Notes_x, Notes_y,W,H, Notes ahk_class AutoHotkeyGUI
			; Excel.Connect()
			IniWrite, %Notes_x%, data.ini, Locations, Notes_x
			IniWrite, %Notes_y%, data.ini, Locations, Notes_y
			sleep 300
			return
		}
	WM_NCCALCSIZE()
	{
		if A_Gui
			return 0    ; Sizes the client area to fill the entire window.
	}
	}

	; ButtonAdd:
		; gui, Notes:submit
		; sleep 100
		; Note:=RegExReplace(Note "`n", "m`a)(?=^\s*;).*\R") ; remove commented lines
		; Note:=RegExReplace(Note, "\R+\R", "`r`n")     ; remove empty lines
	NotesButtonOK:
		notes.Save()
		notes.Close()
		return
		
		NotesGuiClose:
		NotesGuiEscape:
		notes.Save()
		notes.Close()
		; gui, Notes:submit, nohide
		; gui, Notes:destroy
		return