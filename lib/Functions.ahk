
	ifNothingSelected(action, Button){
	  ClipboardSaved:=ClipboardAll
    clipboard:=
    sleep 20
    Send % Button
		tt(clipboard,750)
      ; clipwait,0.10
		if !clipboard ;if nothing selected
		{
			clipboard:=ClipboardSaved
			if action=copy
		{
			if winactive("ahk_exe Code.exe"){
				sendinput, {Home 2}{shiftdown}{End}{right}{shiftup}^{c}
				tt(clipboard,750)
				return
				}
			else {
			mousegetpos, mousex, mousey
			SetDefaultMouseSpeed, 0
			Click, %A_CaretX% %A_caretY%
			Click, %A_CaretX% %A_caretY%
			mousemove, %mousex%, %mousey%, 0
			SetDefaultMouseSpeed, 1
			send, ^c
			sleep 20
			tt(clipboard,500)
			return
			}
		}
			; clicktext()
		if action=cut
			send, {delete}
		}
	}

	ClickText2(){
		global
		mousegetpos, mousex, mousey
		SetDefaultMouseSpeed, 0
		Click, %A_CaretX% %A_caretY%,
		mousemove, %mousex%, %mousey%, 0
		SetDefaultMouseSpeed, 1
	}


ifPriorHotkey(The_PriorHotKey,FunctionOraction){
	if A_PriorHotkey contains The_PriorHotkey
	{
		if IsFunc(FunctionName)
			func(FunctionOraction)
		else
			sendinput % FunctionOraction
		return ;FunctionOraction
	}
	else
		return
}


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
    filedelete, C:\Users\mmignin\Documents\VQuest\data\debug.txt
  sleep 200
  fileAppend %Debugtext%, C:\Users\mmignin\Documents\VQuest\data\debug.txt
}




IfKeyPressed(keyPressed,action:=""){
  pop("wait for press")
  Input, Inputkey, L1 M T1
    If (InputKey!=KeyPressed){
      sendinput, %Inputkey%
      exit
    }
    else
        send % action
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
	; 				ctrl := "`n(in control " . A_GuiControl . ")"
	; 			; ToolTip You left-clicked in Gui window #%A_Gui% at client coordinates %X%x%Y%.%ctrl%
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
	; 			; IniWrite, %Varbar_X%, Settings.ini, Locations, VarBar_X
	; 			; IniWrite, %Varbar_Y%, Settings.ini, Locations, VarBar_Y

	; 			; return
	; 		; }
	; 		; else
	; 	; MouseClick, Left, , , 1, 0, U
	; 	return

; }


windowInfo(){
	global
	CoordMode, mouse, window
	MouseGetPos, mX, mY, ,winControl
	winGetPos,wX,wY,wW,wH, A
	winGetTitle, winTitle, A
	winGetClass, winclass, A
	ControlGetFocus, GUIFocus, VarBar
	winGet, winProcess, ProcessName, A
	; MouseGetPos, MouseX, MouseY
PixelGetColor, PixelColor, %MX%, %MY%
	MousePosition:=mX "`, " mY
	Sleep, 100
	TT(MousePosition "`n Title: " winTitle " `n Process: " winProcess " `n Control: "winControl " `n Class: " winclass "`nwindowPosition " wX ", " wY ", " wW ", " wH "`n" PixelColor "`n Focus Control: " GUIFocus,3000,,,2)
	Process:= "ahk_exe " winProcess
	winInfo:="winMove, " Process ", , " wX ", " wY ", " wW ", " wH
	winLocation:= wX "," wY "," wW "," wH
	; PixelColor:=PixelColor
	iniwrite %MousePosition%, Settings.ini, SavedVariables, windowMousePosition
	iniwrite %PixelColor%, Settings.ini, SavedVariables, PixelColor
	; if Value Return
	; keywait, F20, U T5

	sleep 500
	; Tooltip,
	; SetTimer, RemoveToolTip, -2000
	}

DoublePress(action,Secondaction:="", ToolTip:=""){
	If (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<300){
		Send, % action "{shiftup}{altup}{ctrlup}{lwinup}"
		tt(ToolTip)
	}
	Else
		send % Secondaction "{shiftup}{altup}{ctrlup}{lwinup}"
	Return
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


MuteTeamsMicrophone(){
  winactivate, Vitaquest Touchpoint | Microsoft Teams
  Send, {shiftdown}{ctrldown}{m}{ctrlup}{shiftup}
  TT("Muted/Unmuted")
  }

Fade(FadeAmount:=90){
  global
  winSet, Transparent, %FadeAmount%, AHK_id %GUIID%
  while MouseIsOver("VarBar ahk_exe AutoHotkey.exe") && !winactive("VarBar ahk_exe AutoHotkey.exe")
    sleep 600
    winSet, Transparent, 235, AHK_id %GUIID%
}


Pop(Line1,Line2:="",PopupTime:=1000,Location:="Mouse"){
  global
traytip, ,%Clipboard%
	sleep 20
; try {
  ; gui, Popup:destroy ;:
  ; settimer, destroyGui, off
; }
PopupColor1:="CE6D4B"
PopupColor2:="FFFFFF"
PopupTrans:=250
CoordMode, mouse, window
winGetPos,Popup_wX,Popup_wY,Popup_wW,Popup_wH, A
; CoordMode, mouse, Screen
MouseGetPos, Popup_x,Popup_y,
if (Location:="window"){
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
Gui, Popup: +AlwaysOnTop +Disabled -SysMenu +Owner -Caption +Toolwindow +HwndGUIID  ;+AlwaysOnTop +owner +HwndGUIID +Owner avoids a taskbar button.

Gui, Popup:color,%PopupColor1%, %PopupColor2%
Gui, Popup:Font,s10 cBlack Bold, Consolas
Gui, Popup:Add, Text,left, %Line1%
Gui, Popup:Font,s8 cBlack Bold, Consolas
  if (Line2)
    Gui, Popup:Add, Text,Center, %Line2%
Gui, Popup:Show, Noactivate x%popup_x% y%Popup_y%
 winSet, Transparent, %PopupTrans%, AHK_Id %GUIID%
settimer, destroyGui, -%PopupTime%
return
}

DestroyGui:
  try gui, Popup:destroy
  try gui, Popup2:destroy
return




TT(msg:="yo", time=1500, X:="",Y:="",N:="", Transparent:="",Position:="S") {
	global
	sleep 20
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


LogError(exception) {
	global
    ErrorLine:=exception.Line
    ErrorFile:=Exception.File
	 clipboard:=ErrorLine " " e " " ErrorFile
		FileAppend % "Error on at" exception.file " line " exception.Line ": " exception.Message "`n"
        , errorlog.txt
	 return True
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
	if winToggle := !winToggle
		winSet, Transparent, %T%, A
	else {
			winSet, TransColor, Off, A
		winSet, Transparent, Off, A
	}
Return
}

MouseIsOver(winTitle){
	Global
	MouseGetPos,,, win
	Return winExist(winTitle . " ahk_id " . win)
}
Mode(IsMode){
	Global Mode
	Return IsMode = Mode
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
	; Sendinput,{esc}
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
		if !winactive(window)
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
		Sendinput, mmignin{tab}{K}ilgore7744{enter}
	; Sendinput, ?+{K}ilgore7744{enter}
	if winExist("ahk_exe ONENOTE.EXE Protected Section"){
		winactivate
		Sendinput, {K}ilgore7744{enter}
	}
	if winExist("Login - \\Remote"){
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

CreditCard(){
	Sendinput, 4130220009588038
	TT("11/21 127",5000)
	return
}

#Ifwinactive



StopSub:
  exitapp
  Return
VarBar_ResetSub:
  VarBar.Reset()
  return
Run_Display:
  run, Display.url, C:\Users\mmignin\Desktop\
DebugVars(){
	if winexist("Variables ahk_exe AutoHotkey.exe")
		winactivate
	else
  	Run, DebugVars.Ahk, lib\DebugVars
}
CL3(){
  Run, cl3.Ahk, lib\CL3
}




Return

KeyHistory(){
  KeyHistory
  }
windowSpy(){
  Run, windowSpy.ahk,C:\Program Files\AutoHotkey\
  }
Exitsub(){
	global
  varbar.SaveVariables()
	; CloseScript("cl3.ahk")
	; sleep 200
	; CloseScript("Vim.ahk")
	; Sleep 200
  exitapp
  }
	;Success:=CloseScript("Case insensitive script name")
return

CloseScript(Name)
	{
	DetectHiddenwindows On
	SetTitleMatchMode RegEx
	IfwinExist, i)%Name%.* ahk_class AutoHotkey
		{
		winClose
		winWaitClose, i)%Name%.* ahk_class AutoHotkey, , 2
		If ErrorLevel
			return "Unable to close " . Name
		else
			return "Closed " . Name
		}
	else
		return Name . " not found"
	}