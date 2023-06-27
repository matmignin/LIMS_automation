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
	SetNumlockState, on
	SetscrolllockState, off
	CrLf=`r`n
	SetNumlockState Alwayson
	setcapslockstate alwaysoff
	SetWorkingDir, %A_ScriptDir%
	SetscrolllockState, alwaysoff
	AutoTrim, On

	RegexSampleID:="i)(?P<SampleID>\b[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}\b)"

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

; OnClipboardChange("clipChange")

	return
; clipChange(type){
;   global
; 	sleep 75
; 	PreviousSampleID:=SampleID

; 	clipboardParse:=Clipboard
; 	Sampleid:=RegExMatch(ClipboardParse, RegexSampleID, r)
; sleep 400
; 	if (SampleID=PreviousSampleID) || !(SampleID)
; 		return
; 	else
;   {
;     Loop, Read, U:\VQ_Helper\PriorSampleIDs.txt
;     {
;       if SampleID:=Trim(A_LoopReadLine)
;         exit
;     }
;     FileAppend, %SampleID%`n, U:\VQ_Helper\PriorSampleIDs.txt
;     }
;     return
; 	}
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
	mbutton::
F8::click 648, 241
F9::controlclick, Button47, TIBCO Jaspersoft


#ifwinactive, Parameter: SAMPLEGUID
F9::
+v::
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


#ifwinactive
	F7::PriorSampleIDsMenu(1)
Mbutton::PriorSampleIDsMenu(1)
return
#v::Send, ^{v}
!v::Send, ^v





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