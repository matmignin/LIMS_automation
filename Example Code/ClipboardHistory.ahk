; Retrieves saved clipboard information since when this script last ran
Loop C:\tmp\clipvar*.txt
{
  clipindex += 1
  FileRead clipvar%A_Index%, %A_LoopFileFullPath%
  FileDelete %A_LoopFileFullPath%
}
maxindex := clipindex
OnExit ExitSub

; Clears the history by resetting the indices
^+NumpadClear::
^+Numpad5::
tooltip clipboard history cleared
SetTimer, ReSetToolTip, 1000
maxindex = 0
clipindex = 0
Return

; Scroll up and down through clipboard history
^+Wheelup::
if clipindex > 1
{
  clipindex -= 1
}
thisclip := clipvar%clipindex%
clipboard := thisclip
tooltip %clipindex% - %clipboard%
SetTimer, ReSetToolTip, 1000
Return
^+Wheeldown::
if clipindex < %maxindex%
{
  clipindex += 1
}
thisclip := clipvar%clipindex%
clipboard := thisclip
tooltip %clipindex% - %clipboard%
SetTimer, ReSetToolTip, 1000
Return

; Add clipboard contents to the stack when you copy or paste using the keyboard
~^x::
~^c::
Sleep 500
clipindex += 1
clipvar%clipindex% := clipboard
thisclip := clipvar%clipindex%
tooltip %clipindex% - %thisclip%
SetTimer, ReSetToolTip, 1000
if clipindex > %maxindex%
{
  maxindex := clipindex
}
Return

; Clear the ToolTip
ReSetToolTip:
    ToolTip
    SetTimer, ReSetToolTip, Off
return

; Saves the current clipboard history to hard disk
ExitSub:
SetFormat, float, 06.0
Loop %maxindex%
{
  zindex := SubStr("0000000000" . A_Index, -9)
  thisclip := clipvar%A_Index%
  FileAppend %thisclip%, C:\tmp\clipvar%zindex%.txt
}
ExitApp