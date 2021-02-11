Click(Link) {
	global
	if Link contains Save_EditProduct 
		click 275, 578
	else if Link contains Save_Composition
		click 1236, 888
	else if Link Contains OK_EditIngredient
		click 265, 561
	else if Link contains OK_ResultEntry
		click, 1028, 808
	else if Link contains Orient_ResultEntry
		click 843, 202, 2
	else if Link contains main_enter_results
		click 74, 776
	else if Link contains ScrollDown_EditFormulation
		click  453, 444
	else if Link contains Dropdown_EditIngredient
		click 272, 67
	else if Link contains SearchBar_SelectMethodsTests
		click 229, 68, 2
	else if Link contains Add_ResultsDefinition
		click 45, 61
	else if Link contains Edit
		click 84, 72
	else if Link contains Orient_TestDefinitionEditor
		Click, 187, 200 
	else if Link contains Save_TestDefinitionEditor 
		Click 341, 618
	else if Link contains Select_TestsForRequests
		sendinput, {click}{Click 500, 340}
	else
		msgbox, yo
	return
}

ConnectToExcel(option=0){
	Global
	try {
		XL := ComObjActive("Excel.Application").Sheets(ProductCode)
		Visible := True		
	} Catch  ;if there is no excel sheet found
		exit	
	msgbox, found
	Name:=Xl.Range("B2").text
	Batch:=Xl.Range("B4").text
	Lot:=Xl.Range("B5").text
	Customer:=Xl.Range("B3").text
	ServingSize:=Xl.Range("B6").text
msgbox end 2

return
}

VariableWindow() { 
	Global  
    ;Gui +LastFound 
	Gui Var:destroy
	EnvGet, Batch, Batch
	EnvGet, ProductCode, ProductCode
	Envget, Name, Name
	Envget, Customer, Customer
	Envget, Lot, lot
	Envget, Description, Description
	Envget, Iteration, Iteration
	Sleep 100
	Gui Var:+LastFound +AlwaysOnTop  -Caption  +ToolWindow ;+E0x20 
	Gui, Var:color, ffffff	 
	WinSet, Transparent, 200
	GUI, Var:Font, s24 cBlack Bold, Consolas
	;Gui, Var:add, Text, h25 x0 y-0  +Left, %ProductCode% 
	;Gui, Var:add, Text, h25 x110 y-4  +right, %Batch%
	Gui, Var:Add, Edit, r1 h25 x0 y-6 Limit4 WantReturn vProductCode gProductCodeVar, %ProductCode%
	Gui, Var:Add, Edit, r1 h25 x110 y-6 Limit9 WantReturn vBatch gBatchVar, %Batch%
	;Gui, Var:Add, Edit, r1 h30 x0 y-4 Limit4 WantReturn vProductCode gVariableWindow, %ProductCode%
	Gui, Var:Show, h30 x%RighterScreen% y%TopScreen% w290 NoActivate
	sendinput, {rshift up}{ctrl up}{alt up}{shift up}
	return
	
	ProductCodeVar:
	Gui, Var:submit,NoHide
	ProductCode:=ProductCode    
	EnvSet, ProductCode, %ProductCode%
	return
	BatchVar:
	Gui, Var:submit,NoHide
	Batch:=Batch    
	EnvSet, Batch, %Batch%
	return
}

Copy_Selection(Target_Variable,Cell_location){ 
	Global
	ConnectToExcel(ProductCode)
	PreClip:=Clipboard
	sleep 150
	Send, ^c    
	Target_Variable := StrReplace(Clipboard, "`r`n")
	Clipboard:=Preclip
	sleep 100
	sleep 150
	XL.Range(Cell_Location).Value := Target_Variable
	sleep 50
}

ZoomOut() {
	sendinput, ^{Wheeldown}
	SLEEP 20
	return
}
ZoomIn() {
	sendinput, ^{Wheelup}
	SLEEP 20
	return
}
WheelPaste() {
	sendinput, ^v
	ToolTip, "Paste"
	sleep 800
	tooltip,,
	return
}
WheelCut() {
	global
	Send, ^x
	sleep 50
	VariableWindow()
	ToolTip, %clipboard%
	sleep 800
	tooltip,,
	return
}
WheelCopy() {
	global
	Send, ^c
	sleep 50
	VariableWindow()
	ToolTip, %clipboard%
	sleep 800
	tooltip,,
	return
}

CloseWindow() {
	If WinActive("ahk_exe WFICA32.EXE")
	{
		send, {esc}
		sleep 800
		return
	}
	else if WinActive("ahk_class MozillaWindowClass ahk_exe firefox.exe")
	{
		sendinput, ^w
		sleep 800
		return
	}
	else if winactive("ahk_exe msedge.exe")
	{
		send, ^w
		sleep 800
		return
	}
	else if winactive("Settings ahk_class ApplicationFrameWindow")
	{
		winclose, Settings ahk_class ApplicationFrameWindow
		return
	}
	else 
	{
		Send, !{F4}
		sleep 800
		return
	}
	return
}

Send_ProductCode() 
{
	global
	ProductCode := Trim((ProductCode, "`r`n"))
	IfWinActive, Find and Replace, 
		send, !n%ProductCode%!i
	ifwinactive, ahk_exe explorer.exe 
	{
		Send, ^e^a
		sendinput, %ProductCode%
		send, {enter}
		return
	}
	else
		Sendinput, %ProductCode%
	sleep 800
	return
}

Send_Batch() 
{ 
	global
	Sendinput, %Batch%
	return 
}
Set_ProductCode() 
{ 
	global
	ToolTip, Product
	PreClip:=Clipboard
	sleep 200
	Send, ^c    
	sleep 200
	Clipboard := StrReplace(Clipboard, "`r`n")
	ProductCode:=Clipboard    
	Clipboard:=Preclip
	EnvSet, ProductCode, %ProductCode%
	Sleep 200
	VariableWindow()
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
	Send, ^c    
	sleep 200
	Clipboard := StrReplace(Clipboard, "`r`n")
	sleep 39
	Lot:=Clipboard 
	sleep 40
	Clipboard:=Preclip
	sleep 40
	EnvSet, lot, %Lot%
	Sleep 200
	VariableWindow()
	sleep 400
	tooltip,
	return 
}


Set_Batch() 
{
	global
	ToolTip, Batch
	PreClip:=Clipboard
	sleep 100
	Send, ^c    
	sleep 200
	Clipboard := StrReplace(Clipboard, "`r`n")
	sleep 100
	Batch:=Clipboard
	sleep 50
	Clipboard:=Preclip
	sleep 50
	EnvSet, Batch, %Batch%
	Sleep 200
	VariableWindow()
	sleep 200
	tooltip,
	return 
}


Click_ProductSpec_SearchBar(Search_Entry:="") {
	Global
	if winactive("Select methods tests - \\Remote")
	{
		click, 246,77, 2
		return
	}
	else If WinActive("NuGenesis LMS - \\Remote")
	{
		click 566, 86, 2
		sendinput, %Search_Entry%
		sleep 200
		send, {enter}
	}
;~ Click, 2
	sleep 100
	;~ Send,%ProductCode%{enter}
}
Click_Sample_SearchBar(Search_Entry:=""){
	Global
	if winactive("Select methods tests - \\Remote")
	{
		click, 246,77, 2
		return
	}
	else If WinActive("NuGenesis LMS - \\Remote")
	{
		click 420, 120, 2
		sendinput, %Search_Entry%
		sleep 200
		send, {enter}
	}
;~ Click, 2
	sleep 100
	;~ Send,%ProductCode%{enter}
}

EditProduct() {
	global
	ConnectToExcel(ProductCode)
	click 120, 80 ;click product box
	Sendinput,%ProductCode%`,{space}%XL_Name%{tab 2}%Customer%{tab 2}{right 2}{tab}{right 3}{tab}%ProductCode%{tab 2}
	sleep 200
	sendinput,%Name%{tab 8}
	return
}

EditIngredient(Ingredient_Name,Ingredient_Claim,Ingredient_Position){
	Global
	Ingredient_Name:=Trim(Ingredient_Name, "`r`n")
	Ingredient_Claim:=Trim(Ingredient_Claim, "`r`n")
	Ingredient_position:=Trim(Ingredient_Position, "`r`n")
	Winactivate, Edit Ingredient - \\Remote
	sleep 200
	winactivate, Edit Ingredient - \\Remote
	send,{tab 6}^a%Ingredient_position%{tab}^a
	Sendinput,%Ingredient_Name%
	sleep 100
	send,{tab 2}^a
	send,%Ingredient_Claim%{tab 2}{enter} 
	return
} ;}

QuickSelectNextIngredient() {
	Global
			;Winactivate, Composition - \\Remote
	sleep 200
	Click, 47,67 ;click Add
	sleep 200
	winactivate, Edit Ingredient - \\Remote
	click 280, 75 ;click dropdown
	;Select(Ingredient_ID_dropdown)
	input, alphakey,L1 T4,{Escape}{space},
	if ErrorLevel contains Endkey:Escape
		return
	if ErrorLevel contains Endkey:Space
		sendinput,{pgdn 4,}{doWn 10}
	else If alphakey contains a,b
		sendinput, {pgdn 1}{down 0}
	else If alphakey contains d,e
		sendinput, {pgdn 1}{down 0}
	else If alphakey contains c
		sendinput, {pgdn 1}{down 12}
	else If alphakey contains f
		sendinput, {pgdn 2}{down 0}
	else If alphakey contains g
		sendinput, {pgdn 3}{down 0} 
	else If alphakey contains h
		sendinput, {pgdn 6}{down 5}
	else If alphakey contains i
		sendinput, {pgdn 7}{down 5}
	else If alphakey contains j 
		sendinput, {pgdn 8}{down 0}
	else If alphakey contains l,m,n
		sendinput, {pgdn 8}{down 8}
	else If alphakey contains o,p
		sendinput, {pgdn 9}{down 0}
	else If alphakey contains q,r
		sendinput, {pgdn 10}{down 5}
	else If alphakey contains s
		sendinput, {pgdn 11}{down 5}
	else If alphakey contains t,v,w,y,z
		sendinput, {pgdn 13}{down 5}
	else 
		return
	return
}

HeavyMetalsComponents() {
	click 125,120 ;click 2nd row
	click 80,70 ;Edit
	winwait, Result Editor - \\Remote,,4
	;sleep 500
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}15{tab 5}NMT 15 mcg/day
	;sleep 300
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	;sleep 500
	click 125,140 ;click 2nd row
	click 80,70 ;Edit
	winwait, Result Editor - \\Remote,,4
	;sleep 500
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}5{tab 5}NMT 5 mcg/day
	;sleep 300
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	;sleep 500
	click 125,180 ;click 3rd row
	click 80,70 ;Edit
	winwait, Result Editor - \\Remote,,4
	;sleep 500
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}5{tab 5}NMT 5 mcg/day
	;sleep 300
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	;sleep 500
	click 125,200 ;click 4th row
	click 80,70 ;Edit
	winwait, Result Editor - \\Remote,,4
	;sleep 500
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}15{tab 5}NMT 15 mcg/day
	;sleep 300
	click 390, 659	;click okay
	return
}
 

SaveRestart(){
	traytip, RESTART,Restart
	WinActivate, AHK Studio ahk_exe AHK-Studio.exe
	WinMenuSelectItem, ahk_class AutoHotkeyGUI ahk_exe AHK-Studio.exe, ,1&, 7& ; run in AHK Stuidio
	sleep 100
	reload
	sleep 800
	tooltip,
	return
}
SaveRerun(){
	traytip, Rerun,
	sleep 100
		WinMenuSelectItem, ahk_class AutoHotkeyGUI ahk_exe AHK-Studio.exe, ,4&, 8& ; run in AHK Stuidio
	sleep 800
	return
}
ShowMouseLocation(){
	global
	AutoTrim, Off
	if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 250)
		Run, C:\Users\MMIGNIN\OneDrive - Vitaquest International\AHK\Autohotkey\WindowSpy.ahk
	else 
	{
		MouseGetPos, MouseLocationX, MouseLocationY
		WinGet, CurrentWindow, ProcessName, A
		WinGetTitle, Title, A
		windowTitle:=Title
		MousePosition:=MouselocationX "`, " MouselocationY
		TrayTip, %CurrentWindow%, %Title% `n Mouse: %MouselocationX% `, %MouselocationY%
	}
	AutoTrim, On
	return
}
ExcelSearch() {
	send, ^f!t!h{right}{enter}!s{right}!t!n 
	sleep 400
	return
}


Enter_Batch(key) {
	global
	inputbox,Batch,, %key%-,,70,130,1+%RighterScreen%,%TopScreen%,,,%Batch%
	if ErrorLevel
		return
	else
		Batch:=key . "-" . Batch
	EnvSet, Batch, %Batch%
	Sleep 100		
	VariableWindow()
	return
}
Enter_ProductCode(key){
	global
	inputbox,Code,,  %key%`t ,,70,130,%RighterScreen%,%TopScreen%,,,%Code%
	if ErrorLevel
		return
	else
		ProductCode:=key . Code
	EnvSet, ProductCode, %ProductCode%
	Sleep 200	
	IfWinActive, NuGenesis LMS - \\Remote
		sendinput, {ctrl down}a{ctrl up}%ProductCode%{enter}
	VariableWindow()
	return
} 
GetExcel_LabelCopy() {      ;gather excel data
	Global	
	ConnectToExcel(ProductCode)
	Name:=[]
	LabelClaim:=[]
	Position:=[]
	LabelName:=[]
	while (Xl.Range("C" . A_Index+6).Value != "") {
		Position[A_index]:=Xl.Range("E" . A_Index+7).Text
		Name[A_index]:=Xl.Range("J" . A_Index+7).text
		LabelClaim[A_index]:=Xl.Range("K" . A_Index+7).Text
		LabelName[A_index]:=Xl.Range("L" . A_Index+7).Text
		Total_rows:=A_index-1
		Table_Height:=A_index
	}
	Gui, IngredientList:Default
	Gui, IngredientList:+LastFound +ToolWindow +Owner +AlwaysOnTop ;-Sysmenu 
	GUI, Font, s11 cBlack ;Consolas
	Gui, IngredientList:Add, ListView, x0 y0 r%Table_height% w500 Grid NoSortHdr checked gIngredientList,  `t%Code%|`t%Name%|`t%Customer%|LabelName	
	loop, %Total_Rows%
		LV_add("",Position[A_index],Name[A_index],LabelClaim[A_index],LabelName[A_index])
	LV_ModifyCol(1,50) 
	LV_ModifyCol(2,250)
	LV_ModifyCol(3,150)			
	LV_ModifyCol(4,0)3
	LV_Delete(Table_Height)
	sleep 100		
	CoordMode, mouse, Screen
	MouseGetPos, xPos, yPos	
	CoordMode, mouse, window
	Gui, IngredientList:Show, x%xpos% y%ypos% autosize, Ingredients
	return		
	
}

GetExcel_Specification() {      ;gather excel data
	Global
	ConnectToExcel(ProductCode)
	Name:=[]
	LabelClaim:=[] 
	MinLimit:=[]
	MaxLimit:=[]
	Units:=[]
	Percision:=[]
	LabelName:=[]
	Description:=[]
	;XL_Code:=Xl.Range("B7").text
	;XL_Name:=Xl.Range("B2").text
	;XL_Batch:=Xl.Range("B4").text
	;XL_Lot:=Xl.Range("B5").text
	;XL_Customer:=Xl.Range("B3").text
	while (Xl.Range("C" . A_Index+7).Value != "") {
		Name[A_index]:=Xl.Range("J" . A_Index+7).text
		LabelClaim[A_index]:=Xl.Range("K" . A_Index+7).Text
		MinLimit[A_index]:=Xl.Range("F" . A_Index+7).Text
		MaxLimit[A_index]:=Xl.Range("G" . A_Index+7).Text
		Units[A_index]:=Xl.Range("H" . A_Index+7).Text
		Percision[A_index]:=Xl.Range("I" . A_Index+7).Text
		LabelName[A_index]:=Xl.Range("L" . A_Index+7).Text
		Description[A_index]:=Xl.Range("M" . A_Index+7).Text
		Total_rows:=A_index
		Table_Height:=A_index+1
		if (Table_Height > 30)
			Table_Height = 30
		
	}
}

EditSampleTemplate_A(Product_code) {
	sendinput, %Product_Code%`, In Process`, Analytical
	send,{tab 2}{Right 6}{tab}{right 6}{tab}{right}
	return
}

EditSpecification_A(Product_Code){
	sendinput, %Product_Code%`, In Process`, Analytical
	Sendinput,{tab 4}^a%Product_Code%{tab}{enter}{tab}{space}{enter 2}
	;winwait, Edit specification, 2
	sleep 500
	sendinput,{tab}{right}{tab}{right 4}{tab}{right 6}{Tab 2}{Space}{tab 2}{right}{tab}{right}
	winwait, NuGenesis LMS - \\Remote, ,8
	if errorlevel 
		return
	else
		click, 70, 520
	winwait, Edit sample template - \\Remote,, 4
	if errorlevel
		return
	else
		sendinput, {tab}{delete 4}%Product_Code%
	return
}			

InsertDescription(){
	Global
	DescriptionRaw:=Description
	Description:=RTrim(DescriptionRaw, "`r`n")
	Send,^a%Description%
	Return
} 




ResultEditor(Min_Limit,Max_Limit,The_Units,The_Percision) {
	Global
	WinActivate, Result Editor - \\Remote
	Requirement= %Min_Limit% - %Max_Limit% %The_Units%
	click, 500, 81 ; click Scroll bar
	sleep 250
	click, 200, 137 ; click id box to orient
	sleep 300
	send, {tab 2}%The_units%{tab}^a%The_Percision%{tab 7}^a%Min_Limit%{tab}^a%Max_Limit%{tab 5}^a
	sleep 200
	Sendinput, %Requirement%
	sleep 100
	click 350, 660 ; click okay
}

TestDefinitionEditor(The_Description) {
	Global
	DescriptionRaw:=The_Description
	Trimmed_Description:=RTrim(DescriptionRaw, "`r`n")
	Click, 187, 200 ;Orient_TestDefinitionEditor
	Sendinput,^a%Trimmed_Description%
	sleep 200
	click 464, 431 ;Scrollbar_TestDefinitionEditor
	sleep 200
	click 322, 422 ;Results_TestDefinitionEditor
	send, {tab}{space}
	sleep 400
	return
}

ChangeTestResults(Checkbox_Toggle:=0) {
	global Iteration
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
IngredientSelect() 
{
	global
	Menu, IngredientMenu, Add, Biotin, IngredientMenuHandler
	Menu, IngredientMenu, Add, Cadmium, IngredientMenuHandler
	Menu, IngredientMenu, Add, Caffeine, IngredientMenuHandler
	Menu, IngredientMenu, Add, Calcium, IngredientMenuHandler
	Menu, IngredientMenu, Add, Choline, IngredientMenuHandler
	Menu, IngredientMenu, Add, Chromium, IngredientMenuHandler
	Menu, IngredientMenu, Add, Coenzyme Q10, IngredientMenuHandler
	Menu, IngredientMenu, Add, Copper, IngredientMenuHandler
	Menu, IngredientMenu, Add, Creatine, IngredientMenuHandler
	Menu, IngredientMenu, Add, Folic Acid, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient A.1, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient B.1, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient C.1, IngredientMenuHandler
	Menu, IngredientMenu, Add, Glucosamine, IngredientMenuHandler
	Menu, IngredientMenu, Add, Glycine, IngredientMenuHandler
	Menu, IngredientMenu, Add, Ingredient Note 1, IngredientMenuHandler
	Menu, IngredientMenu, Add, Inositol, IngredientMenuHandler
	Menu, IngredientMenu, Add, Iron, IngredientMenuHandler
	Menu, IngredientMenu, Add, L-Alanine, IngredientMenuHandler
	Menu, IngredientMenu, Add, Lead, IngredientMenuHandler
	Menu, IngredientMenu, Add, L-Glutamic Acid, IngredientMenuHandler
	Menu, IngredientMenu, Add, L-Tyrosine, IngredientMenuHandler
	Menu, IngredientMenu, Add, Lutein, IngredientMenuHandler
	Menu, IngredientMenu, Add, Lycopene, IngredientMenuHandler
	Menu, IngredientMenu, Add, Magnesium, IngredientMenuHandler
	Menu, IngredientMenu, Add, Malic Acid, IngredientMenuHandler
	Menu, IngredientMenu, Add, Manganese, IngredientMenuHandler
	Menu, IngredientMenu, Add, Mercury, IngredientMenuHandler
	Menu, IngredientMenu, Add, Methylsulfonylmethane (MSM), IngredientMenuHandler
	Menu, IngredientMenu, Add, Molybdenum, IngredientMenuHandler
	Menu, IngredientMenu, Add, N-Acetylcysteine, IngredientMenuHandler
	Menu, IngredientMenu, Add, Niacin, IngredientMenuHandler
	Menu, IngredientMenu, Add, PABA, IngredientMenuHandler
	Menu, IngredientMenu, Add, Pantothenic Acid, IngredientMenuHandler
	Menu, IngredientMenu, Add, Phosphorus, IngredientMenuHandler
	Menu, IngredientMenu, Add, Potassium, IngredientMenuHandler
	Menu, IngredientMenu, Add, Protein, IngredientMenuHandler
	Menu, IngredientMenu, Add, Quercetin Dihydrate, IngredientMenuHandler
	Menu, IngredientMenu, Add, Riboflavin, IngredientMenuHandler
	Menu, IngredientMenu, Add, Selenium, IngredientMenuHandler
	Menu, IngredientMenu, Add, Sodium, IngredientMenuHandler
	Menu, IngredientMenu, Add, Taurine, IngredientMenuHandler
	Menu, IngredientMenu, Add, Thiamin, IngredientMenuHandler
	Menu, IngredientMenu, Add, Total Probiotic, IngredientMenuHandler
	Menu, IngredientMenu, Add, Vitamin A, IngredientMenuHandler
	Menu, IngredientMenu, Add, Vitamin B12, IngredientMenuHandler
	Menu, IngredientMenu, Add, Vitamin B6, IngredientMenuHandler
	Menu, IngredientMenu, Add, Vitamin C, IngredientMenuHandler
	Menu, IngredientMenu, Add, Vitamin D, IngredientMenuHandler
	Menu, IngredientMenu, Add, Vitamin E, IngredientMenuHandler
	Menu, IngredientMenu, Add, Vitamin K, IngredientMenuHandler
	Menu, IngredientMenu, Add, Zinc, IngredientMenuHandler
	
	Menu, IngredientMenu, Show,
	return
	
	IngredientMenuHandler:
	
	if (A_ThisMenuItem ="Biotin") 
		Sendinput, {click 150,73}{tab}{right 21}
	else if (A_ThisMenuItem ="Cadmium") 
		Sendinput, {click 150,73}{tab}{right 23}
	else if (A_ThisMenuItem ="Caffeine") 
		Sendinput, {click 150,73}{tab}{right 24}
	else if (A_ThisMenuItem ="Calcium") 
		Sendinput, {click 150,73}{tab}{right 25}
	else if (A_ThisMenuItem ="Choline") 
		Sendinput, {click 150,73}{tab}{right 30}
	else if (A_ThisMenuItem ="Chromium") 
		Sendinput, {click 150,73}{tab}{right 32}
	else if (A_ThisMenuItem ="Coenzyme Q10") 
		Sendinput, {click 150,73}{tab}{right 34}
	else if (A_ThisMenuItem ="Copper") 
		Sendinput, {click 150,73}{tab}{right 35}
	else if (A_ThisMenuItem ="Creatine") 
		Sendinput, {click 150,73}{tab}{right 36}
	else if (A_ThisMenuItem ="Folic Acid") 
		Sendinput, {click 150,73}{tab}{right 52}
	else if (A_ThisMenuItem ="Generic Ingredient A.1") 
		Sendinput, {click 150,73}{tab}{right 57}
	else if (A_ThisMenuItem ="Generic Ingredient B.1") 
		Sendinput, {click 150,73}{tab}{right 63}
	else if (A_ThisMenuItem ="Generic Ingredient C.1") 
		Sendinput, {click 150,73}{tab}{right 69}
	else if (A_ThisMenuItem ="Glucosamine") 
		Sendinput, {click 150,73}{tab}{right 127}
	else if (A_ThisMenuItem ="Glycine") 
		Sendinput, {click 150,73}{tab}{right 131}
	else if (A_ThisMenuItem ="Ingredient Note 1") 
		Sendinput, {click 150,73}{tab}{right 139}
	else if (A_ThisMenuItem ="Inositol") 
		Sendinput, {click 150,73}{tab}{right 149}
	else if (A_ThisMenuItem ="Iron") 
		Sendinput, {click 150,73}{tab}{right 154}
	else if (A_ThisMenuItem ="Lead") 
		Sendinput, {click 150,73}{tab}{right 166}
	else if (A_ThisMenuItem ="L-Tyrosine") 
		Sendinput, {click 150,73}{tab}{right 180}
	else if (A_ThisMenuItem ="Lutein") 
		Sendinput, {click 150,73}{tab}{right 181}
	else if (A_ThisMenuItem ="Lycopene") 
		Sendinput, {click 150,73}{tab}{right 183}
	else if (A_ThisMenuItem ="Magnesium") 
		Sendinput, {click 150,73}{tab}{right 184}
	else if (A_ThisMenuItem ="Malic Acid") 
		Sendinput, {click 150,73}{tab}{right 185}
	else if (A_ThisMenuItem ="Manganese") 
		Sendinput, {click 150,73}{tab}{right 186}
	else if (A_ThisMenuItem ="Mercury") 
		Sendinput, {click 150,73}{tab}{right 188}
	else if (A_ThisMenuItem ="Methylsulfonylmethane (MSM)") 
		Sendinput, {click 150,73}{tab}{right 190}
	else if (A_ThisMenuItem ="Molybdenum") 
		Sendinput, {click 150,73}{tab}{right 194}
	else if (A_ThisMenuItem ="N-Acetylcysteine") 
		Sendinput, {click 150,73}{tab}{right 201}
	else if (A_ThisMenuItem ="Niacin") 
		Sendinput, {click 150,73}{tab}{right 203}
	else if (A_ThisMenuItem ="PABA") 
		Sendinput, {click 150,73}{tab}{right 205}
	else if (A_ThisMenuItem ="Pantothenic Acid") 
		Sendinput, {click 150,73}{tab}{right 207}
	else if (A_ThisMenuItem ="Phosphorus") 
		Sendinput, {click 150,73}{tab}{right 213}
	else if (A_ThisMenuItem ="Potassium") 
		Sendinput, {click 150,73}{tab}{right 216}
	else if (A_ThisMenuItem ="Protein") 
		Sendinput, {click 150,73}{tab}{right 219}
	else if (A_ThisMenuItem ="Quercetin Dihydrate") 
		Sendinput, {click 150,73}{tab}{right 223}
	else if (A_ThisMenuItem ="Riboflavin") 
		Sendinput, {click 150,73}{tab}{right 229}
	else if (A_ThisMenuItem ="Selenium") 
		Sendinput, {click 150,73}{tab}{right 236}
	else if (A_ThisMenuItem ="Sodium") 
		Sendinput, {click 150,73}{tab}{right 238}
	else if (A_ThisMenuItem ="Taurine") 
		Sendinput, {click 150,73}{tab}{right 246}
	else if (A_ThisMenuItem ="Thiamin") 
		Sendinput, {click 150,73}{tab}{right 249}
	else if (A_ThisMenuItem ="Total Probiotic") 
		Sendinput, {click 150,73}{tab}{right 257}
	else if (A_ThisMenuItem ="Vitamin A") 
		Sendinput, {click 150,73}{tab}{right 261}
	else if (A_ThisMenuItem ="Vitamin B12") 
		Sendinput, {click 150,73}{tab}{right 262}
	else if (A_ThisMenuItem ="Vitamin B6") 
		Sendinput, {click 150,73}{tab}{right 263}
	else if (A_ThisMenuItem ="Vitamin C") 
		Sendinput, {click 150,73}{tab}{right 264}
	else if (A_ThisMenuItem ="Vitamin D") 
		Sendinput, {click 150,73}{tab}{right 265}
	else if (A_ThisMenuItem ="Vitamin E") 
		Sendinput, {click 150,73}{tab}{right 266}
	else if (A_ThisMenuItem ="Vitamin K") 
		Sendinput, {click 150,73}{tab}{right 267}
	else if (A_ThisMenuItem ="Zinc") 
		Sendinput, {click 150,73}{tab}{right 274}
	
	else
		return
	return
	
}


VariableMenu_Creation(){
	Global
	Menu, VariableMenu, Add, Batch, VariableMenuHandler
	Menu, VariableMenu, Add, Name, VariableMenuHandler
	Menu, VariableMenu, Add, Lot, VariableMenuHandler
	Menu, VariableMenu, Add, Customer, VariableMenuHandler
	Menu, VariableMenu, Add, Description, VariableMenuHandler
	Menu, VariableMenu, Add, Iteration, VariableMenuHandler
	Menu, VariableMenu, Icon, Iteration, lib\Robot.ico 
	loop 7
		Menu, IterationMenu, Add, %A_Index%, VariableMenuHandler
	Menu, VariableMenu, Add, Iteration, :IterationMenu
	
	Menu, VariableMenu, Show,
	return
}
VariableMenu_Selection() {
	Global
	if (A_ThisMenuItem between 1 and 7)
	{
		Iteration:=A_ThisMenuItem
		return
	}
	else if (A_thismenuItem = "Batch") 
	{	
		Copy_Selection(Batch,"B4")
		Set_Batch() 
		return
	}
	else if (A_thismenuItem = "Name") 
	{
		Copy_Selection(Name,"B2")
		EnvSet, Name, %Name%
		return
	}
	else if (A_thismenuItem = "Customer") 
	{
		Copy_Selection(Cusomer,"B3")
		EnvSet, Customer, %Customer%
		return
	}
	else if (A_thismenuItem = "lot") 
	{
		Copy_Selection(lot,"B5")
		Set_Lot() 
		return
	}
	else if (A_thismenuItem = "Description") 
	{	
		Copy_Selection(Description,"B6")
		EnvSet, Description, %Description%
		return
	}
	Sleep 50
	VariableWindow()
	return 
}

DebugWindow(Text,Clear:=0,LineBreak:=0,Sleep:=0,AutoHide:=0){
	x:=ComObjActive("{DBD5A90A-A85C-11E4-B0C7-43449580656B}")
	x.DebugWindow(Text,Clear,LineBreak,Sleep,AutoHide)
}