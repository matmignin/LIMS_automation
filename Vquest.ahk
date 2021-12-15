
VQuest_Start:
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
    #HotkeyModifierTimeout 0
    #maxthreadsperhotkey, 1
    ;SetBatchLines, -1
    ;  SetBatchLines, 10ms
    ; If (Iteration = -1){
    ;   SetControlDelay, -1
    ;   setkeydelay, -1
    ;   setMousedelay, -1
    ;   setwindelay, -1
    ;   SetDefaultMouseSpeed, 0
    ; }
    ; else {
    ;   SetControlDelay, 1
    ;   SetKeyDelay, 1, 0.25
    ;   SetMouseDelay, 1
    ;   setwindelay, 250
    ;   SetDefaultMouseSpeed, 1
    ; }
    SetTitleMatchMode, 2
    FormatTime, DayString,, MM/d/yy
    FormatTime, TimeString, R
    FormatTime, CurrentDateTime,, MM/dd/yy
    FormatTime, The_Day,, MMMM d
    FormatTime, The_Hour,, htt
    FormatTime, The_Time,, hh:mm
    n=1
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
    ; Menu, Tray, Add, CL3, CL3
    Menu, Tray, Add, DebugVars, DebugVars
    Menu, tray, NoStandard
    ; Menu, tray, Click,
    Menu, Tray, Add, KeyHistory, KeyHistory
    Menu, Tray, Add, windowSpy, windowSpy
     ShowVarBar:=CreateMenu("showVarbar")
    HideShowSampleID:=CreateMenu("ShowSampleID")
    ; ExcelConnect:=CreateMenu("ExcelConnect")
    ; DebuggingScript:=CreateMenu("DebuggingScript")
    ; HideVarbar:=CreateMenu("HideVarbar")
    Menu, Tray, Add, E&xit, ExitSub
    Menu, Tray, Default, E&xit
     varbar.Show()
    GuiControl, -redraw, varbar
    try Run, cl3.Ahk, lib\CL3
    try Menu, Tray, Icon, bin\Robot.ico
    Blank:=" `n `n  `t `t `n`t "
    Currentwindow:=A
    IfwinExist, ahk_exe WFICA32.EXE
    if winexist("ahk_exe WFICA32.EXE")
      LMS.Orient()
      Excel.Connect(0)
    GuiControl, +redraw, varbar
    if A_Debuggername
      try Run, Vim.Ahk, lib\
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
  If winactive("ahk_exe Sketchup.exe")
    Suspend, On
  else
    Suspend, Off
    ; Varbar.Hoveraction()
  ; If (MouseIsOver("VarBar ahk_exe AutoHotkey.exe") && Varbar_H!=90 ){
  ;   VarBar_H:=90
  ;   winMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%VarBar_H%
  ; }
  ; If !(MouseIsOver("VarBar ahk_exe AutoHotkey.exe") && Varbar_H!=32 ){
  ;   VarBar_H:=32
  ;   winMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,,,,%VarBar_H%
  ; }

    If winactive("Result Entry - \\Remote") || winactive("Register new samples - \\Remote")
      varbar.FloatAtopwindow()
    else if winactive("Error - \\Remote") {
      ControlSend,, {enter}, Error - \\Remote
      sleep 200
      if winExist("Register new samples - \\Remote"){
        winactivate,
				Send, {click 180, 103,2}%Product%{enter}
			}
    }
    else if winactive("Information - \\Remote")
      send, {enter}

    ; If (Iteration = -2  && A_winDelay!=300)
      ; setwindelay, 300
    ; else If (Iteration = -3  && A_winDelay!=400)
      ; setwindelay, 300
    ; else
      ; setwindelay, 200
return





