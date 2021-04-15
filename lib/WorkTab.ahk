WorkTab_EditSample(){
  global		
  EnvGet, ShipTo, ShipTo
ifwinactive, Register new samples - \\Remote
  click 2
  sleep 200
  winwaitactive, Edit sample (Field Configuration
  sendinput, {tab 2}{right}{click 277, 139}{tab 6}
  IfWinActive, Edit sample (Field Configuration: F`, Micro) - \\Remote
    sendinput, {tab}^a
  sendinput % Varbar.Sendinput("Batch") "{tab}^a"
  IfWinActive, Edit sample (Field Configuration: F`, Micro) - \\Remote 
  {
    sendinput % Varbar.Sendinput("Lot") 
    send, {tab 3} 
    sleep 100
    send, % Varbar.Sendinput("Coated") 
    sleep 100
    send, +{tab 2}
  }
  sleep 140
  AbsSelection:=Abs(ShipTo)-1
  if (ShipTo > 0)
    sendinput, {home}{right %ShipTo%}
  if (ShipTo < 0)
    Sendinput, {end}{left %Absselection%}
  sleep 300
  send, {enter}
    return
}
Worktab_CheckDepartment(){
  global 
  department:=Clip()
  ;department:=Clipboard
  MicroDepartment:=Department
  PhysicalDepartment:=Department
  AnalyticalDepartment:=Department 
  sleep 200
  if (Regexmatch(MicroDepartment, "\bMicro\s\(Finished\)", MicroDepartment) > 0)
    Return "Micro"
  else if (Regexmatch(PhysicalDepartment, "\bPhysical\s\((In Process|Coated)\)", PhysicalDepartment) > 0)
    Return "Physical"
  else if (Regexmatch(AnalyticalDepartment, "\bAnalytical\s\(In Process\)", AnalyticalDepartment) > 0)
    Return "Analytical"
  return %Department%
  	;Clipboard:=Preclip
}
 
WorkTab_NewRequest()
{
  global
  ; send, ^c
  ; clipwait
  msgbox % Worktab_CheckDepartment()
  sleep 400
return
  click 64, 300 ;click Assign To New rewuest link
  winwaitactive, Edit request - \\Remote,,3
      if !Errorlevel
  sleep 200
  WinActivate, Edit request - \\Remote,
  click 238, 622 ;pick test
  winwaitactive, Select tests for request,,3 
    if !Errorlevel
    sleep 100
  click, right, 264, 590 ; click to show filer
  sleep 100
  send, {up}{enter}
  sleep 100
  click, 97, 125 ; click filter
  send, %Department%{enter}
  sleep 100
  click 152, 195
  send ^a
  click 504, 338 ; click arrow
  WinActivate, Select tests for request
  click, right, 264, 590 ; click to clear filter
  send, {up}{enter}
  sleep 100
  WinActivate, Select tests for request
  sleep 100
  WinActivate, Select tests for request
  click 854, 657 ; click okay
  winwaitclose, Select tests for request,,10
    if !Errorlevel
    WinWaitActive, Edit request
  While GetKeyState("Lbutton", "p")
  sleep 100
  IfWinnotActive, Edit request
    exit
  Sleep 100
    winactivate, Edit request
    send, {tab}{enter}
  return

}

WorkTab_ShipToSelect(x_pos:=304,y_pos:=433)
{
  global
  Menu, ShipToMenu, Add, &B, ShipToMenuHandler
  Menu, ShipToMenu, Add, &C, ShipToMenuHandler
  Menu, ShipToMenu, Add, &D, ShipToMenuHandler
  Menu, ShipToMenu, Add, &Equilife, ShipToMenuHandler
  Menu, ShipToMenu, Add, &E, ShipToMenuHandler
  Menu, ShipToMenu, Add, &F, ShipToMenuHandler
  Menu, ShipToMenu, Add, &G, ShipToMenuHandler
  Menu, ShipToMenu, Add, &H, ShipToMenuHandler
  Menu, ShipToMenu, Add, &I, ShipToMenuHandler
  Menu, ShipToMenu, Add, &J, ShipToMenuHandler
  Menu, ShipToMenu, Add, &K, ShipToMenuHandler
  Menu, ShipToMenu, Add, &L, ShipToMenuHandler
  Menu, ShipToMenu, Add, &M, ShipToMenuHandler
  Menu, ShipToMenu, Add, &N, ShipToMenuHandler
  Menu, ShipToMenu, Add, &O, ShipToMenuHandler
  Menu, ShipToMenu, Add, &P, ShipToMenuHandler
  Menu, ShipToMenu, Add, &R, ShipToMenuHandler
  Menu, ShipToMenu, Add, &S, ShipToMenuHandler
  Menu, ShipToMenu, Add, &T, ShipToMenuHandler
  Menu, ShipToMenu, Add, &V, ShipToMenuHandler
  Menu, ShipToMenu, Show,noactivate
  Return

  ShipToMenuHandler:
    winactivate, Edit sample
    sendinput, {click, %x_pos%, %y_pos%}{Home}
    If (A_ThisMenuItem = "&B") 
      sendinput, {tab}{pgdn 2}
    else if (A_ThisMenuItem = "&C") 
      sendinput, {tab}{pgdn 3}
    else if (A_ThisMenuItem = "&D") 
      sendinput, {tab}{pgdn 4}
    else if (A_ThisMenuItem = "&E") 
      sendinput, {tab}{pgdn 5}
    else if (A_ThisMenuItem = "&Equilife") 
      sendinput, {tab}{pgdn 6}{down 9}
    else if (A_ThisMenuItem = "&F") 
      sendinput, {tab}{pgdn 6}
    else if (A_ThisMenuItem = "&G") 
      sendinput, {tab}{pgdn 7}
    else if (A_ThisMenuItem = "&H") 
      sendinput, {tab}{pgdn 8}
    else if (A_ThisMenuItem = "&I") 
      sendinput, {tab}{pgdn 9}
    else if (A_ThisMenuItem = "&J") 
      sendinput, {tab}{pgdn 10}
    else if (A_ThisMenuItem = "&K") 
      sendinput, {tab}{pgdn 11}
    else if (A_ThisMenuItem = "Key Nutrients") 
      sendinput, {tab}{pgdn 10}{down 18}
    else if (A_ThisMenuItem = "&L") 
      sendinput, {tab}{pgdn 12}
    else if (A_ThisMenuItem = "&M") 
      sendinput, {tab}{pgdn 13}
    else if (A_ThisMenuItem = "&N") 
      sendinput, {tab}{pgdn 14}
    else if (A_ThisMenuItem = "&O") 
      sendinput, {tab}{end}{pgup 8}
    else if (A_ThisMenuItem = "&P") 
      sendinput, {tab}{end}{pgup 7}
    else if (A_ThisMenuItem = "&R") 
      sendinput, {tab}{end}{pgup 6}
    else if (A_ThisMenuItem = "&S") 
      sendinput, {tab}{end}{pgup 5}
    else if (A_ThisMenuItem = "&T") 
      sendinput, {tab}{end}{pgup 4}
    else if (A_ThisMenuItem = "&V") 
      sendinput, {tab}{end}{pgup 1}
    else
      return
  return
}

WorkTab_ChangeTestResults(Checkbox_Toggle:=0) 
{
  global 
  MouseGetPos, xpos, ypos
  click
  Mouse_Click("Orient_ResultEntry")
  if Checkbox_Toggle Contains Toggle
    sendinput, {tab}{Space}{tab}{Space}
  else
    sendinput, {tab}{tab}
  sendinput, {tab 10}^a 
  sleep 100
  send, %Iteration%
  sleep 100
  mousemove, xpos, ypos+26
  return

}

WorkTab_AddSampleLog(count) 
{
  global
  ;MouseGetPos, xpos, ypos
  loop, %count%
  {
    click 46, 877
    ;Click, xpos, ypos, 2
    ;ypos:= ypos+26
    winwaitactive, Edit test (Field Configuration: I`, Analytical) - \\Remote
    sendinput, {Click, 402, 284}{end}(on sample log){click, 334, 618}
    winwaitactive, NuGenesis LMS - \\Remote
    sleep 300
    winactivate, NuGenesis LMS - \\Remote
    sleep 500
    send, {click, 1290, 703}{down %A_index%}
  }
  return
}

WorkTab_Main_EditResults() 
{
  sendinput, {click}{click 77, 751} ;edit results
  winwaitactive, Results Definition - \\Remote
  return
}

