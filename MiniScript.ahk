#include C:\Windows\ShellNew\TemplateIncludeFile.ahk

#NoEnv              ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input      ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 2
SetBatchLines, -1
SetWorkingDir %A_ScriptDir%
Filename1=Listbox_Test
gui,Varbar:color,black
Gui,Varbar:Font,,FixedSys

;--- write for test --------

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
CurrentCodesFile=%A_ScriptDir%\Data\CurrentCodes.txt
; }
fileread,CurrentCodes,%CurrentCodesFile%
; fileread,bb,%f2%
;-- end test ---------

Gui, Varbar:+Delimiter`n`r
Gui, Varbar:Add, Combobox, vVar1 simple Altsubmit w400 r10 y10 x5, %CurrentCodes%
Gui, Varbar:Add, Button, gDelx  Hidden y200 x10  v1 ,Del
Gui, Varbar:Add, Button, gAddx  Hidden Default x+2  v2, Add
Gui, Varbar:Show,autosize,%filename1%
; OnMessage(0x0201, "WM_Lbuttonup")
OnMessage(0x0203, "WM_LBUTTONDBLCLK")
return

; WM_Lbuttondown(){
; Gui, Varbar:submit, nohide
; 	control, choose, %Var1%
; 	; msgbox % var1
; ; clip.regex(var1)
; return
; }

addx:
Gui, Varbar:submit, nohide
If Var1 is integer
{
	control, choose, %Var1%
	msgbox, %Var1%
	return
}
else
	Control, Add, %Var1%, Combobox1    ; add to the bottom of the list
	ControlGet, Wholex, List,,Combobox1              ;- get the whole listbox1
;  sort,Wholex, U R
	control, choose, %Var1%
if wholex<>
 {
 stringreplace,wholex,wholex,`n`n,`n,all
 filedelete,%CurrentCodesFile%
 fileappend,%wholex%,%CurrentCodesFile%
 }
return

WM_LBUTTONDBLCLK(){
	GUI, varbar:default
	Gui, Varbar:submit, nohide
gosub, Delx
return
}
delx:
GuiControlGet,   TheSelectedLine,,Var1      ; get the focused item Number
Control, Delete, %TheSelectedLine%, Combobox1    ; delete the focused item
ControlGet, Wholex, List,,Combobox1              ;- get the whole listbox1
	sort,CurrentCodes, U R
if wholex<>
 {
 stringreplace,wholex,wholex,`n`n,`n,all
 filedelete,%CurrentCodesFile%
 fileappend,%wholex%,%CurrentCodesFile%
 }
return


^esc::          ;-press ctrl+esc / redX to exit program
GuiClose:
GuiEscape:
ExitApp
;================================================

