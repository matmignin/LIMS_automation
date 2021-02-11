#IfWinActive,

f15 & f14::!^Tab
f14 & f15::!^+Tab

Rbutton & Wheelup::wheelcut()
Rbutton & Wheeldown::wheelpaste()
Rbutton & WheelLeft::Send_ProductCode()
Rbutton & WheelRight::Send_Batch()
Rbutton & Lbutton::Enter
Rbutton & Mbutton::Esc
Rbutton & F15::WinActivate, ahk_exe ONENOTE.EXE
Rbutton & F14::WinActivate, ahk_exe firefox.exe
Rbutton & F13::^c
Rbutton::Rbutton
;KeyWait, RButton
;click down right
;Click, up Right
;return 



F13 & LButton::Sendinput, !#{F3} ;screenshot
F13 & RButton::^lbutton
F13 & MButton::+Lbutton ; sendinput, {F3}

F13 & WheelLeft::Set_ProductCode()
F13 & WheelRight::Set_Batch()
F13 & WheelUp::wheelcut()
F13 & WheelDown::wheelpaste()
F15 & Wheelup::
F15 & Wheeldown:: 
F15 & RButton::+Lbutton
F15 & LButton::^Lbutton
F15 & Mbutton:: 
F15 & Wheelleft::
F15 & Wheelright::
F13:: ;return
	Tooltip, ☩
	sleep 4000
	tooltip,
	return
F13_Trigger:
#If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4000)
	f13::wheelcopy() 
	Wheelup::Set_Lot()
	Wheeldown::sendinput, #v
	Wheelleft::Set_ProductCode()
	Wheelright::Set_Batch() 
#If
	F14_Trigger:
	F14::
	tooltip, F14
	sleep 3000
	tooltip
	return
#If (A_PriorHotKey = "F14" AND A_TimeSincePriorHotkey < 3000)
	f14::!Tab
	Wheelup::
	Wheeldown::Closewindow()
	Wheelleft::
	Wheelright::
#If


F14 & WheelRight::winactivate, Inbox - mmignin@vitaquest.com - Outlook ahk_exe OUTLOOK.EXE
F14 & Mbutton::winactivate, ahk_class XLMAIN ahk_exe EXCEL.EXE
F14 & WheelLeft::winactivate, ahk_class Transparent Windows Client ahk_exe WFICA32.EXE
F14 & Wheeldown::ZoomOut()
F14 & wheelup::ZoomIn()
F14 & Lbutton::^Lbutton
F14 & Rbutton::+Lbutton

;Mbutton & Wheelup::sendinput, #{up}
Mbutton & Wheeldown::Closewindow() 
;Mbutton & Wheelright::Sendinput, #{Right}
;Mbutton & Wheelleft::Sendinput, #{left}
Mbutton::Mbutton
scrolllock & up::#up
scrolllock & down::#down
scrolllock & right::#right
scrolllock & left::#left
+scrolllock::Set_Batch()
+PrintScreen::Set_ProductCode()
PrintScreen::Send_ProductCode() ;right comm
ScrollLock::Send_Batch() ;right option




#IfWinActive,  

#ifwinactive, Snipper - Snipaste ahk_exe Snipaste.exe
Rbutton::Mbutton
F13::sendinput, {enter}
F13 & Rbutton::Click, 2
#IfWinActive,  Paster - Snipaste ahk_exe Snipaste.exe
Mbutton::Sendinput, {click right}{down 3}{enter}
wheelright::sendinput, ^=^=
wheelleft::sendinput, ^-^-
Rbutton::sendinput, +{click right}
#ifwinactive, 

