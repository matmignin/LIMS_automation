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
  sleep 75
  if SimpleClip
    return
  if InStr(Clipboard, "<^>", true,1,1) {
    if (Iteration >=25) || (Iteration < 0) || !(Iteration)
      iteration:=1
    LMS.AddDataFromClipboard()
  }
  ; else if InStr(Clipboard, "<<LabelCopy>>", true,1,1) {
    ; if (Iteration >=25) || (Iteration < 0) || !(Iteration)
      ; iteration:=1
    ; LMS.AddDataFromClipboard("<<LabelCopy>>")
  ; }
  else if InStr(Clipboard, "<<QuIT>>",true, 1,1){
    ifwinnotexist, RemoteVQ ahk_exe explorer.exe
      run, explorer "\\10.1.2.118\users\vitaquest\mmignin\RemoteVQ"
    exitapp
    sleep 25
    }
  else if Instr(Clipboard, "<<SheetInfo>>",true,1,1)
    ProductTab.AddProductFromClipboard()
  else if Winactive("Test Definition Editior"){
    iniwrite, %Clipboard%, Settings.ini, CopiedSpecs, Description
    Description:=Clipboard
  }
  else if Winactive("Results Definition")
    clip.ParseSpecsTable()
  else if Winactive("NuGenesis LMS") {
    LMS.DetectTab()
    Sleep 200
    if (Tab="Specs")
      clip.ParseMainSpecTable()
    if (Tab="Samples")
      clip.ParseMainSamplesTable()
    clip.codesRegex()
  }
  else if Winactive("Composition")
    clip.ParseIngredientsTable()
  ; else if Instr(Clipboard, "Use the limits from the test",true,1,1)
  ; else if Instr(Clipboard, "<<HeavyMetal>>",true,1,1)
    ; clip.HeavyMetalSpecs()
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
    ; SimpleClip:=06/21/2
		ParsedIngredients:=[]
		Loop, parse, Clipboard, `t
			ParsedIngredients.insert(A_LoopField)
			TotalColumns:=ParsedIngredients.maxindex()//2
			Position:=ParsedIngredients[HasValue(ParsedIngredients, "Position") + TotalColumns]
			IngredientId:=ParsedIngredients[HasValue(ParsedIngredients, "Ingredient Id") + TotalColumns]
			LabelName:=ParsedIngredients[HasValue(ParsedIngredients, "Description") + TotalColumns]
			LabelClaim:=ParsedIngredients[HasValue(ParsedIngredients, "Generic 1") + TotalColumns]
			IngredientGroup:=ParsedIngredients[HasValue(ParsedIngredients, "Generic 2") + TotalColumns]
      StringReplace, IngredientGroup, IngredientGroup, `n, , All
      sleep 200
      copiedText:= IngredientId "`t" LabelClaim "`t" IngredientGroup "`n" LabelName
      If Save
      {
        iniwrite, %IngredientId%, Settings.ini, CopiedSpecs, IngredientId
        iniwrite, %LabelClaim%, Settings.ini, CopiedSpecs, LabelClaim
        iniwrite, %IngredientGroup%, Settings.ini, CopiedSpecs, IngredientGroup
        iniwrite, %LabelName%, Settings.ini, CopiedSpecs, LabelName
      }
      if !Simpleclip
      ; tt(CopiedText, 2000,1,1,2)
      return
		}
		ParseSpecsTable(Save:=1){
		global
    ; SimpleClip:=
		ParsedSpecs:=[]
    ParseData:=Clipboard
		Loop, parse, ParseData, `t
			ParsedSpecs.insert(A_LoopField)
			TotalColumns:=ParsedSpecs.maxindex()//2
			MinLimit:=ParsedSpecs[HasValue(ParsedSpecs, "Lower Limit") + TotalColumns]
			MaxLimit:=ParsedSpecs[HasValue(ParsedSpecs, "Upper Limit") + TotalColumns]
			Percision:=ParsedSpecs[HasValue(ParsedSpecs, "Precision") + TotalColumns]
			Requirement:=ParsedSpecs[HasValue(ParsedSpecs, "Requirement") + TotalColumns]
			; FullRequirement:=ParsedSpecs[HasValue(ParsedSpecs, "Requirement") + TotalColumns]
			Units:=ParsedSpecs[HasValue(ParsedSpecs, "Unit") + TotalColumns]
			SeqNo:=ParsedSpecs[HasValue(ParsedSpecs, "Seq No") + TotalColumns]
      Method:=ParsedSpecs[HasValue(ParsedSpecs, "Method Id") + TotalColumns]
			ResultID:=ParsedSpecs[HasValue(ParsedSpecs, "Result Id") + TotalColumns]
      sleep 200
      copiedText:= ResultID "`t" Description "`n MinLimit: " MinLimit "`n MaxLimit: " MaxLimit "`n Requirement: " Requirement "`n Percision: " Percision "`n Units: " Units
      If Save
      {
        ; iniwrite, %MinLimit%, Settings.ini, CopiedSpecs, MinLimit
        ; iniwrite, %MaxLimit%, Settings.ini, CopiedSpecs, MaxLimit
        ; iniwrite, %Percision%, Settings.ini, CopiedSpecs, Percision
        ; iniwrite, %Requirement%, Settings.ini, CopiedSpecs, Requirement
        ; iniwrite, %Units%, Settings.ini, CopiedSpecs, Units
        ; iniwrite, %ResultID%, Settings.ini, CopiedSpecs, ResultID
        ; iniwrite, %SeqNo%, Settings.ini, CopiedSpecs, SeqNo
        ; iniwrite, %Method%, Settings.ini, CopiedSpecs, Method
      }
      ; SimpleClip:=
      ; copypastetoggle=1
      ; if !Simpleclip
        ; tt(CopiedText, 2000,1,1,2)
      return
		}

		ParseMainSpecTable(Save:=1){
		global
    SimpleClip:=
		ParsedMainSpecTable:=[]
    ParseData:=Clipboard
		Loop, parse, ParseData, `t
			ParsedMainSpecTable.insert(A_LoopField)
    TotalColumns:=ParsedMainSpecTable.maxindex()//2
    Method:=ParsedMainSpecTable[HasValue(ParsedMainSpecTable, "Method Id") + TotalColumns]
    Requirements:=ParsedMainSpecTable[HasValue(ParsedMainSpecTable, "Requirements") + TotalColumns]
    minmax:=Strsplit(Requirements," - ","`n")
    MinLimit:=Minmax[1]
    MaxLimit:=minmax[2]
    TestID:=ParsedMainSpecTable[HasValue(ParsedMainSpecTable, "Test Id") + TotalColumns]
    Department:=ParsedMainSpecTable[HasValue(ParsedMainSpecTable, "Department") + TotalColumns]
    SeqNo:=ParsedMainSpecTable[HasValue(ParsedMainSpecTable, "Seq No") + TotalColumns]
    SampleTemplate:=ParsedMainSpecTable[HasValue(ParsedMainSpecTable, "Sample Template") + TotalColumns]
    Description:=ParsedMainSpecTable[HasValue(ParsedMainSpecTable, "Description") + TotalColumns]
    StringReplace, Description, Description, `r`n, , All
      sleep 200
      copiedText:= TestID "`t" Description "`n MinMax: " MinLimit " - " MaxLimit "`n Sample Template: " SampleTemplate "`n Department: " Department
      If Save
      {
        ; iniwrite, %MinLimit%, Settings.ini, CopiedSpecs, MinLimit
        ; iniwrite, %MaxLimit%, Settings.ini, CopiedSpecs, MaxLimit
        ; iniwrite, %SampleTemplate%, Settings.ini, CopiedSpecs, SampleTemplate
        ; iniwrite, %Department%, Settings.ini, CopiedSpecs, Department
        ; iniwrite, %Description%, Settings.ini, CopiedSpecs, Description
        ; iniwrite, %TestID%, Settings.ini, CopiedSpecs, TestID
        ; iniwrite, %Description%, Settings.ini, CopiedSpecs, Description
        ; iniwrite, %SeqNo%, Settings.ini, CopiedSpecs, SeqNo
        ; iniwrite, %Method%, Settings.ini, CopiedSpecs, Method
      }
      SimpleClip:=
      ; tt(CopiedText, 2000,1,1,2)
      return
		}

		ParseMainSamplesTable(Save:=1){
		global
    SimpleClip:=
		ParsedMainSamplesTable:=[]
    ParseData:=Clipboard
		Loop, parse, ParseData, `t
			ParsedMainSamplesTable.insert(A_LoopField)
    TotalColumns:=ParsedMainSamplesTable.maxindex()//2
    Batch:=ParsedMainSamplesTable[HasValue(ParsedMainSamplesTable, "Batch") + TotalColumns]
    Coated:=ParsedMainSamplesTable[HasValue(ParsedMainSamplesTable, "Coated Lot #") + TotalColumns]
    Lot:=ParsedMainSamplesTable[HasValue(ParsedMainSamplesTable, "Pkg Lot #") + TotalColumns]
    if !lot
      Lot:=ParsedMainSamplesTable[HasValue(ParsedMainSamplesTable, "Blister Lot #") + TotalColumns]
    ShipTo:=ParsedMainSamplesTable[HasValue(ParsedMainSamplesTable, "Ship To") + TotalColumns]
    Name:=ParsedMainSamplesTable[HasValue(ParsedMainSamplesTable, "Product Trade Name") + TotalColumns]
    Department:=ParsedMainSamplesTable[HasValue(ParsedMainSamplesTable, "Department") + TotalColumns]
      sleep 200
				; InputVar:=A_ThisMenuItem
				IniRead,CustomerPosition, %CustomerListPath%, Customers, %ShipTo%
				sleep 30
				if CustomerPosition > 0
					customerPosition+=1
				if CustomerPosition < 0
					customerPosition-=1
				sleep 200
				Iteration:=CustomerPosition
				sleep 200
				GuiControl,ClipBar:Text, Iteration, %CustomerPosition%
      If Save
      {
        iniwrite, %Name%, Settings.ini, CopiedSpecs, Name
        iniwrite, %Department%, Settings.ini, CopiedSpecs, Department
        iniwrite, %Description%, Settings.ini, CopiedSpecs, Description
        iniwrite, %ShipTo%, Settings.ini, CopiedSpecs, ShipTo
				iniwrite, %Iteration%, Settings.ini, SavedVariables, Iteration
				iniwrite, %CustomerPosition%, Settings.ini, SavedVariables, CustomerPosition
      }
      SimpleClip:=
      if !Simpleclip
        ; tt(ShipTo "`t" CustomerPosition, 2000,1,1,2)
      return
		}


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
  global RegexProduct, RegexBatch, RegexLot, RegexCoated, RegexSampleID, Product, Lot, Batch, Coated, sampleID,CodeString, CodeFile, PriorCodeString, CustomerPosition, Iteration
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
      SampleID:=RegExMatch(Parse, RegexSampleID, r) ? rSampleID : SampleID
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
      stringUpper, Product, Product
      GuiControl,ClipBar:Text, Product, %Product%
      GuiControl,ClipBar:Text, Batch, %Batch%
      GuiControl,ClipBar:Text, lot, %lot%
      GuiControl,ClipBar:Text, Coated, %Coated%
      if rCustomerPosition
        GuiControl,ClipBar:Text, Iteration, %CustomerPosition%
      ; GuiControl,ClipBar:Text, Iteration, %Iteration%
      		    GUI, ClipBar:submit,NoHide
      codeString:=trim(Product " " Batch " " Lot Ct Coated)
      if (SampleID!=PriorSampleID){
        iniwrite, %SampleID%, Settings.ini, SavedVariables, SampleID
        ; FileAppend, %SampleId%, %CodeFile%
      }
      if (PriorCodestring!=Codestring){
        FileDelete, %CodeFile%
        sleep 200
        FileAppend, %CodeString%, %CodeFile%
        if sampleID
          FileAppend, `n%SampleId%, %CodeFile%

        ; iniwrite, %PriorCodeString%, Settings.ini, SavedVariables, PriorCodeString

        ; iniwrite, %CodeString%, Settin06/21/22gs.ini, SavedVariables, CodeString
        ; FileAppend, `n%PriorCodeString%, %PriorCodeFile%
      }
      ;tt(CodeString)
      ; iniwrite, %CodeString%, \\10.1.2.118\users\vitaquest\mmignin\RemoteVQ\Settings.ini, SavedVariables, Code
     Return ;CodeString
}





SetClipBar(){
  global Product, Batch, Lot, Coated
    Gui ClipBar:Default
      stringUpper, Product, Product
      GuiControl,ClipBar:Text, Product, %Product%
      GuiControl,ClipBar:Text, Batch, %Batch%
      GuiControl,ClipBar:Text, lot, %lot%
      GuiControl,ClipBar:Text, Coated, %Coated%
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

