#IfWinActive, ahk_exe ONENOTE.EXE ;{

	;F13 & Lbutton::sendinput, ^!h
	Rbutton::Rbutton
	capslock & 1::^!1
	capslock & 2::^!2
	#IfWinActive,