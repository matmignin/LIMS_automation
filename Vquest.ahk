
VQuest_Start:

  RegexProduct:="i)(?<=\w{3})?[abdefghijkl]\d{3}"
    #SingleInstance,Force
    #Persistent
    ;#ErrorStdOut
    Process, Priority, , High
    #NoEnv
    Iniread, Iteration, Settings.ini, SavedVariables, Iteration
    Iniread, Mode, Settings.ini, Options, Mode
    ; Iniread, HideVarbar, Settings.ini, Options, HideVarbar
    Iniread, ExcelConnect, Settings.ini, Options, ExcelConnect
    #KeyHistory 500
    #InstallKeybdHook
    #InstallMouseHook
    CheckTime:=600
    #ClipboardTimeout 1500
    ; #HotkeyInterval 50
    #MaxHotkeysPerInterval 500
    #MaxThreadsBuffer, On
    #InstallKeybdHook
    #InstallMouseHook
    #HotkeyModifierTimeout
    #maxthreadsperhotkey, 1
    SetTitleMatchMode, 2
    FormatTime, DayString,, MM/d/yy
    FormatTime, TimeString, R
    FormatTime, CurrentDateTime,, MM/dd/yy
    FormatTime, The_Day,, MMMM d
    FormatTime, The_Hour,, htt
    FormatTime, The_Time,, hh:mm
    SetNumLockState, on
    SetscrolllockState, off
    SetNumlockState Alwayson
    setcapslockstate alwaysoff
    CrLf=`r`n
    SetscrolllockState, alwaysoff
    CoordMode, mouse, window
    SetWorkingDir, %A_ScriptDir%
    #winactivateForce
    AutoTrim, On
    ; else
    OnExit("Varbar.SaveVariables")
    ;FileName:="lib/winPos.txt"
    if !VarBar_x
      VarBar_x=1
    if !VarBar_y
      VarBar_y=1
    ;Menu, Tray, Add, CL3, CL3
    Menu, Tray, Add, DebugVars, DebugVars
    Menu, tray, NoStandard
    ; Menu, tray, Click,
    Menu, Tray, Add, KeyHistory, KeyHistory
    Menu, Tray, Add, listlines, listlines
    Menu, Tray, Add, windowSpy, windowSpy
    Menu, Tray, Add, Edit_Batches, Edit_Batches
    Menu, Tray, Add, Entering_Rotations, Entering_Rotations
    Menu, Tray, Add, TempCode, TempCode
    if Mode=Edit_Batches
      Menu, Tray, Check, Edit_Batches
    else if Mode=Entering_Rotations
      Menu, Tray, Check, Entering_Rotations
    else if Mode=TempCode
      Menu, Tray, Check, TempCode
     ShowVarBar:=CreateMenu("showVarbar")
    HideShowSampleID:=CreateMenu("ShowSampleID")
    ;ExcelConnect:=CreateMenu("")
    ; DebuggingScript:=CreateMenu("DebuggingScript")
    ; HideVarbar:=CreateMenu("HideVarbar")
    Menu, Tray, Add, E&xit, ExitSub
    Menu, Tray, Default, E&xit
     varbar.Show()
    GuiControl, -redraw, varbar
    ; try Run, cl3.Ahk, lib\CL3
    try Menu, Tray, Icon, bin\Robot.ico
    Blank:=" `n `n  `t `t `n`t "
    Currentwindow:=A
    IfwinExist, ahk_exe WFICA32.EXE
      LMS.Orient()
    if winexist("Mats LMS Workbook.xlsb - Excel") && ExcelConnect
      Excel.Connect(0)
    GuiControl, +redraw, varbar
    ; if A_Debuggername
      ; try Run, Vim.Ahk, lib\
    ; else
      ; settimer, ActiveCheck , %CheckTime%
  OnClipboardChange("clipChange")
  #include <Toggles>
  #Include <Temp>
  #include <VIM>
  #Include <Test>
  #include <HotStrings>
  #include <KEYS>
  #include <PAD>
  #Include <LMS>
  #include <VScode>
  #Include <clip>
  #Include <OpenApp>
  #include <Excel>
  #include <varBar>
  #include <menu>
  ;#include <Rotation>
  #include C:\Users\mmignin\Documents\VQuest\lib\Vis\Vis2.ahk
  #include <Functions>
  #include <Xml>

  #Ifwinactive,
return

;__________________continuously runing sub_________________________________________________
activeCheck:
  If winactive("Result Entry - \\Remote") || winactive("Register new samples - \\Remote")
    varbar.FloatAtopwindow()
  if winactive("Error - \\Remote") {
    ControlSend,, {enter}, Error - \\Remote
    sleep 200
    if winExist("Register new samples - \\Remote"){
      winactivate,
			Send, {click 180, 103,2}%Product%{enter}
		}
  }
  if winactive("Information - \\Remote")
    send, {enter}
return


Entering_Rotations:
  Mode:="Entering_Rotations"
  Menu, Tray, Check, Entering_Rotations
  Menu, Tray, unCheck, Edit_Batches
  varbar.saveVariables()
  return
Edit_Batches:
  Mode:="Edit_Batches"
  Menu, Tray, unCheck, Entering_Rotations
  Menu, Tray, Check, Edit_Batches
  varbar.saveVariables()
  return
TempCode:
  Mode:="TempCode"
  Menu, Tray, Check, TempCode
  varbar.saveVariables()
  return


