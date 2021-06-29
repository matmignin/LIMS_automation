Clip(input=0){
  global
  ClipboardSaved:=Clipboard
  If Input contains OCR
  {
  ;  FlashScreen()
    OCR()
    return
  }
  clipboard:=
  sleep 20
  cProduct:=
  cBatch:=
  cLot:=
  cCoated:=
  cSampleID:=
  cAnalytical:=
  cMicro:=
  cRetain:=
  cPhysical:=
  cCTPhysical:=
  cCTRetain:=
  Department:=
  if (input=="cut")
    send, ^x
  else
    send, ^c
  clipwait,0.65
  if errorlevel
  {
    clipboard:=ClipboardSaved
    if (A_PriorKey != "F20")
      exit
    ; TT(Clipboard,1000,,,3)
    send, ^{left}+^{right}^c
    ; clipwait
  ; TT(Clipboard,2000,(A_ScreenWidth/2),((A_screenheight/3)*2))
  }

  
  ; CoordMode, Tooltip, Screen
  ; CoordMode, Tooltip, Relative
  sleep 20
  RegExMatch(Clipboard, "[ABDEFGLHKJIabdefglhkji]\d{3}\b", cProduct)
  RegExMatch(Clipboard, "(?<!Coated: )\b\d{3}-\d{4}\b", cBatch)
  ; RegExMatch(Clipboard, "(?<=Coated: )\b\d{3}-\d{4}\b", cCoated)
  RegExMatch(Clipboard, "([Cc]oated: |[Cc][Tt]#|[Cc[Tt] |[Cc]oated)\d{3}-\d{4}\b", cCoated)
  ; RegExMatch(Clipboard, "(?<=Ct# )|(?<=Coated.?)\b\d{3}-\d{4}\b", cCoated)
  RegExMatch(cCoated, "\d{3}-\d{4}", cCoated)
  RegExMatch(Clipboard, "(\b\d{4}\w\d\w?|\bBulk\b)", clot)
  RegExMatch(Clipboard, "\b[Ss]\d{8}-\d{3}\b", cSampleID)
  Regexmatch(Clipboard, "(\bAnalytical \(In Process\)|\bI, Analytical\b|\bIn Process, Analytical\b)", cAnalytical)
  Regexmatch(Clipboard, "((?!\bFinished, )Micro\b|(?!\bF, )Micro\b|\bMicro(?= \(Finished\))|\bMicro(?= Lab\b))",cMicro)
  Regexmatch(Clipboard, "(\bI, Retain\b|\bIn Process, Retain\b|\bRetain \(In)", cRetain)
  Regexmatch(Clipboard, "(\bI, Physical\b|In Process, Physical\b|\bPhysical \(In Process\))", cPhysical)
  Regexmatch(Clipboard, "(\bCT, Physical\b|Coated, Physical\b|\bCoated, Physical\b)", cCTPhysical)
  Regexmatch(Clipboard, "(\bCT, Retain\|Coated, Retain\b)", cCTRetain)
  Sleep 20

    ; TT(cProduct "`n" cBatch "`n" clot,1500,,,3)
  If cProduct {
  GuiControl,Varbar:Text, Product, %cProduct%
				IniWrite, %cProduct%, data.ini, SavedVariables, Product
  }
  If cBatch {
    GuiControl,Varbar:Text, Batch, %cBatch%
				IniWrite, %cBatch%, data.ini, SavedVariables, Batch
    }
  If cCoated {
    GuiControl,Varbar:Text, Coated, %cCoated%
				IniWrite, %cCoated%, data.ini, SavedVariables, Coated
    }
  If cLot {
    GuiControl,Varbar:Text, lot, %clot%
				IniWrite, %cLot%, data.ini, SavedVariables, Lot
    }
  If cSampleID {
    GuiControl,Varbar:text, SampleID, %cSampleID%
				IniWrite, %cSampleID%, data.ini, SavedVariables, SampleID
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
    if cProduct || cBatch || cLot || cCoated || cSampleID || cAnalytical || cMicro || cRetain || cPhysical || cCTPhysical || cCTRetain && Winactive("ahk_exe WFICA32.EXE") 
      TT(cProduct " " cBatch " " cLot " " cSampleID "`n`t " cCoated "`t " Department,4000,,,3)
    else 
      TT(Clipboard,1000,,,3)
    }
  else
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
          TT(clipboard,1000)
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
      sendinput, {ctrlup}{altup}
    KeyWait, F20, T0.20
    If ErrorLevel
    {
        KeyWait, F20, T0.75
        tt("Clipchain")
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
    KeyWait, F19, T0.20
    If ErrorLevel
    {
        KeyWait, F19, T2
        if (A_PriorKey!="F19")
          exit
        if (A_PriorKey="F19")
        If !ErrorLevel
        {
          send, {F21}
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
      return
    }

return