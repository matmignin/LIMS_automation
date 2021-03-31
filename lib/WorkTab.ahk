WorkTab_EditSample(){
	global		
	;atch:=varbar_get("Batch")
	;Lot:=Varbar_Send("Lot")
	sendinput, {tab 2}{right}{click 277, 139}{tab 6}
	IfWinActive, Edit sample (Field Configuration: F`, Micro) - \\Remote
		sendinput, {tab}
	sendinput % Varbar.Send("Batch") "{tab}"
	IfWinActive, Edit sample (Field Configuration: F`, Micro) - \\Remote
		sendinput % Varbar.send("Lot") "{tab}" 
		Selection:= iteration
		AbsSelection:=Abs(Selection)-1
	if (Selection > 0)
		sendinput, {home}{right %selection%}
	else if (Selection < 0)
		Sendinput, {end}{left %Absselection%}
	else
		return
}

WorkTab_RegisterNewSample() 
{
	global
	winactivate, Register new samples - \\Remote
	Send, {click 179, 105}{click}
	varbar.send("Product")
	send, {enter}
}
WorkTab_NewRequest(department)
{
	click, 64, 299 ;click Assign To New rewuest link
	winwaitactive, Edit request - \\Remote
	sleep 200
	click 238, 622 ;pick test
	winwaitactive, Select tests for request
	sleep 200
	click, right, 264, 590 ; click to show filer
	sleep 100
	send, {up}{enter}
	sleep 200
	click, 97, 125 ; click filter
	send, %Department%{enter}
	sleep 100
	click 152, 195
	send ^a
	click 504, 338 ; click arrow
	sleep 200
	click, right, 264, 590 ; click to clear filter
	sleep 100
	send, {up}{enter}
	sleep 2000
	While GetKeyState("Lbutton", "p")
		Sleep 200
		sleep 1000
	IfWinnotActive, Select tests for request 
	{
		tooltip("over")
		exit
}
	click 854, 657  ; click okay
	winwaitclose, Select tests for request,,10
	if !Errorlevel
		sleep 300
;	click 338, 619 ; click okay
	return
	
}

WorkTab_ShipToSelect(x_pos:=304,y_pos:=433)
{
	global
	Menu, ShipToMenu, Add, &B, ShipToMenuHandler
	Menu, ShipToMenu, Add, &C, ShipToMenuHandler
	Menu, ShipToMenu, Add, &D, ShipToMenuHandler
	Menu, ShipToMenu, Add, &Equilife, ShipToMenuHandler
	Menu, ShipToMenu, Add, &E, ShipToMenuHandler
	Menu, ShipToMenu, Add, &F, ShipToMenuHandler
	Menu, ShipToMenu, Add, &G, ShipToMenuHandler
	Menu, ShipToMenu, Add, &H, ShipToMenuHandler
	Menu, ShipToMenu, Add, &I, ShipToMenuHandler
	Menu, ShipToMenu, Add, &J, ShipToMenuHandler
	Menu, ShipToMenu, Add, &K, ShipToMenuHandler
	Menu, ShipToMenu, Add, &L, ShipToMenuHandler
	Menu, ShipToMenu, Add, &M, ShipToMenuHandler
	Menu, ShipToMenu, Add, &N, ShipToMenuHandler
	Menu, ShipToMenu, Add, &O, ShipToMenuHandler
	Menu, ShipToMenu, Add, &P, ShipToMenuHandler
	Menu, ShipToMenu, Add, &R, ShipToMenuHandler
	Menu, ShipToMenu, Add, &S, ShipToMenuHandler
	Menu, ShipToMenu, Add, &T, ShipToMenuHandler
	Menu, ShipToMenu, Add, &V, ShipToMenuHandler
	Menu, ShipToMenu, Show,noactivate
	Return
	
	ShipToMenuHandler:
	winactivate, Edit sample
	sendinput, {click, %x_pos%, %y_pos%}{Home}
	If (A_ThisMenuItem = "&B") 
		sendinput, {tab}{pgdn 2}
	else if (A_ThisMenuItem = "&C") 
		sendinput, {tab}{pgdn 3}
	else if (A_ThisMenuItem = "&D") 
		sendinput, {tab}{pgdn 4}
	else if (A_ThisMenuItem = "&E") 
		sendinput, {tab}{pgdn 5}
	else if (A_ThisMenuItem = "&Equilife") 
		sendinput, {tab}{pgdn 6}{down 9}
	else if (A_ThisMenuItem = "&F") 
		sendinput, {tab}{pgdn 6}
	else if (A_ThisMenuItem = "&G") 
		sendinput, {tab}{pgdn 7}
	else if (A_ThisMenuItem = "&H") 
		sendinput, {tab}{pgdn 8}
	else if (A_ThisMenuItem = "&I") 
		sendinput, {tab}{pgdn 9}
	else if (A_ThisMenuItem = "&J") 
		sendinput, {tab}{pgdn 10}
	else if (A_ThisMenuItem = "&K") 
		sendinput, {tab}{pgdn 11}
			else if (A_ThisMenuItem = "Key Nutrients") 
		sendinput, {tab}{pgdn 10}{down 18}
	else if (A_ThisMenuItem = "&L") 
		sendinput, {tab}{pgdn 12}
	else if (A_ThisMenuItem = "&M") 
		sendinput, {tab}{pgdn 13}
	else if (A_ThisMenuItem = "&N") 
		sendinput, {tab}{pgdn 14}
	else if (A_ThisMenuItem = "&O") 
		sendinput, {tab}{end}{pgup 8}
	else if (A_ThisMenuItem = "&P") 
		sendinput, {tab}{end}{pgup 7}
	else if (A_ThisMenuItem = "&R") 
		sendinput, {tab}{end}{pgup 6}
	else if (A_ThisMenuItem = "&S") 
		sendinput, {tab}{end}{pgup 5}
	else if (A_ThisMenuItem = "&T") 
		sendinput, {tab}{end}{pgup 4}
	else if (A_ThisMenuItem = "&V") 
		sendinput, {tab}{end}{pgup 1}
	else
		return
	return
}


	WorkTab_ChangeTestResults(Checkbox_Toggle:=0) 
	{
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

