    gosub, vquest_start 
Starting_test:


return
SelectHeavyMetalTest:
  send {click 225, 70}{click}icp-ms (chem{enter}
  sleep 200
  send, {click 506, 339}{click 846, 657} ;click it over
  return

AddRAE:
  Send, {Click 58, 757} ; click Edit Results  "NuGenesis LMS - \\Remote"
  sleep 200
  send, {click 80, 66} ; Click edit Results  "Definition - \\Remote"
  sleep 600
  send, {tab 5}mcg%A_space%rae{click 505, 568}{click 464, 547} ; tab to units and select mcg rae 284, 197 ;click scrollbar then Requirement window "Result Editor - \\Remote"
  send, {end}%a_space%RAE
  sleep 200
  send, {click 377, 649} ;click done
  return
NewVersionRAE:
  send, {click 64, 243} ;click new version
  sleep 400
  sendinput, {click 429, 184}^{a}Update All Vitamin A Units with RAE ;click description "Edit specification - \\Remote"
    return	

#If Winactive("Edit specification - \\Remote") && TempCode
  mbutton::send, {click 332, 621} ;click okay 
#If Winactive("Select methods tests - \\Remote") && TempCode


#If Winactive("Results Definition - \\Remote") && TempCode
    Mbutton::send, {enter}
    rbutton::menu.lms()
    ; Lbutton::
#If mouseisover("NuGenesis LMS - \\Remote") && TempCode
  Mbutton:: gosub, NewVersionRAE
  NumLock::gosub, AddRAE ;Send, {Click 83, 560} ; click edit method
    return
#if

;;   __________Testing Zone


  Test_3:
ProductTab.AddCOASpace()
  return


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


return


Capslock::
#t::
Test_2:
menu.ProductSelection()

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

    If Winactive("Result Entry - \\Remote") || WinActive("Register new samples - \\Remote")
      varbar.FloatAtopWindow()
    if WinExist("Error - \\Remote") {
      ControlSend,, {enter}, Error - \\Remote
      sleep 200
      if WinExist("Register new samples - \\Remote")
        winactivate,
          LMS.SearchBar(Product,"{enter}")
    }
  if WinActive("Information - \\Remote")
    send, {enter}
  ; if (A_TimeIdlePhysical > 6000){
  ;   try Menu,Menu, deleteAll
  ;   sendlevel 2
  ;   send, {ctrl up}{alt up}{lwin up}
  ;   sendlevel 0
  ;   setwindelay, 200
  ;   SetCapsLockState, off
  ; }
  return
   






  #Include <Test>
  #include <VIM>
  #include <HotStrings>
  #include <KEYS>
  #include <PAD>
  #Include <LMS>
  #Include <clip>
  #Include <OpenApp>
  #include <Excel>
  #include <varBar>
  #include <menu>
  #include <Rotation>
  #include <Vis2>
  #include <Support Functions>
;#Include C:\Users\mmignin\Documents\VQuest\lib\DebugVars\TreeListView.ahk



VQuest_Start:
    #Persistent
    #NoEnv
    #SingleInstance,Force
    #KeyHistory 300
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
    #WinActivateForce
    AutoTrim, On
    OnClipboardChange("clipclip")
    OnExit("Varbar.SaveVariables")
    CrLf=`r`n
    FileName:="lib/WinPos.txt"
    SetWorkingDir, %A_ScriptDir%
    Iniread, Iteration, data.ini, SavedVariables, Iteration

    if !VarBar_x
      VarBar_x=1
    if !VarBar_y
      VarBar_y=1
    Menu, Tray, Add, Exit, ExitSub
    Menu, Tray, Add, CL3, CL3
    Menu, Tray, Add, DebugVars, DebugVars
    Menu, Tray, Add, Pause, Pause
    
  
  Iniread, EnteringRotations, data.ini, Options, EnteringRotations
    Menu, Tray, Add, EnteringRotations, EnteringRotations
    if (EnteringRotations = 1){
      Menu, Tray, Check, EnteringRotations
      EnteringRotations:=1
    }
    else {
      Menu, Tray, UnCheck, EnteringRotations
      EnteringRotations:=
    }

  Iniread, TempCode, data.ini, Options, TempCode
    Menu, Tray, Add, TempCode, TempCode
    if (TempCode = 1){
      Menu, Tray, Check, TempCode
      TempCode:=1
    }
    else {
      Menu, Tray, UnCheck, TempCode
      TempCode:=
    }
  
  
  
  Iniread, SwitchWorkSheets, data.ini, Options, SwitchWorkSheets
    Menu, Tray, Add, SwitchWorkSheets, SwitchWorkSheets
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
    ; menu, tray, add, NoIdle, NoIdle
    Menu, tray, NoStandard
    Menu, Tray, Add, KeyHistory, KeyHistory
    Menu, Tray, Add, Exit, ExitSub
    Menu, Tray, Add, windowSpy, WindowSpy
    Menu, Tray, Default, DebugVars

    Run, cl3.Ahk, lib\CL3

    varbar.Show()

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




    ; if (Keyboard:="Bluetooth" ? Keyboard:="F19" : Keyboard:="F20")
; Run, Bluetooth Keyboard.Ahk, C:\Program Files\AutoHotkey\lib
    gosub, Starting_test

    #IfWinActive,