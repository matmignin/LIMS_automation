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
	#InstallKeybdHook

	SetKeyDelay,0,0
	#InstallMouseHook
	#HotkeyModifierTimeout
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
	CoordMode, mouse, window
	SetWorkingDir, %A_ScriptDir%
	#winactivateForce
	DetectHiddenWindows, On
	SetscrolllockState, alwaysoff
	AutoTrim, On
	Menu, Tray, Add, windowSpy, windowSpy
	Menu, Tray, Add, All Batches, AllBatchesMsgbox
	Menu, Tray, Add, All Products, AllProductsMsgbox
	; Menu, Tray, Add, Test_1, test_1
	OnClipboardChange("clipChange")
	PasteTime:=A_TickCount
	; CodeFile:= "\\10.1.2.118\users\vitaquest\mmignin\RemoteVQ\Code.txt"
	; OnExit("Varbar.SaveVariables")
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
	iniread, CodeFile, Settings.ini, FilePaths, CodeFile

	SetTimer,activeCheck, %ActiveTimerCheck%
	try Menu, Tray, Icon, %AppIconPath%
	; Menu, Tray, Add, E&xit, ExitSub
	Menu, Tray, Add, &Reload, ReloadSub
	Menu, Tray, add, Enter Specs, EnterSpecs
	Menu, Tray, add, Show Final Label Copy, ShowFinalLabelCopy
	Menu, Tray, add, Show Scan Label Copy, ShowScanLabelCopy
	Menu, Tray, add, Show Total CoAs, ShowFINAL_C_O_A
	Menu, Tray, add, Show EditBox, ShowEditBox
	Menu, Tray, add, AddClipBoardToList, AddToList
	Menu, Tray, Default, &Reload
	SetWinDelay, %NormalWinDelay%

	LMS.Orient()
	varbar.Show()

	copypasteToggle:=0
	RegexProduct:="i)(?<=[\w\d]{3})?(?P<Product>[abcdefghijkl]\d{3})"
	RegexBatch:= "i)(?<!Ct#)(?P<Batch>\d{3}-\d{4}\b)"
	RegexLot:= "i)(?P<Lot>\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d)"
	RegexCoated:= "i)(\d{4}\w\d\w?.|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d\s|coated: |ct#|ct\s?|coated\s?|ct#/s)(?P<Coated>\d{3}-\d{4})"
	; RegexCoated = "i)(?:\d{4}\w\d\w?.|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d\s|coated:?\s?|ct\#?\s?)(?P<Coated>\d{3}-\d{4})"
  #include ClipBar.ahk
  #include Nugenisis.ahk
  #include CodeClip.ahk
  #Include RemoteKEYS.ahk


return

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
	AllBatchesMsg:=GetAllBatches("`n")
	sleep 200
	clip.EditBox(AllBatchesMsg)
	return
AllProductsMsgbox:
	AllProductsMsg:=GetAllProducts(" ")
	sleep 200
	clip.EditBox(AllProductsMsg)
	return

EnterSpecs:
	ProductTab.AddIngredientsFromClipboard()
	msgbox % "Name: " Name "`nLabelclaim: " Labelclaim "`nminLimit: " minLimit "`nmaxLimit: " maxLimit "`nunits: " units
	SpecTab.AutoFill()
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
	else If winexist("Release: Rotational Testing Schedule"){
		winactivate,
		click 131, 141 ;click release
	    winwaitclose
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
		sleep 2000
	}
	else if winexist("Information"){
		winactivate,
		send, {enter}
	}
	else
		; if winactive("NuGenesis LMS") && (A_TimeIdle > 2000){
		; LMS.Orient()
		; sleep 300
		; winMove, VarBar ahk_class VarBar ahk_exe AutoHotkey.exe, ,%varBar_nuX%, %varBar_nuY%
		; }
		return
return

