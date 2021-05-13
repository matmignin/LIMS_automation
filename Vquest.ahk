gosub, vquest_start
; MouseReturn:= "{click " My ", " My ",0}"
  ; customer:=[]
return

<<<<<<< HEAD
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
return 
}

F19 & Capslock::Test_2()
return
DetectTab(){
global
Tab:=
CoordMode, Pixel, Window
WinActivate, NuGenesis LMS - \\Remote
  PixelSearch, FoundX, FoundY, 11, 66, 15, 72, 0xF8FBFE, 10, Fast RGB 
      If ErrorLevel  ;Product/Spec Tab?
        Tab="Product_Spec"
      If ErrorLevel = 0 ;is worktab?
        {
          PixelSearch, FoundX, FoundY, 11, 139, 15, 141, 0x54c7f2, 10, Fast RGB ;icon on left
          If ErrorLevel
            Tab:="Sample" 
          If ErrorLevel = 0
          {
            PixelSearch, FoundX, FoundY, 18, 142, 19, 143, 0xffffff, 10, Fast RGB ;icon on left
            If ErrorLevel = 0
              Tab:="Documents"
            If ErrorLevel
            Tab:="Request" 
          }        
        }
    msgbox, %Tab%
  return
}

F19 & Capslock::Test1()
F20 & Capslock::Test_2()



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
  If WinActive("NuGenesis LMS - \\Remote") || Winactive("ahk_exe EXCEL.EXE") || winactive("ahk_exe OUTLOOK.EXE") || winactive("ahk_exe Code.exe") 
  {
    varbar.move()
    return
    }
  Else if WinActive("VarBar ahk_class AutoHotkeyGUI")
    exit
  else
    WinMove, VarBar ahk_class AutoHotkeyGUI,, 1500, 0
  Return







 
ctrlEvent(CtrlHwnd, GuiEvent, EventInfo, ErrLevel:="") {
  
  ;GuiControlGet, OutputVar , , %CtrlHwnd%,
  IniRead,vOutput, Customers.ini, Customers, %OutputVar%
  msgbox, %vOutput%
  }









  SendPassword(){
    if winactive, Remote Desktop
    sendinput, ?+{K}ilgore7744{enter}
      else
    sendinput, +{K}ilgore7744{enter}
    return
  }


#IfWinActive,

; Sendlevel 1
  ;Rbutton & F8::send, {F21}
  Rbutton & F13::sendinput, {F21}
; Xbutton1 & Xbutton2::
Xbutton2 & Xbutton1::send, {Ctrldown}{Altdown}{tab}{CtrlUp}{AltUp}
  ; Rbutton & F7::F21
 ; F19::Return ;send, {F21}


KEY_DEFAULT:

<^;::sendinput, %Timestring%{space} 
; ^tab::Test()
  !f::Open_Firefox()
  !v::Open_vsCode()
  Capslock & `::QuickCode()
  Mbutton & Xbutton1::SendPassword()
  $Mbutton::send, {ctrl down}
  $mbutton up::
  sendlevel 1
  sendinput, {Rctrl up}{Lctrl up}{Alt Up}{Shift Up}
  sendlevel 0
  return
  Mbutton & Lbutton::sendinput, {CtrlDown}{Lbutton}{CtrlUp}
  Mbutton & WheelDown::sendinput, {ctrldown}{WheelDown}{CtrlUp}
  Mbutton & Wheelup::sendinput, {ctrldown}{Wheelup}{CtrlUp}
#if
  Mbutton & F7::Wheel_Right()
  Mbutton & F6::Wheel_left()
  Rbutton & Wheelup::Wheel_cut() 
  Rbutton & Wheeldown::Wheel_paste()
  Rbutton & Xbutton2::Get_WindowInfo()
  Rbutton & F6::Backspace
  ;Rbutton & Lbutton::Enter
  ;Rbutton up::Mouse_RbuttonUP()
 

  Xbutton1 & F8::Clip("OCR") 
  Xbutton1 & LButton::Sendinput, {shiftdown}{ctrldown}4{CtrlUp}{shiftup} ;screenshot"
  Xbutton1 & RButton::Sendinput,  {shiftdown}{ctrldown}3{CtrlUp}{shiftup};screenshot"
  Xbutton1 & WheelUp::Wheel(Product)
  Xbutton1 & WheelDown::Wheel(Batch)
  Xbutton1 & wheelleft::Excel.PreviousSheet()
  Xbutton1 & wheelright::Excel.NextSheet()
  Xbutton1 & F7::Excel.NextSheet()
  Xbutton1 & F6::Excel.PreviousSheet()
  ; Xbutton2 & Rbutton::Get_WindowInfo()
  Xbutton1 & Mbutton::Varbar.reset()
  Xbutton2 & wheelDown::Mouse_CloseWindow()
  ; F8 & Wheelup::!^tab
  ; Xbutton2 & Lbutton::Sendinput, #{down}
  ; Xbutton2::Menu.Show()
  ; F8 & Wheeldown::+^!tab
  F8 & Lbutton::sendinput, {Ctrldown}{Click}{CtrlUp}
  F8 & Rbutton::sendinput, {shiftdown}{Click}{shiftup}
  F8 & F7::
  F8 & F6::
  F19 & Space::Sendinput, %Product%{enter}
  F20 & Space::Sendinput, %batch%{enter}
F19::Menu()
 F20 & Right::send, #{right}
  F20 & Left::send, #{Left}
  F20 & UP::send, #{UP}
  F20 & Down::send, #{Down}

  F19 & f20::WinActivate, ahk_exe WFICA32.EXE
  F20 & f19::WinActivate, ahk_exe WFICA32.EXE
  ; enter::enter
; capslock::esc

!c::open_Clickup()
!e::send, {LWinDown}{e}{lwinup}
!+v::open_VPN()
Xbutton2::Menu()
Xbutton1::Clip()


    #If


  

  
  
;___________________________________________________________________________




  
Methods() {
  global
  ; Mouse_Click("searchBar_SelectMethodsTest")
  WinActivate, Select methods tests - \\Remote
  click, 229, 72,2
  send, ^a
  Loop, Read, Methods.ini
{
  If A_Index = 1
    Continue
  Method := StrSplit(A_LoopReadLine, "=") 
  ; MethodGroup := StrSplit(A_LoopReadLine, "|") 
  Selection:= % Method[1]
  ; Group:= % MethodGroup[2]
  Menu, Methodmenu, add, %Selection%, Methods
}
   Menu, MethodMenu, Show,
return

Methods:
sleep 200
InputVar:=A_ThisMenuItem
  IniRead,vOutput, Methods.ini, Methods, %InputVar%
  Sendinput, %vOutput%{enter}
   sleep 300
   click 506, 341
   Methods() 
return
}	





KEY_Otherstuff:


  Volume_Down::F11
  Volume_Up::F12
 ; #right::tooltip(A_ThisHotkey)
  ;^+!down::tooltip(A_ThisHotkey)













Open_in_Notepad(){
    click
    WinGetClass class, % " ahk_id " WinExist("A")
    for Window in ComObjCreate("Shell.Application").Windows 
      Selection := Window.Document.SelectedItems
    for Items in Selection
      Path_to_Selection := Items.path		
    Run C:\Windows\system32\Notepad.exe %Path_to_Selection%
  }

Snip_groupChange(){
  Wheel("{ctrl down}22{Ctrl up}")
  tooltip("Snip Group Changed",2000)
  return
  }


LMS_Search(){
  Global
  clipboard:=""
  send, ^c
  sleep 200
  ;ClipWait, 1,
  ; Clipboard := Trim((Clipboard, "`r`n"))
  Clip()
  WinActivate, NuGenesis LMS - \\Remote
  click 783, 45
  sleep 200
SearchBar("Batch")
  ; click, 500,127, 2 ;click search bar
  sleep 200
  ; Send, %clipboard%{enter}
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
run_testing:
Menu, Tray, ToggleCheck, Testing
    If Testing := !Testing
      IniWrite, 1, data.ini, Locations, Testing
     else 
      IniWrite, 0, data.ini, Locations, Testing
      send, {esc}
return
FilterBox_Location:
    KeyWait, Lbutton, D
    sleep 200
    ; KeyWait, Lbutton, D
    CoordMode, mouse, window
    MouseGetPos, FilterBox_X, FilterBox_Y,
  	IniWrite, %FilterBox_X%, data.ini, Locations, FilterBox_X
  	IniWrite, %FilterBox_Y%, data.ini, Locations, FilterBox_Y
    FilterBoxLocation:=FilterBox_X ", " FilterBox_Y
    tooltip(FilterBoxLocation)
    MouseClick, Right,,,1, 0, U
    return
run_VIM:
  Run, ViM.Ahk
  return
WindowSpySub: 
  Run, WindowSpy.ahk,C:\Program Files\AutoHotkey\
  return
  
#IfWinActive,
#include <TrackPad>
#Include <Firefox>
#Include <Office>
#Include <explorer>
#Include, <clip>
#Include <LMS>
#Include <Snipper>
#Include <Other>
#Include <AutoFill>
#include <varBar>
#include <ProductTab>
#include <WorkTab>
#include <SpecTab>
#include <Rotation>
#include <Excel>
#include <vis2>
#include <SearchBar>
#include <wheel>
#include <mouse>
#include <click>
#include <test>
#include <Vim>  
#include <VScode>
;#include <CL3/cl3>



VQuest_Start:
  #Persistent 
  #NoEnv
  #SingleInstance,Force
  #KeyHistory 400
  #InstallKeybdHook
  #InstallMouseHook

EnvGet, Product, Product
EnvGet, Batch, Batch
EnvGet, lot, lot



  ; #WinActivateForce
  SetWorkingDir, %A_ScriptDir%
  Menu, Tray, Add, CL3, Run_cl3
  Menu, Tray, Add, ResetVarbar, Varbar_ResetSub
  ; menu, tray, add, Display settings, DoubleTrayClick
  menu, tray, add, Testing, Run_Testing
  Menu, Tray, Add, Set FilterBox Location, Filterbox_Location
  ; Menu, tray, NoStandard
; Menu, tray, Click, 1 ; this will show the tray menu because we send {rbutton} at the DoubleTrayClick label
;Menu, tray, Default, &Settings
  ; Menu, Tray, Add, Vim, Run_Vim
  Menu, Tray, Add, windowSpy, WindowSpySub 
  Menu, Tray, Default, ResetVarbar
  ; SetBatchLines, 0ms
  Setnumlockstate Alwayson
  setCapslockstate alwaysoff
  SetscrolllockState, alwaysOff
  	CoordMode, mouse, Window

    SetMouseDelay, 5
  SetDefaultMouseSpeed, 1
  ; detecthiddenwindows, on
  SetTitleMatchMode, 2
  ; settitlematchmode, Slow
 #MaxHotkeysPerInterval 400
 #HotkeyModifierTimeout 10
  #maxthreadsperhotkey, 3
   SetKeyDelay, 0, 0
  setwindelay,500
  send, {CtrlUp}{AltUp}{shiftup}{LWinUp}
  AutoTrim, On
  Main:="NuGenesis LMS - \\Remote"
  FormatTime, TimeString,, d/M/yy 
  Menu, Tray, Icon, Robot.ico
    Iniread, FilterBox_X, data.ini, Locations, FilterBox_X
    Iniread, FilterBox_Y, data.ini, Locations, FilterBox_Y
  Iniread, Iteration, data.ini, SavedVariables, Iteration
  Iniread, VarBar_X, data.ini, Locations, VarBar_x
  Iniread, VarBar_Y, data.ini, Locations, VarBar_Y
  Iniread, Testing, data.ini, Locations, Testing
  Batches:=[]
  Products:=[]
  Lots:=[]
  Excel.Connect(1)
  if (testing = 1)
    Menu, Tray, Check, Testing
  if (testing = 0)
    Menu, Tray, unCheck, Testing
  
  StartTest()
  



