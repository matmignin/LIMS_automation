gosub, vquest_start
  customer:=[]



; SetTimer, CheckActive, 100
settimer, checkactive, off

return


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


return



Test(n:=0){
  Global
  ; Gosub, TestSpeccopying
  gosub, Test1
  return
}
Test1:
Spec_SelectRow()

Return  

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

  
ctrlEvent(CtrlHwnd, GuiEvent, EventInfo, ErrLevel:="")
{
  
  ;GuiControlGet, OutputVar , , %CtrlHwnd%,
  IniRead,vOutput, Customers.ini, Customers, %OutputVar%
msgbox, %vOutput%
}

CopyResults_Test(){
  global
  WinActivate, NuGenesis LMS - \\Remote
    click 57, 750 ; edit results
    WinWaitActive, Results Definition - \\Remote
    click 282, 121 ; click row
      sleep 100
  ; SendLevel, 1
  send, ^c
  sleep 200
  ; clipwait, 1
  if ErrorLevel
    msgbox, yo
  sendlevel,0
  sleep 200
  send, {esc}
}

ParseResultSpecs(){
  global
  ParsedSpecs:=[]
  Loop, parse, Clipboard, `t 
  ParsedSpecs.insert(A_LoopField)
  MinLimit:=Parsedspecs[17]
  MaxLimit:=Parsedspecs[18]
  Precision:=Parsedspecs[19]
  Requirement:=Parsedspecs[20]
  Units:=Parsedspecs[21]
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

Click_SearchBox(){
  Global
WinActivate, NuGenesis LMS - \\Remote
; Sleep, 200
CoordMode, Pixel, Window
PixelSearch, FoundX, FoundY, 11, 66, 15, 72, 0xF8FBFE, 10, Fast RGB
If ErrorLevel = 0
  Click,556, 127,2 ;samples tab
If ErrorLevel
  click,591,90,2 ;Product/Specifications bar
; send, ^a


return
}





#IfWinActive,
  F14 & F13::wheel("^!{tab}")

Sendlevel 1
  Rbutton & Mbutton::send, {F21}
  F13 & F14::sendinput, {CtrlDown}{F21}{CtrlUp}
  Rbutton & F17::F21
 ; F19::Return ;send, {F21}
  Sendlevel 0

KEY_DEFAULT:
!f::
ifwinexist, ahk_exe firefox.exe
WinActivate, ahk_exe firefox.exe
else 
run, Firefox.exe, "C:\Program Files\Mozilla Firefox\" 
return
Return & K::Enter_Product("K")
Return & 0::Enter_Batch()
  Mbutton & WheelDown::Wheel("^{WheelDown}") 
  Mbutton & Wheelup::Wheel("^{WheelUp}") 
  Mbutton & F17::Wheel_Right()
  Mbutton & F16::Wheel_left()
  Mbutton::Mbutton
  Rbutton & Wheelup::Wheel_cut() 
  Rbutton & Wheeldown::Wheel_paste()
  Rbutton & F14::Get_WindowInfo()
  Rbutton & F16::Backspace
  Rbutton & Lbutton::Enter
  Rbutton up::Mouse_RbuttonUP()
  F13 & LButton::Sendinput, +^4 ;screenshot"
  F13 & RButton::Sendinput, +^3 ;screenshot"
  F13 & Mbutton::Clip("OCR") 
  F13 & WheelUp::Varbar.Sendinput("Product")
  F13 & WheelDown::Varbar.Sendinput("Batch")
  F13 & wheelleft::Excel.PreviousSheet()
  F13 & wheelright::Excel.NextSheet()
  F13 & F17::Excel.NextSheet()
  F13 & F16::Excel.PreviousSheet()
  ; F14 & Rbutton::Get_WindowInfo()
  F13::Clip()
  F13 & F18::Varbar.reset()
  F14 & wheelDown::Mouse_CloseWindow()
  F18 & Wheelup::!^tab
  F14 & Lbutton::Sendinput, #{down}
  
  F14::Menu()
  ; F18 & Wheelup::sendinput, {F15}
  F18 & Lbutton::sendinput, ^{Click}
  F18 & Rbutton::sendinput, +{Click}
  F18 & Mbutton::^a
  F18 & F17::sendinput, !^{tab}
  F18 & F16::sendinput, !^{+tab}
enter::enter

#If (A_PriorHotKey = "F18" AND A_TimeSincePriorHotkey < 2000) ;____F18____
  f18::ReloadScript()
  Wheelup::test()
  Wheeldown::send, {esc}
  F16::sendinput, {Click 354, 44}
  F17::sendinput, {click, 743, 41}
  Lbutton::sendinput, ^{click}
  Rbutton::sendinput, +{click}
  mbutton::Clip()
  #If
  F18::Autofill() ;Tooltip("☩",2000) 








KEY_Varbar:
  #If Mouse_IsOver("VarBar ahk_class AutoHotkeyGUI") 
  wheelleft::Excel.PreviousSheet()
  wheelRight::excel.Nextsheet()
  WheelUp::Varbar.AddIteration()
  wheeldown::excel.previoussheet()
  F17::Excel.NextSheet()
  F16::excel.previoussheet()
  Rbutton::Excel.connect()
  Mbutton & WheelDown::varbar.Move()
  mbutton::
    if WinExist("Result Editor - \\Remote") || WinExist("Test Definition Editor - \\Remote") || winexist("Results Definition - \\Remote")
      SpecTab_Table()
    else
      ProductTab_Table()
  return
  #if
  
  
  
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
  
  
  
;___________________________________________________________________________
KEY_LMS:
  #Ifwinactive, NuGenesis LMS - \\Remote 
  F20::Mouse_Click("SearchBar_Batch") 
  F14 & WheelRight:: sendinput, {click, 743, 41}
  F14 & WheelLeft::sendinput, {Click 354, 44}
  F17::click 78, 750
  F14 & WheelUp::Test()
  F14 & wheeldown::Varbar.SubIteration()
  F13 & WheelUp::Varbar.Sendinput("Product")
  F13 & WheelDown::Varbar.Sendinput("Batch")
  Mbutton::Excel.Connect()
  Enter::Sendinput, ^a^c{enter}
  #IfWinActive
  ;select methods
  #Ifwinactive, Select methods tests - \\Remote
  F19 & space::AutoFill()
  F17::Methods()
#IfWinActive, Results Definition - \\Remote
wheelup::Mouse_click("Edit")
WheelDown::SpecTab_ResultEditor(MinLimit,MaxLimit,Units,Percision)

#ifwinactive, Edit test (Field Configuration:
  F16::Autofill()
#Ifwinactive, Result Entry - \\Remote  ;Enter Test Results window
  F13::WorkTab_ChangeTestResults("toggle")	
  F16::WorkTab_ChangeTestResults("toggle")
  F17::WorkTab_ChangeTestResults()
  
#ifwinactive, Register new samples - \\Remote
  F13 & wheelup::sendinput, {click 180, 103, 2}%Product%{enter}
  F18::Autofill(1)

#IfWinActive, ahk_exe WFICA32.EXE, ;GENERIC LMS
  F14 & WheelUp::Varbar.AddIteration()
  F14 & wheeldown::Varbar.SubIteration()
  browser_Forward::Excel.NextSheet()
  browser_Back::Excel.PreviousSheet()
  ; F13 & F17::Excel.NextSheet()
  ; F13 & F16::Excel.PreviousSheet()
  Mbutton::AutoFill()
  F18::autofill()
  F13 & WheelUp::Varbar.Sendinput("Product")
  F13 & WheelDown::Varbar.Sendinput("Batch")

#IfWinActive, Enter Product Number ahk_class #32770
  m::1
  ,::2
  .::3
  j::4
  k::5
  l::6
  u::7
  i::8
  o::9
  `;::0
  F19::0
  h::-





KEY_Excel:
  #IfWinActive, LMS Workbook.xlsm
  F18::Excel.Connect(1)
  MButton::Excel.Connect(1)
  #ifwinactive, ahk_exe EXCEL.EXE
  +Enter::sendinput, !{enter}
  $Enter::sendinput, {enter}
  F18::Excel.Search()
  Mbutton::Excel.Connect(1)
  F16::wheel("{wheelleft}",80)
  F17::wheel("{wheelRight}",80)
  
  F14 & F17::^PgDN ;Excel.NextSheet()
  F14 & F16::^PgUp ;Excel.PreviousSheet()
  #ifwinactive, Find and Replace,
  F13 & WheelUp::
  Wheel("{alt down}n{alt up}")
  Varbar.Sendinput("Product")
  return
  F13 & WheelDown::
 ; Wheel("{alt down}n{alt up}")
  Varbar.Sendinput("Batch")
  return
  return::sendinput, !i
  rbutton & Lbutton::sendinput, !i

#IfWinActive, ahk_exe explorer.exe
Mbutton::Open_in_Notepad()
  F14 & F17::Excel.NextSheet()
  F14 & F16::Excel.PreviousSheet()
#IfWinActive, C:\Users\mmignin\Desktop\Label Copy\All Label Copy ahk_exe explorer.exe
F13 & Wheelup::
winactivate, C:\Users\mmignin\Desktop\Label Copy\All Label Copy ahk_exe explorer.exe
send, ^e
sleep 60
sendinput % varbar.sendinput("Product") "{enter}"
sleep 300

return
KEY_OUTLOOK:
  #IfWinActive, ahk_exe OUTLOOK.EXE 
  Mbutton::SENDINPUT % Varbar.Sendinput("Batch") " is updated"
  Rbutton & Wheelup::Wheel("{ctrl down}x{ctrl up}")
  Rbutton & wheeldown::Wheel("{ctrl down}v{ctrl up}")
  Rbutton & F17::Varbar.Sendinput("Batch"," is updated.")
  F14 & WheelDown::varbar.search("batch")
  F14 & Wheelup::varbar.search("Product")
  F13::Clip()
  F19 & Space::Varbar.Sendinput("Product")
  F20 & Space::Varbar.Sendinput("batch")
  F18::LMS_Search()

KEY_Browser:
  #IfWinActive, ahk_exe firefox.exe
  F14 & WheelDown::Wheel("^w")
  F16::sendinput, !{left}
  F13 & WheelDOWN::Browser_Back
  F17::!right
  F14 & wheelUP::Browser_Forward
  Mbutton::Mbutton ;sendinput, ^{click}

KEY_Snipper: 
  #IfWinActive, Snipper - Snipaste ; the capture screen
  rbutton::send, ^c
  WheelDown::wheel("^1")
  Wheelup::Wheel("^5")
  Mbutton::excel.PasteValues("snip")
  #IfWinActive, Paster - Snipaste ahk_exe Snipaste.exe ; the floating window
  Mbutton & wheelUp::Wheel("{click right}z1{click right}e{ctrl down}5{ctrl up}")
  Mbutton::send, {esc}
  F13::sendinput, ^c
  F17::sendinput, ^+{+}
  F16::sendinput, ^+{-}
  #If mouse_isover("Paster - Snipaste ahk_class Qt5QWindowToolSaveBits")
  sendlevel 1
  Mbutton::send, !{click}
  #if

Scroll_Fix:
  #if winactive("Result Editor - \\Remote") || winactive("Test Definition Editor - \\Remote")
  wheeldown::Wheel_scroll("100")
  wheelup::Wheel_scroll("-100")
    ; #ifwinactive, Test Definition Editor - \\Remote
  ; wheeldown::Wheel_scroll("100")
  ; wheelup::Wheel_scroll("-100"
  #if
ClipTool:
#IfWinactive, C:\Users\mmignin\Documents\VQuest\lib\CL3\cl3.ahk - AutoHotkey v1.1.33.06,
  F19::send, {esc}
  F19 & j::send, {down}
  F19 & k::send, {up}
  F19 & l::send, {enter}
  F19 & h::send, {esc}
  Capslock & j::send, {down}
  Capslock & k::send, {up}
  capslock & l::send, {enter}
  capslock & h::send, {esc}
  capslock::esc
  #IfWinActive

#If (A_PriorHotKey = "Browser_forward" AND A_TimeSincePriorHotkey < 1000)
  browser_forward::Send, !{tab}{space}
  browser_back::send, +!{tab}{space}
  media_Next::Mouse_CloseWindow()
  #if

KEY_Otherstuff:
  Media_Play_Pause::^+4 ;4finger tap
  Media_Prev::F7 ;3fringer down
  ; Media_Next:: ;3finger up
  Browser_Back::+!tab ;3finger left
  Browser_Forward::^!tab

  Volume_Down::F11
  Volume_Up::F12
  #right::tooltip(A_ThisHotkey)
  ^+!down::tooltip(A_ThisHotkey)
  CapsLock::return
  F20 & Right::send, #{right}
  F20 & Left::send, #{Left}
  F20 & UP::send, #{UP}
  F20 & Down::send, #{Down}
  F20::AutoFill()
  
#If (A_PriorHotKey = "Media_next" AND A_TimeSincePriorHotkey < 1000)
    Browser_forward::#right
    Browser_back::#left
    Media_Next::sendinput, #{up}
    Wheelup::tooltip(A_ThisHotkey)
    Wheeldown::tooltip(A_ThisHotkey)
    wheelleft::tooltip(A_ThisHotkey)
    wheelright::tooltip(A_ThisHotkey)
    Lbutton::tooltip(A_ThisHotkey)
    Rbutton::tooltip(A_ThisHotkey)
    mbutton::tooltip(A_ThisHotkey)
    #If
  Media_next::Tooltip("Swipe",2000) 
  
#If WinActive("ahk_exe Code.exe") && Getkeystate("Capslock","p") ;editor
    ,::sendinput, +!/
    m::+!down
    n::+!n
    u::+!up
    '::+^!n
    .::+F1
    up::^+up
    down::^+down
    /::sendinput, !^w
    5::^+/

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
Enter_Batch(){
  global
  ;inputbox, Batch,Enter Batch Number, %key%- ,,,,%varbar_x%,%Varbar_y%,,Default
  WinActivate, ahk_class Transparent Windows Client ahk_exe WFICA32.EXE
  ;inputbox, Code,Enter Product Number, %key% `t ,,,,%varbar_x%,%Varbar_y%,,Default
  click 755, 480
  sleep 100
  ;click 1131, 80
  click 487, 130, 2 ;click search bar
  sendlevel, 1
  sendinput, {F19}
  sendlevel, 0
  Input, CodeA, V L3 T5, -
  if !ErrorLevel
  sendinput, -
  Input, CodeB, V L4 T5, {enter}
  if !ErrorLevel
  send, {enter}
  Batch:=CodeA . "-" . CodeB
  GuiControl, Varbar:Text, Batch, %Batch% 
  tooltip(Batch)
  return
}

Enter_Product(key){
  Global
  WinActivate, ahk_class Transparent Windows Client ahk_exe WFICA32.EXE
  ;inputbox, Code,Enter Product Number, %key% `t ,,,,%varbar_x%,%Varbar_y%,,Default
  click 755, 480
  sleep 100
  ;click 1131, 80
  click 487, 130, 2 ;click search bar
  sendinput, %Key%
  sendlevel, 1
  sendinput, {F19}
  sendlevel, 0
  Input, Code, V L3 T5, {enter}
    if !ErrorLevel
  send, {enter}
  Product:=Key Code
	GuiControl, Varbar:Text, Product, %Product% 
  tooltip(Product)
  return
} 

LMS_Search(){
  send, ^c
  ClipWait, 1,
  Clipboard := Trim((Clipboard, "`r`n"))
  WinActivate, NuGenesis LMS - \\Remote
  click 783, 45
  sleep 400
Click_Searchbox()
  ; click, 500,127, 2 ;click search bar
  sleep 200
  Send, %clipboard%{enter}
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
run_VIM:
  Run, ViM.Ahk
return
#IfWinActive,
WindowSpySub: 
Run, WindowSpy.ahk,C:\Program Files\AutoHotkey\

#Include <AutoFill>
#include <varBar>
#include <ProductTab>
#include <WorkTab>
#include <SpecTab>
#include <Rotation>
#include <Excel>
#include <vis2>

#include <wheel>
#include <VScode>
#include <mouse>
VQuest_Start:
  #Persistent 
  #NoEnv
  #SingleInstance,Force
  #KeyHistory 100
  SetWorkingDir, %A_ScriptDir%
  Menu, Tray, Add,CL3, Run_cl3
  menu, tray, add, Display settings, Run_display
  Menu, Tray, Add, Vim, Run_Vim
  Menu, Tray, Add, Stop, StopSub
  Menu, Tray, Add, windowSpy, WindowSpySub 
  Menu, Tray, Add, ResetVarbar, Varbar_ResetSub
  Menu, Tray, Default, ResetVarbar
  SetBatchLines, 10ms
  Setnumlockstate Alwayson
  setCapslockstate alwaysoff
  SetscrolllockState, alwaysOff
  	CoordMode, mouse, window
  SetDefaultMouseSpeed, 0
  ; detecthiddenwindows, on

  SetTitleMatchMode, 2
  settitlematchmode, slow
  #MaxHotkeysPerInterval 200
  #HotkeyModifierTimeout 30
  #maxthreadsperhotkey, 1
  SetKeyDelay, 1, 0
  setwindelay, 450
  AutoTrim, On
  Menu, Tray, Icon, Robot.ico
Results_Definition_edit:="78,63"
Result_Editor_Ok:="370,660"
Results_Definition_ok:="1336,592"
Requests_tab:="865,83"
MyWork_Tab:="761,44"
Mywork_Searchbar:="500,127,2"
  Iniread, Iteration, data.ini, SavedVariables, Iteration
  Iniread, VarBar_X, data.ini, Locations, VarBar_x
  Iniread, VarBar_Y, data.ini, Locations, VarBar_Y
  Excel.Connect(1)