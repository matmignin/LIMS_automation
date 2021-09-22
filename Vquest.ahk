    #Persistent
    #NoEnv
    #SingleInstance,Force
    #KeyHistory 300
    #InstallKeybdHook
    #InstallMouseHook
    CheckTime:=500
    ; #HotkeyInterval 50
    ; #MaxHotkeysPerInterval 500
    #MaxThreadsBuffer, On
    #InstallKeybdHook
    #InstallMouseHook
    ; #HotkeyModifierTimeout 80
    #maxthreadsperhotkey, 1
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
    Products:=[]
  iniread VimClip,data.ini, SavedVariables, VimClip 
  Iniread, Product,  data.ini, Products, Product
  Iniread, Product1, data.ini, Products, Product1
  Iniread, Product2, data.ini, Products, Product2
  Iniread, Product3, data.ini, Products, Product3
  Iniread, Product4, data.ini, Products, Product4
          ; Products.Insert(Product)
          Products.Insert(Product1)
          Products.Insert(Product2)
          Products.Insert(Product3)
          Products.Insert(Product4)
  return



ActiveCheck: ;continuously runing sub
If MouseIsOver("VarBar ahk_exe AutoHotkey.exe") && !Winactive("ahk_exe WFICA32.EXE")
Fade(90)
; if winactive("Reason For Change - \\Remote") {
  ; menu.reasons()
  ; WinWaitNotActive, Reason For Change - \\Remote,, 10
; }
; If Winactive("Result Entry - \\Remote") || WinActive("Register new samples - \\Remote"){
;   wingetpos, Varbar_X, Varbar_y, Varbar_w, Varbar_h, VarBar ahk_exe AutoHotkey.exe
;   WinGetPos, VarBar_oX, VarBar_oY, Varbar_oW,Varbar_oH, A
;   WinMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,varbar_ox+100, Varbar_oy
;     WinWaitNotActive,  ;- \\Remote,, 20, NuGenesis LMS - \\Remote
;       WinMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,varbar_x, Varbar_y
; }
if WinExist("Error - \\Remote") {
  ControlSend,, {enter}, Error - \\Remote
  sleep 200
  if WinExist("Register new samples - \\Remote")
    winactivate,
      LMS.SearchBar(Product,"{enter}")
}

  return


Fade(FadeAmount:=90){
  global
  WinSet, Transparent, %FadeAmount%, AHK_id %GUIID%
  while MouseIsOver("VarBar ahk_exe AutoHotkey.exe") && !WinActive("VarBar ahk_exe AutoHotkey.exe")
    sleep 600
    WinSet, Transparent, 235, AHK_id %GUIID%
}


Test_4:
PopupColor1:="CE6D4B"
PopupColor2:="FFFFFF"
PopupTrans:=150
Gui, PopUp: +AlwaysOnTop +Disabled -SysMenu +Owner -Caption +ToolWindow +HwndGUIID  ;+AlwaysOnTop +owner +HwndGUIID +Owner avoids a taskbar button.
CoordMode, mouse, Screen
MouseGetPos, PopUp_x,Popup_y,
popup_y:=Popup_y+30
Gui, PopUp:Font,s16 cBlack Bold, Consolas
Gui, PopUp:Add, Text,, %yo%
Gui, PopUp:Show, NoActivate x%popup_x% y%Popup_y%
Gui, PopUp:color,%PopupColor1%, %PopupColor2%  
WinSet, Transparent, %PopUpTrans%, %GUIID%
settimer, destroyGui, -1000
return


DestroyGui:
  gui, PopUp:destroy
; CreateArray(){ ;creating an array and resorting without duplicates
	 ;Products := ["a","B","c","A","B","C",1,1.0,"1","1.0"]
return
			Batches:= StrSplit(A_LoopReadLine, "`n") 


	Products2 := [], oTemp := {}
	for vKey, vValue in Products
	{
		if (ObjGetCapacity([vValue], 1) = "") ;is numeric
		{
			if !ObjHasKey(oTemp, vValue+0)
				Products2.Push(vValue+0), oTemp[vValue+0] := ""
		}
		else
		{
			if !ObjHasKey(oTemp, "" vValue)
				Products2.Push("" vValue), oTemp["" vValue] := ""
		}  
	}
	vOutput := ""
	for vKey, vValue in Products2
		vOutput .= vKey " " vValue "`r`n"
	MsgBox, % vOutput
	return












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


  VQuest_Start:

    ; #MenuMaskKey vkE8
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
    Iniread, VarBar_X, data.ini, Locations, VarBar_X
    Iniread, VarBar_Y, data.ini, Locations, Varbar_Y
    Menu, Tray, Add, Exit, ExitSub
    Menu, Tray, Add, CL3, CL3
    Menu, Tray, Add, DebugVars, DebugVars
    Menu, Tray, Add, Pause, Pause
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
    try Menu, Tray, Icon, Robot.ico
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