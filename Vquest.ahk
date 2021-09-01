#MaxHotkeysPerInterval 1000
#InstallKeybdHook
#HotkeyModifierTimeout 80
#maxthreadsperhotkey, 1
;SendMode, InputThenPl
SetControlDelay, 1
SetKeyDelay, 1, 0.25
setwindelay, 250
FormatTime, DateString,,  MM/dd/yy
FormatTime, TimeString,  yyMMddHH
gosub, vquest_start
SetNumLockState, on
SetscrolllockState, off
CoordMode, mouse, Window
SetMouseDelay, 1
SetDefaultMouseSpeed, 1
SetTitleMatchMode, 2
  #MenuMaskKey vkE8
#WinActivateForce
AutoTrim, On
CheckTime:=500
; activeWin:="VScode"


return
  Starting_test:
  ; Test_2()
  return


CheckActive:
  ; if winexist("Excel - \\Remote") ;shrink excel 
    WinGet, winminmax, MinMax, A
      if (winminmax=1) && !Winactive("ahk_exe Code.exe") && !Winactive("ahk_exe Firefox.exe") && !Winactive("ahk_exe EXCEL.exe") && !Winactive("ahk_exe WINWORD.exe") && !Winactive("ahk_exe Photo.exe"){
        winactivate , ; Excel - \\Remote,
			  sleep 200
			  send, {lwindown}{down}{lwinup}
				; WinMove, Excel ahk_exe WFICA32.EXE, ,0, 0, A_ScreenWidth/2, A_ScreenHeight/4
        ; sleep 300
      }
      CoordMode, mouse, screen
    if Product
      Vars:=Product
    if Batch
      Vars.="`t"Batch
    if Lot
      Vars.="`n"Lot
    if Coated
      Vars.="`t"Coated
    if !(Activewin="VScode") && winactive("ahk_exe Code.exe") {
      Varbar.show()
      TT("vscode")
      return
    }
    if !(Activewin="LMS") && winactive("NuGenesis LMS - \\Remote") {
    TT(Vars)
      Varbar.show()
      return
    }
    if winactive("NuGenesis LMS - \\Remote") {
      LMS.Orient()
      ; try Gui,VarBar:Destroy
      ActiveWin:="LMS"
    }
    if winactive("ahk_exe Code.exe"){
      ; try Gui,VarBar:Destroy
      ; MidScreen:=A_ScreenWidth /4
      ; Gui, VarBar:Show, h23 x%MidScreen% y%A_screenheight% w560 NoActivate, VarBar
      ; IniWrite, 1, data.ini, Locations, VarBar_X
      ; IniWrite, 1, data.ini, Locations, VarBar_Y
      ActiveWin:="VScode"
			}
      ; If Follow 
      ; {
        ; If (Winexist("NuGenesis LMS - \\Remote") || Winactive("Register new samples - \\Remote")) && WinExist("Excel - \\Remote")
          ; WinGetPos, LMS_X, LMS_Y, LMS_W,LMS_H, "NuGenesis LMS - \\Remote"
        ; else
        ; WinGetTitle, WinTitle, A 
        ; VarWin_X := LMS_X+(LMS_W/2)-400
        ; VarWin_Y := LMS_Y
        ; WinMove, VarBar ahk_class AutoHotkeyGUI,, VarWin_X, VarWin_Y,
      ; }
		; sendlevel 1
      ; If A_TimeIdle > 4000
      ; {
        ; setwindelay, 200
        ; send,{lctrlUp}{altup}
      ; }
		  ; sendlevel 0
			; try {
			; 	WinGetPos, VarBar_X, VarBar_Y,,, NuGenesis LMS - \\Remote,
			; 	varbar_x:= Varbar_x +700
			; 	Gui, VarBar:Show, h23 x%VarBar_X% y%VarBar_y% w560 NoActivate, VarBar
			; }
			; catch
			; CoodrdMode, mouse, window
  return

; ______________________________________________________________________



clipClip(type){
global
; tt("clipchanged")
; send, ^c
  clip.Regex("Codes")
  return

}




#IfWinActive,
#include <VIM>
#Include <OFFICE>
#include <KEYS>
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
; #include <Excel2SmartDoc>
#include <vis2>
#include <Support Functions>


VQuest_Start:
  #Persistent
  #NoEnv
  #SingleInstance,Force
  #KeyHistory 300
  #InstallKeybdHook
  #InstallMouseHook
  OnClipboardChange("clipclip")
  CrLf=`r`n
  FileName:="lib/WinPos.txt"
  envget, PrevProduct, PrevProduct

  SetWorkingDir, %A_ScriptDir%
  Iniread, SwitchWorkSheets, data.ini, Options, SwitchWorkSheets
  Menu, Tray, Add, Exit, ExitSub
  Menu, Tray, Add, CL3, CL3
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
  ; menu, tray, add, ShowSampleID, showSampleID
  ; menu, tray, add, ShowCoated, ShowCoated
  menu, tray, add, ShowNotes, ShowNotes
  Menu, tray, NoStandard
  Menu, Tray, Add, KeyHistory, KeyHistory
  Menu, Tray, Add, Exit, ExitSub
  Menu, Tray, Add, windowSpy, WindowSpy
  Menu, Tray, Default, KeyHistory

  SetNumlockState Alwayson
  setcapslockstate alwaysoff
  SetscrolllockState, alwaysOff


  try Run, cl3.Ahk, lib\CL3
  try Menu, Tray, Icon, Robot.ico
  settimer, CheckActive, %CheckTime%
  Iniread, Product0, data.ini, SavedVariables, Product0
  Iniread, Product1, data.ini, SavedVariables, Product1
  Iniread, Product2, data.ini, SavedVariables, Product2
  Iniread, Product3, data.ini, SavedVariables, Product3
  Iniread, Product4, data.ini, SavedVariables, Product4
  Iniread, Batch0, data.ini, SavedVariables, Batch0
  Iniread, Batch1, data.ini, SavedVariables, Batch1
  Iniread, Batch2, data.ini, SavedVariables, Batch2
  Iniread, Batch3, data.ini, SavedVariables, Batch3
  Iniread, Batch4, data.ini, SavedVariables, Batch4
  Iniread, Lot0, data.ini, SavedVariables, Lot0
  Iniread, Lot1, data.ini, SavedVariables, Lot1
  Iniread, Lot2, data.ini, SavedVariables, Lot2
  Iniread, Lot3, data.ini, SavedVariables, Lot3
  Iniread, Lot4, data.ini, SavedVariables, Lot4
  Iniread, Coated0, data.ini, SavedVariables, Coated0
  Iniread, Coated1, data.ini, SavedVariables, Coated1
  Iniread, Coated2, data.ini, SavedVariables, Coated2
  Iniread, Coated3, data.ini, SavedVariables, Coated3
  CopyPasteToggle=0
  TabToggle=0
  Batches:=[]
  Products:=[]
  Lots:=[]
  On:="On"
  Off:="Off"
  Clear:="Clear"
  yo:="yo"
  ye:="ye"
  IfWinExist, ahk_exe WFICA32.EXE
  LMS.Orient()
  if (ShowSampleID = 1)
    Menu, Tray, Check, showsampleID
  else {
    Menu, Tray, unCheck, showsampleID
    showsampleID:=
    }
  varbar.Show()
  Excel.Connect(1)
  OnExit("Varbar.Exit")
  send, {ctrlup}{altup}{shiftup}{lwinup}
  gosub, Starting_test


#IfWinActive,

;_____
  