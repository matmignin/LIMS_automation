#include C:\Windows\ShellNew\TemplateIncludeFile.ahk
#include C:\Windows\ShellNew\TemplateIncludeFile.ahk
MODIFIED=20140808

#NoEnv              ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input      ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 2
SetBatchLines, -1
SetWorkingDir %A_ScriptDir%
Filename1=Listbox_Test
gui,1:color,black
Gui,1:Font,,FixedSys


;--- write for test --------
F1=%A_ScriptDir%\Data\CurrentCodes.txt
F2=%A_ScriptDir%\Data\RecentProducts.txt

; ifnotexist,%f1%
; {
; e4x=
; (Ltrim Join|
; abc
; def
; ghi
; jkl
; mno
; pqr
; )
; fileappend,%e4x%,%f1%
; }

; ifnotexist,%f2%
; {
; e5x=
; (Ltrim Join|
; Boston
; Houston
; Atlanta
; Springfield
; Dallas
; )
; fileappend,%e5x%,%f2%
; }
fileread,aa,%f1%
fileread,bb,%f2%
;-- end test ---------


Gui, 1:Add,Text    , cWhite  x10  y5  ,Letters
Gui, 1:Add,Text    , cYellow x110 y5  ,Cities
Gui, 1:+Delimiter`n
Gui, 1:Add, Listbox, vVar1  Altsubmit   w100 r10 y30 x5   , %aa%
Gui, 1:Add, Listbox, vVar2  AltSubmit   w100 r10 y30 x110 , %bb%
Gui, 1:Add, Button, gDelx   y200 x10  v1 ,Del-Letter
Gui, 1:Add, Button, gDelx   y200 x110 v2 ,Del-City
Gui, 1:Show,,%filename1%
return


delx:
x=%a_guicontrol%
lb=listbox%x%
vr=var%x%
fx:= % F%x%
GuiControlGet,   TheSelectedLine,,%vr%      ; get the focused item Number
Control, Delete, %TheSelectedLine%, %lb%    ; delete the focused item
ControlGet, Wholex, List,,%lb%              ;- get the whole listbox1
if wholex<>
 {
 stringreplace,wholex,wholex,`n`n,`n,all
 filedelete,%fx%
 fileappend,%wholex%,%fx%
 run,%fx%
 }
return


^esc::          ;-press ctrl+esc / redX to exit program
GuiClose:
GuiEscape:
ExitApp
;================================================

