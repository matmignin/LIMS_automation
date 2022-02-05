#include C:\Windows\ShellNew\TemplateIncludeFile.ahk
;#include D:\VQuest\lib\Functions.ahk
DispToolTipText(TextIn,Format=0)
	{
	 TextOut:=RegExReplace(TextIn,"^\s*")
	 TextOut:=SubStr(TextOut,1,750)
	 StringReplace,TextOut,TextOut,`;,``;,All
	; FormatFunc:=StrReplace(CyclePlugins[Format]," ")
	; If IsFunc(FormatFunc)
	;	TextOut:=%FormatFunc%(TextOut)
	 Return TextOut
	}


CurrentList:=[]
  Loop, Read, D:\VQuest\data\CurrentCodes.txt
    {
      CurrentList.Insert(A_loopreadline)
      maxindex := A_Index
    }

    Return

~Lctrl & 1:: ;; cycle through clipboard history
;hk_cyclebackward:
If !ActiveWindowID
	WinGet, ActiveWindowID, ID, A
cyclebackward:=1
PreviousClipCycleCounter:=0 ; 13/10/2017 test
ClipCycleCounter:=1
ClipCycleFirst:=1
While GetKeyState("Lctrl","D") and cyclebackward
	{
	 If (ClipCycleCounter <> 0)
	 {
		 Var:=CurrentList[ClipCycleCounter]
		ttext:=% Chr(96+ClipCycleCounter) " : " DispToolTipText(Var)
	 }
	 else
		ttext:="[cancelled]"
	 If (oldttext <> ttext)
		{
		 ToolTip, % ttext, %A_CaretX%, %A_CaretY%
		 oldttext:=ttext
		}
	 Sleep 100
	 KeyWait, 1
	}
ToolTip
If (ClipCycleCounter > 0) ; If zero we've cancelled it
	{
	ClipText:=CurrentList[ClipCycleCounter]
	 Gosub, ClipboardHandler
	 ClipCycleCounter:=1
	}
Return

LCtrl & 1 Up::
;hk_cyclebackward_up:
PreviousClipCycleCounter:=ClipCycleCounter
If (ClipCycleFirst = 0)
	ClipCycleCounter++
ClipCycleFirst:=0
Return

ClipBoardHandler:
oldttext:="", ttext:="", ActiveWindowID:=""
If (ClipText <> Clipboard)
	{
	 StrReplace(ClipText,"`n", "`n", Count)
	}
	Clipboard:=ClipText
	StartTime:=A_TickCount
	;If ((StartTime - PasteTime) < 75) ; to prevent double paste after using #f/#v in combination
	;	 Return
		WinActivate, ahk_id %ActiveWindowID%
		Sleep, 20
	 Send, ^v
	PasteTime := A_TickCount
	 oldttext:="", ttext:="", ActiveWindowID:="",ClipboardOwnerProcessName:=""
Return