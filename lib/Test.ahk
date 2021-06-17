


;------------------------------------------------------------------------------------------------------------------------
;------------------------------------------------------TEST 1------------------------------------------------------------
;------------------------------------------------------------------------------------------------------------------------


Test_1(){  ;array - remove duplicates (case insensitive)
	global
	; LMS.OrientBoxes()
	LMS.DetectTab()
	;  mousemove,% %xTabSelect%, 40
		; winactivate, NuGenesis LMS - \\Remote
	 	; send, {click %xTabSelect%,45} 
		;  sleep 400
		if Tab in Samples,Requests,Documents,Results,Tests,MyWork
			click, 550,40
		else if Tab:="Products"
			click, 750,40
		else if Tab:="Specs"
			click, 950,40
		else if Tab:="Tab5"
			click, 1150,40
		else if Tab:="Tab6"
			click, 1350,40
		else if Tab:="Tab5"
			click, 1550,40
			; sleep 200
			else
		tooltip(Tab) 
		; send,   {tab %tabstomove%}{enter}
return
			; tabsToMove=



	
	/*
; Needed....,Please Ctrl+Left Click on the contact name field.
Test_%iteration%:
		
*/

return
Test_4:
Needed....,Please Ctrl+Left Click on the contact name field.
		Loop
		{
			Sleep, 1
			GetKeyState, KeyState, Numbpadadd, D
			if KeyState = D

					break
		}
		MouseGetPos, ContactNamePosX, ContactNamePosy
		Send {Ctrl Up}{LButton Up}
	}











}

return
;------------------------------------------------------------------------------------------------------------------------
;------------------------------------------------------TEST 2 ------------------------------------------------------------
;------------------------------------------------------------------------------------------------------------------------

Test_2(){
 Global
 LMS.DetectTab()
 sleep 200
 tooltip(Tab)
;  LMS.OrientBoxes()
;  sleep 200
;  clipboard:=
;  MouseGetPos, xt, Yt,
; xtest:= xt - XDivider
; xtest:= xt - XDivider
; tooltip(Xtest " " xt)
; clipboard:=xtest
; mousemove % xSamplesTab, YWorkTabs
 return
}
;------------------------------------------------------------------------------------------------------------------------
;---------------------------TEST 3 -----------------------------------------------------------------
;------------------------------------------------------------------------------------------------------------------------





Test_3(Code:=""){
Global












;                      creating an array and resorting without duplicates
;  oArray := ["a","B","c","A","B","C",1,1.0,"1","1.0"]

; oArray2 := [], oTemp := {}
; for vKey, vValue in oArray
; {
; 	if (ObjGetCapacity([vValue], 1) = "") ;is numeric
; 	{
; 		if !ObjHasKey(oTemp, vValue+0)
; 			oArray2.Push(vValue+0), oTemp[vValue+0] := ""
; 	}
; 	else
; 	{
; 		if !ObjHasKey(oTemp, "" vValue)
; 			oArray2.Push("" vValue), oTemp["" vValue] := ""
; 	}
; }
; vOutput := ""
; for vKey, vValue in oArray2
; 	vOutput .= vKey " " vValue "`r`n"
; MsgBox, % vOutput
; return







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
