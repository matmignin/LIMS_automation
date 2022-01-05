#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#Persistent
#SingleInstance,Force
setworkingdir, "C:\Users\mmignin\Documents\VQuest\"
#maxthreadsperhotkey, 1


Global clip := [], max := 10, choices, clipNum
Gui, Font, s10
Gui, Add, combobox, simple w200 r10 AltSubmit vclipNum
Gui, Add, Button, xm ym Hidden Default gWM_LBUTTONUP, OK
OnClipboardChange("clipChanged"), 
;OnMessage(WM_LBUTTONUP := 0x0202, "WM_LBUTTONUP")



Gui, Show,, Clipboard

return
GuiEscape:
GuiClose:
msgbox % Choices "`n`n" clipnum
Gui, Hide
Return

clipChanged(type) {
 If (type != 1)
  Return
 ;SoundBeep, 2500
 If clip.Count() = max ;max list count
  clip.RemoveAt(max), choices := RegExReplace(choices, ".+\K\|.*")
 clip.InsertAt(1, Clipboard) ;insert at spot 1 of array
 GuiControl,, clipNum, % choices := "|" SubStr(Clipboard, 1, 25) "||" Trim(StrReplace(choices, "||", "|"), "|")
} ;appennds the "Choices" dorpdown

WM_LBUTTONUP(wParam := "", lParam := "") {  ; User clicked on the GUI
 Gui, Submit, nohide
clipboard:=clipnum
 ;SendInput % "{Text}" clip[clipNum]
}