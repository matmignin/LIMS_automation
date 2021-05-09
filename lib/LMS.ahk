KEY_LMS:
  #Ifwinactive, NuGenesis LMS - \\Remote 
 ; F20::send, {Click 462, 182}{Click 463, 144}^a
  Xbutton2 & WheelRight::sendinput, {click, 743, 41}
  Xbutton2 & WheelLeft::sendinput, {Click 354, 44}

  F19::Click.Filter("Product") 
  F16::Click.Filter("Product","enter")
  F17::Click.Filter("Batch","enter") 
  F20::Click.Filter("Batch") 
  F18::autofill()
  Xbutton2 & wheeldown::Varbar.SubIteration()
  Xbutton1 & WheelUp::SearchBar("Product")
  Xbutton1 & WheelDown::SearchBar("Batch")
  Mbutton::Excel.Connect()
  Enter::Sendinput, ^a^c{enter}
#Ifwinactive, Select methods tests - \\Remote
  F17::Methods()
  F19 & space::AutoFill()
#IfWinActive, Results Definition - \\Remote
  wheelup::Mouse_click("Edit")
  F16::wheel("{esc}",1000)
  WheelDown::
  Click, 1330, 592
  sleep 100
  click, 338, 619
  Return
#ifwinactive, Edit test (Field Configuration:
  F16::Autofill()
#Ifwinactive, Result Entry - \\Remote  ;Enter Test Results window
  Xbutton1::WorkTab_ChangeTestResults("toggle")	
  F16::WorkTab_ChangeTestResults("toggle")
  F17::WorkTab_ChangeTestResults()
  
#ifwinactive, Register new samples - \\Remote
  Xbutton1 & wheelup::sendinput, {click 180, 103, 2}%Product%{enter}
  F18::Autofill(1)

#IfWinActive, ahk_exe WFICA32.EXE, ;GENERIC LMS
  Xbutton2 & WheelUp::Varbar.AddIteration()
  Xbutton2 & wheeldown::Varbar.SubIteration()
  browser_Forward::Excel.NextSheet()
  browser_Back::Excel.PreviousSheet()
  Mbutton::AutoFill()
  F18::autofill()


 
Scroll_Fix:
  #if winactive("Result Editor - \\Remote") || winactive("Test Definition Editor - \\Remote")
  wheeldown::Wheel_scroll("100")
  wheelup::Wheel_scroll("-100")
    ; #ifwinactive, Test Definition Editor - \\Remote
  ; wheeldown::Wheel_scroll("100")
  ; wheelup::Wheel_scroll("-100"
  #if