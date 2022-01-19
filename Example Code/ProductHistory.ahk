﻿#include C:\Windows\ShellNew\TemplateIncludeFile.ahk
;^F20::
CurrentList:=[]
  Loop, Read, C:\Users\mmignin\Documents\VQuest\data\CurrentCodes.Txt
    {
      CurrentList.Insert(A_loopreadline)
          maxindex := A_Index
    ; ParseList := StrSplit(A_LoopReadLine, "`n")
        ; Selection:= % ParseList[1]
      ; if A_index < 10
        ; Selection:= % "&" A_index " " ParseList[1]
      ;  else
        ; Selection:= % "&" A_index-10 " " ParseList[1]
    }
	
    Return
  ; Loop , Read,  C:\Users\mmignin\Documents\VQuest\ClipHistory\clipvar*.txt
  ; {
    ; clipindex += 1
    ; FileRead clipvar%A_Index%, %A_LoopFileFullPath%
    ; FileDelete %A_LoopFileFullPath%
  ; }
  ; maxindex := clipindex
  ; OnExit ExitSub

  ; Clears the history by resetting the indices
    ; ^+NumpadClear::
    ; ^+Numpad5::
    ; tooltip clipboard history cleared
    ; SetTimer, ReSetToolTip, 1000
    ; maxindex = 0
    ; clipindex = 0
    ; Return

  ; Scroll up and down through clipboard history
+F20::
  ^+Wheelup::
  if clipindex > 1
  {
    clipindex -= 1
  }
  thisclip :=  CurrentList[ClipIndex]  ;clipvar%clipindex%
  clipboard := thisclip
  tooltip %clipindex% - %clipboard%
keywait, Rshift, U
  SetTimer, ReSetToolTip, 1000
  Return

+F19::
  ^+Wheeldown::
  if clipindex < %maxindex%
  {
    clipindex += 1
  }
  thisclip := CurrentList[ClipIndex]
  clipboard := thisclip
  tooltip %clipindex% - %clipboard%
keywait, Rshift, U
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
    if clipindex > %maxindex%  ;for adding more files couning from the highest
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
      FileAppend %thisclip%, C:\Users\mmignin\Documents\VQuest\ClipHistory\clipvar%zindex%.txt
    }