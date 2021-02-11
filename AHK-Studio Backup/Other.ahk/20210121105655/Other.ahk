

return
#ifwinactive,
Numpad0 & \::Sendinput, mmignin{tab}Kilgore7744
+!^F2::^Lbutton
enter::enter
#IfWinActive, ahk_exe firefox.exe
Capslock::return
#ifwinactive, ahk_exe OUTLOOK.EXE
Capslock::return

#ifwinactive, ahk_exe explorer.exe








ONENOTE:
#IfWinActive ,ahk_exe ONENOTE.EXE
Lwin & x::
lalt & x::send, ^4
lalt & Space::send, ^1
Lwin & z::
lalt & z::send,^2
Lwin & c::
lalt & c::SendInput, {U+02713}
Mbutton::
click, 3
sendinput,^+h
return
lalt::return
;F13 & Lbutton::sendinput, ^!h
Rbutton::Rbutton










EXCEL: 
#IfWinActive, ahk_exe EXCEL.EXE
Enter::numpadenter
;F13 & WheelLeft::Set_ProductCode()
;F13 & WheelRight::Set_Batch()
;F13 & WheelUp::wheelcut()
;F13 & WheelDown::wheelpaste()
Mbutton::^tab
Mbutton & Wheelright::^tab
Mbutton & Wheelleft::+^tab
F14::ExcelSearch()
#ifwinactive, Find and Replace,
enter::Send,!i













EDITOR:
#IfWinActive, ahk_exe AHK-Studio.exe

F15 & WheelDown::
F15 & Wheelup::
f15 & lbutton::SaveRestart()
Rbutton::
suspend, On
sleep 30
send, {Rbutton}
sleep 500
suspend, Off
return
F1::+^F1 ;search Help
PrintScreen & Space::sendinput, !m
PrintScreen::Send, %mousePosition% 
Rwin::Send, %WindowTitle%
F15 & wheelright::Send, %WindowTitle%
F15 & Wheelleft::Send, %mousePosition%
^space::
F14::sendinput, +^f
Mbutton::^!o
;F13 & Wheelright::WinMenuSelectItem, ahk_class AutoHotkeyGUI ahk_exe AHK-Studio.exe, ,4&, 2&
;F13 & Wheelleft::WinMenuSelectItem, ahk_class AutoHotkeyGUI ahk_exe AHK-Studio.exe, ,4&, 3&

+enter::SaveRestart() 
#ifwinactive,
f11::SaveRestart()
F12::ShowMouseLocation()
enter & \::SaveRestart() 
F10::Exitapp 
