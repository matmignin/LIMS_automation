
SpecTab_Table(){
	Global
	Try GUI, Spec_Table:destroy 
   CoordMode, mouse, Window
  ;  CoordMode, , Screen
	WinActivate, ahk_exe WFICA32.EXE
  WinGetPos, LMS_X, LMS_Y, LMS_w, LMS_h, A
	; Iniread, SpecTable_X, data.ini, Locations, SpecTable_X
	; Iniread, SpecTable_Y, data.ini, Locations, SpecTable_Y
		; CoordMode, mouse, window
		; CoordMode, mouse, screen
	SpecTable_X:=LMS_w+LMS_X
	SpecTable_Y:=LMS_Y+100
	Excel.Connect()
	SpecTab_GetExcelData()
		Spectab_CreateGUI()

		SpecTab_ModifyColumns()

		SpecTab_ShowGUI()

		sleep 200	

	return
	
	
	Spec_Table:
		if (A_GuiEvent = "DoubleClick" ) {	
			sendinput,{space}
			
		; Spec_Test()
		SpecTab_GetRowText()
		
		SpecTab_AutoFill()
		}
	Return
}
	
	
	SpecTab_ShowGUI(){
		global
		; CoordMode, mouse, screen
		CoordMode, mouse, window
		Gui, Spec_Table:Show, x%SpecTable_X% y%SpecTable_Y% w380, %Product%
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








SpecTab_CopySpecTemplate(){
  global
  ;click 728, 191
  department:= ;Clip()
  Clipboard:=
  sleep 200
  ; WinActivate, NuGenesis LMS - \\Remote
	; click
	; clip()
  send, ^c
  sleep 200
  ; clipwait; Tooltip, %Clipboard%
	sleep 100
	LMS.CheckDepartment()
  sleep 400
  tooltip(department)
  click.CopySpecTemplate()
If Department Contains Analytical
  SpecTab_Edit_Analytical()
If Department contains Physical
	SpecTab_Edit_Physical()
If Department contains CTPhysical
	SpecTab_Edit_CoatedPhysical()
if Department contains Micro
  SpecTab_Edit_Micro()
If Department Contains Retain
  SpecTab_Edit_Retain()
If Department Contains CTRetain
  SpecTab_Edit_CoatedRetain()
sleep 500
;excel.NextSheet()
;Tooltip(Product)
  return
  }
Class SpecTab_TestSpecs{

  Copy(){
    global
    WinActivate, NuGenesis LMS - \\Remote
		BlockInput, on
      click 57, 715 ; edit Test
    ; click 57, 750 ; edit results
    winwaitactive, Test Definition Editor - \\Remote
      click 418, 202
      send, ^a^c
      sleep 200
      Description:=Clipboard
       sleep 200
			Wheel_scroll("100")
			sleep 200
			click.TestDefinitionEditor_Results()
			WinActivate, Results Definition - \\Remote
			WinWaitActive, Results Definition,,0.25
				if errorlevel
					WinActivate, Results Definition
      WinActivate, Results Definition - \\Remote
      click 282, 141 ; click row
        sleep 100
    send, ^c
    sleep 200
    if ErrorLevel
      msgbox, yo
    ; sendlevel,0
    sleep 200
    send, {esc}
    ParsedSpecs:=[]
    Loop, parse, Clipboard, `t 
    ParsedSpecs.insert(A_LoopField)
    MinLimit:=Parsedspecs[17]
    MaxLimit:=Parsedspecs[18]
    Percision:=Parsedspecs[19]
    FullRequirements:=Parsedspecs[20]
    Units:=Parsedspecs[21]
    ;tooltip(Requirement)
		sleep 200
		blockinput off
		send {esc}
    Return
    }
    
    Paste(){
      Global
      WinActivate, NuGenesis LMS - \\Remote
      click 57, 715 ; edit Test
    ; click 57, 750 ; edit results
      winwaitactive, Test Definition Editor - \\Remote
      click 418, 202
				SpecTab_TestDefinitionEditor(Description) ; the pre window
				sleep 200
					Wheel_scroll("100")
					click 232, 244 ;click resulst
					sleep 200
					WinActivate, Results Definition - \\Remote
					WinWaitActive, Results Definition,,0.25
						if errorlevel
							WinActivate, Results Definition
      Mouse_Click("edit")
      winwaitactive, Result Editor - \\Remote
      SpecTab_ResultEditor(MinLimit,MaxLimit,Units,Percision,1,FullRequirements)
      return
    }
    
    AddMethod(MethodID){
      WinActivate, NuGenesis LMS - \\Remote
      click 67, 562 ; Add Methods
      winwaitactive, Select methods tests - \\Remote
      click 227, 69. 2 ; method search bar
      sendinput, %MethodID%{enter}^a{click 506, 337}{click 851, 656} ; add test and hit okay
      sleep 200
      WinActivate, NuGenesis LMS - \\Remote
      click 397, 591 ; click attrobutes
      return
    }
    
  }


SpecTab_AutoFill(){ 
	global
			WinActivate, ahk_exe WFICA32.EXE
				sleep 200
				blockinput, on
			If Winactive("NuGenesis LMS - \\Remote") 
				{
					;sendinput, {click, 565, 692}^a%Name%{enter}{click r, 270, 809}+{tab 2}{enter}
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
					; click 236, 246
					click.TestDefinitionEditor_Results()
					sleep 200
					WinActivate, Results Definition - \\Remote
					; WinWaitActive, Results Definition - \\Remote,,0.25
						; if errorlevel
						; sleep 200
							; WinActivate, Results Definition - \\Remote
					; Mouse_click("edit")
					; sleep 300
					; SpecTab_ResultEditor(MinLimit,MaxLimit,Units,Percision,1)
					; return
			}
			if winactive("Results Definition - \\Remote") ;Selection window
			{	
				; WinActivate, Results Definition - \\Remote
					; sleep 200
					WinActivate, Results Definition - \\Remote
					If Method contains ICP-MS 231	
						send, {click 217, 141}
					send, {click 80, 66} ;click edit
					sleep 200
					winwaitactive, Result Editor - \\Remote,,0.5
						if !errorlevel
					SpecTab_ResultEditor(MinLimit,MaxLimit,Units,Percision,1,0)
					blockinput, off
					sleep 400
					; if (method!="ICP-MS 231") {
						; exit
					; }
					; WinWaitClose, Results Definition,, 5
					; 		if errorlevel
					; 			send, {enter} ;hit okay
					; 		winactivate, Test Definition Editor - Remote
					; 		sleep 100
					; 			click 330, 621
								
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
		LV_ModifyCol(7,20)
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
			Position[A_index]:=				Xl.Range("F" . A_Index+7).Text
			Name[A_index]:=						Xl.Range("K" . A_Index+7).text
			LabelClaim[A_index]:=			Xl.Range("L" . A_Index+7).Text
			MinLimit[A_index]:=				Xl.Range("G" . A_Index+7).Text
			MaxLimit[A_index]:=				Xl.Range("H" . A_Index+7).Text
			Units[A_index]:=					Xl.Range("I" . A_Index+7).Text
			Percision[A_index]:=			Xl.Range("J" . A_Index+7).Text
			Description[A_index]:=		Xl.Range("N" . A_Index+7).Text
			Method[A_index]:=					Xl.Range("D" . A_Index+7).Text

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
					SpecTab_Edit_CoatedPhysical()
					sleep 2000
					;	sendinput, {Enter}
				return

				WinActivate, Edit specification - \\Remote
				SpecTab_Edit_Retain()
				sleep 2000
				sendinput, {Enter}
				return
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
					sendinput, %Product%`, {shift down}I{shift Up}n {shift down}P{shift Up}rocess`, {shift down}A{shift Up}nalytical
					Sendinput, {tab 4}^a%Product%{tab}{enter}{tab}{space}{enter 2}{tab}{right}
				return 


			SpecTab_EditSampleTemplate_A(){
				global
				winactivate, Edit sample template - \\Remote
				sendinput, {click 377, 82}{home}%Product%`, {Shift down}I{Shift up}n {Shift down}P{Shift up}rocess`, {Shift down}A{Shift up}nalytical{tab 2}{Right 6}{tab}{right 6}{tab}{right}{enter}
				; WinWaitActive, NuGenesis LMS - \\Remote,,1
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


SpecTab_ResultEditor(Min_Limit,Max_Limit,The_Units,The_Percision,UseLimitsBox:=0,CreateRequirements:="True") {
		Global
		If (CreateRequirements:="True")
			Requirement= %Min_Limit% - %Max_Limit% %The_Units% 
		else 
			Requirement:= CreateRequirements
			;normal
		sleep 200
		click, 250, 140 ; click id box to orient

		sleep 200
		if (Uselimitsbox := 0)
			send, {tab 2}%The_units%{tab}^{a}%The_Percision%{tab 7}^{a}%Min_Limit%{tab}^a%Max_Limit%{tab 5}^a ;normal
		send, {tab 2}%The_units%{tab}^{a}%The_Percision%{tab 5}
		sleep 200
		If (UseLimitsBox:=1)
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
		; WinWaitClose, Results Definition,, 6
			; if errorlevel
				; return
	}

SpecTab_TestDefinitionEditor(The_Description) {
	Global
	if The_description is space
		{
				Wheel_scroll("100")
				click.TestDefinitionEditor_Results()
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
		click.EditSampleTemplate()
		sendinput, {tab}^{a}%Product%`, {Shift down}C{shift up}oated`, {shift down}R{shift Up}etain
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
click.EditSampleTemplate()
		sendinput, {tab}^{a}%Product%`, {Shift down}C{shift up}oated`, {shift down}P{shift Up}hysical
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
	winwaitactive, NuGenesis LMS - \\Remote, ,4
	if !errorlevel 
		sleep 300
click.EditSampleTemplate()
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
	winwaitactive, Products List - \\Remote, ,2
	send, {enter 2}
	sleep 200
	send,{tab}
	sleep 200
	send,{right}{tab}{left 2}{enter}
	winwaitactive, NuGenesis LMS - \\Remote, ,5
	if !errorlevel 
		sleep 300
	click.EditSampleTemplate()
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
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	click 390, 659	;click okay
	return
	}

SpecTab_HM_USP() {
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}15{tab 5}NMT 15 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	; click 125,150 ;click 2nd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}5{tab 5}NMT 5 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	; click 125,190 ;click 3rd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}5{tab 5}NMT 5 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	; click 125,210 ;click 4th row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}15{tab 5}NMT 15 mcg/day
	click 390, 659	;click okay
	return
	}

SpecTab_HM_Canada() {
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}9.8{tab 5}NMT 9.8 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}9.8{tab 5}NMT 9.8 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}6.3{tab 5}NMT 6.3 mcg/day
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	click 125,130 ;click 1st row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 3}20.3{tab 5}NMT 20.3 mcg/day
	click 390, 659	;click okay
	return
	}
SpecTab_HM_Prop65() {
	click 125,130 ;click 1st row
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
	click 125,130 ;click 1st row
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
	click 125,130 ;click 1st row
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
	click 125,130 ;click 1st row
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




Spec_TableGuiClose:
	; coordmode, mouse, Screen
	; ,WinGetPos,VarBar_X,Varbar_Y,w,h
	;	WinGetPos, SpecTable_X, SpecTable_Y, %Product%
	;IniWrite, %SpecTable_X%, data.ini, Locations, SpecTable_X
	;IniWrite, %SpecTable_y%, data.ini, Locations, SpecTable_Y
	GUI, Spec_Table:destroy
	coordmode, mouse, window
	return
	
	
	
	