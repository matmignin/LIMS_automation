
#ifwinactive, ahk_exe OUTLOOK.EXE ;{ 
Capslock::return
Mbutton::
sendinput, {click , 2}
Set_Batch()
return

Rbutton & WheelRight::
	send_Batch()
	SENDINPUT, {space}is updated
	RETURN

#ifwinactive
	
