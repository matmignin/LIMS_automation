
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

; tests to start with
return

; BlockRepeatTimer:
;   if (A_TimeSincePriorHotkey > 2000)
;     exit
; msgbox, %NN%  `n A_thisHotkey  %A_thisHotkey%  `n A_priorhotkey %A_priorhotkey%  `n A_priorkey %A_priorkey% `n A_TimeSincePriorHotkey %A_TimeSincePriorHotkey%
; return

___Testing_Zone:



;; tripple press C
    F19:: 
      if (winc_presses > 0) ; SetTimer already started, so we log the keypress instead.
      {
          winc_presses += 1
          return
      }
      ; Otherwise, this is the first press of a new series. Set count to 1 and start
      ; the timer:
      winc_presses := 1
      SetTimer, KeyAltC, -200 ; Wait for more presses within a 400 millisecond window.
      return
    KeyAltC:
      if (winc_presses = 1) ; The key was pressed once.
      {
          Clip.Copy()
      }
      else if (winc_presses = 2) ; The key was pressed twice.
      {
          clip.Append()  
          ; Pop(Clipboard)
        ; sleep 300 ; Open a different folder.
      }
      else if (winc_presses > 2)
      {
          clip.Append("`n","{x}")
          ; Pop(Clipboard)
      }
      ; Regardless of which action above was triggered, reset the count to
      ; prepare for the next series of presses:
    winc_presses := 0
    return

;; Tripple Press !v
    ~F21::
      if (winc_presses > 0) ; SetTimer already started, so we log the keypress instead.
      {
          winc_presses += 1
          return
      }
      ; Otherwise, this is the first press of a new series. Set count to 1 and start
      ; the timer:
      winc_presses := 1
      SetTimer, KeyAltV, -400 ; Wait for more presses within a 400 millisecond window.
      return

    KeyAltV:
      if (winc_presses = 1) ; The key was pressed once.
      {
          send, ^{v}
      }
      else if (winc_presses = 2) ; The key was pressed twice.
      {
          send, #v 
          ; Pop(Clipboard)
        ; sleep 300 ; Open a different folder.
      }
      else if (winc_presses > 2)
      {
          clip.Append(A_Space)
          ; Pop(Clipboard)
      }
      ; Regardless of which action above was triggered, reset the count to
      ; prepare for the next series of presses:
    winc_presses := 0
    return

  test_1:  ; tested if the 2nd function workd
    send % "lll"    
    IfKeyPressed("k","uuuuuu")
    pop("yo:")
  return


  

  Test_2:
  WinMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,60
  return

  Test_3:

  WinGetTitle, CurrentLMSWindow, ahk_exe WFICA32.EXE
  ; Pop(SubStr(CurrentLMSWindow, 1, 20))
  winactivate, ahk_exe Code.exe
    send, ^{f}
    sleep 200
    sendinput % SubStr(CurrentLMSWindow, 1, 25)
    return


  Test_4:
  LMS.detecttab()
  Pop(Tab)
    return



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
  ;   IniRead,ShipToIndex, Customers.ini, Customers, %Customer%
  ;   ; if !ShipTo
  ;     ; ShipTo:=ShipToIndex
  ;   return ShiptoIndex
  ; }




  ; DropDown() {
  ;   Loop, Read, Customers.ini
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
  ;     IniRead,vOutput, Customers.ini, Customers, %InputVar%
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
    ; GuiControl, Varbar:Show, CurrentCodes
    VarBar_H:=63
    WinMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%VarBar_H%
  }
  If !(MouseIsOver("VarBar ahk_exe AutoHotkey.exe") && Varbar_H!=32 ){
    VarBar_H:=32
    ; GuiControl, Varbar:Hide, CurrentCodes
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
  if (A_TimeIdle < 9000)
    setwindelay, 200
  return
   






  #Include <Test>
  #include <VIM>
  #include <HotStrings>
  #Include <OFFICE>
  #include <KEYS>
  #include <PAD>
  #Include <clip>
  #Include <OpenApp>
  #Include <LMS>
  #include <Excel>
  #Include <Snipper>
  ;#Include <AutoFill>
  #include <varBar>
  #include <ProductTab>
  #include <WorkTab>
  #include <SpecTab>
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
    envget, PrevProduct, PrevProduct
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