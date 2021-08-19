
#IfWinActive, VarBar ahk_exe AutoHotkey.exe 
	F19 & F20::send, {tab}{shiftdown}{tab}{shiftup} ;varbar.focus("Batch")
	F19::varbar.focus("Product")
	F20::varbar.focus("Batch")
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
	enter::
	send, ^a
	clip()
	winactivate, NuGenesis LMS - \\Remote			
	LMS.Searchbar(clipboard,"{enter}")
	return
	#ifwinactive
	^left::Lms.SelectTab("Left")
	^right::LMs.SelectTab("right")

#If MouseIsOver("VarBar ahk_exe AutoHotkey.exe")
	; wheelleft::    Excel.PrevSheet()
	; wheelRight::   excel.Nextsheet()
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
	F21 & F20::    ProductTab.Table()
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
				Iniread, EnteringProduct, data.ini, Locations, EnteringProduct
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
			; if MouseClip {
			; 	try GUI,Varbar:destroy
			; 	Gui Varbar:Default
			; 	Gui VarBar: +AlwaysOnTop -Caption +ToolWindow +owner +HwndGUIID
			; 	WinSet, Transparent, 190, AHK_id %GUIID%
			; 		GUI,VarBar:Font,				s8 cBlack,arial Narrow
			; 		Gui, VarBar:color, 			B39D1B
			; 		Gui,VarBar:Add,text, 		vIteration x265 y15 w18,																	%Iteration%	; Text1	
			; 		Gui,VarBar:add,Text,	vClipboard 				 R3 x1 H19 y-3 w145 left,  						%Clipboard%     ; edit6
			; 	; edit6
			; } 
			; Else 
			; {
				Gui Varbar:Default
				Gui VarBar: +AlwaysOnTop -Caption +ToolWindow +owner +HwndGUIID
				; WinSet, Transparent, 300, %GUIID%
				Gui, VarBar:color,016D07, 97BA7F   
				GUI,VarBar:Font,s13 cBlack Bold, Consolas
				Gui,VarBar:Add,edit, 		vProduct 				gproductVarBar left h21 x1 y0  w50 ,				%Product%  ; edit1
				GUI,VarBar:Font,s10 cBlack,Consolas
				Gui,VarBar:add,Edit,	 		vBatch 					gbatchVarbar left H20 x+1 y1 w70, 					%Batch% 	 ; edit2
				GUI,VarBar:Font,s9 cBlack , Consolas
				Gui,VarBar:add,Edit,	 		vlot 						gLotVarbar x+1 left H20 y1 w60, 				%Lot% 		 ; edit3
				if ShowCoated || Coated
					{
					GUI,VarBar:Font,s7.5 cBlack,arial Narrow
						Gui,VarBar:add,Edit,	 	vCoated 					gCoatedVarbar center x+1 H20 y1 w60, 					%Coated%   ; edit4
					Gui,VarBar:add,Edit,	vNote1 						gNotevarbar X+8 H20 y1 w70 right,  			%Note1%     ; edit6
					; if Coated
						; Gui,VarBar:add,Edit,	 	vCoated 					gCoatedVarbar left x71 H18 y-2 w60, 					Ct# %Coated%   ; edit4
				} else {
					GUI,VarBar:Font,s7.5 cBlack,arial Narrow
					Gui,VarBar:add,Edit,		vNote1 					gNotevarbar  x+3 H20 y1 w70 right, 				%Note1%     ; edit6
					}
				if ShowSampleID
					{
					GuiControl, Hide,Edit5
					Gui,VarBar:add,Edit,	 	vSampleID 				gSampleIDVarbar x131 H18 y1 w80, 				%SampleID%  ; edit5
					}
				else
					Gui,VarBar:add,Edit,	 	vNote2 					gNotevarbar  X+0 H20 y1 w150 right,					%Note2%  	; edit7
				GUI,VarBar:Font,s18 cEF6950, Consolas
				Gui,VarBar:Add,text, 		vIteration x+5 65 center y-4 w23,											%Iteration%	; Text1
			; }
			; Gui, Varbar:Color,, 00FFFF
			CoordMode, mouse, screen
			; WinGetPos, VarBar_X, VarBar_Y,,, NuGenesis LMS - \\Remote,
			; varbar_x:= Varbar_x +100
			try
				Gui, VarBar:Show, h22 x%VarBar_X% y%VarBar_y% w510 NoActivate, VarBar
			; Gui, VarBar:Show, h30 x%offset_X% y%offset_y% w320 NoActivate, VarBar
			catch
			{
				Gui, VarBar:Show, h25 x1 y%A_screenwidth% w510 NoActivate, VarBar
				IniWrite, 1, data.ini, Locations, VarBar_X
				IniWrite, 1, data.ini, Locations, VarBar_Y
			}
			CoordMode, mouse, window
			; if (Follow=1)
			ControlsetText, Static1, %Iteration%,VarBar
			OnMessage(0x0201, "WM_LBUTTONDOWN")
			OnMessage(0x203, "VariableBar_Relocate")
			WinSet, Transparent, 225, AHK_id %GUIID%
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
		sendinput, ^{a}{ctrlup}{altup}
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
			; OnMessage( 0x201, "VarBar.Relocate")
			; keywait, space, 
				; MouseClick, Left, , , 1, 0, D
				; MouseClick, WhichButton [, X, Y, ClickCount, Speed, D|U, R]
				; if !errorlevel
				; {
					; keywait, Lbutton, U
					PostMessage, 0xA1, 2
					keywait, Lbutton, U
					 send, ^a
					; wingetpos, Varbar_X, Varbar_Y,W,H, VarBar ahk_class AutoHotkeyGUI
					; IniWrite, %Varbar_X%, data.ini, Locations, VarBar_X
					; IniWrite, %Varbar_Y%, data.ini, Locations, VarBar_Y
					; return
				; }
				; send, {ctrldown}{a}{ctrlup}
				; send, {ctrldown}{a}{ctrlup}
				; MouseClick, Left, , , 1, 0, U
				
			; Excel.Connect()
			; sleep 300
			; Follow:=0
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
		wingetpos, Varbar_X, Varbar_Y,W,H, VarBar ahk_class AutoHotkeyGUI
		IniWrite, %Varbar_X%, data.ini, Locations, VarBar_X
		IniWrite, %Varbar_Y%, data.ini, Locations, VarBar_Y
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