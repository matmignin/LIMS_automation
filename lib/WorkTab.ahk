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
  SendInput, {tab 2}{right}{click 277, 139}{tab 6}
  IfWinActive, Edit sample `(Field Configuration: F`, Micro`) - \\Remote
    Send,{tab}^{a}
  SendInput, ^{a}%Batch%{tab}^{a}
  IfWinActive, Edit sample `(Field Configuration: F`, Micro`) - \\Remote
  {
    SendInput,{CtrlDown}{a}{Ctrlup}%Lot%
    SendInput,{tab 3}
    sleep 100
  if Coated
    SendInput, ^{a}%Coated%
    sleep 100
    SendInput, +{tab 2}
  }
  Breaking.Point()
  sleep 200
  If !ShipTo && !ShipToIndex
    return
  else if ShipToIndex
    This.DropdownSelect(ShipToIndex)
  else
    This.DropdownSelect(ShipTo)
  sleep 500
  Breaking.Point()
  SendInput, {enter}
  sleep 200
  blockinput, off
  winactivate, Register new samples - \\Remote
  sleep 300
  my:=my+30
  MouseMove, mx, my
  
  ;setwindelay, 200
    ; return
}


DropdownSelect(A_ShipTo){
  sleep 100
    ; SetKeyDelay, 0, 0
    ; SetWinDelay, 500
 AbsSelection:=Abs(A_ShipTo)-1
 if (a_shipto = "-1")
  Sendinput,{end}
 else if (a_shipTo = "1")
  Sendinput,{home}
 else if (a_ShipTo > 1)
  Sendinput,{home}{right}{right %A_ShipTo%}
 else if (a_ShipTo < 1)
  Sendinput,{end}{left}{left %Absselection%}
    ; setwindelay, 200
    sleep 400
if winactive("Edit sample `(Field Configuration:")
  sleep 400
      ; SetKeyDelay, 1, 0.25
    return
 }

DeleteRetain(){
	gLOBAL
  SetWinDelay, 25
    SetMouseDelay, -1
  SetDefaultMouseSpeed, 0
  CoordMode, mouse, Relative
  ; Breaking.Preamble()
  Winactivate, NuGenesis LMS - \\Remote
	MouseGetPos, mx, mY  
; InputBox, n, number of retains to delte, , , , , mx, my,,,50
  n:=Iteration*10
  SetControlDelay -1
  loop %n%,
  {
  CoordMode, mouse, Screen
	MouseGetPos, mx, mY  
  CoordMode, mouse, relative
    ; TT(n,800)
    ; Breaking.Point()
    ; Winactivate, ahk_exe WFICA32.EXE
      ; ControlClick, x61 y258, ahk_exe WFICA32.EXE
  Winactivate, NuGenesis LMS - \\Remote
    ; clk(61, 258,,,"ahk_exe WFICA32.EXE")
    send, {click 61, 258}
  CoordMode, mouse, Screen
    ; send, {click %mx%,%my%,0}
    MouseMove, %mX%, %mY%, 0,
    ; send, {click %mx%,%my%,0}
    ;clk(61, 258,,,"ahk_exe WFICA32.EXE")
    ; previousProduct:=Product
		sleep 100
		winwait, Delete Tests - \\Remote,,1.5
    if errorlevel
    {
      sleep 100
      if winexist("Warning - \\Remote")
        ControlSend,, {enter}, Warning - \\Remote
      ; Winactivate, NuGenesis LMS - \\Remote
      ; MouseClick, left, 0, 26, 1, 0, , R
    }
      ; MouseClick, left, 0, 26, 1, 0, , R
      sleep 200
      if WinExist("Delete Tests - \\Remote")
        ControlSend,, {enter}, Delete Tests - \\Remote
		  ; Send, {enter}
		sleep 100
		; sleep 500
    n--
      Breaking.Point()
  }
      setwindelay, 200
}


NewRequest(){
 global
 SetWinDelay, 550
 department:= ; Clip()
 Clipboard:=
;  sleep 100
 WinActivate, NuGenesis LMS - \\Remote
click 
 Send, ^c
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
 Send,{up}{enter}
 sleep 100
 click, 97, 125 ; click filter
 Send, %Department%{enter}{tab 2}
 sleep 100
 Breaking.Point()
 Send, %product%{enter}
 ;click 152, 195
 Send,{tab}{CtrlDown}{a}{Ctrlup}
 input, , V T3,{Lbutton}{enter}
 click 504, 338 ; click arrow
 WinActivate, Select tests for request
 click, right, 264, 590 ; click to clear filter
 Send,{up}{enter}
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
  Send,{tab}{enter}
  ; tooltip,
  setwindelay, 200
  return
}

ChangeTestResults(Checkbox_Toggle:=0,MoveNext:=""){
  global
  SetWinDelay, 550
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
  ; winactivate, Result Entry - \\Remote
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
  Send,{tab}{Space}{tab}{Space}
  Send,{tab 10}^a
  sleep 100
  Send, %Iteration%
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
    SendInput,{tab}{Space}{tab}{Space}
  else
    SendInput,{tab}{tab}
  SendInput,{tab 10}^a
  sleep 100
  if Checkbox_Toggle Contains toggle
    return
  Send, %Iteration%
  sleep 100
  if Checkbox_Toggle Not Contains Toggle
    mousemove, xpos, ypos+26 
  setwindelay, 200
  return
  }

AddSampleLog(count)
{
 global
 ;MouseGetPos, xpos, ypos
  setwindelay, 200
 loop, %count%
 {
  click 46, 877
  ;Click, xpos, ypos, 2
  ;ypos:= ypos+26
  winwaitactive, Edit test (Field Configuration: I`, Analytical) - \\Remote,, 3
  SendInput,{Click, 402, 284}{end}(on sample log){click, 334, 618}
  winwaitactive, NuGenesis LMS - \\Remote,,3
  sleep 300
  winactivate, NuGenesis LMS - \\Remote
  sleep 500
  Send,{click, 1290, 703}{down %A_index%}
 }
 return
}

Main_EditResults()
{
 SendInput,{click}{click 77, 751} ;edit results
 winwaitactive, Results Definition - \\Remote,,3
 return
}
	AddTestDescription(Text){
		SendInput,{click 305, 294}{end}%TEXT%{click 330, 617}
	}




SelectTestSample(){
global
; clipboard:=
; Department:=
; setWinDelay, 550
blockinput on
; MouseGetPos, mx, my
; click
; send, ^c
; clipwait, 0.5
;{
  ; clip()
    ; Regexmatch(Clipboard, "\bPhysical\b",Department)
    ; Regexmatch(Clipboard, "\bMicro\b",Department)
    ; sleep 200
; clip.Regex("Department")
 click 647, 75 ;click assign Samples
;  winwait, Select samples for test,,3
;  if !Winactive("Select samples for test:")
  winactivate, Select samples for test:
 sleep 900
  click 467, 71 ;Click Filter button
  sleep 200
 Breaking.Point()
 send, {click 248, 68} ;click dropdown then
 sleep 200
 send, {click 212, 188}  ; select Batches
 sleep 400
 Send, {click 136, 119}^a ;flick filter box
 if WinActive("Select samples for test: Organoleptic Sensory Test  - \\Remote")
  send, Physical{enter} ; send department
 if WinActive("Select samples for test: Microbiological  - \\Remote")
  send, Micro{enter} ; send department

 sleep 500
; Send,{click 205, 184}^a
 sleep 400
 Breaking.Point() 
;  tt(Department)
;  Send, {click 171, 127}^{a}
;  Send, %department%
;  sleep 200
;  sleep 200
;  Send, {enter}{tab}^{a}{click 506, 323}
;  sleep 300
;  Send, {click}{click 851, 660} ;click finish
 
 ; if (department="Analytical")
  ; Send,
  ; my:=my+26
  ; MouseMove, mx, my
  ; sleep 200
  ; department:=
  blockinput off
  setwindelay, 200
return
}

}