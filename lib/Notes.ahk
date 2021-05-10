FileRead, Note, Notes.txt

gui, add, edit, r5 vNote
gui, add, button, default, OK
gui, show
WinSet, AlwaysOnTop, on, A


return


ButtonOK:
gui, submit
sleep 100
Note:=RegExReplace(Note "`n", "m`a)(?=^\s*;).*\R") ; remove commented lines
Note:=RegExReplace(Note, "\R+\R", "`r`n")          ; remove empty lines
FileAppend, %Note%`n, notes.txt
ExitApp,

return