

Class VarBar{
Show(X:=1, Y:=1, Destroy:="Reset"){
	Global
	try GUI,VarBar:Destroy
	; if !showVarbar
		; return
	; Variables
		TopScreen:=1 ;A_ScreenHeight-35
		MidScreen:=A_ScreenWidth//2
		VarBar_H=400
		VarBar_H_max=400
		VarBar_T:=235
		VarBar_W=350
		CurrentCodesFile=C:\Users\mmignin\Documents\VQuest\Data\CurrentCodes.txt
	fileread,CurrentCodes,%CurrentCodesFile%
	This.loadSavedVariables()
	Gui VarBar: +AlwaysOnTop -Caption +Toolwindow +owner +HwndGUIID
	Gui Varbar:Default
Gui, Varbar:+Delimiter`n
	winSet, Transparent, 100, %GUIID%
	This.SetColor()
	this.AddEdit("Product",	  "left h29 x1 y0 w65",				"16 Bold")
	this.AddEdit("Batch",		  "left h29 x+0 y0 w90", 			"12,Consolas")
	this.AddEdit("Lot",			  "left h29 x+0 y0 w75", 			"9, Consolas")
	this.AddEdit("Coated",	  "left h29 x+0 y0 wrap w70",	"8.5, Arial Narrow")
	This.AddText("Iteration", "x+1 center y-1 w23",			  "19 Bold 107C41, Consolas")	; Text1
	GUI, Varbar:font, cBlack s9 Norm w500 , Consolas
;; -----------------new DDL test
	GUI, VarBar:Font, cBlack s15, Consolas
	Gui, Varbar:Add, Combobox, vCodeStringEdit  Left simple Altsubmit gDDLVarbar  x1 yP+30 w350 r15 hwndHDDL , %CurrentCodes%
	Gui, Varbar:Add, Button, gDelx  Hidden y200 x10  v1, Delete
	Gui, Varbar:Add, Button, gAddx  Hidden Default x+2  v2, Add
;----------------------end of test
		; this.AddBatchesDDL(0,"x1 yP+34 w250 r15 h21 vCurrentCodesList Simple gDDLVarbar hwndHDDL +0x0210") ;combobox1
		; GUI, VarBar:add, Checkbox, x260 y35 vExcelConnect gExcelConnectCheck Checked%ExcelConnect%, Excel
		; this.AddBatchesDDL(0,"Simple x1 yP+34 w250 r20 h20 AltSubmit vDDL hwndHDDL +0x0210") ;combobox test
		; GUI, varbar:add, button, xm ym Hidden Default gDDLVarbar, OK
	this.AddBoxes()
			CoordMode, mouse, screen
			try GUI, VarBar:Show,  x%Varbar_X% y%Varbar_y% w%VarBar_w% h%varbar_H% Noactivate, VarBar
					catch
						GUI, VarBar:Show,  x1 y1 w%VarBar_w% h%varbar_H% Noactivate, VarBar
			CoordMode, mouse, window
			ControlsetText, Static1, %Iteration%,VarBar
			OnMessage(0x0201, "WM_LBUTTONDOWN")
			OnMessage(0x0203, "WM_LBUTTONDBLCLK")
			; OnMessage(  WM_LBUTTONUP := 0x0202, "WM_LBUTTONUP")
			OnMessage(0x0200, "WM_MOUSEMOVE")
			; OnMessage(0x203,  "VariableBar_Relocate")
			OnMessage(0x002C, "ODDDL_MeasureItem") ; WM_MEASUREITEM
			OnMessage(0x002B, "ODDDL_DrawItem")    ; WM_DRAWITEM
			winSet, Transparent, %Varbar_T%, AHK_id %GUIID%
	GuiControl, %CodeString%, ComboBox1, %CurrentCodes%
	return
	Return


	addx:
		Gui, Varbar:submit, nohide
		ControlGetText, CodeString, Edit5, VarBar
		sleep 100
    ; try GuiControl, Varbar:ChooseString, ComboBox1, % CodeString
      ; catch
				Clip.CodesRegex(CodeString)
  	; Gui, Varbar:submit, nohide
		; If CodeString is integer
		; {
		; 	control, choose, %CodeStringEdit%, ComboBox1, VarBar
		; }
		; else
		; {
		; 	ControlGetText, CodeString, Edit5, VarBar
		; 	sleep 200
		; 	Control, Add, %CodeString%, Combobox1, Varbar    ; add to the bottom of the list
		; 	ControlGet, Wholex, List,,Combobox1, VarBar              ;- get the whole listbox1
		; 	sort,Wholex, U R
		; 	control, choose, %CodeString%, ComboBox1, VarBar
		; if wholex<>
		;  {
		;  stringreplace,wholex,wholex,`n`n,`n,all
		;  filedelete,%CurrentCodesFile%
		;  fileappend,%CodeString%,%CurrentCodesFile%
		;  RemoveFileDuplicates("C:\Users\mmignin\Documents\VQuest\Data\CurrentCodes.txt")
		;  }
		; }
		return


	delx:
		; GUI, VarBar:submit,NoHide
		GuiControlGet,   TheSelectedLine,, CodeStringEdit      ; get the focused item Number
		Control, Delete, %TheSelectedLine%, Combobox1    ; delete the focused item
		ControlGet, Wholex, List,,Combobox1              ;- get the whole listbox1
			sort,Wholex, U R
		if wholex<>
		 {
		 stringreplace,wholex,wholex,`n`n,`n,all
		 filedelete,%CurrentCodesFile%
		 fileappend,%wholex%,%CurrentCodesFile%
		 }
		return


	DDLVarbar:  ;; ComboBox1 Hanfler
		GUI, Varbar:default
		ControlGetText, CodeString, Edit5, VarBar
		sleep 100
		if RegexMatch(CodeString, RegexProduct,r){
			ControlsetText, Edit1,%rProduct%, VarBar
		}
      ; Product:=RegexMatch(CodeString, RegexProduct,r) ? rProduct : ""
		if RegexMatch(CodeString, RegexBatch,r)
      ; Batch:=RegexMatch(Parse, RegexBatch, r) ? rBatch : ""
			ControlsetText, Edit2,%rBatch%, VarBar
		if RegexMatch(CodeString, RegexLot,r)
			ControlsetText, Edit3,%rLot%, VarBar
      ; Lot:=RegexMatch(Parse, RegexLot, r) ? rLot : ""
		if RegexMatch(CodeString, RegexCoated,r)
			ControlsetText, Edit4,%rCoated%, VarBar
      ; Coated:=RegExMatch(Parse, RegexCoated, r) ? rCoated : ""
		; GUI, VarBar:submit,NoHide
			; msgbox, %CodeString% `n %Product%
      Ct:=rCoated ? " ct#" : ""
    CodeString:=Trim(rProduct " " rBatch " " rLot Ct rCoated)
		; if ClipText
			; clip.codesRegex(ClipText)
		; else
			; clip.CodesRegex(CodeString)
			return

		VarbarHandler:
			GUI, VarBar:submit,NoHide
			; try GuiControl, Varbar:ChooseString, ComboBox1, % Trim(Product " " Batch " " Lot Ct Coated)
		; GUI, Varbar:default
		;GUI, VarBar:submit,NoHide
		; Gui, Varbar:+Delimiter`r`n
		; sleep 50
;		clip.SetVarbar()
		return

		ExcelConnectCheck:
			GUI, Varbar:Submit, Nohide
			IniWrite, %ExcelConnect%, Settings.ini, Options, ExcelConnect
			return
		ProductHandler:
		BatchHandler:
		LotHandler:
		CoatedHandler:
			GUI, VarBar:submit,NoHide

      ; GuiControl,Varbar:Text, Product, %Product%
      ; GuiControl,Varbar:Text, Batch, %Batch%
      ; GuiControl,Varbar:Text, lot, %lot%
      ; GuiControl,Varbar:Text, Coated, %Coated%
	      ; GuiControl,Varbar:Text, CodeString, % Trim(Product " " Batch " " Lot Ct Coated)
      ; Ct:=Coated ? " ct#" : ""
			; CodeString:=Trim(Product " " Batch " " Lot Ct Coated)
				; ControlsetText, Edit5, %CodeString%,VarBar
			; sleep 50

			;this.SaveVariables()
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
		Gui, Varbar:+Delimiter`n
		; Gui, Varbar:submit, nohide
		GuiControlGet, TheSelectedLine,,CodeStringEdit
		Control, Delete, %TheSelectedLine%, Combobox1    ; delete the focused item
		ControlGet, Wholex, List,,Combobox1              ;- get the whole listbox1
		sort,CurrentCodes, U R
	if wholex<>
	 {
		 stringreplace,wholex,wholex,`n`n,`n,all
		 filedelete,%CurrentCodesFile%
		 fileappend,%wholex%,%CurrentCodesFile%
	}
return
	}

loadSavedVariables(){ ;;___________________________LOADING VARIABLES_________________________
	global

		IniRead, Varbar_X, Settings.ini, Locations, VarBar_X
		IniRead, Varbar_Y, Settings.ini, Locations, VarBar_Y
		Iniread, Iteration, Settings.ini, SavedVariables, Iteration
		Iniread, HideVarBar, Settings.ini, Options, HideVarBar
		Iniread, ExcelConnect, Settings.ini, Options, ExcelConnect
		Iniread, ModeSelections, Settings.ini, Options, ModeSelections
		Iniread, Mode, Settings.ini, Options, Mode
   iniread, CodeString, Settings.ini, SavedVariables, CodeString
			; clip.CodesRegex(CodeString)

	 if !winExist("Mats LMS Workbook.xlsb"){ ;|| !(ExcelConnect){ ;|| !RegexMatch(XL.activeSheet.Name, "i)[abdefghijkl]\d{3}"){
			; clip.parse(CodeString)
		 }
	}


SaveVariables(){ ;;___________________________SAVING VARIABLES_________________________
	global
		GUI, varbar:default
		GUI, Varbar:Submit, Nohide
	sleep 200
	IniWrite, %Iteration%, Settings.ini, SavedVariables, Iteration
	iniwrite, %CodeString%, Settings.ini, SavedVariables, CodeString
	; IniWrite, %HideVarbar%, Settings.ini, Options, HideVarbar
	IniWrite, %ModeSelections%, Settings.ini, Options, ModeSelections
	; FileAppend, %CodeString%, Data\CurrentCodes.txt
	sleep 200
	RemoveFileDuplicates("C:\Users\mmignin\Documents\VQuest\Data\CurrentCodes.txt")
	}


AddToList(Input:=""){
	Global
	GUI, varbar:default
	Gui, Varbar:submit, nohide
	Gui, Varbar:+Delimiter`n
	ControlGetText, CodeString, Edit5, VarBar
		Variable:=Input ? Input : CodeString
		if !Variable
			Variable:=CodeString
		ControlsetText, Edit5, %Variable%,VarBar
		Control, Add, %Variable%, Combobox1, VarBar  ; add to the bottom of the list
		ControlGet, Wholex, List,,Combobox1, VarBar              ;- get the whole listbox1
	 sort,Wholex, U R
		; control, choose, %CodeString%
	if wholex<> 															;Update List
	 {
		 stringreplace,wholex,wholex,`n`n,`n,all
		;  filedelete,%CurrentCodesFile%
		 fileappend,%Variable%,%CurrentCodesFile%
		 RemoveFileDuplicates("C:\Users\mmignin\Documents\VQuest\Data\CurrentCodes.txt")
	 }
}

AddModeComboBox(Variable:="Mode",Options:=""){
	global
	GUI, Varbar:+Delimiter|
	GUI, Varbar:add, ComboBox, %Options% v%Variable% g%Variable%DDL, % ModeSelections
	GuiControl, ChooseString, ComboBox2, % %Variable%
	}





AddBatchesDDL(Variable:="",Options:=""){
   global
	 ConnectedProduct:=
	 if !Variable
			FileRead, CurrentCodes, Data\CurrentCodes.txt
				GUI,VarBar:Font,			 s9, Arial Narrow ;cBlack Bold, %Font%
				GUI,Varbar:+Delimiter`n
				GUI, Varbar:Add, ComboBox, %Options%, % RemoveTextDuplicates(CurrentCodes) ;Variable ;StrReplace(StrReplace(RemoveTextDuplicates(CurrentCodes), "`n", "|"), "`n`n","`n")
		        if Product
            	ConnectedProduct:=Product
            if Batch
              ConnectedProduct.= " " Batch
            if Lot
              ConnectedProduct.= " " Lot
            if Coated
              ConnectedProduct.= " Ct#" Coated
		try GuiControl, Varbar:ChooseString, DDL, %CurrentCodes%
		Catch
				GuiControl, Varbar:ChooseString, DDL, % LoadedCodes
		GuiControl, Varbar:MoveDraw, DDL

}

		AddEdit(Variable,Dimensions:="",Font:=""){
			global
				GUI,VarBar:Font,			 s%Font%  , consolas ;cBlack Bold, %Font%
				GUI,VarBar:Add,edit,		v%Variable% +wrap -multi	gVarBarHandler %Dimensions%,		%    %Variable%
		}
		AddText(Variable,Dimensions:="",Font:=""){
			global
				GUI,VarBar:Font,			 s%Font%  ;cBlack Bold, %Font%
				GUI,VarBar:Add,Text,		v%Variable% 	%Dimensions%,		%    %Variable%
		}

Menu(){
  global
	MouseGetPos,,,,winControl
  try Menu, VarBarmenu, DeleteAll
	    HideVarBar:=CreateMenu("showVarbar","VarBarMenu")
	    HideVarBar:=CreateMenu("showVarbar","VarBarMenu")
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

ProductsMenu(Next:=""){
  global
  regProducts:=[]
  CurrentProducts:=
  sleep 150
    loop, read, Data\CurrentCodes.txt ;, "`r`n"
      {
					needle:= "i)[abdefghijkl]\d{3}"
					RegexMatch(A_loopreadline, Needle, VarProduct)
					if VarProduct
					regProducts.Insert(Trim(VarProduct))
      }
    if (RegProducts.maxindex() > 1) {
        Products:=[], oTemp := {} ;remove duplicates
        for vKey, vValue in regProducts {
        if (ObjGetCapacity([vValue], 1) = "") ;is numeric
          {
            if !ObjHasKey(oTemp, vValue+0)
              Products.Push(vValue+0), oTemp[vValue+0] := ""
          }
          else
          {
            if !ObjHasKey(oTemp, "" vValue)
              Products.Push("" vValue), oTemp["" vValue] := ""
          }
        }
      sleep 100
      try Menu, Productdropdownmenu, DeleteAll
					; Sort, Products, R
        For Each, Element In Products {
          CurrentProducts .= Element "`n"
          Menu, ProductDropdownmenu, add, %Element%, ProductDropdownMenu
      }
    }
		if !Next
    	Try Menu, ProductDropdownMenu, Show,
		else {
			try Menu, Productdropdownmenu, DeleteAll
			n:=Next+1
			Clip.regex(Products[n])
			if (Products.maxindex() = n)
				N:=1
		}
    return
    ProductDropDownMenu:
     clip.regex(A_ThisMenuItem)
			n:=A_ThisMenuItemPos
     return

}

BatchesMenu(Formulation){
  global
  regBatches:=[]
  CurrentBatches:=
  sleep 150
    loop, read, Data\CurrentCodes.txt ;, "`r`n"
      {
        ;  needle:="i)(" Formulation ")\s((?<!Ct#)\d{3}-\d{4})\s(\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b)"
         needle:= "i)(" Formulation ")\s(?<Batch>(\d{3}-\d{4})?).?(?<Lot>(\d{4}\w\d\w?|Bulk|G\d{7}\w?)?).?(Ct#)?(?<Coated>(\d{3}-\d{4})?)"
        RegexMatch(A_loopreadline, Needle, Var)
					; if !VarLot && HasValue(regBatches,VarBatch)
					; 	continue
					If VarBatch {
						regMatch:=VarBatch
					If VarLot
						regMatch.=" " Varlot
					else If !VarLot {
						FileRead, CurrentCodesFile, Data\CurrentCodes.txt
						FileNeedle:= "i)(" VarBatch ")\s(\d{4}\w\d\w?|Bulk|G\d{7}\w)"
						RegExMatch(CurrentcodesFile, FileNeedle,FileVar)
						if FileVar
							regMatch:=FileVarLot
					}

          if VarCoated
            regMatch.= " Ct#" VarCoated
					}
          regBatches.Insert(Trim(regMatch))
      }
    if (RegBatches.maxindex() > 1) {
        Batches:=[], oTemp := {} ;remove duplicates
        for vKey, vValue in regBatches {
        if (ObjGetCapacity([vValue], 1) = "") ;is numeric
          {
            if !ObjHasKey(oTemp, vValue+0)
              Batches.Push(vValue+0), oTemp[vValue+0] := ""
          }
          else
          {
            if !ObjHasKey(oTemp, "" vValue)
              Batches.Push("" vValue), oTemp["" vValue] := ""
          }
        }
      sleep 100
      try Menu, Batchdropdownmenu, DeleteAll
        For Each, Element In Batches {
          CurrentBatches .= Element "`n"
          Menu, BatchDropdownmenu, add, %Element%, BatchDropdownMenu
      }
    }
    	Try Menu, BatchDropdownMenu, Show,
    return
    BatchDropDownMenu:
    clip.regex(A_ThisMenuItem)
    return

}






HistoryMenuItem(){
	global Product, Batch, Lot, Coated,
		GUI, VarBar:submit,NoHide
	sleep 200
	RegExMatch(A_ThisMenuItem, RegexProduct, r)
	RegExMatch(A_ThisMenuItem, RegexBatch, r)
	RegExMatch(A_ThisMenuItem, RegexLot, r)
	RegExMatch(A_ThisMenuItem, RegexCoated, r)
	; RegExMatch(rCoated,   "\d{3}-\d{4}", rCoated)
	ControlsetText, Edit1,%rProduct%, VarBar
	ControlsetText, Edit2,%rBatch%, VarBar
	ControlsetText, Edit3,%rLot%, VarBar
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
        winWaitNotactive,  ;- \\Remote,, 20, NuGenesis LMS - \\Remote
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
		GuiControl Varbar:Focus, %Control%
		; sleep 100
		Sendinput, ^{a}
		return
		}

	Relocate(){
		global
				PostMessage, 0xA1, 2
				if MouseIsOver("VarBar")
					; keywait, Lbutton, U T1
					; Send, ^a
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
		if winexist("Result Editor - \\Remote") || winactive("Test Definition Editor - \\Remote") || winactive("Results Definition - \\Remote") || (Tab="Specs")
			SpecTab.Table()
		if winexist("Composition - \\Remote") || winactive("Edit Ingredient - \\Remote") || (Tab="Products")
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
		Pop(Iteration)
		sleep %Speed%
		ControlsetText, Static1,%Iteration%,VarBar
		tt(Iteration,500,Varbar_x,Varbar_y,2,200)
		IniWrite, %Iteration%, Settings.ini, SavedVariables, Iteration
		; GuiControl, +redraw, varbar
		return
		}
		SubIteration(speed:=350){
		global Iteration
		; GuiControl, -redraw, varbar
		sleep 10
		Iteration-=1
		Pop(Iteration)
		sleep %speed%
		ControlsetText, Static1,%Iteration%,VarBar
		tt(Iteration,500,Varbar_x,Varbar_y,2,200)
		IniWrite, %Iteration%, Settings.ini, SavedVariables, Iteration
		; GuiControl, +redraw, varbar
		return
		}




	}


;;||||||||||||||||||||||||||||||||||| KEYBINDINGS |||||||||||||||||||||||||||||||||||||
	#Ifwinactive, VarBar ahk_exe AutoHotkey.exe
		; F19 & F20::Send, {tab}{shiftdown}{tab}{shiftup} ;varbar.focus("Batch")
	;	F19::varbar.focus("Product")
		; F20::varbar.focus("Batch")
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
						Send, ^a^c
						winactivate, NuGenesis LMS - \\Remote
				LMS.Searchbar(clipboard,"{enter}")
			}
			else if (winControl="Edit5"){
				sendinput, ^a
				varbar.AddToList()
			}
			return
		;Lbutton::click
			; Rbutton::
			; MouseGetPos,,,,winControl
			; ; ControlGetFocus,winControl,VarBar ahk_exe AutoHotkey.exe
			; if (winControl="Edit1") || (winControl="Edit2") || (winControl="Edit3") || (winControl="Edit4")
			; 	menu.ProductSelection()
			; else
			; 	VarBar.Menu()
			; return
	#ifwinactive
		; ^left::Lms.SelectTab("Left")
		; ^right::LMs.SelectTab("right")

	; #If MouseIsOver("VarBar ahk_exe AutoHotkey.exe") && winExist("Mats LMS Workbook.xlsb - Excel")
		; wheelleft::Excel.PrevSheet()
		; wheelright::excel.Nextsheet()

	#If MouseIsOver("VarBar ahk_exe AutoHotkey.exe")
	Mbutton::
			click
			sleep 100
			Varbar.WM_LBUTTONDBLCLK()
			return
		; F13 & k::
		; wheeldown::selectnextBatch()
		; F13 & j::
		; wheelup::SelectPreviousBatch()
		; Mbutton::
		; InputBox, Iteration, ITERATIONR,,,100,50 , , , , , 1
		; sleep 50
			; GuiControl, Varbar:Text, iteration, %iteration%
		; GUI, varbar:default
		; GUI, Varbar:Submit, Nohide
		return
		Numlock::gosub, Volume_Mute
		; 	MouseGetPos,,,,winControl
		; 		if (winControl="Edit1") || (winControl="Edit2") || (winControl="Edit3"){
		; 			click
		; 			Send, ^a
		; 			clip.regex()
		; 			winactivate, NuGenesis LMS - \\Remote
		; 			return
		; 			LMS.Searchbar(clipboard,"{enter}")
		; 		}
		; 		else if (winControl="Edit6")
		; 			TT(wincontrol)
		; 		else
		; 			VarBar.Menu()
		; 		return
		; Wheelup::      sendInput % Blockrepeat(400) Varbar.AddIteration(10)
		; Wheeldown::    sendInput % Blockrepeat(400) Varbar.SubIteration(10)
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
		; MouseGetPos,,,,winControl
		; 		if (winControl="Edit1")
		; 			menu.Products()
		; 		else if (winControl="Edit2") || (winControl="Edit3")
		; 			menu.Batches()
		; 		else if (winControl="Static1")
		; 			VarBar.Menu()
		; 		else
		; 			menu.SetStatus()
		; 	return
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
				setTimer, SaveVarBarLocaton, -1500

		return
		SaveVarBarLocaton:
			; sleep 200
			wingetpos, Varbar_X, Varbar_Y,W,H, VarBar ahk_class AutoHotkeyGUI
			IniWrite, %VarBar_y%, Settings.ini, Locations, VarBar_Y
			IniWrite, %varbar_x%, Settings.ini, Locations, VarBar_X
			;IniWrite, %Mode%, Settings.ini, Options, Mode
			return
}

	; WM_LBUTTONUP(wParam := "", lParam := "") {  ; User clicked on the GUI
 	;  GUI, varbar:Submit, nohide
	; ;  SendInput % "{Text}" clip[clipNum]
	; }

WM_MOUSEMOVE(){
	global
	GUI, Varbar:default
	If Varbar_H:=VarBar_H_Max
		Return
	; ControlGetFocus, GUIFocus, VarBar

	else If MouseIsOver("VarBar ahk_exe AutoHotkey.exe") { ;|| GUIFocus {
    winMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%Varbar_H_max%
		settimer, ShrinkVarBar, 200
		return
	}
return


		ShrinkVarbar:
		; ControlGetFocus, GUIFocus, VarBar
			if (!MouseIsOver("VarBar ahk_exe AutoHotkey.exe")) {
				Settimer, ShrinkVarBar, Off
		    winMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%Varbar_H%

			}
			else
				return
			return
}




#include <BatchesDDL>
