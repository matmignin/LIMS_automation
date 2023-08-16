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
	CoordMode, mouse, Window
	CoordMode, Tooltip, screen
	; CoordMode, Tooltip, Screen
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
	Menu, Tray, Add, Exitsub, Exitsub
	Menu, Tray, tip, `n`n%CompileTime%`n`n
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
	PreviousSampleIDsFile:="U:\VQ_Helper\PriorSampleIDs.txt"
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


;;-----------------------------------------------------------
;; [[                    Active Check                    ]]
activeCheck:
ListLines, OFF
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
	else if (winControl="Edit6"){
		simpleclip:=1
		Preclip:=ClipboardAll
		Clipboard:=
		Clipboard:=GeneralBox
		clipwait,1
		clipboard:=PreClip
		sleep 1000
		simpleclip:=
	}
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
; else if Winactive("NuGenesis LMS"){
	; LMS.DetectTab()
	; sleep 1000
; }
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




copyDocText(){
myPath := "Testing.docx" 
tmpFolder := RegExReplace( myPath, ".*\K\\.*") "\_Word_UnZip\"
tmpName := myPath ".zip"
FileCopy, % myPath , % tmpName
FileCreateDir, % tmpFolder
tmpObject := ComObjCreate("Shell.Application")
tmpObject.Namespace(tmpFolder).CopyHere(tmpObject.Namespace(tmpName).items,4|16)
FileDelete, % tmpName
FileEncoding, UTF-8
FileRead, wordContents, % tmpFolder "\" "word\document.xml"
FileRemoveDir, % tmpFolder, 1
paraPattern := "<w:p(?: [^>]*)?>(.*?)</w:p>"
textPattern := "<w:t(?: [^>]*)?>(.*?)</w:t>"
While singlePara := RegExMatch( wordContents, paraPattern, myPara, singlePara ? StrLen(myPara)+singlePara:1)
{
	While singleText := RegExMatch( myPara1, textPattern, myText, singleText ? StrLen(myText)+singleText:1)
		finalContents .= myText1
	finalContents .= "`n"
}
MsgBox % finalContents

}