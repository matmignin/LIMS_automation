return
; #include *i C:\Users\mmignin\Documents\VQuest\lib\Functions.ahk

Class VarBar{
Show(X:=1, Y:=1, Destroy:="Reset"){
	Global
	try GUI,VarBar:Destroy
	; if !showVarbar
		; return
	; Variables
		TopScreen:=1 ;A_ScreenHeight-35
		MidScreen:=A_ScreenWidth//2
		VarBar_H=58
		VarBar_H_max=58
		VarBar_T:=235
		VarBar_W=350
		CurrentCodesFile=C:\Users\mmignin\Documents\VQuest\Data\CurrentCodes.txt
	fileread,CurrentCodes,%CurrentCodesFile%
	This.loadSavedVariables()
	Gui VarBar: +AlwaysOnTop -Caption +Toolwindow +owner +HwndGUIID
	Gui Varbar:Default
	iniread, CodeString, Settings.ini, SavedVariables, CodeString
Gui, Varbar:+Delimiter`n
	winSet, Transparent, 100, %GUIID%
	This.SetColor()
	this.AddEdit("Product",	  "left h29 x1 y0 w65",				"16 Bold")
	this.AddEdit("Batch",		  "left h29 x+0 y0 w90", 			"12,Consolas")
	this.AddEdit("Lot",			  "left h29 x+0 y0 w75", 			"9, Consolas")
	this.AddEdit("Coated",	  "left h29 x+0 y0 wrap w70",	"8.5, Arial Narrow")
	GUI, Varbar:font, cBlack s9 Norm w500 , Consolas
	This.AddText("Iteration", "x+1 center y-1 w23",			  "19 Bold 107C41, Consolas")	; Text1
	GUI, VarBar:Font, cBlack s14, Consolas
	Gui, Varbar:Add, Combobox, vCodeStringEdit  Left +Multi  Altsubmit gDDLVarbar  x1 yP+30 w350 r25 hwndHDDL , %CurrentCodes%
	GuiControl, Varbar:ChooseString, ComboBox1, % CodeString
;; -----------------new DDL test
	Gui, Varbar:Add, Button, gDelx  Hidden y200 x10  v1, Delete
	Gui, Varbar:Add, Button, gAddx  Hidden Default x+2  v2, Add
;----------------------end of testK
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
			;OnMessage(0x0200, "WM_MOUSEMOVE")
			; OnMessage(0x203,  "VariableBar_Relocate")
			OnMessage(0x002C, "ODDDL_MeasureItem") ; WM_MEASUREITEM
			OnMessage(0x002B, "ODDDL_DrawItem")    ; WM_DRAWITEM
			winSet, Transparent, %Varbar_T%, AHK_id %GUIID%
	sleep 200
	if winExist("Mats LMS Workbook")
		; return ;|| !(ExcelConnect){ ;|| !RegexMatch(XL.activeSheet.Name, "i)[abdefghijkl]\d{3}"){
			; startup:=1
			; iniread, CodeString, Settings.ini, SavedVariables, CodeString
			; GuiControl, Varbar:ChooseString, ComboBox1, % CodeString

			; sleep 200
				; clip.parse(CodeString)
			; startup:=

	; try GuiControl, Varbar:ChooseString, ComboBox1, % clip.codesRegex(CodeString)
	; Gui, Varbar:submit,nohide

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
		Control, Delete, %TheSelectedLine%, Combobox1,VarBar    ; delete the focused item
		ControlGet, Wholex, List,,Combobox1,VarBar         ;- get the whole listbox1
			sort,Wholex, U R
		if wholex<>
		 {
		 stringreplace,wholex,wholex,`n`n,`n,all
		 filedelete,%CurrentCodesFile%
		 fileappend,%wholex%,%CurrentCodesFile%
		 }
		return


DDLVarbar:  ;; ComboBox1 Hanfler
		GUI, Varbatr:default
		; If (!RegexMatch(CodeString, RegexProduct) && !RegexMatch(CodeString, RegexBatch) && !RegexMatch(CodeString, RegexLot) && !RegexMatch(CodeString, RegexCoated))
		; If !RegexMatch(CodeString, RegexProduct)
			; return
		; else if !RegexMatch(CodeString, RegexBatch)
		; else if !RegexMatch(CodeString, RegexLot)
		; else if !RegexMatch(CodeString, RegexCoated))
; sleep 1000
			; Product:=RegexMatch(CodeString, RegexProduct,r) ? rProduct : ""
      ; Batch:=RegexMatch(CodeString, RegexBatch, r) ? rBatch : ""
      ; Lot:=RegexMatch(CodeString, RegexLot, r) ? rLot : ""
      ; Coated:=RegExMatch(CodeString, RegexCoated, r) ? rCoated : ""
      ; Ct:=rCoated ? " ct#" : ""

		; rProduct:=
		; rBatch:=
		; rlot:=
		; rCoated:=
		; ct:=
		if DeleteMatch
			{
				Gui, Varbar:submit,nohide
				sleep 200
				Control, Delete, %CodeStringEdit%, Combobox1, VarBar
				sleep 200
				Control, Add, %Variable%, Combobox1, VarBar
				sleep 200
				GuiControl, Varbar:ChooseString, ComboBox1, %Variable%
			Return
			}
			; if !Startup
			stopHandler:=1
			ControlGetText, CodeString, Edit5, VarBar
		; sleep 100
			if RegexMatch(CodeString, RegexProduct, r)
				GuiControl,Varbar:Text, Product, %rProduct%
			else
				GuiControl,Varbar:Text, Product, %Product%

			if RegexMatch(CodeString, a, r)
				GuiControl,Varbar:Text, Batch, %rBatch%
			else
				GuiControl,Varbar:Text, Batch,

			if RegexMatch(CodeString, RegexLot, r)
				GuiControl,Varbar:Text, lot, %rlot%
			else
				GuiControl,Varbar:Text, lot,

			if RegexMatch(CodeString, RegexCoated, r)
				GuiControl,Varbar:Text, Coated, %rCoated%
			else
				GuiControl,Varbar:Text, Coated,

			StopHandle:=
			; CodeString:=Trim(rProduct " " rBatch " " rLot Ct rCoated)
			return

		; VarbarHandler:
			; GUI, VarBar:submit,NoHide
		; If (!RegexMatch(Product, RegexProduct) && !RegexMatch(Batch, RegexBatch) && !RegexMatch(Lot, RegexLot) && !RegexMatch(Coated, RegexCoated))
		; CodeString:=Trim(Product " " Batch " " Lot Ct Coated)
		; IniWrite, %CodeString%, C:\Users\mmignin\Documents\VQuest\CodeString.ini, SavedVariables, CodeString
		; return

		ExcelConnectCheck:
			GUI, Varbar:Submit, Nohide
			IniWrite, %ExcelConnect%, Settings.ini, Options, ExcelConnect
			return
		ProductHandler:
		if StopHandle
			return
		GUI, VarBar:submit,NoHide
			if RegexMatch(Product, RegexProduct, r){
			IniWrite, %Product%, C:\Users\mmignin\Documents\VQuest\CodeString.ini, SavedVariables, Product
			ControlGetText, CodeString, Edit5, VarBar
			CodeString:=Trim(CodeString)
			sleep 20
			if RegExMatch(CodeString, RegexProduct){
				Codestring:=RegExReplace(CodeString, RegexProduct, rProduct)
			sleep 30
			; try GuiControl, Varbar:ChooseString, ComboBox1, % Product " " rProduct
			; catch
				ControlsetText, Edit5,%CodeString%, VarBar
			}
			else {
			CodeString:=Trim(rProduct " " CodeString)
			ControlsetText, Edit5,%CodeString%, VarBar
				}
		}
		return
		BatchHandler:
		if StopHandle
			return
		GUI, VarBar:submit,NoHide
			if RegexMatch(Batch, RegexBatch, r){
			IniWrite, %Batch%, C:\Users\mmignin\Documents\VQuest\CodeString.ini, SavedVariables, Batch
			ControlGetText, CodeString, Edit5, VarBar
			sleep 30
			CodeString:=Trim(CodeString)
			if RegExMatch(CodeString, RegexBatch){
				Codestring:=RegExReplace(CodeString, RegexBatch, rBatch)
			sleep 30
			; try GuiControl, Varbar:ChooseString, ComboBox1, % Product " " rBatch
			; catch
				ControlsetText, Edit5,%CodeString%, VarBar
			}
			else
				ControlsetText, Edit5,%CodeString% %rBatch%, VarBar

		}
		return
		LotHandler:
		if StopHandle
			return
		GUI, VarBar:submit,NoHide
			if RegexMatch(Lot, RegexLot, r){
			IniWrite, %Lot%, C:\Users\mmignin\Documents\VQuest\CodeString.ini, SavedVariables, Lot
			ControlGetText, CodeString, Edit5, VarBar
			if RegExMatch(CodeString, RegexLot){
				Codestring:=RegExReplace(CodeString, RegexLot, rLot)
			sleep 30
			; try GuiControl, Varbar:ChooseString, ComboBox1, % Product " " Batch " " rLot
			; catch
				ControlsetText, Edit5,%CodeString%, VarBar
			}
			else
				ControlsetText, Edit5,%CodeString% %rLot%, VarBar
		}
		return
		CoatedHandler:
		if StopHandle
			return
		GUI, VarBar:submit,NoHide
			if RegexMatch(Coated, RegexCoated, r){
			IniWrite, %Coated%, C:\Users\mmignin\Documents\VQuest\CodeString.ini, SavedVariables, Coated
			ControlGetText, CodeString, Edit5, VarBar
			if RegExMatch(CodeString, RegexCoated){
				Codestring:=RegExReplace(CodeString, RegexCoated, rCoated)
			sleep 30
			; try GuiControl, Varbar:ChooseString, ComboBox1, % Product " " Batch " " Lot " Ct#" rCoated
			; catch
				ControlsetText, Edit5,%CodeString%, VarBar
			}
			else
				ControlsetText, Edit5,%CodeString% Ct#%rCoated%, VarBar
		}
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
		Control, Delete, %TheSelectedLine%, Combobox1, VarBar    ; delete the focused item
		ControlGet, Wholex, List,,Combobox1, VarBar         ;- get the whole listbox1
		; sort,Wholex, U R
	if wholex<>
	 {
		 stringreplace,wholex,wholex,`n`n,`n,all
		 filedelete,%CurrentCodesFile%
		 fileappend,%wholex%,%CurrentCodesFile%
		; RemoveFileDuplicates("C:\Users\mmignin\Documents\VQuest\Data\CurrentCodes.txt")
	}
return
	}

loadSavedVariables(){ ;;___________________________LOADING VARIABLES_________________________
	global
		GUI, varbar:default
		; GUI, Varbar:Submit, Nohide
		IniRead, Varbar_X, Settings.ini, Locations, VarBar_X
		IniRead, Varbar_Y, Settings.ini, Locations, VarBar_Y
		Iniread, Iteration, Settings.ini, SavedVariables, Iteration
		ControlGetText, CodeString, Edit5, VarBar
		; iniRead, Product, Settings.ini, SavedVariables, Product
		; iniRead, Batch, Settings.ini, SavedVariables, Batch
		; iniRead, Lot, Settings.ini, SavedVariables, Lot
		; iniRead, Coated, Settings.ini, SavedVariables, Coated
		Iniread, HideVarBar, Settings.ini, Options, HideVarBar
		Iniread, ExcelConnect, Settings.ini, Options, ExcelConnect
		Iniread, ModeSelections, Settings.ini, Options, ModeSelections
		Iniread, CodesDropDown, Settings.ini, Options, CodesDropDown
		Iniread, Mode, Settings.ini, Options, Mode




	}


SaveVariables(){ ;;_________________SAVING VARIABLES_________________________
	global
		GUI, varbar:default
		GUI, Varbar:Submit, Nohide
					wingetpos, Varbar_X, Varbar_Y,W,H, VarBar ahk_class AutoHotkeyGUI
			IniWrite, %VarBar_y%, Settings.ini, Locations, VarBar_Y
			IniWrite, %varbar_x%, Settings.ini, Locations, VarBar_X
		ControlGetText, CodeString, Edit5, VarBar
	sleep 200
	IniWrite, %Iteration%, Settings.ini, SavedVariables, Iteration
	iniwrite, %CodeString%, Settings.ini, SavedVariables, CodeString
	if product
	iniwrite, %Product%, Settings.ini, SavedVariables, Product
	if Batch
	iniwrite, %Batch%, Settings.ini, SavedVariables, Batch
	if Lot
	iniwrite, %Lot%, Settings.ini, SavedVariables, Lot
	if Coated
	iniwrite, %Coated%, Settings.ini, SavedVariables, Coated
			; Gui, Varbar:submit, nohide

	ControlGet, CodesDropDown, List,,Combobox1,VarBar
	; iniwrite, %CodesDropDown%, Settings.ini, SavedVariables, Wholex
	FileAppend, %CodesDropDown%, Data\CodesDropDown.txt
	; IniWrite, %HideVarbar%, Settings.ini, Options, HideVarbar
	IniWrite, %ModeSelections%, Settings.ini, Options, ModeSelections
	FileAppend, %CodeString%, Data\CurrentCodes.txt
	sleep 200
	RemoveFileDuplicates("C:\Users\mmignin\Documents\VQuest\Data\CurrentCodes.txt")
	}


AddToList(Input:=""){  ;; __Add to List
	Global
	GUI, varbar:default
	; Gui, Varbar:submit, nohide
	Gui, Varbar:+Delimiter`r`n
	;Wholex:=
	ControlGetText, CodeString, Edit5, VarBar
		Variable:=Input ? Input : StrReplace(CodeString,"`r")
		if !Variable
			Variable:=StrReplace(CodeString,"`r")
		SplitVariables:=StrSplit(Variable, A_Space)
		lookforBatch:=Trim(SplitVariables[1] " " SplitVariables[2] " " SplitVariables[3] " " SplitVariables[4]) "`r"
		Regexlookfor:="i)" rProduct " " rBatch "`r"

		replacewith:=rProduct " " rBatch " " rLot " " Ct rCoated "`r`n"
		ControlGet, Wholex, List,,Combobox1, VarBar
				Control, Add, %Variable%, Combobox1, VarBar  ; add to the bottom of the list
	if wholex<> 															;Update List
	 {
	 ControlGet, Wholex, List,,Combobox1,VarBar
		Wholex:=RegExReplace(Wholex,RegexLookFor,Variable)
		stringreplace,wholex,wholex,`n`n,`n,all
		; sort,Wholex, U R
		filedelete,%CurrentCodesFile%
		fileappend,%Wholex%,%CurrentCodesFile%
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
				GUI,VarBar:Add,edit,		v%Variable% +wrap -multi	g%Variable%Handler %Dimensions%,		%    %Variable%
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

    ProductHistory(){
    global
		try Menu,Menu, deleteAll
		Loop, Read, data\Products.txt
			Menu, Menu, Add, %A_LoopReadLine%, ProductHistory
		Menu, Menu, Show
    return
    }
    ProductSelection(){
    global
    try menu,DropdownMenu, Deleteall
		GUI , varbar: default
  ;  ControlGet , Wholex, List, , Combobox1	;- get the whole listbox1
    ; stringreplace , wholex, wholex, `n `n, `n, all
    Loop, Read, data\CurrentCodes.Txt
    {
    ; If A_Index = 1 ;for if its an INI file
      ; Continue
    ParseList := StrSplit(A_LoopReadLine, "`n")
      if A_index < 10
        Selection:= % "&" A_index " " ParseList[1]
        ; Selection:= % ParseList[1]
       else
        Selection:= % "&" A_index-10 " " ParseList[1]
    Menu, Dropdownmenu, add, %Selection%, CurrentCodesMenu
    }
    Menu, DropdownMenu, Show,
    return

    CurrentCodesMenu:
      GuiControl, Varbar:ChooseString, ComboBox1, % RegExReplace(A_ThismenuItem, "i)(&\d\s)", "")
  		GUI, VarBar:submit,NoHide
      ; ControlsetText , Edit5, %A_ThismenuItem%, VarBar
      	; control , choose, %A_ThismenuItem%
      ; sleep 200
      ; Clipboard:=A_ThismenuItem
      return
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
		GUI, VarBar:submit,NoHide
		GUI, varbar:default
     clip.regex(A_ThisMenuItem)
			n:=A_ThisMenuItemPos
			GuiControl, ChooseString, ComboBox1, % Trim(A_ThisMenuItem)
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
		GUI, varbar:default
		GUI, VarBar:submit,NoHide
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
		FlashScreen()
		GuiControl Varbar:Focus, %Control%
		; sleep 100
		tt(CodeString,2000,A_caretx,A_caretY,4)
		Sendinput, ^{a}
		return
		}

	Relocate(){
		global
				PostMessage, 0xA1, 2
				; if MouseIsOver("VarBar")
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
		sleep 5
		Iteration+=1
		sleep %Speed%
		ControlsetText, Static1,%Iteration%,VarBar
		flovar(Iteration,200)
		; Pop(Iteration)
		; tt(Iteration,500,Varbar_x,Varbar_y,2,200)
		IniWrite, %Iteration%, Settings.ini, SavedVariables, Iteration
		; GuiControl, +redraw, varbar
		return
		}
		SubIteration(speed:=350){
		global Iteration
		; GuiControl, -redraw, varbar
		sleep 5
		Iteration-=1
		sleep %speed%
		ControlsetText, Static1,%Iteration%,VarBar
		Pop(Iteration)
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
				GUI, varbar:default
				Gui, Varbar:submit, nohide
				; GuiControl, Varbar:ChooseString, ComboBox1, % CodeString
				; GuiControl, Varbar:ChooseString, ComboBox1, % CodeString
				; GuiControl, Varbar:ChooseString, ComboBox1, % Product
				; GuiControl, Varbar:ChooseString, ComboBox1, % Batch
						; Send, ^a^c
						; winactivate, NuGenesis LMS - \\Remote
				LMS.Searchbar(clipboard,"{enter}")
			}
			else if (winControl="Edit5")
				varbar.AddToList()
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
		; Numlock::gosub, Volume_Mute
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
		Wheelup::      sendInput % Blockrepeat(300) Varbar.AddIteration(10)
		Wheeldown::    sendInput % Blockrepeat(300) Varbar.SubIteration(10)
		+wheelup::	Varbar.AddIteration(0)
		+wheeldown::Varbar.SubIteration(0)
		; up::				Varbar.AddIteration(0)
		; down::   		Varbar.SubIteration(0)
		; F15::						vscode.reloadscript()
		F9::           Excel.connect()
		F7::           Excel.NextSheet()
		F6::           Excel.PrevSheet()
		F8::				Varbar.launchTable()
			return
		Rbutton::
		MouseGetPos,,,,winControl
				if (winControl="Edit1")
					Excel.Products()
				else if (winControl="Edit2") || (winControl="Edit3")
					Excel.Batches()
				else if (winControl="Static1")
					VarBar.Menu()
				else
					Excel.setstatus()
			return
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
			;	setTimer, SaveVarBarLocaton, -1500

		return
		SaveVarBarLocaton:
			; sleep 200
			wingetpos, Varbar_X, Varbar_Y,W,H, VarBar ahk_class AutoHotkeyGUI
			IniWrite, %VarBar_y%, Settings.ini, Locations, VarBar_Y
			IniWrite, %varbar_x%, Settings.ini, Locations, VarBar_X
			return
}

	; WM_LBUTTONUP(wParam := "", lParam := "") {  ; User clicked on the GUI
 	;  GUI, varbar:Submit, nohide
	; ;  SendInput % "{Text}" clip[clipNum]
	; }

; WM_MOUSEMOVE(){
	; global
	; GUI, Varbar:default
	; If Varbar_H:=VarBar_H_Max
		; Return
	; ControlGetFocus, GUIFocus, VarBar

;	If MouseIsOver("VarBar") {
;    winMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%Varbar_H_max%
		;settimer, ShrinkVarBar, 200
;		return
	;}
	; if GUIFocus
;	else
 ;   winMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%Varbar_H_max%
;		if !GetKeyState("Lctrl", "D")
	;		settimer, ShrinkVarBar, 200
; return


		ShrinkVarbar:
		ControlGetFocus, GUIFocus, VarBar
			if !MouseIsOver("VarBar ahk_exe AutoHotkey.exe") && !GetKeyState("Lctrl", "D") {
				Settimer, ShrinkVarBar, Off
		    winMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%Varbar_H%

			}
			else
		    winMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%Varbar_H_Max%
				return
			return
; }


VarBar_ResetSub:
  VarBar.Reset()
  return
Exitsub(){
	global
  varbar.SaveVariables()
	; CloseScript("cl3.ahk")
	; sleep 200
	; CloseScript("Vim.ahk")
	; Sleep 200
  exitapp
  }

#include C:\Users\mmignin\Documents\VQuest\lib\BatchesDDL.ahk
