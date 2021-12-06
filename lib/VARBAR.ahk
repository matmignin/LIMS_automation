#include <BatchesDDL>

Class VarBar{	
	Show(X:=1, Y:=1, Destroy:="Reset"){
			Global
				TopScreen:=1 ;A_ScreenHeight-35
				MidScreen:=A_ScreenWidth//2
				VarBar_H=1
				VarBar_T:=235
				VarBar_W=450
			try Gui,VarBar:Destroy
			This.loadSavedVariables()
				Gui Varbar:Default
				Gui VarBar: +AlwaysOnTop -Caption +ToolWindow +owner +HwndGUIID 
				WinSet, Transparent, 100, %GUIID%
				This.SetColor()
		
				this.AddBoxes()
			CoordMode, mouse, screen
			IfWinexist, NuGenesis LMS - \\Remote
			LMS.Orient()
			Gui, VarBar:Show,  x%Varbar_X% y%Varbar_y% w%VarBar_w% h%varbar_H% NoActivate, VarBar
		CoordMode, mouse, window
		ControlsetText, Static1, %Iteration%,VarBar
		OnMessage(0x0201, "WM_LBUTTONDOWN")
		; OnMessage(0x203, "VariableBar_Relocate")
		OnMessage(0x002C, "ODDDL_MeasureItem") ; WM_MEASUREITEM
		OnMessage(0x002B, "ODDDL_DrawItem")    ; WM_DRAWITEM
		WinSet, Transparent, %Varbar_T%, AHK_id %GUIID%
		return
	}

	AddBoxes(){
			global
			this.AddEdit("Product",	"left h29 x10 y1 w65",			"16 Bold")
			this.AddEdit("Batch",		"left h29 x+1 y1 w85", 			"12,Consolas")
			If !Lot
				 L_L:="w60"
			else 
					L_L:=
			this.AddEdit("Lot",			"left h29 x+1 y1 " L_L , 			"9, Consolas")
			If !Coated
				 C_L:="w45"
			else 
					C_L:=
				this.AddEdit("Coated",	"left h29 x+1 y1 " c_L,			"9, Arial Narrow")
			This.AddText("Iteration","x+5 center y-3 w23",		"20 Bold 107C41, Consolas")	; Text1
			This.addedit("Note1","x+3 H29 y1 w150 left" ,"9 cBlack,arial Narrow") ; edit6
			this.AddBatchesDDL()
; 
						; edit7
			Gui, VarBar:add, Checkbox, x10 y+5 vExcelConnect gExcelConnectCheck Checked%ExcelConnect%, Excel-Link
		;	Gui, Varbar:add, DDL, x+3 Y65 vMode gModeDDL, |EnteringRotations|SwitchWorkSheets|TempCode|Debugging
			; GuiControl, ChooseString, ComboBox1, %Mode%

			if ShowSampleID
				this.AddEdit("SampleID","x+1 w85",					"9, Arial Narrow")
			else
				this.AddEdit("SampleID"," x+1 w0",					"9, Arial Narrow")		

		Return
		
		ModeDDL:
		Gui, VarBar:submit,NoHide
		sleep 200
		This.Setcolor()
		IniWrite, %Mode%, Settings.ini, Options, Mode
			sleep 200
		return

			DDLVarbar:
			Gui, VarBar:submit,NoHide
			this.updateWith(DDL)
			return 

			ExcelConnectCheck:
			ProductVarBar:
			BatchVarBar:
			LotVarBar:
			SampleIDVarBar:
			Note1VarBar:
			Note2VarBar:
			Note3VarBar:
			CoatedVarBar:
			Gui, VarBar:submit,NoHide
			sleep 100
			; if ExcelConnect
				; excel.Connect(1)
			this.SaveVariables()
			return

			VarBarGuiClose:
			VarBarGuiEscape:
				sleep 100
				this.SaveVariables()
			return
		}

UpdateWith(Input){
			Global
		; Clipboard:=DDL
		; RegExMatch(Input, "i)(?<Product>([abdefghijkl]\d{3})?).?(?<Batch>(\d{3}-\d{4})?).?(?<Lot>(\d{4}\w\d\w?|Bulk|G\d{7}\w?)?).?(Ct#)?(?<Coated>(\d{3}-\d{4})?)", s)
				RegexMatch(Input, "i)[abdefghijkl]\d{3}", VarProduct)
        RegexMatch(Input, "i)(?<!Ct#)\d{3}-\d{4}\b", VarBatch)
        RegexMatch(Input, "i)\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b", VarLot)
        RegExMatch(Input, "i)(coated: |ct#\s|Ct#|ct\s|coated\s)(?P<Coated>\d{3}-\d{4})", Var)
		Product:=VarProduct
		Batch:=VarBatch
		lot:=Varlot
		Coated:=VarCoated
		; String:=Trim(Product " " Batch " " Lot " " Coated)
		GuiControl,Varbar:Text, Product, %VarProduct%
		GuiControl,Varbar:Text, Batch, %VarBatch%
		GuiControl,Varbar:Text, lot, %Varlot%
		GuiControl,Varbar:Text, Coated, %VarCoated%
		; GuiControl, MoveDraw, DDL
		try XL.Sheets(VarProduct).activate
		return
		}

AddBatchesDDL(){
   global
		CurrentCodes =  
		loop, read, Data\CurrentCodes.txt
			CurrentCodes .= A_LoopReadLine "|"
		Gui, Varbar:Add, DDL, x1 y+1 w200 vDDL gDDLVarbar hwndHDDL +0x0210, %Product%||%CurrentCodes%
}

		AddEdit(Variable,Dimensions:="",Font:=""){
			global
				GUI,VarBar:Font,			 s%Font%  , consolas ;cBlack Bold, %Font%
				Gui,VarBar:Add,edit,		v%Variable% +wrap -multi	g%Variable%VarBar %Dimensions%,		%    %Variable% 
		}
		AddText(Variable,Dimensions:="",Font:=""){
			global
				GUI,VarBar:Font,			 s%Font%  ;cBlack Bold, %Font%
				Gui,VarBar:Add,Text,		v%Variable% 	%Dimensions%,		%    %Variable%  
		}

Menu(){
  global
	MouseGetPos,,,,WinControl
  try Menu, VarBarmenu, DeleteAll
	    HideVarBar:=CreateMenu("showVarbar","VarBarMenu")
    Menu, VarBarMenu, Add,		 		Show&SampleID, 					ShowSampleID 
      if ShowSampleID=1  
        menu, VarBarmenu, Check, 	Show&SampleID
    Menu, VarBarMenu, Add,		 		Tables, 					Varbar.LaunchTable 
		
		If WinExist("Mats LMS Workbook.xlsb - Excel"){ 
			Menu,VarBarMenu,add,				&Spec Table,						Tests
			Menu,VarBarMenu,add,				&Ingredient Table,			Tests
		}
  Try Menu,VarBarmenu,show
  }

SetColor(){
			global
		; GuiControl, -redraw, varbar
		if (A_mode=="TempCode")
			Gui, VarBar:color,272822, FFFFFF     
		else If (Mode=="Debugging")
			Gui, VarBar:color,272822, 808000 ;pink
		else if WinExist("Mats LMS Workbook.xlsb - Excel")
			excel.matchcolor()
		else
			Gui, VarBar:color,DC734F, 97BA7F
		; GuiControl, +redraw, varbar
		} 

HoverAction(Size:=90){
  global
	If (MouseIsOver("VarBar ahk_exe AutoHotkey.exe") && Varbar_H!=Size ){
		; ControlGetFocus, GUIFocus, VarBar
    VarBar_H:=Size
    WinMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%VarBar_H%
	}
	If !(MouseIsOver("VarBar ahk_exe AutoHotkey.exe") && Varbar_H!=32 ){
		ControlGetFocus, GUIFocus, VarBar
		if GUIFocus
			VarBar_H:=90
		else 
			VarBar_H:=32
    WinMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%VarBar_H%
	}
}


	loadSavedVariables(){
		global
		if !WinExist("Mats LMS Workbook.xlsb") || !ExcelConnect { ;|| !RegexMatch(XL.ActiveSheet.Name, "i)[abdefghijkl]\d{3}"){
			Iniread, Batch, Settings.ini, SavedVariables, Batch
			Iniread, Product, Settings.ini, Products, Product
			Iniread, Batch0, Settings.ini, SavedVariables, Batch0
			Iniread, Batch1, Settings.ini, SavedVariables, Batch1
			Iniread, Lot, Settings.ini, SavedVariables, Lot
			Iniread, ShowCoated, Settings.ini, Options, ShowSampleID
			Iniread, Coated, Settings.ini, SavedVariables, Coated
			}
			
			IniRead, Varbar_X, Settings.ini, Locations, VarBar_X
			IniRead, Varbar_Y, Settings.ini, Locations, VarBar_Y
			Iniread, Iteration, Settings.ini, SavedVariables, Iteration
			Iniread, ShowSampleID, Settings.ini, Options, ShowSampleID
			Iniread, ShowNote3, Settings.ini, Options, ShowNote3
			If ShowSampleID
				Iniread, SampleID, Settings.ini, SavedVariables, SampleID

			iniread, note1, Settings.ini, Notes, note1
			Iniread, note2, Settings.ini, Notes, note2
			Iniread, ExcelConnect, Settings.ini, Options, ExcelConnect
			Iniread, Mode, Settings.ini, Options, Mode
			Products:=[]
        FileRead, LoadedNotes, Data\CurrentCodes.txt
        Products := Trim(StrSplit(LoadedNotes,"`r`n"))
		}


	SaveVariables(){
		global
		if RegExMatch(Product, "i)[abdefghijkl]\d{3}")
			iniwrite, %Product%, Settings.ini, Products, Product
		if Batch
			iniwrite, %Batch%, Settings.ini, Batches, Batch
		if Lot
			iniwrite, %Lot%, Settings.ini, SavedVariables, Lot
		if Coated
			iniwrite, %Coated%, Settings.ini, SavedVariables, Coated
		if SampleID
			iniwrite, %SampleID%, Settings.ini, SavedVariables, SampleID
		if Iteration
			IniWrite, %Iteration%, Settings.ini, SavedVariables, Iteration
		; if CurrentCodes
			; IniWrite, `n%CurrentCodes%, Data\Products.ini, %The_Day%, %The_Hour%
		if Note1
			IniWrite, %note1%, Settings.ini, Notes, note1
		if Note2
			IniWrite, %note2%, Settings.ini, Notes, note2
			IniWrite, %Mode%, Settings.ini, Options, Mode
			IniWrite, %ExcelConnect%, Settings.ini, Options, ExcelConnect
		RemoveFileDuplicates("C:\Users\mmignin\Documents\VQuest\Data\CurrentCodes.txt")
		; if Note3
			; IniWrite	, %note3%, Settings.ini, Notes, note3
		}



			
		

      FloatAtopWindow(FloatTime:=""){
			Global Varbar_X, Varbar_Y
    	  wingetpos, Varbar_X, Varbar_y, Varbar_w, Varbar_h, VarBar ahk_exe AutoHotkey.exe
      WinGetPos, VarBar_oX, VarBar_oY, Varbar_oW,Varbar_oH, A
      WinMove, VarBar ahk_class VarBar ahk_exe AutoHotkey.exe, ,varbar_oX+100, Varbar_oy
        WinWaitNotActive,  ;- \\Remote,, 20, NuGenesis LMS - \\Remote
				WinMove, VarBar ahk_class VarBar ahk_exe AutoHotkey.exe, ,varbar_x, Varbar_y
    }
		
		
		
		
		



	Reset(){
		Global
			coordmode, mouse, Screen
			; keywait, Lbutton, U T2
			MouseGetPos,Varbar_X,Varbar_Y
		; tooltip,
		IniWrite, %VarBar_y%, Settings.ini, Locations, VarBar_Y
		IniWrite, %varbar_x%, Settings.ini, Locations, VarBar_X
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
		SendInput, ^{a}
		return
		}	

	Relocate(){
		global
				PostMessage, 0xA1, 2
				keywait, Lbutton, U T2
					Send, ^a
		return
	}
		

	LaunchTable(){
		global
		try GUI ingredient_table:destroy
		try GUI Spec_table:destroy
		excel.connect(1)
		ifwinnotactive, ahk_exe WFICA32.EXE 
		winactivate, ahk_exe WFICA32.EXE
		lms.DetectTab()
		if winexist("Result Editor - \\Remote") || Winactive("Test Definition Editor - \\Remote") || winactive("Results Definition - \\Remote") || (Tab="Specs")
			SpecTab.Table()
		if winexist("Composition - \\Remote") || WinActive("Edit Ingredient - \\Remote") || (Tab="Products")
			ProductTab.Table()
		else {
				Menu.Tables()
			; If (Tab="Products")
				; ProductTab.Table()
			; else If (Tab="Specs")
				; SpecTab.Table()
			; else	
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
		IniWrite, %Iteration%, Settings.ini, SavedVariables, Iteration
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
		IniWrite, %Iteration%, Settings.ini, SavedVariables, Iteration
		; GuiControl, +redraw, varbar
		return
		}

	

HistoryMenuItem(){
	global Product, Batch, Lot, Coated,
	sleep 200
	RegExMatch(A_ThisMenuItem, "i)[abdefghijkl]\d{3}\b", rProduct)
	ControlsetText, Edit1,%rProduct%, VarBar
	RegExMatch(A_ThisMenuItem, "i)(?<!Ct#)\b\d{3}-\d{4}\b", rBatch)
	ControlsetText, Edit2,%rBatch%, VarBar
	RegExMatch(A_ThisMenuItem, "i)(\b\d{4}\w\d\w?|\bBulk\b)", rlot)
	ControlsetText, Edit3,%rLot%, VarBar
	RegExMatch(A_ThisMenuItem, "i)(coated: |ct#\s|Ct#|ct\s|coated\s)\d{3}-\d{4}\b", rCoated)
	RegExMatch(rCoated,   "\d{3}-\d{4}", rCoated)
	ControlsetText, Edit4,%rCoated%, VarBar 
	if rProduct
		Product:=rProduct
	if rBatch
		Batch:=rBatch
	if rLot
		Lot:=rLot
	if rCoated 
		Coated:=rCoated 

	return
	}
	}
			
			
;;||||||||||||||||||||||||||||||||||| KEYBINDINGS |||||||||||||||||||||||||||||||||||||
	#IfWinActive, VarBar ahk_exe AutoHotkey.exe 
		F19 & F20::Send, {tab}{shiftdown}{tab}{shiftup} ;varbar.focus("Batch")
	;	F19::varbar.focus("Product")
		; F20::varbar.focus("Batch")
		^enter::                           
								winactivate, %the_WinTitle%
								click, %caret_X%, %caret_y%
								return
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
				varbar.SaveVariables()
				;varbar.show()
			return
		;Lbutton::click
			; Rbutton::					
			; MouseGetPos,,,,WinControl
			; ; ControlGetFocus,WinControl,VarBar ahk_exe AutoHotkey.exe
			; if (WinControl="Edit1") || (WinControl="Edit2") || (WinControl="Edit3") || (WinControl="Edit4")
			; 	menu.ProductSelection()
			; else
			; 	VarBar.Menu()
			; return
	#ifwinactive
		; ^left::Lms.SelectTab("Left")
		; ^right::LMs.SelectTab("right")

	#If MouseIsOver("VarBar ahk_exe AutoHotkey.exe") && WinExist("Mats LMS Workbook.xlsb - Excel")
		wheelleft::Excel.PrevSheet()
		wheelright::excel.Nextsheet()   
												
	#If MouseIsOver("VarBar ahk_exe AutoHotkey.exe")
		wheelright::	gosub, Select_next_Batch_In_Array
		wheelleft::   gosub, Select_Previous_Batch_In_Array
		Numlock::
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
					VarBar.Menu()
				return
		WheelUp::      send % Blockrepeat(600) Varbar.AddIteration()
		Wheeldown::    send % Blockrepeat(600) Varbar.SubIteration()
		+wheelup::	Varbar.AddIteration(0)
		+wheeldown::Varbar.SubIteration(0)
		; up::				Varbar.AddIteration(0)
		; down::   		Varbar.SubIteration(0)
		F15::						ReloadScript()
		F9::           Excel.connect()
		F7::           Excel.NextSheet()
		F6::           Excel.PrevSheet()
		F8::				Varbar.launchTable()
			return
		; Rbutton::		
		; MouseGetPos,,,,WinControl
		; 		if (WinControl="Edit1")
		; 			menu.Products()	
		; 		else if (WinControl="Edit2") || (WinControl="Edit3")
		; 			menu.Batches()
		; 		else if (winControl="Static1")
		; 			VarBar.Menu()
		; 		else
		; 			menu.SetStatus()
		; 	return
		numpaddot:: 	 Openapp.Workbook()
	#if

  WM_LBUTTONDOWN(wParam, lParam){
		PostMessage, 0xA1, 2
				X := lParam & 0xFFFF
				Y := lParam >> 16
				if A_GuiControl
					Ctrl := "`n(in control " . A_GuiControl . ")"
				PostMessage, 0xA1, 2
				MouseGetPos,,,,WinControl
				setTimer, SaveVarBarLocaton, -1000

		return
		SaveVarBarLocaton:
			wingetpos, Varbar_X, Varbar_Y,W,H, VarBar ahk_class AutoHotkeyGUI
			IniWrite, %VarBar_y%, Settings.ini, Locations, VarBar_Y
			IniWrite, %varbar_x%, Settings.ini, Locations, VarBar_X
			;IniWrite, %Mode%, Settings.ini, Options, Mode
			return
} 




