



SpecTab_Create_Template: ;{
	#ifwinactive, ahk_exe WFICA32.EXE
:*:p\::
	SpecTab_Edit_Physical()
	return
:*:cp\::  ;Coated Physical Spec
	{
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
			sendinput, {tab}{delete 16}%Product%`, {Shift down}C{shift up}oated{tab 3}{left 4}
		return
	}
:*:r\::
	SpecTab_Edit_Retain()
	return
:*:cr\:: ;Coated Retain
	{
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
			sendinput, {tab}{delete 16}%Product%`, {Shift down}C{shift up}oated{tab 3}{tab 4}
		return
	}
:*:m\::
	SpecTab_Edit_Micro()
	return
:*:a\::
	SpecTab_Edit_Analytical()
	return
:*:ac\::
	sendinput, %Product%`, {shift down}I{shift Up}n {shift down}P{shift Up}rocess`, {shift down}A{shift Up}nalytical
	Sendinput, {tab 4}^a%Product%{tab}{enter}{tab}{space}{enter 2}{tab}{right}
return ;}
	
	
	
	
	
	SpecTab_EditSampleTemplate_A() 
{
	global
	winactivate, Edit sample template - \\Remote
	sendinput, {click 377, 82}{home}%Product%`, In Process`, {Shift down}A{Shift up}nalytical{tab 2}{Right 6}{tab}{right 6}{tab}{right}
	return
}

SpecTab_EditSpecification_Analytical()
{
	global
	sendinput, %Product%`, In Process`, {Shift down}A{Shift up}nalytical{tab 4}^a%Product%{tab}{enter}{tab}{space}{enter 2}{Tab}{right}{tab}{right 4}{tab}{right 6}{Tab 2}{Space}{tab 2}{right}{tab}{right}
	winwaitactive, NuGenesis LMS - \\Remote, ,4
	if !ErrorLevel 
		click, 127, 335
	winwaitactive, Edit sample template - \\Remote,, 8
	if !errorlevel
		SpecTab_EditSampleTemplate_A()
	return
}			

SpecTab_ResultEditor(Min_Limit,Max_Limit,The_Units,The_Percision) 
{
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
	sleep 500
	click 350, 660 ; click okay
}

SpecTab_TestDefinitionEditor(The_Description) 
{
	Global
	Excel_Connect()
	WinActivate, Test Definition Editor - \\Remote 
	DescriptionRaw:=The_Description
	Trimmed_Description:=RTrim(DescriptionRaw, "`r`n")
	Click, 187, 200 ;Orient_SpecTab_TestDefinitionEditor
	Sendinput,^a%Trimmed_Description%{pg down 5}
	;send, {shift down}{Tab 15}{Shift up}{enter}
	return
}

SpecTab_Edit_Physical()
{
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
	sleep 300
	winwaitactive, NuGenesis LMS - \\Remote, ,8
	if !errorlevel 
		sleep 300
	click,  70, 518 ;edit sample method 
	sleep 499
	winwaitactive, Edit sample template - \\Remote,,4
	if !errorlevel
		sleep 300
	sendinput, {tab}{delete 4}%Product%{enter}
	return
}
SpecTab_Edit_Retain(){
	Global
	VarBar()
	winactivate, Edit specification - \\Remote
	sendinput, {click 376, 87}{home}
	send,%Product%`, {shift down}I{shift Up}n {shift down}P{shift Up}rocess`, {shift down}R{shift Up}etain{tab 4}^a%Product%{tab}{enter}{tab}{space}{Return 2}
	sleep 200
	send,{tab}{right} 
	sleep 400
	send,{tab}{right}
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
SpecTab_Edit_Analytical() 
{
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

SpecTab_Edit_Micro()
{
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
 
SpecTab_InsertDescription()
{
	Global
	DescriptionRaw:=Description
	Description:=RTrim(DescriptionRaw, "`r`n")
	Send,^a%Description%
	Return
} 

SpecTab_HM_ReportOnly() 
{
	click 125,120 ;click 2nd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	;sleep 500
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	;sleep 300
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	;sleep 500
	click 125,140 ;click 2nd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	;sleep 500
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only		;sleep 300
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	;sleep 500
	click 125,180 ;click 3rd row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	;sleep 500
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only		;sleep 300
	click 390, 659	;click okay
	WinWaitClose, Result Editor - \\Remote,,4
	;sleep 500
	click 125,200 ;click 4th row
	click 80,70 ;Edit
	winwaitactive, Result Editor - \\Remote,,4
	;sleep 500
	sendinput, {tab 5}mcg/day{tab 7}{space}{tab 2}0{tab 6}Report Only
	;sleep 300
	click 390, 659	;click okay
	return
}


SpecTab_HM_USP() 
{
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

SpecTab_HM_Canada() 
{
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
SpecTab_HM_Prop65() 
{
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
;#include LMS\GUI_SpecTable.ahk