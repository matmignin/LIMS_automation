KEY_LMS:
  #Ifwinactive, NuGenesis LMS - \\Remote 
 ; F20::send, {Click 462, 182}{Click 463, 144}^a
  Xbutton2 & WheelRight::sendinput, {click, 743, 41}
  Xbutton2 & WheelLeft::sendinput, {Click 354, 44}

  

  F6::Click.SearchBar("Product","enter")
  F7::Click.SearchBar("Lot","enter") 
  ;F7::Click.SearchBar("Lot","enter") 
  ; F9::Click.SearchBar("Batch") 
  F20 & F19::Click.SearchBar("Product") 
  F19 & F20::Click.SearchBar("Batch") 
  Xbutton1 & WheelUp::Click.SearchBar("Product","enter")
  Xbutton1 & WheelDown::Click.SearchBar("Batch","enter") 
  Xbutton2 & wheeldown::Varbar.SubIteration()
  Mbutton::Excel.Connect()
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
  F8::Autofill(1)

#IfWinActive, ahk_exe WFICA32.EXE, ;GENERIC LMS
F19 & p::Sendinput, %Product%
F19 & l::Sendinput, %Lot%
F19 & b::Sendinput, %Batch%
F19 & space::Click.SearchBar("Product") 
F20 & space::Click.SearchBar("Batch") 
F8::Mouse_CloseWindow()


  Xbutton2 & WheelUp::Varbar.AddIteration()
  Xbutton2 & wheeldown::Varbar.SubIteration()
  ; browser_Forward::Excel.NextSheet()
  ; browser_Back::Excel.PreviousSheet()
  Mbutton::AutoFill()
  F9::autofill()
  F10::autofill()


 
Scroll_Fix:
 
;  #if 
  ; winactive("Result Editor - \\Remote") || winactive("Test Definition Editor - \\Remote")
  
  #If mouse_isover("Result Editor - \\Remote") || mouse_isover("Test Definition Editor - \\Remote")
  wheeldown::Wheel_scroll("100")
  wheelup::Wheel_scroll("-100")
    ; #ifwinactive, Test Definition Editor - \\Remote
  ; wheeldown::Wheel_scroll("100")
  ; wheelup::Wheel_scroll("-100"
  #if