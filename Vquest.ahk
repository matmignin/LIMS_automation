gosub, vquest_start
  customer:=[]
return


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


TestScriptFillOut:
  WinActivate, Substance ID Registration Verification V.1.0.3.docx - Word ahk_class OpusApp
  Sleep, 333
  Sendinput, {Down}+{Tab}
  sleep 300
  sendinput, ^{c}

  sleep 300
  WinActivate, LMS Workbook.xlsb - Excel ahk_class XLMAIN
  Sleep, 333
  Sendinput, ^{f}
  sleep 200
  WinActivate, Find and Replace ahk_class bosa_sdm_XL9
  Sleep, 333
  Sendinput, ^{v}{Enter}
  sleep 300
  sendinput, {esc}

  Sleep, 333
  Sendinput, {right}
  sleep 200
  sendinput, ^{c}
  WinActivate, Substance ID Registration Verification V.1.0.3.docx - Word ahk_class OpusApp
  Sleep, 333
  Sendinput, {Tab}
  sleep 200
  send, !^{v}
    return
  Test2:
  Autofill_SmartDoc()
    setwindelay, 450
  return


QuickCode(){
  global
  Click, 2
  sleep 100
  WinActivate, Edit Ingredient
  click 357, 340
  send, {home}{space 2}{click 277, 561}
  return
}








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




SmartDocs:
  Autofill_SmartDoc() 
return
  Autofill_SmartDoc(){
    global
    setwindelay, 50
    If Winexist("LMS Actions - \\Remote") {
        WinActivate,
        click 60, 44
        sleep 200
        WinWaitClose, LMS Actions - \\Remote
        return
      }
    else if winexist("Select Iterations - \\Remote"){
      WinActivate, 
        Rotation_GetTable()
      WinWaitClose, Select Iterations - \\Remote
        return
    }
    else If Winexist("New Document - \\Remote") {
      WinActivate,   
      sleep 200                    
      send, {tab 6}{right 5}{tab 4}%Product%{tab 2}{enter}
      sleep 400
      WinActivate, NuGenesis LMS - \\Remote
      sleep 400
      click, 525, 100 ;edit section
      sleep 200			
      return				 
    }
      else If Winexist("Select Product - \\Remote"){
        WinActivate,
        click 105, 62 ;select Formulation search
      sendinput, %product%{enter 2}
      WinWaitClose, Select Product - \\Remote
      return
      }
      else if winactive("Release: Rotational Testing Schedule - \\Remote")
      autofill()
      else if winactive("Sign : 210421_Rotation_0007 - \\Remote")
        AutoFill()
      else if winactive("Release:"){
        AutoFill()
        SetTimer, SmartDocs, off
        exit
      }  
      else
        return
  }


TestSpecCopying:
  ; ToggleFilter_Test()
  ; FilterSearch_Test("Vitamin C","221")
  ; CopyResults_Test()
  ; ParseResultSpecs()
  ;   ; FilterSearch_Test()
  ; 	coordmode, tooltip, Screen
  ;   tooltip, Low: %LowerLimit% `t High: %UpperLimit% `t Unit: %Unit% `t %Precision% `n `t %Requirement%, 1500, 0
  ; ; msgbox, %product% `t %batch% `n %lot%
return
 
ctrlEvent(CtrlHwnd, GuiEvent, EventInfo, ErrLevel:="") {
  
  ;GuiControlGet, OutputVar , , %CtrlHwnd%,
  IniRead,vOutput, Customers.ini, Customers, %OutputVar%
  msgbox, %vOutput%
  }




ToggleFilter_Test(){
  WinActivate, NuGenesis LMS - \\Remote
  click 489, 836, R
  sendinput, {down 2}{enter}
}

FilterSearch_Test(TestName:="", MethodName:=""){
  WinActivate, NuGenesis LMS - \\Remote
  click 1230, 648 ;click name filterbox
  send, ^a%TestName%{enter}
  click 1067, 647 ; click method ID Filterbox
  send, ^a%MethodName%{enter}{tab 4}
}

return





  SendPassword(){
    if winactive, Remote Desktop
    sendinput, ?+{K}ilgore7744{enter}
      else
    sendinput, +{K}ilgore7744{enter}
    return
  }


#IfWinActive,

; Sendlevel 1
  ;Rbutton & F18::send, {F21}
  ; Rbutton & F13::sendinput, {F21}
; Xbutton1 & Xbutton2::
Xbutton2 & Xbutton1::send, {Ctrldown}{Altdown}{tab}{CtrlUp}{AltUp}
  ; Rbutton & F17::F21
 ; F19::Return ;send, {F21}


KEY_DEFAULT:

<^;::sendinput, %Timestring%{space} 
^tab::Test()
  Xbutton1 & F18::Clip("OCR") 
  Mbutton & Xbutton1::SendPassword()
  !f::Open_Firefox()
  !v::Open_vsCode()
  Capslock & `::QuickCode()
  Mbutton::send, {Rctrl down}
  ~$mbutton up::
  ; sendlevel 1
  sendinput, {Rctrl up}{Lctrl up}{Alt Up}{Shift Up}
  ; sendlevel 0
  return
  Mbutton & Lbutton::sendinput, {CtrlDown}{Lbutton}{CtrlUp}
  Mbutton & WheelDown::sendinput, {ctrldown}{WheelDown}{CtrlUp}
  Mbutton & Wheelup::sendinput, {ctrldown}{Wheelup}{CtrlUp}

  Mbutton & F17::Wheel_Right()
  Mbutton & F16::Wheel_left()
  Rbutton & Wheelup::Wheel_cut() 
  Rbutton & Wheeldown::Wheel_paste()
  Rbutton & Xbutton2::Get_WindowInfo()
  Rbutton & F16::Backspace
  Rbutton & Lbutton::Enter
  Rbutton up::Mouse_RbuttonUP()


  Xbutton1 & LButton::Sendinput, {shiftdown}{ctrldown}4{CtrlUp}{shiftup} ;screenshot"
  Xbutton1 & RButton::Sendinput,  {shiftdown}{ctrldown}3{CtrlUp}{shiftup};screenshot"
  Xbutton1 & WheelUp::Wheel(Product)
  Xbutton1 & WheelDown::Wheel(Batch)
  Xbutton1 & wheelleft::Excel.PreviousSheet()
  Xbutton1 & wheelright::Excel.NextSheet()
  Xbutton1 & F17::Excel.NextSheet()
  Xbutton1 & F16::Excel.PreviousSheet()
  ; Xbutton2 & Rbutton::Get_WindowInfo()
  Xbutton1::Clip()
  Xbutton1 & Mbutton::Varbar.reset()
  Xbutton2 & wheelDown::Mouse_CloseWindow()
  ; F18 & Wheelup::!^tab
  ; Xbutton2 & Lbutton::Sendinput, #{down}
  ; Xbutton2::Menu.Show()
  ; F18 & Wheeldown::+^!tab
  F18 & Lbutton::sendinput, {Ctrldown}{Click}{CtrlUp}
  F18 & Rbutton::sendinput, {shiftdown}{Click}{shiftup}
  F18 & F17::
  F18 & F16::
  F19 & Space::Sendinput, %Product%{enter}
  F20 & Space::Sendinput, %batch%{enter}

;  F20 & Right::send, #{right}
;   F20 & Left::send, #{Left}
;   F20 & UP::send, #{UP}
;   F20 & Down::send, #{Down}

  F19 & f20::WinActivate, ahk_exe WFICA32.EXE
  F20 & f19::WinActivate, ahk_exe WFICA32.EXE
  enter::enter
capslock::esc

; #If (A_PriorHotKey = "F18" AND A_TimeSincePriorHotkey < 2000) ;____F18____
  ; f18::ReloadScript()
  ; Wheelup::test()
  ; Wheeldown::send, {esc}
  ; F16::sendinput, {Click 354, 44}
  ; F17::sendinput, {click, 743, 41}
  ; Lbutton::sendinput, ^{click}
  ; Rbutton::sendinput, +{click}
  ; mbutton::Clip()
  ; #If
  ; F18::Autofill() ;Tooltip("☩",2000) 

  Xbutton2::
  sleep 200
  Menu()
  return
  ; sleep 200
  ; If (A_ThisHotKey = "Xbutton2" AND A_PriorHotkey != "Lbutton")
  ;   Menu()
  ;   return
  ;   else

; UMDelay= 40 ;holding time
; ~Xbutton2::
; HowLong = 0
; Loop
; 	{
; 		Sleep, 10
; 	}
; 		HowLong ++
; 		GetKeyState, ContextKey, Xbutton2, U
; 		IfEqual, ContextKey, U, Break
; IfLess, HowLong, %UMDelay%, Return
; Menu.Show()
  Return
#If (A_PriorHotKey = "Xbutton2" AND A_TimeSincePriorHotkey < 200)
    ; Browser_forward::#right
    ; Browser_back::#left
    ; Media_Next::sendinput, #{up}
    Wheeldown::tooltip(A_ThisHotkey)
    wheelleft::tooltip(A_ThisHotkey)
    wheelright::tooltip(A_ThisHotkey)
    Lbutton::tooltip(A_ThisHotkey)
    Rbutton::tooltip(A_ThisHotkey)
    Mbutton::
    Xbutton2::return
    Wheelup::
    try menu, menu, deleteAll
    menu,Menu,add,Test_&1,Tests
    menu,Menu,add,Test_&2,Tests
    Menu, Menu, Show,
    return
    ; mbutton::tooltip(A_ThisHotkey)
    Xbutton1::tooltip(A_ThisHotkey)

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
#Include <Firefox>
#Include <Office>
#Include <explorer>
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
#include <TrackPad>
#include <test>
#include <Vim>
#include <VScode>
; #include <CL3/cl3>




VQuest_Start:
  #Persistent 
  #NoEnv
  #SingleInstance,Force
  #KeyHistory 400
  
  ; #WinActivateForce
  SetWorkingDir, %A_ScriptDir%
  ; Menu, Tray, Add, CL3, Run_cl3
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
  SetBatchLines, 20ms
  Setnumlockstate Alwayson
  setCapslockstate alwaysoff
  SetscrolllockState, alwaysOff
  	CoordMode, mouse, Window
        UMDelay= 40 ;holding time
    ;SetMouseDelay, 25
  SetDefaultMouseSpeed, 1
  ; detecthiddenwindows, on
  SetTitleMatchMode, 2
  ; settitlematchmode, Slow
 #MaxHotkeysPerInterval 40
 #HotkeyModifierTimeout 100
  #maxthreadsperhotkey, 2
   SetKeyDelay, 0, 0
  setwindelay,500
  send, {CtrlUp}{AltUp}{shiftup}{LWinUp}
  AutoTrim, On
  FormatTime, TimeString,, d/M/yy 
  Menu, Tray, Icon, Robot.ico
    Iniread, FilterBox_X, data.ini, Locations, FilterBox_X
    Iniread, FilterBox_Y, data.ini, Locations, FilterBox_Y
  Iniread, Iteration, data.ini, SavedVariables, Iteration
  Iniread, VarBar_X, data.ini, Locations, VarBar_x
  Iniread, VarBar_Y, data.ini, Locations, VarBar_Y
  Iniread, Testing, data.ini, Locations, Testing
  Excel.Connect(1)
  if (testing = 1)
    Menu, Tray, Check, Testing
  if (testing = 0)
    Menu, Tray, unCheck, Testing
  
  StartTest()
  



