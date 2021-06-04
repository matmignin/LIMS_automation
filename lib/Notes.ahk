


Class Notes {

WindowNames(){
	FileRead, WindowNames, WindowNames.ini
	gui, notes:add, edit, r5 vWindowNames
	gui, Notes:add, button, default, Add
}


Show(){
	gui, Notes:show
	WinSet, AlwaysOnTop, on, A
	return
}




}


ButtonAdd:
	gui, Notes:submit
	sleep 100
	Note:=RegExReplace(Note "`n", "m`a)(?=^\s*;).*\R") ; remove commented lines
	Note:=RegExReplace(Note, "\R+\R", "`r`n")          ; remove empty lines
	FileAppend, %Note%`n, WindowNames.ini
	return
