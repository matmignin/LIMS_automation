; #include *i D:\VQuest\lib\clip.ahk
; #include *i D:\VQuest\lib\VarBar.ahk
; #include *i D:\VQuest\lib\Excel.ahk
; #include *i D:\VQuest\lib\LMS.ahk
  #include D:\VQuest\lib\menu.ahk





Pop(Line1,Line2:="",PopupTime:=1000,Location:="Mouse"){
  global
; traytip, ,%Clipboard%
	sleep 20
; try {
  ; GUI, Popup:destroy ;:
  ; settimer, destroyGUI, off
; }
PopupColor1:="CE6D4B"
PopupColor2:="FFFFFF"
PopupTrans:=250
CoordMode, mouse, window
winGetPos,Popup_wX,Popup_wY,Popup_wW,Popup_wH, A
; CoordMode, mouse, Screen
MouseGetPos, Popup_x,Popup_y,
if (Location = "window"){
	popup_y:=Popup_wx
	popup_x:=Popup_Wy
	}
if (Location = "Right"){
	popup_y:=Popup_WW-100
	popup_x:=Popup_Wy
	}
if (Location = "Screen"){
	popup_y:=1
	popup_x:=1
	}
else {
	popup_y:=popup_y-300
	popup_x:=Popup_x
	}
GUI, Popup: +AlwaysOnTop +Disabled -SysMenu +Owner -Caption +Toolwindow +HwndGUIID  ;+AlwaysOnTop +owner +HwndGUIID +Owner avoids a taskbar button.

GUI, Popup:color,%PopupColor1%, %PopupColor2%
GUI, Popup:Font,s10 cBlack Bold, Consolas
GUI, Popup:Add, Text,left, %Line1%
GUI, Popup:Font,s8 cBlack Bold, Consolas
  if (Line2)
    GUI, Popup:Add, Text,Center, %Line2%
GUI, Popup:Show, Noactivate x%popup_x% y%Popup_y%
 winSet, Transparent, %PopupTrans%, AHK_Id %GUIID%
settimer, destroyGUI, -%PopupTime%
return
}

DestroyGui:
  try GUI, Popup:destroy
  try GUI, Popup2:destroy
return


FloVar(VariableText:="", MousePopup:="", FontSize:=17){
		Global
		try GUI, FloVar:Destroy
		if MouseIsOver("ahk_exe NOTEPAD.EXE") || MouseIsOver("ahk_exe WFICA32.EXE")
			Color:="000000"
		else
			color:="FFFFFF"
		CoordMode, Mouse, Screen
		MouseGetPos, Mx, My
		OutlineColor := "282A36"  ; Can be any RGB color (it will be made transparent below).
		Gui FloVar: +LastFound +AlwaysOnTop -Caption +Toolwindow  ; +Toolwindow avoids a taskbar button and an alt-tab menu item.
		GUI, FloVar:Color, %OutlineColor%
		GUI, FloVar:Font, % "s" Fontsize , Arial Narrow ; Set a large font size (32-point).
		sleep 30
		GUI, FloVar:Add, Text, +wrap R30 vMyText c%Color%, XXXXXXXXXXXXXXXXXXXXXXX YYYYYYYYYYYYYYYYYYYYYYY  ; XX & YY serve to auto-size the window.
		; Make all pixels of this color transparent and make the text itself translucent (150):
			winSet, TransColor, %OutlineColor%  230
		; else

			; winSet, TransColor, %OutlineColor%  150
		; winSet, TransColor, 453936  250
		if VariableText{
			FloVarText:=VariableText
			; GUI, FloVar:Font, s5
			}
		else {
			FlovarText:=
			if Product
				FlovarText.=Product
			if Batch
				FlovarText.=" " Batch
			if lot
				FlovarText.=" " lot
			if Coated
				FlovarText.=" Ct#" Coated
		}
		; SetTimer, updateOSD, -100
		Gosub, FloatOSD  ; Make the first update immediate rather than waiting for the timer.
		if (MousePopup){
			; GUI, FloVar:Font, % "s" MousePopup
			; my-=500\
			SetTimer, FloatOSD, 25
			GUI, FloVar:Show, x%mx% y%my% NoActivate, FloVar  ; Noactivate avoids deactivating the currently active window.
			SetTimer, PopUpOSD, % "-" MousePopup
		}
		else
			GUI, FloVar:Show, x%mx% y%my% NoActivate, FloVar  ; Noactivate avoids deactivating the currently active window.
				CoordMode, Mouse, window
	return
		updateOSD:
		MouseGetPos, Mx, My
			return
		PopupOSD:
			try GUI, FloVar:destroy
			SetTimer, FloatOSD, Off
			return
		FloatOSD:
			CoordMode, mouse, Screen
			MouseGetPos, Mx, My
			My-=450
			Mx-=50
			GuiControl, FloVar:Text, MyText, % FloVarText
			try
			winMove, FloVar ahk_class AutoHotkeyGUI, ,A_CaretX+50, A_CaretY+50
			catch
			winMove, FloVar ahk_class AutoHotkeyGUI, ,Mx, My
			; sleep 50
			return
	}



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










ExplorerSearch(text){
		;excel.connect(1)
		AllLabelCopy:="C:\Users\mmignin\Desktop\Desktop Stuff\Label Copy\All Label Copy"
		Searchwindow:="search-ms:displayname"
		IfwinNotExist, %Searchwindow% && ifwinNotexist, %AllLabelCopy%
			return
		;  Run, %AllLabelCopy%
		; IfwinNotExist, ahk_exe explorer.exe && ifwinNotexist, %AllLabelCopy%										Run, %AllLabelCopy%
			; run, %AllLabelCopy%
		IfwinExist, %Searchwindow%
			winactivate, %AllLabelCopy%
		winwait, %AllLabelCopy%, ,2
		if errorlevel
			winactivate, ahk_exe explorer.exe
		sleep 300
		winGetPos, wX, wY, wW, wH, A
		ww-=175
		send, {click %ww%, 75}
		sleep 400
		; SetKeyDelay, 20, 1
		Send, %Text%
		sleep 300
		Send, {enter}
		; setkeydelay, 0 , 0
		return
}



FindAndReplaceWord(find,Replace,AllOrOne:="a"){
		Send, ^{h}%find%{tab}%replace%{altdown}{%AllOrOne%}{altup}
		if (Allorone=="a"){
			loop 3 {
				sleep 200
				if winactive("Microsoft Word")
					Send, {enter}
				sleep 300
			}
					return
		}
		else
			Send, {enter}{esc}
}

Table_Entry(Entry){
		Global Iteration
			if Iteration < 0
				Direction:="{Tab}"
			If Iteration > 0
				Direction:="{down}+{tab}{Tab}"
		send % Entry Direction "{ctrlup}{altup}{shiftup}"
	}



	ClickText2(){
		mousegetpos, mousex, mousey
		; SetDefaultMouseSpeed, 0
		Click, %A_CaretX%, %A_caretY%
		sleep 50
		mousemove, %mousex%, %mousey%, 0
		; SetDefaultMouseSpeed, 1
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
    filedelete, D:\VQuest\data\debug.txt
  sleep 200
  fileAppend %Debugtext%, D:\VQuest\data\debug.txt
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



RemoveFileDuplicates(File,Sorting:="U CL R"){
	global
	FileRead, vText, % File
  vOutput := ""
  ; vtext:=strReplace(vText, "`n`n", "")
; vText:=Trim(StrReplace(vText, "`t", ""))
	VarSetCapacity(vOutput, StrLen(vText)*2*2)
	oArray := {}
	StrReplace(vText, "`n",, vCount)
	oArray.SetCapacity(vCount+1)
	;Sort, vText, D, ;add this line to sort the list
	Loop Parse, vText, % "`r`n"
	{
		if !oArray.HasKey("z" A_LoopField)
			oArray["z" A_LoopField] := 1, vOutput .= A_LoopField "`r`n"
	}
	oArray := ""
  ; OutputVar:=Trim(OutputVar, " `t")
  ; OutputVar:=trim(StrReplace(OutputVar, "`t", ""))
  ; sleep 200
	; Sort, OutputVar, % Sorting
  ; vOutput:=trim(vOutput, "`n`n")
  ; vOutput:=trim(vOutput, "`r`n`r`n")
	NewOutputVar := RegExReplace(vOutput, "m`a)(\s\r\n)","`n")
	FileDelete, % File
	sleep, 400
	FileAppend, %NewOutputVar%, % File
}

RemoveTextDuplicates(vText){ ;maintaining order and case insensitive
vOutput := ""
; vText:=Trim(StrReplace(vText, "`t", ""))
VarSetCapacity(vOutput, StrLen(vText)*2*2)
oArray := {}
StrReplace(vText, "`n",, vCount)
oArray.SetCapacity(vCount+1)
;Sort, vText, D, ;add this line to sort the list
Loop Parse, vText, % "`n"
{
	if !oArray.HasKey("z" A_LoopField)
		oArray["z" A_LoopField] := 1, vOutput .= A_LoopField "`r`n"
}
oArray := ""
return vOutput
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





DoublePress(action,Secondaction:="", ToolTip:=""){
	If (A_Thishotkey=A_Priorhotkey && A_TimeSincePriorHotkey<300){
		Send, % action ;"{shiftup}{altup}{ctrlup}{lwinup}"
		tt(ToolTip)
		return
	}
	Else
		send, % Secondaction ; "{shiftup}{altup}{ctrlup}{lwinup}"
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
Listlines(){
  Listlines
  }
windowSpy(){
  Run, windowSpy.ahk,C:\Program Files\AutoHotkey\
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