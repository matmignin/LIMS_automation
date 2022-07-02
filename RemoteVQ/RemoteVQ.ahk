if A_username != mmignin
	exitapp
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
	#ClipboardTimeout 5500
	; #HotkeyModifierTimeout
	SetKeyDelay,0,0
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
	Menu, Tray, Add, windowSpy, windowSpy
	Menu, Tray, Add, All Batches, AllBatchesMsgbox
	Menu, Tray, Add, All Products, AllProductsMsgbox
	Menu, Tray, Add, &Reload, ReloadSub
	; Menu, Tray, add, Enter Specs, EnterSpecs
	Menu, Tray, add, Show Final Label Copy, ShowFinalLabelCopy
	Menu, Tray, add, Show Scan Label Copy, ShowScanLabelCopy
	Menu, Tray, add, Show Total CoAs, ShowFINAL_C_O_A
	Menu, Tray, add, Show EditBox, ShowEditBox
	Menu, Tray, add, AddClipBoardToList, AddToList
	Menu, Tray, Add, Show Variables, ShowVariables
	Menu, Tray, Default, &Reload
	copypasteToggle:=0
	RegexProduct:="i)(?<=[\w\d]{3})?(?P<Product>[abcdefghijkl]\d{3})"
	RegexBatch:= "i)(?<!Ct#)(?P<Batch>\d{3}-\d{4}\b)"
	RegexLot:= "i)(?P<Lot>\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d)"
	RegexCoated:= "i)(\d{4}\w\d\w?.|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d\s|coated: |ct#|ct\s?|coated\s?|ct#/s)(?P<Coated>\d{3}-\d{4})"
	RegexSampleID:="i)(?P<SampleID>(s|\$)202\d{5}-\d{3})"
	; Menu, Tray, Add, Test_1, test_1
	OnClipboardChange("clipChange")
	PasteTime:=A_TickCount
	; CodeFile:= "\\10.1.2.118\users\vitaquest\mmignin\RemoteVQ\Code.txt"
	OnExit("Clipbar.SaveVariables")
	SetTimer,activeCheck, %ActiveTimerCheck%
	ReadIniFiles()



	; Menu, Tray, Add, E&xit, ExitSub
	LMS.Orient()
	sleep 200
	Clipbar.Show()
	try Menu, Tray, Icon, %AppIconPath%
	#include Nugenisis.ahk
	#include ClipBar.ahk
	#include CodeClip.ahk
	#Include RemoteKEYS.ahk
	SetWinDelay, %NormalWinDelay%


	; RegexCoated = "i)(?:\d{4}\w\d\w?.|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d\s|coated:?\s?|ct\#?\s?)(?P<Coated>\d{3}-\d{4})"



return
ReadIniFiles(){
	global
	iniRead, Product, Settings.ini, SavedVariables, Product
	iniRead, Batch, Settings.ini, SavedVariables, Batch
	iniRead, Lot, Settings.ini, SavedVariables, Lot
	iniRead, Coated, Settings.ini, SavedVariables, Coated
	iniRead, SampleID, Settings.ini, SavedVariables, SampleID
	; iniread, PriorCodeString, Settings.ini, SavedVariables, PriorCodeString
	iniread, CodeString, Settings.ini, SavedVariables, CodeString
	iniRead, Ingredient_List_Adjustment, Settings.ini, Config, Ingredient_List_Adjustment
	iniread, NormalWinDelay, Settings.ini, Config, NormalWinDelay
	iniread, ActiveTimerCheck, Settings.ini, Config, ActiveTimerCheck
	iniRead, IngredientNoteDropDownCount, Settings.ini, Config, IngredientNoteDropDownCount

	iniRead, DescriptionTextInput, Settings.ini, SavedVariables, DescriptionTextInput
	iniRead, Iteration, Settings.ini, SavedVariables, Iteration

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

	iniRead, ScansLabelCopyPath, Settings.ini, FilePaths, ScansLabelCopyPath
	iniread, FinalLabelCopyPath, Settings.ini, FilePaths, FinalLabelCopyPath
	iniread, 2022_Final_C_O_APath, Settings.ini, FilePaths, 2022_Final_C_O_APath
	iniread, FinishedLabelCopyPath, Settings.ini, FilePaths, FinishedLabelCopyPath
	iniread, ManualCOAPath, Settings.ini, FilePaths, ManualCOAPath
	iniread, mfgPath, Settings.ini, FilePaths, mfgPath
	iniread, WindowSpyPath, Settings.ini, FilePaths, WindowSpyPath
	iniread, AppIconPath, Settings.ini, FilePaths, AppIconPath
	iniread, CustomerListPath, Settings.ini, FilePaths, CustomerListPath
	iniread, CodeFile, Settings.ini, FilePaths, CodeFile
}



Reloadsub(){
	global
	reload
  }
Exitsub(){
	global
	exitapp
  }
windowSpy(){
  Run, WS.exe,%WindowSpyPath%\
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
	run, edit Settings.ini
	sleep 200
	WinWaitNotActive, Settings - Notepad,, 10
			; ControlSend, Edit1, {ctrl down}s{ctrl up}, Settings - Notepad,
	; winwaitclose, Settings - Notepad,,10
		; if errorlevel
		; ControlSend, Edit1, {ctrl down}s{ctrl up}, Settings - Notepad,
		readInIFiles()
		LMS.Orient()
		Clipbar.Show()
	return
ShowFinalLabelCopy:
	run, find "\\10.1.2.118\Label Copy Final"
	sleep 200
	sendinput, %Product%{enter}
	return
ShowScanLabelCopy:
	run, find %ScansLabelCopyPath%
	sleep 200
	sendinput, %Product%{enter}
	return

ShowFINAL_C_O_A:
	run, explorer %2022_Final_C_O_APath%
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
		;sleep 4000
		reload
		return
	}
	else if MouseIsOver("Clipbar ahk_exe RemoteVQ.exe"){
		TT(CodeString "`n" SampleID,2000,,,2)
		TT(copiedText "`n",2000,,65,4)
		TT(clipboard,1000,2,450,3)
		}
	else If winexist("Release: Rotational Testing Schedule"){
		winactivate,
		click 131, 141 ;click release
		sleep 800
		click %DocumentMenuSection_X%, %DocumentMenu_Y% ;click dropdown for Section menu
		sendinput, {down}{enter}
		winwaitactive, Sign:,,3
		Sendpassword()
		click %DocumentMenuDocument_X%, %DocumentMenu_Y% ;click dropdown for Document Menu
		sendinput, {down}{enter}
		return
	}
	else If winexist("Release: ahk_exe eln.exe"){
		winactivate
		click 128,146
		return
	}
	else If winexist("Delete Test"){
		winactivate,
		sleep 200
		sendinput, {enter}
		; mousemove, 222, 138
		; click
		sleep 1000
	}
	else If winexist("Delete results"){
		winactivate,
		sleep 200
		sendinput, {enter}
		; mousemove, 222, 138
		; click
		sleep 1000
	}
	else If winexist("Delete ingredients"){
		winactivate,
		sleep 200
		sendinput, {enter}
		; mousemove, 222, 138
		sleep 1000
	}
	else if winexist("Lock specification")
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
	else if winexist("Information"){
		winactivate,
		send, {enter}
	}
	; else if winactive("Settings - Notepad"){
			; WinWaitNotActive, Settings - Notepad,,
			; ControlSend, Edit1, {ctrl down}s{ctrl up}, Settings - Notepad,
			; readInIFiles()
			; LMS.Orient()
			; Clipbar.Show()
	; }
	else if winactive("NuGenesis LMS") && (A_TimeIdle > 6000){
		LMS.Orient()
		sleep 300
		SetKeyDelay,0,0
		ReadIniFiles()
		CoordMode, mouse, Window
		CoordMode, Tooltip, relative
		; #maxthreadsperhotkey, 2
		; SetTitleMatchMode, 2
		; winMove, Clipbar ahk_class Clipbar ahk_exe RemoteVQ.exe, ,%Clipbar_nuX%, %Clipbar_nuY%
		SetWinDelay, %NormalWinDelay%
		}
		; return
return

