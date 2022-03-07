return

Class VarBar{
	Show(X:=1, Y:=1, Destroy:="Reset"){
		Global
		try GUI,VarBar:Destroy
		TopScreen:=1 ;A_ScreenHeight-35
		MidScreen:=A_ScreenWidth//2
		wingetpos, Nugenesis_X, Nugenesis_y, Nugenesis_w, Nugenesis_h, NuGenesis LMS
		wingetpos, Win_X, Win_y, Win_w, Win_h, A
		VarBar_H=30
		VarBar_H_max=58
		VarBar_T:=235
		VarBar_W=350
		VarBar_x:=Nugenesis_X+(Nugenesis_W/3)
		VarBar_Y:=Nugenesis_Y
		Gui VarBar: +AlwaysOnTop -Caption +Toolwindow +owner +HwndGUIID
		Gui Varbar:Default
		Gui, Varbar:+Delimiter`n
		winSet, Transparent, 100, %GUIID%
		GUI, VarBar:color,DC734F, 97BA7F
		; this.AddEdit("Product",	 "left h29 x1 y0 w65",				"16 Bold")
			GUI,VarBar:Font,			 s16 Bold , consolas
			GUI,VarBar:Add,edit,		vProduct +wrap -multi	gVarbarHandler left h29 x1 y0 w65,	%Product%
		this.AddEdit("Batch",	 "left h29 x+0 y0 w90", 			"12,Consolas")
		this.AddEdit("Lot",		 "left h29 x+0 y0 w75", 			"9, Consolas")
		this.AddEdit("Coated",	 "left h29 x+0 y0 wrap w70",		"8.5, Arial Narrow")
		GUI, Varbar:font, cBlack s9 Norm w500 , Consolas
		This.AddText("Iteration", "x+1 center y-1 w45",			 "19 Bold 107C41, Consolas")	; Text1
		this.AddBoxes()
		CoordMode, mouse, screen
		try GUI, VarBar:Show, x%Varbar_X% y%Varbar_y% w%VarBar_w% h%varbar_H% Noactivate, VarBar
		catch
			GUI, VarBar:Show, x%Win_X% y%Win_Y% w%VarBar_w% h%varbar_H% Noactivate, VarBar
		CoordMode, mouse, window
		; OnMessage(0x0201, "WM_LBUTTONDOWN")
		this.loadSavedVariables()
		; OnMessage(0x0203, "WM_LBUTTONDBLCLK")
		OnMessage(0x002C, "ODDDL_MeasureItem") ; WM_MEASUREITEM
		OnMessage(0x002B, "ODDDL_DrawItem") ; WM_DRAWITEM
		winSet, Transparent, %Varbar_T%, AHK_id %GUIID%
		Return

		VarBarHandler:
			GUI, VarBar:submit,NoHide
		return
		VarBarGuiClose:
		VarBarButtonOK:
		VarBarGuiEscape:
			; GUI, VarBar:submit,NoHide
			sleep 50
			this.SaveVariables()
		return
	}

	AddEdit(Variable,Dimensions:="",Font:=""){
		global
		GUI,VarBar:Font,			 s%Font% , consolas ;cBlack Bold, %Font%
		GUI,VarBar:Add,edit,		v%Variable% +wrap -multi	gVarbarHandler %Dimensions%,		% %Variable%
	}
	AddText(Variable,Dimensions:="",Font:=""){
		global
		GUI,VarBar:Font,			 s%Font% ;cBlack Bold, %Font%
		GUI,VarBar:Add,Text,		v%Variable% 	%Dimensions%,		% %Variable%
	}

	Menu(){
		global
		MouseGetPos,,,,winControl
		try Menu, VarBarmenu, DeleteAll
		Menu, VarBarMenu, Add,		 		Show&SampleID, 					ShowSampleID
		Try Menu,VarBarmenu,show
	}
	Reset(){
		Global
		coordmode, mouse, Screen
		; keywait, Lbutton, U T2
		MouseGetPos,Varbar_X,Varbar_Y
		VarBar.show(0)
		coordmode, mouse, window
		return
	}

	Focus(Control){
		global
		winGetTitle, the_winTitle, A
		caret_x:=A_CaretX
		caret_y:=A_Carety
		winactivate, VarBar ahk_exe AutoHotkey.exe
		FlashScreen()
		GuiControl Varbar:Focus, %Control%
		Sendinput, ^{a}
		return
	}

	Search(input){
		global
		Clip()
		LMS.SearchBar(input)
		return
	}

	AddIteration(speed:=300){
		global Iteration
		; GuiControl, -redraw, varbar
		sleep 15
		Iteration+=1
		sleep %Speed%
		ControlsetText, Static1,%Iteration%,VarBar
		return
	}
	SubIteration(speed:=300){
		global Iteration
		; GuiControl, -redraw, varbar
		sleep 15
		Iteration-=1
		sleep %speed%
		ControlsetText, Static1,%Iteration%,VarBar
		return
	}
	SaveVariables(){ ;;_________________SAVING VARIABLES_________________________
	global
		GUI, varbar:default
		GUI, Varbar:Submit, Nohide
		sleep 200
		IniWrite, %Iteration%, Settings.ini, SavedVariables, Iteration
		iniwrite, %Product%, Settings.ini, SavedVariables, Product
		iniwrite, %Batch%, Settings.ini, SavedVariables, Batch
		iniwrite, %Lot%, Settings.ini, SavedVariables, Lot
		iniwrite, %Coated%, Settings.ini, SavedVariables, Coated
	}
loadSavedVariables(){ ;;___________________________LOADING VARIABLES_________________________
	global
		GUI, varbar:default
		Iniread, Iteration, Settings.ini, SavedVariables, Iteration
		iniRead, Product, Settings.ini, SavedVariables, Product
		iniRead, Batch, Settings.ini, SavedVariables, Batch
		iniRead, Lot, Settings.ini, SavedVariables, Lot
		iniRead, Coated, Settings.ini, SavedVariables, Coated
		if Iteration
			GuiControl,Varbar:Text, Iteration, %Iteration%
		if Product
			GuiControl,Varbar:Text, Product, %Product%
		if Batch
			GuiControl,Varbar:Text, Batch, %Batch%
		if lot
			GuiControl,Varbar:Text, lot, %lot%
		if Coated
			GuiControl,Varbar:Text, Coated, %Coated%
		GUI, Varbar:Submit, Nohide
	}
}

;;||||||||||||||||||||||||||||||||||| KEYBINDINGS |||||||||||||||||||||||||||||||||||||
#Ifwinactive, VarBar ahk_exe AutoHotkey.exe
	enter::
		ControlGetFocus,winControl,VarBar ahk_exe AutoHotkey.exe
		if (winControl="Edit1") || (winControl="Edit2") || (winControl="Edit3") ||(winControl="Edit4"){
			GUI, varbar:default
			Gui, Varbar:submit, nohide
			LMS.Searchbar(clipboard,"{enter}")
		}
	return
#ifwinactive

#If MouseIsOver("VarBar")
Wheelup::Varbar.AddIteration(30)
Wheeldown::Varbar.SubIteration(30)
+wheelup::Varbar.AddIteration(0)
+wheeldown::Varbar.SubIteration(0)
#if

VarBar_ResetSub:
	VarBar.Reset()
return

