if A_username != mmignin
	exitapp
	; #MenuMaskKey vkFF
	; Critical, on
	#SingleInstance,Force
	#Persistent
	Process, Priority, , High
	#NoEnv
	Thread, NoTimers
	; Iteration=1
	; #ErrorStdOut
	; #KeyHistory 500
	#InstallKeybdHook
	#InstallMouseHook
	#ClipboardTimeout 7500
	#HotkeyModifierTimeout
	; SetKeyDelay,0,0
	#maxthreadsperhotkey, 2
	SetTitleMatchMode, 2
	FormatTime, DayString,, MM/d/yy
	FormatTime, TimeString, R
	FormatTime, CurrentDateTime,, MM/dd/yy
	FormatTime, The_Day,, MMMM d
	FormatTime, The_Hour,, htt
	FormatTime, The_Time,, hh:mm
	SetNumlockState, on
	SetscrolllockState, off
	CrLf=`r`n
	SetNumlockState Alwayson
	setcapslockstate alwaysoff
	CoordMode, mouse, Window
	CoordMode, Tooltip, relative
	SetWorkingDir, %A_ScriptDir%
	#winactivateForce
	SetscrolllockState, alwaysoff
	AutoTrim, On
	Menu,Tray,NoStandard
	Fileread, AllBatches, AllBatches.txt
	Fileread, AllProducts, AllProducts.txt

	ReadIniFiles()


	Menu, Tray, add, &Final Label Copy, ShowFinalLabelCopy
	Menu, Tray, add, &Scan Label Copy, ShowScanLabelCopy
	Menu, Tray, add, Manual &COAs folder, ShowManualCOA
	Menu, Tray, add, &mfg folder, Showmfg
	Menu, Tray, add, &GLOBAL VISION folder, ShowGlobalVision
	Menu, Tray, add, &Total CoAs, ShowFINAL_C_O_A
	Menu, Tray, Add,
	Menu, Tray, Add, All Products, AllProductsMsgbox
	Menu, Tray, Add, All Batches, AllBatchesMsgbox
	Menu, Tray, add, Show EditBox, ShowEditBox
	Menu, Tray, add, Add Sample Log, !^+F3

	Menu, Tray, Add,
	Menu, Tray, Add, Show Variables, ShowVariables
	Menu, Tray, Add, Stop Timer, StopTimer
	; Menu, Tray, Add, windowSpy, windowSpy
	Menu, Tray, Add, &Reload, ReloadSub
	Menu, Tray, Add, Exitsub, Exitsub
	Menu, Tray, Default, &Reload

	copypasteToggle:=0
	RegexProduct:="i)(?<=[\w\d]{3})?(?P<Product>[abcdefghijkl]\d{3})"
	RegexBatch:= "i)(?<!Ct#)(?P<Batch>\d{3}-\d{4}\b)"
	RegexLot:= "i)(?P<Lot>\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d)"
	RegexCoated:= "i)(\d{4}\w\d\w?.|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d\s|coated: |ct#|ct\s?|coated\s?|ct#/s)(?P<Coated>\d{3}-\d{4})"
	regexMaxLimit:="i)(<| - |NMT )(?P<maxLimit>[0-9,.]*)\s\w*"
	regexMaxLimit:="i)(<|NLT )?(?P<minLimit>(?<!NMT )[0-9.,]*)"
	regexunit:="i)(?P<unit>\w*)"
	; if SampleIDMode=GUID
		; RegexSampleID:="i)(?P<SampleID>([a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12})"
	; else if SampleIDMode=SampleID
		RegexSampleID:="i)(?P<SampleID>22[0-1][0-9][09]{4}|[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12})"
	; else
		; sampleID:=

	; Menu, Tray, Add, Test_1, test_1
	OnClipboardChange("clipChange")
	PasteTime:=A_TickCount
	; CodeFile:= "\\10.1.2.118\users\vitaquest\mmignin\RemoteVQ\Code.txt"
	OnExit("ClipBar.SaveVariables")
	SetTimer,activeCheck, %ActiveTimerCheck%

	; Menu, Tray, Add, E&xit, ExitSub
	ClipBar.Show()
	sleep 200
	LMS.Orient()
	try Menu, Tray, Icon, %AppIconPath%
	#include NuGenesis.ahk
	#include ClipBar.ahk
	#include CodeClip.ahk
	#Include RemoteKEYS.ahk
	; SetWinDelay, %NormalWinDelay%


	; RegexCoated = "i)(?:\d{4}\w\d\w?.|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d\s|coated:?\s?|ct\#?\s?)(?P<Coated>\d{3}-\d{4})"


	return




return
ReadIniFiles(){
	global
	iniRead, Product, Settings.ini, SavedVariables, Product
	iniRead, Batch, Settings.ini, SavedVariables, Batch
	iniRead, Lot, Settings.ini, SavedVariables, Lot
	iniRead, Coated, Settings.ini, SavedVariables, Coated
	iniRead, SampleID, Settings.ini, SavedVariables, SampleID
	iniRead, Iteration, Settings.ini, SavedVariables, Iteration
	; iniRead, SampleIDMode, Settings.ini, SavedVariables, SampleIDMode
	; iniread, PriorCodeString, Settings.ini, SavedVariables, PriorCodeString
	iniread, CodeString, Settings.ini, SavedVariables, CodeString
	iniRead, Ingredient_List_Adjustment, Settings.ini, Config, Ingredient_List_Adjustment
	; iniread, NormalWinDelay, Settings.ini, Config, NormalWinDelay
	iniread, ActiveTimerCheck, Settings.ini, Config, ActiveTimerCheck
	iniRead, IngredientNoteDropDownCount, Settings.ini, Config, IngredientNoteDropDownCount

	; iniRead, DescriptionTextInput, Settings.ini, SavedVariables, DescriptionTextInput
	;iniRead, Iteration, Settings.ini, SavedVariables, Iteration
	; iniRead, Iteration, Settings.ini, SavedVariables, CustomerPosition

	iniRead, HM_Units, Settings.ini, HeavyMetal_Variables, HM_Units
	iniRead, HM_Lower_Limit, Settings.ini, HeavyMetal_Variables, HM_Lower_Limit
	iniRead, Arsenic_Limit, Settings.ini, HeavyMetal_Variables, Arsenic_Limit
	iniRead, Arsenic_Requirement, Settings.ini, HeavyMetal_Variables, Arsenic_Requirement
	iniRead, Lead_Limit, Settings.ini, HeavyMetal_Variables, Lead_Limit
	iniRead, Lead_Requirement, Settings.ini, HeavyMetal_Variables, Lead_Requirement
	iniRead, Cadmium_Limit, Settings.ini, HeavyMetal_Variables, Cadmium_Limit
	iniRead, Cadmium_Requirement, Settings.ini, HeavyMetal_Variables, Cadmium_Requirement
	iniRead, Mercury_Limit, Settings.ini, HeavyMetal_Variables, Mercury_Limit
	iniRead, Mercury_Requirement, Settings.ini, HeavyMetal_Variables, Mercury_Requirement

	; iniRead, ScansLabelCopyPath, Settings.ini, FilePaths, ScansLabelCopyPath
	; iniread, FinalLabelCopyPath, Settings.ini, FilePaths, FinalLabelCopyPath
	; iniread, 2022_Final_C_O_APath, Settings.ini, FilePaths, 2022_Final_C_O_APath
	; iniread, FinishedLabelCopyPath, Settings.ini, FilePaths, FinishedLabelCopyPath
	; iniread, ManualCOAPath, Settings.ini, FilePaths, ManualCOAPath
	; iniread, mfgPath, Settings.ini, FilePaths, mfgPath
	iniread, WindowSpyPath, Settings.ini, FilePaths, WindowSpyPath
	iniread, AppIconPath, Settings.ini, FilePaths, AppIconPath
	iniread, CustomerListPath, Settings.ini, FilePaths, CustomerListPath
	iniread, CodeFile, Settings.ini, FilePaths, CodeFile

}



Reloadsub(){
	reload
  }
StopTimer(){
	SetTimer, activeCheck, Off
  }
; Orientsub(){
; 	global
; 	LMS.Orient()
;   }
Exitsub(){
	global
	ifwinnotexist, RemoteVQ ahk_exe explorer.exe
		run, explorer "\\10.1.2.118\users\vitaquest\mmignin\RemoteVQ"
	exitApp
	sleep 200
  }
windowSpy(){
  Run, WS.exe
  }

AllBatchesMsgbox:
	AllBatchesMsg:=GetAllBatches(" ")
	sleep 400
	tt(AllBatchesMsg)
	; clip.EditBox(AllBatchesMsg)
	return
AllProductsMsgbox:
	AllProductsMsg:=GetAllProducts(" ")
	sleep 400
	tt(AllProductsMsg)
	; clip.EditBox(AllProductsMsg)
	return
ShowVariables:
	listvars
	; run, edit Settings.ini
	; sleep 200
	; WinWaitNotActive, Settings - Notepad,, 10
			; ControlSend, Edit1, {ctrl down}s{ctrl up}, Settings - Notepad,
	; winwaitclose, Settings - Notepad,,10
		; if errorlevel
		; ControlSend, Edit1, {ctrl down}s{ctrl up}, Settings - Notepad,
		; readInIFiles()
		; LMS.Orient()
		; ClipBar.Show()
	return
ShowFinalLabelCopy:
	run, find "\\10.1.2.118\Label Copy Final"
	sleep 200
	; winmaximize, Search Results
	sendinput, {*}%Product%{*}{enter}
	return
ShowScanLabelCopy:
	run, find "\\10.1.2.118\share\QC LAB\Label Copy Scans"
	sleep 200
	; winmaximize, Search Results
	sendinput, {*}%Product%{*}{enter}
	return
ShowManualCOA:
	run, explorer "\\10.1.2.118\coa-lot#"
	sleep 200
	sendinput, {*}%Product%{*}{enter}
	return
Showmfg:
	run, find "\\10.1.2.118\lms\Information\ECOPY\mfg"
	sleep 200
	sendinput, {*}%Product%{*}{enter}
	return
ShowGlobalVision:
	run, find "\\10.1.2.118\Globalvision Master Copy Files"
	sleep 200
	sendinput, {*}%Product%{*}{enter}
	; winmaximize, Search Results
	return
ShowFINAL_C_O_A:
	run, explorer "\\10.1.2.118\final_c_o_a\2022 CoAs"
	return
ShowEditBox:
	clip.editbox()
	return

activeCheck:
	If winexist("Delete Attribute"){
		winactivate,
		sleep 200
		sendinput, {enter}
		; mousemove, 245, 137
		sleep 1000
	}
	else if winexist("Delete specification"){
		sleep 300
		msgbox, you sure?
		return
	}
	; else if MouseIsOver("ClipBar ahk_exe RemoteVQ.exe"){
		; TT(CodeString "`n" SampleID,2000,,,2)
		; TT(copiedText "`n",2000,,65,4)
		; TT(clipboard,1000,2,450,3)
		; }
	; else If winexist("Release: Rotational Testing Schedule"){
	; 	winactivate,
	; 	click 131, 141 ;click release
	; 	sleep 800
	; 	click %DocumentMenuSection_X%, %DocumentMenu_Y% ;click dropdown for Section menu
	; 	sendinput, {down}{enter}
	; 	winwaitactive, Sign:,,3
	; 	Sendpassword()
	; 	click %DocumentMenuDocument_X%, %DocumentMenu_Y% ;click dropdown for Document Menu
	; 	sendinput, {down}{enter}
	; 	return
	; }
	else If winexist("Release: ahk_exe eln.exe"){
		winactivate
		click 128,146
		return
	}
	else If winactive("Delete Test"){
		winactivate,
		sleep 100

		sendinput, {enter}
		; mousemove, 222, 138
		; click
		; sleep 1000
	}
	else If winactive("Delete results"){
		winactivate,
		sleep 100
		sendinput, {enter}
		; mousemove, 222, 138
		; click
		sleep 1000
	}
	else If winactive("Delete ingredients"){
		winactivate,
		sleep 200
		sendinput, {enter}
		; mousemove, 222, 138
		sleep 1000
	}
	else if winactive("Lock specification")
	{
		sendinput, !{n}
		sleep 1000
		return
	}
	else if winactive("Error") {
		ControlSend,, {enter}, Error
		sleep 200
		if winExist("Register new samples") && Product{
			winactivate,
			Sendinput, {click 185, 103,2}%Product%{enter}
		}
		sleep 1000
	}
	else if winActive("Information"){
		winactivate,
		send, {enter}
	}
	; else if winactive("Settings - Notepad"){
			; WinWaitNotActive, Settings - Notepad,,
			; ControlSend, Edit1, {ctrl down}s{ctrl up}, Settings - Notepad,
			; readInIFiles()
			; LMS.Orient()
			; ClipBar.Show()
	; }
	else
		return
	; else if winactive("NuGenesis LMS") && (A_TimeIdle > 8000){
		; Reload
	; 	; LMS.Orient()
	; 	sleep 300
	; 	; SetKeyDelay,0,0
	; 	; ReadIniFiles()
	; 	CoordMode, mouse, Window
	; 	; CoordMode, Tooltip, relative
	; 	; #maxthreadsperhotkey, 2
	; 	; SetTitleMatchMode, 2
	; 	; winMove, ClipBar ahk_class ClipBar ahk_exe RemoteVQ.exe, ,%ClipBar_nuX%, %ClipBar_nuY%
	; 	SetWinDelay, %NormalWinDelay%
		; }
		; return
return



; AHK_NotifyIcon(wParam, lParam) {
; 	Static lbutton_presses := 0, PosX := 0, PosY := 0
; 	If (lParam = 0x202) {	; WM_LBUTTONUP
; 		CoordMode, Mouse, Screen
; 		MouseGetPos, PosX, PosY ; store co-ords in case mouse moves during the timed wait below
; 		SetTimer, AHK_NotifyIcon_Continue, -300 ; Wait 300ms for a second left click, then Continue
; 		; Set counter (lbutton_presses) to 1, unless already 1; then, set to 2
; 		lbutton_presses := ((lbutton_presses != 1) ? (1) : (2))
; 		CoordMode, Menu, Window
; 		Return
; 		AHK_NotifyIcon_Continue:
; 		If (lbutton_presses = 1) { ; If only a single left click was registered
; 			CoordMode, Menu, Screen
; 			Menu, Tray, Show, %PosX%, %PosY% ; Show at stored mouse co-ords from WM_LBUTTONUP
; 		}
; 		lbutton_presses := 0 ; Reset the counter to 0
; 		CoordMode, Mouse, Window
; 		Return
; 	} Else If (lParam = 0x203) { ; WM_LBUTTONDBLCLK
; 		Return ; Do nothing besides the built-in double left click action (open the default menu item).
; 	} Else If (lParam = 0x205) { ; WM_RBUTTONUP
; 		Reloadsub()
; 	}
; 	Return true
; }


	NumberMenu(n){
	global
	try Menu, NumberMenu, DeleteAll
	Menu, NumberMenu, Add, &0, NumberMenubutton
	loop %n%,
		Menu, NumberMenu, Add, &%A_index%, NumberMenubutton
		Try Menu,NumberMenu,show
		return
NumberMenubutton:
	Iteration:=A_ThisMenuItemPos - 1
	sleep 100
	ControlsetText, Edit5,%Iteration%,ClipBar
Return
		}


