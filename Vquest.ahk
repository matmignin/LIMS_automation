gosub, vquest_start

  Results_Definition_edit:="78,63"
  Result_Editor_Ok:="370,660"
  Results_Definition_ok:="1336,592"
return

Sendlevel 1
F13 & F14::sendinput, +{F13}
F14 & F13::Sendinput, {F21}
F19::sendinput, {F21}
Sendlevel 0
#IfWinActive,
KEY_DEFAULT:
  Mbutton & WheelDown::Wheel("^{WheelDown}") 
  Mbutton & Wheelup::Wheel("^{WheelUp}") 
  Mbutton & F17::Wheel_Right()
  Mbutton & F16::Wheel_left()
  Mbutton::Mbutton
  Rbutton & Wheelup::Wheel_cut() 
  Rbutton & Wheeldown::Wheel_paste()
      Rbutton & F14::Get_WindowInfo()
  Rbutton & F16::Backspace
  Rbutton & F17::delete
  Rbutton & Lbutton::Enter
  Rbutton up::Mouse_RbuttonUP()
  F13 & LButton::Sendinput, +^4 ;screenshot"
  F13 & RButton::Sendinput, +^3 ;screenshot"
  F13 & Mbutton:: varbar.set("OCR") 
  F13 & WheelUp::VarBar.Send("Product")
  F13 & WheelDown::VarBar.Send("Batch")
  ; F14 & Rbutton::Get_WindowInfo()
  F13::VarBar.set()
  F13 & F18::Varbar.reset()
  F14 & wheelDown::Mouse_CloseWindow()
  F14 & Wheelup::Wheel("#{tab}")
  F14 & Lbutton::Sendinput, #{down}
  ; F14::Menu()
  F18 & Wheelup::sendinput, {F15}
  F18 & Lbutton::sendinput, ^{Click}
  F18 & Rbutton::sendinput, +{Click}
  F18 & Mbutton::^a



#If (A_PriorHotKey = "F18" AND A_TimeSincePriorHotkey < 2000)  ;____F18____
    f18::ReloadScript()
    Wheelup::test()
    Wheeldown::varbar.set("Coated")
    F16::sendinput, {Click 354, 44}
    F17::sendinput, {click, 743, 41}
    Lbutton::sendinput, ^{click}
    Rbutton::sendinput, +{click}
    mbutton::VarBar.set()
  #If
    F18::Tooltip("☩",2000) 


KEY_Varbar:
#If Mouse_IsOver("VarBar ahk_class AutoHotkeyGUI")    
  WheelUp::Varbar.AddIteration()
  wheelleft::Excel.NextSheet()
  wheeldown::Varbar.SubIteration()
  F17::Excel.NextSheet()
  wheelRight::excel.previoussheet()
  Rbutton::Excel.connect()
  F16::excel.previoussheet()
  Mbutton::
    if WinExist("Result Editor - \\Remote") || WinExist("Test Definition Editor - \\Remote") || winexist("Results Definition - \\Remote")
      SpecTab_Table()
    else
      ProductTab_Table()
    return
  #If


  ;___________________________________________________________________________

KEY_LMS:
  #Ifwinactive, NuGenesis LMS - \\Remote 
F20::Mouse_Click("SearchBar_Batch")   
    F14 & WheelRight:: sendinput, {click, 743, 41}
    F14 & WheelLeft::sendinput, {Click 354, 44}
    ; F14 & WheelDOWN::Sendinput, {Click 46, 855}
    ; F14 & wheelUP::sendinput, {click, 544, 41}
    F17::click 78, 750
    F14 & wheeldown::mouse_click("searchBar_Batch")
    F14 & wheelup::mouse_click("searchBar_Product")
  #Ifwinactive, Select methods tests - \\Remote
    F19 & space::LMS_AutoFill()
  #Ifwinactive, Result Entry - \\Remote
    F13::WorkTab_ChangeTestResults("toggle")	

#ifwinactive, Register new samples - \\Remote
  F13 & wheelup::sendinput, {click 180, 103, 2}%Product%{enter}

  #IfWinActive, ahk_exe WFICA32.EXE,      ;GENERIC LMS
    F14 & WheelUp::Varbar.AddIteration()
    F14 & wheeldown::Varbar.SubIteration()
    browser_Forward::Excehl.NextSheet()
    browser_Back::Excel.PreviousSheet()
     F13 & F17::Excel.NextSheet()
     F13 & F16::Excel.PreviousSheet()
    Mbutton::LMS_AutoFill()



KEY_Excel:
  #IfWinActive, LMS Workbook.xlsm - Excel
    F18::Excel.Connect(1)
    MButton::Excel.Connect(1)
  #ifwinactive, ahk_exe EXCEL.EXE
    +Enter::sendinput, !{enter}
    $Enter::sendinput, {enter}
    Mbutton::Excel.Search()
    F16::wheel("{wheelleft}",80)
    F17::wheel("{wheelRight}",80)
  #ifwinactive, Find and Replace,
  F13 & WheelUp::
    Wheel("{alt down}n{alt up}")
    VarBar.Send("Product")
    return
  F13 & WheelDown::
    Wheel("{alt down}n{alt up}")
    VarBar.Send("Batch")
    return
  return::sendinput, !i
  rbutton & Lbutton::sendinput, !i



#IfWinActive, ahk_exe explorer.EXE
    Mbutton::Open_in_Notepad()
#IfWinActive, ahk_exe OUTLOOK.EXE 
  Mbutton::SENDINPUT % VarBar.send("Batch") " is updated"
  Rbutton & Wheelup::Wheel("{ctrl down}x{ctrl up}")
  Rbutton & wheeldown::Wheel("{ctrl down}v{ctrl up}")
  Rbutton & F17::Varbar.Send("Batch"," is updated.")
  F14 & WheelDown::varbar.search("batch")
  F14 & Wheelup::varbar.search("Product")
  F13::varbar.set()
  F19 & Space::Varbar.send("Product")
  F20 & Space::Varbar.send("batch")
  F18::LMS_Search()


KEY_Browser:
	#IfWinActive, ahk_exe firefox.exe || ahk_exe msedge.exe
		F15 & WheelDown::Wheel("^w")
		F13 & WheelDOWN::Browser_Back
		F14 & wheelUP::Browser_Forward
		Mbutton::sendinput, ^{click}
KEY_Snipper: 
	#IfWinActive, Snipper - Snipaste ; the capture screen
		rbutton::Enter
	#IfWinActive,  Paster - Snipaste ahk_exe Snipaste.exe ; the floating window
		Mbutton & wheelUp::Wheel("{click right}z1{click right}e{ctrl down}5{ctrl up}")
		Mbutton::send, !{click}
		F13::sendinput, ^c
		F17::sendinput, ^+{+}
		F16::sendinput, ^+{-}




Scroll_Fix:
#ifwinactive, Result Editor - \\Remote
  wheeldown::Wheel_scroll("100")
  wheelup::Wheel_scroll("-100")
return
#IfWinActive
KEY_Otherstuff:
Media_Play_Pause::F8
	Media_Next::F9
	Browser_Back::tooltip(A_ThisHotkey)
	Browser_Forward::tooltip(A_ThisHotkey)
	Media_Prev::F7
	Volume_Down::F11
	Volume_Up::F12
	#right::tooltip(A_ThisHotkey)
	^+!down::tooltip(A_ThisHotkey)
	CapsLock::return
	$enter::sendinput, {enter}
	+F12::Exitapp
	F20 & Right::send, #{right}
	F20 & Left::send, #{Left}
	F20 & UP::send, #{UP}
	F20 & Down::send, #{Down}
	F20::LMS_autofill()
#If (A_PriorHotKey = "F15" AND A_TimeSincePriorHotkey < 4000)
{
	f15::Menu()
	Wheelup::tooltip(A_ThisHotkey)
	Wheeldown::tooltip(A_ThisHotkey)
	wheelleft::tooltip(A_ThisHotkey)
	wheelright::tooltip(A_ThisHotkey)
	Lbutton::tooltip(A_ThisHotkey)
	Rbutton::tooltip(A_ThisHotkey)
	mbutton::tooltip(A_ThisHotkey)
}
	#If
F15::Tooltip("F15",2000) 

#If WinActive("ahk_exe Code.exe") && Getkeystate("Capslock","p") ;editor
{
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
}

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
Enter_Batch(key){
    global
    Inputbox_X:= Varbar_X + 40
    Inputbox_Y:= Varbar_Y
    sleep 200
    CoordMode, mouse, screen
    inputbox,Batch,, %key%-,,70,130,%InputBox_X%,%InputBox_Y%,,,%Batch%
    if ErrorLevel
      return
    else
      Batch:=key . "-" . Batch
    CoordMode, mouse, window
    ;Save_Code("Batches", Batch)
    ;Envset, Batch, %Batch%
    Sleep 100		
    VarBar.show()
    return
  }
  
Enter_Product(key){
  global
  ; Inputbox_X:= Varbar_X + 40
  ; Inputbox_Y:= Varbar_Y
  sleep 200
  CoordMode, mouse, screen
  ; inputbox,Product,, %key%`t ,,70,130,%InputBox_X%,%InputBox_Y%,,,%Product%
  inputbox,Product,, %key%`t ,,70,130,1,1,,,%Product%
  if !ErrorLevel
    Product:=key . Code
  CoordMode, mouse, window
  Sleep 200	
  IfWinActive, NuGenesis LMS - \\Remote
    click 783, 45
    sleep 400
    click 487, 125, 2 ;click search bar
    ; click, 500,127, 2 ;click search bar
    sleep 200
    ; Send, %Product%{enter}
    sendinput, {ctrl down}a{ctrl up}%Product%{enter}
  ; VarBar.show()
  return
  } 


LMS_Search(){
  send, ^c
  ClipWait, 1,
  Clipboard := Trim((Clipboard, "`r`n"))
  WinActivate, NuGenesis LMS - \\Remote
  click 783, 45
  sleep 400
  click 487, 125, 2 ;click search bar
  ; click, 500,127, 2 ;click search bar
  sleep 200
  Send, %clipboard%{enter}
  return
  }



VQuest_Start:
  #Persistent 
  #NoEnv
  #SingleInstance,Force
  #KeyHistory 100
  SetWorkingDir, %A_ScriptDir%
  Menu, Tray, Add,CL3, Run_cl3
    Menu, Tray, Add, Vim, Run_Vim
  Menu, Tray, Add, Stop, StopSub
  	Menu, Tray, Add, windowSpy, WindowSpySub 
  Menu, Tray, Add, ResetVarbar, Varbar_ResetSub
  Menu, Tray, Default, ResetVarbar
  Setnumlockstate Alwayson
  setCapslockstate alwaysoff
  SetscrolllockState, alwaysOff
  SetDefaultMouseSpeed, 0
  detecthiddenwindows, on
  SetTitleMatchMode, 2
  settitlematchmode, slow
  #MaxHotkeysPerInterval 200
  #HotkeyModifierTimeout 100
  #maxthreadsperhotkey, 1
  SetKeyDelay, 0
  setwindelay, 450
  AutoTrim, On
  Menu, Tray, Icon, Robot.ico
  #HotkeyModifierTimeout 
  Iniread, Iteration, data.ini, SavedVariables, Iteration
  Iniread, VarBar_X, data.ini, Locations, VarBar_x
  Iniread, VarBar_Y, data.ini, Locations, VarBar_Y
  Excel.Connect(1)

     Run, ViM.Ahk
  return



  ;#include Vim.ahk
  #Include <LMS_autofill>
  #include <test>
  #include <varBar>
  #include <ProductTab>
  #include <WorkTab>
  #include <SpecTab>
  #include <Rotation>
  #include <Excel>
  #include <vis2>
  #include <wheel>
  #include <VScode>
  StopSub: 
    exitapp
    Return
  VarBar_ResetSub:
   VarBar.Reset()
    return
  Run_CL3:
   Run, cl3.Ahk, lib\CL3
    return
  run_VIM:
   Run, ViM.Ahk
   return
  #IfWinActive,
WindowSpySub: 
  Run, WindowSpy.ahk,C:\Program Files\AutoHotkey\
Return