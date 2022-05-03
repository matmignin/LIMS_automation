; #include *i C:\Users\mmignin\Documents\VQuest\lib\Functions.ahk

  ; if RegexMatch(Clipboard, "<<LabelCopy>>"){
  ; if RegexMatch(Clipboard, "<<[abcdefghijkl]\d{3}>>")
  ; if RegexMatch(Clipboard, "<<SheetInfo>>")
  ; if RegexMatch(Clipboard, "<<QuIT>>"){
  ; if RegexMatch(Clipboard, "<<MsgBoXTesT>>")
    ; Test_msgbox(clipboard)
#ifwinactive,
Return
clipChange(type){
  global
  sleep 50
  if SimpleClip
    return
  if InStr(Clipboard, "<<LabelCopy>>", true,1,1){
    if (Iteration >=25) || (Iteration < 0)
      iteration:=1
    ProductTab.AddIngredient()
  }
  else if Instr(Clipboard, "<<SheetInfo>>",true,1,1)
    ProductTab.AddProduct()
  ; else if InStr(Clipboard, "<<QuIT>>",true, 1,1){
    ; exitapp
    ; sleep 25
    ; }
  else
    clip.codesRegex()
    sleep 50
}






Clip(input=50,Wait:="0.95"){
  global tab, Batch, Product, lot, coated, sampleid, analytical,micro,retain,physical,CTphysical,CTretain,department, regexProduct
  clipboard:=
    Send, ^{c}
  sleep %input%
  clipwait,%Wait%
  if errorlevel
  {
    tt("clip error level")
    sleep 100
  }
  clip.CodesRegex()
  return
}





Class Clip {

EditBox(Input:=""){
  Global EditBox
	try GUI, EditBox:Destroy
  if !Input
		Result := Clipboard
  else
    result := Text
	Gui EditBox: +AlwaysOnTop +Toolwindow +Resize +owner +HwndGUIID
		GUI, EditBox:Font, s12 cBlack, Consolas
    gui, editbox:Margin,1,1
		GUI, EditBox:Add, Edit, x0 y0 +Resize vEditBox , % Result
		GUI, EditBox:add, button, X0 y0 h0 w0 Hidden default gEditBoxButtonOK, OK
		GUI, EditBox:Show,Autosize, Clipboard
    winSet, Transparent, 100, EditBox
		return
		EditBoxGuiClose:
		EditBoxGuiEscape:
		EditBoxButtonOK:
		GUI, EditBox:submit
    if !Text
			clipboard:=EditBox
    sleep 50
  TT(Editbox,500,,,,200)
		return

    EditBoxGuiSize:
  if (ErrorLevel = 1)  ; The window has been minimized. No action needed.
      return
    NewWidth := A_GuiWidth
    NewHeight := A_GuiHeight
    GuiControl, Move, EditBox, W%NewWidth% H%NewHeight%
    return

	}













Append(Delimiter:="`n"){
    global
		PreClip:=Clipboard
		Clipboard:=
		Send, ^c
    sleep 75
		; clipwait, 0.75
		if errorlevel
      clipboard:=Preclip
    else
    {
      tt(Preclip "`n `t __________________ `n" clipboard)
      clipboard := Preclip Delimiter Clipboard
      sleep 50
      ; tt(clipboard,1000,A_ScreenWidth-500,,2,150)
    }
		return
}

CodesRegex(input:=""){
  global RegexProduct, RegexBatch, RegexLot, RegexCoated, Product, Lot, Batch, Coated, CodeString
    Gui Varbar:Default
      Parse:= Input ? Input : Clipboard
      Product:=RegexMatch(Parse, RegexProduct,r) ? rProduct : Product
      Batch:=RegexMatch(Parse, RegexBatch, r) ? rBatch : Batch
      Lot:=RegexMatch(Parse, RegexLot, r) ? rLot : Lot
      Coated:=RegExMatch(Parse, RegexCoated, r) ? rCoated : Coated
      Coated:=RegExMatch(Parse, RegexCoated, r) ? rCoated : Coated
      if RegexMatch(Parse, "\[\[(?P<CustomerPosition>-?\d+)\]\]", r){
        Iteration:=Floor(rCustomerPosition)
        CustomerPosition:=rCustomerPosition
        sleep 40
    }
      ; Ct:=rCoated ? " ct#" : ""
      stringUpper, Product, Product
      GuiControl,Varbar:Text, Product, %Product%
      GuiControl,Varbar:Text, Batch, %Batch%
      GuiControl,Varbar:Text, lot, %lot%
      GuiControl,Varbar:Text, Coated, %Coated%
      GuiControl,Varbar:Text, Iteration, %Iteration%
      			GUI, VarBar:submit,NoHide
      codeString:=trim(rProduct " " rBatch " " rLot Ct rCoated)
      ; tt(CodeString)
     Return Trim(CodeString)
}





SetVarbar(){
  global Product, Batch, Lot, Coated
    Gui Varbar:Default
      stringUpper, Product, Product
      GuiControl,Varbar:Text, Product, %Product%
      GuiControl,Varbar:Text, Batch, %Batch%
      GuiControl,Varbar:Text, lot, %lot%
      GuiControl,Varbar:Text, Coated, %Coated%
      ; Ct:=Coated ? " ct#" : ""
}


SingleRegex(){
    global
      this.CodesRegex(Haystack)
}

Regex(Category:=""){
    global
    if !Category
      Haystack:=Clipboard
    else
      Haystack:=Category
    sleep      100
      Gui Varbar:Default
      RegExMatch(HayStack, RegexProduct,r)  ;"i)[abdefghijkl]\d{3}", rProduct)
        If rProduct {
          GuiControl,Varbar:Text, Product, %rProduct%
          stringUpper, rProduct, rProduct
          Product:=rProduct
        }
      RegExMatch(HayStack, RegexBatch, r)
        If rBatch {
          GuiControl,Varbar:Text, Batch, %rBatch%
          Batch:=rBatch
        }
      RegExMatch(HayStack, RegexLot, r)
        If rLot {
          GuiControl,Varbar:Text, lot, %rlot%
          lot:=rLot
        }
      RegExMatch(HayStack, RegexCoated, r)
        If rCoated {
          GuiControl,Varbar:Text, Coated, %rCoated%
          Coated:=rCoated
        }
      If !rLot {
        GuiControl,Varbar:Text, lot, %rlot%
        lot:=
      }
      If !rCoated {
        GuiControl,Varbar:Text, Coated, %rCoated%
        Coated:=
      }
      ; GuiControl, Varbar:MoveDraw, Coated
      gui varbar:submit, nohide
      ; tt(Product " " Batch " " lot " " Coated)
      sleep 20
  }
Department(DepartmentInput:=""){
  global Department
      Department:=
     if !DepartmentInput
      DepartmentHaystack:=Clipboard
    else
      DepartmentHaystack:=DepartmentInput
      sleep 150
      Regexmatch(DepartmentHaystack, "F,\sMicro",Micro)
      Regexmatch(DepartmentHaystack, "I,\sRetain", Retain)
      Regexmatch(DepartmentHaystack, "I,\sPhysical", Physical)
      Regexmatch(DepartmentHaystack, "CT,\sPhysical", ctPhysical)
      Regexmatch(DepartmentHaystack, "CT,\sRetain", ctRetain)
      Regexmatch(DepartmentHaystack, "I,\sAnalytical", Analytical)
      Sleep      20
      If Micro
        Department:="Micro"
      else If Retain
        Department:="Retain"
      else If ctRetain
        Department:="ctRetain"
      else If Physical
        Department:="Physical"
      else If ctPhysical
        Department:="ctPhysical"
      else If Analytical
        Department:="Analytical"
      else
        msgbox % "`nDepartment: " Department "`nmicro: " micro "`nretain: " retain "`nctretain: " ctretain "`nphysical: " physical "`nctphysical: " ctphysical "`nanalytical: " analytical
  return %Department%
}

IfNothingSelected(action){
  global
    ClipboardSaved:=ClipboardAll
    clipboard:=
    Send, ^cl
      clipwait,0.40
  if errorlevel ;if nothing selected
  {
    if action:="SelectLine"
      Send, {home}+{end}^{c}
    if action:="SelectAll"
      Send, ^{a}^{c}{ctrlup}
    if action:="Select"
      Send, {click 3}^{c}{ctrlup}
    If action:="cut"
      {
        Send, ^{x}
        clipwait, 0.45
        PostCut:=ClipboardAll
        clipboard:=ClipboardSaved
        sleep 35
        Send, ^{v}
        clipboard:=PostCut
      }
    If action:="Paste"
    {
      clipboard:=ClipboardSaved
      Send, ^{v}{ctrlup}
    }
    else
      send % action
    return
  }
  else
  return
}








}

