return
class SpecTab {
	
Table(){
	Global
	Try GUI, Spec_Table:destroy
  CoordMode, mouse, Window
;  CoordMode, , Screen
 ifwinnotactive, ahk_exe WFICA32.EXE 
	WinActivate, ahk_exe WFICA32.EXE
 WinGetPos, LMS_X, LMS_Y, LMS_w, LMS_h, A
 
	; Iniread, SpecTable_X, data.ini, Locations, SpecTable_X
	; Iniread, SpecTable_Y, data.ini, Locations, SpecTable_Y
		CoordMode, mouse, window
	SpecTable_X:=LMS_w+LMS_X-50
	SpecTable_Y:=LMS_Y+100
	Table_height=10
		CoordMode, mouse, screen
	Excel.Connect()
	SpecTab.GetExcelData()
		SpecTab.CreateGUI()
		SpecTab.ModifyColumns()
		SpecTab.ShowGUI()
		sleep 100
	return
}


	ShowGUI(){
		global
		CoordMode, mouse, screen
		ScreenEdge_X:=A_ScreenWidth-350
		ScreenEdge_Y:=A_Screenheight-150
		try Gui, Spec_Table:Show, x%SpecTable_X% y%SpecTable_Y% w380, %Product% Spec Table
		catch Gui, Spec_Table:Show, x%ScreenEdge_X% y%ScreenEdge_Y% w380, %Product% Spec Table
		CoordMode, mouse, window
		return
		}
		
CreateGUI(){
	global
	Gui, Spec_Table:Default
	Gui Spec_Table:+LastFound +ToolWindow +Owner +AlwaysOnTop -SysMenu +MinimizeBox
	Gui, Spec_Table:Add, ListView, x0 y0 r%Table_height% w380 checked Grid gSpec_Table, `t%Product%|`t%Name%|MinLimit|MaxLimit|Units|Percision|Description|Method
	GUI, Spec_Table:Font, s12 cBlack Bold, Consolas
	loop, %Total_Rows%{
		if Position[A_index] =""
		{
			Table_height:=table_height+1
			Total_rows:=total_rows-1
			continue
		}
  if Method[A_index] =""
  {
   Total_rows:=total_rows - 1
   continue
  }
		else
		{
			LV_add(,""Name[A_index],LabelClaim[A_index], MinLimit[A_index],MaxLimit[A_index],Units[A_index],Percision[A_index],Description[A_index],Method[A_index])
			temp:=LabelClaim[A_index] "|" MinLimit[A_index]"|" MaxLimit[A_index]"|" Units[A_index]"|" Percision[A_index] "|" Description[A_index] "|" Method[A_index]
			Test:= Name[A_index]
			; Iniwrite, %Temp%, data.ini, %Product%, %Test%
		}
	}
}




Methods() {
	global
	WinActivate, Select methods tests - \\Remote
	click, 229, 72,2
	Send, ^a
	Loop, Read, Methods.ini
	{
	If A_Index = 1
		Continue
	Method := StrSplit(A_LoopReadLine, "=")
	; MethodGroup := StrSplit(A_LoopReadLine, "|") ;for a 2nd split
	Selection:= % Method[1]
	; Group:= % MethodGroup[2] ;for a second split
	Menu, Methodmenu, add, %Selection%, Methods
	}
	Menu, MethodMenu, Show,
	return
}



CopySpecTemplate(){
	global 
	sleep 100
	if WinActive("NuGenesis LMS - \\Remote"){
		; click
		; Send, ^c
		; clipwait,1.5 ; Tooltip, %Clipboard%
		clip("Department")
		sleep 200
		TT(department)
		Breaking.Point()
	}
	If !errorlevel
		click 102, 289
	sleep 400
	Breaking.Point()
	sleep 200
	If (Department = "Analytical")
		SpecTab.Edit_Analytical()
	else If (Department = "Physical (Coated)")
		SpecTab.Edit_CoatedPhysical()
	else If (Department = "Physical")
		SpecTab.Edit_Physical()
	else If (Department = "CTPhysical")
		SpecTab.Edit_CoatedPhysical()
	else if (Department = "Micro")
		SpecTab.Edit_Micro()
	else If (Department = "Retain (Coated)")
		SpecTab.Edit_CoatedRetain()
	else If (Department = "Retain")
		SpecTab.Edit_Retain()
	else If (Department = "CTRetain")
		SpecTab.Edit_CoatedRetain()
	else If Department Contains Analytical
		SpecTab.Edit_Analytical()
	else If Department contains Physical (Coated)
		SpecTab.Edit_CoatedPhysical()
	else If Department contains Physical
		SpecTab.Edit_Physical()
	else If Department contains CTPhysical
		SpecTab.Edit_CoatedPhysical()
	else if Department contains Micro
		SpecTab.Edit_Micro()
	else If Department Contains Retain (Coated)
		SpecTab.Edit_CoatedRetain()
	else If Department Contains Retain
		SpecTab.Edit_Retain()
	else If Department Contains CTRetain
		SpecTab.Edit_CoatedRetain()
	sleep 500
	;excel.NextSheet()
	
	;TT(Product)
	return
 }
 
 

CopySpecs(){
	global
	WinActivate, NuGenesis LMS - \\Remote
	; BlockInput, on
	clipboard:=
	click 57, 715 ; edit Test
	; click 57, 750 ; edit results
	winwaitactive, Test Definition Editor - \\Remote,,0.25
	if errorlevel
		WinActivate, Test Definition Editor - \\Remote
	; sleep 400
	click 418, 202
	Send, ^a^c
	Clipwait,1
	Description:=Clipboard
	sleep 200
	MouseClick, left, 464, 532,2,0
	sleep 150
	click.TestDefinitionEditor_Results()
	WinActivate, Results Definition - \\Remote
	WinWaitActive, Results Definition,,0.25
	if errorlevel
		WinActivate, Results Definition
	WinActivate, Results Definition - \\Remote
	click 282, 141 ; click row
	sleep 80
	clipboard:=
	sleep 20
	Send, ^c
	clipwait, 1
	if ErrorLevel
		msgbox, yo
	; sendlevel,0
	sleep 200
	Send,{esc}
	ParsedSpecs:=[]
	Loop, parse, Clipboard, `t
		ParsedSpecs.insert(A_LoopField)
	MinLimit:=Parsedspecs[17]
	MaxLimit:=Parsedspecs[18]
	Percision:=Parsedspecs[19]
	FullRequirements:=Parsedspecs[20]
	Units:=Parsedspecs[21]
	sleep 200
	; blockinput off
	Send, {esc}
	copypastetoggle=1
	exit
	Return
}

  PasteSpecs(){
	Global
	WinActivate, NuGenesis LMS - \\Remote
	click 57, 715 ; edit Test
	winwaitactive, Test Definition Editor - \\Remote,,0.25
		if errorlevel
			WinActivate, Test Definition Editor - \\Remote
	sleep 400
	click 418, 202
	SpecTab.TestDefinitionEditor(Description) ; the pre window
	sleep 200
	MouseClick, left, 464, 532,2,0
	sleep 200
	click 232, 244 ;click resulst
	sleep 200
	WinActivate, Results Definition - \\Remote
	WinWaitActive, Results Definition,,0.25
		if errorlevel
			WinActivate, Results Definition
	; Mouse_Click("edit") ;trying to eliminate mouseclick funct
	clk(84, 65)
	winwaitactive, Result Editor - \\Remote,,0.25
		if errorlevel
			WinActivate, Result Editor - \\Remote
	sleep 400
	Breaking.Point()
	SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,1,FullRequirements)
	CopyPasteToggle=0
	exit
	return
}

	AddMethod(MethodID){
	WinActivate, NuGenesis LMS - \\Remote
	click 67, 562 ; Add Methods
	winwaitactive, Select methods tests - \\Remote,,0.25
	click 227, 69. 2 ; method search bar
	SendInput, %MethodID%{enter}^{a}{click 506, 337}{click 851, 656} ; add test and hit okay
	sleep 200
	WinActivate, NuGenesis LMS - \\Remote
	click 397, 591 ; click attrobutes
	return
}


AutoFill(){
	global
	WinActivate, ahk_exe WFICA32.EXE
		sleep 200
		;blockinput, on
	If Winactive("NuGenesis LMS - \\Remote")
		{
			;SendInput,{click, 565, 692}^a%Name%{enter}{click r, 270, 809}+{tab 2}{enter}
			sleep 200
			Breaking.Point()
			click, 57, 719 ;click Edit Test
			Sleep 200
			Breaking.Point()
			WinActivate, Test Definition Editor - \\Remote
			sleep 200
		}
	If Winactive("Test Definition Editor - \\Remote")
	{
		sleep 200
		Breaking.Point()
		SpecTab.TestDefinitionEditor(Description) ; the pre window
		sleep 200
		MouseClick, left, 464, 532,2,0
			; click 236, 246
			Breaking.Point()
			click.TestDefinitionEditor_Results()
			sleep 200
			WinActivate, Results Definition - \\Remote

	}
	if winactive("Results Definition - \\Remote") ;Selection window
	{

			WinActivate, Results Definition - \\Remote
			If Method contains ICP-MS 231
				Send,{click 217, 141}
			Send,{click 80, 66} ;click edit
			sleep 200
			Breaking.Point()
			winwaitactive, Result Editor - \\Remote,,0.5
				if !errorlevel
			SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,1,1)
			blockinput, off
			Breaking.Point()
			sleep 400
	}
	If Winactive("Result Editor - \\Remote") ;the editing window
		{
		winactivate, Result Editor - \\Remote
		Breaking.Point()
			SpecTab.ResultEditor(MinLimit,MaxLimit,Units,Percision,,1)
			blockinput, off
			Breaking.Point()
			return
	}
	else
	Blockinput,off
		return
}



ModifyColumns(){
	Global
	LV_ModifyCol(1,130)
	LV_ModifyCol(2,0)
	LV_ModifyCol(6,0)
	LV_ModifyCol(7,0)
	LV_ModifyCol(8,80)
	LV_ModifyCol(9,0)
	LV_Delete(Table_Height)
}

GetRowText(){
	global
	LV_GetText(Name, 				A_EventInfo,1)
	LV_GetText(LabelClaim, 		A_EventInfo,2)
	LV_GetText(MinLimit, 		A_EventInfo,3)
	LV_GetText(MaxLimit, 		A_EventInfo,4)
	LV_GetText(Units, 			A_EventInfo,5)
	LV_GetText(Percision, 		A_EventInfo,6)
	LV_GetText(Description, 	A_EventInfo,7)
	LV_GetText(Method, 			A_EventInfo,8)
	Gui, Spec_Table:submit,NoHide
}
GetExcelData(){
	Global
	Name:=			[]
	Position:=		[]
	LabelClaim:=	[]
	MinLimit:=		[]
	MaxLimit:=		[]
	Units:=			[]
	Percision:=		[]
	LabelName:=		[]
	Description:=	[]
	Requirement:=	[]
	method:= 		[]
	; If (XL.Range("A1").Value!=1){
	; 	while (Xl.Range("M" . A_Index+6).Value != ""){
	; 		Position[A_index]:=				Xl.Range("F" . A_Index+7).Text
	; 		Name[A_index]:=					Xl.Range("K" . A_Index+7).text
	; 		LabelClaim[A_index]:=			Xl.Range("L" . A_Index+7).Text
	; 		MinLimit[A_index]:=				Xl.Range("G" . A_Index+7).Text
	; 		MaxLimit[A_index]:=				Xl.Range("H" . A_Index+7).Text
	; 		Units[A_index]:=					Xl.Range("I" . A_Index+7).Text
	; 		Percision[A_index]:=				Xl.Range("J" . A_Index+7).Text
	; 		Description[A_index]:=			Xl.Range("N" . A_Index+7).Text
	; 		Method[A_index]:=					Xl.Range("D" . A_Index+7).Text
	; 		Total_rows:=A_index
	; 		Table_Height:=A_index
	; 		if (Table_Height > 30)
	; 			Table_Height = 30
	; 	}
	; }
	; else {
		while (Xl.Range("AK" . A_Index+6).Value != ""){
			Position[A_index]:=				Xl.Range("AD" . A_Index+7).Text
			Name[A_index]:=					Xl.Range("AI" . A_Index+7).text
			LabelClaim[A_index]:=			Xl.Range("AJ" . A_Index+7).Text
			MinLimit[A_index]:=				Xl.Range("AE" . A_Index+7).Text
			MaxLimit[A_index]:=				Xl.Range("AF" . A_Index+7).Text
			Units[A_index]:=					Xl.Range("AG" . A_Index+7).Text
			Percision[A_index]:=				Xl.Range("AH" . A_Index+7).Text
			Description[A_index]:=			Xl.Range("AL" . A_Index+7).Text
			Method[A_index]:=					Xl.Range("AB" . A_Index+7).Text
			Total_rows:=A_index
			Table_Height:=A_index
			if (Table_Height > 30)
				Table_Height = 30
		}
	; }
	
	}









EditSampleTemplate_A(){
	global
	winactivate, Edit sample template - \\Remote
	Breaking.Point()
	SendInput,{click 377, 82}{home}%Product%`,{space}{Shift down}I{Shift up}n{space}{Shift down}P{Shift up}rocess`,{space}{Shift down}A{Shift up}nalytical{tab 2}{Right 6}{tab}{right 6}{tab}{right}{enter}
	WinWaitActive, NuGenesis LMS - \\Remote,,8
	Breaking.Point()
	if !errorlevel
		click, 73, 562
	return
}

EditSpecification_Analytical(){
	global
	winactivate, Edit specification - \\Remote
	SendInput,{click 376, 87}{home}
	SendInput, %Product%`,{space}{Shift down}I{Shift up}n{space}{Shift down}P{Shift up}rocess`,{space}{Shift down}A{Shift up}nalytical{tab 4}^a%Product%{tab}{enter}{tab}{space}{enter 2}{Tab}{right}{tab}{right 4}{tab}
	Breaking.Point()
	Send,{right 6}{Tab 2}{Space}{tab 2}{right}{tab}{right}
	Breaking.Point()
	click, 340, 622 ;click okay
	Breaking.Point()
	winwaitactive, NuGenesis LMS - \\Remote, ,8
	if !ErrorLevel
		click, 88, 327 ; click add sample template
	Breaking.Point()
	winwaitactive, Edit sample template - \\Remote,, 8
	if !errorlevel
		SpecTab.EditSampleTemplate_A()
	return
}


ResultEditor(Min_Limit,Max_Limit,The_Units,The_Percision,UseLimitsBox:=0,CreateRequirements:=1){
	Global
	; TT(CreateRequirements)
		; normal
	sleep 200
	click, 250, 140 ; click id box to orient
	sleep 200
	if (Uselimitsbox := 0)
		Send,{tab 2}%The_units%{tab}^{a}%The_Percision%{tab 7}^{a}%Min_Limit%{tab}^a%Max_Limit%{tab 5}^a ;normal
									Send,{tab 2}%The_units%{tab}^{a}%The_Percision%{tab 5}
	sleep 200
	If (UseLimitsBox:=1)
		Send,{space}
	sleep 200
		Send,{tab 2}^a%Min_Limit%{tab}^a%Max_Limit%{tab 5}^a ;normal
	if (Max_limit = ""){
		SendInput, NLT %Min_Limit% %The_Units%
		exit
		}
	else if (Min_limit = "<"){
		SendInput, %min_limit%%Max_Limit% %The_Units%
		exit
		}
	else if (Min_limit = ""){
		SendInput, NMT %Max_Limit% %The_Units%
		Exit
		}
	Else
		{
			If CreateRequirements=1
				SendInput, %Min_Limit% - %Max_Limit% %The_Units%
			else if CreateRequirements!=1)
				SendInput, %CreateRequirements%
		; SendInput, %Requirement%
		}
	sleep 100
	Breaking.Point()
	click 350, 660 ; click okay
	; WinWaitClose, Results Definition,, 6
		; if errorlevel
			return
}

TestDefinitionEditor(The_Description){
	Global
	if The_description is space
		{
		MouseClick, left, 464, 532,2,0
		Breaking.Point()
		click.TestDefinitionEditor_Results()
		return
		}
	else
	{
		WinActivate, Test Definition Editor - \\Remote
		DescriptionRaw:=The_Description
		Trimmed_Description:=RTrim(DescriptionRaw, "`r`n")
		Breaking.Point()
		Click, 187, 200 ;Orient_SpecTab.TestDefinitionEditor
		if Name contains Vitamin C
			Send,{Home}{Delete 12}%Trimmed_Description%
		else
			Send,^a%Trimmed_Description%
			Breaking.Point()
		sleep 300
	}
	return
	;Send,{shift down}{Tab 15}{Shift up}{enter}
}

Edit_Physical(){
	Global
	winactivate, Edit specification - \\Remote
	SendInput,{click 376, 87}{home}
	Send,%Product%`,{space}{shift down}I{shift Up}n{shift down}{space}P{shift Up}rocess`,{space}{shift down}P{shift Up}hysical{tab 3}^a{backspace}
	Breaking.Point()
	Send,{tab}^a%Product%{tab 2}
	Breaking.Point()
	Sleep 200
	Send,{Space}
	sleep 200
	Breaking.Point()
	winwaitactive, Products List - \\Remote, , 8
	if !errorlevel
		sleep 300
	Send,{enter 2}
	sleep 200
	Breaking.Point()
	Send,{tab}
	sleep 200
	Send,{right}
	sleep 500
	Breaking.Point()
	click, 340, 622 ;click okay
	winwaitactive, NuGenesis LMS - \\Remote, ,8
	if !errorlevel
		sleep 300
		Breaking.Point()
	click, 70, 518 ;edit sample method
	sleep 499
	winwaitactive, Edit sample template - \\Remote,,4
	if !errorlevel
		sleep 300
	SendInput,{tab}{delete 4}%Product%{enter}
	return
}

Edit_CoatedRetain(){
	global
	winactivate, Edit specification - \\Remote
	SendInput,{click 376, 87}{home}
	Breaking.Point()
	Send,%Product%`,{space}{shift down}C{shift Up}oated`,{space}{shift down}R{shift Up}etain{tab 4}^a%Product%{tab}{enter}{tab}{space}{Return 2}
	sleep 400
	Send,{tab}{right}
	sleep 200
	Breaking.Point()
	Send,{tab}{right}{tab 3} ;{left 4}
	sleep 200
	Breaking.Point()
	click, 340, 622 ;click okay
	winwaitactive, NuGenesis LMS - \\Remote, ,12
	if !errorlevel
		click.EditSampleTemplate()
		Breaking.Point()
		SendInput,{tab}^{a}%Product%`,{space}{Shift down}C{shift up}oated`,{space}{shift down}R{shift Up}etain
	return
}

Edit_CoatedPhysical(){
	global
	winactivate, Edit specification - \\Remote
	SendInput,{click 376, 87}{home}
	Send,%Product%`,{space}{shift down}C{shift Up}oated`,{space}{shift down}P{shift Up}hysical{tab 4}^a%Product%{tab}{enter}{tab}{space}{Return 2}
	sleep 400
	Send,{tab}{right}
	Breaking.Point()
	sleep 200
	Send,{tab}{right}{tab} ;{left 4}
	Breaking.Point()
	sleep 200
	Breaking.Point()
	click, 340, 622 ;click okay
	winwaitactive, NuGenesis LMS - \\Remote, ,12
	if !errorlevel
	click.EditSampleTemplate()
	Breaking.Point()
		SendInput,{tab}^{a}%Product%`,{space}{Shift down}C{shift up}oated`,{space}{shift down}P{shift Up}hysical
	return
}

Edit_Retain(){
	Global
	winactivate, Edit specification - \\Remote
	SendInput,{click 376, 87}{home}
	Send,%Product%`,{space}{shift down}I{shift Up}n{space}{shift down}P{shift Up}rocess`,{space}{shift down}R{shift Up}etain{tab 4}^a%Product%{tab}{enter}{tab}{space}{Return 2}
	Breaking.Point()
	sleep 200
	Send,{tab}{right}
	sleep 400
	Send,{tab}{right}
	sleep 1500
	Breaking.Point()
	WinWaitactive, Edit specification - \\Remote,, 1
	if !errorlevel
		click, 340, 622 ;click okay
		Breaking.Point()
	winwaitactive, NuGenesis LMS - \\Remote, ,4
	if !errorlevel
		sleep 300
		Breaking.Point()
	click.EditSampleTemplate()
		sleep 300
		Breaking.Point()
	SendInput,{tab}{delete 4}%Product%{enter}
	return
	}
Edit_Analytical(){
	Global
	Breaking.Point()
	If WinActive("Edit sample template - \\Remote")
		SpecTab.EditSampleTemplate_A()
	else If winexist("Edit specification - \\Remote")
	{
		winactivate,
		Breaking.Point()
		SpecTab.EditSpecification_Analytical()
	}
	return
}

Edit_Micro(){
	Global
	winactivate, Edit specification - \\Remote
	SendInput,{click 376, 87}{home}
	Send,%Product%`,{space}{shift down}F{shift Up}inished`,{space}{shift down}M{shift Up}icro{tab 4}^a%Product%{tab 2}
	Sleep 200
	Send,{Space}
	sleep 200
	winwaitactive, Products List - \\Remote, ,2
	Send,{enter 2}
	sleep 200
	Send,{tab}
	sleep 200
	Breaking.Point()
	Send,{right}{tab}{left 2}{enter}
	winwaitactive, NuGenesis LMS - \\Remote, ,4
	if !errorlevel
		sleep 300
		Breaking.Point()
	click.EditSampleTemplate()
		sleep 300
	SendInput,{tab}{delete 4}%Product%{enter}
	return
}

InsertDescription(){
	Global
	DescriptionRaw:=Description
	Description:=RTrim(DescriptionRaw, "`r`n")
	Send,^a%Description%
	Return
}

HM_ReportOnly(){
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor - \\Remote,,4
	SendInput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor - \\Remote,,4
	SendInput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor - \\Remote,,4
	SendInput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor - \\Remote,,4
	SendInput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	click 390, 659	;click okay
	return
}

HM_USP(){
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor - \\Remote,,4
	SendInput,{tab 5}mcg/day{tab 7}{space}{tab 3}15{tab 5}NMT 15 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	; click 125,150 ;click 2nd row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor - \\Remote,,4
	SendInput,{tab 5}mcg/day{tab 7}{space}{tab 3}5{tab 5}NMT 5 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	; click 125,190 ;click 3rd row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor - \\Remote,,4
	SendInput,{tab 5}mcg/day{tab 7}{space}{tab 3}5{tab 5}NMT 5 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	; click 125,210 ;click 4th row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor - \\Remote,,4
	SendInput,{tab 5}mcg/day{tab 7}{space}{tab 3}15{tab 5}NMT 15 mcg/day
	click 390, 659	;click okay
	return
}

HM_Canada(){
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor - \\Remote,,4
	SendInput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab}9.8{tab 5}NMT 9.8 mcg/day
	click 390, 659	;click okay
	Breaking.Point()
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	Breaking.Point()
	winwaitactive, Result Editor - \\Remote,,4
	SendInput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab}9.8{tab 5}NMT 9.8 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	Breaking.Point()
	winwaitactive, Result Editor - \\Remote,,4
	SendInput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab}6.3{tab 5}NMT 6.3 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	Breaking.Point()
	winwaitactive, Result Editor - \\Remote,,4
	SendInput,{tab 5}mcg/day{tab 7}{space}{tab 2}0{tab}20.3{tab 5}NMT 20.3 mcg/day
	click 390, 659	;click okay
	return
}

HM_Prop65(){
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winactivate, Result Editor - \\Remote
	winwaitactive, Result Editor - \\Remote,,4
	SendInput,{tab 12}{space}{tab 2}^{a}
	;SendInput,{tab 5}mcg/day{tab 7}{tab 2}^a
	SendInput, 0{tab}^{a}
	sleep 100
	SendInput, 9.999{tab 5}^a<10 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	winactivate, Result Definition - \\Remote
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor - \\Remote,,4
	SendInput,{tab 12}{space}{tab 2}^a
	;SendInput,{tab 5}mcg/day{tab 7}{tab 2}^a
	SendInput, 0{tab}^a
	sleep 100
	SendInput, 0.499{tab 5}^a<0.5 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	winactivate, Result Definition - \\Remote
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor - \\Remote,,4
	SendInput,{tab 12}{space}{tab 2}^a
	;SendInput,{tab 5}mcg/day{tab 7}{tab 2}^a
	SendInput, 0{tab}^a
	sleep 100
	SendInput, 4.099{tab 5}^a<4.1 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	winactivate, Result Definition - \\Remote
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	Breaking.Point()
	winwaitactive, Result Editor - \\Remote,,4
	SendInput,{tab 12}{space}{tab 2}^a
	;SendInput,{tab 5}mcg/day{tab 7}{tab 2}^a
	SendInput, 0{tab}^a
	sleep 100
	SendInput, 0.299{tab 5}^a<0.3 mcg/day
	click 390, 659	;click okay
	return
}


}


Methods:
	sleep 200
	InputVar:=A_ThisMenuItem
	IniRead,vOutput, Methods.ini, Methods, %InputVar%
	SendInput, %vOutput%{enter}
	sleep 300
	click 506, 341
	SpecTab.Methods()
	return

Spec_Table:
	if (A_GuiEvent = "DoubleClick" ){
		SendInput,{space}
	SpecTab.GetRowText()
	SpecTab.AutoFill()
	}
	Return

Spec_TableGuiClose:
	GUI, Spec_Table:destroy
	coordmode, mouse, window
	return

; ;SpecTab.Create_Template:
; #ifwinactive, Edit specification - \\Remote
; 	WinActivate, Edit specification - \\Remote
; 	SpecTab.Edit_Physical()
; 	sleep 2000
; 	SendInput,{Enter}
; return
; 	SpecTab.Edit_CoatedPhysical()
; 	sleep 2000
; return

; 	WinActivate, Edit specification - \\Remote
; 	SpecTab.Edit_Retain()
; 	sleep 2000
; 	SendInput,{Enter}
; return

; 	SpecTab.Edit_CoatedRetain()
; 	sleep 2000
; 	; SendInput,{Enter}
; return

; 	WinActivate, Edit specification - \\Remote
; 	SpecTab.Edit_Micro()
; 	sleep 2000
; 	SendInput,{Enter}
; return

; 	WinActivate, Edit specification - \\Remote
; 	SpecTab.Edit_Analytical()
; 	sleep 2000
; 	SendInput,{Enter}
; return
; 	SendInput, %Product%`,{space}{shift down}I{shift Up}n{space}{shift down}P{shift Up}rocess`,{space}{shift down}A{shift Up}nalytical
; 	SendInput,{tab 4}^a%Product%{tab}{enter}{tab}{space}{enter 2}{tab}{right}
; return


