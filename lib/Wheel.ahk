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



