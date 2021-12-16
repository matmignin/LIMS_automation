#include <BatchesDDL>
FloVar(VariableText:="", MousePopup:="", FontSize:=20){
		Global
		try Gui, FloVar:Destroy
		CoordMode, Mouse, Screen
		; MouseGetPos, Mx, My
		CustomColor := "000000"  ; Can be any RGB color (it will be made transparent below).
		Gui FloVar: +LastFound +AlwaysOnTop -Caption +Toolwindow  ; +Toolwindow avoids a taskbar button and an alt-tab menu item.
		Gui, FloVar:Color, %CustomColor%
		Gui, FloVar:Font, % "s" Fontsize  ; Set a large font size (32-point).
		Gui, FloVar:Add, Text, +wrap R30 vMyText cFFCC00, XXXXXXXXXXXXXXXXXX YYYYYYYYYYYYYYYYYY  ; XX & YY serve to auto-size the window.
		; Make all pixels of this color transparent and make the text itself translucent (150):
		winSet, TransColor, %CustomColor%  250
		if VariableText{
			FloVarText:=VariableText
			; Gui, FloVar:Font, s5
			}
		else {
			FlovarText:=
			if Product
				FlovarText.=Product
			if Batch
				FlovarText.=" " Batch
			if lot
				FlovarText.=" " lot
			if Coated
				FlovarText.=" Ct#" Coated
		}
		; SetTimer, updateOSD, -100
		Gosub, FloatOSD  ; Make the first update immediate rather than waiting for the timer.
		if (MousePopup){
			; Gui, FloVar:Font, % "s" MousePopup
			; my-=500
			SetTimer, FloatOSD, 50
			Gui, FloVar:Show, x%mx% y%my% NoActivate, FloVar  ; Noactivate avoids deactivating the currently active window.
			SetTimer, PopUpOSD, % "-" MousePopup
		}
		else
			Gui, FloVar:Show, x%mx% y%my% NoActivate, FloVar  ; Noactivate avoids deactivating the currently active window.
	return
		updateOSD:
		MouseGetPos, Mx, My
			return
		PopupOSD:
			try gui, FloVar:destroy
			SetTimer, FloatOSD, Off
			return
		FloatOSD:
			CoordMode, mouse, Screen
			MouseGetPos, Mx, My
			My+=100
			Mx-=100
			GuiControl, FloVar:Text, MyText, % FloVarText
			winMove, FloVar ahk_class AutoHotkeyGUI, ,Mx, My
			; sleep 50
			return
	}



Class VarBar{
	Show(X:=1, Y:=1, Destroy:="Reset"){
			Global
			try Gui,VarBar:Destroy
			if !showVarbar
				return
				TopScreen:=1 ;A_ScreenHeight-35
				MidScreen:=A_ScreenWidth//2
				VarBar_H=32
				VarBar_H_max=82
				VarBar_T:=235
				VarBar_W=315
				if !varbar_x
					Varbar_x:=1
				if !varbar_y
					Varbar_y:=1
				; If HideVarBar
					; return
			This.loadSavedVariables()
				Gui Varbar:Default
				Gui VarBar: +AlwaysOnTop -Caption +Toolwindow +owner +HwndGUIID
				winSet, Transparent, 100, %GUIID%
				This.SetColor()

				this.AddBoxes()
			CoordMode, mouse, screen
			; Ifwinexist, NuGenesis LMS - \\Remote
			; LMS.Orient()
			try Gui, VarBar:Show,  x%Varbar_X% y%Varbar_y% w%VarBar_w% h%varbar_H% Noactivate, VarBar
			catch
				Gui, VarBar:Show,  x1 y1 w%VarBar_w% h%varbar_H% Noactivate, VarBar
		CoordMode, mouse, window
		ControlsetText, Static1, %Iteration%,VarBar
		OnMessage(0x0201, "WM_LBUTTONDOWN")
		OnMessage(0x0200, "WM_MOUSEMOVE")
		OnMessage(0x203,  "VariableBar_Relocate")
		OnMessage(0x002C, "ODDDL_MeasureItem") ; WM_MEASUREITEM
		OnMessage(0x002B, "ODDDL_DrawItem")    ; WM_DRAWITEM
		winSet, Transparent, %Varbar_T%, AHK_id %GUIID%
		return
	}

	AddBoxes(){
			global
			CurrentCodes =
			this.AddEdit("Product",	"left h29 x1 y1 w65",			"16 Bold")
			this.AddEdit("Batch",		"left h29 x+1 y1 w85", 			"12,Consolas")
			If !Lot
				 L_L:="w80"
			else
					L_L:=
			this.AddEdit("Lot",			"left h29 x+1 y1 " L_L , 			"9, Consolas")
			If !Coated
				 C_L:="w55"
			else
					C_L:=
				this.AddEdit("Coated",	"left h29 x+1 y1 wrap " c_L,			"9, Arial Narrow")
			This.AddText("Iteration","x+5 center y-3 w23",		"20 Bold 107C41, Consolas")	; Text1
			this.AddBatchesDDL(0,"x1 yP+34 w250 r50 h21 vDDL gDDLVarbar hwndHDDL +0x0210") ;combobox1
			Gui, VarBar:add, Checkbox, x+3 Y35 vExcelConnect gExcelConnectCheck Checked%ExcelConnect%, Excel ;button1
			ComboBoxSelection:=Note1 "`nEnteringRotations`nSwitchWorkSheets`nTempCode`n"
			This.AddModeComboBox("Mode", ComboBoxSelection,"altsubmit x1 Yp+21 w150") ;edit 5


			; This.addedit("Note1"," X+1 H23 w150 left" ,"9 cBlack,arial Narrow") ; edit6
			; This.addedit("Note2"," X+2 H23  w290 left","9 cBlack,arial Narrow")
;				Gui, Varbar:add,
						; edit7

			if ShowSampleID
				this.AddEdit("SampleID","x+1 w85",					"9, Arial Narrow")
			else
				this.AddEdit("SampleID"," x+1 w0",					"9, Arial Narrow")

		Return

		ModeDDL:
		Gui, VarBar:submit,NoHide
		; tt(mode)
		sleep 200
		This.Setcolor()
		If Mode=1
			send, {right}
		else If Mode=2
			Mode := "EnteringRotations"
		else If Mode=3
			Mode := "SwitchWorkSheets"
		else If Mode=4
			Mode := "TempCode"
		else {
			Note1:=Mode
			settimer, ShrinkVarbar, -800

		}
			IniWrite, %Mode%, Settings.ini, Options, Mode
		return
		; sleep 200




		; TT(A_GuiControlevent " " A_GuiEvent " " A_Gui " " A_ThisMenuItem " " A_EventInfo " " Note1 " " Mode)
		return

			DDLVarbar:
			; sleep 100
			; clip.Regex(DDL)
			Gui, VarBar:submit,NoHide
			; tt(DDL)
      RegExMatch(DDL, "i)[abdefghijkl]\d{3}", cProduct)
			; cBatch := RegExReplace(DDL, "/b(\d{3})(\d{4})/b", "$1-$2")
      RegExMatch(DDL, "i)(?<!(ct#\s|Ct#|ct))\d{3}(-)?\d{4}", cBatch)
					if RegExMatch(cBatch, "i)(?<!ct)\b\d{3}\	d{4}\b")
				cBatch := RegExReplace(cBatch, "\b(\d{3})(\d{4})\b", "$1-$2")
      ; RegExMatch(DDL, "i)(?<!Ct#)\d{3}-\d{4}\b", cBatch)
      RegExMatch(DDL, "i)(\b\d{4}[a-z]\d[a-z]?|\bBulk\b|G\d{7}\w?\b)", clot)
      RegExMatch(DDL, "i)(coated: |ct#\s|Ct#|ct(\s)?|coated\s)(?P<Coated>\d{3}-\d{4})", c)
      If cProduct {
				gui, Varbar:font, cBlack s16  Norm w700, Consolas
				GuiControl, Font, Product
				StringUpper,cProduct,cProduct
        GuiControl,Varbar:Text, Product, %cProduct%
        ; Product:=cProduct
      }
      If cBatch {
				gui, Varbar:font, cBlack s12 Norm w400 ,Consolas
				GuiControl, Font, Batch
        GuiControl,Varbar:Text, Batch, %cBatch%
        Batch:=cBatch
      }
      If cLot {
				gui, Varbar:font, cBlack s9 Norm w500 , Consolas
				GuiControl, Font, lot
        GuiControl,Varbar:Text, lot , %clot%
        lot:= cLot
      }
      If cCoated {
				gui, Varbar:font, cBlack s9 Norm w500, Arial Narrow
				GuiControl, Font, Coated
        GuiControl,Varbar:Text, Coated, %cCoated%
        Coated:=cCoated
      }


      If !cProduct {
				Gui, Varbar:font, cFFFFFF  Italic w300, Arial Narrow
				GuiControl, Font, Product
				; Gui, VarBar:Color, CCCCCC
				; GuiControl,Varbar:Text, Product, %cProduct%
        Product:=cProduct
      }
      If !cBatch {
				Gui, Varbar:font, cFFFFFF s10 italic w300, Arial Narrow
				GuiControl, Font, Batch
				; Gui, VarBar:Color, CCCCCC
				; GuiControl,Varbar:Text, Batch, %cBatch%
        Batch:=cBatch
      }
      If !cLot {
				Gui, Varbar:font, cFFFFFF  s9 italic w300, Arial Narrow
				GuiControl, Font, lot
				; Gui, VarBar:Color, CCCCCC
				; GuiControl,Varbar:Text, lot, %clot%
        lot:=cLot
      }
      If !cCoated {
				Gui, Varbar:font, cFFFFFF s9 italic w300, Arial Narrow
				GuiControl, Font, Coated
				; Gui, VarBar:Color, CCCCCC
				; GuiControl,Varbar:Text, Coated, %cCoated%
        Coated:=cCoated
      }

			return

			ExcelConnectCheck:
			gui, Varbar:Submit, Nohide
			this.SaveVariables()
			return

			ProductVarBar:
			BatchVarBar:
			LotVarBar:
			SampleIDVarBar:
			Note1VarBar:
			Note2VarBar:
			Note3VarBar:
			CoatedVarBar:
			Gui, VarBar:submit,NoHide
			sleep 50
			; if ExcelConnect
				; excel.Connect(1)
			this.SaveVariables()
			return

			VarBarGuiClose:
			VarBarGuiEscape:
				sleep 50
				this.SaveVariables()
			return
		}
AddModeComboBox(Variable:="Mode",Selections:="",Options:=""){
	global
	Gui, Varbar:add, ComboBox, %Options% v%Variable% g%Variable%DDL, % Selections
	GuiControl, ChooseString, ComboBox2, % %Variable%
	}
updateWith(Input){
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
		ControlsetText, Edit1,%VarProduct%,VarBar
		; GuiControl,Varbar:Text, Product, %VarProduct%
		; GuiControl,Varbar:Text, Batch, %VarBatch%
		; GuiControl,Varbar:Text, lot, %Varlot%
		; GuiControl,Varbar:Text, Coated, %VarCoated%
		GuiControl, MoveDraw, DDL
		try XL.Sheets(VarProduct).activate
		return
		}




AddBatchesDDL(Variable:="",Options:=""){
   global
	 ConnectedProduct:=
	 if !Variable
			FileRead, Variable, Data\CurrentCodes.txt
				GUI,VarBar:Font,			 s9, ArialNarrow ;cBlack Bold, %Font%
				gui, Varbar:+Delimiter`n
	Gui, Varbar:Add, ComboBox, %Options%, % RemoveTextDuplicates(Variable) ;Variable ;StrReplace(StrReplace(RemoveTextDuplicates(Variable), "`n", "|"), "`n`n","`n")
		        if Product
            ConnectedProduct:=Product
            if Batch
              ConnectedProduct.= " " Batch
            if Lot
              ConnectedProduct.= " " Lot
            if Coated
              ConnectedProduct.= " Ct#" Coated
		try GuiControl, Varbar:ChooseString, DDL, %Variable%
		Catch
				GuiControl, Varbar:ChooseString, DDL, % ConnectedProduct
		; GuiControl, Varbar:MoveDraw, DDL
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

BatchesMenu(Formulation,Next:=""){
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
      try Menu, Batchdropdownmenu, Deleteall
					; Sort, Batches, R
        For Each, Element In Batches {
          CurrentBatches .= Element "`n"
          Menu, BatchDropdownmenu, add, %Element%, BatchDropdownMenu
      }
    }
		if !Next
    	Try Menu, BatchDropdownMenu, Show,
		else {
			try Menu, Batchdropdownmenu, Deleteall
			n:=Next+1
			Clip.regex(Batches[n])
			if (batches.maxindex() = n)
				N:=1
		}
    return
    BatchDropDownMenu:
     clip.regex(A_ThisMenuItem)
			n:=A_ThisMenuItemPos
     return

}

SetColor(){
			global
		; GuiControl, -redraw, varbar
		if (A_mode=="TempCode")
			Gui, VarBar:color,272822, FFFFFF
		else If (Mode=="Debugging")
			Gui, VarBar:color,272822, 808000 ;pink
		else if winExist("Mats LMS Workbook.xlsb - Excel")
			excel.matchcolor()
		else
			Gui, VarBar:color,DC734F, 97BA7F
		; GuiControl, +redraw, varbar
		}

Hoveraction(Size:=90){
  global
	If (MouseIsOver("VarBar ahk_exe AutoHotkey.exe") && Varbar_H=32 ){
		; ControlGetFocus, GUIFocus, VarBar
    VarBar_H:=90
    winMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%VarBar_H%
	}
	else If (Varbar_H=90){
		ControlGetFocus, GUIFocus, VarBar
		if (GUIFocus) || MouseIsOver("VarBar ahk_exe AutoHotkey.exe")
			return
		else {
		VarBar_H:=32
    winMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%VarBar_H%
		}
	}
}


	loadSavedVariables(){
		global
		if !winExist("Mats LMS Workbook.xlsb") || !ExcelConnect { ;|| !RegexMatch(XL.activeSheet.Name, "i)[abdefghijkl]\d{3}"){
			Iniread, Product, Settings.ini, SavedVariables, Product
				; if RegExMatch(Product, "i)[abdefghijkl]\d{3}", Product)
			Iniread, Batch, Settings.ini, SavedVariables, Batch
			Iniread, Batch0, Settings.ini, SavedVariables, Batch0
			Iniread, Batch1, Settings.ini, SavedVariables, Batch1
			Iniread, Lot, Settings.ini, SavedVariables, Lot
			Iniread, ShowCoated, Settings.ini, Options, ShowSampleID
			Iniread, Coated, Settings.ini, SavedVariables, Coated
			iniread, CodeString, Settings.ini, SavedVariables, CodeString

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
			Iniread, HideVarBar, Settings.ini, Options, HideVarBar
			Iniread, ExcelConnect, Settings.ini, Options, ExcelConnect
			Iniread, Mode, Settings.ini, Options, Mode
			Products:=[]
        FileRead, LoadedCodes, Data\CurrentCodes.txt
				; Iniread, LoadedCodes, Data\Products.ini, CurrentCodes, %The_Hour%
        Products := Trim(StrSplit(LoadedCodes,"`r`n"))
		}

;;___________________________SAVING VARIABLES_________________________
	SaveVariables(){
		global
		CodeString:=
			IniWrite, %Iteration%, Settings.ini, SavedVariables, Iteration
		if RegExMatch(Product, "i)[abdefghijkl]\d{3}"){
			iniwrite, %Product%, Settings.ini, SavedVariables, Product
			CodeString.=Product
			}
      ; RegExMatch(HayStack, "i)(coated: |ct#/\s|Ct#|ct\s|coated\s)(?P<Coated>\d{3}-\d{4})", c)
		; if Batch
      if RegExMatch(Batch, "i)(?<!Ct#)\d{3}-\d{4}\b"){
			iniwrite, %Batch%, Settings.ini, SavedVariables, Batch
			CodeString.=" " Batch
			}
		; if Lot
      if RegExMatch(Lot, "i)(\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b)"){
			iniwrite, %Lot%, Settings.ini, SavedVariables, Lot
			CodeString.=" " Lot
			}
		; if Coated
      if RegExMatch(Coated, "i)(\d{3}-\d{4})"){
			iniwrite, %Coated%, Settings.ini, SavedVariables, Coated
			CodeString.=" Ct#" Coated
			}
		if SampleID
			iniwrite, %SampleID%, Settings.ini, SavedVariables, SampleID
		; if Iteration
		; if CurrentCodes
			; IniWrite, %CurrentCodes%, Data\Products.ini, CurrentCodes, %The_Hour%
		CodeString:=Trim(CodeString, "`n")
		if Note1
			IniWrite, %note1%, Settings.ini, Notes, note1
		if Note2
			IniWrite, %note2%, Settings.ini, Notes, note2
		if Mode
			IniWrite, %Mode%, Settings.ini, Options, Mode
			IniWrite, %ExcelConnect%, Settings.ini, Options, ExcelConnect
			iniwrite, %CodeString%, Settings.ini, SavedVariables, CodeString
			IniWrite, %HideVarbar%, Settings.ini, Options, HideVarbar
			FileAppend, `n%CurrentCodes%, data\CurrentCodes.txt
			sleep 200
		RemoveFileDuplicates("C:\Users\mmignin\Documents\VQuest\Data\CurrentCodes.txt")
		; if Note3
			; IniWrite	, %note3%, Settings.ini, Notes, note3
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
				keywait, Lbutton, U T1
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
	#Ifwinactive, VarBar ahk_exe AutoHotkey.exe
		F19 & F20::Send, {tab}{shiftdown}{tab}{shiftup} ;varbar.focus("Batch")
	;	F19::varbar.focus("Product")
		; F20::varbar.focus("Batch")
		^enter::
								winactivate, %the_winTitle%
								click, %caret_X%, %caret_y%
								return
		Mbutton::
			click
		enter::
			ControlGetFocus,winControl,VarBar ahk_exe AutoHotkey.exe
			if (winControl="Edit1") || (winControl="Edit2") || (winControl="Edit3") ||(winControl="Edit4"){
						Send, ^a^c
						winactivate, NuGenesis LMS - \\Remote
				LMS.Searchbar(clipboard,"{enter}")
			}
			if (winControl="Edit6") || (winControl="Edit7") || (winControl="Edit8") || (winControl="Edit9")
				varbar.SaveVariables()
				;varbar.show()
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
		; F13 & k::
		; wheeldown::selectnextBatch()
		; F13 & j::
		; wheelup::SelectPreviousBatch()
		Mbutton::
		InputBox, Iteration, ITERATIONR,,,100,50 , , , , , 1
		sleep 50
			GuiControl, Varbar:Text, iteration, %iteration%
		; gui, varbar:default
		; gui, Varbar:Submit, Nohide
		return
		Numlock::
			MouseGetPos,,,,winControl
				if (winControl="Edit1") || (winControl="Edit2") || (winControl="Edit3"){
					click
					Send, ^a
					clip.regex()
					winactivate, NuGenesis LMS - \\Remote
					LMS.Searchbar(clipboard,"{enter}")
					return
				}
				else if (winControl="Edit6")
					TT(wincontrol)
				else
					VarBar.Menu()
				return
		Wheelup::      sendInput % Blockrepeat(600) Varbar.AddIteration(10)
		Wheeldown::    sendInput % Blockrepeat(600) Varbar.SubIteration(10)
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
		PostMessage, 0xA1, 2
				X := lParam & 0xFFFF
				Y := lParam >> 16
				if A_GuiControl
					ctrl := "`n(in control " . A_GuiControl . ")"
				PostMessage, 0xA1, 2
				MouseGetPos,,,,winControl
				setTimer, SaveVarBarLocaton, -1000

		return
		SaveVarBarLocaton:
			wingetpos, Varbar_X, Varbar_Y,W,H, VarBar ahk_class AutoHotkeyGUI
			IniWrite, %VarBar_y%, Settings.ini, Locations, VarBar_Y
			IniWrite, %varbar_x%, Settings.ini, Locations, VarBar_X
			;IniWrite, %Mode%, Settings.ini, Options, Mode
			return
}

WM_MOUSEMOVE(){
	global
	gui, Varbar:default
	ControlGetFocus, GUIFocus, VarBar
	If MouseIsOver("VarBar ahk_exe AutoHotkey.exe") || GUIFocus {
    winMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%Varbar_H_max%
		settimer, ShrinkVarBar, 200
		return
	}

		ShrinkVarbar:
		ControlGetFocus, GUIFocus, VarBar
			if (!GUIFocus && !MouseIsOver("VarBar ahk_exe AutoHotkey.exe")) {
				Settimer, ShrinkVarBar, Off
					gui, Varbar:Default
					if mode is not integer
					{
						GuiControl,,Mode, % Note1 ;
						GuiControl, VarBar:MoveDraw, Mode
						Mode:=1
					}
		    winMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%Varbar_H%

			}
			else
				return
			return
}



