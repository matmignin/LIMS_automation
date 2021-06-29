Test(n){
	global
	if n=1
	{
		test_1()
		TT("test " n)
	}
	else if n=2
	{
		test_2()
		TT("test " n)
	}
	else if n=3
	{
		test_3()
		TT("test " n)
	}
	else
		test_%n%()
		return
		}

class Breaking {
	Point(){
		Global
		If GetKeyState("Space", "P") || GetKeyState("Esc", "P") || GetKeyState("Lbutton", "P") {	
		TT("Broke")
			exit
		}
		if keep_running = n ;another signal to stop
				Exit
	}
	Preamble(){
		Global
		if keep_running = y
		{
			keep_running = n ;signal other thread to stop
			exit
		}
		keep_running = y
	}
	}
;------------------------------------------------------------------------------------------------------------------------
;------------------------------------------------------TEST 1------------------------------------------------------------
;------------------------------------------------------------------------------------------------------------------------


Test_1(){  ;array - remove duplicates (case insensitive)
	global

WinMove, PDF Preview - \\Remote, , 232, -1114, 960, 1110

return
			; tabsToMove=
}

	
	/*
; Needed....,Please Ctrl+Left Click on the contact name field.
Test_%iteration%:
		

*/
Test_4:

		; Loop
		; {
		; 	Sleep, 1
		; 	GetKeyState, KeyState, Numbpadadd, D
		; 	if KeyState = D

		; 			break
		; }
		; MouseGetPos, ContactNamePosX, ContactNamePosy
		; Send {Ctrl Up}{LButton Up}
;	}

return












return
;------------------------------------------------------------------------------------------------------------------------
;------------------------------------------------------TEST 2 ------------------------------------------------------------
;------------------------------------------------------------------------------------------------------------------------

Test_2(){
 Global
 LMS.DetectTab()
 sleep 200
 TT(Tab)
;  LMS.Orient()
;  sleep 200
;  clipboard:=
;  MouseGetPos, xt, Yt,
; xtest:= xt - XDivider
; xtest:= xt - XDivider
; TT(Xtest " " xt)
; clipboard:=xtest
; mousemove % xSamplesTab, YWorkTabs
 return
}
;------------------------------------------------------------------------------------------------------------------------
;---------------------------TEST 3 -----------------------------------------------------------------
;------------------------------------------------------------------------------------------------------------------------





Test_3(Code:=""){
Global

; Loop, Read, Batch.Txt
	
; 	; If A_Index = 1
; 		; Continue
; 	Batches := StrSplit(A_LoopReadLine, "`n")
; ; loop, read, Batch.txt
; 	; loop, parse, A_LoopReadLine,
; 		; Batches.insert(A_LoopField)
		
; 		Msgbox % Batches[0]













; 	; }
}




AddCanceled(){
 winactivate, Edit test (Field Configuration: F, Micro) - \\Remote
 sendinput,{click 399, 219}{end}'(Canceled'){enter}
}

blockRepeat(time=200){
 SetTimer, BlockInput, -%time%
 return
}

ToggleFilter_Test_1(){
 WinActivate, NuGenesis LMS - \\Remote
 click 489, 836, R
 sendinput,{down 2}{enter}
}

FilterSearch_Test(TestName:="", MethodName:=""){
 WinActivate, NuGenesis LMS - \\Remote
 click 1230, 648 ;click name Divider
 send, ^a%TestName%{enter}
 click 1067, 647 ; click method ID Divider
 send, ^a%MethodName%{enter}{tab 4}
}

return
