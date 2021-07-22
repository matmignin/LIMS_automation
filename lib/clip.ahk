






Clip(input=0){
  global tab, Batch, Product, lot, coated, sampleid, analytical,micro,retain,physical,CTphysical,CTretain,department
  ClipboardSaved:=Clipboardall
  If Input contains OCR
  {
  ;  FlashScreen()
    OCR()
    return
  }
  clipboard:=
  if (input=="cut")
    send, ^x
  else
    send, ^c
  sleep %input%
  clipwait,0.55
  if errorlevel
  {
    clipboard:=ClipboardSaved
    if (A_PriorKey != "F20")
      exit
    send, {home}+{end}^{c}
    ; clk(A_CaretX,A_CaretY,,2)
    ; TT(Clipboard,1000,,,3)
    ; clipwait
  ; TT(Clipboard,2000,(A_ScreenWidth/2),((A_screenheight/3)*2))
  }

  
  ; CoordMode  , Tooltip, Screen
  ; CoordMode  , Tooltip, Relative
    sleep      20
    RegExMatch(Clipboard, "i)[abdefghijkl]\d{3}\b", cProduct)
    RegExMatch(Clipboard, "i)(?<!Ct#)\b\d{3}-\d{4}\b", cBatch)
  ; RegExMatch(Clipboard, "(?<=Coated: )\b\d{3}-\d{4}\b", cCoated)
    RegExMatch(Clipboard, "i)(coated: |/?ct# |/?ct#|ct |coated )\d{3}-\d{4}\b", cCoated)
  ; RegExMatch(Clipboard, "(?<=Ct# )|(?<=Coated.?)\b\d{3}-\d{4}\b", cCoated)
    RegExMatch(cCoated,   "\d{3}-\d{4}", cCoated)
    RegExMatch(Clipboard, "i)(\b\d{4}\w\d\w?|\bBulk\b)", clot)
    RegExMatch(Clipboard, "i)\bs\d{8}-\d{3}\b", cSampleID)
    
    Regexmatch(Clipboard, "i)(\bAnalytical \(In Process\)|\bI, Analytical\b|\bIn Process, Analytical\b)", cAnalytical)
    Regexmatch(Clipboard, "i)((?!\bFinished, )Micro\b|(?!\bF, )Micro\b|\bMicro(?= \(Finished\))|\bMicro(?= Lab\b))",cMicro)
    Regexmatch(Clipboard, "i)(\bI, Retain\b|\bIn Process, Retain\b|\bRetain \(In)", cRetain)
    Regexmatch(Clipboard, "i)(\bI, Physical\b|In Process, Physical\b|\bPhysical \(In Process\))", cPhysical)
    Regexmatch(Clipboard, "i)(\bCT, Physical\b|Coated, Physical\b|\bCoated, Physical\b)", cCTPhysical)
    Regexmatch(Clipboard, "i)(\bCT, Retain\|Coated, Retain\b)", cCTRetain)
    Sleep      20

    ; TT(cProduct "`n" cBatch "`n" clot,1500,,,3)
  If cProduct {
  GuiControl,Varbar:Text, Product, %cProduct%
				IniWrite, %cProduct%, data.ini, SavedVariables, Product
        Fileappend, %cProduct%`n, lib/Product.txt
  }
  If cBatch {
    GuiControl,Varbar:Text, Batch, %cBatch%
				IniWrite, %cBatch%, data.ini, SavedVariables, Batch
        Fileappend, %cBatch%`n, lib/Batch.txt
    }
  If cCoated {
    GuiControl,Varbar:Text, Coated, %cCoated%
				IniWrite, %cCoated%, data.ini, SavedVariables, Coated
        Fileappend, %cCoated%`n, lib/Coated.txt
    }
  If cLot {
    GuiControl,Varbar:Text, lot, %clot%
				IniWrite, %cLot%, data.ini, SavedVariables, Lot
        Fileappend, %cLot%`n, lib/Lot.txt
    }
  If cSampleID {
    GuiControl,Varbar:text, SampleID, %cSampleID%
				IniWrite, %cSampleID%, data.ini, SavedVariables, SampleID
        Fileappend, %cSampleID%`n, lib/SampleID.txt
    }
  If cAnalytical
    Department=Analytical
  If cMicro
    Department=Micro
  If cRetain
    Department=Retain
  If cCTRetain
    Department:="Retain (Coated)"
  If cPhysical
    Department=Physical
  If cCTPhysical
    Department:="Physical (Coated)"
  If cCTRetain
    Department=CTRetain
  GuiControl,Varbar:Text, Department, %Department%
  if (Input==0) {
    if cProduct || cBatch || cLot || cCoated || cSampleID || cAnalytical || cMicro || cRetain || cPhysical || cCTPhysical || cCTRetain || Winactive("ahk_exe WFICA32.EXE") 
      TT(cProduct " " cBatch " " cLot " " cSampleID " " cCoated " `n " Department,4000,,,3)
    else 
      TT(Clipboard,400, 50,50,3)
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
  ClipPaste(){
  ClipboardSaved:=ClipboardAll
  clipboard:=
    sendinput, {ctrldown}{c}{ctrlup}
  clipwait,0.10
  if errorlevel 
    {
    clipboard:=ClipboardSaved
      sendinput, ^{v}
      tt("paste",,100,100)
    }
  else
      tt(clipboard,,100,100)
    return 
  }
  
Clip_C2(){
  Global
    sendinput, {ctrlup}{altup}
    KeyWait, F20, T0.45
    If ErrorLevel
    {
        TT(":CUT:")
        KeyWait, F20,U 
        if (A_PriorKey!="F20")
        {
          TT("")
          exit
        }
        if (A_PriorKey="F20")
        {
          clipboard:=
          send, ^x
          clipwait
          TT(clipboard,200)
          return
        }if (A_PriorKey!="F20")
          KeyWait, F20,
        exit
    }
    ; if (A_PriorKey contains F19)
      ; exit
    ; if (A_PriorhotKey contains F19)
    Clip()
    ; TT(Clipboard,,0,0,3)
    ; if (A_ThisHotkey != "F20")
    ;     exit
 }
clip_c(){
  Global
      sendinput, {ctrlup}{altup}{shiftup}
    KeyWait, F20, T0.20
    If ErrorLevel
    {
        KeyWait, F20, T0.65
        if (A_PriorKey!="F20") ;allows for other key combos
          exit
        if (A_PriorKey="F20") {  
        If !ErrorLevel
        {
          Clip("cut") ; will trigger less 1 secReturnReturnErrorLevel ClipChainPasteDoubleClickClipChainPasteDoubleClick
          Return
        }
        Else ;will trigger after 1 sec
          send, {F22}
          ; KeyWait, F20,
          Return
      }
    }
      Clip()
      return
}



clip_v(){
  Global
    KeyWait, F19, T0.30
    If ErrorLevel
    {
        KeyWait, F19, T2
        if (A_PriorKey!="F19")
          exit
        if (A_PriorKey="F19")
        If !ErrorLevel
        {
          ; send, {F21}
          Return
        }
          KeyWait, F19,
          Return
      }
    if Errorlevel = 0
    KeyWait, F19, T0.60
      if !ErrorLevel
      {
        If (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<400) ;if double clic
            wheel_paste()
          Else
          return
      }
            ; Send, ^v
      return
    }
clip_ctrl(){
  Global
    KeyWait, F19, T0.30
    If ErrorLevel
    {
        KeyWait, F19, T2
        if (A_PriorKey!="F19")
          exit
        if (A_PriorKey="F19")
        If !ErrorLevel
        {
          ; send, {F21}
          Return
        }
          KeyWait, F19,
          Return
      }
    if Errorlevel = 0
    KeyWait, F19, T0.60
      if !ErrorLevel
      {
        If (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<400) ;if double clic
            wheel_paste()
          Else
          return
      }
            ; Send, ^v
      return
    }
/* 

c


*/
return
clip_v2(){
  Global
      sendinput, {ctrlup}{altup}{shiftup}
    KeyWait, F19, T0.35
    if !Errorlevel
      {
        If (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<500){ ;if double clic
        send, ^{left}+^{right}
          wheel_paste()
          exit
        }
        Else
          return  
      }
    If ErrorLevel
    {
      errorlevel:=
        KeyWait, F19, T0.55
        if (A_PriorKey!="F19") ;allows for other key combos
          exit
        if (A_PriorKey="F19") {  
        If !ErrorLevel
        {
          ; TT("triggerd after .85 sec",,,,2)
          ; wheel_paste() ; will trigger less 1
          return
        }
        Else ;will trigger after 1 sec
          send, {F21}
          ; KeyWait, F19,
          exit
      }
    }
      wheel_paste()
      return
}
