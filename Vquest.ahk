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

CheckExcelRow: ;goes down a lms search and fills out a excel table depending on a pixel search
  LMSwb:=ComObjActive("Excel.Application")
loop 8 {
  clipboard:=
  send, ^c
  clipwait, 1
  sleep 200
  send, {down}
  RT:=lmswb.ActiveSheet.Range("A:A").Find(Product).offset(0,4)
  Status:=lmswb.ActiveSheet.Range("A:A").Find(Product).offset(0,3)
  if IsPixel(1203, 899,"F3EFEA")
      RT.Value:=""
    else
      RT.Value:="RT"
    sleep 400
    ; }
    ; if (A_thisHotkey="Right") 
    ; else if (A_thisHotkey="Left")
    }
  return
  CopyProductRotation:
    clipboard:=
    send, ^c
    clipwait, 1
    sleep 400
    filename:= "C:\Users\mmignin\Documents\VQuest\Rotations\" Product ".txt"
    FileDelete, %FileName%
    FileAppend, %Clipboard%, %Filename%
    LMSwb:=ComObjActive("Excel.Application")
    Rotation:=lmswb.ActiveSheet.Range("A:A").Find(Product).offset(0,5)
    Rotation.Value:=Product ".txt"
    ; iniwrite %Clipboard%, data.ini, Rotations, %Product%
    return  
  PasteProductRotation:
    filename:= "C:\Users\mmignin\Documents\VQuest\Rotations\" Product ".txt"
    FileRead, Clipboard, %Filename%
    ; iniread Clipboard,data.ini, Rotations, %Product%
    LMSwb:=ComObjActive("Excel.Application")
    RotationDone:=lmswb.ActiveSheet.Range("A:A").Find(Product).offset(0,6)
    RotationDone.Value:="1"
    sleep 200
    send, ^v
    return

isPixel(X,Y,SearchColor){
  MouseGetPos, mX, mY
  ; if x:="mX" || y:="mY"
    PixelGetColor, MouseColor, %mX%, %mY%
  ; else
    PixelGetColor, FoundColor, %X%, %Y%
    ; Yellow = FFD353
    ; White = FFFFFF
    ; Light Blue = EAEFF3
  if FoundColor contains %SearchColor%
    ; Pop("Match",SearchColor,4000)
    return "Match"
  else
    Pop(MouseColor)
    ; return MouseColor
  return
}


#If Winactive("Book") && TempCode
  F15::
  F21::gosub, CopyProductRotation

#If Winactive("Edit specification - \\Remote") && TempCode
  mbutton::send, {click 332, 621} ;click okay 
#If Winactive("Select methods tests - \\Remote") && TempCode


#If Winactive("Results Definition - \\Remote") && TempCode
    Mbutton::send, {enter}
    rbutton::menu.lms()
    ; Lbutton::
#If mouseisover("NuGenesis LMS - \\Remote") && TempCode
  Mbutton:: gosub, NewVersionRAE
  ; NumLock::gosub, AddRAE ;Send, {Click 83, 560} ; click edit method
  ; F20::gosub, CheckExcelRow
  ; F15::gosub, CheckExcelRow
    return
#If TempCode
  F15::GoSub, PasteProductRotation
  numlock::Gosub, CopyProductRotation
      return
#if

;;   __________Testing Zone


  Test_3:
ProductTab.AddCOASpace()
  return


return
test_1:  

return




menu.ProductSelection()

return






 Test_4:
 
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




 
 
 
 












  ; makeADropDown(inifile,Category) {
    try menu, DropdownMenu, destroyall
  ;   Loop, Read, %inifile% ;lib\customers.ini
  ;   {
  ;   If A_Index = 1
  ;     Continue
  ;   ParseList := StrSplit(A_LoopReadLine, "=")
  ;     ; MethodGroup := StrSplit(A_LoopReadLine, "|") ;for a 2nd split
  ;   Selection:= % ParseList[1]
  ;     ; Group:= % MethodGroup[2] ;for a second split
  ;   Menu, Dropdownmenu, add, %Selection%, DropDownhandler
  ;   }
  ;   Menu, DropdownMenu, Show,
  ;   return

  ;   DropDownhandler:
  ;     InputVar:=A_ThisMenuItem
  ;     IniRead,vOutput, %inifile%, %Category%, %InputVar%
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
  #include <Functions>
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