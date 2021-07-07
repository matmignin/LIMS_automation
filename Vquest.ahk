gosub, vquest_start

return
Starting_test:
; Test_2()
return
; Lwin::Test_3()

















F13 & Lbutton::F13Click()

F13Click(){
  KeyWait, lbutton, T0.25
    If ErrorLevel
    {
       KeyWait, Lbutton, D
        If !ErrorLevel
          send, ^{click 3}
        exit
    }
    send, ^{Click 2}
    return
}



ReadSpecIntoDataBase:
 iniread, full, data.ini, %Product%,ecc738
 Test_Specs:= strsplit(Full,"=")
 Test:=Test_Specs[1]
 Specs:= strsplit(Test_Specs[2],"|")
 msgbox % "test: " Test "`n`nLabelClaim: " Specs[1] "`nMinLimit: " Specs[2] "`nMaxLimit: " Specs[3] "`nUnits: " Specs[4] "`nPercision: " Specs[5] "`nDescription: " Specs[6] "`nMethod: " Specs[7] "`n" "`nTests: " Tests "`nTest_Specs[2]: " Test_Specs[2]

 LabelClaim[A_index] "|" MinLimit[A_index]"|" MaxLimit[A_index]"|" Units[A_index]"|" Percision[A_index] "|" Description[A_index] "|" Method[A_index]
Return


ctrlEvent(CtrlHwnd, GuiEvent, EventInfo, ErrLevel:=""){

 ;GuiControlGet, OutputVar , , %CtrlHwnd%,
 IniRead,vOutput, Customers.ini, Customers, %OutputVar%
 msgbox, %vOutput%
}


#IfWinActive,

;___________________________________________________________________________

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
Run_CL3:
 Run, cl3.Ahk, lib\CL3
 return
Run_CodeAlt:
 Run, Coding.ahk
return
run_Inverted:
 Menu, Tray, ToggleCheck, Inverted
 If Inverted := !Inverted
  IniWrite, 1, data.ini, Locations, Inverted
 else
  IniWrite, 0, data.ini, Locations, Inverted
 send,{esc}
return
run_Follow:
 Menu, Tray, ToggleCheck, VarbarFollow
 If follow:= !follow
  IniWrite, 1, data.ini, Locations, follow
 else
  IniWrite, 0, data.ini, Locations, follow
Varbar.Follow()
;  send,{esc}
return
Run_Listlines:
 ListLines
return
WindowSpySub:
 Run, WindowSpy.ahk,C:\Program Files\AutoHotkey\
return
ExitSub:
exitapp
return

#IfWinActive,
#include <TrackPad>
#include <KEYS>
#Include <Firefox>
#Include <clip>
#Include <Office>
#Include <LMS>
#Include <OpenApp>
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
#include <Vim>
#include <SaveWindow>
#Include <Snipper>
#include <VScode>


VQuest_Start:
 #Persistent
 #NoEnv
 #SingleInstance,Force
 #KeyHistory 400
 #InstallKeybdHook
 #InstallMouseHook
;  #SingleInstance, Force

; SetTitleMatchMode, Fast		;Fast is default
; DetectHiddenWindows, off	;Off is default
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CrLf=`r`n
FileName:="lib/WinPos.txt"
;  clipboard:=
;  EnvGet, Product, Product
;  EnvGet, Batch, Batch
;  EnvGet, lot, lot
;  EnvGet, Coated, Coated
;  EnvGet, Sample, Sample
;  EnvGet, Iteration, Iteration
 envget, PrevProduct, PrevProduct

AutoTrim, On
 ; #WinActivateForce
 SetWorkingDir, %A_ScriptDir%
 Menu, Tray, Add, CL3, Run_cl3
 Menu, Tray, Add, CodeAlt, Run_CodeAlt
 Menu, Tray, Add, ResetVarbar, Varbar_ResetSub
 Menu, Tray, Add, VarbarFollow, Run_Follow
 menu, tray, add, Inverted, Run_Inverted
 Menu, tray, NoStandard
 ; Menu, tray, Click, 1 ; this will show the tray menu because we send{rbutton} at the DoubleTrayClick label
 Menu, Tray, Add, List Lines, Run_ListLines
 Menu, Tray, Add, windowSpy, WindowSpySub
 Menu, Tray, Add, Exit, ExitSub
 Menu, Tray, Default, windowSpy ;Run_Listlines
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
;#Warn, All, OutputDebug
#Warn UseUnsetLocal, OutputDebug

 SetNumlockState Alwayson
 setcapslockstate alwaysoff
 SetscrolllockState, alwaysOff
 CoordMode, mouse, Window
 SetMouseDelay, 5
 SetDefaultMouseSpeed, 1
 SetTitleMatchMode, 2
 #MaxHotkeysPerInterval 120
;  #HotkeyModifierTimeout 500
 #maxthreadsperhotkey, 1
 SetKeyDelay, 0, 0
 setwindelay,400

 FormatTime, TimeString,, M/d/yy
 Run, cl3.Ahk, lib\CL3
 try
 Menu, Tray, Icon, Robot.ico
Iniread, Iteration, data.ini, SavedVariables, Iteration
Iniread, Batch, data.ini, SavedVariables, Batch
Iniread, Product, data.ini, SavedVariables, Product
Iniread, SampleID, data.ini, SavedVariables, SampleID
Iniread, Lot, data.ini, SavedVariables, Lot
Iniread, Coated, data.ini, SavedVariables, Coated
Iniread, VarBar_Y, data.ini, Locations, VarBar_Y
Iniread, VarBar_X, data.ini, Locations, VarBar_x
Iniread, Inverted, data.ini, Locations, Inverted
Iniread, Follow, data.ini, Locations, Follow
 CopyPasteToggle=0
 Batches:=[]
 Products:=[]
 Lots:=[]
 Excel.Connect(1)
 IfWinExist, ahk_exe WFICA32.EXE
  LMS.Orient()
 if (Inverted = 1)
  Menu, Tray, Check, Inverted
 if (Inverted = 0)
  Menu, Tray, unCheck, Inverted
 if (Follow = 1) {
  Varbar.Follow()
  Menu, Tray, Check, VarbarFollow
 }
 if (Follow = 0)
  Menu, Tray, unCheck, VarbarFollow
gosub, Starting_test
