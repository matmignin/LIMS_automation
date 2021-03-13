
		#IfWinActive, ahk_exe AHK-Studio.exe 
		F19::Sendinput, %MousePosition%
		F20::Sendinput, %WindowTitle%
		;F13::return
		Mbutton::
		{
			Click, 3
			send, ^c
			return
		}
		Enter::sendinput, {enter}
		;F13 & wheelright::
		;Sendinput, ^x
		;ClipWait, 1
		;AHKClipboard := Clipboard
		;return
		;F13 & wheelleft::send, %ahkclipbard%
		;wheelright::WHeelright()
		;wheelleft::WheelLeft()
		F1::
		F2::
		F3::
		F4::
		F12::
		F11::
		DoublePress()
		return
		
		
		;f15 & lbutton::SaveRestart()
		Rbutton & F13::backspace
		
		
		Rbutton::
		{
			suspend, On
			sleep 30
			send, {Rbutton}
			sleep 500
			suspend, Off
			return
		}
		
		Media_Prev::+^F1
		F3::+^F1 					;search Help
		
		Capslock & F14::
		RButton & wheelright::Send, %WindowTitle%
		Capslock & F13::
		Rbutton & Wheelleft::Send, %MousePosition%
		F13 & Mbutton::send, F9{enter}
		F14 & Wheeldown::Mouse_WheelZoomOut()
		F14 & wheelup::Mouse_WheelZoomIn()
		;+enter::SaveRestart() 
		#ifwinactive,
		
		
		
		SaveRestart()
		{
			WinActivate, AHK Studio ahk_exe AHK-Studio.exe
			WinMenuSelectItem, ahk_class AutoHotkeyGUI ahk_exe AHK-Studio.exe, ,1&, 7& ; run in AHK Stuidio
			sleep 100
			reload
			return
		}
		SaveRerun()
		{
			WinMenuSelectItem, ahk_class AutoHotkeyGUI ahk_exe AHK-Studio.exe, ,4&, 8& ; run in AHK Stuidio
			return
		}