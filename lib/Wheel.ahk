; Wheel_scroll(direction){
; 	global
; 	if N=1
; 		exit
; 	ifwinactive, Result Editor - \\Remote
; 		{
; 			mousemove, 505, 200,0
; 			mouseclickDrag, L,0, 0, 0, %Direction%,0,R	; mouseclick, %upOrDown%, ,,1,0	0
; 		}
;  ifwinactive, Test Definition Editor - \\Remote
; 		{
; 			click, 466, 490,2
; 			;mousemove, 229, 244
; 			sleep 300
; 		return
; 		}
;  ifwinactive, Edit Formulation - \\Remote
; 		{
; 			click, 450, 460,2
; 			click 403, 349
; 			MouseMove, 250, 286
; 			sleep 300
; 		return
; 		}
; 	N=1
; 	SetTimer, RemoveToolTip, 800
; 	return
; 	}













Wheel_2(commands,Sleeptime:=800)
{
	global
	If (A_PriorKey!=A_ThisHotkey) || (A_TickCount-LastActivation > 400)
	{
	blockinput on
	LastActivation:=A_TickCount
	sendinput, %Commands%
	sleep %sleeptime%
 send,{altup}{CtrlUp}{ShiftUp}{LWinUp}
	blockinput off
	}
	return
}

Wheel(commands,Sleeptime:=800)
{
	BlockInput, On
	send, %Commands%
	BlockInput, Off
	sleep %sleeptime%
  send,{altup}{CtrlUp}{ShiftUp}{LWinUp}
	return
}



Wheel_Right(){
	global
	If winactive("ahk_exe AHK-Studio.exe"){
		sendinput, !{right}
	} Else If winactive("ahk_exe explorer.exe"){
		sendinput, !{right}
	} Else If winactive("ahk_exe EXCEL.EXE"){
		Wheel("{wheelleft}",0)
	} Else If winactive("outlook"){
		Send,{wheelright}
	} Else If winactive("Result Entry - \\Remote"){
		WorkTab.ChangeTestResults("toggle")
	} else if Winactive("Select tests for request"){
		Mouse_Click("Select_TestsForRequests")
		;LMS
	} Else If winactive("NuGenesis LMS - \\Remote"){
		WorkTab.Main_EditResults()
		;ProductTab
	} else if winactive("Edit Formulation - \\Remote"){
		return
	} else if winactive("Composition - \\Remote"){
		Mouse_Click("Edit")

	} else if winactive("Edit Ingredient - \\Remote"){
		ProductTab.DropDown_Ingredient()
	} Else If winactive("Test Definition Editor - \\Remote "){
		SpecTab.TestDefinitionEditor(Description)
	} Else If winactive("Results Definition - \\Remote "){
		Mouse_Click("Add")
	} Else If winactive("Paster - Snipaste ahk_exe Snipaste.exe"){
		sendinput, ^=^=
		;=============================================================================
	} Else if winactive("Edit sample (Field Configuration: I`, Physical) - \\Remote"){
		Excel.Connect()
		sendinput,{tab 2}{right}{click 277, 139}{tab 6}%Batch%
		Send,{wheelright}
	}
		return

}


Wheel_left(){
global
	If winactive("ahk_exe AHK-Studio.exe"){
		sendinput, !{left}
	} Else If winactive("ahk_exe explorer.exe"){
		sendinput, !{left}
	} Else If winactive("Result Entry - \\Remote"){
		WorkTab.ChangeTestResults()
		;ProductTab
} Else If winactive("ahk_exe EXCEL.EXE"){
		Wheel("{wheelright}",0)
	} Else If winactive("outlook"){
		Send,{wheelleft}
	} else if Winactive("Select tests for request"){
		Mouse_Click("Select_TestsForRequests")
		;LMS
	} Else If winactive("NuGenesis LMS - \\Remote"){
		Mouse_click("Main_search")
	} else if winactive("Edit Formulation - \\Remote"){
		return
	} else if winactive("Composition - \\Remote"){
		Mouse_Click("Add")
	} else
		Send,{wheelleft}
		return

}



Wheel_Paste()
{
	Global
	BlockInput, on
	if winactive("ahk_exe WFICA32.EXE")
	{
		Clipboard := Trim((Clipboard, "`r`n"))
		sleep 80
		send, %Clipboard%
		; TT("Paste")
	}
	else
	send, {ctrldown}{v}{ctrlup}
		blockinput off
	; TT("Paste")
		; sendlevel 0
   ; send,{altup}{CtrlUp}{ShiftUp}{LWinUp}
			sleep 50
	return
}
Wheel_Cut()
{
	global
	PreClip:=ClipboardAll
	clipboard:=
	; sendlevel 2
	Send, ^x

	clipwait, 1
	 TT(clipboard)
	sleep 400
	; sendlevel 0
  send,{altup}{CtrlUp}{ShiftUp}{LWinUp}
	return
}
Wheel_Copy()
{
	global
		PreClip:=ClipboardAll
		clipboard:=
	; sendlevel 2
	Send, ^c
	clipwait, 1
	; sleep 100
	; sendlevel 0
	; TT(clipboard)
	sleep 50
  send,{altup}{CtrlUp}{ShiftUp}{LWinUp}
	return
}