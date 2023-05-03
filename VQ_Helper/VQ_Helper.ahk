; if A_username != mmignin
	; exitapp

	#SingleInstance,Force
	#Persistent
	Process, Priority, , High
	#NoEnv
	Thread, NoTimers
	#HotkeyInterval 1000
	#MaxHotkeysPerInterval 200
	#InstallKeybdHook
	#InstallMouseHook
	#ClipboardTimeout 3500
	#HotkeyModifierTimeout 100
	#maxthreadsperhotkey, 2
	; #MaxThreadsBuffer Off
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
	; CoordMode, Tooltip, relative
	SetWorkingDir, %A_ScriptDir%
	#winactivateForce
	SetscrolllockState, alwaysoff
	AutoTrim, On
	Fileread, AllBatches, AllBatches.txt
	Fileread, AllProducts, AllProducts.txt

	ReadIniFiles()

	WholeBatchesArray:=[]
	FileRead, WholeBatchestext, WholeBatches.txt
		Wholebatches:=Trim(Wholebatchestext,"`n")
		sleep 100
		loop, parse, WholeBatches, "`n"
      WholeBatchesArray.insert(a_LoopField)

	Menu,Tray,NoStandard
	Menu, Tray, Add, All Products, AllProductsMsgbox
	Menu, Tray, Add, All Batches, AllBatchesMsgbox
	Menu, Tray, add, &Final Label Copy, ShowFinalLabelCopy
	Menu, Tray, add, &Scan Label Copy, ShowScanLabelCopy

	Menu, Tray, add, Manual &COAs folder, ShowManualCOA
	Menu, Tray, add, &mfg folder, Showmfg
	Menu, Tray, add, &GLOBAL VISION folder, ShowGlobalVision
	Menu, Tray, add, &Total CoAs, ShowFINAL_C_O_A
	Menu, Tray, Add,
	Menu, Tray, Add, Whole Batches, ShowWholeBatches
	Menu, Tray, add, Show EditBox, ShowEditBox
	Menu, Tray, add, Add Sample Log, Add15SampleLog
	; Menu, FtenMenu, Add, ApproveTestSpec, FtenMenuHandler
	; Menu, FtenMenu, Add, NewSpecVersion, FtenMenuHandler
	; Menu, FtenMenu, Add, RemoveAndApprove, FtenMenuHandler
	; Menu, FtenMenu, Add, RemoveTestSpec, FtenMenuHandler
	; Menu, FtenMenu, Add, WholeBatchMenu, FtenMenuHandler
	; Menu, FtenMenu, Add, AddOrganoleptic, FtenMenuHandler
	; Menu, FtenMenu, Add, SelectPreviewPane, FtenMenuHandler
	; Menu, Tray, Add, Ften, :FtenMenu

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
	RegexSampleID:="i)(?P<SampleID>[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12})"
	; else if SampleIDMode=SampleID
		; RegexSampleID:="i)(?P<SampleID>22[0-1][0-9][09]{4}|[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12})"
	; else
		; sampleID:=

	; Menu, Tray, Add, Test_1, test_1
	OnClipboardChange("clipChange")
	PasteTime:=A_TickCount
	; CodeFile:= "\\10.1.2.118\users\vitaquest\mmignin\VQ_Helper\Code.txt"
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
	GUI, ClipBar:default
	; TT("VQ_Helper Started",2000,100,100)
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
	iniRead, GeneralBox, Settings.ini, SavedVariables, GeneralBox
	iniRead, SampleID, Settings.ini, SavedVariables, SampleID
	iniRead, Iteration, Settings.ini, SavedVariables, Iteration
	; iniRead, SampleIDMode, Settings.ini, SavedVariables, SampleIDMode
	; iniread, PriorCodeString, Settings.ini, SavedVariables, PriorCodeString
	iniread, CodeString, Settings.ini, SavedVariables, CodeString
	iniRead, Ingredient_List_Adjustment, Settings.ini, Config, Ingredient_List_Adjustment
	iniread, Ften, Settings.ini, Config, Ften

	; iniread, NormalWinDelay, Settings.ini, Config, NormalWinDelay
	iniread, ActiveTimerCheck, Settings.ini, Config, ActiveTimerCheck
	iniRead, IngredientNoteDropDownCount, Settings.ini, Config, IngredientNoteDropDownCount

	iniRead, NewSpecVersionDescriptionText, Settings.ini, SavedVariables, NewSpecVersionDescriptionText
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
	iniread, WindowSpyPath, Settings.ini, FilePaths, WindowSpyPath
	iniread, AppIconPath, Settings.ini, FilePaths, AppIconPath
	iniread, CustomerListPath, Settings.ini, FilePaths, CustomerListPath
	iniread, CodeFile, Settings.ini, FilePaths, CodeFile
; wholebatches = []
; 	FileRead, WholeBatches, WholeBatches.txt
; 	sleep 300
; 	loop, parse, WholeBatches, "`n"
;   	WholeBatches.insert(a_LoopField)

}



Reloadsub(){
	reload
  }
StopTimer(){
	SetTimer, activeCheck, Off
  }
Exitsub(){
	global
	ifwinnotexist, ahk_exe explorer.exe
		run, explorer "\\10.1.2.118\users\vitaquest\mmignin\VQ_Helper"
	exitApp
  }
windowSpy(){
  Run, WS.exe
  }

AllBatchesMsgbox:
	AllBatchesMsg:=Trim(GetAllBatches(" ",1))
	tt(AllBatchesMsg)
	; clip.EditBox(AllBatchesMsg)
	return
AllBatchesNoMsgbox:
	AllBatchesMsg:=Trim(GetAllBatches(" "))
	tt(AllBatchesMsg)
	; clip.EditBox(AllBatchesMsg)
	return
AllProductsMsgbox:
	AllProductsMsg:=Trim(GetAllProducts(" ",1))
	sleep 600
	tt(AllProductsMsg)
	; clip.EditBox(AllProductsMsg)
	return
AllProductsNoMsgbox:
	AllProductsMsg:=Trim(GetAllProducts(" "))
	sleep 600
	tt(AllProductsMsg)
	; clip.EditBox(AllProductsMsg)
	return
ShowWholeBatches:
	run, edit WholeBatches.txt
	return
Add15SampleLog:
	LMS.AddsampleLog(15)
	Return
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
	; run, find "\\10.1.2.118\Label Copy Final"
	run, find "\\netapp\Label Copy Final"
	sleep 550
	; winmaximize, Search Results
	send, {*}%Product%{*}{enter}
	sleep 400
	send, ^{e}{tab 2}{right}
	; SelectPreviewPane(Product)
	return
ShowScanLabelCopy:
	run, find "\\10.1.2.118\share\QC LAB\Label Copy Scans"
	sleep 250
	; winmaximize, Search Results
	sendinput, {*}%Product%{*}{enter}
	sleep 300
	send, ^{e}{tab 2}{right}
	return
ShowManualCOA:
;	run, explorer "\\10.1.2.118\coa-lot#"
run, edit RemoteKEYS.ahk
	sleep 200

;	sendinput, {*}%Product%{*}{enter}
	return
Showmfg:
	run, find "\\10.1.2.118\lms\Information\ECOPY\mfg"
	sleep 200
	sendinput, {*}%Product%{*}{enter}
	sleep 300
	send, ^{e}{tab 2}{right}
	return
ShowGlobalVision:
	run, find "\\10.1.2.118\Globalvision Master Copy Files"
	sleep 200
	sendinput, {*}%Product%{*}{enter}
	; winmaximize, Search Results
	sleep 300
	send, ^{e}{tab 2}{right}
	return
ShowFINAL_C_O_A:
	run, explorer "\\10.1.2.118\final_c_o_a\2023 CoAs"
	return
ShowEditBox:
	clip.editbox()
	return

FtenMenuHandler:
		Ften := A_ThisMenuItem
			IniWrite, %Ften%, Settings.ini, Config, Ften
			return



activeCheck:
	If winexist("Delete Attribute ahk_exe eln.exe"){
		winactivate,
		sleep 200
		sendinput, {enter}
		; mousemove, 245, 137
		sleep 1000
	}
	else if winexist("Delete specification ahk_exe eln.exe"){
			MsgBox, 4, , Do you want to continue? (Press YES or NO),5
				IfMsgBox No
					exit
				IfMsgBox timeout
				{
					winactivate
					sendinput, {n}
					return
				}
		sleep 300
		return
	}

	else if MouseIsOver("ClipBar"){
		ClipBar_x1:=Clipbar_x-110
		ClipBar_x2:=Clipbar_x-50
		ClipBar_x6:=Clipbar_x+265
			if (winControl="Edit1"){
				; GetAllProducts(" ")
				TT(AllProducts,2000,ClipBar_x1,35,2,250)
				sleep 1000
			}
				else if (winControl="Edit2"){
					; GetAllBatches(" ")
					TT(AllBatches,2000,ClipBar_x2,35,2,250)
					sleep 1000
				}

			else if (winControl="Edit3")
				return
			else if (winControl="Edit4")
				return
			else if (winControl="Edit5")
				return
			else if (winControl="Edit6"){
				TT(GeneralBox,2000,ClipBar_x6,35,2,250)
				sleep 1000
				}
		; GetAllBatches()
		; GetAllProducts()

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
		; while, MouseIsOver("ClipBar")
		; 	sleep 300
	return
	}
	else If winexist("Release: ahk_exe eln.exe"){
		winactivate
		click 128,146
		return
	}
	else If winactive("Delete Test ahk_exe eln.exe"){
		winactivate,
		sleep 100

		sendinput, {enter}
		; mousemove, 222, 138
		; click
		; sleep 1000
		return
	}
	else If winactive("Delete results ahk_exe eln.exe"){
		winactivate,
		sleep 100
		sendinput, {enter}
		; mousemove, 222, 138
		; click
		sleep 1000
		return
	}
	else If winactive("Delete ingredients ahk_exe eln.exe"){
		winactivate,
		sleep 200
		sendinput, {enter}
		; mousemove, 222, 138
		sleep 1000
		return
	}
	else if winactive("Lock specification ahk_exe eln.exe")
	{
		sendinput, {n}
		sleep 1000
		return
	}
	else if winactive("Error ahk_exe eln.exe") {
		ControlSend,, {enter}, Error
		sleep 200
		if winExist("Register new samples") && Product{
			winactivate,
			Sendinput, {click 185, 103,2}%Product%{enter}
		}
		sleep 1000
		return
	}
	else if winActive("Information ahk_exe eln.exe"){
		winactivate,
		send, {enter}
	}


	else
		return

return



	NumberMenu(n:=0, runCorrectTestResults:=""){
	global
	MouseGetPos, mx, my
	try Menu, NumberMenu, DeleteAll
	Menu, NumberMenu, Add, &0, NumberMenubutton
	loop %n%,
		Menu, NumberMenu, Add, &%A_index%, NumberMenubutton
		Try Menu,NumberMenu,show
		return
NumberMenubutton:
	if A_ThisMenuItemPos
	{
		Iteration:=A_ThisMenuItemPos - 1
	sleep 100
	ControlsetText, Edit5,%Iteration%,ClipBar
	MouseMove, %mx%, %my%, 0
	sleep 300
	if runCorrectTestResults
		WorkTab.CorrectTestResults("toggle", "Loop")

		}
		blockinput, off
Return
		}

MenuCodeSelect(FileName:="AllProducts"){
	global
	try Menu, CodeMenu, DeleteAll
	FileRead, OutputText, %FileName%.txt
	stringUpper, OutputText, OutputText
	loop, parse, OutputText, " "
		Menu, CodeMenu, Add, %a_LoopField%, CodeMenubutton
			; Menu, CodeMenu, Add, All, CodeMenubutton
	; FileRead, WholeBatches, WholeBatches.txt
	; 	Menu, CodeMenu, Add, , , +Break
	; sleep 200
	; Loop, parse, WholeBatches, "`n"
	; 	Menu, CodeMenu, Add, %a_LoopField%, WholeBatchMenubutton,
	; 	; Menu, CodeMenu, Add, , WholeBatchMenubutton
	; 	; Menu, CodeMenu, Add, %WholeBatches%[2], WholeBatchMenubutton
	; Try Menu,CodeMenu,show
; 	return
; WholeBatchMenubutton:
; 	clip.codesRegex(A_ThisMenuItem)
return

CodeMenubutton:
If A_ThisMenuItem contains All
{
	if winactive("NuGenesis LMS")
		LMS.SearchBar(A_ThisMenuItem)
	else
		sendinput, %A_ThisMenuItem%
	return
}

If FileName contains Product
	{
		product := A_ThisMenuItem
		ControlsetText, Edit1,%product%,ClipBar
	}
else If FileName contains Batch
	{
		batch := A_ThisMenuItem
		ControlsetText, Edit2,%Batch%,ClipBar
	}
else If FileName contains SampleID
	SampleID := A_ThisMenuItem

sleep 200
if winactive("ahk_exe explorer.exe")
	send, ^e{*}%A_ThisMenuItem%{*}{enter}
else if winactive("NuGenesis LMS")
		LMS.SearchBar(A_ThisMenuItem,"{enter}",0)
else
	sendinput, %A_ThisMenuItem%

Return
}


WholeBatchMenu(){
	global
	try Menu, CodeMenu, DeleteAll
	FileRead, WholeBatches, WholeBatches.txt
	WholeBatches:=Trim(StrReplace(WholeBatches, "`n`n", ""))
	Loop, parse, WholeBatches, "`r"
		Menu, CodeMenu, Add, &%A_Index% `t %a_LoopField%, WholeBatchMenubutton,
	Try Menu,CodeMenu,show
	return

WholeBatchMenubutton:
if (Instr(Trim(A_ThisMenuItem),"|")=1){
		ProductTab.AddProductFromClipboard(A_ThisMenuItem)
		return
	}
		else clip.codesRegex(A_ThisMenuItem)
return
}


SelectPreviewPane(SearchProduct:=""){
	SetKeyDelay, 2, 1
	winactivate, ahk_exe explorer.exe
	if SearchProduct {
			run, find "\\10.1.2.118\Label Copy Final"
			sleep 300
			send, ^{e}{*}%SearchProduct%{*}{enter}
			sleep 500
		}
		else
			send, ^{e}
		sleep 300
		Send, {tab 2}{right}{pgup}
		wingetpos, xwin, ywin, Width, Height, ahk_exe explorer.exe
		; send, ^{e}{*}%SearchProduct%{*}{enter}
		; sendinput,
		; sleep 500
		;MouseGetPos, xm, Ym, mW,
		wx:=Width-100
		wy:=Height/2
		clipboard:=
		sleep 600
		MouseClick, left, %wx%, %wy% , 2, 2
		Sleep 300
		Send, ^{a}
		send, ^{c}
		ClipWait, 2,
		if errorlevel
			{
				winactivate, ahk_exe explorer.exe
				send, ^{e}{tab 2}{right}{pgup}
				sleep 500
				MouseClick, left, %wx%, %wy% , 1, 2
				sleep 400
				Send, ^{a}
				send, ^{c}
			}
			SetKeyDelay, -1, -1
		tt(Clipboard, 100, 10, 10)
	;mousemove, %xm%, %ym%
	Return
}