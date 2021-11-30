#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#include C:\Users\mmignin\Documents\VQuest\lib\Vis\Vis2.ahk



; FileRead, SnipasteOCR, bin/OCRoutput.txt

Clipboard:= OCR("C:\Users\mmignin\Documents\VQuest\bin\OCR.png")

	try Gui, EditBox:Destroy
	result := Clipboard
	Gui EditBox: +AlwaysOnTop +ToolWindow +owner +HwndGUIID
	GUI, EditBox:Font, s12 cBlack, Consolas
	Gui, EditBox:Add, Edit, x12 y10 w400 h270 vEditBox , % Result 
	gui, EditBox:add, button, X1 y1 h2 w2 Hidden default gEditBoxButtonOK, OK
	Gui, EditBox:Show,, GUI Clipboard Test
	return
	EditBoxGuiClose:
	EditBoxGuiEscape:
	EditBoxButtonOK:
	Gui, EditBox:submit
	clipboard:=EditBox

exitapp
