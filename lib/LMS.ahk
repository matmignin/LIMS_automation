KEY_LMS:
  #Ifwinactive, NuGenesis LMS - \\Remote 
 ; F20::send, {Click 462, 182}{Click 463, 144}^a
  Xbutton2 & WheelRight::sendinput, {click, 743, 41}
  Xbutton2 & WheelLeft::sendinput, {Click 354, 44}

  
  F6::Click.SearchBar(Product,"enter")
  F7::Click.SearchBar(Lot,"enter") 
  ;F7::Click.SearchBar("Lot","enter") 
  ; F9::Click.SearchBar("Batch") 
  F20 & F19::Click.SearchBar(Product) 
  F19 & F20::Click.SearchBar(Batch) 
  Xbutton1 & WheelUp::Click.SearchBar(Product,"enter")
  Xbutton1 & WheelDown::Click.SearchBar(Batch,"enter") 
  Xbutton1 & F6::Click.SearchBar(Product,"enter",1)
  Xbutton1 & F7::Click.SearchBar(Batch,"enter",1) 
  Xbutton2 & wheeldown::Varbar.SubIteration()
  Mbutton::Autofill()
  ; F20::Click.SearchBar(Batch) 
  ; F19::Click.SearchBar(product) 
  
  return
  Enter::
    Sendinput, {CtrlDown}{a}{c}{Ctrlup}{enter}
    sleep 200
    FileAppend, %Clipboard%`n, Codes.txt
    return
#Ifwinactive, Select methods tests - \\Remote
  F7::Methods()
  F19 & space::AutoFill()
#IfWinActive, Results Definition - \\Remote
  wheelup::Mouse_click("Edit")
  F6::wheel("{esc}",1000)
  WheelDown::
  Click, 1330, 592
  sleep 100
  click, 338, 619
  Return
#ifwinactive, Edit test (Field Configuration:
  F6::Autofill()
#Ifwinactive, Result Entry - \\Remote  ;Enter Test Results window
  Rbutton::WorkTab_ChangeTestResults("toggle")	
  F6::WorkTab_ChangeTestResults("toggle")
  ;F6::WorkTab_ChangeTestResults("toggle")
  F7::WorkTab_ChangeTestResults()
  ;F7::WorkTab_ChangeTestResults()
  
#ifwinactive, Register new samples - \\Remote
  Xbutton1 & wheelup::Click.Searchbar()
  ;Mbutton::send, {Click 181, 105,2}%Product%{enter}
  Mbutton::Autofill()
  F8::Autofill()
#ifwinactive, Select samples for test:
  F7::sendinput % MouseSave() "{click 504, 324}" MouseReturn ; add test. 
#IfWinActive, ahk_exe WFICA32.EXE, ;GENERIC LMS

F19 & space::sendinput, %Product% 
F20 & space::Sendinput, %Batch%
F8::Mouse_CloseWindow()


  Xbutton2 & WheelUp::Varbar.AddIteration()
  Xbutton2 & wheeldown::Varbar.SubIteration()
  ; browser_Forward::Excel.NextSheet()
  ; browser_Back::Excel.PreviousSheet()
  Mbutton::AutoFill()



 
Scroll_Fix:
  #If mouse_isover("Result Editor - \\Remote") || mouse_isover("Test Definition Editor - \\Remote")
  wheeldown::Wheel_scroll("100")
  wheelup::Wheel_scroll("-100")
  #if
  
  
  
  
  
  
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
      Tooltip(Tab,1000)
    return
  }