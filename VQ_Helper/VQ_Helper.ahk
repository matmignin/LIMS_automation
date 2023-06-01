
	#SingleInstance,Force
	#Persistent
	Process, Priority, , High
	#NoEnv

	SetBatchLines, -1
	Thread, NoTimers
	; #HotkeyInterval 1000
	#MaxHotkeysPerInterval 210
	#InstallKeybdHook
	#InstallMouseHook
	#ClipboardTimeout 7500
	#HotkeyModifierTimeout 100
	#maxthreadsperhotkey, 2
	; #MaxThreadsBuffer Off
	SetTitleMatchMode, 2
	listLines On
	; FormatTime, DayString,, MM/d/yy
	; FormatTime, TimeString, R
	; FormatTime, CurrentDateTime,, MM/dd/yy
	; FormatTime, The_Day,, MMMM d
	; FormatTime, The_Hour,, htt
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
	tooltipNumber=6

	; WholeBatchesArray:=[]
	; FileRead, WholeBatchestext, WholeBatches.txt
		; Wholebatches:=Trim(Wholebatchestext,"`n")
		; sleep 100
		; loop, parse, WholeBatches, "`n"
      ; WholeBatchesArray.insert(a_LoopField)

	Menu,Tray,NoStandard

	Menu, Tray, Add, All Products, AllProductsMsgbox
	Menu, Tray, Add, All Batches, AllBatchesMsgbox
	Menu, Tray, add, &Final Label Copy, ShowFinalLabelCopy
	Menu, Tray, add, &Scan Label Copy, ShowScanLabelCopy

	; Menu, Tray, add, &mfg folder, Showmfg
	; Menu, Tray, add, &GLOBAL VISION folder, ShowGlobalVision
	; Menu, Tray, add, &Total CoAs, ShowFINAL_C_O_A
	; Menu, Tray, Add,
	Menu, Tray, Add, Whole Batches, ShowWholeBatches
	Menu, Tray, add, Show EditBox, ShowEditBox
	Menu, Tray, add, Add Sample Log, Add15SampleLog
	Menu, Tray, add, Delete Prior Codes, DeletePriorCodes
	Menu, Tray, add, Delete Whole Batches, DeleteWholeBatches

	Menu, Tray, Add,
	Menu, Tray, add, TestCode, testCode
	Menu, Tray, Add, Show Variables, ShowVariables
	Menu, Tray, Add, ListLines, ListLines
	Menu, Tray, Add, mmignin, mmigninFolder
	Menu, Tray, Add, windowSpy, windowSpy
	Menu, Tray, Add, &Reload, ReloadSub
	Menu, Tray, tip, %CompileTime%
	Menu, Tray, Add, Exitsub, Exitsub
	Menu, Tray, Default, &Reload
	copypasteToggle:=0
	RegexProduct:="i)(?<=[\w\d]{3})?(?P<Product>\b[abcdefghijkl]\d{3}\b)"
	RegexBatch:= "i)(?<!Ct#)(?P<Batch>\d{3}-\d{4}\b)"
	RegexLot:= "i)(?P<Lot>\b\d{4}[A-Z]\d[A-Z]?|\bBulk\b|\bG\d{7}[A-Z]?\b|\bVC\d{6}[ABCDEFGH]?|\bV[A-Z]\d{5}[A-Z]\d?\b|\d{5}\[A-Z]{3}\d\b)"
	RegexCoated:= "i)(\d{4}\w\d\w?.|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d\s|coated: |ct#|ct\s?|coated\s?|ct#/s)(?P<Coated>\d{3}-\d{4})"
	regexMaxLimit:="i)(<| - |NMT )(?P<maxLimit>[0-9,.]*)\s\w*"
	regexMaxLimit:="i)(<|NLT )?(?P<minLimit>(?<!NMT )[0-9.,]*)"
	regexunit:="i)(?P<unit>\w*)"
	; if SampleIDMode=GUID
	RegexSampleID:="i)(?P<SampleID>\b[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}\b)"
	RegexCombined := "iO)(?<=[\w\d]{3})?(?P<Product>[abcdefghijkl]\d{3}\b)|(?<!Ct#)(?P<Batch>\d{3}-\d{4}\b)|(?P<Lot>\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d)|(\d{4}\w\d\w?.|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d\s|coated: |ct#|ct\s?|coated\s?|ct#/s)(?P<Coated>\d{3}-\d{4})"
	; else if SampleIDMode=SampleID
		; RegexSampleID:="i)(?P<SampleID>22[0-1][0-9][09]{4}|[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12})"
	; else
		; sampleID:=
		; PriorCodesMenu()
	; Menu, Tray, Add, Test_1, test_1
	OnClipboardChange("clipChange")
	PasteTime:=A_TickCount
	; CodeFile:= "\\10.1.2.118\users\vitaquest\mmignin\VQ_Helper\Code.txt"
	OnExit("ClipBar.SaveVariables")
	SetTimer,activeCheck, %ActiveTimerCheck%
	LMS.Orient()
	ClipBar.Show()
	; traytip,Time, %The_Time%,
	sleep 200
	try Menu, Tray, Icon, %AppIconPath%
	GUI, ClipBar:default

	; TT("VQ_Helper Started",2000,100,100)
	; SetWinDelay, %NormalWinDelay%



	return




	#include NuGenesis.ahk
	#include ClipBar.ahk
	#Include RemoteKEYS.ahk




