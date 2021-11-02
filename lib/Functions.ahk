
isPixel(X,Y,SearchColor){
  MouseGetPos, mX, mY
  ; if x:="mX" || y:="mY"
    PixelGetColor, MouseColor, %mX%, %mY%
  ; else
    PixelGetColor, FoundColor, %X%, %Y%
    ; Yellow = FFD353
    ; White = FFFFFF
    ; Light Blue = EAEFF3
  if FoundColor contains %SearchColor%
    ; Pop("Match",SearchColor,4000)
    return "Match"
  else
    Pop(MouseColor)
    ; return MouseColor
  return
}

Debug(Variable,Delete:="Delete"){
  if IsObject(Variable) 
    DebugText:=listarray(Variable)
  else 
    DebugText:=Variable
  if Delete=Delete
    filedelete, C:\Users\mmignin\Documents\VQuest\lib\data\debug.txt
  sleep 200
  fileAppend %Debugtext%, C:\Users\mmignin\Documents\VQuest\lib\data\debug.txt
}




IfKeyPressed(keyPressed,Action:=""){
  pop("wait for press")
  Input, Inputkey, L1 M T1
    If (InputKey!=KeyPressed){
      sendinput, %Inputkey%
      exit 
    }
    else
        send % Action
    Return KeyPressed
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


  
  
  ; WM_LBUTTONDOWN(wParam, lParam) ;move around varbar
	; 		{
	; 			X := lParam & 0xFFFF
	; 			Y := lParam >> 16
	; 			if A_GuiControl
	; 				Ctrl := "`n(in control " . A_GuiControl . ")"
	; 			; ToolTip You left-clicked in Gui window #%A_Gui% at client coordinates %X%x%Y%.%Ctrl%
	; 			PostMessage, 0xA1, 2
	; 			; sleep 200
	; 	; keywait, Lbutton, U T0.20
	; 		; if !errorlevel
	; 		; {
	; 				; if errorlevel
	; 					; MouseClick, Left, , , 1, 0, U
	; 					; MouseClick, Left, , , 1, 0, U
	; 			; keywait, Lbutton, U T5
	; 	; MouseClick, Left, , , 1, 0, U
	; 			wingetpos, Varbar_X, Varbar_Y,W,H, VarBar ahk_class AutoHotkeyGUI
	; 			; sleep 200
	; 			; IniWrite, %Varbar_X%, data.ini, Locations, VarBar_X
	; 			; IniWrite, %Varbar_Y%, data.ini, Locations, VarBar_Y
					
	; 			; return
	; 		; }
	; 		; else
	; 	; MouseClick, Left, , , 1, 0, U
	; 	return
					
; } 


WindowInfo(){
	global
	CoordMode, mouse, window
	MouseGetPos, mX, mY, ,WinControl
	WinGetPos,wX,wY,wW,wH, A
	WinGetTitle, winTitle, A
	WinGetClass, Winclass, A
	WinGet, WinProcess, ProcessName, A
	; MouseGetPos, MouseX, MouseY
PixelGetColor, PixelColor, %MX%, %MY%
	MousePosition:=mX "`, " mY
	Sleep, 100
	TT(MousePosition "`n Title: " winTitle " `n Process: " WinProcess " `n Control: "winControl " `n Class: " winclass "`nWindowPosition " wX ", " wY ", " wW ", " wH "`n" PixelColor,3000,,,2)
	Process:= "ahk_exe " WinProcess
	WinInfo:="WinMove, " Process ", , " wX ", " wY ", " wW ", " wH
	WinLocation:= wX "," wY "," wW "," wH
	; PixelColor:=PixelColor
	iniwrite %MousePosition%, data.ini, SavedVariables, WindowMousePosition
	iniwrite %PixelColor%, data.ini, SavedVariables, PixelColor
	; if Value Return
	; keywait, F20, U T5
	
	sleep 500
	; Tooltip,
	; SetTimer, RemoveToolTip, -2000
	}

DoublePress(action,SecondAction:="", ToolTip:=""){
	If (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<300){
		Send, % action "{shiftup}{altup}{ctrlup}{lwinup}"
		tt(ToolTip)
	}
	Else
		send % SecondAction "{shiftup}{altup}{ctrlup}{lwinup}"
	Return
	}


Block(Time:=300, Action:=""){
	Global N
	If N
		exit
	If Action
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
	
Fade(FadeAmount:=90){
  global
  WinSet, Transparent, %FadeAmount%, AHK_id %GUIID%
  while MouseIsOver("VarBar ahk_exe AutoHotkey.exe") && !WinActive("VarBar ahk_exe AutoHotkey.exe")
    sleep 600
    WinSet, Transparent, 235, AHK_id %GUIID%
}


Pop(Line1,Line2:="",PopupTime:=1000,Location:="Mouse"){
  global
try {
  gui, PopUp:destroy ;:
  settimer, destroyGui, off
}
PopupColor1:="CE6D4B"
PopupColor2:="FFFFFF"
PopupTrans:=250
CoordMode, mouse, Window
WinGetPos,PopUp_wX,PopUp_wY,PopUp_wW,PopUp_wH, A
; CoordMode, mouse, Screen
MouseGetPos, PopUp_x,Popup_y,
if (Location:="Window"){
	popup_y:=Popup_wx
	popup_x:=Popup_Wy
	}
if (Location:="Right"){
	popup_y:=Popup_WW-100
	popup_x:=Popup_Wy
	}
if (Location:="Screen"){
	popup_y:=1
	popup_x:=1
	}
else {
	popup_y:=popup_y-300
	popup_x:=Popup_x
	}
Gui, PopUp: +AlwaysOnTop +Disabled -SysMenu +Owner -Caption +ToolWindow +HwndGUIID  ;+AlwaysOnTop +owner +HwndGUIID +Owner avoids a taskbar button.

Gui, PopUp:color,%PopupColor1%, %PopupColor2%  
Gui, PopUp:Font,s10 cBlack Bold, Consolas
Gui, PopUp:Add, Text,left, %Line1%
Gui, PopUp:Font,s8 cBlack Bold, Consolas
  if (Line2)
    Gui, PopUp:Add, Text,Center, %Line2%
Gui, PopUp:Show, NoActivate x%popup_x% y%Popup_y%
 WinSet, Transparent, %PopUpTrans%, AHK_Id %GUIID%

settimer, destroyGui, -%PopupTime%
return
}

DestroyGui:
  try gui, PopUp:destroy
return




TT(msg:="yo", time=1500, X:="",Y:="",N:="", Transparent:="",Position:="S") {
	global
	if (Position:="S")
		CoordMode, ToolTip, Screen
	if (Position:="R")
		CoordMode, ToolTip, Relative
	; If X:="-1"
		; X:=A_CaretX-50
	; If Y:="-1"
		; Y:=A_CaretY-50
	; if !msg
		; msg:=A_PriorHotkey "`n" A_Thishotkey

	if (Position:="C")
		tooltip, %msg%, %A_CaretX%, %A_CaretY%,%N%
	else
		tooltip, %msg%, %X%, %Y%,%N%
	hwnd := WinExist("ahk_class tooltips_class32")
	if Transparent
   	WinSet, Trans, %Transparent%, % "ahk_id" hwnd
   	; WinSet, TransColor, FFFFFF 200, % "ahk_id" hwnd
	; WinSet, Trans, 200, %W%
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

	
LogError(exception) {
	global
    ErrorLine:=exception.Line
    ErrorFile:=Exception.File
	 clipboard:=ErrorLine " " e " " ErrorFile
		FileAppend % "Error on at" exception.file " line " exception.Line ": " exception.Message "`n"
        , errorlog.txt
	 return True
}

class click{

	OKay(sleeptime:=""){
		global
		sleep %Sleeptime%
		if winactive("Results Definition")
			clk(1336,592)
		else If WinActive("Result Editor")
			clk(370,660)
		else if Edit Ingredient
			clk(265, 561)
		else if winactive("Result Entry")
			clk(1028, 860)
		else if winexist("Delete Test - \\Remote") {
			WinActivate, Delete Test - \\Remote
			clk(229, 136)
		}
		else if winActive("Results Definition - \\Remote")
			clk(951, 751)
		; else if winActive("Barcode Scanner - \\Remote")
			; Send, {enter},
		else if winActive("Microsoft Excel Security Notice - \\Remote")
			Send, !y
		else if winActive("Reason For Change - \\Remote")
			clk(229, 236)
		else if winactive("New Document - \\Remote")
			clk(415, 360)
		else if winActive("Edit specification - \\Remote")
			clk(323, 621)
		else if winActive("Reason for Change - \\Remote")
			Return clk(170, 331)
		else if winexist("Error - \\Remote") {
			winactivate
			clk(148, 104)
			winactivate, Register new samples - \\Remote
			clk(181, 104, 2)
			Send, %product%{enter}
		}
		else if winexist("Change Configuration - \\Remote")
			clk(131, 296,"Change Configuration - \\Remote")
		Else
			Send,{enter}
		return
	}

	esc(){
		if winexist("Change Configuration - \\Remote")
			click 342, 296
		Else
			Send,{esc}
		return
	}

	Save(){
		if winactive("Edit Product")
			click 275, 578
		else If Winactive("Composition")
			click 1236, 888
		else If Winactive("Test Definition Editor ")
			Click 341, 618
		Else
			return
	}
	edit(){
		if winactive("Results Definition")
			click 78,63
		else
			click 84, 65
		return
	}
	Add(){
		if winactive("Formulation")
			click, 73, 280
		else
			click 45, 65
		return
	}
	Requests_tab(){
		click 865,83
		return
	}
	MyWork_Tab(){
		click 761,44
		return
	}
	Mywork_Searchbar(){
		click 500,127, 2
		return
	}
	EditTest_1(){
		ifwinnotactive, NuGenesis LMS - \\Remote
			WinActivate, NuGenesis LMS - \\Remote
		Send,{click, 56, 784 }
		return
	}
	EnterResults(){
		WinActivate, NuGenesis LMS - \\Remote
		WinActivate, NuGenesis LMS - \\Remote
		click 74, 900
		return
	}

	Orient(){
		if winactive("Result Entry")
			click 843, 202, 2
		else if winactive("Test Definition Editor")
			Click, 187, 200

		Else
			return
	}
	CopySpecTemplate(){
		WinActivate, NuGenesis LMS - \\Remote
		click 102, 289 ;copy into new spec
		WinWaitActive, Edit specification - Remote, ,1
		if ErrorLevel
			winactivate, Edit specification - Remote
		; click 317, 83
		; sleep 100
		return
	}
	NewSampleTemplate(){
		WinActivate, NuGenesis LMS - \\Remote
		click 103, 325
		return
	}
	
	TestDefinitionEditor_Results(){
		winactivate, Test Definition Editor - \\Remote
		click 236, 246 ;click resulst
		sleep 200
		return
	}
	EditSampleTemplate(){
		WinActivate, NuGenesis LMS - \\Remote
		click 70, 518
		winwaitactive, Edit sample template - \\Remote,, 5
		return
	}
}

Mouse_Save(){
	Global
	MouseGetPos, mx, my, mw,
	MouseReturn:="{click " Mx ", " My ",0}"
	PrevY:=My-26
	NextY:=My+26
	Next:="{click " Mx ", " NextY ",0}"
	Prev:="{click " Mx ", " PrevY ",0}"
	return
}

MakeTransparent(){
Global Iteration, winToggle
; Toggle:=A
	T:=(255/5)*Iteration
	if WinToggle := !WinToggle
		WinSet, Transparent, %T%, A
	else {
			WinSet, TransColor, Off, A
		WinSet, Transparent, Off, A
	}
Return
}

MouseIsOver(WinTitle){
	Global
	MouseGetPos,,, Win
	Return WinExist(WinTitle . " ahk_id " . Win)
}

Mouse_RbuttonUP(){
	#inputlevel 1
	suspend, On
	sleep 50
	; Send,{AppsKey}
	Click, Right
	; Send,{rbutton}
	; sleep 200
	; MouseClick, Right,,,1, 0, U
	; SendInput,{esc}
	suspend, Off
	#inputlevel 0
	return
}

Clk(x,y,Button:="Left",n=1,window:="",returnMouse:=1){
	global
	setwindelay, 10
	SetKeyDelay, -1, -1
	SetMouseDelay, -1
	; mx:=
	; my:=
	; mw:=
	MouseGetPos, mx, my, mw,
	MouseReturn:="{click " Mx ", " My ",0}"	
	; sleep 25
	if window
		if !winactive(Window)
			sleep 500 ; winactivate, %window%
	mouseclick, %Button%, %x%,%y%,%n%,0
	sleep 25
	if (window!="")
		winactivate, %mw%
	If (ReturnMouse=0){
		SetMouseDelay, 1
		SetKeyDelay, 1, 0.25 
		setwindelay, 200
		Return MouseReturn
	}
	else
		mousemove,%mx%,%my%,0
	SetMouseDelay, 1
	SetKeyDelay, 1, 0.25 
	setwindelay, 200
	
	; sleep 50
	;  return, {Click, %x%,%y%,}
}



SendPassword(){
	if winactive("Remote Desktop")
		SendInput, mmignin{tab}{K}ilgore7744{enter}
	; SendInput, ?+{K}ilgore7744{enter}
	if WinExist("ahk_exe ONENOTE.EXE Protected Section"){
		winactivate
		SendInput, {K}ilgore7744{enter}
	}
	if WinExist("Login - \\Remote"){
		winactivate
		SendInput, mmignin{tab}{K}ilgore7744{enter}
	}
	Else If Winexist("Sign :"){
		winactivate,
		SendInput,{tab 2}{right 2}{tab 2}mmignin{tab}Kilgore7744{enter}
	}
	else if winexist("Windows Security"){
		winactivate,
		SendInput, Kilgore7744{enter}
	}
	else if winexist("CredentialUIBroker.exe"){
		winactivate,
		SendInput, Kilgore7744{enter}
	}
	else if winexist("Map VQ drive.bat ahk_exe cmd.exe"){
		winactivate,
		Send, mmignin{enter}{/}Kilgore7744{enter}
		return
	}
	else
		SendInput, +{K}ilgore7744{enter}
	return
}

CreditCard(){
	SendInput, 4130220009588038
	TT("11/21 127",5000)
	return
}

#IfWinActive


/* 
PasteScreenshot(){
	sleep 200
	SendInput, +^{4}
	sleep 200
	KeyWait, LButton, d
	MouseClick, left,,, 1, 0, D
	; sleep 200
	KeyWait, LButton,
	; sleep 200
	sleep 200
	KeyWait, F20,
	MouseClick, left,,, 1, 0, u
	Send,{enter}
	sleep 200 ;screenshot"}
	WinActivate, %mwin%
	sleep 200
	; CLICK, %Mx%, %My%
	Send, ^v
	return
	}
 */

StopSub:
  exitapp
  Return
VarBar_ResetSub:
  VarBar.Reset()
  return
Run_Display:
  run, Display.url, C:\Users\mmignin\Desktop\
DebugVars(){
  Run, DebugVars.Ahk, lib\DebugVars
}
CL3(){
  Run, cl3.Ahk, lib\CL3
}


	

Return

KeyHistory(){
  KeyHistory
  }
WindowSpy(){
  Run, WindowSpy.ahk,C:\Program Files\AutoHotkey\
  }
Exitsub(){
	global
  varbar.SaveVariables()
	CloseScript("cl3.ahk")
	sleep 200
	CloseScript("Vim.ahk")
	Sleep 200
  exitapp
  }
	;Success:=CloseScript("Case insensitive script name")
return

CloseScript(Name)
	{
	DetectHiddenWindows On
	SetTitleMatchMode RegEx
	IfWinExist, i)%Name%.* ahk_class AutoHotkey
		{
		WinClose
		WinWaitClose, i)%Name%.* ahk_class AutoHotkey, , 2
		If ErrorLevel
			return "Unable to close " . Name
		else
			return "Closed " . Name
		}
	else
		return Name . " not found"
	}