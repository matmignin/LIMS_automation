#IfWinActive



	Return & Space::Send_ProductCode()
	Return & A::Enter_ProductCode("A")
	Return & E::Enter_ProductCode("E")
	Return & G::Enter_ProductCode("G")
	Return & H::Enter_ProductCode("H")
	Return & I::Enter_ProductCode("I")
	Return & J::Enter_ProductCode("J")
	Return & K::Enter_ProductCode("K")
	Return & L::Enter_ProductCode("L")
	Return & 1::Enter_Batch("011")
	Return & 2::Enter_Batch("012")
	Return & 3::Enter_Batch("013")
	Return & 4::Enter_Batch("014")
	Return & 5::Enter_Batch("015")
	Return & 6::Enter_Batch("006")
	Return & 7::Enter_Batch("007")
	Return & 8::Enter_Batch("008")
	Return & 9::Enter_Batch("009")
	Return & 0:: return
Return_0_Trigger:
#If (A_PriorHotKey = "Return & 0" AND A_TimeSincePriorHotkey < 4000)
	Return & 0::Enter_Batch("010")
	0::Enter_Batch("000")


#ifwinactive, NuGenesis LMS - \\Remote
Rbutton & Wheelleft::sendinput,%ProductCode%{enter}
;Main_ProductSearchBar()

return
F14 & Wheelup::click, 544, 41
F14 & WheelRight::click, 743, 41
F14 & Wheelleft::Click 354, 44


;Wheelright::Sendinput, {Click}{click 74, 776}    			; click Enter Results
;wheelleft::AddSampleLog(1)  ; Click 34, 747
F17::Click("SearchBar_Productcode")	; rigth comm button)))
F18::Click("SearchBar_Batch")     	   	     ; right alt button


#ifwinactive, Edit test (Field Configuration: I`, Analytical) - \\Remote
wheelright::
sendinput, {Click, 402, 284}{end}(on sample log){click, 334, 618}
winwaitactive, NuGenesis LMS - \\Remote
return



 


AddSampleLog(count) {
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
#ifwinactive,


