gosub, vquest_start

  Results_Definition_edit:="78,63"
  Result_Editor_Ok:="370,660"
  Results_Definition_ok:="1336,592"
return

  



KEY_DEFAULT:
  Mbutton & WheelDown::Wheel("^{WheelDown}") 
  Mbutton & Wheelup::Wheel("^{WheelUp}") 
  Mbutton & F17::Wheel_Right()
  Mbutton & F16::Wheel_left()
  Mbutton & F15::Menu("Sheets")
  Mbutton::Mbutton
  Rbutton & Wheelup::Wheel_cut() 
  Rbutton & Wheeldown::Wheel_paste()
  Rbutton & F16::Backspace
  Rbutton & F18::Get_WindowInfo()
  Rbutton & F17::delete
  Rbutton & Lbutton::Enter
  Rbutton up::RbuttonUP()
  F13 & LButton::Sendinput, +^4 ;screenshot"
  F13 & RButton::Sendinput, +^3 ;screenshot"
  F13 & Mbutton:: varbar.set("OCR") 
  F13 & WheelUp::VarBar.Send("Product")
  F13 & WheelDown::VarBar.Send("Batch")
  F13::VarBar.set()
  F13 & F18::Varbar.reset()
  F13 & F14::sendinput, !{ab}
  F14 & Rbutton:: 
  F14 & Lbutton::Sendinput, #{down}
  F14 & F13::sendinput, #{tab}
  F14::Menu()
  F14 & wheelDown::Mouse_CloseWindow()()
  F18 & Wheelup::sendinput, {F15}
  F18 & Lbutton::sendinput, ^{Click}
  F18 & Rbutton::sendinput, +{Click}

#If (A_PriorHotKey = "F15" AND A_TimeSincePriorHotkey < 2000)  ;____F15____
    f15::Test()
    Wheelup::test()
    Wheeldown::varbar.set("Coated")
    F16::sendinput, {Click 354, 44}
    F17::sendinput, {click, 743, 41}
    Lbutton::LMS_AutoFill()
    Rbutton::LMS_AutoFill()
    mbutton::VarBar.set()
  #If
    F15::Tooltip("☩",2000) 


KEY_Varbar:
#If MouseIsOver("VarBar ahk_class AutoHotkeyGUI")    
  WheelUp::Varbar.AddIteration()
  wheelleft::Excel.NextSheet()
  wheeldown::Varbar.SubIteration()
  F16::Excel.NextSheet()
  wheelRight::excel.previoussheet()
  Rbutton::Excel.connect()
  F17::excel.previoussheet()
  Mbutton::
    if WinExist("Result Editor - \\Remote") || WinExist("Test Definition Editor - \\Remote") || winexist("Results Definition - \\Remote")
      SpecTab_Table()
    else
      ProductTab_Table()
    return
#If


  !F15::Mouse_CloseWindow()
  ;___________________________________________________________________________
_________________________________________________________________EXPLORER:
  ;____________________________________________________________________________
  #IfWinActive, ahk_exe explorer.EXE
    ; F15::excel.pasteValues()
  #ifwinactive
  ;___________________________________________________________________________
                                                                    KEY_OUTLOOK:
  ;____________________________________________________________________________

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


KEY_LMS:
  #IfWinActive, ahk_exe WFICA32.EXE,      ;GENERIC LMS
    F14 & WheelUp::Varbar.AddIteration()
    F14 & wheeldown::Varbar.SubIteration()
    WheelRight::Excehl.NextSheet()
    wheelleft::Excel.PreviousSheet()
    F16::Excel.NextSheet()
    F17::Excel.PreviousSheet()
    Mbutton::LMS_AutoFill()
  #Ifwinactive, NuGenesis LMS - \\Remote 
    F14 & WheelRight:: sendinput, {click, 743, 41}
    F14 & WheelLeft::sendinput, {Click 354, 44}
    F14 & WheelDOWN::Sendinput, {Click 46, 855}
    F14 & wheelUP::sendinput, {click, 544, 41}
  #Ifwinactive, Select methods tests - \\Remote
    F19 & space::LMS_AutoFill()
  #Ifwinactive, Result Entry - \\Remote
    F13::WorkTab_ChangeTestResults("toggle")	





KEY_Excel:
  #IfWinActive, LMS Workbook.xlsm - Excel
    Mbutton::Excel.Connect(1)
  #ifwinactive, ahk_exe EXCEL.EXE
    +Enter::sendinput, !{enter}
    $Enter::sendinput, {enter}
    F13::Excel.Search()
  return
  F18::
      WinActivate, NuGenesis LMS - \\Remote
      click, 500,127, 2 ;click search bar
      sleep 200
    send % Excel.ActiveCell()
    sleep 200
    send, {enter}
    return

  #ifwinactive, Find and Replace,
  F13 & WheelUp::
    Wheel("{alt down}n{alt up}")
    VarBar.Send("Product")
    return
  F13 & WheelDown::
    Wheel("{alt down}n{alt up}")
    VarBar.Send("Batch")
    return
    enter::sendinput, !i
    rbutton & Lbutton::sendinput, !i







_______________________________________________________Scroll_Fix:
#ifwinactive, Result Editor - \\Remote
  wheeldown::Wheel_scroll("100")
  wheelup::Wheel_scroll("-100")






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
MouseIsOver(WinTitle){ 
  MouseGetPos,,, Win
  Return WinExist(WinTitle . " ahk_id " . Win)
  }

RbuttonUP(){
  #inputlevel 1
    suspend, On
    sleep 50
    Click, Right
    sleep 500
    ;MouseClick, Right,,,1, 0, U
    suspend, Off
    return
  #inputlevel 0
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
  #KeyHistory 400
  SetWorkingDir, %A_ScriptDir%
  Menu, Tray, Add, Run CL3, Run_cl3
  Menu, Tray, Add, Reset Table Locations, Varbar_Reset
  ;#InstallKeybdHook
  ;#InstallMouseHook
  Setnumlockstate Alwayson
  setCapslockstate alwaysoff
  SetscrolllockState, alwaysOff
  SetDefaultMouseSpeed, 0
  detecthiddenwindows, on
  SetTitleMatchMode, 2
  settitlematchmode, slow
  #MaxHotkeysPerInterval 200
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
  Menu, Tray, Add, Stop, StopSub 
  Menu, Tray, Default, Stop 
  return



  #include Vim.ahk
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
  StopSub: 
    exitapp
    Return
  VarBar_Reset:
   VarBar.Reset()
    return
  Run_CL3:
   Run, cl3.Ahk, lib\CL3
    return
  #IfWinActive,
