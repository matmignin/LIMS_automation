; Wheel_2(commands,Sleeptime:=800)
; {
; 	global
; 	If (A_PriorKey!=A_ThisHotkey) || (A_TickCount-LastActivation > 400)
; 	{
; 	blockinput on
; 	LastActivation:=A_TickCount
; 	sendinput, %Commands%
; 	sleep %sleeptime%
;  send,{altup}{CtrlUp}{ShiftUp}{LWinUp}
; 	blockinput off
; 	}
; 	return
; }

; Wheel(commands,Sleeptime:=800)
; {
; 	BlockInput, On
; 	send, %Commands%
; 	BlockInput, Off
; 	sleep %sleeptime%
;   send,{altup}{CtrlUp}{ShiftUp}{LWinUp}
; 	return
; }



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
	send, {ctrldown}{v}{ctrlup}{altup}{ShiftUp}{LWinUp}
		blockinput off
			sleep 50
	return
}
Wheel_Cut()
{
	global
	PreClip:=ClipboardAll
	clipboard:=
	; sendlevel 2
	Send, {ctrldown}{x}{ctrlup}{altup}{ShiftUp}{LWinUp}

	clipwait, 1
	 TT(clipboard)
	sleep 400
	; sendlevel 0
;   send,{altup}{CtrlUp}{ShiftUp}{LWinUp}
	return
}
Wheel_Copy()
{
	global
		PreClip:=ClipboardAll
		clipboard:=
	; sendlevel 2
	Send, {ctrldown}{c}{ctrlup}{altup}{ShiftUp}{LWinUp}
	clipwait, 1
	; sleep 100
	; sendlevel 0
	; TT(clipboard)
	sleep 50
;   send,{altup}{CtrlUp}{ShiftUp}{LWinUp}
	return
}