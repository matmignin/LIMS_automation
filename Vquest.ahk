    #Persistent
    #NoEnv
    #SingleInstance,Force
    #KeyHistory 300
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
    CoordMode, mouse, Window
    SetMouseDelay, 1
    SetDefaultMouseSpeed, 1
    SetTitleMatchMode, 2
gosub, vquest_start




Starting_test:

  ;   Products:=[] ;;  add ini data to product array  
  ; iniread VimClip,data.ini, SavedVariables, VimClip 
  ; Iniread, Product,  data.ini, Products, Product
  ; Iniread, Product1, data.ini, Products, Product1
  ; Iniread, Product2, data.ini, Products, Product2
  ; Iniread, Product3, data.ini, Products, Product3
  ; Iniread, Product4, data.ini, Products, Product4
  ;         ; Products.Insert(Product)
  ;         Products.Insert(Product1)
  ;         Products.Insert(Product2)
  ;         Products.Insert(Product3)
  ;         Products.Insert(Product4)
  return



ActiveCheck: ;continuously runing sub
  ; If MouseIsOver("VarBar ahk_exe AutoHotkey.exe") && !Winactive("ahk_exe WFICA32.EXE")
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
  return
   
;;  Test


Test_4:
LMS.detecttab()
Pop(Tab)
  return



GetSampleInfo(){
  global Customer, Name, ShipToIndex
	ParsedSample:=[]
  ; clipboard:=
  ; send, ^c 
  ; clipwait, 2
    ; if errorlevel
      ; sleep 400
  Loop, parse, Clipboard, `t
  ParsedSample.insert(A_LoopField)
  TotalColumns:=Parsedsample.maxindex()//2
  
  Customer:=ParsedSample[HasValue(ParsedSample, "Ship To") + TotalColumns]
  Name:=ParsedSample[HasValue(ParsedSample, "Product Trade Name") + TotalColumns]
  IniRead,ShipToIndex, Customers.ini, Customers, %Customer%
  ; if !ShipTo
    ; ShipTo:=ShipToIndex
  return ShiptoIndex
}




DropDown() {
	Loop, Read, Customers.ini
	{
	If A_Index = 1
		Continue
	Method := StrSplit(A_LoopReadLine, "=")
	  ; MethodGroup := StrSplit(A_LoopReadLine, "|") ;for a 2nd split
	Selection:= % Method[1]
    ; Group:= % MethodGroup[2] ;for a second split
	Menu, Methodmenu, add, %Selection%, DropDown
	}
	Menu, MethodMenu, Show,
	return

	DropDown:
		InputVar:=A_ThisMenuItem
		IniRead,vOutput, Customers.ini, Customers, %InputVar%
		Pop(Inputvar,vOutput)
		return
}









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












#IfWinActive,
  #Include <Test>
  #include <VIM>
  #include <HotStrings>
  #Include <OFFICE>
  #include <KEYS>
  #include <PAD>
  #Include <clip>
  #Include <OpenApp>
  #Include <LMS>
  #Include <Snipper>
  #Include <AutoFill>
  #include <varBar>
  #include <ProductTab>
  #include <WorkTab>
  #include <SpecTab>
  #include <menu>
  #include <Rotation>
  #include <Excel>
  #include <vis2>
  #include <Support Functions>
#Include C:\Users\mmignin\Documents\VQuest\lib\DebugVars\TreeListView.ahk


VQuest_Start:
    #WinActivateForce
    AutoTrim, On
    OnClipboardChange("clipclip")
    OnExit("Varbar.Exit")
    CrLf=`r`n
    FileName:="lib/WinPos.txt"
    envget, PrevProduct, PrevProduct
    SetWorkingDir, %A_ScriptDir%
    Iniread, Iteration, data.ini, SavedVariables, Iteration
    Iniread, SwitchWorkSheets, data.ini, Options, SwitchWorkSheets
    Iniread, EnteringRotations, data.ini, Options, EnteringRotations
    Iniread, VarBar_X, data.ini, Locations, VarBar_X
    Iniread, VarBar_Y, data.ini, Locations, Varbar_Y
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
    else
      EnteringRotations:=
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
    SetNumlockState Alwayson
    setcapslockstate alwaysoff
    SetscrolllockState, alwaysOff
    try Run, cl3.Ahk, lib\CL3

    try Menu, Tray, Icon, lib\Robot.ico
    settimer, ActiveCheck, %CheckTime%
    CopyPasteToggle=0
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

    Send, {ctrlup}{altup}{shiftup}{lwinup}
    gosub, Starting_test
    #IfWinActive,