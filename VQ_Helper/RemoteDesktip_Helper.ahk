	#SingleInstance,Force
	#Persistent
	#NoEnv
	Process, Priority,, High
	; SetBatchLines, -1
	Thread, NoTimers
	#HotkeyInterval 1000
	#MaxHotkeysPerInterval 210
	#InstallKeybdHook
	#InstallMouseHook
	#ClipboardTimeout 7500
	#HotkeyModifierTimeout
	#maxthreadsperhotkey, 2
	SetTitleMatchMode, 2
	#winactivateForce
	listLines On
	FormatTime, The_Time,, hh:mm
	SetNumlockState, on
	SetscrolllockState, off
	CrLf=`r`n
	SetNumlockState Alwayson
	setcapslockstate alwaysoff
	SetWorkingDir, %A_ScriptDir%
	SetscrolllockState, alwaysoff
	AutoTrim, On

	RegexSampleID:="i)(?P<SampleID>\b[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}\b)"


OnClipboardChange("clipChange")

	return

RWin::Send {Blind}{vkFF}
LWin::Send {Blind}{vkFF}

F9::PriorSampleIDsMenu(1)
#v::Send, ^{v}
!v::Send, ^v



clipChange(type){
  global
	sleep 75
	if InStr(Clipboard, "<<QuIT>>",true, 1,1){
    Clipboard:=
    exitApp
    Return
  }
  PreviousSampleID:=SampleID
  SampleID:=RegExMatch(Parse, RegexSampleID, r) ? rSampleID : SampleID
  if SampleID!=PreviousSampleID
  {
    Loop, Read, PriorSampleIDs.txt
    {
      if SampleID=Trim(A_LoopReadLine)
        exit
      return
    }
    FileAppend, %SampleID%`n, PriorSampleIDs.txt
    }
    return
	}



PriorSampleIDsMenu(ShowMenu:=""){
	global
	; PreviousSampleIDs:=[]
	try Menu, sampleIDMenu, DeleteAll
	FileRead, PriorSampleIDs, PriorSampleIDs.txt
	PriorSampleIDs:=Trim(StrReplace(PriorSampleIDs, "`n`n", ""))
	Loop, parse, PriorSampleIDs, "`r"
		{
		Menu, sampleIDMenu, Add, &%A_Index% `t %a_LoopField%, PriorSampleIDsMenubutton,
			; PreviousSampleIDs.Push(A_loopfield)
		}
		if ShowMenu
			Try Menu,sampleIDMenu,show
	return

PriorSampleIDsMenubutton:
	Clipboard:= Trim(A_ThisMenuItem)
	try Menu, sampleIDMenu, DeleteAll
return
}