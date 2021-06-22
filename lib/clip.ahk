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
  send, ^c
  clipwait,0.95
  if errorlevel
  {
    clipboard:=ClipboardSaved
    if (A_PriorKey != "F20")
      exit
    tooltip(Clipboard,1000,,,3)
      menu.variable()
    exit
  }
  
  CoordMode, Tooltip, Screen
  Tooltip(Clipboard,2000,(A_ScreenWidth/2),((A_screenheight/3)*2))
  CoordMode, Tooltip, Relative
  sleep 20
  RegExMatch(Clipboard, "[ADEFGLHKJIadefglhkji]\d{3}\b", cProduct)
  RegExMatch(Clipboard, "\b(?!Ct#)\d{3}-\d{4}\b", cBatch)
  RegExMatch(Clipboard, "(?<=Ct#\d{3}-\d{4}\b", cCoated)
  RegExMatch(cCoated, "\d{3}-\d{4}\b", cCoated)
  RegExMatch(Clipboard, "(\b\d{4}\w\d\w?|\bBulk\b)", clot)
  RegExMatch(Clipboard, "\b[Ss]\d{8}-\d{3}\b", cSampleID)
  Regexmatch(Clipboard, "(\bAnalytical \(In Process\)|\bI, Analytical\b|\bIn Process, Analytical\b)", cAnalytical)
  Regexmatch(Clipboard, "((?!\bFinished, )Micro\b|(?!\bF, )Micro\b|\bMicro(?= \(Finished\))|\bMicro(?= Lab\b))",cMicro)
  Regexmatch(Clipboard, "(\bI, Retain\b|\bIn Process, Retain\b|\bRetain \(In)", cRetain)
  Regexmatch(Clipboard, "(\bI, Physical\b|In Process, Physical\b|\bPhysical \(In Process\))", cPhysical)
  Regexmatch(Clipboard, "(\bCT, Physical\b|Coated, Physical\b|\bCoated, Physical\b)", cCTPhysical)
  Regexmatch(Clipboard, "(\bCT, Retain\|Coated, Retain\b)", cCTRetain)
  Sleep 20

    ; tooltip(cProduct "`n" cBatch "`n" clot,1500,,,3)
  If cProduct
  GuiControl,Varbar:Text, Product, %cProduct%
  If cBatch
    GuiControl,Varbar:Text, Batch, %cBatch%
  If cCoated
    GuiControl,Varbar:Text, Coated, %cCoated%
  If cLot
    GuiControl,Varbar:Text, lot, %clot%
  If cSampleID
    GuiControl,Varbar:text, SampleID, %cSampleID%
  If cAnalytical
    Department=Analytical
  If cMicro
    Department=Micro
  If cRetain
    Department=Retain
  If cCTRetain
    Department=CTRetain
  If cPhysical
    Department=Physical
  If cCTPhysical
    Department=CTPhysical
  If cCTRetain
    Department=CTRetain
  GuiControl,Varbar:Text, Department, %Department%
    if cProduct || cBatch || cLot || cCoated || cSampleID || cAnalytical || cMicro || cRetain || cPhysical || cCTPhysical || cCTRetain
    Tooltip(cProduct " " cBatch " " cLot " " cCoated " " cSampleID "`n`t " Department,4000,,,3)
  }

Clip_C(){
  Global
    KeyWait, F20, T0.45
    If ErrorLevel
    {
        tooltip(":CUT:")
        KeyWait, F20,U 
        if (A_PriorKey!="F20")
        {
          tooltip("")
          exit
        }
        if (A_PriorKey="F20")
        {
          clipboard:=
          send, ^x
          clipwait
          Tooltip(clipboard,1000)
          return
        }if (A_PriorKey!="F20")
          KeyWait, F20,
        exit
    }
    ; if (A_PriorKey contains F19)
      ; exit
    ; if (A_PriorhotKey contains F19)
    Clip()
    ; tooltip(Clipboard,,0,0,3)
    ; if (A_ThisHotkey != "F20")
    ;     exit
 }



clip_v(){
  Global
    KeyWait, F19, T0.20
    If ErrorLevel
    {
        ; tooltip(":CUT:")
        KeyWait, F19,U 
        if (A_PriorKey!="F19")
          exit
        if (A_PriorKey="F19")
        {
          send, {F21}
          exit
        }
          KeyWait, F19,
          exit
      }
    if Errorlevel = 0
    KeyWait, F19, T0.60
      if !ErrorLevelErrorLevelerrorlevel
        
            wheel_paste()
      sleep 200
          
        return
    }

return