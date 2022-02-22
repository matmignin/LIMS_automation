if A_username != mmignin
	exitapp
	#SingleInstance,Force
	#Persistent
	; Process, Priority, , High
	#NoEnv
	Iteration=1
	; #KeyHistory 500
	#InstallKeybdHook
	#InstallMouseHook
	#ClipboardTimeout 1500
	#InstallKeybdHook
	SetKeyDelay,-1,1
	setwindelay, 50
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
	; CoordMode, mouse, window
	SetWorkingDir, %A_ScriptDir%
	#winactivateForce
	SetscrolllockState, alwaysoff
	AutoTrim, On
	Menu, Tray, Add, windowSpy, windowSpy
	OnClipboardChange("clipChange")
	PasteTime:=A_TickCount
	Menu, Tray, Add, E&xit, ExitSub
	Menu, Tray, Add, &Reload, ReloadSub
	; Menu, Tray, Default, &Reload
	Menu, Tray, Default, E&xit
	try Menu, Tray, Icon, \\10.1.2.118\users\vitaquest\mmignin\RemoteVQ\icon.ico
	varbar.Show()
	LMS.Orient()
	; SetTimer,activeCheck, 1000
	copypasteToggle:=0
	RegexProduct:="i)(?<=[\w\d]{3})?(?P<Product>[abcdefghijkl]\d{3})"
	RegexBatch:= "i)(?<!Ct#)(?P<Batch>\d{3}-\d{4}\b)"
	RegexLot:= "i)(?P<Lot>\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d)"
	RegexCoated:= "i)(\d{4}\w\d\w?.|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d\s|coated: |ct#?|ct\s?|coated\s?)(?P<Coated>\d{3}-\d{4})"
  #include ClipBar.ahk
  #include Nugenisis.ahk
  #Include CodeClip.ahk
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
	wingetpos, Nugenesis_X2, Nugenesis_Y2, Nugenesis_W2, Nugenesis_h2, NuGenesis LMS
	if (Nugenesis_X != Nugenesis_X2) || (Nugenesis_Y != Nugenesis_Y2) || (Nugenesis_W != Nugenesis_W2){
		VarBar_x2:=Nugenesis_X2+(Nugenesis_W2/2)
		winMove, VarBar, ,%VarBar_X2%, %Nugenesis_Y2%,
		Nugenesis_X:=Nugenesis_X2
		Nugenesis_W:=Nugenesis_W2
		Nugenesis_Y:=Nugenesis_Y2
	}
	; If winactive("Result Entry") || winactive("Register new samples")
		; varbar.FloatAtopwindow()
	else if winactive("Error") {
		ControlSend,, {enter}, Error
		sleep 200
		if winExist("Register new samples") && Product{
			winactivate,
			Send, {click 185, 103,2}%Product%{enter}
		}
	}
	else if winactive("Information")
		send, {enter}
	else
		return
return
Orient(){
	global
	CoordMode, mouse, window
	Tab:=
	Tab1:=
	Tab2:=
	Tab3:=
	Tab4:=
	Tab5:=
	Tab6:=
	; winGetPos,Nux,NuY,NuW,NuH, NuGenesis LMS
	winGetPos,Nux,NuY,NuW,NuH,NuGenesis LMS
	; winGetPos,WbX,WbY,WbW,WbH, Mats LMS Workbook.xlsb - Excel
	; winGetPos, VarBar_X, VarBar_Y,Varbar_W,Varbar_H, VarBar ahk_exe AutoHotkey.exe
	WbX:=WbX+400
	Flovar_x:= NuX +900
	Flovar_y:= NuH + NuY -28
	varBar_nuX:=NuX+450
	varBar_nuY:=NuY
	TabSelect:=NuW-10
	yTabSelect:=45
	yTabDropdown:=45
	SamplesTab:=(NuW/2)-80
	RequestsTab:=(NuW/2)+20
	DocumentsTab:=(NuW/3)+(NuW/3)-50
	TestsTab:=(NuW/3)+(NuW/3)-220
	ResultsTab:=(NuW/3)+(NuW/3)-150
	HScrollBarRightX:=NuW-40
	HScrollBarLeftX:=(NuW/5)+35
	HScrollBarRightY:=HScrollBarLeftY:=(Nuh/2)+38
	yWorkTabs:=74
	yMyWorkTabs:=74
	xDivider:=(NuW/5)
	xTab1=150
	xTab2=350
	MyWorkTab=350
	xTab3=550
	ProductsTab=550
	xTab4=750
	SpecsTab=750
	xTab5=950
	xTab6=1150
	xTab7=1550
	xTab8=358+1000
	xTab9=358+1200
	xTab10=358+1400
	yTabs:=36
	xWorkTab:=334, 47 ;1st
	yWorkTabSearch:=128
	XCoA:=(NuW-131)
	xClearfilter:=xDivider+16
	yClearfilter:=270
	xFilterIcon:=NuW-22
	yFilterIcon:=131

	xProductsSearch:=xDivider+180
	xSpecsSearch:=xDivider+183
	yProductsSearch:=93
	ySpecsSearch:=93
	xRequestsSearch:=xDivider+190 ;175 ;103
	xRequestsSearchDefault:=xDivider+170 ;155 ;103
	xSamplesSearch:=xDivider+145
	xResultsSearch:=xDivider+185
	xResultsSearch:=xDivider+185
	xTestsSearch:=xDivider+125
	xDocumentsSearch:=xDivider+25

	yProductsFilter:=181
	ySpecsFilter:=181

	xFormulationFilter:=xDivider+75
	xProductFilter:=xDivider+75
	xBatchFilter:=xDivider+168
	xLotFilter:=xDivider+229

	yMyWorkTabFilter:=182
	yMyWorkFilter:=182
	yWorkTabFilter:=182

	xDocumentsFilter:=xDivider+68

	xEdit_Composition:=76
	yEdit_Composition:=443
	xAdd_methods:=74
	yAdd_methods:=565
	xEnter_Results:=57
	yEnter_Results:=630
	return
}

TT(msg:="yo", time=1500, X:="",Y:="",N:="", Transparent:="",Position:="S") {
	global
	sleep 20
	if (Position:="S")
		CoordMode, ToolTip, Screen
	if (Position:="R")
		CoordMode, ToolTip, Relative
	if (Position:="C")
		tooltip, %msg%, %A_CaretX%, %A_CaretY%,%N%
	else
		tooltip, %msg%, %X%, %Y%,%N%
	hwnd := winExist("ahk_class tooltips_class32")
	if Transparent
		winSet, Trans, %Transparent%, % "ahk_id" hwnd
	; winSet, TransColor, FFFFFF 200, % "ahk_id" hwnd
	; winSet, Trans, 200, %W%
	; CoordMode, ToolTip, screen
	CoordMode, ToolTip, Relative
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
	; ToolTip, %Text%, %A_CaretX%, %A_CaretY%, 9
	; ToolTip, %text%, 9
	Sleep,10
	SplashImage,off
	; ToolTip,,,,9
return
}

class Breaking {
	Point(){
		Global
		If GetKeyState("Lbutton", "P") {
			TT("Broke")
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
	if winactive("Remote Desktop")
		Sendinput, mmignin{tab}{K}ilgore7744{enter}
	; Sendinput, ?+{K}ilgore7744{enter}
	if winExist("ahk_exe ONENOTE.EXE Protected Section"){
		winactivate
		Sendinput, {K}ilgore7744{enter}
	}
	if winActive("Vitaquest Virtual Office ahk_exe firefox.exe"){
		click 661, 245
		send, {tab}
		sleep 50
		send, mmignin{tab}+{`+}Kilgore7744
		sleep 50
		; send, {Enter}
	}
	if winExist("Login"){
		winactivate
		Sendinput, mmignin{tab}{K}ilgore7744{enter}
	}
	Else If winexist("Sign :"){
		winactivate,
		Sendinput,{tab 2}{right 2}{tab 2}mmignin{tab}Kilgore7744{enter}
	}
	else if winexist("windows Security"){
		winactivate,
		Sendinput, Kilgore7744{enter}
	}
	else if winexist("CredentialUIBroker.exe"){
		winactivate,
		Sendinput, Kilgore7744{enter}
	}
	else if winexist("Map VQ drive.bat ahk_exe cmd.exe"){
		winactivate,
		Send, mmignin{enter}{/}Kilgore7744{enter}
		return
	}
	else
		Sendinput, +{K}ilgore7744{enter}
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
	setwindelay, 10
	SetKeyDelay, -1, -1
	SetMouseDelay, -1
	MouseGetPos, mx, my, mw,
	MouseReturn:="{click " Mx ", " My ",0}"
	; sleep 25
	if window
		if !winactive(window)
			sleep 500 ; winactivate, %window%
	mouseclick, %Button%, %x%,%y%,%n%,0
	sleep 25
	if (window!="")
		winactivate, %mw%
	If (ReturnMouse=0){
		SetMouseDelay, 1
		SetKeyDelay, 1, 0.25
		setwindelay, 60
		Return MouseReturn
	}
	else
		mousemove,%mx%,%my%,0
	SetMouseDelay, 1
	SetKeyDelay, 1, 0.25
	setwindelay, 60
}