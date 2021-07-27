
Clip(input=0){
  global tab, Batch, Product, lot, coated, sampleid, analytical,micro,retain,physical,CTphysical,CTretain,department
  ClipboardSaved:=Clipboardall
  If Input contains OCR
  {
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
    if (A_PriorKey != "F20") || (A_PriorKey != "Mbutton")
      exit
    send, {home}+{end}^{c}
  }
    sleep      20
    RegExMatch(Clipboard, "i)[abdefghijkl]\d{3}\b", cProduct)
    RegExMatch(Clipboard, "i)(?<!Ct#)\b\d{3}-\d{4}\b", cBatch)
    RegExMatch(Clipboard, "i)(coated: |/?ct# |/?ct#|ct |coated )\d{3}-\d{4}\b", cCoated)
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
  If cCTRetaincCTRetain
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
      TT(cProduct " " cBatch " " cLot " " cSampleID " " cCoated " " Department,4000,Varbar_x,30,3,150)
    else 
        TT(Clipboard,200,A_ScreenWidth,10,3)
    }
  else
    return 
  }

ClickClip(){
	global
MouseGetPos, xx
TimeButtonDown = %A_TickCount%
; Wait for it to be released
Loop
{
   Sleep 10
   GetKeyState, LButtonState, LButton, P
   if LButtonState = U  ; Button has been released.
   {
      If WinActive("Crimson Editor") and (xx < 25) ; Single Click in the Selection Area of CE
      {
        ;  clip()
         send, {ctrldown}{c}{ctrlup}
         return
      }
      break
   }
   elapsed = %A_TickCount%
   elapsed -= %TimeButtonDown%
   if elapsed > 200  ; Button was held down too long, so assume it's not a double-click.
   {
      MouseGetPos x0, y0            ; save start mouse position
      Loop
   {
     Sleep 20                    ; yield time to others
     GetKeyState keystate, LButton
     IfEqual keystate, U, {
       MouseGetPos x, y          ; position when button released
       break
     }
   }
   if (x-x0 > 5 or x-x0 < -5 or y-y0 > 5 or y-y0 < -5)
   {                             ; mouse has moved
      clip0 := ClipBoardAll      ; save old clipboard
      ClipBoard =
      ; Clip()                   ; selection -> clipboard
      send, {ctrldown}{c}{ctrlup}
      ClipWait 1, 1              ; restore clipboard if no data
      IfEqual ClipBoard,, SetEnv ClipBoard, %clip0%
   }
      return
   }
}
; Otherwise, button was released quickly enough.  Wait to see if it's a double-click:
TimeButtonUp = %A_TickCount%
Loop
{
   Sleep 10
   GetKeyState, LButtonState, LButton, P
   if LButtonState = D  ; Button has been pressed down again.
      break
   elapsed = %A_TickCount%
   elapsed -= %TimeButtonUp%
   if elapsed > 350  ; No click has occurred within the allowed time, so assume it's not a double-click.
      return
}

;Button pressed down again, it's at least a double-click
TimeButtonUp2 = %A_TickCount%
Loop
{
   Sleep 10
   GetKeyState, LButtonState2, LButton, P
   if LButtonState2 = U  ; Button has been released a 2nd time, let's see if it's a tripple-click.
      break
}
;Button released a 2nd time
TimeButtonUp3 = %A_TickCount%
Loop
{
   Sleep 10
   GetKeyState, LButtonState3, LButton, P
   if LButtonState3 = D  ; Button has been pressed down a 3rd time.
      break
   elapsed = %A_TickCount%
   elapsed -= %TimeButtonUp%
   if elapsed > 350  ; No click has occurred within the allowed time, so assume it's not a tripple-click.
   {  ;Double-click
      send, {ctrldown}{c}{ctrlup}
      ; clip()
      return
   }
}
;Tripple-click:
   Sleep, 100
	 Send, {ctrldown}{a}{ctrlup}
	 sleep 100
   send, {ctrldown}{c}{ctrlup}
  ;  clip()
return
	
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
    Clip()
  clipwait,0.10
  if errorlevel 
    {
    clipboard:=ClipboardSaved
    StrReplace(clipboard, "`n", "")
      send, ^{v}
      tt("paste",,100,100,,150)
    }
  else
      tt(clipboard,,100,100,,150)
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
    Clip()
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
