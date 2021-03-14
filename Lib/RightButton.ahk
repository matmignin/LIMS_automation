/*
	RightButtons() {
	global
	If Winactive("ahk_exe AHK-Studio.exe") {
			suspend, OnRbuttonRbutton
			sleep 200
			click, right,  
			sleep 1000
			suspend, Off
			return
		}
	}
*/


#IfWinActive, ahk_exe AHK-Studio.exe 
Rbutton::
suspend, On
sleep 50
MouseClick, Right,,,1, 0, D
sleep 500
MouseClick, Right,,,1, 0, U
suspend, Off
return




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
Rbutton::Click, Right








#ifwinactive