/*
RegexProduct:= "i)(?<=\w{3})?[abdefghijkl]\d{3}"
RegexBatch:=   "i)(?<!Ct#)\d{3}-\d{4}\b"
RegexLot:=     "i)\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?"
RegexCoated:=  "i)(coated: |ct#?|ct\s?|coated\s?)(?P<Coated>\d{3}-\d{4})"
*/

; RegexProduct:="i)(?<=\w{3})?[abdefghijkl]\d{3}"
; RegexBatch:=  "i)(?<!Ct#)\d{3}-\d{4}\b"
; RegexLot:=    "i)\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?"
; RegexCoated:= "i)(coated: |ct#?|ct\s?|coated\s?)(?P<Coated>\d{3}-\d{4})"

Clip(input=0,Wait:="0.45"){
  global tab, Batch, Product, lot, coated, sampleid, analytical,micro,retain,physical,CTphysical,CTretain,department, regexProduct
  If Input contains OCR
    OCR()
    return
  clipboard:=
    Send, ^{c}
  clipwait,%Wait%
  sleep %input%
  if errorlevel
  {
    tt("clip error level")
    sleep 100
    ; if (A_PriorKey != "F19") || (A_PriorhotKey != "Mbutton") || (A_PriorhotKey != "^Wheeldown")
      ; exit
    ; Send, {home}{shiftdown}{end}{shiftup}^{c}{ctrlup}
  }
  clip.Regex()
  return
}

clipChange(type){
  global
  ifwinactive, Select tests for request: R
    return
  sleep 50
    clip.Parse()
    if winactive("ahk_exe WFICA32.EXE"){
      clip.Department()
    if A_PriorKey = c
      FloVar(Clipboard,3000,13)
    else if A_PriorKey = F19
      FloVar(Clipboard,3000,13)
    else if A_PriorKey = x
      FloVar(Clipboard,3000,13)
    if A_PriorKey = b
      return
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













CutSwap(){
  send, {lbutton up}
  preclip:=clipboard
  clipboard:=
  send, ^x
  Clipwait, 0.25
  postclip:=clipboard
  clipboard:=
  clipboard:=Preclip
  clipwait, 0.25
  send, ^v
  clipboard:=PostClip
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


Parse(Value:=""){
  global
  regProducts:=[], regBatches:=[],
  Gui Varbar:Default
  match:=
  sleep 150
    If !Value
      ParsedClipboard:=Clipboard
    else
      ParsedClipboard:=Value
    loop, parse, ParsedClipboard, "`r`n"
    {
      RegexMatch(A_loopField, RegexProduct,VarProduct) ;[abdefghijk]\d{3}\b", VarProduct)
      RegexMatch(A_loopField, RegexLot, VarLot)
      RegexMatch(A_loopField, RegexBatch, VarBatch)
      RegExMatch(A_loopField, RegexCoated, Var)
      ; RegExMatch(A_loopField, "i)(s|\$)\d{8}-\d{3}\b", VarSampleID)
          if VarProduct
            Match.=VarProduct
          if varBatch
            Match.= " " VarBatch
          if varLot
            match.= " " VarLot
          if varCoated
            match.= " Ct#" VarCoated
          TrimmedMatch:=Trim(Match)
          ; ControlsetText, Edit5,%TrimmedMatch%,VarBar
          varbar.addtolist(TrimmedMatch)
          ; Control, Add, %TrimmedMatch%, Combobox1
        if Match && A_Index = 1 ; if first line
        {
            clip.Singleregex()
        }
        else if Match && A_Index > 1
          regProducts.insert(Trim(Match))
      if (RegProducts.maxindex() > 1) { ;remove duplicates from array
          Products:=[], oTemp := {}
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
          filedelete, data\CurrentCodes.txt
          For Each, Element In Products {
            CurrentCodes .= Element "`n"
          }
          ; RemoveTextDuplicates(CurrentCodes)
          sleep 100
          FileAppend, %CurrentCodes%, data\CurrentCodes.txt
          sleep 100
          RemoveFileDuplicates("D:\VQuest\Data\CurrentCodes.txt")
          sleep 100
                    ; RegProducts.InsertAt(1, Trim(Match))
                    ; gui, Varbar:Default
                    ; Gui, Varbar:+Delimiter`r`n
                    ; GuiControl,, DDL, % CurrentCodes := "`n" Trim(Match) "`n`n" Trim(StrReplace(CurrentCodes, "`n`n", "`n"), "`n")
          ; DDL:=
          ; GuiControl,,DDL,
          ; GuiControl, Varbar:MoveDraw, DDL
          ; guicontrol, ChooseString, ComboBox1, %Product%
        }
        ; Pop(CurrentCodes,,500,"Right")
      return
    }
}


SingleRegex(){
    global
    ; ConnectedProducts:=[]
    Gui Varbar:Default
    ConnectedProduct:=
      Haystack:=Clipboard
    sleep      20
      RegExMatch(HayStack, regexProduct,cProduct)
      RegExMatch(HayStack, regexBatch, cBatch)
      RegExMatch(HayStack, regexLot, clot)
      RegExMatch(HayStack, regexCoated, c)
      sleep 50
      if cProduct {
        GUI, Varbar:font, cBlack s16  Norm w700, Consolas
        GuiControl,Varbar:Text, Product, %cProduct%
        GuiControl, Font, Product
        Product:=cProduct
        ConnectedProduct.=cProduct
      }
      If cBatch {
        GUI, Varbar:font, cBlack s12 Norm W700 ,Consolas
        GuiControl,Varbar:Text, Batch, %cBatch%
        GuiControl, Font, Batch
        Batch:=cBatch
        ConnectedProduct.= " " cBatch
      }
      If cLot {
        GUI, Varbar:font, cBlack s10 Norm w600 , Consolas
        GuiControl,Varbar:Text, lot, %clot%
        GuiControl, Font, Lot
        lot:=cLot
        ConnectedProduct.= " " cLot
      }
      If cCoated {
        GUI, Varbar:font, cBlack s8.5 Norm w600, Arial Narrow
        GuiControl,Varbar:Text, Coated, %cCoated%
        GuiControl, Font, Coated
        Coated:=cCoated
        ConnectedProduct.= " ct#" cCoated
      }

      if !cProduct {
        GUI, Varbar:font, c272822 s10  Right italic w300, Arial Narrow
        GuiControl, Font, Product
        ; GuiControl,Varbar:Text, Product, %cProduct%
        Poduct:=cProduct
      }
      If !cBatch {
        GUI, Varbar:font, c272822 s10 italic right w300, Arial Narrow
        GuiControl, Font, Batch
        ; GuiControl,Varbar:Text, Batch, %cBatch%
        Batch:=cBatch
      }
      If !cLot {
        GUI, Varbar:font, c272822  s10 italic  Right w300, Arial Narrow
        GuiControl, Font, lot
        ; GuiControl,Varbar:Text, lot, %clot%
        lot:=cLot
      }
      If !cCoated {
        GuiControl, Font, Coated
        GUI, Varbar:font, c272822  s10 Italic Right w300, Arial Narrow
        ; GuiControl,Varbar:Text, Coated, %cCoated%
        Coated:=cCoated
      }
        ; GuiControl, ChooseString, Combobox1, %ConnectedProduct%
       UpdateDDLlist:
          Gui Varbar:Default
          Gui Varbar:+Delimiter`n
          gui varbar:submit, nohide
          this.AddtoList(ConnectedProduct)
          ; GuiControl,,DDL, % ConnectedProduct "`n" ;CurrentCodes ;StrReplace(CurrentCodes, "`r`n", "|")
          ; GuiControl, MoveDraw, ComboBox1

      ; If cSampleID {
        ; GuiControl,Varbar:Text, SampleID, %cSampleID%
      ; }
    }

Regex(Category:=""){
    global
    if !Category
      Haystack:=Clipboard
    else
      Haystack:=Category
    sleep      20
      Gui Varbar:Default
      RegExMatch(HayStack, RegexProduct,cProduct)  ;"i)[abdefghijkl]\d{3}", cProduct)
      RegExMatch(HayStack, RegexBatch, cBatch)
      RegExMatch(HayStack, RegexLot, clot)
      RegExMatch(HayStack, RegexCoated, r)
      If cProduct && cBatch && clot || cCoated
        FileAppend, %cProduct% %cBatch% %clot% %cCoated%, data\CurrentCodes.txt
      If cProduct {
        GuiControl,Varbar:Text, Product, %cProduct%
        Product:=cProduct
        ; IniWrite, %cProduct%, Settings.ini, Products, Product
        ; AppendCode:="`n" cProduct " " cBatch " " clot "  Ct#" cCoated
        ; TimmedAppendcode:=Trim(AppendCode)
        ; FileAppend,%TrimmedAppendCode%, Data\CurrentC.txt
      }
      If cBatch {
        GuiControl,Varbar:Text, Batch, %cBatch%
        Batch:=cBatch

      }
      If cLot {
        GuiControl,Varbar:Text, lot, %clot%
        lot:=cLot
      }
      If cCoated {
        GuiControl,Varbar:Text, Coated, %cCoated%
        Coated:=cCoated
      }
      If !cLot {
        GuiControl,Varbar:Text, lot, %clot%
        lot:=
      }
      If !cCoated {
        GuiControl,Varbar:Text, Coated, %cCoated%
        Coated:=
      }
      ; GuiControl, Varbar:MoveDraw, Coated
      ; gui varbar:submit, nohide
      FloVar(0,2000,16)
      sleep 20
  }
Department(DepartmentInput:=""){
  global Department
      Department:=
     if !DepartmentInput
      DepartmentHaystack:=Clipboard
    else
      DepartmentHaystack:=DepartmentInput
      sleep 100
      ; Regexmatch(DepartmentHaystack, "i)(Analytical \(In Process\)|I, Analytical|In Process, Analytical)", Analytical)
      ; Regexmatch(DepartmentHaystack, "i)(\bI, Physical\b|In Process, Physical\b|\bPhysical \(In Process\))", cPhysical)
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
      ; else If Analytical
        ; Department:="Analytical"
      else
        msgbox % "`nDepartment: " Department "`nmicro: " micro "`nretain: " retain "`nctretain: " ctretain "`nphysical: " physical "`nctphysical: " ctphysical "`nanalytical: " analytical
      ; sleep 300
      ; tt(Department)
  return %Department%
}

IfNothingSelected(action){
  global
    ClipboardSaved:=ClipboardAll
    clipboard:=
    ; sleep 20
    Send, ^c
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
        ; clipboard:=
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

ClickText(button:=""){
	mousegetpos, mousex, mousey
	SetDefaultMouseSpeed, 0
	Click, %A_CaretX% %A_caretY%, %button%
	mousemove, %mousex%, %mousey%, 0
	SetDefaultMouseSpeed, 1
}






}


