gosub, vquest_start
  CheckTime:=500
  #HotkeyInterval 50
  #MaxHotkeysPerInterval 500
  #MaxThreadsBuffer, On
  #InstallKeybdHook
  #InstallMouseHook
  #HotkeyModifierTimeout 80
  #maxthreadsperhotkey, 1
  ;SendMode, InputThenPl
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
  ; #MenuMaskKey vkE8
  #WinActivateForce
  AutoTrim, On
  return

Starting_test:
  ; FloVar()
    Products:=[]
  ; Iniread, Products, data.ini, Products
  
  iniread VimClip ,data.ini, SavedVariables, VimClip 
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
  ; activeWin:="VScode"
  ; listarray(Products)
  ; msgbox % "0:" Product "`n1: " product1 "`n2: " Product2 "`n3: " Product3 "`n4: "  Product4 "`n---`n" products[1] "--" Products[]
  return

CheckActive:
varbar.Follow()








  return
#IfWinActive, 


;


clipClip(type){
global
ifwinactive, ahk_exe EXCEL.EXE
  return
; Send, ^c
  clip.Regex()
  ; TT(Product " " Batch " " Department)
return

}




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
  iniread, note1, data.ini, SavedVariables, note1
  Iniread, note2, data.ini, SavedVariables, note2
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




;   loop 4 
;     Iniread, Batches%A_index%, data.ini, SavedVariables, Batches%A_Index%
;   loop 4 
;     Iniread, Lots%A_index%, data.ini, SavedVariables, Lots%A_Index%
;   loop 4 
;     Iniread, Coateds%A_index%, data.ini, SavedVariables, Coateds%A_Index%
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
  OnExit("Varbar.Exit")
  Send, {ctrlup}{altup}{shiftup}{lwinup}
  gosub, Starting_test


#IfWinActive,

;_____
  