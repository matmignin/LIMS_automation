Class WorkTab {

EditSample(){
  global		
  mx:=
  my:=
  if Iteration=""
    iteration=1
  ifwinactive, Register new samples - \\Remote
  MouseGetPos, mx, my
  loop %iteration%
  {
    click 2
    sleep 200
    winwaitactive, Edit sample (Field Configuration,,2
      if ErrorLevel
        exit
    sendinput, {tab 2}{right}{click 277, 139}{tab 6}
    IfWinActive, Edit sample (Field Configuration: F`, Micro) - \\Remote
      sendinput, {tab}^a
    sendinput, ^a%Batch%{tab}^a
    IfWinActive, Edit sample (Field Configuration: F`, Micro) - \\Remote 
    {
      sendinput, {CtrlDown}{a}{Ctrlup}%Lot%
      send, {tab 3}
      sleep 100
      sendinput, {CtrlDown}{a}{Ctrlup}%Coated%
      sleep 100
      send, +{tab 2}
    }
    sleep 140
    WorkTab.DropdownSelect(ShipTo)
    sleep 300
    send, {enter}
    sleep 400
    winactivate, Register new samples - \\Remote
    my:=my+26
    MouseMove, mx, my
    sleep 200
      ; retrn
}
}



DropdownSelect(A_ShipTo){
  AbsSelection:=Abs(A_ShipTo)-1
  if (a_shipto = "-1")
    Sendinput, {end}
  else if (a_shipto = "1")
    Sendinput, {home}
  else if (a_ShipTo > 1)
    sendinput, {home}{right %A_ShipTo%}
  else if (a_ShipTo < 1)
    Sendinput, {end}{left %Absselection%}
  }


 
 
NewRequest(){
  global
  department:= ; Clip()
  Clipboard:=
  sleep 100
  WinActivate, NuGenesis LMS - \\Remote
  ; send, ^c
  sleep 200

  sleep 50
  LMS.CheckDepartment()
  sleep 400
  tooltip, %department%
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
  send, %Department%{enter}{tab 2}
  sleep 100
  send, %product%{enter}
  ;click 152, 195
  send, {tab}{CtrlDown}{a}{Ctrlup}
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

ChangeTestResults(Checkbox_Toggle:=0) {
  global
  if (Iteration = "ERROR")
    InputBox, Iteration, enter iteration, number please,, , , , , , , 1
      if errorlevel
        reload   
  ;Tooltip(iteration, 5000) 
  ;winactivate, Result Entry - \\Remote
   if checkbox_toggle contains loop
  {
   if keep_running = y
      {
        keep_running = n ;signal other thread to stop
        return
      }
    keep_running = y
    winactivate, Result Entry - \\Remote
    MouseGetPos, xpos, ypos
    loop 25,
      {
        blockinput on
        if keep_running = n ;another signal to stop
        return
        click
        Mouse_Click("Orient_ResultEntry")
      if keep_running = n ;another signal to stop
        return
        send, {tab}{Space}{tab}{Space}
        send, {tab 10}^a 
        sleep 100
        send, %Iteration%
      if keep_running = n ;another signal to stop
        return
        sleep 100
        ypos:=ypos+26
      if keep_running = n ;another signal to stop
        return
        mousemove, xpos, ypos,0
        sleep 200
        blockinput off
      }
      if keep_running = n ;another signal to stop
        return
      click
      return
  }  
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

AddSampleLog(count) 
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

Main_EditResults() 
{
  sendinput, {click}{click 77, 751} ;edit results
  winwaitactive, Results Definition - \\Remote
  return
}
	AddTestDescription(Text){
		sendinput, {click 305, 294}{end}%TEXT%{click 330, 617}
	}




}