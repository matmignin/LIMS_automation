gosub, vquest_start

return
; OnClipboardChange:
; ToolTip(Clipboard,3000,0,0,3)
; cProduct:=
; cBatch:=
; cLot:=
; RegExMatch(Clipboard, "\b[ADEFGLHKJIadefglhkji]\d{3}\b", cProduct)
; RegExMatch(Clipboard, "\b\d{3}-\d{4}\b", cBatch)
; RegExMatch(Clipboard, "(\b\d{4}\w\d\w?|\bBulk\b)", clot)
; Sleep 100
; if cProduct || cBatch || cLot 
;   tooltip(cProduct "`n" cBatch "`n" clot,1500,,,3)
; If cProduct
; GuiControl,Varbar:Text, Product, %cProduct%
; If cBatch
;   GuiControl,Varbar:Text, Batch, %cBatch%
; If cLot
;   GuiControl,Varbar:Text, lot, %clot%
return
















blockRepeat(time=200){
	SetTimer, BlockInput, -%time%
	return
}

BlockInput:
	N=0
	return

MouseSave(){
  Global
  MouseGetPos, mx, my, mw,
  MouseReturn:="{click " Mx ", " My ",0}"
  PrevY:=My-26
  NextY:=My+26
  Next:="{click " Mx ", " NextY ",0}"
  Prev:="{click " Mx ", " PrevY ",0}"
  return 
  }





Ingredients() {
  global
    IniRead,vSelect, Ingredients.ini, Ingredients, %vIngredient%
    ; Loop, Read, Ingredients.ini
  ; {
    ; If A_Index = 1
      ; Continue
    ; Ingredients := StrSplit(A_LoopReadLine, "=") 
    ; Selection:= % Ingredient[1]
    ; Menu, Ingredientmenu, add, %Selection%, Ingredients
  ; }
    msgbox % vSelect
  ConvertIngredientSelection(vSelect)
  return


  }	
ConvertIngredientSelection(IngredientSelection){
  
  sleep 140
  AbsSelection:=Abs(IngredientSelection)-1
  if (IngredientSelection > 0)
    msgbox, %ingredientSelection% ; sendinput, {home}{right %IngredientSelection%}
  if (IngredientSelection < 0)
    msgbox, %AbsSelection% ;Sendinput, {tab}{end}{left %Absselection%}
  sleep 300
  ; send, {enter}
    return
}


ReadSpecIntoDataBase:
  iniread, full, data.ini, %Product%,
  Test_Specs:= strsplit(Full,"=")
  Test:=Test_Specs[1]
  Specs:= strsplit(Test_Specs[2],"|")
  msgbox % "test: " Test "`n`nLabelClaim: " Specs[1] "`nMinLimit: " Specs[2] "`nMaxLimit: " Specs[3] "`nUnits: " Specs[4] "`nPercision: " Specs[5] "`nDescription: " Specs[6] "`nMethod: " Specs[7] "`n" "`nTests: " Tests "`nTest_Specs[2]: " Test_Specs[2]

  LabelClaim[A_index] "|" MinLimit[A_index]"|" MaxLimit[A_index]"|" Units[A_index]"|" Percision[A_index] "|" Description[A_index] "|" Method[A_index]
  Return  












CheckActive:
  If WinActive("NuGenesis LMS - \\Remote") ;|| Winactive("ahk_exe EXCEL.EXE") || winactive("ahk_exe OUTLOOK.EXE") || winactive("ahk_exe Code.exe") 
  ; If WinActive("ahk_exe WFICA32.EXE") ;|| Winactive("ahk_exe EXCEL.EXE") || winactive("ahk_exe OUTLOOK.EXE") || winactive("ahk_exe Code.exe") 
  {
    Varbar.Follow()
    return
    }
  Else if WinActive("VarBar ahk_class AutoHotkeyGUI")
    exit
  else
  return
    ; WinMove, VarBar ahk_class AutoHotkeyGUI,, %VarBar_X%, %VarBar_Y%
  Return







ctrlEvent(CtrlHwnd, GuiEvent, EventInfo, ErrLevel:="") {
  
  ;GuiControlGet, OutputVar , , %CtrlHwnd%,
  IniRead,vOutput, Customers.ini, Customers, %OutputVar%
  msgbox, %vOutput%
  }


FlashScreen(){
  send, #^{c}
  sleep 20
  send, #^{c}
  return
}


#if winactive("Remote Desktop") || WinExist("Login - \\Remote") || Winexist("Sign :") || winexist("Windows Security") || winexist("CredentialUIBroker.exe")
  Mbutton::Sendpassword()
  #if



  SendPassword(){
    if winactive("Remote Desktop")
      sendinput, ?+{K}ilgore7744{enter}
    if WinExist("ahk_exe ONENOTE.EXE Protected Section") {
      winactivate
      sendinput, +{K}ilgore7744{enter}
      }
    if WinExist("Login - \\Remote") {
      winactivate
      sendinput, mmignin{tab}+{K}ilgore7744{enter}
      }
    Else If Winexist("Sign :") {
      winactivate,
      sendinput, {tab 2}{right 2}{tab 2}mmignin{tab}Kilgore7744{enter}
      }
    else if winexist("Windows Security") {
      winactivate,
      sendinput, Kilgore7744{enter}
    }
    else if winexist("CredentialUIBroker.exe") {
      winactivate,
      sendinput, Kilgore7744{enter}
    }
    else
      sendinput, +{K}ilgore7744{enter}
    return
  }

  CreditCard(){
      sendinput, 4130220009588038
      ToolTip("11/21  127",5000)
      return
    }
#IfWinActive,



  

  
  
;___________________________________________________________________________





WindowNames() {
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
run_Inverted:
Menu, Tray, ToggleCheck, Inverted
  If Inverted := !Inverted
    IniWrite, 1, data.ini, Locations, Inverted
  else 
    IniWrite, 0, data.ini, Locations, Inverted
    send, {esc}
  return
run_Follow:
Menu, Tray, ToggleCheck, VarbarFollow
    If  follow:= !follow
      IniWrite, 1, data.ini, Locations, follow
     else 
      IniWrite, 0, data.ini, Locations, follow
      send, {esc}
    return
;Divider_Location:
;     KeyWait, Lbutton, D
;     ; KeyWait, Lbutton, D,
;     CoordMode, mouse, window
;     sleep 200
;     MouseGetPos, xDivider, yDivider,
;   	IniWrite, %xDivider%, data.ini, Locations, xDivider
;   	IniWrite, %yDivider%, data.ini, Locations, yDivider
;     DividerLocation:=xDivider ", " yDivider
;     tooltip(DividerLocation)
;     MouseClick, Right,,,1, 0, U
;     return
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
#Include <Office>
#Include <LMS>
#Include <explorer>
#Include <clip>
#Include <Snipper>
#Include <OpenApp>
#Include <AutoFill>
#include <varBar>
#include <ProductTab>
#include <WorkTab>
#include <SpecTab>
#include <Rotation>
#include <Excel>
#include <vis2>
#include <wheel>
#include <mouse>
#include <click>
#include <test>
#include <Vim>  
#include <VScode>



VQuest_Start:
  #Persistent 
  #NoEnv
  #SingleInstance,Force
  #KeyHistory 400
  #InstallKeybdHook
  #InstallMouseHook
clipboard:=
EnvGet, Product, Product
EnvGet, Batch, Batch
EnvGet, lot, lot
EnvGet, Coated, Coated
EnvGet, Sample, Sample
EnvGet, Iteration, Iteration

; iteration=1
envget, PrevProduct, PrevProduct
trackpadhints=
(
  ___________________[3]________________________
  Tap `t mbutton
  up `t F8 `t (thumb mouse)
  down `t f9
  left `t f6 `t (wheel left)
  right `t f7 `t (wheel_right)
  __________________[4]_________________________
  tap `t F10
  up `t Media_Prev
  down `t Media_Next
  left `t browser back   `t`t (xbutton2)
  right `t browswer forward `t (xbutton1)
  _____________[Window Names]____________________
  ahk_exe WFICA32.EXE				
  NuGenesis LMS - \\Remote 
)
  ; #WinActivateForce
  SetWorkingDir, %A_ScriptDir%
  Menu, Tray, Add, CL3, Run_cl3
  Menu, Tray, Add, ResetVarbar, Varbar_ResetSub
  Menu, Tray, Add, VarbarFollow, Run_Follow
  ; menu, tray, add, Display settings, DoubleTrayClick
  menu, tray, add, Inverted, Run_Inverted
  ; Menu, Tray, Add, Set Divider Location, Divider_Location
  Menu, tray, NoStandard
; Menu, tray, Click, 1 ; this will show the tray menu because we send {rbutton} at the DoubleTrayClick label
;Menu, tray, Default, &Settings
  Menu, Tray, Add, List Lines, Run_ListLines
  Menu, Tray, Add, windowSpy, WindowSpySub 
  Menu, Tray, Add, Exit, ExitSub 
  Menu, Tray, Default, VarbarFollow ;Run_Listlines
  ;SetBatchLines, 30ms
  Setnumlockstate Alwayson
  setCapslockstate alwaysoff
  SetscrolllockState, alwaysOff
  CoordMode, mouse, Window

  SetMouseDelay, 5
  SetDefaultMouseSpeed, 1
  ; detecthiddenwindows, on
  SetTitleMatchMode, 2
  
  ; settitlematchmode, Slow
 #MaxHotkeysPerInterval 900
 #HotkeyModifierTimeout 10
  #maxthreadsperhotkey, 1
   SetKeyDelay, 0, 0
  setwindelay,400
  ; sendinput, {CtrlUp}{AltUp}{shiftup}{LWinUp}
  ;AutoTrim, off
  LMSMain:="NuGenesis LMS - \\Remote"
  LMSWindow:="ahk_exe WFICA32.EXE"
  FormatTime, TimeString,, M/d/yy
  Run, cl3.Ahk, lib\CL3
  try 
    Menu, Tray, Icon, Robot.ico
  ; Iniread, xDivider, data.ini, Locations, xDivider
  ; Iniread, yDivider, data.ini, Locations, yDivider
  Iniread, Iteration, data.ini, SavedVariables, Iteration
  Iniread, VarBar_Y, data.ini, Locations, VarBar_Y
  Iniread, VarBar_X, data.ini, Locations, VarBar_x
  Iniread, Inverted, data.ini, Locations, Inverted

  Batches:=[]
  Products:=[]
  Lots:=[]
  Excel.Connect(1)
    ; LMS.OrientBoxes()
  ControlsetText, Static5,1,VarBar
  if (Inverted = 1)
    Menu, Tray, Check, Inverted
  if (Inverted = 0)
    Menu, Tray, unCheck, Inverted
  if (Follow = 1)
  {
    Menu, Tray, Check, VarbarFollow
    Varbar.Follow()
  }
  if (Follow = 0)
    Menu, Tray, unCheck, VarbarFollow
  
  StartTest_1()
  



