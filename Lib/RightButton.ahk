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


#IfWinActive,
;Rbutton & F16::sendinput, % Varbar_Get(Product)()
Rbutton & Wheelup::Mouse_Wheelcut()
Rbutton & Wheeldown::Mouse_Wheelpaste()
Rbutton & WheelLeft::sendinput, % Varbar_Get(Product)
;Rbutton & WheelRight::Send_Batch()
Rbutton & Lbutton::Enter
Rbutton & Mbutton::Esc
Rbutton & F18::backspace
Rbutton & F13::Mouse_Get_WindowInfo()
Rbutton::Click, Right








#ifwinactive