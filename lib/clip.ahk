
Clip(input=0,Wait:="0.55"){
  global tab, Batch, Product, lot, coated, sampleid, analytical,micro,retain,physical,CTphysical,CTretain,department
  ; ClipboardSaved:=Clipboardall
  If Input contains OCR
  {
    OCR()
    return
  }
  clipboard:=
  if (input=="cut")
    Send, ^{x}{ctrlup}
  else
    Send, ^{c}{ctrlup}
  clipwait,%Wait%
  sleep %input%
  if errorlevel
  {
    ; clipboard:=ClipboardSaved
    if (A_PriorKey != "F19") || (A_PriorhotKey != "Mbutton") || (A_PriorhotKey != "^Wheeldown")
      exit
    Send, {home}{shiftdown}{end}{shiftup}^{c}{ctrlup}
  }
  clip.Regex()
  return
}

clipClip(type){
  global
  ifwinactive, ahk_exe EXCEL.EXE
    return
  ifwinactive, Select tests for request: R
    return
  ; Send, ^c
    clip.Regex()
    ; clip.regex("Department")
    if Clipboard
    tt(clipboard, 1200,100,100,2,230,"R")
      ; PoP(Clipboard)
return

}


Class Clip {

Append(Delimiter:="`n",key:="c"){
    global
		PreClip:=Clipboard
		Clipboard:=
		Send, ^%key%
		clipwait, 0.75
		if errorlevel
      clipboard:=Preclip
    else  
    {
      clipboard := Preclip Delimiter Clipboard
      tt(clipboard,1500,A_ScreenWidth-500,,2,150)
    }
    ; ; Delimiter:=
    ; tt(Preclip)
		return 
}



Regex(Category:="All"){
    global Batch, Batch0, Product, Product0, Product1, Product2, Product3, lot, coated, sampleid, analytical,micro,retain,physical,CTphysical,CTretain, products, Department
    ; global ;Batch, Batch0, Product, Product0, Product1, Product2, Product3, lot, coated, sampleid, analytical,micro,retain,physical,CTphysical,CTretain, products
    sleep      20
    ; If (Category!="Department") {
      RegExMatch(Clipboard, "i)\b[abdefghijkl]\d{3}\b", cProduct)
      RegExMatch(Clipboard, "i)(?<!Ct#)\d{3}-\d{4}\b", cBatch)
      RegExMatch(Clipboard, "i)(\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b)", clot)
      RegExMatch(Clipboard, "i)(coated: |/?ct#/s|Ct#|ct/s|coated/s)\d{3}-\d{4}\b", ctCoated)
      RegExMatch(ctCoated,   "\d{3}-\d{4}", cCoated)
      RegExMatch(Clipboard, "i)(s|\$)\d{8}-\d{3}\b", cSampleID)
      StringReplace, cSampleID, cSampleID, $, S
      If cProduct {
        ; if (cProduct!=Product) {
            GuiControl,Varbar:Text, Product, %cProduct%
            Product4:=Product3
            Product3:=Product2
            Product2:=Product1
            Product1:=Product
            Product:=cProduct

            IniWrite, %Product3%, data.ini, Products, Product4
            sleep 20
            IniWrite, %Product2%, data.ini, Products, Product3
            sleep 20
            IniWrite, %Product1%, data.ini, Products, Product2
            sleep 20
            ; IniWrite, %Product%,  data.ini, Products, Product1
            sleep 20
            IniWrite, %cProduct%, data.ini, Products, Product
        ; {
          ; Product.Insert(Product)
          ; Product.insert(cProduct)
          ; Product.Insert(Product1)
          ; Products.Insert(Product2)
          ; Products.Insert(Product3)
          ; Products.Insert(Product4)
          ; loop 4
          ;   n:=A_index
          ;   next:=A_index
          ; msgbox % Product "`n1:" product1 "`n2" Product2 "`n3" Product3 "`n4" Product4
          ; Product:=
        ; }
            ; IniWrite, %cProduct%, data.ini, SavedVariables, %Product%
            ; IniWrite, %clot% %cCoated%, data.ini, %cProduct%, %cBatch%
              ; if cBatch
                ; Fileappend, %cProduct% %cbatch% %cLot% %ctCoated% `n, Products.txt
              ; else
                ; Fileappend, %cProduct%`n, Products.txt
      }
      If cBatch {
        if !(cBatch=Batch)
        {
          Batch0:=Batch
          IniWrite, %Batch0%, data.ini, SavedVariables, Batch0
        }
        GuiControl,Varbar:Text, Batch, %cBatch%
            IniWrite, %cBatch%, data.ini, SavedVariables, Batch
            ; Fileappend, %cBatch%`n, Batch.txt
        }
      If cCoated {
        GuiControl,Varbar:Text, Coated, %cCoated%
            IniWrite, %cCoated%, data.ini, SavedVariables, Coated
            ; Fileappend, %cCoated%`n, lib/Coated.txt
            varbar.show()
        }
      ; If !cCoated {
        ; GuiControl,Varbar:Text, Coated, %cCoated%
            ; cCoated:=
            ; IniWrite,%cCoated%, data.ini, SavedVariables, Coated
            ; varbar.show()
            ; Fileappend, %cCoated%`n, lib/Coated.txt
        ; }
      If cLot {
        GuiControl,Varbar:Text, lot, %clot%
            IniWrite, %cLot%, data.ini, SavedVariables, Lot
            ; Fileappend, %cLot%`n, lib/Lot.txt
        }
      If cSampleID {
        GuiControl,Varbar:text, SampleID, %cSampleID%
            IniWrite, %cSampleID%, data.ini, SavedVariables, SampleID
            ; Fileappend, %cSampleID%`n, lib/SampleID.txt
        }
      sleep 20
    ; }
    ; if (Category!="Codes"){
      ; Regexmatch(Clipboard, "i)(Analytical \(In Process\)|\bI, Analytical\b|\bIn Process, Analytical\b)", cAnalytical)
      ; Regexmatch(Clipboard, "i)\bF, Micro\b",cMicro)
      ; Regexmatch(Clipboard, "i)\bI, Retain\b", cRetain)
      ; Regexmatch(Clipboard, "i)\bI, Physical\b", cPhysical)
      ; Regexmatch(Clipboard, "i)\bCT, Physical\b", cCTPhysical)
      ; Regexmatch(Clipboard, "i)\bCT, Retain\b", cCTRetain)
      Regexmatch(Clipboard, "i)(Analytical \(In Process\)|\bI, Analytical\b|\bIn Process, Analytical\b)", cAnalytical)
      Regexmatch(Clipboard, "i)((?!\bFinished, )Micro\b|(?!\bF, )Micro\b|\bMicro(?= \(Finished\))|\bMicro(?= Lab\b))",cMicro)
      Regexmatch(Clipboard, "i)(\bI, Retain\b|\bIn Process, Retain\b|\bRetain \(In)", cRetain)
      Regexmatch(Clipboard, "i)(\bI, Physical\b|\bPhysical\b|In Process, Physical\b|\bPhysical \(In Process\))", cPhysical)
      Regexmatch(Clipboard, "i)(\bCT, Physical\b|Coated, Physical\b|\bCoated, Physical\b|Physical \(Coated\)", cCTPhysical)
      Regexmatch(Clipboard, "i)(\bCT, Retain\|Coated, Retain\b|Retain \(Coated\))", cCTRetain)
      Sleep      20
      If cAnalytical
        Department:="Analytical"
      If cMicro
        Department:="Micro"
      If cRetain
        Department:="Retain"
      If cCTRetain
        Department:="Retain (Coated)"
      If cPhysical
        Department:="Physical"
      If cCTPhysical
        Department:="Physical (Coated)"
    ; }
    ; if cProduct || cBatch || cLot || cCoated || cSampleID || cAnalytical || cMicro || cRetain || cPhysical || cCTPhysical || cCTRetain || Department ;|| Winactive("ahk_exe WFICA32.EXE") 
    ;   ; TT(cProduct " " cBatch " " cLot " " cCoated " `n`t" Department ,3000,,,3,250,"R")
    ; if cProduct 
    ;   Vars:=cProduct
    ; If cBatch
    ;   Vars.="`t"cBatch
    ; If cLot
    ;   Vars.="`n"cLot
    ; If cCoated
    ;   Vars.="`t"cCoated
    ; If ShowSampleID
    ;   If cSampleID
    ;     Vars.="`t"cSampleID
    ; If cAnalytical
    ;   Vars.="`n`t"cAnalytical
    ; If Department
    ;   Vars.="`n`t"Department
    ; TT(Vars)
    ; TT(Vars)

    ; else 
        ; TT(Clipboard,900,Varbar_x,80,2,175,"R")
  return 


  }

IfNothingSelected(Action){
  global
    ClipboardSaved:=ClipboardAll
    clipboard:=
    ; sleep 20
    Send, ^c
      clipwait,0.40
  if errorlevel ;if nothing selected
  {
    if Action:="SelectLine"
      Send, {home}+{end}^{c}
    if Action:="SelectAll"
      Send, ^{a}^{c}{ctrlup}
    if Action:="Select"
      Send, {click 3}^{c}{ctrlup}
    If Action:="cut"
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
    if Action:="menu"
      menu.Variable()
    If Action:="Paste"
    {
      clipboard:=ClipboardSaved
      Send, ^{v}{ctrlup}
    }
    else
      send % Action
    return
  }
  else 
  return
}

; Click(){
;     global
;   MouseGetPos, xx
;   TimeButtonDown = %A_TickCount%
;   ; Wait for it to be released
;   Loop
;   {
;     Sleep 10
;     GetKeyState, LButtonState, LButton, P
;     if LButtonState = U  ; Button has been released.
;     {
;         If WinActive("Crimson Editor") and (xx < 25) ; Single Click in the Selection Area of CE
;         {
;           ;  clip()
;           Send, ^{c}
;           return
;         }
;         break
;     }
;     elapsed = %A_TickCount%
;     elapsed -= %TimeButtonDown%
;     if elapsed > 200  ; Button was held down too long, so assume it's not a double-click.
;     {
;         MouseGetPos x0, y0            ; save start mouse position
;         Loop
;     {
;       Sleep 20                    ; yield time to others
;       GetKeyState keystate, LButton
;       IfEqual keystate, U, {
;         MouseGetPos x, y          ; position when button released
;         break
;       }
;     }
;     if (x-x0 > 5 or x-x0 < -5 or y-y0 > 5 or y-y0 < -5)
;     {                             ; mouse has moved
;         clip0 := ClipBoardAll      ; save old clipboard
;         ClipBoard =
;         ; Clip()                   ; selection -> clipboard
;         Send, {ctrldown}{c}{ctrlup}
;         ClipWait 1, 1              ; restore clipboard if no data
;         IfEqual ClipBoard,, SetEnv ClipBoard, %clip0%
;     }
;         return
;     }
;   }
;   ; Otherwise, button was released quickly enough.  Wait to see if it's a double-click:
;   TimeButtonUp = %A_TickCount%
;   Loop
;   {
;     Sleep 10
;     GetKeyState, LButtonState, LButton, P
;     if LButtonState = D  ; Button has been pressed down again.
;         break
;     elapsed = %A_TickCount%
;     elapsed -= %TimeButtonUp%
;     if elapsed > 350  ; No click has occurred within the allowed time, so assume it's not a double-click.
;         return
;   }
;   ;Button pressed down again, it's at least a double-click
;   TimeButtonUp2 = %A_TickCount%
;   Loop
;   {
;     Sleep 10
;     GetKeyState, LButtonState2, LButton, P
;     if LButtonState2 = U  ; Button has been released a 2nd time, let's see if it's a tripple-click.
;         break
;   }
;   ;Button released a 2nd time
;   TimeButtonUp3 = %A_TickCount%
;   Loop
;   {
;     Sleep 10
;     GetKeyState, LButtonState3, LButton, P
;     if LButtonState3 = D  ; Button has been pressed down a 3rd time.
;         break
;     elapsed = %A_TickCount%
;     elapsed -= %TimeButtonUp%
;     if elapsed > 350  ; No click has occurred within the allowed time, so assume it's not a tripple-click.
;     {  ;Double-click
;         Send, {ctrldown}{c}{ctrlup}
;         ; clip()
;         return
;     }
;   }
;   ;Tripple-click:
;     Sleep, 100
;     Send, {ctrldown}{a}{ctrlup}
;     sleep 100
;     Send, {ctrldown}{c}{ctrlup}
;     ;  clip()
;   return
    
;     return
;   }



ClickText(button:=""){
	mousegetpos, mousex, mousey
	SetDefaultMouseSpeed, 0
	Click, %A_CaretX% %A_caretY%, %button%
	mousemove, %mousex%, %mousey%, 0
	SetDefaultMouseSpeed, 1
}

; Paste(){
;   global Clippaste, varbar_x, Varbar_y
;     if (ClipPaste = 1){
;       Send, {ctrldown}{v}{ctrlup}
;       return
;   }
;   ClipboardSaved:=ClipboardAll
;   clipboard:=
;     Clip()
;   clipwait,0.10
;   if errorlevel 
;     {
;     clipboard:=ClipboardSaved
;      StrReplace(clipboard, "`n", "")
;       Send, {ctrldown}{v}{ctrlup}
;       ;tt("paste",,100,100,,150)
;     }
;   else
;       ; tt(clipboard,,varbar_x,varbar_y,,50)
;       sleep 500
;     return 
;   }


Copy(){
  Global
    preclip:=Clipboardall
      Send, {ctrlup}{altup}{shiftup}
    KeyWait, F19, T0.20
    If ErrorLevel
    {
        KeyWait, F19, T0.65
        if (A_PriorKey!="F19") ;allows for other key combos
          exit
        if (A_PriorKey="F19") {  
        If !ErrorLevel
        {
          This.Copy("cut") ; will trigger less 1 secReturnReturnErrorLevel ClipChainPasteDoubleClickClipChainPasteDoubleClick
          Return
        }
        Else ;will trigger after 1 sec
          Send, {F22}
          ; KeyWait, F21,
          Return
      }
    }
    clipboard:=
    Send, ^{c}
    clipwait, 0.75
    if errorlevel {
      clipboard:=Preclip
      return
    }
    TT(Clipboard)
    clip.Regex()

      return
  }


Paste(){
global Clippaste
    if (ClipPaste) {
      Send, ^{v}
      return
  }
    KeyWait, F19, T0.30
    If ErrorLevel
    {
        KeyWait, F19, T2
        if (A_PriorKey!="F19")
          exit
        if (A_PriorKey="F19")
        If !ErrorLevel
        {
          ; Send, {F21}
          Return
        }
          KeyWait, F19, T2
          Return
      }
    if Errorlevel = 0
    KeyWait, F19, T0.60
      if !ErrorLevel
      {
        If (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<400) ;if double clic
            send % BlockRepeat(300) "^{v}"
            ; wheel_paste()
          Else
          Clip.Append()
            return
      }
      return
    }
ctrl(){
  Global clippaste
      if (ClipPaste = 1){
        Send, {ctrldown}{v}{ctrlup}
        return
      }
    KeyWait, F19, T0.30
    If ErrorLevel
    {
        KeyWait, F19, T2
        if (A_PriorKey!="F19")
          exit
        if (A_PriorKey="F19")
        If !ErrorLevel
        {
          ; Send, {F21}
          Return
        }
          KeyWait, F19, T4
          Return
      }
    if Errorlevel = 0
    KeyWait, F19, T0.60
      if !ErrorLevel
      {
        If (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<400) ;if double clic
          send % BlockRepeat(300) "^{v}"
            ; wheel_paste()
          Else
            return
      }
            ; Send, 
      return
    }
}