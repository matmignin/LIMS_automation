#MaxHotkeysPerInterval 1000
#HotkeyModifierTimeout 50
#maxthreadsperhotkey, 1
SetKeyDelay, 1, 0.25
setwindelay, 200
FormatTime, DayString,, M/d/yy
FormatTime, TimeString, R
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

; ______________________________________________________________________



clipClip(type){
global
; tt("clipchanged")
; send, ^c
    sleep      20
    RegExMatch(Clipboard, "i)[abdefghijkl]\d{3}", cProduct)
    RegExMatch(Clipboard, "i)(?<!Ct#)\b\d{3}-\d{4}\b", cBatch)
    RegExMatch(Clipboard, "i)(\b\d{4}\w\d\w?|\bBulk\b)", clot)
    RegExMatch(Clipboard, "i)(coated: |/?ct#/s|Ct#|ct/s|coated/s)\d{3}-\d{4}\b", ctCoated)
    RegExMatch(ctCoated,   "\d{3}-\d{4}", cCoated)
    RegExMatch(Clipboard, "i)\bs\d{8}-\d{3}\b", cSampleID)
    Sleep      20
  If cProduct {
  GuiControl,Varbar:Text, Product, %cProduct%
				IniWrite, %cProduct%, data.ini, SavedVariables, Product
          ; if cBatch
            Fileappend, %cProduct% %cbatch% %cLot% %ctCoated% %TimeString%`n, Products.txt
          ; else
            ; Fileappend, %cProduct%`n, Products.txt
  }
  If cBatch {
    GuiControl,Varbar:Text, Batch, %cBatch%
				IniWrite, %cBatch%, data.ini, SavedVariables, Batch
        Fileappend, %cBatch%`n, Batch.txt
    }
  If cCoated {
    GuiControl,Varbar:Text, Coated, %cCoated%
				IniWrite, %cCoated%, data.ini, SavedVariables, Coated
        Fileappend, %cCoated%`n, lib/Coated.txt
    }
  If cLot {
    GuiControl,Varbar:Text, lot, %clot%
				IniWrite, %cLot%, data.ini, SavedVariables, Lot
        Fileappend, %cLot%`n, lib/Lot.txt
    }
  If cSampleID {
    GuiControl,Varbar:text, SampleID, %cSampleID%
				IniWrite, %cSampleID%, data.ini, SavedVariables, SampleID
        Fileappend, %cSampleID%`n, lib/SampleID.txt
    }
    if cProduct || cBatch || cLot || cCoated || cSampleID || Winactive("ahk_exe WFICA32.EXE") 
      TT(cProduct " " cBatch " " cLot " " cCoated " ",4000,Varbar_x,80,3,200)
    else 
        TT(Clipboard,900,Varbar_x,200,3,175)
    return 
}




#IfWinActive,
#include <Vim>
#Include <Office KEYS>
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
  