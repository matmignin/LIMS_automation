#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

; Get a reference to the running VQ_Helper_exe script
vq := ComObjActive("AutoHotkey.VQ_Helper_exe")

; Call a method in the VQ_Helper_exe script
; vq.DoSomething()

; Access a variable in the VQ_Helper_exe script
; vqVar := vq.SomeVar



; Change this to the path of your AHK script
ScriptPath := "C:\path\to\your\script.ahk"

; Hotkey to reload the script
^r::
Reload
MsgBox, 0x40, Script Reloaded, The script has been reloaded.
Return

; Hotkey to terminate the script
^Esc::ExitApp

; Run the script
Run, %ScriptPath%
