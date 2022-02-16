return

Class VarBar{
	Show(X:=1, Y:=1, Destroy:="Reset"){
		Global
		try GUI,VarBar:Destroy
		TopScreen:=1 ;A_ScreenHeight-35
		MidScreen:=A_ScreenWidth//2
		VarBar_H=30
		VarBar_H_max=58
		VarBar_T:=235
		VarBar_W=350
		This.loadSavedVariables()
		Gui VarBar: +AlwaysOnTop -Caption +Toolwindow +owner +HwndGUIID
		Gui Varbar:Default
		Gui, Varbar:+Delimiter`n
		winSet, Transparent, 100, %GUIID%
		This.SetColor()
		this.AddEdit("Product",	 "left h29 x1 y0 w65",				"16 Bold")
		this.AddEdit("Batch",	 "left h29 x+0 y0 w90", 			"12,Consolas")
		this.AddEdit("Lot",		 "left h29 x+0 y0 w75", 			"9, Consolas")
		this.AddEdit("Coated",	 "left h29 x+0 y0 wrap w70",		"8.5, Arial Narrow")
		GUI, Varbar:font, cBlack s9 Norm w500 , Consolas
		This.AddText("Iteration", "x+1 center y-1 w23",			 "19 Bold 107C41, Consolas")	; Text1
		this.AddBoxes()
		CoordMode, mouse, screen
		try GUI, VarBar:Show, x%Varbar_X% y%Varbar_y% w%VarBar_w% h%varbar_H% Noactivate, VarBar
		catch
			GUI, VarBar:Show, x1 y1 w%VarBar_w% h%varbar_H% Noactivate, VarBar
		CoordMode, mouse, window
		OnMessage(0x0201, "WM_LBUTTONDOWN")
		OnMessage(0x0203, "WM_LBUTTONDBLCLK")
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

	WM_LBUTTONDBLCLK(){
		global
		GUI, varbar:default
		Gui, Varbar:+Delimiter`r`n
		; Gui, Varbar:submit, nohide
		GuiControlGet, TheSelectedLine,,CodeStringEdit
		Control, Delete, %TheSelectedLine%, Combobox1, VarBar ; delete the focused item
		ControlGet, Wholex, List,,Combobox1, VarBar ;- get the whole listbox1
		; sort,Wholex, U R
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
		; HideVarBar:=CreateMenu("showVarbar","VarBarMenu")
		; HideVarBar:=CreateMenu("showVarbar","VarBarMenu")
		Menu, VarBarMenu, Add,		 		Show&SampleID, 					ShowSampleID
		if ShowSampleID=1
			menu, VarBarmenu, Check, 	Show&SampleID
		Menu, VarBarMenu, Add,		 		Tables, 					Varbar.LaunchTable

		If winExist("Mats LMS Workbook.xlsb - Excel"){
			Menu,VarBarMenu,add,				&Spec Table,						Tests
			Menu,VarBarMenu,add,				&Ingredient Table,			Tests
		}
		Try Menu,VarBarmenu,show
	}

	SetColor(){
		global
		; GuiControl, -redraw, varbar
		if (A_mode=="TempCode")
			GUI, VarBar:color,272822, FFFFFF
		else If (Mode=="Debugging")
			GUI, VarBar:color,272822, 808000 ;pink
		else if winactive("Mats LMS Workbook.xlsb - Excel")
			excel.matchcolor()
		else
			GUI, VarBar:color,DC734F, 97BA7F ; normal color
		; GuiControl, +redraw, varbar
	}

	FloatAtopwindow(FloatTime:=""){
		Global Varbar_X, Varbar_Y
		wingetpos, Varbar_X, Varbar_y, Varbar_w, Varbar_h, VarBar ahk_exe AutoHotkey.exe
		winGetPos, VarBar_oX, VarBar_oY, Varbar_oW,Varbar_oH, A
		winMove, VarBar ahk_class VarBar ahk_exe AutoHotkey.exe, ,varbar_oX+100, Varbar_oy
		winWaitNotactive, ;- \\Remote,, 20, NuGenesis LMS - \\Remote
		winMove, VarBar ahk_class VarBar ahk_exe AutoHotkey.exe, ,varbar_x, Varbar_y
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
		winGetTitle, the_winTitle, A
		caret_x:=A_CaretX
		caret_y:=A_Carety
		winactivate, VarBar ahk_exe AutoHotkey.exe
		FlashScreen()
		GuiControl Varbar:Focus, %Control%
		; sleep 100
		tt(CodeString,2000,A_caretx,A_caretY,4)
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
		; flovar(Iteration,200)
		; Pop(Iteration)
		; tt(Iteration,500,Varbar_x,Varbar_y,2,200)
		IniWrite, %Iteration%, Settings.ini, SavedVariables, Iteration
		; GuiControl, +redraw, varbar
		return
	}
	SubIteration(speed:=300){
		global Iteration
		; GuiControl, -redraw, varbar
		sleep 15
		Iteration-=1
		sleep %speed%
		ControlsetText, Static1,%Iteration%,VarBar
		; Pop(Iteration)
		IniWrite, %Iteration%, Settings.ini, SavedVariables, Iteration
		; GuiControl, +redraw, varbar
		return
	}

}

;;||||||||||||||||||||||||||||||||||| KEYBINDINGS |||||||||||||||||||||||||||||||||||||
#Ifwinactive, VarBar ahk_exe AutoHotkey.exe
	^enter::
		winactivate, %the_winTitle%
		click, %caret_X%, %caret_y%
	return

	Mbutton::
		winactivate, %the_winTitle%
		click
		Varbar.WM_LBUTTONDBLCLK()
	return
	Delete::
		ControlGetFocus,winControl,VarBar ahk_exe AutoHotkey.exe
		if (winControl="Edit5")
			varbar.WM_LBUTTONDBLCLK()
		else
			sendinput, ^a{delete}
	return
	enter::
		ControlGetFocus,winControl,VarBar ahk_exe AutoHotkey.exe
		if (winControl="Edit1") || (winControl="Edit2") || (winControl="Edit3") ||(winControl="Edit4"){
			GUI, varbar:default
			Gui, Varbar:submit, nohide
			LMS.Searchbar(clipboard,"{enter}")
		}
		else if (winControl="Edit5")
			varbar.AddToList()
	return
#ifwinactive

#If MouseIsOver("VarBar ahk_exe AutoHotkey.exe")
	Mbutton::
	click
	sleep 100
	Varbar.WM_LBUTTONDBLCLK()
return
return
Wheelup:: sendInput % Blockrepeat(300) Varbar.AddIteration(10)
Wheeldown:: sendInput % Blockrepeat(300) Varbar.SubIteration(10)
+wheelup::	Varbar.AddIteration(0)
+wheeldown::Varbar.SubIteration(0)
numpaddot:: 	 Openapp.Workbook()
#if

WM_LBUTTONDOWN(wParam, lParam){
	If !MouseIsOver("VarBar ahk_exe AutoHotkey.exe")
		return
	PostMessage, 0xA1, 2
	X := lParam & 0xFFFF
	Y := lParam >> 16
	if A_GuiControl
		ctrl := "`n(in control " . A_GuiControl . ")"
	PostMessage, 0xA1, 2
	MouseGetPos,,,,winControl

return
SaveVarBarLocaton:
	; sleep 200
	wingetpos, Varbar_X, Varbar_Y,W,H, VarBar ahk_class AutoHotkeyGUI
	IniWrite, %VarBar_y%, Settings.ini, Locations, VarBar_Y
	IniWrite, %varbar_x%, Settings.ini, Locations, VarBar_X
return
}

; }

VarBar_ResetSub:
	VarBar.Reset()
return

