	#SingleInstance,Force
	#Persistent
	#NoEnv
; SetBatchLines, -1
	#HotkeyInterval 1000
	#MaxHotkeysPerInterval 210
	#ClipboardTimeout 7500
	#HotkeyModifierTimeout
	#maxthreadsperhotkey, 1
	SetTitleMatchMode, 2
#winactivateForce
; SetControlDelay -1
	CoordMode, ToolTip, Window
	SetNumlockState, on
	SetscrolllockState, off
	CrLf=`r`n
	SetNumlockState Alwayson
	setcapslockstate alwaysoff
	SetWorkingDir, %A_ScriptDir%
	SetscrolllockState, alwaysoff
AutoTrim, On
	SetKeyDelay, -1 , 0
	RegexSampleGUID:="i)(?P<SampleGUID>\b[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}\b)"
	RegexSampleID:="i)(?P<SampleID>\b23[0-1][0-9]{5}|S[0-9]{8}-[0-9]{3}\b)"
RegexBatch:= "i)(?<!Ct#)(?P<Batch>\d{3}-\d{4}\b)"

full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}



OnClipboardChange("clipChange")

	return
clipChange(type){
	global
	rSampleGUID:=
	rSampleID:=
	rbatch:=
	if SampleID
	PreviousSampleID:=SampleID
	if SampleGUID
	PreviousSampleGUID:=SampleGUID
	SampleID:=
	SampleGUID:=
	sleep 75
	If winactive("NuGenesis LMS"){
	clipboardParse:=Clipboard
		Sampleid:=Trim(RegExMatch(ClipboardParse, RegexSampleID, r))? rSampleID : SampleID
		SampleGUID:=TRIM(RegExMatch(ClipboardParse, RegexSampleGUID, r))? rSampleGUID : SampleGUID
		Batch:=TRIM(RegExMatch(ClipboardParse, RegexBatch, r))? rBatch : Batch
		tooltip, %rbatch% `t %rSampleID% `t %rSampleGUID%, 600,0
		sleep 900
		tooltip,
	}
	if (SampleID!=PreviousSampleID) && (SampleID)
  {
    Loop, Read, U:\VQ_Helper\PriorSampleIDs.txt
    {
      if SampleID:=Trim(A_LoopReadLine)
        exit
    }
    FileAppend, %SampleID%`n, U:\VQ_Helper\PriorSampleIDs.txt
    }
	if (SampleGUID=PreviousSampleGUID) && (SampleGUID)
  {
    Loop, Read, U:\VQ_Helper\PriorSampleGUIDs.txt
    {
      if SampleGUID:=Trim(A_LoopReadLine)
        exit
    }
    FileAppend, %SampleGUID%`n, U:\VQ_Helper\PriorSampleGUIDs.txt
	}
	if !SampleID
		SampleID:=PreviousSampleID
	if !SampleGUID
		SampleGUID:=PreviousSampleGUID
	else
	return
}



~RWin::Send {Blind}{vkFF}
~LWin::Send {Blind}{vkFF}


#ifwinactive, TIBCO Jaspersoft
+enter::
	ControlClick,ToolbarWindow3254, TIBCO Jaspersoft,,,, x10 y10
	sleep 300
	; send, {down}{enter}
	return
; +enter::ControlClick ,Button47, TIBCO Jaspersoft
	; +Enter::click 648, 241
F8::click 648, 241
F9::controlclick, Button47, TIBCO Jaspersoft
F7::PriorSampleIDsMenu(1)

#ifwinactive, Parameter: SAMPLEGUID
F9::
+^v::
	controlclick, Button1, Parameter: SAMPLEGUID
	; click 372,79
	sleep 500
	; winwaitactive,
	; controlclick, Edit1, Parameter: SAMPLEGUID
	send, {tab}
	sleep 100
	send, ^{v}
	sleep 200
	send, {tab}{enter}
	sleep 200
	click 256, 473
	winwaitactive, TIBCO Jaspersoft,,5
		sleep 200
	sleep 200
	ifwinactive, TIBCO Jaspersoft
		{
		; ControlClick,ToolbarWindow3254, TIBCO Jaspersoft,,,, x80 y10
		sleep 300
		ControlClick,ToolbarWindow3254, TIBCO Jaspersoft,,,, x10 y10
		; sendinput, {down}{enter}
		}
	; controlclick, Buttton6, Parameter: SAMPLEGUID
	; click 253, 472
return

#Ifwinactive, ahk_exe eln.exe
	F1::sendinput, %batch%
	F2::Sendinput, %SampleID%
	F3::Sendinput, %SampleGUID%


#ifwinactive, ahk_class XLMAIN ahk_exe EXCEL.EXE
	F2::Sendinput, %SampleID%{enter}
	+F7::Sendinput, %SampleID%{enter}
F3::Sendinput, %SampleGUID%{enter}
F8::
CoordMode, Mouse, Screen
	MouseGetPos, rmx, rmY,
	if rmx < 400
		rmx:= 400
	if rmy< 600
		rmy:=600
	WinMove, ahk_class XLMAIN ahk_exe EXCEL.EXE,, 0, 0, %rMx%, %rmy%
	sleep 400
CoordMode, Mouse, Window
return

#ifwinactive

#v::Send, ^{v}
!v::Send, ^v
F1::Sendinput, %Batch%
F2::Sendinput, %SampleID%
F3::Sendinput, %SampleGUID%





PriorSampleIDsMenu(ShowMenu:=""){
	global
	; PreviousSampleIDs:=[]
	try Menu, sampleIDMenu, DeleteAll
	FileRead, PriorSampleIDs, PriorSampleIDs.txt
	PriorSampleIDs:=Trim(StrReplace(PriorSampleIDs, "`n`n", ""))
	Loop, parse, PriorSampleIDs, "`n"
		{
		Menu, sampleIDMenu, Add, %a_LoopField%, PriorSampleIDsMenubutton,
			; PreviousSampleIDs.Push(A_loopfield)
	}
		Menu, sampleIDMenu, Add,
		Menu, sampleIDMenu, Add, Edit List, EditListButton

		if ShowMenu
			Try Menu,sampleIDMenu,show
	return


	PriorSampleIDsMenubutton:
	winactivate, ahk_exe Jaspersoft Studio.exe
	Clipboard:=A_ThisMenuItem
	sleep 200
	if (winactive("TIBCO Jaspersoft") || winactive("Parameter: SAMPLEGUID")) {
	ifwinactive, TIBCO Jaspersoft
	{
		ControlClick,ToolbarWindow3254, TIBCO Jaspersoft,,,, x75 y10
		sleep 200
		controlclick, Button47, TIBCO Jaspersoft
		sleep 200
		winwaitactive, Parameter: SAMPLEGUID,,2
		sleep 200
	}
		sleep 200
	ifwinactive, Parameter: SAMPLEGUID
	{
		controlclick, Button1, Parameter: SAMPLEGUID
		sleep 200
		send, {tab}
		sleep 100
		send, ^v
		sleep 300
		send, {tab}{enter}
		click 256, 473
		sleep 100
		winwaitactive, TIBCO Jaspersoft,,2
		sleep 200
		ControlClick,ToolbarWindow3254, TIBCO Jaspersoft,,,, x10 y10
		return
		; controlclick, Buttton6, Parameter: SAMPLEGUID
			}
	}
	else
		sendinput % Trim(A_ThisMenuItem)
	return
		; sendinput % A_ThisMenuItem
	; Clipboard:= Trim(A_ThisMenuItem)
	try Menu, sampleIDMenu, DeleteAll
	return

	EditListButton:
	Run, Edit "\\10.1.2.118\users\vitaquest\mmignin\VQ_Helper\PriorSampleIDs.txt"
	return


}