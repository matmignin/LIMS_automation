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
	Rbutton & Wheelup::wheel_cut()
	Rbutton & Wheeldown::wheel_paste()
	Rbutton & WheelLeft::Send_ProductCode()
	Rbutton & WheelRight::Send_Batch()
	Rbutton & Lbutton::Enter
	Rbutton & Mbutton::Esc
	Rbutton & F13::backspace
	Rbutton & F14::MouseLocation_Show()
	Rbutton::Rbutton
