; #include *i C:\Users\mmignin\Documents\VQuest\lib\Functions.ahk

#ifwinactive,
Return
GetAllBatches(Delimiter:=" ",File:=""){
  global
  regBatches:=[]
			if (File){
		clipboard:=
		FileRead, Haystack, %File%
	}
	else
		Haystack:=Clipboard
		PreClip:=Clipboard
		sleep 50
  while pos := RegexMatch(Haystack, "i)(?<!Ct#)\b\d{3}-\d{4}\b", aBatch, pos+1) ; {
    ; if aBatch
      regBatches.insert(aBatch)
      ; Control, Add, %aBatch%, Combobox1, VarBar
      ; fileAppend, a,Data\Batches.txt
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

		Control, Add, %AllBatchesDDL%, Combobox1, VarBar
    ; GuiControl,Varbar:Text, Note3, %AllBatches%
    ; ControlsetText, Edit8,%AllBatches%,VarBar
		FileAppend, `n %AllBatches%, Data\Batches.txt

    SimpleClip:=1
    sleep 20
		clipboard:=AllBatches
		sleep 200
		send, ^v
    sleep 400
    SimpleClip:=1
    clipboard:=PreClip
		; Sendinput, %AllBatches%

		; PreventPopup:=
		return AllBatches
    ; msgbox, %AllBatches%,
}
GetAllProducts(Delimiter:=" ",File:=""){
  global
  regProducts:=[]
  pos=0
	if (File){
		clipboard:=
		FileRead, Haystack, %File%
	}
	else
		Haystack:=Clipboard
    PreClip:=Clipboard
		sleep 50
  ; while pos := RegexMatch(Haystack, "i)[abcdefghijkl]\d{3}\b", aProduct, pos+1) ; {
  while pos := RegexMatch(Haystack, RegexProduct, aProduct, pos+1) ; {
    ; if aBatch
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
    GuiControl,Varbar:Text, Note2, %AllProducts%
    ; ControlsetText, Edit7,%AllProducts%,VarBar
    ; IniWrite, %AllProducts%, Settings.ini, Notes, note2
		FileAppend, `n %AllProducts%, Data\Products.txt

    SimpleClip:=1
    sleep 20
    clipboard:=AllProducts
    sleep 200
    send, ^v
    sleep 400
    SimpleClip:=1
    clipboard:=Preclip
		Return AllProducts
    ; Send, {blind}%AllProducts%

    ; msgbox, %AllProducts%,
 ;FileRead, CurrentCodes,C:\Users\mmignin\Documents\VQuest\data\CurrentCodes.txt
}


	F13 & 1::             sendinput,%product% ;gosub, Product_cyclebackward
												; if Getkeystate("LCtrl","p")
													; GetAllProducts()
												; else

												; return


	F13 & 2::             sendinput, %Batch%
												; if Getkeystate("LCtrl","p")
												; 	GetAllBatches()
												; else

												; return
	F13 & 3::							sendinput, %Lot%
	F13 & 4::
    if GetKeyState("Lctrl","D")
      GetAllProducts("`n")
    else if GetKeyState("Lalt","D")
      GetAllProducts("`t")
    else
      GetAllProducts()
    return
	F13 & 5::
    if GetKeyState("Lctrl","D")
      GetAllBatches("`n")
    else if GetKeyState("Lalt","D")
      GetAllBatches("`t")
    else
      GetAllBatches()
    Return


  F13 & 6::Sendinput % excel.GetAllSheets()

Tab & 2::Excel.Batches()
  Batch_cyclebackward:
  GUI, varbar:default
  Excel.InfoLocations()
  ; CurrentList := StrSplit(CurrentCodes, "`n")
  If !ActiveWindowID
    WinGet, ActiveWindowID, ID, A
  cyclebackward:=1
  PreviousClipCycleCounter:=0 ; 13/10/2017 test
  ClipCycleCounter:=1
  ClipCycleFirst:=1
  While GetKeyState("Tab","D") and cyclebackward
    {
    If (ClipCycleCounter <> 0)s
    {
      Var:=Batches[ClipCycleCounter]
      ttext:=% DisplayToolTipText(Var)
    }
    else
      ttext:="[cancelled]"
    If (oldttext <> ttext)
      {
      ToolTip, % ttext, %A_CaretX%, %A_CaretY%
      oldttext:=ttext
      ; GuiControl, Varbar:ChooseString, ComboBox1, %ttext%
      }
    Sleep 100
    KeyWait, 2
    }ToolTip
  If (ClipCycleCounter > 0) ; If zero we've cancelled it
    {
      ; XL.Range("E1").Value:=Batches[ClipCycleCounter]
    ; Clipboard:=Batches[ClipCycleCounter]
    sleep 100
    Gosub, BatchesHandler
    ClipCycleCounter:=1
    }
  Return

	Tab & 2 up::
  Batch_cyclebackward_up:
  PreviousClipCycleCounter:=ClipCycleCounter
  If (ClipCycleFirst = 0)
    ClipCycleCounter++
  ClipCycleFirst:=0
  ; settimer, ShrinkVarBar, 200
  Return

  BatchesHandler:
  oldttext:="", ttext:="", ActiveWindowID:=""
  WinActivate, ahk_id %ActiveWindowID%
    Gui Varbar:Default
  sleep 30
  GuiControl, Varbar:ChooseString, ComboBox1, % Batches[ClipCycleCounter]
  XL.Range("E1").Value:=Batches[ClipCycleCounter]
  sleep 200
  Excel.InfoLocations()
  oldttext:="", ttext:="", ActiveWindowID:="",ClipboardOwnerProcessName:=""
  Cliptext:=
  CycleBackward:=
return


;;  Tab

	;Tab & 1::
  ; Tab & wheeldown::
	Product_cyclebackward:
		GUI, varbar:default

		winMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%Varbar_H_max%
		CurrentList := StrSplit(CurrentCodes, "`n")
		If !ActiveWindowID
			WinGet, ActiveWindowID, ID, A
		cyclebackward:=1
		PreviousClipCycleCounter:=0 ; 13/10/2017 test
		ClipCycleCounter:=1
		ClipCycleFirst:=1
		While GetKeyState("Tab","D") and cyclebackward
			{
			If (ClipCycleCounter <> 0)
			{
				Var:=CurrentList[ClipCycleCounter]
				ttext:=% DisplayToolTipText(Var)
			}
			else
				ttext:="[cancelled]"
			If (oldttext <> ttext)
				{
				ToolTip, % ttext, %A_CaretX%, %A_CaretY%
				oldttext:=ttext
				GuiControl, Varbar:ChooseString, ComboBox1, %ttext%
				}
			Sleep 100
			KeyWait, 1
			}ToolTip
		If (ClipCycleCounter > 0) ; If zero we've cancelled it
			{
			Clipboard:=CurrentList[ClipCycleCounter]
			sleep 100
			Gosub, ProductsHandler
			ClipCycleCounter:=1
			}
		Return

	;Tab & 1 Up::
	Product_cyclebackward_up:
	PreviousClipCycleCounter:=ClipCycleCounter
	If (ClipCycleFirst = 0)
		ClipCycleCounter++
	ClipCycleFirst:=0
	; settimer, ShrinkVarBar, 200
	Return

	ProductsHandler:
	oldttext:="", ttext:="", ActiveWindowID:=""
	WinActivate, ahk_id %ActiveWindowID%
		Gui Varbar:Default
	sleep 30
	; send, ^{v}
	GuiControl, Varbar:ChooseString, ComboBox1, % CurrentList[ClipCycleCounter]
	;ControlGetText, CodeString, Edit5, VarBar
	sleep 200
	clip.CodesRegex(CodeString)
	oldttext:="", ttext:="", ActiveWindowID:="",ClipboardOwnerProcessName:=""
	Cliptext:=
	CycleBackward:=
	Return


	DisplayToolTipText(TextIn,Format=0){
		TextOut:=RegExReplace(TextIn,"^\s*")
		TextOut:=SubStr(TextOut,1,750)
		StringReplace,TextOut,TextOut,`;,``;,All
		Return TextOut
		}

	+F20::
		if (ShiftPaste> 0) 						; SetTimer already started, so we log the keypress instead.
			{
					ShiftPaste+= 1
					return
			}
			ShiftPaste:= 1
			SetTimer, PressCut, -450 			; Wait for more presses within a 400 millisecond window.
			return
			ShiftPaste:
				if (ShiftPaste= 1){ 				; The key was pressed once.
						send, +{F18}								;clipchain
				}
				else if (ShiftPaste= 2){		; The key was pressed 2x
					clip.Append("`n","{x}")
				}
				else if (ShiftPaste> 2){		; The Key was pressed 3x
					clip.Append(A_Space,"{x}")
				}
			ShiftPaste:= 0
		return
	; ; +F19::
	; ; 	if (CutPresses > 0) 						; SetTimer already started, so we log the keypress instead.
	; ; 		{
	; ; 				CutPresses += 1
	; ; 				return
	; ; 		}
	; ; 		CutPresses := 1
	; 		SetTimer, PressCut, -450 			; Wait for more presses within a 400 millisecond window.
	; 		return
			PressCut:
				if (CutPresses = 1){ 				; The key was pressed once.
						send, ^x								;cut
				}
				else if (CutPresses = 2){		; The key was pressed 2x
					clip.Append("`n","{x}")
				}
				else if (CutPresses > 2){		; The Key was pressed 3x
					clip.Append(A_Space,"{x}")
				}
			CutPresses := 0
		return


	F19::  ;;copy, append, append Tab
		if winactive("Clipboard ahk_exe autohotkey.exe"){ ;if clipboard window open
			GUI, EditBox:submit
			clipboard:=EditBox
			sleep 10
			tt(clipboard)
			return
		}
		if getkeystate("F20", "p"){ 											;F20 & F19
			ClipboardSaved:=ClipboardAll
			clipboard:=
			; sleep 20
			Send, ^c
				clipwait,0.40
			if errorlevel 																;if nothing selected
				{
					clipboard:=ClipboardSaved
					sleep 50
					clip.editbox()
				}
			else {
				sendinput, ^{c}
				sleep 100
				clip.editbox()
				}
				return
			}
		if (CopyPresses > 0){  												; If Timer already started, log the keypress instead.
					CopyPresses += 1
					return
		}
			CopyPresses := 1
			SetTimer, PressCopy, -350 ; Wait for more presses within a 450 millisecond window.
			return
		PressCopy:
				if (CopyPresses = 1){	  ; The key was pressed once.
						send, ^c									;Copy
						sleep 55
						FloVar(Clipboard,900,11)
				}
				else if (CopyPresses = 2){ ; The key was pressed 2x
							clip.Append()							;AppendClip
						Sleep 250
				}
				else if (CopyPresses > 2) ; The key was priced 3x
						clip.Append(A_Space) 							;Clipchain
			CopyPresses := 0
		return

	F20:: ;;paste, editbox, clipchain
		if !getkeystate("F19", "p") && (A_PriorHotkey = "F19") && (A_TimeSincePriorHotkey < 2000) {
			clip.editbox()
			return
		}
			if getkeystate("F19", "p"){ 	; F19 & F20
			ClipboardSaved:=ClipboardAll
				clipboard:=
				Send, ^x
					clipwait,0.20
				if errorlevel 							; if nothing selected
					{
						clipboard:=ClipboardSaved
						sendinput, {delete}
						return
					}
				else
					tt(Clipboard,900,,,,200)
				return
		}
		if (PastePresses > 0) ; SetTimer already started, so we log the keypress instead.
		{
				PastePresses += 1
				return
		}
		PastePresses := 1
		SetTimer, PressPaste, -250 ; Wait for more presses within a 400 millisecond window.
		return
		PressPaste:
			if (PastePresses = 1) ; The key was pressed once.
			{
					send, ^{v}
			}
			else if (PastePresses = 2) ; The key was pressed twice.
			{
				Send, {F18}
			}
			else if (PastePresses > 2)
			{
				Clip.EditBox()
			}
			PastePresses := 0
		return


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
  clip.Regex()
  return
}


    ;;; -----Retrieves saved clipboard information since when this script last ran
      ; ^F20::
      ; CurrentList:=[]
      ;   Loop, Read, C:\Users\mmignin\Documents\VQuest\data\CurrentCodes.Txt
      ;     {
      ;       CurrentList.Insert(A_loopreadline)
      ;           maxindex := A_Index
      ;     ; ParseList := StrSplit(A_LoopReadLine, "`n")
      ;         ; Selection:= % ParseList[1]
      ;       ; if A_index < 10
      ;         ; Selection:= % "&" A_index " " ParseList[1]
      ;       ;  else
      ;         ; Selection:= % "&" A_index-10 " " ParseList[1]
      ;     }

      ;     Return
      ;   ; Loop , Read,  C:\Users\mmignin\Documents\VQuest\ClipHistory\clipvar*.txt
      ;   ; {
      ;     ; clipindex += 1
      ;     ; FileRead clipvar%A_Index%, %A_LoopFileFullPath%
      ;     ; FileDelete %A_LoopFileFullPath%
      ;   ; }
      ;   ; maxindex := clipindex
      ;   ; OnExit ExitSub

      ;   ; Clears the history by resetting the indices
      ;     ; ^+NumpadClear::
      ;     ; ^+Numpad5::
      ;     ; tooltip clipboard history cleared
      ;     ; SetTimer, ReSetToolTip, 1000
      ;     ; maxindex = 0
      ;     ; clipindex = 0
      ;     ; Return

      ;   ; Scroll up and down through clipboard history
      ;   ^+Wheelup::
      ;   if clipindex > 1
      ;   {
      ;     clipindex -= 1
      ;   }
      ;   thisclip :=  CurrentList[ClipIndex]  ;clipvar%clipindex%
      ;   clipboard := thisclip
      ;   tooltip %clipindex% - %clipboard%
      ;   SetTimer, ReSetToolTip, 1000
      ;   Return
      ;   ^+Wheeldown::
      ;   if clipindex < %maxindex%
      ;   {
      ;     clipindex += 1
      ;   }
      ;   thisclip := CurrentList[ClipIndex]
      ;   clipboard := thisclip
      ;   tooltip %clipintdex% - %clipboard%
      ;   SetTimer, ReSetToolTip, 1000
      ;   Return

      ;   ; Add clipboard contents to the stack when you copy or paste using the keyboard
      ;     ~^x::
      ;     ~^c::
      ;     Sleep 500
      ;     clipindex += 1
      ;     clipvar%clipindex% := clipboard
      ;     thisclip := clipvar%clipindex%
      ;     tooltip %clipindex% - %thisclip%
      ;     SetTimer, ReSetToolTip, 1000
      ;     if clipindex > %maxindex%  ;for adding more files couning from the highest
      ;     {
      ;       maxindex := clipindex
      ;     }
      ;     Return

      ;   ; Clear the ToolTip
      ;     ReSetToolTip:
      ;         ToolTip
      ;         SetTimer, ReSetToolTip, Off
      ;     return

        ; Saves the current clipboard history to hard disk
      ;   ExitSub:
      ;     SetFormat, float, 06.0
      ;     Loop %maxindex%
      ;     {
      ;       zindex := SubStr("0000000000" . A_Index, -9)
      ;       thisclip := clipvar%A_Index%
      ;       FileAppend %thisclip%, C:\Users\mmignin\Documents\VQuest\ClipHistory\clipvar%zindex%.txt
      ;     }
      ;  ExitApp



    ;;-------end test


clipChange(type){
  global
  ifwinactive, Select tests for request: R
    return
  ; ifwinexist, Mats LMS Workbook.xlsb - Excel
      ; return
  if SimpleClip
    return
  sleep 50
    clip.Parse1()
    sleep 25

    ; if winactive("ahk_exe WFICA32.EXE"){
      ; clip.Department()
    if A_PriorKey = c
      FloVar(Clipboard,2000,13)
    else if A_PriorhotKey = F19
      FloVar(Clipboard,2000,13)
    else if A_PriorKey = x
      FloVar(Clipboard,2000,13)
    else if A_PriorKey = b
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
      ; Gui, VarBar:Submit, NoHide
      Parse:= Input ? Input : Clipboard
        ; RegexMatch(Parse, RegexProduct,r)
      Product:=RegexMatch(Parse, RegexProduct,r) ? rProduct : Product
      Batch:=RegexMatch(Parse, RegexBatch, r) ? rBatch : Batch
      Lot:=RegexMatch(Parse, RegexLot, r) ? rLot : Lot
      Coated:=RegExMatch(Parse, RegexCoated, r) ? rCoated : Coated
      Ct:=rCoated ? " ct#" : ""
      GuiControl,Varbar:Text, Product, %rProduct%
      GuiControl,Varbar:Text, Batch, %rBatch%
      GuiControl,Varbar:Text, lot, %rlot%
      GuiControl,Varbar:Text, Coated, %rCoated%

      CodeString:=Trim(rProduct " " rBatch " " rLot Ct rCoated)
      ; control, choose, %CodeString%
			; ControlsetText, Edit5,%CodeString%, VarBar
      ; return
        try GuiControl, Varbar:ChooseString, ComboBox1, % CodeString
        catch
        {
          if (A_Index = 1)
      			ControlsetText, Edit5,%CodeString%, VarBar
          if (A_Index > 20)
            return
          	; Gui, Varbar:submit, nohide
      			ControlGet, Wholex, List,,Combobox1, VarBar         ;- get the whole listbox1
          	Control, Add, %CodeString%, ComboBox1, VarBar    ; add to the bottom of the list
        		sort,Wholex, U
          ; if (A_Index = 1)
      			; control, choose, %CodeString%, ComboBox1, VarBar
          ; try GuiControl, Varbar:ChooseString, ComboBox1, % CodeString
        }
        ; return

; }

     Return Trim(CodeString)
}


Parse(Value:=""){
  global
  Gui Varbar:Default
  regProducts:=[], regBatches:=[],
  sleep 120
    ParsedClipboard:= Value ? Value : Clipboard ;if no Value, use Clipboard
	StringReplace, ParsedClipboard, ParsedClipboard, `n, `n, UseErrorLevel ;Get Total Lines
		; StrReplace(ParseClipboard, "`n",,TotalLines)
    TotalLines:=errorLevel
    If (TotalLines<=1){
      ; this.codesRegex(A_LoopField)
      try GuiControl, Varbar:ChooseString, ComboBox1, % this.codesRegex(A_LoopField)
    }
    else {
    loop, parse, ParsedClipboard, "`n"
    {
    GuiControl, -Redraw, ComboBox1
      ; if A_Index = 1              ; if first line
          this.codesRegex(A_LoopField)
      ; else if A_Index > 1
          regProducts.insert(clip.CodesRegex(A_LoopField))

    }
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
          ; filedelete, data\CurrentCodes.txt
          For Each, Element In Products {
            CurrentCodes .= Element "`r`n"
          }
          RemoveTextDuplicates(CurrentCodes)
            ; VarBar.AddToList(CurrentCodes)

          ; FileAppend, %CurrentCodes%, data\CurrentCodes.txt
          ; sleep 100
          ; FileAppend, %CurrentCodes%, data\CurrentCodes.txt
          ; Varbar.AddToList(CurrentCodes)
          ; sleep 100
        ;  RemoveFileDuplicates("C:\Users\mmignin\Documents\VQuest\Data\CurrentCodes.txt")
          ; sleep 100
                    ; RegProducts.InsertAt(1, Trim(Match))
                    ; gui, Varbar:Default
                   ; Gui, Varbar:+Delimiter`r`n
                    ; GuiControl,, DDL, % CurrentCodes := "`n" Trim(Match) "`n`n" Trim(StrReplace(CurrentCodes, "`n`n", "`n"), "`n")
          ; DDL:=
          ; GuiControl,,DDL,
          ; GuiControl, Varbar:MoveDraw, DDL
          ; guicontrol, ChooseString, ComboBox1, %Product%

        ; Pop(CurrentCodes,,500,"Right")
      ; return
    GuiControl, +Redraw, ComboBox1
    return
  }
    try GuiControl, Varbar:ChooseString, ComboBox1, % CodeString
}
}

Parse1(Value:=""){
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
          RemoveFileDuplicates("C:\Users\mmignin\Documents\VQuest\Data\CurrentCodes.txt")
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


SetVarbar(){
  global Product, Batch, Lot, Coated, CodeString
    Gui Varbar:Default
      GuiControl,Varbar:Text, Product, %Product%
      GuiControl,Varbar:Text, Batch, %Batch%
      GuiControl,Varbar:Text, lot, %lot%
      GuiControl,Varbar:Text, Coated, %Coated%
      Ct:=Coated ? " ct#" : ""
      ; GuiControl,Varbar:Text, CodeString, % Trim(Product " " Batch " " Lot Ct Coated)
      GuiControl, Varbar:ChooseString, ComboBox1, % Trim(Product " " Batch " " Lot Ct Coated)
  ; ConnectedProduct:=

}


SingleRegex(){
    global
    ; ConnectedProducts:=[]
    Gui Varbar:Default
    ConnectedProduct:=
      Haystack:=Clipboard
    sleep      20
      ; RegExMatch(HayStack, regexProduct,rProduct)
      ; RegExMatch(HayStack, regexBatch, rBatch)
      ; RegExMatch(HayStack, regexLot, rlot)
      ; RegExMatch(HayStack, regexCoated, r)
      this.CodesRegex(Haystack)
      sleep 50
            this.AddtoList(ConnectedProduct)
        ; GuiControl, ChooseString, Combobox1, %ConnectedProduct%
      ; if rProduct {
      ;   GUI, Varbar:font, cBlack s16  Norm w700, Consolas
      ;   GuiControl,Varbar:Text, Product, %rProduct%
      ;   GuiControl, Font, Product
      ;   Product:=rProduct
      ;   ConnectedProduct.=rProduct
      ; }
      ; If rBatch {
      ;   GUI, Varbar:font, cBlack s12 Norm W700 ,Consolas
      ;   GuiControl,Varbar:Text, Batch, %rBatch%
      ;   GuiControl, Font, Batch
      ;   Batch:=rBatch
      ;   ConnectedProduct.= " " rBatch
      ; }
      ; If rLot {
      ;   GUI, Varbar:font, cBlack s10 Norm w600 , Consolas
      ;   GuiControl,Varbar:Text, lot, %rlot%
      ;   GuiControl, Font, Lot
      ;   lot:=rLot
      ;   ConnectedProduct.= " " rLot
      ; }
      ; If rCoated {
      ;   GUI, Varbar:font, cBlack s8.5 Norm w600, Arial Narrow
      ;   GuiControl,Varbar:Text, Coated, %rCoated%
      ;   GuiControl, Font, Coated
      ;   Coated:=rCoated
      ;   ConnectedProduct.= " ct#" rCoated
      ; }

      ; if !rProduct {
      ;   GUI, Varbar:font, c272822 s10  Right italic w300, Arial Narrow
      ;   GuiControl, Font, Product
      ;   ; GuiControl,Varbar:Text, Product, %rProduct%
      ;   Poduct:=rProduct
      ; }
      ; If !rBatch {
      ;   GUI, Varbar:font, c272822 s10 italic right w300, Arial Narrow
      ;   GuiControl, Font, Batch
      ;   ; GuiControl,Varbar:Text, Batch, %rBatch%
      ;   Batch:=rBatch
      ; }
      ; If !rLot {
      ;   GUI, Varbar:font, c272822  s10 italic  Right w300, Arial Narrow
      ;   GuiControl, Font, lot
      ;   ; GuiControl,Varbar:Text, lot, %rlot%
      ;   lot:=rLot
      ; }
      ; If !rCoated {
      ;   GuiControl, Font, Coated
      ;   GUI, Varbar:font, c272822  s10 Italic Right w300, Arial Narrow
      ;   ; GuiControl,Varbar:Text, Coated, %rCoated%
      ;   Coated:=rCoated
      ; }

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
      RegExMatch(HayStack, RegexProduct,r)  ;"i)[abdefghijkl]\d{3}", rProduct)
      RegExMatch(HayStack, RegexBatch, r)
      RegExMatch(HayStack, RegexLot, r)
      RegExMatch(HayStack, RegexCoated, r)
      If rProduct && rBatch && rlot || rCoated
        FileAppend, %rProduct% %rBatch% %rlot% %rCoated%, data\CurrentCodes.txt
      If rProduct {
        GuiControl,Varbar:Text, Product, %rProduct%
        Product:=rProduct
        ; IniWrite, %rProduct%, Settings.ini, Products, Product
        ; AppendCode:="`n" rProduct " " rBatch " " rlot "  Ct#" rCoated
        ; TimmedAppendcode:=Trim(AppendCode)
        ; FileAppend,%TrimmedAppendCode%, Data\CurrentC.txt
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

ClickText(Button:="Lbutton", Count:="1"){
	mousegetpos, mousex, mousey
	SetDefaultMouseSpeed, 0
	mouseClick, %Button%, %A_CaretX%, %A_caretY%, %Count%
	mousemove, %mousex%, %mousey%, 0
	SetDefaultMouseSpeed, 1
}






}


