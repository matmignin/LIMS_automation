#MaxHotkeysPerInterval 1000
#InstallKeybdHook
#HotkeyModifierTimeout 80
#maxthreadsperhotkey, 1
SendMode Input
SetControlDelay, 0
SetKeyDelay, 1, 0.25
;setwindelay, 200
FormatTime, DayString,,  MM/dd/yy
FormatTime, TimeString,  yyMMddHH
gosub, vquest_start
SetNumLockState, on
CoordMode, mouse, Window
SetMouseDelay, 1
SetDefaultMouseSpeed, 1
SetTitleMatchMode, 2
  #MenuMaskKey vkE8
#WinActivateForce
AutoTrim, On
CheckTime:=300


return
  Starting_test:
  ; Test_2()
  return


CheckActive:
  ; Varbar.Follow()
  if winexist("Book ahk_exe WFICA32.EXE") ;shrink excel 
    WinGet, winminmax, MinMax ,Book ahk_exe WFICA32.EXE,
        if (winminmax=1){
				; winactivate, Book ahk_exe WFICA32.EXE
			  send, {lwindown}{down}{lwinup}
			  sleep 200
				; WinMove, Excel ahk_exe WFICA32.EXE, ,0, 0, A_ScreenWidth/2, A_ScreenHeight/4
        ; sleep 300
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
		sendlevel 1
      If A_TimeIdle > 4000
      {
        setwindelay, 200
        send,{lctrlUp}{altup}
      }
		  sendlevel 0
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
#Include <Firefox>
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
  Menu, Tray, Add, Exit, ExitSub
  Menu, Tray, Add, CL3, CL3
  Menu, Tray, Add, EnteringProduct, EnteringProduct
  menu, tray, add, ShowSampleID, showSampleID
  menu, tray, add, ShowCoated, ShowCoated
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
  ; Iniread, Product, data.ini, SavedVariables, Product
  ; Iniread, Batch, data.ini, SavedVariables, Batch
  ; Iniread, Coated, data.ini, SavedVariables, Coated
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
  

  if (EnteringProduct = 1)
    Menu, Tray, Check, EnteringProduct
  else
    Menu, Tray, unCheck, EnteringProduct
  if (ShowSampleID = 1)
    Menu, Tray, Check, showsampleID
  else
    Menu, Tray, unCheck, ShowCoated
  if (ShowCoated = 1)
    Menu, Tray, Check, ShowCoated
  else
    Menu, Tray, unCheck, showsampleID
  varbar.Show()
  Excel.Connect(1)
  OnExit("Varbar.Exit")
  send, {ctrlup}{altup}{shiftup}{lwinup}
  gosub, Starting_test


#IfWinActive,

;_____
  