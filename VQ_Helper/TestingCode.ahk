#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir,  U:\VQ_Helper\
listLines On

spectab.Methods()
; #Include, U:\VQ_Helper\RawFiles\VQ_Helper.ahk
#includeAgain, U:\VQ_Helper\RawFiles\NuGenesis.ahk
#includeAgain, U:\VQ_Helper\RawFiles\ClipBar.ahk
#IncludeAgain, U:\VQ_Helper\RawFiles\RemoteKEYS.ahk

; Call a method on the object

; Create an instance of the object exported by VQ_Helper.exe
;vqHelper := ComObjCreate("VQ_Helper.Application":)

; Call a method on the object

; Call a method in the VQ_Helper_exe script
; vq.DoSomething()

; Access a variable in the VQ_Helper_exe script
; vqVar := vq.SomeVar
return

; Hotkey to reload the script
^+esc::
Reload
MsgBox, 0x40, Script Reloaded, The script has been reloaded.
Return

