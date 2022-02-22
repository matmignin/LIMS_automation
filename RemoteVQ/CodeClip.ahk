; #include *i C:\Users\mmignin\Documents\VQuest\lib\Functions.ahk

#ifwinactive,
Return
GetAllBatches(Delimiter:=" ",File:=""){
  global
  regBatches:=[]
		Haystack:=Clipboard
		PreClip:=Clipboard
		sleep 50
  while pos := RegexMatch(Haystack, "i)(?<!Ct#)\b\d{3}-\d{4}\b", aBatch, pos+1) ; {
      regBatches.insert(aBatch)
  ; }
      AllBatches:=[], oTemp := {}
      for vKey, vValue in regBatches
      {
          if (ObjGetCapacity([vValue], 1) = "") ;is numeric
          {
              if !ObjHasKey(oTemp, vValue+0)
                  AllBatches.Push(vValue+0), oTemp[vValue+0] := ""
          }
          else
          {
              if !ObjHasKey(oTemp, "" vValue)
                  AllBatches.Push("" vValue), oTemp["" vValue] := ""
          }
        }
    AllBatches:=Listarray(AllBatches,"")
    AllBatches:= StrReplace(AllBatches, A_space A_space, Delimiter)
    AllBatchesDDL:= StrReplace(AllBatches, A_space A_space, "`r`n")


    SimpleClip:=1
    sleep 20
		clipboard:=AllBatches
		sleep 200
		send, ^v
    sleep 400
    SimpleClip:=1
    clipboard:=PreClip
		return AllBatches
}
GetAllProducts(Delimiter:=" ",File:=""){
  global
  regProducts:=[]
  pos=0
		Haystack:=Clipboard
    PreClip:=Clipboard
		sleep 50
  while pos := RegexMatch(Haystack, RegexProduct, aProduct, pos+1) ; {
      regProducts.insert(aProduct)
  ; }
      AllProducts:=[], oTemp := {}
      for vKey, vValue in regProducts
      {
          if (ObjGetCapacity([vValue], 1) = "") ;is numeric
          {
              if !ObjHasKey(oTemp, vValue+0)
                  AllProducts.Push(vValue+0), oTemp[vValue+0] := ""
          }
          else
          {
              if !ObjHasKey(oTemp, "" vValue)
                  AllProducts.Push("" vValue), oTemp["" vValue] := ""
          }
        }
    AllProducts:=Listarray(AllProducts,"")
    AllProducts:= StrReplace(AllProducts, A_space A_space, Delimiter)
    SimpleClip:=1
    sleep 20
    clipboard:=AllProducts
    sleep 200
    send, ^v
    sleep 400
    SimpleClip:=1
    clipboard:=Preclip
		Return AllProducts
}




Clip(input=0,Wait:="0.45"){
  global tab, Batch, Product, lot, coated, sampleid, analytical,micro,retain,physical,CTphysical,CTretain,department, regexProduct
  clipboard:=
    Send, ^{c}
  clipwait,%Wait%
  sleep %input%
  if errorlevel
  {
    tt("clip error level")
    sleep 100
  }
  clip.CodesRegex()
  return
}



clipChange(type){
  global
  ifwinactive, Select tests for request: R
    return
  if SimpleClip
    return
  if RegexMatch(Clipboard, "<<LabelCopy>>\|.*")
    msgbox, Yo a label copy
  sleep 50
  clip.codesRegex()
    sleep 25
    if A_PriorKey = c
      tt(Clipboard,2000,3)
    else if A_PriorhotKey = F19
      tt(Clipboard,2000,3)
    else if A_PriorKey = x
      tt(Clipboard,2000,3)
    else if A_PriorKey = b
      return
    ; }
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
      Ct:=rCoated ? " ct#" : ""
      GuiControl,Varbar:Text, Product, %Product%
      GuiControl,Varbar:Text, Batch, %Batch%
      GuiControl,Varbar:Text, lot, %lot%
      GuiControl,Varbar:Text, Coated, %Coated%
      codeString:=trim(rProduct " " rBatch " " rLot Ct rCoated)
      tt(CodeString)
     Return Trim(CodeString)
}





SetVarbar(){
  global Product, Batch, Lot, Coated
    Gui Varbar:Default
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
    sleep      20
      Gui Varbar:Default
      RegExMatch(HayStack, RegexProduct,r)  ;"i)[abdefghijkl]\d{3}", rProduct)
      RegExMatch(HayStack, RegexBatch, r)
      RegExMatch(HayStack, RegexLot, r)
      RegExMatch(HayStack, RegexCoated, r)
      If rProduct {
        GuiControl,Varbar:Text, Product, %rProduct%
        Product:=rProduct
      }
      If rBatch {
        GuiControl,Varbar:Text, Batch, %rBatch%
        Batch:=rBatch
      }
      If rLot {
        GuiControl,Varbar:Text, lot, %rlot%
        lot:=rLot
      }
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
      GuiControl, Varbar:MoveDraw, Coated
      gui varbar:submit, nohide
      tt(Product " " Batch " " lot " " Coated)
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


