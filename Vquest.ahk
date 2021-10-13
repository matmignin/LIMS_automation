    #Persistent
    #NoEnv
    #SingleInstance,Force
    #KeyHistory 
    #MenuMaskKey vkE8
    #InstallKeybdHook
    #InstallMouseHook
    CheckTime:=500
    ; #HotkeyInterval 50
    #MaxHotkeysPerInterval 500
    #MaxThreadsBuffer, On
    #InstallKeybdHook
    #InstallMouseHook
    ; #HotkeyModifierTimeout 1
    #maxthreadsperhotkey, 1
    SetBatchLines, 20ms
    SetControlDelay, 1
    SetKeyDelay, 1, 0.25
    setwindelay, 250
    FormatTime, DayString,, MM/d/yy
    FormatTime, TimeString, R
    FormatTime, CurrentDateTime,, MM/dd/yy
    SetNumLockState, on
    SetscrolllockState, off
    SetNumlockState Alwayson
    setcapslockstate alwaysoff
    ; SetscrolllockState, always
    CoordMode, mouse, Window
    SetMouseDelay, 1
    SetDefaultMouseSpeed, 1
    SetTitleMatchMode, 2


gosub, vquest_start

Starting_test:

; TestText:=
; (
; "IF Fast Pwdr Raspb Lemonade 3.1g Stick`tK741`t107-0431`tSlimFast`t0278H1`tMicro`t`t`t107-0431 0278H1| Micro  [Oct-08]`r`nFish Oil 100 SIGMANU124 100's Unlabeled 1:35 PM`tB324`t105-1172`tVitalize llc`t0656H1`tMicro`t`t`t105-1172 0656H1| Micro  [Oct-08]`r`n
; K277 `r`
; J929	910-0128	Renew Life	Micro	 `r`n
; J837	109-0445	Renew Life	0670I1	Micro	 `r`n
; H259	109-0359	SlimFast	0555I1/Ct#109-0744	Micro	`r`n
; K888	108-0888	Santegra ,Inc	0888A8/Ct#188-0688	DT `r`n
; B086	108-0752	Santegra ,Inc	Bulk/Ct#109-0635	Micro `r`n"
; )
; gosub, Test_3
return


___Testing_Zone:
F19 & down::GetAllBatches()
F19 & left::GetAllProducts()
F19 & Up::Sendinput % excel.GetAllSheets()

  Test_3:
  GetAllBatches()
  ; Send, %AllBatches%
  return



GetAllBatches(){
  global
  regBatches:=[]
  pos=0
  while pos := RegexMatch(Clipboard, "i)\b\d{3}-\d{4}\b", aBatch, pos+1) ; {
    ; if aBatch
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
    AllBatches:= StrReplace(AllBatches, A_space A_space, A_space)
    GuiControl,Varbar:Text, Note3, %AllBatches%
    ; ControlsetText, Edit8,%AllBatches%,VarBar
		IniWrite, %AllBatches%, data.ini, Notes, note3
    Sendinput, %AllBatches%
    ; msgbox, %AllBatches%,
}
GetAllProducts(){
  global
  regProducts:=[]
  pos=0
  while pos := RegexMatch(Clipboard, "i)[abdefghijkl]\d{3}\b", aProduct, pos+1) ; {
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
    AllProducts:= StrReplace(AllProducts, A_space A_space, A_space)
    GuiControl,Varbar:Text, Note2, %AllProducts%
    ; ControlsetText, Edit7,%AllProducts%,VarBar
    IniWrite, %AllProducts%, data.ini, Notes, note2
    Send, %AllProducts%

    ; msgbox, %AllProducts%,
}


return
test_1:  ; tested if the 2nd function workd
  regProducts:=[], regBatches:=[]
      ; Products := [], 
  ; TestText:=Clipboard
  pos=0
  while pos := RegexMatch(Clipboard, "i)(?P<Product>[abdefghijkl]\d{3}\b)(\s(?P<Batch>(?<!Ct#)\d{3}-\d{4}\b))?", var, pos+1){
    if Var
      regProducts.insert(varProduct " " varBatch)
    if VarBatch
      regBatches.insert(varBatch)
    ; If VarProduct
      ; regProducts.insert(varProduct)
  }
  ; while pos := RegexMatch(TestText, "i)(?P<Product>[abdefghijkl]\d{3}\b)|(?P<Batch>(?<!Ct#)\d{3}-\d{4}\b)", var, pos+1){
  ;   if VarBatch
  ;     regBatches.insert(varBatch)
  ;   If VarProduct
  ;     regProducts.insert(varProduct)
  ; }
                  ; result .= (A_Index = 1 ? "" : "`r`n") var
      ; Products := [] 
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
        Batches:=[], oTemp := {}
      for vKey, vValue in regBatches
      {
          if (ObjGetCapacity([vValue], 1) = "") ;is numeric
          {
              if !ObjHasKey(oTemp, vValue+0)
                  Batches.Push(vValue+0), oTemp[vValue+0] := ""
          }
          else
          {
              if !ObjHasKey(oTemp, "" vValue)
                  Batches.Push("" vValue), oTemp["" vValue] := ""
          }
        }

      ; vOutput := ""
      ; for vKey, vValue in Batches
      ;     vOutput .= vKey " " vValue "`r`n"
      ; MsgBox, % vOutput
  
    return
  ;MsgBox, % result

  ; Clipboard := result
  ;send ^v
  ; Sleep 500

  ; Gui, Add, Edit, x12 y10 w400 h170
  ; Gui, Show, h190 w420, Batch EXTRACTOR

  ; Sleep,500
  ; Control, EditPaste, %Clipboard%, Edit1, A
  ; Clipboard :=
  ; result :=

return


Capslock::
#t::  
Test_2:
; clip.Parse()

  ;MsgBox, %
menu.ProductSelection()
            
  ; debug(Products)
return






  Test_4:
  LMS.detecttab()
  Pop(Tab)
    return

Debug(Variable,Delete:="Delete"){
  if IsObject(Variable) 
    DebugText:=listarray(Variable)
  else 
    DebugText:=Variable
  if Delete=Delete
    filedelete, C:\Users\mmignin\Documents\VQuest\debug.txt
  sleep 200
  fileAppend %Debugtext%, C:\Users\mmignin\Documents\VQuest\debug.txt
}

  ; GetSampleInfo(){
  ;   global Customer, Name, ShipToIndex
  ;   ParsedSample:=[]
  ;   ; clipboard:=
  ;   ; send, ^c 
  ;   ; clipwait, 2
  ;     ; if errorlevel
  ;       ; sleep 400
  ;   Loop, parse, Clipboard, `t
  ;   ParsedSample.insert(A_LoopField)
  ;   TotalColumns:=Parsedsample.maxindex()//2
    
  ;   Customer:=ParsedSample[HasValue(ParsedSample, "Ship To") + TotalColumns]
  ;   Name:=ParsedSample[HasValue(ParsedSample, "Product Trade Name") + TotalColumns]
  ;   IniRead,ShipToIndex, lib\customers.ini, Customers, %Customer%
  ;   ; if !ShipTo
  ;     ; ShipTo:=ShipToIndex
  ;   return ShiptoIndex
  ; }




  ; DropDown() {
  ;   Loop, Read, lib\customers.ini
  ;   {
  ;   If A_Index = 1
  ;     Continue
  ;   Method := StrSplit(A_LoopReadLine, "=")
  ;     ; MethodGroup := StrSplit(A_LoopReadLine, "|") ;for a 2nd split
  ;   Selection:= % Method[1]
  ;     ; Group:= % MethodGroup[2] ;for a second split
  ;   Menu, Methodmenu, add, %Selection%, DropDown
  ;   }
  ;   Menu, MethodMenu, Show,
  ;   return

  ;   DropDown:
  ;     InputVar:=A_ThisMenuItem
  ;     IniRead,vOutput, lib\customers.ini, Customers, %InputVar%
  ;     Pop(Inputvar,vOutput)
  ;     return
  ; }









  ; CreateArray(){ ;;     creating an array and resorting without duplicates
	 ;Products := ["a","B","c","A","B","C",1,1.0,"1","1.0"]
	; 		Batches:= StrSplit(A_LoopReadLine, "`n") 
	; Products2 := [], oTemp := {}
	; for vKey, vValue in Products
	; {
	; 	if (ObjGetCapacity([vValue], 1) = "") ;is numeric
	; 	{
	; 		if !ObjHasKey(oTemp, vValue+0)
	; 			Products2.Push(vValue+0), oTemp[vValue+0] := ""
	; 	}
	; 	else
	; 	{
	; 		if !ObjHasKey(oTemp, "" vValue)
	; 			Products2.Push("" vValue), oTemp["" vValue] := ""
	; 	}  
	; }
	; vOutput := ""
	; for vKey, vValue in Products2
	; 	vOutput .= vKey " " vValue "`r`n"
	; MsgBox, % vOutput
	; return



;__________________continuously runing sub_________________________________________________
ActiveCheck: 
  If (MouseIsOver("VarBar ahk_exe AutoHotkey.exe") && Varbar_H!=63 ){
    VarBar_H:=63
    WinMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%VarBar_H%
  }
  If !(MouseIsOver("VarBar ahk_exe AutoHotkey.exe") && Varbar_H!=32 ){
    VarBar_H:=32
    WinMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%VarBar_H%
  }

    
    ; Fade(200) ;;  Fade Varbar on hover
  ; if winactive("Reason For Change - \\Remote") {
    ; menu.reasons()
    ; WinWaitNotActive, Reason For Change - \\Remote,, 10
    ; }
    If Winactive("Result Entry - \\Remote") || WinActive("Register new samples - \\Remote")
      varbar.FloatAtopWindow()
  if WinExist("Error - \\Remote") {
    ControlSend,, {enter}, Error - \\Remote
    sleep 200
    if WinExist("Register new samples - \\Remote")
      winactivate,
        LMS.SearchBar(Product,"{enter}")
  }
  if (A_TimeIdle < 9000) {
    try Menu,Menu, deleteAll
    setwindelay, 200
  }
  return
   






  #Include <Test>
  #include <VIM>
  #include <HotStrings>
  #Include <OFFICE>
  #include <KEYS>
  #include <PAD>
  #Include <LMS>
  #Include <clip>
  #Include <OpenApp>
  #include <Excel>
  ; #Include <Snipper>
  ;#Include <AutoFill>
  #include <varBar>
  ; #include <ProductTab>
  ; #include <WorkTab>
  ; #include <SpecTab>
  #include <menu>
  #include <Rotation>
  #include <Vis2>
  #include <Support Functions>
;#Include C:\Users\mmignin\Documents\VQuest\lib\DebugVars\TreeListView.ahk



VQuest_Start:
#WinActivateForce
    AutoTrim, On
    OnClipboardChange("clipclip")
    OnExit("Varbar.Exit")
    CrLf=`r`n
    FileName:="lib/WinPos.txt"
    SetWorkingDir, %A_ScriptDir%
    Iniread, Iteration, data.ini, SavedVariables, Iteration
    Iniread, SwitchWorkSheets, data.ini, Options, SwitchWorkSheets
    Iniread, EnteringRotations, data.ini, Options, EnteringRotations
    Iniread, VarBar_X, data.ini, Locations, VarBar_X
    Iniread, VarBar_Y, data.ini, Locations, Varbar_Y
    if !VarBar_x
      VarBar_x=1
    if !VarBar_y
      VarBar_y=1
    Menu, Tray, Add, Exit, ExitSub
    Menu, Tray, Add, CL3, CL3
    Menu, Tray, Add, DebugVars, DebugVars
    Menu, Tray, Add, Pause, Pause
    
    Menu, Tray, Add, EnteringRotations, EnteringRotations
    Menu, Tray, Add, SwitchWorkSheets, SwitchWorkSheets
    if (EnteringRotations = 1){
      Menu, Tray, Check, EnteringRotations
      EnteringRotations:=1
    }
    else {
      Menu, Tray, UnCheck, EnteringRotations
      EnteringRotations:=
    }
    if (SwitchWorkSheets = 1){
      Menu, Tray, Check, SwitchWorkSheets
      SwitchWorkSheets:=1
      SwitchSpaces:=
    } 
    else 
    {
      Menu, Tray, unCheck, SwitchWorkSheets
      SwitchSpaces:=1
      SwitchWorkSheets:=
    }
    menu, tray, add, ShowSampleID, showSampleID
    ; menu, tray, add, ShowNotes, ShowNotes
    menu, tray, add, NoIdle, NoIdle
    Menu, tray, NoStandard
    Menu, Tray, Add, KeyHistory, KeyHistory
    Menu, Tray, Add, Exit, ExitSub
    Menu, Tray, Add, windowSpy, WindowSpy
    Menu, Tray, Default, DebugVars

    Run, cl3.Ahk, lib\CL3


    try Menu, Tray, Icon, lib\Robot.ico
    settimer, ActiveCheck, %CheckTime%
    copypasteToggle:=0
    TabToggle=0
    On:="On"
    Off:="Off"
    Clear:="Clear"
    yo:="yo"
    ye:="ye"
    Blank:=" `n `n  `t `t `n`t "
    CurrentWindow:=A
    IfWinExist, ahk_exe WFICA32.EXE
    LMS.Orient()
    if (ShowSampleID = 1)
      Menu, Tray, Check, showsampleID
    else {
      Menu, Tray, unCheck, showsampleID
      showsampleID:=
      }
    Excel.Connect(1)
    varbar.Show()




    ; if (Keyboard:="Bluetooth" ? Keyboard:="F19" : Keyboard:="F20")
; Run, Bluetooth Keyboard.Ahk, C:\Program Files\AutoHotkey\lib
    gosub, Starting_test

    #IfWinActive,