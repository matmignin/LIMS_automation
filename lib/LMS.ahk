KEY_LMS:
#Ifwinactive, NuGenesis LMS - \\Remote 
 ; F20::send, {Click 462, 182}{Click 463, 144}^a
  F8::Mouse_CloseWindow()
  Xbutton2 & WheelRight::sendinput, {click, 743, 41}
  Xbutton2 & WheelLeft::sendinput, {Click 354, 44}
  F19 & lbutton::sendinput, {CtrlDown}{click}{Ctrlup}
  rshift & lbutton::sendinput, {shiftDown}{click}{shiftup}
  F19 & space::sendinput % RTrim((Product, "`r`n")) "{enter}"
  F20 & space::Sendinput, % RTrim((Batch, "`r`n")) "{enter}"
  F6::Click.SearchBar(Product,"{enter}")
  F7::Click.SearchBar(Batch,"{enter}")
  F19::Click.SearchBar(Product)
  ~Lbutton & Rbutton::send, {enter}
  Mbutton & Wheelup::
    excel.connect()
    Click.SearchBar(Product,"{enter}")
    return
  F20 & F19::Click.SearchBar(Product) 
  F19 & F20::Click.SearchBar(Batch) 
  Xbutton1 & WheelUp::Click.SearchBar(Product,"{enter}")
  Xbutton1 & WheelDown::Click.SearchBar(Batch,"{enter}") 
  Xbutton1 & F6::Click.SearchBar(Product,"{enter}",1)
  Xbutton1 & F7::Click.SearchBar(Batch,"{enter}",1) 
  Xbutton2 & wheeldown::Varbar.SubIteration()
  Mbutton::menu.LMS()
  Media_Prev::send % "{click 360, 48}{click 803, 83}" mousereturn
  Browser_Forward::send % MouseSave() "{click 54, 747}{click 831, 689,0}" MouseReturn
  Enter::
    Sendinput, {CtrlDown}{a}{c}{Ctrlup}{enter}
    sleep 200
    FileAppend, %Clipboard%`n, Codes.txt
    return
#Ifwinactive, Select methods tests - \\Remote
  F7::LMS.Methods()
  F19 & space::AutoFill()
  F6::esc
#IfWinActive, Composition - \\Remote
  F6::esc
  F7::enter
#IfWinActive, Test Definition Editor - \\Remote
  F6::esc
  F7::click 330, 619 ;click save
#IfWinActive, Results Definition - \\Remote
  F6::esc
  F7::enter
  wheelup::Mouse_click("Edit")
  WheelDown::
  Click, 1330, 592
  sleep 100
  click, 338, 619
  Return
#IfWinActive, Edit specification - \\Remote
#ifwinactive, Edit test (Field Configuration:
  F6::Autofill()
F6::esc
#Ifwinactive, Result Entry - \\Remote  ;Enter Test Results window
  Rbutton::WorkTab_ChangeTestResults("toggle")	
  F6::WorkTab_ChangeTestResults("toggle")
  #MaxThreadsPerHotkey 2
  ;setwindelay,10
    F8::WorkTab_ChangeTestResults("loop")
  ;setwindelay,500
  #MaxThreadsPerHotkey 1
  ; F8::WorkTab_ChangeTestResults("loop")
  F7::WorkTab_ChangeTestResults()
  ;F7::WorkTab_ChangeTestResults()
F6::esc
  
#ifwinactive, Register new samples - \\Remote
  Xbutton1 & wheelup::Click.Searchbar()
  Mbutton::Autofill()
  F8::Click.Searchbar(,"{enter}")
  F7::send, % MouseSave() "{click 502, 354}" Next
  F9::Send, {click 194, 188}^a
  
F6::esc
#ifwinactive, Select samples for test:
  F7::sendinput % MouseSave() "{click 504, 324}" MouseReturn ; add test. 
F6::esc
#IfWinActive, ahk_exe WFICA32.EXE, ;GENERIC LMS
Xbutton2::Menu.LMS()
F19 & space::sendinput, %Product% 
F20 & space::Sendinput, %Batch%
F9::send, {enter}
F19::menu.LMS()
$Rbutton up::Mouse_RbuttonUP()


  Xbutton2 & WheelUp::Varbar.AddIteration()
  Xbutton2 & wheeldown::Varbar.SubIteration()
  ; browser_Forward::Excel.NextSheet()
  ; browser_Back::Excel.PreviousSheet()
  Mbutton::AutoFill()



 
Scroll_Fix:
  #If mouse_isover("Result Editor - \\Remote") || mouse_isover("Test Definition Editor - \\Remote") || mouse_isover("Edit Formulation - \\Remote") ||
  wheeldown::Wheel_scroll("130")
  wheelup::Wheel_scroll("-130")
  #if
  
  Class LMS {
  
AddCOASpace(){
  Global
  WinActivate, Composition - \\Remote
  click
  MouseSave()
  click 74, 64
  sleep 200
  send, {click 354, 336}{end}{enter}{click 283, 559}
  WinActivate, Composition - \\Remote
  send %mouseReturn%
  MouseMove, 0, 36, 0, r
  sleep 200
  return
}
RemoveCOASpace(){
  Global
  WinActivate, Composition - \\Remote
  click
  MouseSave()
  click 74, 64
  sleep 200
  send, {click 354, 336}{pgdn 2}{backspace}{click 283, 559}
  WinActivate, Composition - \\Remote
  send %mouseReturn%
  MouseMove, 0, 36, 0, r
  sleep 200
  return
}
  
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


}	
  
  
  
DeleteRetain(){
  gLOBAL
  MouseGetPos, mx, mY
  InputBox, n, number of retains to delte, , , , , mx, my,
  loop %n%
  {
    sleep 100
    send, {click 61, 258}
    winwait, Delete Tests - \\Remote
    sleep 100
    send, {enter}
    sleep 800
    }
  return
}
  
  
DetectTab(){
  global
  Tab:=
  
  if WinActive("NuGenesis LMS - \\Remote")
  {
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
  }
  else
    return
  }
  }
  
  
Methods:
  sleep 200
  InputVar:=A_ThisMenuItem
    IniRead,vOutput, Methods.ini, Methods, %InputVar%
    Sendinput, %vOutput%{enter}
    sleep 300
    click 506, 341
    LMS.Methods() 
  return