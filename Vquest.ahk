
VQuest_Start:
    #SingleInstance,Force
    #Persistent
    #NoEnv
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
    SetBatchLines, 10ms
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
      ; Products := StrSplit(CurrentCodes,"`r`n")
    Filegettime, filetime, lib\Data\CurrentCodes.txt
    TimeSince:= A_Now - FileTime
    if TimeSince >  50000
      FileDelete, lib\Data\CurrentCodes.txt
    if !VarBar_x
      VarBar_x=1
    if !VarBar_y
      VarBar_y=1
    ; Menu, Tray, Add, CL3, CL3
    Menu, Tray, Add, DebugVars, DebugVars
    ; Menu, Tray, Add, Pause, Pause
    menu, tray, add, ShowSampleID, showSampleID
    Menu, tray, NoStandard
    Menu, Tray, Add, KeyHistory, KeyHistory
    Menu, Tray, Add, windowSpy, WindowSpy
    Menu, Tray, Default, DebugVars
    ShowVarBar:=togglemenu("showVarbar")
    TempCode:=togglemenu("TempCode")
    EnteringRotations:=togglemenu("EnteringRotations")
    SwitchWorkSheets:=togglemenu("SwitchWorkSheets")
    Menu, Tray, Add, E&xit, ExitSub

    try Run, cl3.Ahk, lib\CL3
    try Run, Vim.Ahk, lib\
    varbar.Show()

    try Menu, Tray, Icon, lib\Data\Robot.ico
    settimer, ActiveCheck, %CheckTime%
    Blank:=" `n `n  `t `t `n`t "
    CurrentWindow:=A
    IfWinExist, ahk_exe WFICA32.EXE
    LMS.Orient()

    Excel.Connect(1)
  #include <Toggles>
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
  #include <Vis2>
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
NoIdleTimer:
if (A_TimeIdle > (60*1000) && NoIdle) {
  MouseMove, 1,0,0,R
  SLEEP 50
  MouseMove, -1,0,0,R
}
  return
   




