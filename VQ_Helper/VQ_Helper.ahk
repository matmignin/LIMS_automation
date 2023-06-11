	#SingleInstance,Force
	#Persistent
	#NoEnv
	Process, Priority, , High
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
	CoordMode, mouse, Window
	; CoordMode, Tooltip, relative
	SetWorkingDir, %A_ScriptDir%
	SetscrolllockState, alwaysoff
	AutoTrim, On
	Fileread, AllBatches, AllBatches.txt
	Fileread, AllProducts, AllProducts.txt
	ReadIniFiles()
	tooltipNumber=6

	Menu,Tray,NoStandard
	Menu, Tray, Add, All Products, AllProductsMsgbox
	Menu, Tray, Add, All Batches, AllBatchesMsgbox
	Menu, Tray, add, &Final Label Copy, ShowFinalLabelCopy
	Menu, Tray, add, &Scan Label Copy, ShowScanLabelCopy
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
	Key:= {}
	RegexProduct:="i)(?<=[\w\d]{3})?(?P<Product>\b[abcdefghijkl]\d{3}\b)"
	RegexBatch:= "i)(?<!Ct#)(?P<Batch>\d{3}-\d{4}\b)"
	RegexLot:= "i)(?P<Lot>\b\d{4}[A-Z]\d[A-Z]?|\bBulk\b|\bG\d{7}[A-Z]?\b|\bVC\d{6}[ABCDEFGH]?|\bV[A-Z]\d{5}[A-Z]\d?\b|\d{5}\[A-Z]{3}\d\b)"
	RegexCoated:= "i)(\d{4}\w\d\w?.|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d\s|coated: |ct#|ct\s?|coated\s?|ct#/s)(?P<Coated>\d{3}-\d{4})"
	regexMaxLimit:="i)(<| - |NMT )(?P<maxLimit>[0-9,.]*)\s\w*"
	regexMaxLimit:="i)(<|NLT )?(?P<minLimit>(?<!NMT )[0-9.,]*)"
	regexunit:="i)(?P<unit>\w*)"
	RegexSampleID:="i)(?P<SampleID>\b[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}\b)"
	; RegexCombined := "iO)(?<=[\w\d]{3})?(?P<Product>[abcdefghijkl]\d{3}\b)|(?<!Ct#)(?P<Batch>\d{3}-\d{4}\b)|(?P<Lot>\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d)|(\d{4}\w\d\w?.|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d\s|coated: |ct#|ct\s?|coated\s?|ct#/s)(?P<Coated>\d{3}-\d{4})"

	OnClipboardChange("clipChange")
	PasteTime:=A_TickCount
	; CodeFile:= "\\10.1.2.118\users\vitaquest\mmignin\VQ_Helper\Code.txt"
	OnExit("ClipBar.SaveVariables")
	SetTimer,activeCheck, %ActiveTimerCheck%
	LMS.Orient()
	ClipBar.Show()
	sleep 200
	try Menu, Tray, Icon, %AppIconPath%
	GUI, ClipBar:default
	return

#include NuGenesis.ahk

	#Include KEYS.ahk
	#include CLIPBAR.ahk




