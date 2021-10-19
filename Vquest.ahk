
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
    SetscrolllockState, alwaysoff
    CoordMode, mouse, Window
    SetMouseDelay, 1
    SetDefaultMouseSpeed, 1
    SetTitleMatchMode, 2
    #WinActivateForce
    AutoTrim, On
    OnClipboardChange("clipChange")
    OnExit("Varbar.SaveVariables")
    CrLf=`r`n
    FileName:="lib/WinPos.txt"
    SetWorkingDir, %A_ScriptDir%
    Iniread, Iteration, data.ini, SavedVariables, Iteration
    ; Products:=[]
    ; FileRead, CurrentCodes, lib\Data\CurrentCodes.txt
      ; Products := StrSplit(CurrentCodes,"`r`n")
    if !VarBar_x
      VarBar_x=1
    if !VarBar_y
      VarBar_y=1
    ; Menu, Tray, Add, CL3, CL3
    Menu, Tray, Add, DebugVars, DebugVars
    Menu, Tray, Add, Pause, Pause
    Menu, Tray, Add, Exit, ExitSub
    menu, tray, add, ShowSampleID, showSampleID
    Menu, tray, NoStandard
    Menu, Tray, Add, KeyHistory, KeyHistory
    Menu, Tray, Add, Exit, ExitSub
    Menu, Tray, Add, windowSpy, WindowSpy
    Menu, Tray, Default, DebugVars
    
MenuCheckboxes:
  Iniread, EnteringRotationsStatus, data.ini, Options, EnteringRotations
    Menu, Tray, Add, EnteringRotations, EnteringRotations
    EnteringRotations:= EnteringRotationsStatus = 1 ? 1 : ""
    if EnteringRotations
      Menu, Tray, Check, EnteringRotations
  Iniread, TempCodeStatus, data.ini, Options, TempCode
    Menu, Tray, Add, TempCode, TempCode
    Tempcode:= TempcodeStatus = 1 ? 1 : ""
    if TempCode
      Menu, Tray, Check, TempCode
  Iniread, SwitchWorkSheetsStatus, data.ini, Options, SwitchWorkSheets
    SwitchWorkSheets:= SwitchWorkSheetsStatus = 1 ? 1 : ""
    Menu, Tray, Add, SwitchWorkSheets, SwitchWorkSheets
    if SwitchWorkSheets
      Menu, Tray, Check, SwitchWorkSheets

    Run, cl3.Ahk, lib\CL3

    varbar.Show()

    try Menu, Tray, Icon, lib\Data\Robot.ico
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

  #Include <Temp>
  #Include <Checklist>
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
  #include <Functions>
  #IfWinActive,
return









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
  return
   




