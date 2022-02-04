
VQuest_Start:
    #SingleInstance,Force
    #Persistent
    ;#ErrorStdOut
    Process, Priority, , High
    #NoEnv
    Iniread, Iteration, Settings.ini, SavedVariables, Iteration
    iniread, DebuggingScript, Settings.ini, Options, DebuggingScript
    iniread, Validating, Settings.ini, Options, Validating
    Iniread, ExcelConnect, Settings.ini, Options, ExcelConnect
    #KeyHistory 500
    #InstallKeybdHook
    #InstallMouseHook
    CheckTime:=600
    #ClipboardTimeout 1500
    ; #HotkeyInterval 50
    ; #MaxHotkeysPerInterval 500
    ; #MaxThreadsBuffer, On
    #InstallKeybdHook
    ; OnMessage(0x004A, "Receive_WM_COPYDATA")  ; 0x004A is WM_COPYDATA

    #InstallMouseHook
    #HotkeyModifierTimeout
    #maxthreadsperhotkey, 2
    SetTitleMatchMode, 2
    FormatTime, DayString,, MM/d/yy
    FormatTime, TimeString, R
    FormatTime, CurrentDateTime,, MM/dd/yy
    FormatTime, The_Day,, MMMM d
    FormatTime, The_Hour,, htt
    FormatTime, The_Time,, hh:mm
    SetNumLockState, on
    SetscrolllockState, off
    CrLf=`r`n
    SetNumlockState Alwayson
    setcapslockstate alwaysoff
    SetscrolllockState, alwaysoff
    CoordMode, mouse, window
    SetWorkingDir, %A_ScriptDir%
    #winactivateForce
    AutoTrim, On
    OnExit("Varbar.SaveVariables")
    if !VarBar_x
      VarBar_x=1
    if !VarBar_y
      VarBar_y=1
    Menu, Tray, Add, CL3, CL3
    Menu, Tray, Add, DebugVars, DebugVars
    Menu, tray, NoStandard
    ; Menu, tray, Click,
    Menu, Tray, Add, KeyHistory, KeyHistory
    Menu, Tray, Add, listlines, listlines
    Menu, Tray, Add, windowSpy, windowSpy
    Menu, Tray, Add, Edit_Batches, Edit_Batches
    Menu, Tray, Add, Entering_Rotations, Entering_Rotations
    Menu, Tray, Add, TempCode, TempCode
    OnClipboardChange("clipChange")
    PasteTime:=A_TickCount
    ; if Mode=Edit_Batches
      ; Menu, Tray, Check, Edit_Batches
    ; else if Mode=Entering_Rotations
      ; Menu, Tray, Check, Entering_Rotations
    ; else if Mode=TempCode
      ; Menu, Tray, Check, TempCode
      Mode:="Entering_Rotations"
     ShowVarBar:=CreateMenu("showVarbar")
     Validating:=CreateMenu("Validating")
    ;  HideShowSampleID:=CreateMenu("ShowSampleID")
    ; ExcelConnect:=CreateMenu("")
    ; DebuggingScript:=CreateMenu("DebuggingScript")
    ; HideVarbar:=CreateMenu("HideVarbar")
    Menu, Tray, Add, E&xit, ExitSub
    Menu, Tray, Default, E&xit
    ; GuiControl, -redraw, varbar
    try Menu, Tray, Icon, bin\Robot.ico
    ; Currentwindow:=A
    varbar.Show()

      ; clip.CodesRegex(CodeString)
    ; if !VimOpen
    IfwinExist, ahk_exe WFICA32.EXE
      LMS.Orient()
    copypasteToggle:=0
      ; run, lib\Vim.ahk
  ; if !ClipOpen
  ;  try Run, cl3.Ahk, lib\CL3
    ; GuiControl, +redraw, varbar
    RegexProduct:="i)(?<=[\w\d]{3})?(?P<Product>[abcdefghijkl]\d{3})"
    RegexBatch:=  "i)(?<!Ct#)(?P<Batch>\d{3}-\d{4}\b)"
    RegexLot:=    "i)(?P<Lot>\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d)"
    RegexCoated:= "i)(coated: |ct#?|ct\s?|coated\s?)(?P<Coated>\d{3}-\d{4})"


    ; if A_DebuggerName


  ;CurrentList:=[]
  ; Loop, Read, C:\Users\mmignin\Documents\VQuest\data\CurrentCodes.txt
    ; {
      ; CurrentList.Insert(A_loopreadline)
      ; maxindex := A_Index
    ; }

    if winexist("Mats LMS Workbook.xlsb - Excel")
      Excel.Connect(0)
    else
      clipboard:=CodeString


        #include <cl3api>
  #Include C:\Users\mmignin\Documents\VQuest\lib\SuppressErrorDialog.ahk
  #include C:\Users\mmignin\Documents\VQuest\lib\Toggles.ahk
  #Include C:\Users\mmignin\Documents\VQuest\lib\Temp.ahk
  ; if !VimOpen
  #include C:\Users\mmignin\Documents\VQuest\lib\VIM.ahk
  #Include C:\Users\mmignin\Documents\VQuest\lib\Test.ahk
  ; #include C:\Users\mmignin\Documents\VQuest\lib\HotStrings.ahk
   #include C:\Users\mmignin\Documents\VQuest\lib\KEYS.ahk
  #include C:\Users\mmignin\Documents\VQuest\lib\PAD.ahk
  #Include C:\Users\mmignin\Documents\VQuest\lib\LMS.ahk
  #Include C:\Users\mmignin\Documents\VQuest\lib\clip.ahk
  ; #Include C:\Users\mmignin\Documents\VQuest\lib\OpenApp.ahk
  #include C:\Users\mmignin\Documents\VQuest\lib\Excel.ahk
  #include C:\Users\mmignin\Documents\VQuest\lib\varBar.ahk
  #include C:\Users\mmignin\Documents\VQuest\lib\menu.ahk
  #include C:\Users\mmignin\Documents\VQuest\lib\Vis\Gdip_All.ahk
  #include C:\Users\mmignin\Documents\VQuest\lib\Vis\JSON.ahk
  #include C:\Users\mmignin\Documents\VQuest\lib\Vis\Vis2.ahk
  #include C:\Users\mmignin\Documents\VQuest\lib\Functions.ahk
  #include C:\Users\mmignin\Documents\VQuest\lib\Xml.ahk

; return
; your functions
; F13 & 7::
; MsgBox % Array[1]

; #include lib\cl3api.ahk
return
CL3Api_Close()


Receive_WM_COPYDATA(wParam, lParam)
{
    StringAddress := NumGet(lParam + 2*A_PtrSize)  ; Retrieves the CopyDataStruct's lpData member.
    Data := StrGet(StringAddress)  ; Copy the string out of the structure.
    ; Show it with ToolTip vs. MsgBox so we can return in a timely fashion:
    ToolTip %A_ScriptName%`nReceived the following string:`n%CopyOfData%
    return true  ; Returning 1 (true) is the traditional way to acknowledge this message.
}

; TargetScriptTitle := "Vquest.ahk ahk_class AutoHotkey"
; StringToSend:="K277"
; result := Send_WM_COPYDATA(StringToSend, TargetScriptTitle)
Send_WM_COPYDATA(ByRef StringToSend, ByRef TargetScriptTitle){
    VarSetCapacity(CopyDataStruct, 3*A_PtrSize, 0)
       SizeInBytes := (StrLen(StringToSend) + 1) * (A_IsUnicode ? 2 : 1)
    NumPut(SizeInBytes, CopyDataStruct, A_PtrSize)  ; OS requires that this be done.
    NumPut(&StringToSend, CopyDataStruct, 2*A_PtrSize)  ; Set lpData to point to the string itself.
    Prev_DetectHiddenWindows := A_DetectHiddenWindows
    Prev_TitleMatchMode := A_TitleMatchMode
    DetectHiddenWindows On
    SetTitleMatchMode 2
    TimeOutTime := 4000  ; Optional. Milliseconds to wait for response from receiver.ahk. Default is 5000
    ; Must use SendMessage not PostMessage.
    SendMessage, 0x004A, 0, &CopyDataStruct,, %TargetScriptTitle%,,,, %TimeOutTime% ; 0x004A is WM_COPYDATA.
    DetectHiddenWindows %Prev_DetectHiddenWindows%  ; Restore original setting for the caller.
    SetTitleMatchMode %Prev_TitleMatchMode%         ; Same.
    return ErrorLevel  ; Return SendMessage's reply back to our caller.
}


;__________________continuously runing sub_________________________________________________
activeCheck:
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
  else
    return
return


Entering_Rotations:
  Mode:="Entering_Rotations"
  Menu, Tray, Check, Entering_Rotations
  Menu, Tray, unCheck, Edit_Batches
  ; varbar.saveVariables()
  return
Edit_Batches:
  Mode:="Edit_Batches"
  Menu, Tray, unCheck, Entering_Rotations
  Menu, Tray, Check, Edit_Batches
  ; varbar.saveVariables()
  return
DebuggingScript:
  Mode:="DebuggingScript"
  Menu, Tray, unCheck, DebuggingScript
  Menu, Tray, Check, DebuggingScript
  ; varbar.saveVariables()
  return
TempCode:
  Mode:="TempCode"
  Menu, Tray, Check, TempCode
  ; varbar.saveVariables()
  return


