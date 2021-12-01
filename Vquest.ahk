
VQuest_Start:
    #SingleInstance,Force
    #Persistent
    ;#ErrorStdOut
    ;Process, Priority, , High
    #NoEnv
    #KeyHistory 300
    #InstallKeybdHook
    #InstallMouseHook
    CheckTime:=500
    #ClipboardTimeout 1501
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
    FormatTime, The_Day,, MMMM d
    FormatTime, The_Hour,, htt
    FormatTime, The_Time,, hh:mm
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
    Iniread, A_Mode, data.ini, Options, A_Mode
    if !VarBar_x
      VarBar_x=1
    if !VarBar_y
      VarBar_y=1
    ; Menu, Tray, Add, CL3, CL3
    Menu, Tray, Add, DebugVars, DebugVars
    Menu, tray, NoStandard
    ; Menu, tray, Click, 
    Menu, Tray, Add, KeyHistory, KeyHistory
    Menu, Tray, Add, windowSpy, WindowSpy
    ShowVarBar:=CreateMenu("showVarbar")
    HideShowSampleID:=CreateMenu("ShowSampleID")
    DebuggingScript:=CreateMenu("DebuggingScript")
    HideVarbar:=CreateMenu("HideVarbar")
    Menu, Tray, Add, E&xit, ExitSub
    Menu, Tray, Default, E&xit


    try Run, cl3.Ahk, lib\CL3
    If !HideVarBar
      varbar.Show()

    try Menu, Tray, Icon, bin\Robot.ico
    settimer, ActiveCheck, %CheckTime%
    Blank:=" `n `n  `t `t `n`t "
    CurrentWindow:=A
    IfWinExist, ahk_exe WFICA32.EXE
    LMS.Orient()
    GuiControl, -redraw, varbar
    If Mode!="Disconnect Excel"
      Excel.Connect(1)
    GuiControl, +redraw, varbar
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
  #IfWinActive,
return

;__________________continuously runing sub_________________________________________________
ActiveCheck:
  Varbar.HoverAction()
    If Winactive("Result Entry - \\Remote") || WinActive("Register new samples - \\Remote")
      varbar.FloatAtopWindow()
    if WinActive("Error - \\Remote") {
      ControlSend,, {enter}, Error - \\Remote
      sleep 200
      if WinExist("Register new samples - \\Remote"){
        winactivate,
				Send, {click 180, 103,2}%Product%{enter}
			}   
    }
    if WinActive("Information - \\Remote")
      send, {enter}
    If (Iteration = -1 && A_WinDelay!=200)
      setwindelay, 200
    else If (Iteration = -2  && A_WinDelay!=300)
      setwindelay, 300
    else If (Iteration = -3  && A_WinDelay!=400)
      setwindelay, 300
    else 
      setwindelay, 100
return
   




