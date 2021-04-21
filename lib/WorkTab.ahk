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
  department:= ;Clip()
  send, ^c
  sleep 400
  sleep 200
  if (Regexmatch(Clipboard, "\bMicro\s\(Finished\)",Micr) > 0)
  {
    Department:="Micro"
    Return 
  }
  else if (Regexmatch(clipboard, "\bPhysical\b", Phys) > 0)
  {
    Department:="Physical"
    Return
  }
  else if (Regexmatch(clipboard, "\bAnalytical\s\(In Process\)", Anal) > 0)
  {
    Department:="Analytical"
      Return
  }
  ; return %Department%
  	;Clipboard:=Preclip
}
 
WorkTab_NewRequest()
{
  global
  Clipboard:=
  send, ^c
  ; clipwait
  sleep 400
 Worktab_CheckDepartment()
  sleep 400
  Tooltip, %Department%


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
  input, , V T3, {Lbutton}{enter}
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
    tooltip,
  return

}

WorkTab_ChangeTestResults(Checkbox_Toggle:=0) {
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

