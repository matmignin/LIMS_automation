
#ifwinactive,
Return
clipChange(type){
  global
  sleep 75
  if SimpleClip
    return
    if Instr(Clipboard, "++|",true,1,1){
      AddWholeBatch:=strReplace(Clipboard,"++","")
      if instr(WholeBatches, AddWholeBatch,false,1,1)
        clip.codesRegex(AddWholeBatch)
      else {
        FileAppend, `n%AddWholeBatch%, WholeBatches.txt,
        WholeBatches:=trim(WholeBatches "`r`n" AddWholeBatch,"`r`n ")
        sleep 200
        }
      ; WholeBatches:=strReplace(WholeBatches,"`r`n`r`n","`r`n")
      ; GetAllWholeBatches()
      return
  }
  if Instr(Clipboard, "[P]",true,1,1){
    ProductTab.AddProductFromClipboard()
  }
  else if InStr(Clipboard, ">>|", true,1,1) {
    if (Iteration >=25) || (Iteration < 0) || !(Iteration)
      iteration:=1
    LMS.AddDataFromClipboard()
    return
  }
  else if InStr(Clipboard, "<<QuIT>>",true, 1,1)
    exitsub()
  else if Winactive("Test Definition Editior"){
    DESCRIPTION:=Trim(Clipboard,"`r`n")
    TT(Description,2000)
  }
    ; iniwrite, %Description%, Settings.ini, CopiedSpecs, Description
  else if Winactive("Results Definition") || Winactive("Results")
    clip.ParseSpecsTable()
  else if Winactive("Composition")
    clip.ParseIngredientsTable()
  else
    clip.codesRegex()
    sleep 50
}


;<LC>|
;  IngredientId|
; [1] IngredientLoacation|
; [2] Sequene|
; [3] IngredientText|
; [4] LabelClaim|
; [5] AssayRange%|
; [6] MethodID|
; [7] IngredientDescription|
; [8] MinLimit|
; [9] MaxLimit|
; [10 ]Units|
; [11] Percision|
; [12] Requirement|
;<<LC>>|
; [1] Formulation|
; [2] ProductName|
; [3] Customer|
; [4] CustomerDropdown|
; [5] pillSize|

/*

IngredientText=
LabelClaim=
AssayRange=
IngredientDescription=
MinLimit=
MaxLimit=
Units=
Percision=
Requirement=

 */

Clip(input=50,Wait:="0.95"){
  global tab, Batch, Product, lot, coated, sampleid, analytical,micro,retain,physical,CTphysical,CTretain,department, regexProduct, regexBatch,regexlot,regexSampleID, regexCoated
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

		ParseIngredientsTable(Save:=1){
		global
    clipped_Position:=
    clipped_IngredientId:=
    clipped_LabelName:=
    clipped_LabelClaim:=
    clipped_IngredientGroup:=
		ParsedIngredients:=[]
		Loop, parse, Clipboard, `t
			ParsedIngredients.insert(A_LoopField)
			TotalColumns:=ParsedIngredients.maxindex()//2
			clipped_Position:=Trim(ParsedIngredients[HasValue(ParsedIngredients, "Position") + TotalColumns],"`r`n")
			clipped_IngredientId:=Trim(ParsedIngredients[HasValue(ParsedIngredients, "Ingredient Id") + TotalColumns],"`r`n")
			clipped_LabelName:=Trim(ParsedIngredients[HasValue(ParsedIngredients, "Description") + TotalColumns],"`r`n")
			clipped_LabelClaim:=Trim(ParsedIngredients[HasValue(ParsedIngredients, "Generic 1") + TotalColumns],"`r`n")
			clipped_IngredientGroup:=Trim(ParsedIngredients[HasValue(ParsedIngredients, "Generic 2") + TotalColumns],"`r`n")
      sleep 200
      Clipped_Ingredients:= Clipped_position ": " Clipped_IngredientId "`t"  Clipped_LabelClaim "`n" Clipped_LabelName "`n" Clipped_IngredientGroup
      ; msgbox, %Clipped_Ingredients%
      ; Tooltip, %Clipped_Ingredients%, 200,0
      tt(Clipped_ingredients 10000,1,1,2)
      return
		}
		ParseSpecsTable(Save:=1){
		global
    MinLimit:=
    MaxLimit:=
    Percision:=
    Clipped_Requirement:=
    Clipped_ParsedSpecs:=
    FullRequirement:=
    Units:=
    Clipped_SeqNo:=
    Clipped_Method:=
    Clipped_ResultID:=
		ParsedSpecs:=[]
    ParseData:=Clipboard
		Loop, parse, ParseData, `t
			ParsedSpecs.insert(A_LoopField)
			TotalColumns:=ParsedSpecs.maxindex()//2
			MinLimit:=Trim(ParsedSpecs[HasValue(ParsedSpecs, "Lower Limit") + TotalColumns],"`r`n")
			MaxLimit:=Trim(ParsedSpecs[HasValue(ParsedSpecs, "Upper Limit") + TotalColumns],"`r`n")
			Percision:=Trim(ParsedSpecs[HasValue(ParsedSpecs, "Precision") + TotalColumns],"`r`n")
			Clipped_Requirement:=Trim(ParsedSpecs[HasValue(ParsedSpecs, "Requirement") + TotalColumns], "`r`n")
      Clipped_ParsedSpecs:=Trim([HasValue(ParsedSpecs, "Requirement") + TotalColumns],"`r`n")
			FullRequirement:=Trim(ParsedSpecs[HasValue(ParsedSpecs, "Requirement") + TotalColumns],"`r`n")
			Units:=Trim(ParsedSpecs[HasValue(ParsedSpecs, "Unit") + TotalColumns],"`r`n")
			Clipped_SeqNo:=Trim(ParsedSpecs[HasValue(ParsedSpecs, "Seq No") + TotalColumns],"`r`n")
      Clipped_Method:=Trim(ParsedSpecs[HasValue(ParsedSpecs, "Method Id") + TotalColumns],"`r`n")
			Clipped_ResultID:=Trim(ParsedSpecs[HasValue(ParsedSpecs, "Result Id") + TotalColumns],"`r`n")
      sleep 200
      Clipped_Specs:= Clipped_ResultID "`t" DESCRIPTION "`n MinLimit: " MinLimit "`n MaxLimit: " MaxLimit "`n Requirement: " Clipped_Requirement "`n Percision: " Percision "`n Units: " Units
      ; tt(Clipped_Specs,7000)
        ; tooltip, %Clipped_specs%, 200,0
      return
		}
  ParseMainSpecsTopTable(){
		global
    SimpleClip:=1
    Clipboard:=
    WinActivate, NuGenesis LMS
    send, ^{c}
    ClipWait, 6
    if ErrorLevel
      {          ; sleep 800
          ; MsgBox, The attempt to copy text onto the clipboard failed.
          SimpleClip:=
          Tt("Errorlevel", 100,100)
          return
          ; exit
      }
    Product:=
    VersionType:=
    VersionStatus:=
    SelectionStatus:=
		ParsedSpecs:=[]
    ParseData:=Clipboard
		Loop, parse, ParseData, `t
			ParsedSpecs.insert(A_LoopField)
			TotalColumns:=ParsedSpecs.maxindex()//2
			Product:=Trim(ParsedSpecs[HasValue(ParsedSpecs, "Formulation ID") + TotalColumns],"`r`n")
			VersionType:=Trim(ParsedSpecs[HasValue(ParsedSpecs, "Specification version type") + TotalColumns],"`r`n")
			Description:=Trim(ParsedSpecs[HasValue(ParsedSpecs, "Description") + TotalColumns],"`r`n")
      Clipped_SpecsTop:= Product  ": " VersionType
      ControlsetText, Edit1,%Product%,ClipBar
      sleep 200
      iniRead, VersionStatus, FixedSpecs.ini, Status, %Product%
      SimpleClip:=
      sleep 350
      if VersionStatus
        return VersionStatus

      else
        return ""
		}


  ParseMainSpecTable(Save:=1){
		global
    Clipped_Method:=
    Clipped_Requirements:=
    Clipped_minmax:=
    MinLimit:=
    MaxLimit:=
    Clipped_TestID:=
    Clipped_Department:=
    Clipped_SeqNo:=
    Clipped_SampleTemplate:=
    DESCRIPTION:=
		ParsedMainSpecTable:=[]
    ParseData:=Clipboard
		Loop, parse, ParseData, `t  //`t
			ParsedMainSpecTable.insert(A_LoopField)
    TotalColumns:=ParsedMainSpecTable.maxindex()//2
    Clipped_Method:=Trim(ParsedMainSpecTable[HasValue(ParsedMainSpecTable, "Method Id") + TotalColumns],"`r`n")
    FullRequirement:=Trim(ParsedMainSpecTable[HasValue(ParsedMainSpecTable, "Requirements") + TotalColumns],"`r`n")
    Clipped_minmax:=Strsplit(Requirements," - ","`n")
    MinLimit:=Trim(Minmax[1],"`r`n")
    MaxLimit:=Trim(minmax[2],"`r`n")
    Clipped_TestID:=Trim(ParsedMainSpecTable[HasValue(ParsedMainSpecTable, "Test Id") + TotalColumns],"`r`n")
    Clipped_Department:=Trim(ParsedMainSpecTable[HasValue(ParsedMainSpecTable, "Department") + TotalColumns],"`r`n")
    Clipped_SeqNo:=Trim(ParsedMainSpecTable[HasValue(ParsedMainSpecTable, "Seq No") + TotalColumns],"`r`n")
    Clipped_SampleTemplate:=Trim(ParsedMainSpecTable[HasValue(ParsedMainSpecTable, "Sample Template") + TotalColumns],"`r`n")
    DESCRIPTION:=Trim(ParsedMainSpecTable[HasValue(ParsedMainSpecTable, "Description") + TotalColumns],"`r`n")
    ; StringReplace, Description, Description, `r`n, , All
      sleep 200
      Clipped_Specs:= Clipped_TestID "`t" DESCRIPTION "`n MinMax: " MinLimit " - " MaxLimit "`n Sample Template: " Clipped_SampleTemplate "`n Department: " Clipped_Department
      TT(%Clippsed_Specs%,4000)
      ; tooltip, %Clipped_specs%, 200,0
      return
		}

		; ParseMainSamplesTable(Save:=1){
		; global
    ; ; SimpleClip:=
		; ; ParsedMainSamplesTable:=[]
    ; ; ParseData:=Clipboard
		; ; Loop, parse, ParseData, `t
		; 	; ParsedMainSamplesTable.insert(A_LoopField)
    ; ; TotalColumns:=ParsedMainSamplesTable.maxindex()//2
    ; ; Batch:=Trim(ParsedMainSamplesTable[HasValue(ParsedMainSamplesTable, "Batch") + TotalColumns],"`r`n")
    ; ; Coated:=Trim(ParsedMainSamplesTable[HasValue(ParsedMainSamplesTable, "Coated Lot #") + TotalColumns],"`r`n")
    ; ; Lot:=Trim(ParsedMainSamplesTable[HasValue(ParsedMainSamplesTable, "Pkg Lot #") + TotalColumns],"`r`n")
    ; ; if !lot
    ; ; Lot:=Trim(ParsedMainSamplesTable[HasValue(ParsedMainSamplesTable, "Blister Lot #") + TotalColumns],"`r`n")
    ; ; ShipTo:=Trim(ParsedMainSamplesTable[HasValue(ParsedMainSamplesTable, "Ship To") + TotalColumns],"`r`n")
    ; ; Name:=Trim(ParsedMainSamplesTable[HasValue(ParsedMainSamplesTable, "Product Trade Name") + TotalColumns],"`r`n")
    ; ; Department:=Trim(ParsedMainSamplesTable[HasValue(ParsedMainSamplesTable, "Department") + TotalColumns],"`r`n")
    ;   ; sleep 200
		; 		; InputVar:=A_ThisMenuItem
		; 		; IniRead,CustomerPosition, %CustomerListPath%, Customers, %ShipTo%
		; 		; sleep 30
		; 		; if CustomerPosition > 0
		; 			; customerPosition+=1
		; 		; if CustomerPosition < 0
		; 			; customerPosition-=1
		; 		; sleep 200
		; 		; Iteration:=CustomerPosition
		; 		; sleep 200
		; 		; GuiControl,ClipBar:Text, Iteration, %CustomerPosition%
    ;   ; If Save
    ;   ; {
    ;     ; iniwrite, %Name%, Settings.ini, CopiedSpecs, Name
    ;     ; iniwrite, %Department%, Settings.ini, CopiedSpecs, Department
    ;     ; iniwrite, %Description%, Settings.ini, CopiedSpecs, Description
    ;     ; iniwrite, %ShipTo%, Settings.ini, CopiedSpecs, ShipTo
		; 		; iniwrite, %Iteration%, Settings.ini, SavedVariables, Iteration
		; 		; iniwrite, %CustomerPosition%, Settings.ini, SavedVariables, CustomerPosition
    ;   ; }
    ;   ; SimpleClip:=
    ;   ; if !Simpleclip
    ;     ; tt(ShipTo "`t" CustomerPosition, 2000,1,1,2)
    ;   return
		; }


  HeavyMetalSpecs(){
    global
    HM_Specs:=StrSplit(clipboard,"|")
    HM_Unit:=HM_Specs[2]
    HM_Lower_Limit:=HM_Specs[3] " " HM_Unit
    Arsenic_Limit:=HM_Specs[4]
    Lead_Limit:=HM_Specs[5]
    Cadmium_Limit:=HM_Specs[6]
    Mercury_Limit:=HM_Specs[7]
    Arsenic_Requirement:=HM_Specs[8] " " HM_Unit
    Lead_Requirement:=HM_Specs[9] " " HM_Unit
    Cadmium_Requirement:=HM_Specs[10] " " HM_Unit
    Mercury_Requirement:=HM_Specs[11] " " HM_Unit

	}

EditBox(Input:=""){
  Global EditBox
	try GUI, EditBox:Destroy
  if !Input
		Result := Clipboard
  else
    result := Input
    sleep 200
	Gui EditBox: +AlwaysOnTop +Toolwindow +Resize +owner +HwndGUIID
		GUI, EditBox:Font, s12 cBlack, Consolas
    gui, EditBox:Margin,1,1
		GUI, EditBox:Add, Edit, x0 y0 +Resize vEditBox , % Result
		GUI, EditBox:Show,Autosize, Result
		GUI, EditBox:add, button, default gEditBoxButtonOK, OK
    ; winSet, Transparent, 100, EditBox
		return
		EditBoxGuiClose:
    try GUI, EditBox:Destroy
    Return
		EditBoxGuiEscape:
    try GUI, EditBox:Destroy
    Return
		EditBoxButtonOK:
		GUI, EditBox:submit
    if !Input
			clipboard:=EditBox
    try GUI, EditBox:Destroy
    ; sleep 50
  ; TT(Editbox,500,,,,200)
		return

    EditBoxGuiSize:
  if (ErrorLevel = 1)  ; The window has been minimized. No action needed.
      return
    NewWidth := A_GuiWidth
    NewHeight := A_GuiHeight
    ; sleep 200
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
  global RegexProduct, RegexBatch, RegexLot, RegexCoated, RegexSampleID, Product, Lot, Batch, Coated, sampleID,CodeString, CodeFile, PriorCodeString, CustomerPosition, Iteration, WholeBatch
    Gui ClipBar:Default
    PriorCodestring:=CodeString
    PriorSampleID:=SampleID
    PriorBatch:=Batch
    codestring:=
      Parse:= Input ? Input : Clipboard


      Product:=RegexMatch(Parse, RegexProduct,r) ? rProduct : Product
      Batch:=RegexMatch(Parse, RegexBatch, r) ? rBatch : Batch
      Lot:=RegexMatch(Parse, RegexLot, r) ? rLot : Lot
      ; Coated:=RegExMatch(Parse, RegexCoated, r) ? rCoated : Coated
      Coated:=RegExMatch(Parse, RegexCoated, r) ? rCoated : Coated
      ; SampleID:=RegExMatch(Parse, RegexSampleID, r) ? rSampleID : SampleID
      if (Batch!=PriorBatch) && (!rlot && !rCoated){
        Lot:=
        Coated:=
      }
      if RegexMatch(Parse, "\[\[(?P<CustomerPosition>-?\d+)\]\]", r){
        Iteration:=Floor(rCustomerPosition)
        CustomerPosition:=rCustomerPosition

        sleep 40
    }
      Ct:=Coated ? " ct#" : ""
      this.SetClipBar()
      if rCustomerPosition
        GuiControl,ClipBar:Text, Iteration, %CustomerPosition%
      ; GuiControl,ClipBar:Text, Iteration, %Iteration%
        GUI, ClipBar:submit,NoHide
      codeString:=trim(Product " " Batch " " Lot Ct Coated " [[" CustomerPosition "]]")
      if (PriorCodestring!=Codestring){
        FileDelete, %CodeFile%
        sleep 200
        FileAppend, %CodeString%, %CodeFile%
      }
      TT(trim(Product " " Batch " " Lot Ct Coated))
     Return
}





SetClipBar(){
  Global Product, Batch, Lot, Coated
    Gui ClipBar:Default
      stringUpper, Product, Product
      GuiControl,ClipBar:Text, Product, %Product%
      GuiControl,ClipBar:Text, Batch, %Batch%
      GuiControl,ClipBar:Text, lot, %lot%
      GuiControl,ClipBar:Text, Coated, %Coated%
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
      Gui ClipBar:Default
      RegExMatch(HayStack, RegexProduct,r)  ;"i)[abdefghijkl]\d{3}", rProduct)
        If rProduct {
          GuiControl,ClipBar:Text, Product, %rProduct%
          stringUpper, rProduct, rProduct
          Product:=rProduct
        }
      RegExMatch(HayStack, RegexBatch, r)
        If rBatch {
          GuiControl,ClipBar:Text, Batch, %rBatch%
          Batch:=rBatch
        }
      RegExMatch(HayStack, RegexLot, r)
        If rLot {
          GuiControl,ClipBar:Text, lot, %rlot%
          lot:=rLot
        }
      RegExMatch(HayStack, RegexCoated, r)
        If rCoated {
          GuiControl,ClipBar:Text, Coated, %rCoated%
          Coated:=rCoated
        }
      RegExMatch(HayStack, RegexSampleID, r)
        If rSampleID {
          SampleID:=rSampleID
          ; GuiControl,ClipBar:Text, SampleID, %rSampleID%
        }
      RegExMatch(HayStack, RegexSampleID, r)
        If !rSampleID {
          SampleID:=
          ; GuiControl,ClipBar:Text, SampleID, %rSampleID%
        }
      If !rLot {
        GuiControl,ClipBar:Text, lot, %rlot%
        lot:=
      }
      If !rCoated {
        GuiControl,ClipBar:Text, Coated, %rCoated%
        Coated:=
      }
      ; GuiControl, ClipBar:MoveDraw, Coated
      gui ClipBar:submit, nohide
      ; tt(Product " " Batch " " lot " ct#" Coated)
      sleep 20
  }
Department(DepartmentInput:=""){
  global Department
      Department:=
     if !DepartmentInput
      DepartmentHaystack:=Clipboard
    else
      DepartmentHaystack:=DepartmentInput
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
        TT("`nDepartment: " Department "`nmicro: " micro "`nretain: " retain "`nctretain: " ctretain "`nphysical: " physical "`nctphysical: " ctphysical "`nanalytical: " analytical,3000,100,100)
  return %Department%
}










}

