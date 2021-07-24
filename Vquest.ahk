gosub, vquest_start
SetNumLockState, on
CheckTime:=500
; #if getnumlock 
return
CheckActive:
  ; Varbar.Follow()
  if winexist("Excel - \\Remote") ;shrink excel 
    WinGet, winminmax, MinMax , Excel - \\Remote,
      if (winminmax=1){
        winactivate, Excel - \\Remote
        send, {lwindown}{down}{lwinup}
        sleep 300
      }
      If Follow 
      {
        If (Winexist("NuGenesis LMS - \\Remote") || Winactive("Register new samples - \\Remote")) && WinExist("Excel - \\Remote")
          WinGetPos, LMS_X, LMS_Y, LMS_W,LMS_H, "NuGenesis LMS - \\Remote"
        else
          WinGetTitle, WinTitle, A 
        VarWin_X := LMS_X+(LMS_W/2)-400
        VarWin_Y := LMS_Y
        WinMove, VarBar ahk_class AutoHotkeyGUI,, VarWin_X, VarWin_Y,
      }
      If A_TimeIdle >10000
        send, {ctrlUp}{altup}
  return
  
  
  
  
  
  Starting_test:
  ; Test_2()
  return

; ______________________________________________________________________



ctrlEvent(CtrlHwnd, GuiEvent, EventInfo, ErrLevel:=""){

 ;GuiControlGet, OutputVar , , %CtrlHwnd%,
 IniRead,vOutput, Customers.ini, Customers, %OutputVar%
 msgbox, %vOutput%
}


WindowNames(){
 global
 Loop, Read, WindowNames.ini
 {
  If A_Index = 1
   Continue
  WindowName := StrSplit(A_LoopReadLine, "=")
  ; MethodGroup := StrSplit(A_LoopReadLine, "|")
  Selection:= % WindowName[1]
  ; Group:= % MethodGroup[2]
  Menu, WindowNameMenu, add, %Selection%, WindowNameMenu
 }
 Menu, WindowNameMenu, Show,
return

WindowNameMenu:
 sleep 200
 InputVar:=A_ThisMenuItem
 IniRead,vOutput, WindowNames.ini, WindowNames, %InputVar%
 Sendinput, %vOutput%{enter}
return
}

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

MouseCLip(){
  global
 Menu, Tray, ToggleCheck, MouseClip
 If MouseClip:= !MouseClip
  IniWrite, 1, data.ini, Locations, MouseClip
 else 
  IniWrite, 0, data.ini, Locations, Mouseclip
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
; #include <TrackPad>
#include <VScode>
#include <KEYS>
; #include <LMS KEYS>
; #include <LMS TRACKPAD>
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
#include <wheel>
#include <mouse>
#include <click>
; #include <Vim>
; #include <Notes>
; #include <SaveWindow>
; #include <Cl3.ahk>


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
 Menu, Tray, Add, CL3, CL3
 Menu, Tray, Add, MouseClip, Mouseclip
 menu, tray, add, ShowSampleID, showSampleID
  ; Iniread, ShowSampleIDState, data.ini, Locations, ShowSampleIDState
  ; if showsampleidstate = 1
  ;   Menu, Tray, Check, ShowsampleID
  ; else
  ;   Menu, Tray, unCheck, ShowsampleID
  
  ; Iniread, MouseClipState, data.ini, Locations, MouseclipState
  ; if MouseClipstate = 1
  ;   Menu, Tray, Check, MouseClip
  ; else
  ;   Menu, Tray, unCheck, MouseClip
;  msgbox % ShowampleID
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
 setwindelay,300
 
 FormatTime, TimeString,, M/d/yy
 Run, cl3.Ahk, lib\CL3
 try
 Menu, Tray, Icon, Robot.ico
settimer, CheckActive, %CheckTime%
varbar.Show()
OnExit("Varbar.Exit")

 CopyPasteToggle=0
 Batches:=[]
 Products:=[]
 Lots:=[]
 Excel.Connect(1)
 IfWinExist, ahk_exe WFICA32.EXE
  LMS.Orient()
  if (MouseClip = 1)
    Menu, Tray, Check, MouseClip
  else
    Menu, Tray, unCheck, MouseClip
    
    if (ShowSampleID = 1)
    Menu, Tray, Check, showsampleID
  else
    Menu, Tray, unCheck, showsampleID
  ; if (Inverted = 1)
    ; Menu, Tray, Check, Inverted
  ; else
    ; Menu, Tray, unCheck, Inverted
  ; if (ShowSampleID = 0)
    ; Menu, Tray, unCheck, showsampleID
  ; else
    ; Menu, Tray, Check, showsampleID
  
  ; TrayMenu.CheckBoxes("showSampleID")
  ; TrayMenu.CheckBoxes("Inverted")
  ; TrayMenu.CheckBoxes("VarbarFollow")
  ; TrayMenu.CheckBoxes("MouseClip")
  ; if (ShowSampleID = 0)
    ; Menu, Tray, unCheck, showsampleID
  ; else
    ; Menu, Tray, Check, showsampleID
  ; if (Follow:= 1)
    ; Menu, Tray, Check, VarbarFollow
  ; else
    ; Menu, Tray, unCheck, VarbarFollow
      if WinExist("Vquest.ahk" ,,"Visual Studio Code")
          winclose,
        
gosub, Starting_test


#IfWinActive,
On:="On"
Off:="Off"
Clear:="Clear"
yo:="yo"
ye:="ye"
Pk:=A_Priorkey
Phk:=A_PriorHotkey
Thk:=A_ThisHotkey
tsThk:=A_TimesinceThisHotkey
tThk:=A_TimesinceThisHotkey
tsPhk:=A_TimesincePriorHotkey
tPhk:=A_TimesincePriorHotkey
;_____
  