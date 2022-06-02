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
	Setwindelay, 150
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
	; Menu, Tray, Add, msgbox, test_Msgbox
	; Menu, Tray, Add, Test_1, test_1
	OnClipboardChange("clipChange")
	PasteTime:=A_TickCount
	Menu, Tray, Add, E&xit, ExitSub
	Menu, Tray, Add, &Reload, ReloadSub
	; Menu, Tray, Default, &Reload
	Menu, Tray, Default, &Reload
	try Menu, Tray, Icon, \\10.1.2.118\users\vitaquest\mmignin\RemoteVQ\icon.ico
	CodeFile:= "\\10.1.2.118\users\vitaquest\mmignin\RemoteVQ\Code.txt"
	varbar.Show()
; OnExit("Varbar.SaveVariables")
	LMS.Orient()
	SetTimer,activeCheck, 600
	iniRead, Ingredient_List_Adjustment, Settings.ini, SavedVariables, Ingredient_List_Adjustment
	iniRead, DescriptionTextInput, Settings.ini, SavedVariables, DescriptionTextInput
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
	iniRead, FinalLabelCopyPath, Settings.ini, FilePaths, FinalLabelCopyPath
	iniRead, ScansLabelCopyPath, Settings.ini, FilePaths, ScansLabelCopyPath
	iniRead, IngredientNoteDropDownCount, Settings.ini, SavedVariables, IngredientNoteDropDownCount
	
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
  Run, WS.exe,\\10.1.2.118\users\vitaquest\mmignin\
  }

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
		return
return


TT(msg:="yo", time=1500, X:="",Y:="",N:="", Transparent:="",Position:="S") {
	global
	sleep 20
		tooltip, %msg%, %X%, %Y%,%N%
	hwnd := winExist("ahk_class tooltips_class32")
	if Transparent
		winSet, Trans, %Transparent%, % "ahk_id" hwnd
	; winSet, TransColor, FFFFFF 200, % "ahk_id" hwnd
	; winSet, Trans, 200, %W%
	CoordMode, ToolTip, screen
	; CoordMode, ToolTip, Relative
	SetTimer, RemoveToolTip%N%, -%time%
return
RemoveToolTip:
	ToolTip
return
RemoveToolTip1:
	ToolTip,,,,1
return
RemoveToolTip2:
	ToolTip,,,,2
return
RemoveToolTip3:
	ToolTip,,,,3
return
RemoveToolTip4:
	ToolTip,,,,4
return
}

FlashScreen(Text:="",Color:="Black", ToolTipTime:=250){
	global
	SplashImage,,B w%A_ScreenWidth% h%A_ScreenHeight% cw%Color%
	if !Text
		Text:=A_ThisHotkey
	tt(Text,ToolTipTime,A_caretx,A_caretY,4)
	Sleep,10
	SplashImage,off
return
}

class Breaking {
	Point(){
		Global
		If (GetKeyState("Lbutton", "P") || GetKeyState("Space", "P")) {
			TT("Broke",3000)
			Setwindelay, 150
			SetKeyDelay, 0,0
			exit
		}
		if keep_running = n ;another signal to stop
			Exit
	}
	Preamble(){
		Global
		if keep_running = y
		{
			keep_running = n ;signal other thread to stop
			exit
		}
		keep_running = y
	}
}
MouseIsOver(winTitle){
	Global
	MouseGetPos,,, win
Return winExist(winTitle . " ahk_id " . win)
}

SendPassword(){
	if winExist("Login"){
		winactivate
		Sendinput, mmignin{tab}{-}{K}ilgore7744{enter}
	}
	Else If winexist("Sign :"){
		winactivate,
		Sendinput,{tab 2}{right 2}{tab 2}mmignin{tab}{-}Kilgore7744{enter}
	}
	else if winexist("windows Security"){
		winactivate,
		Sendinput, {-}Kilgore7744{enter}
	}
	else if winexist("CredentialUIBroker.exe"){
		winactivate,
		Sendinput, {-}Kilgore7744{enter}
	}

	else
		Sendinput, -{K}ilgore7744{enter}
return
}

ClickText(Button:="Lbutton", Count:="1"){
	mousegetpos, mousex, mousey
	SetDefaultMouseSpeed, 0
	mouseClick, %Button%, %A_CaretX%, %A_caretY%, %Count%
	mousemove, %mousex%, %mousey%, 0
	SetDefaultMouseSpeed, 1
}

ListArray(The_Array,Option:="n"){
	; global
	if (option<>"n"){
		for Each, Element in The_Array
			ArrayList .=Element " " Option " "
		return ArrayList
	}
	else {
  For Each, Element In The_Array {
        ArrayList .= "`n" A_index ": "
    ArrayList .= Element
  }
	return ArrayList
  }
}

HasValue(haystack, needle) {
	for index, value in haystack
		if (value = needle)
		return index
	if !(IsObject(haystack))
		throw Exception("Bad haystack!", -1, haystack)
return 0
}
Block(Time:=300, action:=""){
	Global N
	If N
		exit
	If action
		send % action
		sleep 100
		; TT(TooltipMessage)
	N:=1
	SetTimer, Block, -%time%
	return

	Block:
		N:=
		return
}

BlockRepeat(Time:=300, ToolTipMessage:=""){
	Global N
	sleep 25
	If N
		exit
	If ToolTipMessage
		TT(TooltipMessage)
	N:=1
	SetTimer, BlockTheInput, -%time%
	sleep 50
	return

	BlockTheInput:
		N:=
		return
}

Clk(x,y,Button:="Left",n=1,window:="",returnMouse:=1){
	global
	MouseGetPos, mx, my, mw,
	MouseReturn:="{click " Mx ", " My ",0}"
	if window
		if !winactive(window)
			sleep 500 ; winactivate, %window%
	mouseclick, %Button%, %x%,%y%,%n%,0
	sleep 25
	if (window!="")
		winactivate, %mw%
	If (ReturnMouse=0)
		Return MouseReturn
	else
		mousemove,%mx%,%my%,0
}
