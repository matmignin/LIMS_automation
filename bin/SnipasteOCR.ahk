#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#include <Vis2>



; FileRead, SnipasteOCR, bin/OCRoutput.txt

Clipboard:= OCR("C:\Users\mmignin\Documents\VQuest\bin\OCR.png")

; Msgbox, %snipasteOCR%

exitapp
