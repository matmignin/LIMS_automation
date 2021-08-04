Class WorkTab {

registerNewSamples(){
  global
  SetWinDelay, 450
  mx:=
  my:=
  If Coated = "ERROR"
    Coated:=
  If Lot = "ERROR"
    lot:=
    blockinput, on
  ControlGetText, Iteration, Static1, VarBar
  ifwinactive, Register new samples - \\Remote
  MouseGetPos, mx, my
  click 2
  sleep 200
  Breaking.Point()
  sleep 200
  winwaitactive, Edit sample `(Field Configuration,, 6 
    if ErrorLevel
      exit
  sendinput, {tab 2}{right}{click 277, 139}{tab 6}
  IfWinActive, Edit sample `(Field Configuration: F`, Micro`) - \\Remote
    send,{tab}^{a}
  sendinput, ^{a}%Batch%{tab}^{a}
  IfWinActive, Edit sample `(Field Configuration: F`, Micro`) - \\Remote
  {
    sendinput,{CtrlDown}{a}{Ctrlup}%Lot%
    sendinput,{tab 3}
    sleep 100
  if Coated
    sendinput, ^{a}%Coated%
    sleep 100
    sendinput, +{tab 2}
  }
  Breaking.Point()
  sleep 180
  if !ShipTo
    return
  This.DropdownSelect(ShipTo)
  sleep 500
  Breaking.Point()
  sendinput, {enter}
  sleep 200
  blockinput, off
  winactivate, Register new samples - \\Remote
  my:=my+26
  MouseMove, mx, my
  
  SetWinDelay, 100
    ; return
}


DropdownSelect(A_ShipTo){
    SetWinDelay, 450
 AbsSelection:=Abs(A_ShipTo)-1
 if (a_shipto = "-1")
  Sendinput,{end}
 else if (a_shipTo = "1")
  Sendinput,{home}
 else if (a_ShipTo > 1)
  sendinput,{home}{right %A_ShipTo%}{right}
 else if (a_ShipTo < 1)
  Sendinput,{end}{left %Absselection%}{left}
    SetWinDelay, 200
 }

DeleteRetain(){
	gLOBAL
  SetWinDelay, 450
  Breaking.Preamble()
Winactivate, NuGenesis LMS - \\Remote
	MouseGetPos, mx, mY  
; InputBox, n, number of retains to delte, , , , , mx, my,,,50
  n:=Iteration*10
  loop %n%,
  {
    TT(n,800)
    Breaking.Point()
    Winactivate, NuGenesis LMS - \\Remote
		sleep 100
		; send, {click 61, 258}
		clk(61, 258)
		sleep 300
		; winwait, Delete Tests - \\Remote
		sleep 100
    winactivate, Delete Tests - \\Remote
		send, {enter}
		sleep 800
    n--
      Breaking.Point()
      SetWinDelay, 200
  }
}


NewRequest(){
 global
 SetWinDelay, 450
;  department:= ; Clip()
 Clipboard:=
;  sleep 100
 WinActivate, NuGenesis LMS - \\Remote
click 
;  send, ^c
 clip()
 sleep 50
 sleep 400
;  tooltip, %department%
 click 64, 300 ;click Assign To New rewuest link
 Breaking.Point()
 winwaitactive, Edit request - \\Remote,,3
   if !Errorlevel
 sleep 200
 WinActivate, Edit request - \\Remote,
 click 238, 622 ;pick test
 Breaking.Point()
 winwaitactive, Select tests for request,,3
  if !Errorlevel
  sleep 100
 click, right, 264, 590 ; click to show filer
 sleep 100
 Breaking.Point()
 send,{up}{enter}
 sleep 100
 click, 97, 125 ; click filter
 send, %Department%{enter}{tab 2}
 sleep 100
 Breaking.Point()
 send, %product%{enter}
 ;click 152, 195
 send,{tab}{CtrlDown}{a}{Ctrlup}
 input, , V T3,{Lbutton}{enter}
 click 504, 338 ; click arrow
 WinActivate, Select tests for request
 click, right, 264, 590 ; click to clear filter
 send,{up}{enter}
 sleep 100
 WinActivate, Select tests for request
 sleep 100
 WinActivate, Select tests for request
 Breaking.Point()
 click 854, 657 ; click okay
 winwaitclose, Select tests for request,,3
  if !Errorlevel
  WinWaitActive, Edit request
  Breaking.Point()
 While GetKeyState("Lbutton", "p")
 sleep 100
 IfWinnotActive, Edit request
  exit
 Sleep 100
  winactivate, Edit request
  Breaking.Point()
  send,{tab}{enter}
  ; tooltip,
 return
SetWinDelay, 200
}

ChangeTestResults(Checkbox_Toggle:=0){
 global
  SetWinDelay, 450
 if (Iteration = "ERROR")
  InputBox, Iteration, enter iteration, number please,, , , , , , , 1
   if errorlevel
    reload
 ;TT(iteration, 5000)
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
    send,{tab}{Space}{tab}{Space}
    send,{tab 10}^a
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
   Breaking.Point()
   if keep_running = n ;another signal to stop
    return
   click
   return
 }
 MouseGetPos, xpos, ypos
 click
 Mouse_Click("Orient_ResultEntry")
 if Checkbox_Toggle Contains Toggle
  sendinput,{tab}{Space}{tab}{Space}
 else
  sendinput,{tab}{tab}
 sendinput,{tab 10}^a
 sleep 100
 send, %Iteration%
 sleep 100
 mousemove, xpos, ypos+26
 return
SetWinDelay, 200
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
  winwaitactive, Edit test (Field Configuration: I`, Analytical) - \\Remote,, 3
  sendinput,{Click, 402, 284}{end}(on sample log){click, 334, 618}
  winwaitactive, NuGenesis LMS - \\Remote,,3
  sleep 300
  winactivate, NuGenesis LMS - \\Remote
  sleep 500
  send,{click, 1290, 703}{down %A_index%}
 }
 return
}

Main_EditResults()
{
 sendinput,{click}{click 77, 751} ;edit results
 winwaitactive, Results Definition - \\Remote,,3
 return
}
	AddTestDescription(Text){
		sendinput,{click 305, 294}{end}%TEXT%{click 330, 617}
	}




SelectTestSample(){
global
setWinDelay, 450
MouseGetPos, mx, my
click
;{
  clip()
  sleep 300
 click 647, 75
 sleep 600
;  winwait, Select samples for test,,3
 if !Winactive("Select samples for test")
  winactivate, Select samples for test
 click 463, 71
 Breaking.Point()
 send,{click 244, 69}
 sleep 200
 send,{click 205, 184}
 sleep 200
 Breaking.Point() 
 send,{click 171, 127}^{a}%department%{enter}{tab}^a{click 506, 323}
 sleep 300
 send, {click}{click 851, 660}
 
 ; if (department="Analytical")
  ; send,
  ; my:=my+26
  ; MouseMove, mx, my
  ; sleep 200
  SetWinDelay, 200
return
}

}