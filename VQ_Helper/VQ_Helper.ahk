	#SingleInstance,Force
	#Persistent
	#NoEnv
	Process, Priority,, High
	; SetBatchLines, -1
	; Thread, NoTimers
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
	CoordMode, Tooltip, screen
	; CoordMode, Tooltip, Screen
	SetWorkingDir, %A_ScriptDir%
	SetscrolllockState, alwaysoff
	AutoTrim, On
	IdleThreshold := 6 * 60 * 60 * 1000 ;7 hours
	Fileread, AllBatches, AllBatches.txt
	Fileread, AllProducts, AllProducts.txt
	ReadIniFiles()
	tooltipNumber=6
	HotkeysTip := "
	(
F5    :: copyLabelCopy
!F<n> :: ChangePercision( n )
+!F10 :: AddsampleLog x5
!F10  :: AddDataFromClipboard

+F5   :: copyLabelCopyIng
^+w   :: get_window_info
^+e   :: get_mouse_info
+^F1  :: GetAllProducts( ; )
+!F1  :: GetAllProducts( n )
+^F2  :: GetAllBatches( ; )
	)"

VariableFilePath := "\\10.1.2.118\users\vitaquest\mmignin\VQ_Helper\ClippedExcelData.txt"

FileGetTime, InitialFileTime, %VariableFilePath%

prefix:=
	Menu,Tray,NoStandard
	Menu, Tray, Add, All Products, AllProductsMsgbox
	Menu, Tray, Add, All Batches, AllBatchesMsgbox
	Menu, Tray, add, &Final Label Copy, ShowFinalLabelCopy
	Menu, Tray, add, &Scan Label Copy, ShowScanLabelCopy
	; Menu, Tray, Add, Whole Batches, ShowWholeBatches
	; Menu, Tray, add, Show EditBox, ShowEditBox
	; Menu, Tray, add, Add Sample Log, Add15SampleLog
	;Menu, Tray, add, Delete Prior Codes, DeletePriorCodes
	; Menu, Tray, add, Delete Whole Batches, DeleteWholeBatches
	Menu, Tray, Add,
	Menu, Tray, Add, Get Requirements, GetRequirements
	Menu, TestSubMenu, Add, run Script, TestCode
	Menu, TestSubMenu, Add, Test1, TestCode1
	Menu, TestSubMenu, Add, Test2, TestCode2
	Menu, TestSubMenu, Add, Test3, TestCode3
	; Menu, MarkerSubMenu, Add, PasteMarker, SetPasteMarker
	; Menu, MarkerSubMenu, Add, MouseMarker, SetMouseMarker
	; Menu, MarkerSubMenu, Add, TriggerMarker, TriggerMarker
	Menu, Tray, Add, windowSpy, windowSpy
	; Menu, TestSubMenu, Add, run Script, TestCode
	Menu, Tray, add, TestCode, :TestSubMenu ;testCode
	; Menu, Tray, add, Marker, :MarkerSubMenu
	Menu, Tray, Add, Show Variables, ShowVariables
	Menu, Tray, Add, ListLines, ListLines
	Menu, Tray, Add, mmignin, mmigninFolder
	Menu, Tray, Add, Hotkeys, ShowHotkeys
	Menu, Tray, Add, &Reload, ReloadSub
	Menu, Tray, Add, Exitsub, Exitsub
	Menu, Tray, tip, %HotkeysTip% %HotkeysTip2%
	Menu, Tray, Default, &Reload


	Key:= {}
	RegexProduct:="i)(?<=[\w\d]{3})?(?P<Product>\b[abcdefghijkl]\d{3}\b)"
	RegexBatch:= "i)(?<!Ct#)(?P<Batch>\d{3}-\d{4}\b)"
	RegexLot:= "i)(?P<Lot>\b\d{4}[A-Z]\d[A-Z]?|\bBulk\b|\bG\d{7}[A-Z]?\b|\bVC\d{6}[ABCDEFGH]?|\bV[A-Z]\d{5}[A-Z]\d?\b|\d{5}\[A-Z]{3}\d\b)"
	RegexCoated:= "i)(\d{4}\w\d\w?.|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d\s|coated: |ct#|ct\s?|coated\s?|ct#/s)(?P<Coated>\d{3}-\d{4})"
	regexMaxLimit:="i)(<| - |NMT )(?P<maxLimit>[0-9,.]*)\s\w*"
	regexMaxLimit:="i)(<|NLT )?(?P<minLimit>(?<!NMT )[0-9.,]*)"
	regexunit:="i)(?P<unit>\w*)"
	RegexRequirements:="iO)(?<Prefix>(NLT |NMT |<))?(?<LowerLimit>([,|\d]*.?[\d]*))( - (?<UpperLimit>[,|\d]*.?[\d]*))? (?<Unit>(mg RAE|mcg RAE|mcg DFE|mg|mcg|g|IU|CFU\\g|ppm|ppb))"
	RegexSampleID:="i)(?P<SampleID>\b[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}\b)"
	PreviousSampleIDsFile:="U:\VQ_Helper\PriorSampleIDs.txt"
	; RegexCombined := "iO)(?<=[\w\d]{3})?(?P<Product>[abcdefghijkl]\d{3}\b)|(?<!Ct#)(?P<Batch>\d{3}-\d{4}\b)|(?P<Lot>\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d)|(\d{4}\w\d\w?.|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d\s|coated: |ct#|ct\s?|coated\s?|ct#/s)(?P<Coated>\d{3}-\d{4})"



	OnClipboardChange("clipChange")
	PasteTime:=A_TickCount
	; CodeFile:= "\\10.1.2.118\users\vitaquest\mmignin\VQ_Helper\Code.txt"
	OnExit("ClipBar.SaveVariables")
	SetTimer,activeCheck, %ActiveTimerCheck%
	SetTimer,FileCheck, 1000
	LMS.Orient()
	ClipBar.Show()
	sleep 200
try Menu, Tray, Icon, %AppIconPath%
GUI, ClipBar:default

	return




;;----------------------File Check-------------------------
FileCheck:
    FileGetTime, CurrentFileTime, %VariableFilePath%
    if (CurrentFileTime <> InitialFileTime) {
        InitialFileTime := CurrentFileTime
				FileContents := FileOpen(VariableFilePath, "r")
				sleep 200
				Clip.VariableFileClip(FileContents.ReadLine())
    }

	; UpdateVariableFile()
Return
;; [[                    Active Check                    ]]


activeCheck:
ListLines, OFF


if A_TimeIdle > IdleThreshold
	ExitApp

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
	ClipBar_x1:=Clipbar_x-310
	ClipBar_x2:=Clipbar_x-150
	ClipBar_x6:=Clipbar_x+265
	; CoordMode, mouse, Screen
	mousegetpos,MouseClipbarx, MouseClipbarY
	; CoordMode, mouse, Window
	if (winControl="Edit1"){
		GetAllProducts(" ")
		TT(AllProducts,4000,ClipBar_x1,35,2,250)
		sleep 1000
	}
	else if (winControl="Edit2"){
		GetAllBatches(" ")
		TT(AllBatches,4000,ClipBar_x2,35,2,250)
		sleep 1000
	}

	else if (winControl="Edit3")
		return
	else if (winControl="Edit4")
		tt(Tab)
	else if (winControl="Edit5")
		return
	else if (winControl="Edit6") || (winControl="Edit7"){
		BothGeneralBoxes:=GeneralBox "`n" GeneralBox2
		tt(BothGeneralBoxes,7000,100,2,6,220,"M")
	}
	; else if (winControl="Edit7"){
		; tt(GeneralBox2,7000,100,20,7,220,"M")
	; }
	return
}
else if winactive("Register new samples"){
	if RNSW
		return
	WinGetPos, RNSX, RNSY, RNSW, RNSH, Register new samples
	if (RNSW < 900){
		clk(231,133,,,,0)
		winwaitclose,,,10
		return
	}
	else if (RNSW > 900){
		return
	}
	else
		return
	return
}
else If winexist("Release: ahk_exe eln.exe"){
	winactivate
	click 128,146
	return
}
else if (winexist("ahk_class XLMAIN ahk_exe EXCEL.EXE") && !ExcelConnected){
	try XL := ComObjActive("Excel.Application") ;handle to running application
Catch {
					MsgBox % "no existing Excl ojbect:  Need to create one"
			XL := ComObjCreate("Excel.Application")
			XL.Visible := 1 ;1=Visible/Default 0=hidden
			}
			; XL.Visible := 1 ;1=Visible/Default 0=hidden
			ExcelConnected:=1
	Return
}




else If winactive("Edit Formulation ahk_exe eln.exe") && !WindowMoved{
	clk(458,477,,2)
	sleep 400
	WindowMoved:=1
	WinWaitClose
	WindowMoved:=
	return
}
else If winactive("Edit Formulation ahk_exe eln.exe") && !WindowMoved{
	clk(469,533,,2)
	clk(259,246,0,0)
	sleep 400
	WindowMoved:=1
	WinWaitClose
	WindowMoved:=
	return
}
else If winactive("Reason For Change") && !WindowMoved{
	send, {tab 2}
	sleep 400
	WindowMoved:=1
	WinWaitClose
	WindowMoved:=
	return
}
else If winactive("Select methods tests") && !WindowMoved{
	sleep 600
	; clk2(233, 67,1,2)
	Click, 233, 67, 2
	WindowMoved:=1
	; WinWaitClose
	; WindowMoved:=
	return
}
; else If winactive("Edit test (Field") && !WindowMoved{
; 	clk(471, 536,,2)
; 	; clk(238, 535,0,0)
; 	WindowMoved:=1
; 	WinWaitClose
; 	WindowMoved:=
; 	return
; }
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
	sleep 9000
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
	RNSW:=
	return
}
else if winActive("Information ahk_exe eln.exe"){
	winactivate,
	send, {enter}
}
else if Winactive("NuGenesis LMS"){
	; LMS.DetectTab()
	windowmoved:=
}

listlines, On
	; #maxthreadsperhotkey, 2
return




Block_Input:
; Thread, Priority, 1
	sleep 100
		NAdd:=
		nsub:=
		Mousemoved:=
	BlockInput, off
	settimer, Block_Input, Off
Return





#include NuGenesis.ahk
	#Include KEYS.ahk
	#include CLIPBAR.ahk
		#include Markers.ahk


copyLabelCopyDoc(SaveText:="",showtooltip:=""){
	Global Product

	firstLetter:=SubStr(Product,1,1)
FilePattern := "\\netapp\Label Copy Final\" firstLetter "000-" firstLetter "999\*" product "*.docx"
Loop, %FilePattern%, 1, 0
		oW:=ComObjGet(A_LoopFileLongPath)
		; sleep 1000
		sleep 400
		oW.Range.FormattedText.Copy
		clipwait,5,0
		if errorlevel
			msgbox, didnt  find labelcopy
	LabelCopyText:=Clipboard

	Ingredients:= RegexMatch(LabelCopyText, RegexIngredients,ri)

		 ;Clipboard:=LabelCopyText

	If showTooltip
		tt(LabelCopyText,1000)
	If SaveText
		{
		Try FileDelete, U:\VQ_Helper\LabelCopies\%Product%.txt
		FileAppend,  %labelcopytext%, U:\VQ_Helper\LabelCopies\%Product%.txt
		}
	; Clipboard:=listofIngredients
		; MsgBox % riIngredients
	Return LabelCopyText
}





GetRequirements(){
	Global
	RegexRequirements:="iO)(?<Prefix>(NLT |NMT |<|>))?(?<LowerLimit>([,|\d]*.?(?<PercisionAmount>[\d]*)))( - (?<UpperLimit>[,|\d]*.?[\d]*))? (?<Unit>(mg RAE|mcg RAE|mcg DFE|mg|mcg|g|IU|CFU\\g|ppm|ppb))"
	; Parse:="15.0 - 24.8 mg"
	; Parse:="NLT 50.0 mcg"
	; Parse:="NMT 50.04 mcg"
	; Parse:="1,000.00 - 1,650.00 mcg RAE"
	; Parse:="<2.0 mg"
	Parse:=Clipboard

If (RegexMatch(Parse, RegexRequirements, subpat)){
	; if (RegexMatch(Parse, RegexRequirements, r)){
					Prefix:=Subpat["Prefix"]
					MinLimit:=Subpat["LowerLimit"]
					MaxLimit:=Subpat["UpperLimit"]
					Units:=Subpat["Unit"]
					Percision:=StrLen(Trim(Subpat["PercisionAmount"]))
					; Prefix:=rPrefix
					; LowerLimit:=rLowerLimit
					; UpperLimit:=rUpperLimit
					if (Prefix = "NMT ")
					{
						Maxlimit:=MinLimit
						MinLimit:=""
					}
					IF (MinLimit && Maxlimit)
						divider:=" - "
					else
						Divider:= " "
					Final_Requirements:=Prefix " " MinLimit Divider MaxLimit " " Units
					; Unit:=rUnit
					Clipped_Requirement:=Trim(StrReplace(StrReplace(StrReplace(Final_Requirements, "< ","<"),"  "," "),"""",""))
					sleep 300
		; msgbox, prefix: %Prefix% `nlowerlimit: %LowerLimit% `nupperlimit: %UpperLimit% `nunit: %Unit%
		msgbox, prefix: %Prefix% `nMinlimit: %MinLimit% `nMaxlimit: %MaxLimit% `nunits: %Units% `n %rprefix% `t %rUpperLimit% `n %Clipped_Requirement% `t %SubPat% `n %Percision%
}
	; }
	; else
	; msgbox, %Parse%
}


TestCode3:
copyLabelCopyDoc(1,1)
Return
TestCode2:
GetRequirements()
Return
TestCode1:
copyLabelCopyDocRegex(1)
return

