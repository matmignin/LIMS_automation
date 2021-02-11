#IfWinActive, ahk_exe ONENOTE.EXE ;{
	Lwin & x::
	lalt & x::send, ^4
	lalt & Space::send, ^1
	Lwin & z::
	lalt & z::send,^2
	Lwin & c::
	lalt & c::SendInput, {U+02713}
	Mbutton::^tab
	lalt::return
	;F13 & Lbutton::sendinput, ^!h
	Rbutton::Rbutton
	capslock & 1::^!1
	capslock & 2::^!2
	#IfWinActive,