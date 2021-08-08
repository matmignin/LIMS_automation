
gosub, vquest_start
SetNumLockState, on
CheckTime:=500
; #if getnumlock 
return

  Starting_test:
  ; Test_2()
  return

; ______________________________________________________________________






#IfWinActive,
#include <Vim>
#include <KEYS>
#Include <clip>
#Include <Firefox>
#Include <OpenApp>
#Include <LMS>
#Include <Snipper>
#Include <Office KEYS>
#Include <AutoFill>
#include <varBar>
#include <ProductTab>
#include <WorkTab>
#include <SpecTab>
#include <menu>
#include <Rotation>
#include <Excel>
#include <vis2>
#include <Notes>
  #include <Support Functions>


VQuest_Start:
  #Persistent
  #NoEnv
  #SingleInstance,Force
  #KeyHistory 300
  #InstallKeybdHook
  #InstallMouseHook
  ;  #MenuMaskKey vkE8
  CrLf=`r`n
  FileName:="lib/WinPos.txt"
  envget, PrevProduct, PrevProduct
  AutoTrim, On
  #WinActivateForce
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
OnExit("Varbar.Exit")
  SetNumlockState Alwayson
  setcapslockstate alwaysoff
  SetscrolllockState, alwaysOff
  CoordMode, mouse, Window
  SetMouseDelay, 1
  SetDefaultMouseSpeed, 1
  SetTitleMatchMode, 2
  #MaxHotkeysPerInterval 300
  #HotkeyModifierTimeout 50
  #maxthreadsperhotkey, 1
;  #IfTimeout 20
  SetKeyDelay, 1, 0
  setwindelay, 200
  FormatTime, DayString,, M/d/yy
  FormatTime, TimeString,, Time
  try
  Run, cl3.Ahk, lib\CL3
  try
  Menu, Tray, Icon, Robot.ico
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
  