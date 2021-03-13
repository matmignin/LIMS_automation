RightButtons() {
global
If Winactive("ahk_exe AHK-Studio.exe") {
		suspend, On
		sleep 200
		click, right,  
		sleep 1000
		suspend, Off
		return
	}
}


#Ifwinactive, ahk_exe AHK-Studio.exe 
{
	Rbutton & F15::Test_2()
	Rbutton & F14::Test_1()
}

#ifwinactive,  outlook
capslock::return
F13 & WheelRight::
send_Batch()
SENDINPUT, {space}is updated
RETURN

#IfWinActive,
;Rbutton & F16::sendinput, % Varbar_Get(Product)()
Rbutton & Wheelup::Mouse_Wheelcut()
Rbutton & Wheeldown::Mouse_Wheelpaste()
;Rbutton & WheelLeft::sendinput, % Varbar_Get(Product)()
;Rbutton & WheelRight::Send_Batch()
Rbutton & Lbutton::Enter
Rbutton & Mbutton::Esc
Rbutton & F13::backspace
Rbutton & F15::Mouse_Location_get()
Rbutton::Rbutton








#ifwinactive