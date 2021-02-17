
VariableBar() { 
	Global
	Gui Var:destroy

	EnvGet, Batch, Batch
	EnvGet, Batch2, Batch2
	EnvGet, Batch3, Batch3   
	EnvGet, ProductCode, ProductCode
	Envget, Name, Name
	Envget, Customer, Customer
	Envget, Lot, Lot
	Envget, Description, Description
	Envget, Iteration, Iteration
	Menu, Tray, Add, VariableBarScreen, ScreenHandler, +BarBreak
	GUI, Var:Font, s20 cBlack Bold, Consolas
	Gui, Var:Add, Edit, r1 h25 x0 y-6 w80 Limit4 WantReturn vProductCode gProductCodeVar, %ProductCode%
	Gui Var:+LastFound +AlwaysOnTop  -Caption  +ToolWindow ; +E0x20 
	;Gui, Var:add, Text, h25 x0 y-6  +Left, %ProductCode% 
	Gui, Var:color, ef6950	 
	WinSet, Transparent, 200
	GUI, Var:Font, s20 cBlack Bold, Consolas
	GUI, Var:Font, s11 cBlack Bold, Consolas
	Gui, Var:add, Text, h2 x95 y-2 +left, %Batch%
	Gui, Var:add, Text, h40 x95 y12 +left, %Lot%
	GUI, Var:Font, s10 cBlack Bold, Consolas
	Gui, Var:add, Text, h2 x190 y-2 +right, %Name%
	Gui, Var:add, Text, h40 x200 y12 +right, %Customer%
	envget, Varbar_X, Varbar_X
	envget, VarBar_Y, VarBar_Y
gui, Var:add, button, x100 y20 w100 h20 g1, %Batch%
gui, Var:add, button, x150 y20 w100 h20 g2, %Batch2%
gui, Var:add, button, x200 y20 w100 h20 g3, %Batch3%
gui, Var:add, button, x250 y20 w100 h20 g4, % BatchArray[0]
	Try Gui, Var:Show, h30 x%Varbar_X% y%VarBar_Y% w390  NoActivate
		catch
			Gui, Var:Show, h40 x1400 y0 w390  NoActivate
			OnMessage(0x201, "WM_LBUTTONDOWN")
	sendinput, {shift}{ctrl}{alt}{alt}

return


gui, show
return
}
UpdateVar()
{
	global
	ClipSaved := ClipboardAll
	Send, ^c        ; copy the selected word
	ClipWait 1      ; wait for the clipboard to contain data
	If !ErrorLevel  ; If NOT ErrorLevel clipwait found data on the clipboard
	{
	    Index++     ; checks the number in the variable "Index" and increases it by 1, each time you press esc.
	    if (Index = MaxIndex+1) ; when the specific amount of words is exceeded
	    {
		   Index := 1      ; set this variable to 1
		   MyArray := []   ; recreate the object (empty the array)
	    }
	    MyArray.Insert(Index, clipboard)    
	}
	Sleep, 300
	clipboard := ClipSaved  ; restore original clipboard
	return

	DebugWindow(Batch[1] "`n" Batch[2] "`n" batch[3],0,1,10,0,0)

}



;-------------------------------------------------------------------------------
WM_LBUTTONDOWN() { ; move window
;-------------------------------------------------------------------------------
    PostMessage, 0xA1, 2 ; WM_NCLBUTTONDOWN
return
}

VariableBar_Relocate() {
	global
	keywait, Rbutton, U
	;MouseClick, Right,,, 1, 0, U ; Release the mouse button.
	coordmode, mouse, Screen
	MouseGetPos, VarBar_X, VarBar_Y
	sleep 100
	envset, Varbar_X, %Varbar_X%
	envset, VarBar_Y, %VarBar_Y%
	coordmode, mouse, Window
	VariableBar()
	return
	}


RightClickText(){
	mousegetpos, mousex, mousey
	Click, %A_CaretX% %A_caretY%, right
	mousemove, %mousex%, %mousey%
	return
	}
Click(Link) {
	global
	if Link contains Save_Product_Tab_EditProduct 
		click 275, 578
	else if Link contains Save_Composition
		click 1236, 888
	else if Link contains Save_Composition
		click 
	else if Link Contains OK_Product_Tab_EditIngredient
		click 265, 561
	else if Link contains OK_ResultEntry
		click, 1028, 808
	else if Link contains Orient_ResultEntry
		click 843, 202, 2
	else if Link contains main_enter_results
		click 74, 776
	else if Link contains ScrollDown_EditFormulation
		click  453, 444
	else if Link contains Dropdown_Product_Tab_EditIngredient
		click 272, 67
	else if Link contains SearchBar_SelectMethodsTests
		click 225, 69, 2
	else if Link contains MoveOverTest_SelectMethodsTests
		Send, {Click}{click 506, 341}
	else if Link contains Add
		click 45, 65
	else if Link contains Edit
		click 84, 65
	else if Link Contains Add_Formulation
		Sendinput, {click, 75, 280}
	else if Link contains AddNewSampleTemplate
		click 103, 325
	else if Link contains Orient_Spec_Tab_TestDefinitionEditor
		Click, 187, 200 
	else if Link contains Save_Spec_Tab_TestDefinitionEditor 
		Click 341, 618
	else if Link contains Select_TestsForRequests
		{
			sendinput, {Click 500, 340}{click, 845, 658}
			winwaitactive, Edit request - \\Remote, ,3
			sendinput, {tab}{enter}
		}
	else if Link Contains Products_Tab
		Sendinput, {click, 550, 35}{tab}%ProductCode%+{Tab 7} ;{click 454, 475, 2}
	else if Link contains SearchBar_ProductCode
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
			sendinput, %ProductCode%
			sleep 200
			send, {enter}
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
			sendinput, %Batch%
			sleep 200
			send, {enter}
			winwaitactive, Warning - \\Remote, ,2
			if errorlevel
				return
			else
				sendinput, {esc}
			return
		}
		Return
	}
	
	else
		;msgbox, yo
		return
}

Excel_ConnectTo(option=1){
	Global
	try {
		XLBook := ComObjActive("Excel.Application").Workbooks.Open("C:\Users\mmignin\OneDrive - Vitaquest International\New Products Workbook.xlsm")
		;XLBook:=ComObjGet("C:\Users\mmignin\OneDrive - Vitaquest International\Mats Workbook.xlsm")
		XL:=XLBook.ActiveSheet
		Visible := True		
	} Catch  {
		if (option:=0)
			exit
		else	
			msgbox, no Excel Sheet found	;if there is no excel sheet found
			exit	
	}
	XL_ProductCode:=XL.Range("B7").text
	XL_Name:=Xl.Range("B2").text
	
	XL_Batch:=Xl.Range("C1").text
	XL_Lot:=Xl.Range("E1").text
	XL_Customer:=Xl.Range("B3").text
	sleep 200
	EnvSet, ProductCode, %XL_ProductCode%
	EnvSet, Name, %XL_Name%
	EnvSet, Batch, %XL_Batch%
	EnvSet, Lot, %XL_Lot%
	EnvSet, Customer, %XL_Customer%
	Sleep 200
	VariableBar()
	return
}

Excel_Set_lot(Product_Code){
	Global
	try {
		XLBook := ComObjActive("Excel.Application").Workbooks.Open("C:\Users\mmignin\OneDrive - Vitaquest International\New Products Workbook.xlsm")
		;XL:=XLBook.Sheets(Product_Code)
		XL:=XLBook.ActiveSheet
		;XL_Current := ComObjActive("Excel.Application")
		Visible := True
	} Catch  {
		msgbox, no Excel Sheet found	;if there is no excel sheet found
		exit	
	}	
	;set_lot()
	Send, ^c
clipwait, 0.25
	Xl.Range("B5").text := Clipboard
	sleep 200
	;EnvSet, Lot, %Lot%
	Sleep 200
	;VariableBar()
}

Wheel_ZoomOut() {
	BlockInput, On
	;sendinput, ^{Wheeldown}
	send, ^-
	SLEEP 200
	blockinput, off
	return
}
Wheel_ZoomIn() {
	blockinput, On
	;sendinput, ^{Wheelup}
	send, ^=
	SLEEP 200
	blockinput, off
	return
}
Wheel_Paste() {
Global
	if winactive("ahk_exe WFICA32.EXE")
	{
		Clipboard := Trim((Clipboard, "`r`n"))
		sendinput, %Clipboard%
		tooltip, Paste
		sleep 1000
		tooltip,
		return
		
	}
	else 
		sendinput, ^v
	ToolTip, Paste
	sleep 800
	tooltip,
	return
}
Wheel_Cut() {
	global
	Send, ^x
clipwait, 0.25
	VariableBar()
	ToolTip, %clipboard%
	sleep 800
	tooltip,,
	return
}
Wheel_Copy() {
	global
	Send, ^c
clipwait, 0.25
	VariableBar()
	ToolTip, %clipboard%
	sleep 800
	tooltip,,
	return
}
RegisterNewSample() {
	global
	winactivate, Register new samples - \\Remote
	Send, {click 179, 105}{click}%ProductCode%{enter}
	}
CloseWindow() {

	If WinActive("ahk_exe WFICA32.EXE")
	{
		send, {esc}
		sleep 300
		return
	}
	else if WinActive("firefox.exe") || winactive("ahk_exe msedge.exe")
	{
		sendinput, {ctrl down}w{ctrl up}
		sleep 300
		return
	}
	else if WinActive("ahk_exe explorer.exe") || winactive("Inbox - mmignin@vitaquest.com - Outlook")
	{
		sendinput, !{F4}
		sleep 300
		return
	}
	else if winactive("Settings ahk_class ApplicationFrameWindow")
	{
		winclose
		sleep 300
		return
	}
	else if winactive("ahk_exe mstsc.exe") ||  winactive("ahk_exe EXCEL.EXE")
	{ 
		Send, ^v
		sleep 300
		return
	}
	else If winactive("NuGenesis LMS - \\Remote")
		Tooltip("nope")
	else
	return
	return
}
Tooltip(msg, time=700) {
	global
	tooltip, %msg%
	sleep, %time%
	tooltip
	}
	
Main_EditResults(){
	sendinput, {click}{click 77, 751} ;edit results
	winwaitactive, Results Definition - \\Remote
	return
	}
Send_ProductCode() 
{
	global
	EnvGet, ProductCode, ProductCode
	ProductCode := Trim(ProductCode, "`r`n")
	sleep 100
	If WinActive("Find and Replace") 
		send, !n%ProductCode%!i
	else if winactive("ahk_exe explorer.exe")
	{
		;Send, ^e^a
		sendinput, ^e%ProductCode%
		sleep 300
		send, {enter}
		return
	}
	else If winactive("NuGenesis LMS - \\Remote")
	{
		Sendinput, %ProductCode%{enter}
		return
	}
	else If winactive("NuGenesis LMS - \\Remote")
	{
		Sendinput, %ProductCode%{enter}
		return
	}
	else 
		Sendinput, %ProductCode%
	sleep 800
	return
}
send_Customer()
{
	global
		Envget, Customer, Customer
	Customer:= Trim((Customer, "`r`n"))
	sendinput, %Customer%
	sleep 800
	return
}
send_Name()
{
	global
	Name:= Trim((Name, "`r`n"))
	sendinput, %Name%
	sleep 800
	return
}
send_Lot()
{
	global
	Envget, Lot, Lot
	Lot:= Trim((Lot, "`r`n"))
	sendinput, %lot%
	sleep 800
	return
}
Send_Batch() 
{ 
	global
		EnvGet, Batch, Batch
	Batch:= Trim((Batch, "`r`n"))
	Sendinput, %Batch%
	sleep 800
	return 
}
Set_ProductCode() 
{ 
	global
	EnvGet, ProductCode, ProductCode
	ToolTip, Product
	PreClip:=Clipboard
	sleep 200
	Send, ^c    
clipwait, 0.25
	Clipboard := StrReplace(Clipboard, "`r`n")
	sleep 100
	ProductCode:=Clipboard    
clipwait, 0.25
	Clipboard:=Preclip
	EnvSet, ProductCode, %ProductCode%
	Sleep 200
	VariableBar()
	sleep 400
	tooltip,
	return 
}

Set_Lot() 
{ 
	global
	ToolTip, Lot
	PreClip:=Clipboard
	sleep 100
	Sendinput, ^c    
clipwait, 0.25
	Clipboard := StrReplace(Clipboard, "`r`n")
	sleep 100
	Lot:=Clipboard 
clipwait, 0.25
	Clipboard:=Preclip
	sleep 100
	EnvSet, lot, %Lot%
	Sleep 200
	VariableBar()
	sleep 400
	tooltip,
	return %Lot%
}

Set_Batch() 
{
	global
	Batch_code3:=Batch2
	sleep 100
	Batch_code2:=Batch
	clipwait, 0.5
	ToolTip, Batch
	PreClip:=Clipboard
	sleep 100
	Send, ^c    
clipwait, 0.25
	Clipboard := StrReplace(Clipboard, "`r`n")
	sleep 100
	Batch_Code:=Clipboard
clipwait, 0.25
	Clipboard:=Preclip
	sleep 100
	EnvSet, Batch, %Batch_Code%
	EnvSet, Batch2, %Batch_Code2%
	EnvSet, Batch3, %Batch_Code3%

	Sleep 200
	VariableBar()
	sleep 200
	tooltip,
	return ; %Batch%
}
Set_Batchs(The_BatchCode) 
{
	global
	Batch_code3:=Batch2
	sleep 100
	Batch_code2:=Batch
	clipwait, 0.5
	ToolTip, Batch
	sleep 100
	The_BatchCode := StrReplace(The_BatchCode, "`r`n")
	sleep 100
	Batch_Code:=The_BatchCode
clipwait, 0.25
	sleep 100
	EnvSet, Batch, %Batch_Code%
	EnvSet, Batch2, %Batch_Code2%
	EnvSet, Batch3, %Batch_Code3%

	Sleep 200
	VariableBar()
	sleep 200
	tooltip,
	return ; %Batch%
}
Set_Customer() 
{
	global
	ToolTip, Customer
	PreClip:=Clipboard
	sleep 100
	Send, ^c    
clipwait, 0.25
	Clipboard := StrReplace(Clipboard, "`r`n")
	sleep 100
	Customer:=Clipboard
clipwait, 0.25
	Clipboard:=Preclip
	sleep 100
	EnvSet, Customer, %Customer%
	Sleep 200
	VariableBar()
	sleep 200
	tooltip,
	return 
}
Set_Name() 
{
	global
	ToolTip, Name
	PreClip:=Clipboard
	sleep 100
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
	Send, ^c    
clipwait, 0.25
	Clipboard := StrReplace(Clipboard, "`r`n")
	sleep 100
	Name:=Clipboard
clipwait, 0.25
	Clipboard:=Preclip
	sleep 100
	EnvSet, Name, %Name%
	Sleep 200
	VariableBar()
	sleep 200
	tooltip,
	return 
}

Product_Tab_EditProduct(Product_Code) {
	global
	Excel_ConnectTo(Product_Code)
	click 120, 80 ;click product box
	Sendinput,%ProductCode%`,{space}%Name%{tab 2}%Customer%{tab 2}{right 2}{tab}{right 3}{tab}%ProductCode%{tab 2}
	sleep 200
	sendinput,%Name%{tab 8}
	winwaitactive, NuGenesis LMS - \\Remote, , 6
	Click("Add_Formulation")
	winactivate,  Edit Formulation - \\Remote
	return
}
	



HeavymetalsComponentsUS_Spec_Tab() {
	click 125,120 ;click 2nd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	;sleep 500
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}15{tab 5}NMT 15 mcg/day
	;sleep 300
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	;sleep 500
	click 125,140 ;click 2nd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	;sleep 500
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}5{tab 5}NMT 5 mcg/day
	;sleep 300
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	;sleep 500
	click 125,180 ;click 3rd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	;sleep 500
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}5{tab 5}NMT 5 mcg/day
	;sleep 300
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	;sleep 500
	click 125,200 ;click 4th row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	;sleep 500
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}15{tab 5}NMT 15 mcg/day
	;sleep 300
	click 390, 659	;click okay
	return
}
HeavymetalsComponentsCanada_Spec_Tab() {
	click 125,120 ;click 2nd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	;sleep 500
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}15{tab 5}NMT 15 mcg/day
	;sleep 300
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	;sleep 500
	click 125,140 ;click 2nd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	;sleep 500
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}5{tab 5}NMT 5 mcg/day
	;sleep 300
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	;sleep 500
	click 125,180 ;click 3rd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	;sleep 500
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}5{tab 5}NMT 5 mcg/day
	;sleep 300
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	;sleep 500
	click 125,200 ;click 4th row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	;sleep 500
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}15{tab 5}NMT 15 mcg/day
	;sleep 300
	click 390, 659	;click okay
	return
}
HeavymetalsComponentsProp65_Spec_Tab() {
	click 125,120 ;click 2nd row
	click 80,70 ;Edit
	winactivate, Result Editor - \\Remote
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 12}{space}{tab 2}^a
	;sendinput, {tab 5}mcg/day{tab 7}{tab 2}^a
	sendinput, 0{tab}^a
	sleep 100
	sendinput, 9.999{tab 5}^a<10 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
		winactivate, Result Definition - \\Remote
	click 125,140 ;click 2nd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 12}{space}{tab 2}^a
	;sendinput, {tab 5}mcg/day{tab 7}{tab 2}^a
	sendinput, 0{tab}^a
	sleep 100
	sendinput, 0.499{tab 5}^a<0.5 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
		winactivate, Result Definition - \\Remote
	click 125,180 ;click 3rd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 12}{space}{tab 2}^a
	;sendinput, {tab 5}mcg/day{tab 7}{tab 2}^a
	sendinput, 0{tab}^a
	sleep 100
	sendinput, 4.099{tab 5}^a<4.1 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
			winactivate, Result Definition - \\Remote
	click 125,200 ;click 4th row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 12}{space}{tab 2}^a
	;sendinput, {tab 5}mcg/day{tab 7}{tab 2}^a
	sendinput, 0{tab}^a
	sleep 100
	sendinput, 0.299{tab 5}^a<0.3 mcg/day
	click 390, 659	;click okay
	return
}
ChangeAvonTests(){
Global


}

SaveRestart(){
	;traytip, RESTART,Restart
	WinActivate, AHK Studio ahk_exe AHK-Studio.exe
	WinMenuSelectItem, ahk_class AutoHotkeyGUI ahk_exe AHK-Studio.exe, ,1&, 7& ; run in AHK Stuidio
	sleep 100
	reload
	sleep 800
	;tooltip,
	return
}
SaveRerun(){
	;traytip, Rerun,
	sleep 100
	WinMenuSelectItem, ahk_class AutoHotkeyGUI ahk_exe AHK-Studio.exe, ,4&, 8& ; run in AHK Stuidio
	sleep 800
	return
}
MouseLocation_Show(){
	global
	AutoTrim, Off
	if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 250)
		Run, C:\Program Files\AutoHotkey\WindowSpy.ahk
	else 
	{
		MouseGetPos, MouseLocationX, MouseLocationY
		WinGet, CurrentWindow, ProcessName, A
		WinGetTitle, Title, A
		windowTitle:=Title
		MousePosition:=MouselocationX "`, " MouselocationY
		ToolTip, %CurrentWindow%`, %Title% `n Mouse: %MouselocationX% `, %MouselocationY%
	}
	AutoTrim, On
	sleep 600
	tooltip
	return
}
ExcelSearch(){
	sendinput, ^f!t!h{right}{enter}!s{right}!t!n
	sendinput, {alt up}{shift up}{ctrl up}{lwin up}
	sleep 400
	return
}

Enter_Batch(key) {
	global
	MouseGetPos,MouseLocationX,MouseLocationY
	sleep 200
	inputbox,Batch,, %key%-,,70,130,%MouseLocationX%,%MouseLocationY%,,,%Batch%
	if ErrorLevel
		return
	else
		Batch:=key . "-" . Batch
	EnvSet, Batch, %Batch%
	Sleep 100		
	VariableBar()
	return
}
Enter_ProductCode(key){
	global
	MouseGetPos,MouseLocationX,MouseLocationY
	sleep 200
	inputbox,Code,,  %key%`t ,,70,130,%MouseLocationX%,%MouseLocationY%,,,%Code%
	if ErrorLevel
		return
	else
		ProductCode:=key . Code
	EnvSet, ProductCode, %ProductCode%
	Sleep 200	
	IfWinActive, NuGenesis LMS - \\Remote
		sendinput, {ctrl down}a{ctrl up}%ProductCode%{enter}
	VariableBar()
	return
} 

Spec_Tab_EditSampleTemplate_A() {
global
	winactivate, Edit sample template - \\Remote
	sendinput, {click 377, 82}{home}%ProductCode%`, In Process`, {Shift down}A{Shift up}nalytical{tab 2}{Right 6}{tab}{right 6}{tab}{right}
	return
}

Spec_Tab_EditSpecification_A_A(){
global
	sendinput, %Product_Code%`, In Process`, {Shift down}A{Shift up}nalytical{tab 4}^a%ProductCode%{tab}{enter}{tab}{space}{enter 2}{Tab}{right}{tab}{right 4}{tab}{right 6}{Tab 2}{Space}{tab 2}{right}{tab}{right}
	;winwait, NuGenesis LMS - \\Remote, ,8
	;if errorlevel 
		;return
	;else
		;click, 70, 520
	;winwait, Edit sample template - \\Remote,, 4
	;if errorlevel
		;return
	;else
		;sendinput, {tab}{delete 4}%Product_Code%
	;return\
	return
}			

InsertDescription(){
	Global
	DescriptionRaw:=Description
	Description:=RTrim(DescriptionRaw, "`r`n")
	Send,^a%Description%
	Return
} 

Spec_Tab_ResultEditor(Min_Limit,Max_Limit,The_Units,The_Percision) {
	Global
	
	WinActivate, Result Editor - \\Remote
	Requirement= %Min_Limit% - %Max_Limit% %The_Units% ;normal
	sleep 250
	click, 200, 137 ; click id box to orient
	sleep 300
	;if (Allergen = 1)
		;send, {tab 2}%The_units%{tab}^a%The_Percision%{tab 2}{Space}{Tab 3}{space}{Tab 3}^a%Max_Limit%{tab 5}^a
	;else
	send, {tab 2}%The_units%{tab}^a%The_Percision%{tab 7}^a%Min_Limit%{tab}^a%Max_Limit%{tab 5}^a ;normal
	sleep 100
	if (Max_limit = "")
		sendinput, NLT %Min_Limit% %The_Units%
	else if (Min_limit = "<")
		sendinput, %min_limit%%Max_Limit% %The_Units%
	else if (Min_limit = "")
		sendinput, NMT %Max_Limit% %The_Units%
	Else
		Sendinput, %Requirement%
	sleep 100
	click 350, 660 ; click okay
}

Spec_Tab_TestDefinitionEditor(The_Description) {
	Global
	Excel_ConnectTo(ProductCode)
	WinActivate, Test Definition Editor - \\Remote 
	DescriptionRaw:=The_Description
	Trimmed_Description:=RTrim(DescriptionRaw, "`r`n")
	Click, 187, 200 ;Orient_Spec_Tab_TestDefinitionEditor
	Sendinput,^a%Trimmed_Description%
	;sleep 200
	;click 464, 431 ;Scrollbar_Spec_Tab_TestDefinitionEditor
	;sleep 200
	;click 322, 422 ;Results_Spec_Tab_TestDefinitionEditor
	;send, {tab}{space}
	;sleep 400
	return
}

ChangeTestResults(Checkbox_Toggle:=0) {
	global 
	EnvGet, Iteration, Iteration
	MouseGetPos, xpos, ypos
	click
	Click("Orient_ResultEntry")
	if Checkbox_Toggle Contains Toggle
		sendinput, {tab}{Space}{tab}{Space}
	else 
		sendinput, {tab}{tab}
	sendinput, {tab 10}^a 
	sleep 100
	send, %Iteration%
	sleep 100
	mousemove, xpos, ypos+26
	return
	
}
Product_Tab_QuickSelectNextIngredient() {
	Global
			;Winactivate, Composition - \\Remote
	sleep 200
	Click, 47,67 ;click Add
	sleep 200
	winactivate, Edit Ingredient - \\Remote
	;click 280, 75 ;click dropdown
	;Product_Tab_DropDown_Ingredient()	
}


ShipToSelect(x_pos,y_pos){
	global
	Menu, ShipToMenu, Add, &B, ShipToMenuHandler
	Menu, ShipToMenu, Add, &C, ShipToMenuHandler
	Menu, ShipToMenu, Add, &F, ShipToMenuHandler
	Menu, ShipToMenu, Add, &H, ShipToMenuHandler
	Menu, ShipToMenu, Add, &L, ShipToMenuHandler
	Menu, ShipToMenu, Add, &M, ShipToMenuHandler
	Menu, ShipToMenu, Add, &N, ShipToMenuHandler
	Menu, ShipToMenu, Add, &P, ShipToMenuHandler
	Menu, ShipToMenu, Add, &S, ShipToMenuHandler
	Menu, ShipToMenu, Add, &V, ShipToMenuHandler
	Menu, ShipToMenu, Show,noactivate
	Return
	
	ShipToMenuHandler:
	winactivate, Edit sample
	sendinput, {click, %x_pos%, %y_pos%}{Home}
	If (A_ThisMenuItem = "&B") 
		sendinput, {tab}{pgdn 2}
	else if (A_ThisMenuItem = "&C") 
		sendinput, {tab}{pgdn 3}
	else if (A_ThisMenuItem = "&F") 
		sendinput, {tab}{pgdn 6}
	else if (A_ThisMenuItem = "&H") 
		sendinput, {tab}{pgdn 8}
	else if (A_ThisMenuItem = "&L") 
		sendinput, {tab}{pgdn 10}
	else if (A_ThisMenuItem = "&M") 
		sendinput, {tab}{pgdn 12}
	else if (A_ThisMenuItem = "&N") 
		sendinput, {tab}{pgdn 13}
	else if (A_ThisMenuItem = "&P") 
		sendinput, {tab}{pgdn 15}
	else if (A_ThisMenuItem = "&S") 
		sendinput, {tab}{pgdn 17}
	else if (A_ThisMenuItem = "&V") 
		sendinput, {tab}{pgdn 19}
	else
		return
	
	return
	
	
}

Product_Tab_DropDown_Ingredient() 
{
	global
	;Menu, IngredientMenu, Add, &Biotin, IngredientMenuHandler
	;Menu, IngredientMenu, Add, Cadmium, IngredientMenuHandler
	;Menu, IngredientMenu, Add, Caffeine, IngredientMenuHandler
	;Menu, IngredientMenu, Add, &Calcium, IngredientMenuHandler
	;Menu, IngredientMenu, Add, Choline, IngredientMenuHandler
	;Menu, IngredientMenu, Add, &Chromium, IngredientMenuHandler
	;Menu, IngredientMenu, Add, Coenzyme Q10, IngredientMenuHandler
	;Menu, IngredientMenu, Add, &Copper, IngredientMenuHandler
	Menu, IngredientMenu, Add, Creatine, IngredientMenuHandler
	;Menu, IngredientMenu, Add, &Folic Acid, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &A.1, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &B.1, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &C.1, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &D.1, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &E.1, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &F.1, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &G, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &H, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &I, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &J, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &K, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &L, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &M, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &N, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &O, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &P, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &Q, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &R, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &S, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &T, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &U, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &V, IngredientMenuHandler
	Menu, IngredientMenu, Add, Glucosamine, IngredientMenuHandler
	;Menu, IngredientMenu, Add, Glycine, IngredientMenuHandler
	Menu, IngredientMenu, Add, &Ingredient Note 1, IngredientMenuHandler
	Menu, IngredientMenu, Add, &Ingredient Note 2, IngredientMenuHandler
	Menu, IngredientMenu, Add, &Ingredient Note 3, IngredientMenuHandler
	;Menu, IngredientMenu, Add, Inositol, IngredientMenuHandler
	;Menu, IngredientMenu, Add, &Iron, IngredientMenuHandler
	;Menu, IngredientMenu, Add, Lead, IngredientMenuHandler
	;Menu, IngredientMenu, Add, &L-Tyrosine, IngredientMenuHandler
	;Menu, IngredientMenu, Add, &Magnesium, IngredientMenuHandler
	;Menu, IngredientMenu, Add, Malic Acid, IngredientMenuHandler
	;Menu, IngredientMenu, Add, &Manganese, IngredientMenuHandler
	;Menu, IngredientMenu, Add, Mercury, IngredientMenuHandler
	Menu, IngredientMenu, Add, &Methylsulfonylmethane (MSM), IngredientMenuHandler
	Menu, IngredientMenu, Add, Molybdenum, IngredientMenuHandler
	;Menu, IngredientMenu, Add, &Niacin, IngredientMenuHandler
	Menu, IngredientMenu, Add, PABA, IngredientMenuHandler
	;Menu, IngredientMenu, Add, &Pantothenic Acid, IngredientMenuHandler
	;Menu, IngredientMenu, Add, &Phosphorus, IngredientMenuHandler
	;Menu, IngredientMenu, Add, &Potassium, IngredientMenuHandler
	Menu, IngredientMenu, Add, Protein, IngredientMenuHandler
	Menu, IngredientMenu, Add, Quercetin Dihydrate, IngredientMenuHandler
	;Menu, IngredientMenu, Add, &Riboflavin, IngredientMenuHandler
	;Menu, IngredientMenu, Add, &Selenium, IngredientMenuHandler
	;Menu, IngredientMenu, Add, &Sodium, IngredientMenuHandler
	Menu, IngredientMenu, Add, Taurine, IngredientMenuHandler
	;Menu, IngredientMenu, Add, &Thiamin, IngredientMenuHandler
	Menu, IngredientMenu, Add, Total Probiotic, IngredientMenuHandler
	Menu, IngredientMenu, Show,
	return
	
	IngredientMenuHandler:
	
	if (A_ThisMenuItem ="&Biotin") 
		Sendinput, {click 150,73}{tab}{right 21}
	else if (A_ThisMenuItem ="Cadmium") 
		Sendinput, {click 150,73}{tab}{right 23}
	;else if (A_ThisMenuItem ="Caffeine") 
		;Sendinput, {click 150,73}{tab}{right 24}
	;else if (A_ThisMenuItem ="&Calcium") 
		;Sendinput, {click 150,73}{tab}{right 25}
	else if (A_ThisMenuItem ="Choline") 
		Sendinput, {click 150,73}{tab}{right 30}
	else if (A_ThisMenuItem ="&Chromium") 
		Sendinput, {click 150,73}{tab}{right 32}
	else if (A_ThisMenuItem ="Coenzyme Q10") 
		Sendinput, {click 150,73}{tab}{right 34}
	;else if (A_ThisMenuItem ="&Copper") 
		;Sendinput, {click 150,73}{tab}{right 35}
	else if (A_ThisMenuItem ="Creatine") 
		Sendinput, {click 150,73}{tab}{right 36}
	else if (A_ThisMenuItem ="&Folic Acid") 
		Sendinput, {click 150,73}{tab}{right 52}
	else if (A_ThisMenuItem ="Generic Ingredient &A.1") 
		Sendinput, {click 150,73}{tab}{right 57}
	else if (A_ThisMenuItem ="Generic Ingredient &B.1") 
		Sendinput, {click 150,73}{tab}{right 63}
	else if (A_ThisMenuItem ="Generic Ingredient &C.1") 
		Sendinput, {click 150,73}{tab}{right 69}
	else if (A_ThisMenuItem ="Generic Ingredient &D.1") 
		Sendinput, {click 150,73}{tab}{right 75}
	else if (A_ThisMenuItem ="Generic Ingredient &E.1") 
		Sendinput, {click 150,73}{tab}{right 81}
	else if (A_ThisMenuItem ="Generic Ingredient &F.1") 
		Sendinput, {click 150,73}{tab}{right 87}
	else if (A_ThisMenuItem ="Generic Ingredient &G") 
		Sendinput, {click 150,73}{tab}{right 93}
	else if (A_ThisMenuItem ="Generic Ingredient &H") 
		Sendinput, {click 150,73}{tab}{right 94}
	else if (A_ThisMenuItem ="Generic Ingredient &I") 
		Sendinput, {click 150,73}{tab}{right 96}
	else if (A_ThisMenuItem ="Generic Ingredient &J") 
		Sendinput, {click 150,73}{tab}{right 98}
	else if (A_ThisMenuItem ="Generic Ingredient &K") 
		Sendinput, {click 150,73}{tab}{right 100}
	else if (A_ThisMenuItem ="Generic Ingredient &L") 
		Sendinput, {click 150,73}{tab}{right 101}
	else if (A_ThisMenuItem ="Generic Ingredient &M") 
		Sendinput, {click 150,73}{tab}{right 102}
	else if (A_ThisMenuItem ="Generic Ingredient &N") 
		Sendinput, {click 150,73}{tab}{right 103}
	else if (A_ThisMenuItem ="Generic Ingredient &O") 
		Sendinput, {click 150,73}{tab}{right 104}
	else if (A_ThisMenuItem ="Generic Ingredient &P") 
		Sendinput, {click 150,73}{tab}{right 105}
	else if (A_ThisMenuItem ="Generic Ingredient &Q") 
		Sendinput, {click 150,73}{tab}{right 106}
	else if (A_ThisMenuItem ="Generic Ingredient &R") 
		Sendinput, {click 150,73}{tab}{right 107}
	else if (A_ThisMenuItem ="Generic Ingredient &S") 
		Sendinput, {click 150,73}{tab}{right 108}
	else if (A_ThisMenuItem ="Generic Ingredient &T") 
		Sendinput, {click 150,73}{tab}{right 109}
	else if (A_ThisMenuItem ="Generic Ingredient &U") 
		Sendinput, {click 150,73}{tab}{right 110}
	else if (A_ThisMenuItem ="Generic Ingredient &V") 
		Sendinput, {click 150,73}{tab}{right 111}
	else if (A_ThisMenuItem ="Glucosamine") 
		Sendinput, {click 150,73}{tab}{right 127}
	else if (A_ThisMenuItem ="Glycine") 
		Sendinput, {click 150,73}{tab}{right 131}
	else if (A_ThisMenuItem ="&Ingredient Note 1") 
		Sendinput, {click 150,73}{tab}{right 139}
	else if (A_ThisMenuItem ="&Ingredient Note 2") 
		Sendinput, {click 150,73}{tab}{right 141}
	else if (A_ThisMenuItem ="&Ingredient Note 3") 
		Sendinput, {click 150,73}{tab}{right 142}
	else if (A_ThisMenuItem ="Inositol") 
		Sendinput, {click 150,73}{tab}{right 149}
	;else if (A_ThisMenuItem ="&Iron") 
		;Sendinput, {click 150,73}{tab}{right 154}
	else if (A_ThisMenuItem ="Lead") 
		Sendinput, {click 150,73}{tab}{right 166}
	else if (A_ThisMenuItem ="&L-Tyrosine") 
		Sendinput, {click 150,73}{tab}{right 180}
	;else if (A_ThisMenuItem ="&Magnesium") 
		;Sendinput, {click 150,73}{tab}{right 184}
	else if (A_ThisMenuItem ="Malic Acid") 
		Sendinput, {click 150,73}{tab}{right 185}
	;else if (A_ThisMenuItem ="&Manganese") 
		;Sendinput, {click 150,73}{tab}{right 186}
	else if (A_ThisMenuItem ="Mercury") 
		Sendinput, {click 150,73}{tab}{right 188}
	else if (A_ThisMenuItem ="&Methylsulfonylmethane (MSM)") 
		Sendinput, {click 150,73}{tab}{right 190}
	else if (A_ThisMenuItem ="Molybdenum") 
		Sendinput, {click 150,73}{tab}{right 194}
	;else if (A_ThisMenuItem ="&Niacin") 
		;Sendinput, {click 150,73}{tab}{right 203}
	else if (A_ThisMenuItem ="PABA") 
		Sendinput, {click 150,73}{tab}{right 205}
	;else if (A_ThisMenuItem ="&Pantothenic Acid") 
		;Sendinput, {click 150,73}{tab}{right 207}
	;else if (A_ThisMenuItem ="&Phosphorus") 
		;Sendinput, {click 150,73}{tab}{right 213}
	;else if (A_ThisMenuItem ="&Potassium") 
		;Sendinput, {click 150,73}{tab}{right 216}
	else if (A_ThisMenuItem ="Protein") 
		Sendinput, {click 150,73}{tab}{right 219}
	else if (A_ThisMenuItem ="Quercetin Dihydrate") 
		Sendinput, {click 150,73}{tab}{right 223}
	;else if (A_ThisMenuItem ="&Riboflavin") 
		;Sendinput, {click 150,73}{tab}{right 229}
	;else if (A_ThisMenuItem ="&Selenium") 
		;Sendinput, {click 150,73}{tab}{right 236}
	;else if (A_ThisMenuItem ="&Sodium") 
		;Sendinput, {click 150,73}{tab}{right 238}
	else if (A_ThisMenuItem ="Taurine") 
		Sendinput, {click 150,73}{tab}{right 246}
	;else if (A_ThisMenuItem ="&Thiamin") 
		;Sendinput, {click 150,73}{tab}{right 249}
	else if (A_ThisMenuItem ="Total Probiotic") 
		Sendinput, {click 150,73}{tab}{right 257}
	;else if (A_ThisMenuItem ="Vitamin &A") 
		;Sendinput, {click 150,73}{tab}{right 261}
	;else if (A_ThisMenuItem ="Vitamin &B12") 
		;Sendinput, {click 150,73}{tab}{right 262}
	;else if (A_ThisMenuItem ="Vitamin B&6") 
		;Sendinput, {click 150,73}{tab}{right 263}
	;else if (A_ThisMenuItem ="Vitamin &C") 
		;Sendinput, {click 150,73}{tab}{right 264}
	;else if (A_ThisMenuItem ="Vitamin &D") 
		;Sendinput, {click 150,73}{tab}{right 265}
	;else if (A_ThisMenuItem ="Vitamin &E") 
		;Sendinput, {click 150,73}{tab}{right 266}
	;else if (A_ThisMenuItem ="Vitamin &K") 
		;Sendinput, {click 150,73}{tab}{right 267}
	;else if (A_ThisMenuItem ="&Zinc") 
		;Sendinput, {click 150,73}{tab}{right 274}
	
	else
		return
	return
	
}




Product_Tab_tabletsizeMenu(){
	Menu, tabletsizeMenu, Add, 11/32” round / 0.34375”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 0.365” deep / 0.365”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 3/8” round / 0.375”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 13/32” round 0.40625”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 7/16” round / 0.4375”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 1/2” round / 0.500”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 5/8” round / 0.625”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 3/4” round / 0.750”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 1” round / 1.000”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add
	Menu, tabletsizeMenu, Add, 5 ½ oval / 0.625” x 0.344”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 5 cap oblong / 0.750” x 0.250”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 5 ½ cap oblong / 0.750” x 0.313”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 5 ½ bisect oblong / 0.750” x 0.313”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 687x281 mod oblong (4 cap) / 0.687" x 0.281", tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 6 mod oblong 0.748” x 0.380”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 6 ¼ mod oblong 0.775” x 0.400”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 6 ½ mod oblong 0.875” x 0.375”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 7 mod oblong 0.910” x 0.405”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 6 special oblong / 0.825” x 0.325”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 6 cap oblong / 0.830” x 0.320”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 6 ½ cap oblong / 0.860” x 0.330”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 6 oval / 0.760” x 0.325”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add
	Menu, tabletsizeMenu, Add, Small “M” Oval Fit punch / 0.672” x 0.336”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 750x350 bisect oval / 0.750" x 0.350", tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 750x375 oval / 0.750" x 0.375", tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, Triangle (Tri-G) / 0.375” (height), tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, Square / 0.390” x 0.390”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, Hexagon / 0.433”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add
	Menu, tabletsizeMenu, Add, #3 capsule / 0.626” x 0.229”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, #2 capsule / 0.709” x 0.250”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, #1 capsule / 0.765” x 0.272”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, #0 capsule / 0.854” x 0.300”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, #00 capsule / 0.917” x 0.336”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Show
	return
	
	tabletsizeMenuHandler:
	send, ^a
	sleep 200
	if (A_ThisMenuItem = "11/32” round / 0.34375”") 
		SendRaw, 11/32” round / 0.34375”"
	else if (A_ThisMenuItem = "0.365” deep / 0.365”") 
		SendRaw, 0.365” deep / 0.365”"
	else if (A_ThisMenuItem = "3/8” round / 0.375”") 
		SendRaw, 3/8” round / 0.375”"
	else if (A_ThisMenuItem = "13/32” round 0.40625”") 
		SendRaw, 13/32” round 0.40625”"
	else if (A_ThisMenuItem = "7/16” round / 0.4375”") 
		SendRaw, 7/16” round / 0.4375”"
	else if (A_ThisMenuItem = "1/2” round / 0.500”") 
		SendRaw, 1/2” round / 0.500”
	else if (A_ThisMenuItem = "5/8” round / 0.625”") 
		SendRaw, 5/8” round / 0.625”
	else if (A_ThisMenuItem = "3/4” round / 0.750”") 
		SendRaw, 3/4” round / 0.750”
	else if (A_ThisMenuItem = "1” round / 1.000”") 
		SendRaw, 1” round / 1.000”
	else if (A_ThisMenuItem = "5 ½ oval / 0.625” x 0.344”") 
		SendRaw, 5 ½ oval / 0.625” x 0.344”
	else if (A_ThisMenuItem = "5 cap oblong / 0.750” x 0.250”") 
		SendRaw, 5 cap oblong / 0.750” x 0.250”
	else if (A_ThisMenuItem = "5 ½ cap oblong / 0.750” x 0.313”") 
		SendRaw, 5 ½ cap oblong / 0.750” x 0.313”
	else if (A_ThisMenuItem = "5 ½ bisect oblong / 0.750” x 0.313”") 
		SendRaw, 5 ½ bisect oblong / 0.750” x 0.313”
	else if (A_ThisMenuItem = "687x281 mod oblong (4 cap) / 0.687 x 0.281") 
		SendRaw, 687x281 mod oblong (4 cap) / 0.687 x 0.281
	else if (A_ThisMenuItem = "6 mod oblong 0.748” x 0.380”") 
		SendRaw, 6 mod oblong 0.748” x 0.380”
	else if (A_ThisMenuItem = "6 ¼ mod oblong 0.775” x 0.400”") 
		SendRaw, 6 ¼ mod oblong 0.775” x 0.400”
	else if (A_ThisMenuItem = "6 ½ mod oblong 0.875” x 0.375”") 
		SendRaw, 6 ½ mod oblong 0.875” x 0.375”
	else if (A_ThisMenuItem = "7 mod oblong 0.910” x 0.405”") 
		SendRaw, 7 mod oblong 0.910” x 0.405”
	else if (A_ThisMenuItem = "6 special oblong / 0.825” x 0.325”") 
		SendRaw, 6 special oblong / 0.825” x 0.325”
	else if (A_ThisMenuItem = "6 cap oblong / 0.830” x 0.320”") 
		SendRaw, 6 cap oblong / 0.830” x 0.320”
	else if (A_ThisMenuItem = "6 ½ cap oblong / 0.860” x 0.330”") 
		SendRaw, 6 ½ cap oblong / 0.860” x 0.330”
	else if (A_ThisMenuItem = "6 oval / 0.760” x 0.325”") 
		SendRaw, 6 oval / 0.760” x 0.325”
	else if (A_ThisMenuItem = "Small “M” Oval Fit punch / 0.672” x 0.336”") 
		SendRaw, Small “M” Oval Fit punch / 0.672” x 0.336”
	else if (A_ThisMenuItem = "750x350 bisect oval / 0.750 x 0.350") 
		SendRaw, 750x350 bisect oval / 0.750 x 0.350
	else if (A_ThisMenuItem = "750x375 oval / 0.750 x 0.375") 
		SendRaw, 750x375 oval / 0.750 x 0.375
	else if (A_ThisMenuItem = "Triangle (Tri-G) / 0.375” (height)") 
		SendRaw, Triangle (Tri-G) / 0.375” (height)
	else if (A_ThisMenuItem = "Square / 0.390” x 0.390”") 
		SendRaw, Square / 0.390” x 0.390”
	else if (A_ThisMenuItem = "Hexagon / 0.433”") 
		SendRaw, Hexagon / 0.433”
	else if (A_ThisMenuItem = "#3 capsule / 0.626” x 0.229”") 
		Sendraw, #3 capsule / 0.626” x 0.229”
	else if (A_ThisMenuItem = "#2 capsule / 0.709” x 0.250”") 
		Sendraw, #2 capsule / 0.709” x 0.250”
	else if (A_ThisMenuItem = "#1 capsule / 0.765” x 0.272”") 
		Sendraw, #1 capsule / 0.765” x 0.272”
	else if (A_ThisMenuItem = "#0 capsule / 0.854” x 0.300”") 
		Sendraw, #0 capsule / 0.854” x 0.300”
	else if (A_ThisMenuItem = "#00 capsule / 0.917” x 0.336”") 
		sendRaw, #00 capsule / 0.917” x 0.336”
	return
	Sleep 100
	VariableBar()
	return
}



set_ExcelProductCode(){
	Global
	try {
		XL := ComObjActive("Excel.Application")
		;XL:=XLBook.ActiveSheet
		Visible := True		
	} Catch  ;if there is no excel sheet found
		return
	XL_ProductCode:=XL.Range("B7").text
	XL_Name:=Xl.Range("B2").text
	XL_Batch:=Xl.Range("C1").text
	XL_Lot:=Xl.Range("E1").text
	XL_Customer:=Xl.Range("B3").text
	sleep 200
	EnvSet, ProductCode, %XL_ProductCode%
	EnvSet, Name, %XL_Name%
	EnvSet, Batch, %XL_Batch%
	EnvSet, Lot, %XL_Lot%
	EnvSet, Customer, %XL_Customer%
	Sleep 200
	VariableBar()
}
Excel_set_ProductCode_Cell(){
	Global
	click
	try {
		XL := ComObjActive("Excel.Application")
		Visible := True		
	} Catch  ;if there is no excel sheet found
		return
	XL_ProductCode:=XL.ActiveCell.Text
	sleep 200
	EnvSet, ProductCode, %XL_ProductCode%
	Sleep 200
	VariableBar()
	return
}



