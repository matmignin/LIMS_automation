
Class Notes{

Show(){  ;array - remove duplicates (case insensitive)
	global
	try, GUI, Notes:destroy
	Iniread, Notes_X, data.ini, Locations, Notes_X
	Iniread, Notes_Y, data.ini, Locations, Notes_Y
	my_screenwidth:=Notes_x
	my_screenheight:=Notes_y
	MyArray:=[]
	FileRead, LoadedNotes, lib/Notes.txt
	MyArray := StrSplit(LoadedNotes,"`r`n")
	; loop % myarray.maxindex() {
		; LoadedNotes1:=MyArray[A_index]
	; }
	LoadedNotes1:=MyArray[1]
	; LoadedNotes2:=MyArray[2]
	; LoadedNotes3:=MyArray[3]
	; LoadedNotes4:=MyArray[4]
	; LoadedNotes5:=MyArray[5]
	; LoadedNotes6:=MyArray[6]
	; LoadedNotes7:=MyArray[7]
	; LoadedNotes8:=MyArray[8]
	gui Notes:+LastFound +AlwaysOnTop -Caption -ToolWindow +owner
	gui, Notes:add, button, Hidden default gNotesButtonOK, OK 
	gui, Notes:add, edit, y2 x2 w140 -Choose -VScroll +resize vMyEdit1, %LoadedNotes1%
	; gui, Notes:add, edit, w140 -Choose -VScroll +resize vMyedit2, %LoadedNotes2%
	; gui, Notes:add, edit, w140 -Choose -VScroll +resize vMyedit3, %LoadedNotes3%
	loop % myarray.MaxIndex() {
		n:=A_index + 1
		Myedit=myedit%n%
		Note:=myArray[n]
		gui, Notes:add, edit, w140 -Choose -VScroll +resize v%Myedit%, % myarray[n]	
	}
	; OnMessage(0x84, "WM_NCHITTEST")
	; OnMessage(0x83, "WM_NCCALCSIZE")
	gui, Notes:color, 836000
	; OnMessage(0x203, "Notes.Relocate")
	
	gui, Notes:show, w 145 x%My_ScreenWidth% y%my_screenheight%,Notes
	WinSet, Transparent, 180
	return
	
}
Add(){
	global
	; notes.close()
	; notes.show
	; n:=4
	Myedit:="vmyedit4"
	loadedNotes:="loadednotes4"
		gui, Notes:add, edit, w140 -Choose -VScroll +resize %Myedit%, %LoadedNotes%
	return
	
	
}

close(){
	global
		gui, Notes:submit, nohide
  Filedelete, lib/Notes.txt
	sleep 200
	; loop 4
	Fileappend, %MyEdit1%`n, lib/Notes.txt
	Fileappend, %MyEdit2%`n, lib/Notes.txt
	Fileappend, %Myedit3%`n, lib/Notes.txt
	Fileappend,w2s %Myedit4%`n, lib/Notes.txt
	Fileappend, %Myedit5%`n, lib/Notes.txt
	gui, Notes:destroy
  return
} 

	Save(){
		global
	gui, Notes:submit, nohide
	Filedelete, lib/Notes.txt
	sleep 200
	Fileappend, %MyEdit1%`n, lib/Notes.txt
	Fileappend, %MyEdit2%`n, lib/Notes.txt
	Fileappend, %Myedit3%`n, lib/Notes.txt
	Fileappend, %Myedit4%`n, lib/Notes.txt
	Fileappend, %Myedit5%`n, lib/Notes.txt
	Fileappend, %Myedit6%`n, lib/Notes.txt
	Fileappend, %Myedit7%`n, lib/Notes.txt
	; Fileappend, %Myedit8%`n, lib/Notes.txt
	; Fileappend, %Myedit9%`n, lib/Notes.txt
	; Fileappend, %Myedit10%`n, lib/Notes.txt
	gui, Notes:destroy
	return
}


Relocate(){
		global
		PostMessage, 0xA1, 2
		keywait, Lbutton, U
		wingetpos, Notes_x, Notes_y,W,H, Notes ahk_class AutoHotkeyGUI
		; Excel.Connect()
		IniWrite, %Notes_x%, data.ini, Locations, Notes_x
		IniWrite, %Notes_y%, data.ini, Locations, Notes_y
		sleep 300
		return
	}
WM_NCCALCSIZE()
{
    if A_Gui
        return 0    ; Sizes the client area to fill the entire window.
}

}




; ButtonAdd:
	; gui, Notes:submit
	; sleep 100
	; Note:=RegExReplace(Note "`n", "m`a)(?=^\s*;).*\R") ; remove commented lines
	; Note:=RegExReplace(Note, "\R+\R", "`r`n")     ; remove empty lines
NotesButtonOK:

	notes.Save()
	return
	
	NotesGuiClose:
	NotesGuiEscape:
	notes.Close()
	; gui, Notes:submit, nohide
	; gui, Notes:destroy
	return