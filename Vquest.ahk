gosub, vquest_start
SetNumLockState, on
CheckTime:=500
; #if getnumlock 
return



  

  
  
  Starting_test:
  ; Test_2()
  return

; ______________________________________________________________________




StopSub:
  exitapp
Return
VarBar_ResetSub:
 VarBar.Reset()
return
Run_Display:
 run, Display.url, C:\Users\mmignin\Desktop\
CL3(){
 Run, cl3.Ahk, lib\CL3
}
 return

ShowSampleID(){
  global
  Menu, Tray, ToggleCheck, ShowSampleID
 If ShowSampleID := !ShowSampleID
  IniWrite, 1, data.ini, Locations, ShowSampleID
 else
  IniWrite, 0, data.ini, Locations, ShowSampleID
 Varbar.Show()
}
ShowCoated(){
  global
  Menu, Tray, ToggleCheck, ShowCoated
 If ShowCoated := !ShowCoated
  IniWrite, 1, data.ini, Locations, ShowCoated
 else
  IniWrite, 0, data.ini, Locations, ShowCoated
 Varbar.Show()
}

MouseCLip(){
  global
 Menu, Tray, ToggleCheck, MouseClip
 If MouseClip:= !MouseClip
  IniWrite, 1, data.ini, Locations, MouseClip
 else 
  IniWrite, 0, data.ini, Locations, Mouseclip
 Varbar.Show()
}
ShowNotes(){
  global
;  Menu, Tray, ToggleCheck, ShowNotes
 If ShowNotes:= !ShowNotes
  Notes.Show()
else
  Notes.Close()
  IniRead, Note1, data.ini, SavedVariable, Note1
  IniRead, Note2, data.ini, SavedVariable, Note2
 Varbar.Show()
}
return
KeyHistory(){
  KeyHistory
}

WindowSpy(){
 Run, WindowSpy.ahk,C:\Program Files\AutoHotkey\
}

Exitsub(){
  exitapp
}


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

; AutoTrim, On
 #WinActivateForce
 SetWorkingDir, %A_ScriptDir%
 Menu, Tray, Add, Exit, ExitSub
 Menu, Tray, Add, CL3, CL3
 Menu, Tray, Add, MouseClip, Mouseclip
 menu, tray, add, ShowSampleID, showSampleID
 menu, tray, add, ShowCoated, ShowCoated
 menu, tray, add, ShowNotes, ShowNotes
 Menu, tray, NoStandard
;  Menu, tray, Click, 1 ; this will show the tray menu because we send{rbutton} at the DoubleTrayClick label
 Menu, Tray, Add, KeyHistory, KeyHistory
 Menu, Tray, Add, Exit, ExitSub
 Menu, Tray, Add, windowSpy, WindowSpy
 Menu, Tray, Default, KeyHistory

;#Warn, All, OutputDebug
; #Warn UseUnsetLocal, OutputDebug

 SetNumlockState Alwayson
 setcapslockstate alwaysoff
 SetscrolllockState, alwaysOff
 CoordMode, mouse, Window
 SetMouseDelay, 1
 SetDefaultMouseSpeed, 1
 SetTitleMatchMode, 2
 #MaxHotkeysPerInterval 200
 #HotkeyModifierTimeout 20
 #maxthreadsperhotkey, 1
;  #IfTimeout 20
 SetKeyDelay, 0, 0
 setwindelay, 200
 
 FormatTime, TimeString,, M/d/yy
 Run, cl3.Ahk, lib\CL3
 try
 Menu, Tray, Icon, Robot.ico
settimer, CheckActive, %CheckTime%

varbar.Show()
; Iniread, Product, data.ini, SavedVariables, Product
; Iniread, Batch, data.ini, SavedVariables, Batch
 if !Product
  Excel.Connect(1)
OnExit("Varbar.Exit")

 CopyPasteToggle=0
 TabToggle=0
 Batches:=[]
 Products:=[]
 Lots:=[]

 IfWinExist, ahk_exe WFICA32.EXE
  LMS.Orient()
;  IfWinExist, ahk_exe WFICA32.EXE
  if (MouseClip = 1)
    Menu, Tray, Check, MouseClip
  else
    Menu, Tray, unCheck, MouseClip
  if (ShowSampleID = 1)
    Menu, Tray, Check, showsampleID
  else
    Menu, Tray, unCheck, ShowCoated
  if (ShowCoated = 1)
    Menu, Tray, Check, ShowCoated
  else
    Menu, Tray, unCheck, showsampleID
  if WinExist("Vquest.ahk" ,,"Visual Studio Code")
    WinActivate, Vquest.ahk,,Visual Studio Code
        
gosub, Starting_test


#IfWinActive,
On:="On"
Off:="Off"
Clear:="Clear"
yo:="yo"
ye:="ye"

;_____
  