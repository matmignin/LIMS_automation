
SpecTab_Table(){
	Global
	Try GUI, Spec_Table:destroy 
	; Iniread, VarBar_X, data.ini, Locations, SpecTable_X
	 ;Iniread, VarBar_Y, data.ini, Locations, SpecTable_Y
		CoordMode, mouse, screen
	SpecTable_Y:=Varbar_Y + 10
	SpecTable_X:=A_screenwidth-800
	Excel.Connect()
	SpecTab_GetExcelData()
		; Name:=				[]
		; Position:=		[]
		; LabelClaim:=	[] 
		; MinLimit:=		[]
		; MaxLimit:=		[]
		; Units:=				[]
		; Percision:=		[]
		; LabelName:=		[]
		; Description:=	[]
		; Requirement:=	[]
		; method:= 			[]
		; while (Xl.Range("M" . A_Index+6).Value != "") 
		; 	{
		; 		Position[A_index]:=			Xl.Range("F" . A_Index+7).Text
		; 		Name[A_index]:=					Xl.Range("K" . A_Index+7).text
		; 		LabelClaim[A_index]:=		Xl.Range("L" . A_Index+7).Text
		; 		MinLimit[A_index]:=			Xl.Range("G" . A_Index+7).Text
		; 		MaxLimit[A_index]:=			Xl.Range("H" . A_Index+7).Text
		; 		Units[A_index]:=				Xl.Range("I" . A_Index+7).Text
		; 		Percision[A_index]:=		Xl.Range("J" . A_Index+7).Text
		; 		Description[A_index]:=	Xl.Range("N" . A_Index+7).Text
		; 		Method[A_index]:=				Xl.Range("D" . A_Index+7).Text

		; 		Total_rows:=A_index
		; 		Table_Height:=A_index
		; 		if (Table_Height > 30)
		; 			Table_Height = 30
		; 	}
		Spectab_CreateGUI()

		SpecTab_ModifyColumns()


		sleep 200	
		SpecTab_ShowGUI()

	Spec_Table:
		if (A_GuiEvent = "DoubleClick" ) {	
			sendinput,{space}
			
		;Spec_Test()
		SpecTab_GetRowText()
		
		SpecTab_AutoFill()
		}
	Return
}
	
	
	SpecTab_ShowGUI(){
		global
		CoordMode, mouse, screen
		Gui, Spec_Table:Show, x%SpecTable_X% y%SpecTable_Y% w380, %Product%
		CoordMode, mouse, window
		return			
		}
Spectab_CreateGUI(){
	global
	Gui, Spec_Table:Default
	Gui Spec_Table:+LastFound +ToolWindow +Owner +AlwaysOnTop -SysMenu +MinimizeBox
	Gui, Spec_Table:Add, ListView, x0 y0 r%Table_height% w380 checked Grid gSpec_Table, `t%Product%|`t%Name%|MinLimit|MaxLimit|Units|Percision|Description|Method
	GUI, Spec_Table:Font, s12 cBlack Bold, Consolas
	loop, %Total_Rows% {
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
			Iniwrite, %Temp%, data.ini, %Product%, %Test%
		}
	}
}



	


Spec_Test(){
	global
	Gui, Spec_Table:submit,NoHide
	;Gui, Spec_Table:Default
	RowNumber = 0  ; This causes the first loop iteration to start the search at the top of the list.
	Loop
		{
			RowNumber := LV_GetNext(RowNumber)  ; Resume the search at the row after that found by the previous iteration.
			if not RowNumber  ; The above returned zero, so there are no more selected rows.
					break
			LV_GetText(Text, RowNumber)
			if Text contains Vitamin C
			Test:=RowNumber
				; MsgBox, The next selected row is #%RowNumber%, whose first field is "%Text%".
	msgbox, %Test%
	}
}
	






SpecTab_AutoFill(){ 
	global
			WinActivate, ahk_exe WFICA32.EXE
				sleep 200
				blockinput, on
			If Winactive("NuGenesis LMS - \\Remote") 
				{
					sendinput, {click, 456, 616}^a%Name%{enter}
					sleep 200
					click, 57, 719 ;click Edit Test
					Sleep 200
					WinActivate, Test Definition Editor - \\Remote
					sleep 200
				}
			If Winactive("Test Definition Editor - \\Remote") 
			{
				sleep 200
				SpecTab_TestDefinitionEditor(Description) ; the pre window
				sleep 200
					Wheel_scroll("100")
					click 240, 488 ;click resulst
					sleep 200
					WinActivate, Results Definition - \\Remote
					WinWaitActive, Results Definition,,0.25
						if errorlevel
							WinActivate, Results Definition
					; Mouse_click("edit")
					; sleep 300
					; SpecTab_ResultEditor(MinLimit,MaxLimit,Units,Percision,1)
					; return
			}
			if winactive("Results Definition - \\Remote") ;Selection window
			{	
					; WinActivate, Results Definition - \\Remote
					;Sleep 200
					WinActivate, Results Definition
					sleep 200
					send, {click 80, 66}
					sleep 200
					winactivate, Result Editor - \\Remote
					SpecTab_ResultEditor(MinLimit,MaxLimit,Units,Percision,1)
					blockinput, off
					return
			}
			If Winactive("Result Editor - \\Remote") ;the editing window
				{
					winactivate, Result Editor - \\Remote
					SpecTab_ResultEditor(MinLimit,MaxLimit,Units,Percision)
					blockinput, off
					return
			}
			else
			Blockinput,off
				return
 }

SpecTab_ModifyColumns(){
	Global
		LV_ModifyCol(1,130)
		LV_ModifyCol(2,0)			
		LV_ModifyCol(6,0)
		LV_ModifyCol(7,0)
		LV_ModifyCol(8,80)
		LV_ModifyCol(9,0)
		LV_Delete(Table_Height)
	}
	
SpecTab_GetRowText(){ 
	global
		LV_GetText(Name, 				A_EventInfo,1)
		LV_GetText(LabelClaim, 	A_EventInfo,2)
		LV_GetText(MinLimit, 		A_EventInfo,3)
		LV_GetText(MaxLimit, 		A_EventInfo,4)
		LV_GetText(Units, 			A_EventInfo,5)
		LV_GetText(Percision, 	A_EventInfo,6)
		LV_GetText(Description, A_EventInfo,7)
		LV_GetText(Method, 			A_EventInfo,8)
			Gui, Spec_Table:submit,NoHide
}
SpecTab_GetExcelData(){
			Global
		Name:=				[]
		Position:=		[]
		LabelClaim:=	[] 
		MinLimit:=		[]
		MaxLimit:=		[]
		Units:=				[]
		Percision:=		[]
		LabelName:=		[]
		Description:=	[]
		Requirement:=	[]
		method:= 			[]
		while (Xl.Range("M" . A_Index+6).Value != "") 
		{
			Position[A_index]:=			Xl.Range("F" . A_Index+7).Text
			Name[A_index]:=					Xl.Range("K" . A_Index+7).text
			LabelClaim[A_index]:=		Xl.Range("L" . A_Index+7).Text
			MinLimit[A_index]:=			Xl.Range("G" . A_Index+7).Text
			MaxLimit[A_index]:=			Xl.Range("H" . A_Index+7).Text
			Units[A_index]:=				Xl.Range("I" . A_Index+7).Text
			Percision[A_index]:=		Xl.Range("J" . A_Index+7).Text
			Description[A_index]:=	Xl.Range("N" . A_Index+7).Text
			Method[A_index]:=				Xl.Range("D" . A_Index+7).Text

			Total_rows:=A_index
			Table_Height:=A_index
			if (Table_Height > 30)
				Table_Height = 30
		}
	}




SpecTab_Create_Template:
			#ifwinactive, Edit specification - \\Remote
				WinActivate, Edit specification - \\Remote
				SpecTab_Edit_Physical()
				sleep 2000
				sendinput, {Enter}
				return
				:*:cp\:: 
					SpecTab_Edit_CoatedPhysical()
					sleep 2000
					;	sendinput, {Enter}
				return

				WinActivate, Edit specification - \\Remote
				SpecTab_Edit_Retain()
				sleep 2000
				sendinput, {Enter}
				return
				:*:cr\::
					SpecTab_Edit_CoatedRetain()
					sleep 2000
					; sendinput, {Enter}
				return

				WinActivate, Edit specification - \\Remote
				SpecTab_Edit_Micro()
				sleep 2000
				sendinput, {Enter}
				return

				WinActivate, Edit specification - \\Remote
				SpecTab_Edit_Analytical()
				sleep 2000
				sendinput, {Enter}
				return
				:*:ac\::
					sendinput, %Product%`, {shift down}I{shift Up}n {shift down}P{shift Up}rocess`, {shift down}A{shift Up}nalytical
					Sendinput, {tab 4}^a%Product%{tab}{enter}{tab}{space}{enter 2}{tab}{right}
				return 


			SpecTab_EditSampleTemplate_A(){
				global
				winactivate, Edit sample template - \\Remote
				sendinput, {click 377, 82}{home}%Product%`, {Shift down}I{Shift up}n {Shift down}P{Shift up}rocess`, {Shift down}A{Shift up}nalytical{tab 2}{Right 6}{tab}{right 6}{tab}{right}
				return
			}

			SpecTab_EditSpecification_Analytical(){
				global
				winactivate, Edit specification - \\Remote
				sendinput, {click 376, 87}{home}
				sendinput, %Product%`, {Shift down}I{Shift up}n {Shift down}P{Shift up}rocess`, {Shift down}A{Shift up}nalytical{tab 4}^a%Product%{tab}{enter}{tab}{space}{enter 2}{Tab}{right}{tab}{right 4}{tab}{right 6}{Tab 2}{Space}{tab 2}{right}{tab}{right}
				click, 340, 622 ;click okay
				winwaitactive, NuGenesis LMS - \\Remote, ,8
				if !ErrorLevel 
					click, 88, 327 ; click add sample template
				winwaitactive, Edit sample template - \\Remote,, 8
				if !errorlevel
					SpecTab_EditSampleTemplate_A()
				return
			}			


SpecTab_ResultEditor(Min_Limit,Max_Limit,The_Units,The_Percision,UseLimitsBox:=0,The_Requirements:=0) {
		Global
		If winexist("Result Editor - \\Remote")
			WinActivate, Result Editor - \\Remote
		{
			WinActivate, Result Editor - \\Remote
			If (The_Requirements:=0)
				Requirement= %Min_Limit% - %Max_Limit% %The_Units% ;normal
			sleep 250
			send, {click, 250, 140} ; click id box to orient
			ToolTip, %requirement%, 260, 160
			sleep 200
			;if (Allergen = 1)
			;send, {tab 2}%The_units%{tab}^a%The_Percision%{tab 2}{Space}{Tab 3}{space}{Tab 3}^a%Max_Limit%{tab 5}^a
			;else
			; if (uselimitsbox := 0)
			; send, {tab 2}%The_units%{tab}^a%The_Percision%{tab 7}^a%Min_Limit%{tab}^a%Max_Limit%{tab 5}^a ;normal
			send, {tab 2}%The_units%{tab}^a%The_Percision%{tab 5}
			sleep 200
			If (UseLimitsBox != 0)
				send, {space}
			sleep 200
			send, {tab 2}^a%Min_Limit%{tab}^a%Max_Limit%{tab 5}^a ;normal
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
			WinWaitClose, Results Definition,, 6
				if errorlevel
					tooltip,
			tooltip,		
		}
}

SpecTab_TestDefinitionEditor(The_Description) {
	Global
	if The_description is space
		{
				Wheel_scroll("100")
				click 240, 488 ;click resulst
		return
		}
	else	
	{
		WinActivate, Test Definition Editor - \\Remote 
		DescriptionRaw:=The_Description
		Trimmed_Description:=RTrim(DescriptionRaw, "`r`n")
		Click, 187, 200 ;Orient_SpecTab_TestDefinitionEditor
		if Name contains Vitamin C
			send, {Home}{Delete 12}%Trimmed_Description%
		else
			Send,^a%Trimmed_Description%
		sleep 300
	}
return
	;send, {shift down}{Tab 15}{Shift up}{enter}
}

SpecTab_Edit_Physical(){
	Global
	winactivate, Edit specification - \\Remote
	sendinput, {click 376, 87}{home}
	send,%Product%`, {shift down}I{shift Up}n {shift down}P{shift Up}rocess`, {shift down}P{shift Up}hysical{tab 3}^a{backspace}
	send, {tab}^a%Product%{tab 2}
	Sleep 200
	send,{Space}
	sleep 200
	winwaitactive, Products List - \\Remote, , 8
	if !errorlevel
		sleep 300
	send, {enter 2}
	sleep 200
	send,{tab}
	sleep 200
	send,{right} 
	sleep 500
	click, 340, 622 ;click okay
	winwaitactive, NuGenesis LMS - \\Remote, ,8
	if !errorlevel 
		sleep 300
	click, 70, 518 ;edit sample method 
	sleep 499
	winwaitactive, Edit sample template - \\Remote,,4
	if !errorlevel
		sleep 300
	sendinput, {tab}{delete 4}%Product%{enter}
	return
}
SpecTab_Edit_CoatedRetain(){
	global
	winactivate, Edit specification - \\Remote
	sendinput, {click 376, 87}{home}
	send,%Product%`, {shift down}C{shift Up}oated`, {shift down}R{shift Up}etain{tab 4}^a%Product%{tab}{enter}{tab}{space}{Return 2}
	sleep 400
	send,{tab}{right} 
	sleep 200
	send,{tab}{right}{tab 3}{left 4}
	winwaitactive, NuGenesis LMS - \\Remote, ,8
	if !errorlevel 
		click, 70, 515 ;click edit sample template
	winwaitactive, Edit sample template - \\Remote,, 5
	if !errorlevel
		sendinput, {tab}{delete 4}%Product%`, {Shift down}C{shift up}oated{tab 3}{tab 4}
	return
}
SpecTab_Edit_CoatedPhysical(){
	global
	winactivate, Edit specification - \\Remote
	sendinput, {click 376, 87}{home}
	send,%Product%`, {shift down}C{shift Up}oated`, {shift down}P{shift Up}hysical{tab 4}^a%Product%{tab}{enter}{tab}{space}{Return 2}
	sleep 400
	send,{tab}{right} 
	sleep 200
	send,{tab}{right}{tab}{left 4}
	winwaitactive, NuGenesis LMS - \\Remote, ,8
	if !errorlevel 
		click, 70, 515 ;click edit sample template
	winwaitactive, Edit sample template - \\Remote,, 5
	if !errorlevel
		sendinput, {tab}{delete 16%Product%`, {Shift down}C{shift up}oated{tab 3}{left 4}
	return
}		
SpecTab_Edit_Retain(){
	Global
	winactivate, Edit specification - \\Remote
	sendinput, {click 376, 87}{home}
	send,%Product%`, {shift down}I{shift Up}n {shift down}P{shift Up}rocess`, {shift down}R{shift Up}etain{tab 4}^a%Product%{tab}{enter}{tab}{space}{Return 2}
	sleep 200
	send,{tab}{right} 
	sleep 400
	send,{tab}{right}
	sleep 1500
	WinWaitactive, Edit specification - \\Remote,, 1
	if !errorlevel
		click, 340, 622 ;click okay
	winwaitactive, NuGenesis LMS - \\Remote, ,8
	if !errorlevel 
		sleep 300
	click, 70, 518 ;click edit sample template
	winwaitactive, Edit sample template - \\Remote,,5
	if !errorlevel
		sleep 300
	sendinput, {tab}{delete 4}%Product%{enter}
	return
}
SpecTab_Edit_Analytical() {
	Global
	If WinActive("Edit sample template - \\Remote")
		SpecTab_EditSampleTemplate_A()
	else If winexist("Edit specification - \\Remote")
	{
		winactivate,
		SpecTab_EditSpecification_Analytical()
	}
	return
}

SpecTab_Edit_Micro(){
	Global
	winactivate, Edit specification - \\Remote
	sendinput, {click 376, 87}{home}
	send,%Product%`, {shift down}F{shift Up}inished`, {shift down}M{shift Up}icro{tab 4}^a%Product%{tab 2}
	Sleep 200
	send,{Space}
	sleep 200
	winwaitactive, Products List - \\Remote, ,5
	send, {enter 2}
	sleep 200
	send,{tab}
	sleep 200
	send,{right} {tab}{left 2}
	winwaitactive, NuGenesis LMS - \\Remote, ,8
	if !errorlevel 
		sleep 300
	click, 70, 518 ;click edit sample template
	winwaitactive, Edit sample template - \\Remote,, 5
	if !errorlevel
		sleep 300
	sendinput, {tab}{delete 4}%Product%{enter}
	return
}

SpecTab_InsertDescription(){
	Global
	DescriptionRaw:=Description
	Description:=RTrim(DescriptionRaw, "`r`n")
	Send,^a%Description%
	Return
} 

SpecTab_HM_ReportOnly() {
	click 125,120 ;click 1st row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,140 ;click 2nd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,180 ;click 3rd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,200 ;click 4th row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	click 390, 659	;click okay
	return
}

SpecTab_HM_USP() {
	click 125,120 ;click 1st row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}15{tab 5}NMT 15 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,140 ;click 2nd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}5{tab 5}NMT 5 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,180 ;click 3rd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}5{tab 5}NMT 5 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,200 ;click 4th row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}15{tab 5}NMT 15 mcg/day
	click 390, 659	;click okay
	return
}

SpecTab_HM_Canada() {
	click 125,120 ;click 2nd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}9.8{tab 5}NMT 9.8 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,140 ;click 2nd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}9.8{tab 5}NMT 9.8 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,180 ;click 3rd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}6.3{tab 5}NMT 6.3 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,200 ;click 4th row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}20.3{tab 5}NMT 20.3 mcg/day
	click 390, 659	;click okay
	return
}
SpecTab_HM_Prop65() {
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

			#IfWinActive,
	Spec_TableGuiClose:
		GUI, Spec_Table:destroy
	return