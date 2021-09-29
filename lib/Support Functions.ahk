





class Breaking {
	Point(){
		Global
		If GetKeyState("Space", "P") || GetKeyState("Esc", "P") || GetKeyState("Lbutton", "P") {	
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
	
	
	CloseWindow(){
	global
	WinGetTitle, ThisWindow, A
		if ThisWindow contains, Inbox - mmignin@vitaquest.com - Outlook
			return
		if ThisWindow contains, PDF Preview - \\Remote, OneNote for Windows 10,ahk_exe OUTLOOK.EXE,OneNote for Windows 10,ahk_exe explorer.exe,
			Send, {altdown}{F4}{altup}
		if ThisWindow contains,Results Definition - \\Remote
			Send, {esc}
		if ThisWindow contains,ahk_exe firefox.exe, ahk_exe Code.exe, ahk_exe msedge.exe, 
			Send, {ctrldown}{w}{ctrlup}
		if ThisWindow contains, NuGenesis LMS - \\Remote
			LMS.FilterClear()
		if ThisWindow contains,Adobe Acrobat Reader
			send {ctrldown}{q}{ctrlup}; || winactive("ahk_exe OUTLOOK.EXE")
			return
	}


; else if winactive("Composition - \\Remote"){
	; 	clk(841, 895)
	; 	sleep 50
	; 	clk(946, 896)
	; 	sleep 400
	; }
	; else If winactive("NuGenesis LMS - \\Remote")
	; 	LMS.FilterClear()
	; else if WinActive("ahk_exe firefox.exe") || winactive("ahk_exe msedge.exe") || winactive("ahk_exe Code.exe") {
	; 	Send, ^{w}
	; 	sleep 400
	; 	return
	; }
	; else if WinActive("ahk_exe explorer.exe") || winactive("ahk_exe OUTLOOK.EXE") || winactive("OneNote for Windows 10") {
	; 	Send, {altdown}{F4}{altup}
	; 	sleep 400
	; 	return
	; }
	; else if winactive("Settings ahk_class ApplicationFrameWindow"){
	; 	winclose
	; 	sleep 400
	; 	return
	; }
	; else if winactive("ahk_exe EXCEL.EXE"){
	; 	Send, {ctrldown}{down}{ctrlup}
	; 	sleep 400
	; 	return
	; }
	; else if winactive("Adobe Acrobat Reader"){
	; 	Send, ^q
	; 	sleep 400
	; }
	; else
	; 	PostMessage, 0x112, 0xF060,,, A     ; ...so close window     
	; return
	; }
	
	
	; CloseWindow(){
	; global
	; if WinActive("Inbox - mmignin@vitaquest.com - Outlook") ; || winactive("ahk_exe OUTLOOK.EXE")
	; 	Return
	; else if winexist("PDF Preview - \\Remote"){
	; 	winactivate
	; 	sleep 100
	; 	Send, {altdown}{F4}{altup}
	; }
	; else if winactive("Results Definition - \\Remote"){
   ;  Send, {esc}
   ;  return
	; }
	; ; else if winactive("Composition - \\Remote"){
   ;  ; 	clk(841, 895)
   ;  ; 	sleep 50
   ;  ; 	clk(946, 896)
   ;  ; 	sleep 400
   ;  ; }
	; else If winactive("NuGenesis LMS - \\Remote")
	; 	LMS.FilterClear()
	; else if WinActive("ahk_exe firefox.exe") || winactive("ahk_exe msedge.exe") || winactive("ahk_exe Code.exe") {
	; 	Send, ^{w}
	; 	sleep 400
	; 	return
	; }
	; else if WinActive("ahk_exe explorer.exe") || winactive("ahk_exe OUTLOOK.EXE") || winactive("OneNote for Windows 10") {
	; 	Send, {altdown}{F4}{altup}
	; 	sleep 400
	; 	return
	; }
	; else if winactive("Settings ahk_class ApplicationFrameWindow"){
	; 	winclose
	; 	sleep 400
	; 	return
	; }
	; else if winactive("ahk_exe EXCEL.EXE"){
	; 	Send, {ctrldown}{down}{ctrlup}
	; 	sleep 400
	; 	return
	; }
	; else if winactive("Adobe Acrobat Reader"){
	; 	Send, ^q
	; 	sleep 400
	; }
	; else
	; 	PostMessage, 0x112, 0xF060,,, A     ; ...so close window     
	; return
	; }
	
	
	
	
ctrlEvent(CtrlHwnd, GuiEvent, EventInfo, ErrLevel:=""){

 ;GuiControlGet, OutputVar , , %CtrlHwnd%,
	IniRead,vOutput, Customers.ini, Customers, %OutputVar%
 msgbox, %vOutput%
}





; ReadSpecIntoDataBase:
;   iniread, full, data.ini, %Product%,ecc738
;   Test_Specs:= strsplit(Full,"=")
;   Test:=Test_Specs[1]
;   Specs:= strsplit(Test_Specs[2],"|")
;   msgbox % "test: " Test "`n`nLabelClaim: " Specs[1] "`nMinLimit: " Specs[2] "`nMaxLimit: " Specs[3] "`nUnits: " Specs[4] "`nPercision: " Specs[5] "`nDescription: " Specs[6] "`nMethod: " Specs[7] "`n" "`nTests: " Tests "`nTest_Specs[2]: " Test_Specs[2]
;   LabelClaim[A_index] "|" MinLimit[A_index]"|" MaxLimit[A_index]"|" Units[A_index]"|" Percision[A_index] "|" Description[A_index] "|" Method[A_index]
;   Return 
  
  
  
  WM_LBUTTONDOWN(wParam, lParam)
			{
				X := lParam & 0xFFFF
				Y := lParam >> 16
				if A_GuiControl
					Ctrl := "`n(in control " . A_GuiControl . ")"
				; ToolTip You left-clicked in Gui window #%A_Gui% at client coordinates %X%x%Y%.%Ctrl%
				PostMessage, 0xA1, 2
				; sleep 200
		; keywait, Lbutton, U T0.20
			; if !errorlevel
			; {
					; if errorlevel
						; MouseClick, Left, , , 1, 0, U
						; MouseClick, Left, , , 1, 0, U
				; keywait, Lbutton, U T5
		; MouseClick, Left, , , 1, 0, U
				wingetpos, Varbar_X, Varbar_Y,W,H, VarBar ahk_class AutoHotkeyGUI
				; sleep 200
				; IniWrite, %Varbar_X%, data.ini, Locations, VarBar_X
				; IniWrite, %Varbar_Y%, data.ini, Locations, VarBar_Y
					
				; return
			; }
			; else
		; MouseClick, Left, , , 1, 0, U
		return
					
} 


WindowInfo(){
	global
	CoordMode, mouse, window
	MouseGetPos, mX, mY, ,WinControl
	WinGetPos,wX,wY,wW,wH, A
	WinGetTitle, winTitle, A
	WinGetClass, Winclass, A
	WinGet, WinProcess, ProcessName, A
	MousePosition:=mX "`, " mY
	Sleep, 100
	TT(MousePosition "`n Title: " winTitle " `n Process: " WinProcess " `n Control: "winControl " `n Class: " winclass "`nWindowPosition " wX ", " wY ", " wW ", " wH,3000,,,2)
	Process:= "ahk_exe " WinProcess
	WinInfo:="WinMove, " Process ", , " wX ", " wY ", " wW ", " wH
	WinLocation:= wX "," wY "," wW "," wH
	
	keywait, F20, U T5
	
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
	If N
		exit
	If ToolTipMessage
		TT(TooltipMessage)
	N:=1
	SetTimer, BlockInput, -%time%
	return
	
	BlockInput:
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


Pop(Line1,Line2:="",PopupTime:=1000){
  global
try {
  gui, PopUp:destroy ;:
  settimer, destroyGui, off
}
PopupColor1:="CE6D4B"
PopupColor2:="FFFFFF"
PopupTrans:=190
CoordMode, mouse, Screen
MouseGetPos, PopUp_x,Popup_y,
popup_y:=Popup_y+30
Gui, PopUp: +AlwaysOnTop +Disabled -SysMenu +Owner -Caption +ToolWindow +HwndGUIID  ;+AlwaysOnTop +owner +HwndGUIID +Owner avoids a taskbar button.

Gui, PopUp:color,%PopupColor1%, %PopupColor2%  
Gui, PopUp:Font,s16 cBlack Bold, Consolas
Gui, PopUp:Add, Text,left, %Line1%
Gui, PopUp:Font,s10 cBlack Bold, Consolas
  if (Line2)
    Gui, PopUp:Add, Text,Center, %Line2%
Gui, PopUp:Show, NoActivate x%popup_x% y%Popup_y%
 WinSet, Transparent, %PopUpTrans%, AHK_Id %GUIID%
CoordMode, mouse, Window

settimer, destroyGui, -%PopupTime%
return
}

DestroyGui:
  try gui, PopUp:destroy
return




TT(msg:="yo", time=1500, X:="",Y:="",N:="", Transparent:="",Position:="R") {
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
	CoordMode, ToolTip, screen 
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
ReloadScript(){
	global
	IniWrite, %note1%, data.ini, Notes, note1
	IniWrite, %note2%, data.ini, Notes, note2
	IniWrite, %note3%, data.ini, Notes, note3
	IniWrite, %note4%, data.ini, Notes, note4
	TT(blank " Reload `t`t" blank,,,,,180)
	Send, !s
	sleep 200
	; try
		run, VQuest.ahk
	; catch e ;catch any errors
	; throw e
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
	MoveOverTest_1(){
		if winactive("Select Methods Tests")
			Send,{Click}{click 506, 341}
		Else
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
	if (window!="")
		winactivate, %window%
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

Mouse_Click(Link){
	global
	Mouse_Save()
	if Link contains Save_ProductTab.EditProduct
		click 275, 578
	else If link contains Results_Definition_edit
		click 78,63
	else If link contains Result_Editor_Ok
		click 370,660
	else If link contains Results_Definition_ok
		click 1336,592
	else If link contains Requests_tab
		click 865,83
	else If link contains MyWork_Tab
		click 761,44
	else If link contains Mywork_Searchbar
		click 500,127, 2
	else if Link contains Save_Composition
		click 1236, 888
	else if Link contains Save_Composition
		click
	else if Link Contains OK_ProductTab.EditIngredient
		click 265, 561
	else if Link contains OK_ResultEntry
		click, 1028, 808
	else if Link contains Orient_ResultEntry
		click 843, 202, 2
	else if Link contains main_enter_results
		click 74, 776
	else if Link contains ScrollDown_EditFormulation
		click 453, 444
	else if Link contains Dropdown_ProductTab.EditIngredient
		click 272, 67
	else if Link contains SearchBar_SelectMethodsTests
		click 225, 69, 2
	else if Link contains MoveOverTest_SelectMethodsTests
		Send,{Click}{click 506, 341}
	else if Link contains Add
		click 45, 65
	else if Link contains Edit
		click 84, 65
	else if Link Contains Main_EditTest
		SendInput,{click, 56, 784 }
	else if Link Contains Add_Formulation
		click, 73, 280
	else if Link contains AddNewSampleTemplate
		click 103, 325
	else if Link contains Orient_SpecTab.TestDefinitionEditor
		Click, 187, 200
	else if Link contains Save_SpecTab.TestDefinitionEditor
		Click 341, 618
	else if Link contains Select_TestsForRequests
	{
		SendInput,{Click 500, 340}{click, 845, 658}
		winwaitactive, Edit request - \\Remote, ,3
		SendInput,{tab}{enter}
	}
	else if Link Contains Products_Tab
		SendInput,{click, 550, 35}{tab}%Product%+{Tab 7}
	else if Link contains SearchBar_Product
	{
		if winactive("Select methods tests - \\Remote")
		{
			click, 246,77, 2
			return
		}
		else If WinActive("NuGenesis LMS - \\Remote")
		{
			;click 366, 44
			;sleep 300
			click 518, 89, 2
			SendInput, %Product%
			sleep 200
			Send,{enter}
		}
		return
	}
	else if Link contains SearchBar_Batch
	{
		if winactive("Select methods tests - \\Remote")
		{
			click, 246,77, 2
			return
		}
		else If WinActive("NuGenesis LMS - \\Remote")
		{
			click 783, 45
			sleep 400
			click 487, 125, 2
			SendInput, %Batch%
			sleep 200
			Send,{enter}
			winwaitactive, Warning - \\Remote, ,2
			if errorlevel
				return
			else
				SendInput,{esc}
			return
		}
		Return
	}
	else
		msgbox, yo
	Send, %mouseReturn%
	return
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
	KeyWait, F21,
	MouseClick, left,,, 1, 0, u
	Send,{enter}
	sleep 200 ;screenshot"}
	WinActivate, %mwin%
	sleep 200
	; CLICK, %Mx%, %My%
	Send, ^v
	return
	}


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
ShowSampleID(){
  global
  Menu, Tray, ToggleCheck, ShowSampleID
  If ShowSampleID := !ShowSampleID
  IniWrite, 1, data.ini, Options, ShowSampleID
  else
  IniWrite, 0, data.ini, Options, ShowSampleID
  Varbar.Show()
  }
ShowCoated(){
  global
  Menu, Tray, ToggleCheck, ShowCoated
  If ShowCoated := !ShowCoated
  IniWrite, 1, data.ini, Options, ShowCoated
  else
  IniWrite, 0, data.ini, Options, ShowCoated
  Varbar.Show()
  }
SwitchWorkSheets(){
	global
	Menu, Tray, ToggleCheck, SwitchWorkSheets
	If SwitchWorkSheets:= !SwitchWorkSheets
	{
		IniWrite, 1, data.ini, Options, SwitchWorkSheets
		Menu, Tray, Check, SwitchWorkSheets
	}
	else 
	{
		IniWrite, 0, data.ini, Options, SwitchWorkSheets
		Menu, Tray, unCheck, SwitchWorkSheets
	}
	Varbar.Show()
	}
NoIdle(){
	global
	Menu, Tray, ToggleCheck, NoIdle
	If NoIdle:= !NoIdle
	{
		SetTimer, NoidleTimer, % (3*60*1000)
		Menu, Tray, Check, NoIdle
	}
	else 
	{
		Menu, Tray, unCheck, NoIdle
		Settimer, NoidleTimer,off
	}
	Varbar.Show()
	}
	
NoIdleTimer:
if (A_TimeIdle > (60*1000)) {
  MouseMove, 1,0,0,R
  SLEEP 100
  MouseMove, -1,0,0,R
}
Return
ShowNotes(){
  global
  ;  Menu, Tray, ToggleCheck, ShowNotes
  If ShowNotes:= !ShowNotes
  {
  IniRead, Note1, data.ini, Notes, Note1
  IniRead, Note2, data.ini, Notes, Note2
  IniRead, Note3, data.ini, Notes, Note3
  	Notes.Show()
  }
  else
  iniWrite, %Note1%, data.ini, Notes, Note1
  iniWrite, %Note2%, data.ini, Notes, Note2
  iniWrite, %Note3%, data.ini, Notes, Note3
  Notes.Close()
  Varbar.Show()
  }
KeyHistory(){
  KeyHistory
  }
WindowSpy(){
  Run, WindowSpy.ahk,C:\Program Files\AutoHotkey\
  }
Exitsub(){
  varbar.exit()
  exitapp
  }