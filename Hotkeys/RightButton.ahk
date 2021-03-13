RightButtons() {
global
If Winactive("ahk_exe AHK-Studio.exe ") {
		suspend, On
		sleep 30
		send, {Rbutton}
		sleep 500
		suspend, Off
		return
	}
}




#IfWinActive,
	Rbutton & F16::sendinput, % Varbar_Get(Product)()
	Rbutton & Wheelup::Mouse_Wheelcut()
	Rbutton & Wheeldown::Mouse_Wheelpaste()
	Rbutton & WheelLeft::sendinput, % Varbar_Get(Product)()
	Rbutton & WheelRight::Send_Batch()
	Rbutton & Lbutton::Enter
	Rbutton & Mbutton::Esc
	Rbutton & F13::backspace
	Rbutton & F14::Mouse_Location_Show()
	Rbutton::Rbutton
	
	
