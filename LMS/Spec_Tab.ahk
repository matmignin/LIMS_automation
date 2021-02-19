



Create_Specification_template: ;{
#ifwinactive, ahk_exe WFICA32.EXE
:*:p\::Spec_Tab_Edit_Physical()
Spec_Tab_Edit_Physical(){
Global
winactivate, Edit specification - \\Remote
	sendinput, {click 376, 87}{home}
		send,%ProductCode%`, {shift down}I{shift Up}n {shift down}P{shift Up}rocess`, {shift down}P{shift Up}hysical{tab 4}^a%ProductCode%{tab 2}
		Sleep 200
		send,{Space}
		sleep 200
		winwaitactive, Products List - \\Remote, , 8
				if errorlevel
			return
		else
		send, {enter 2}
		sleep 200
		send,{tab}
		sleep 200
		send,{right} 
		sleep 300
		winwaitactive, NuGenesis LMS - \\Remote, ,8
		if errorlevel 
			return
		else
			click, 90 , 514 ;edit sample method 
		sleep 499
		winwaitactive, Edit sample template - \\Remote,,4
		if errorlevel
			return
		else
			sendinput, {tab}{delete 4}%ProductCode%{enter}
		return
		}
:*:cp\::  ;Coated Physical Spec
		send,%ProductCode%`, {shift down}C{shift Up}oated`, {shift down}P{shift Up}hysical{tab 4}^a%ProductCode%{tab}{enter}{tab}{space}{Return 2}
		winwaitactive, Edit specification, 2
		sleep 200
		send,{tab 2}{right} 
		return
:*:r\::Spec_Tab_Edit_Retain()
Spec_Tab_Edit_Retain(){
Global
winactivate, Edit specification - \\Remote
	sendinput, {click 376, 87}{home}
		send,%ProductCode%`, {shift down}I{shift Up}n {shift down}P{shift Up}rocess`, {shift down}R{shift Up}etain{tab 4}^a%ProductCode%{tab}{enter}{tab}{space}{Return 2}
		sleep 200
		send,{tab}{right} 
		sleep 400
		send,{tab}{right}
		winwaitactive, NuGenesis LMS - \\Remote, ,8
		if errorlevel 
			return
		else
			click, 70, 520 ;click edit sample template
		winwaitactive, Edit sample template - \\Remote,,5
		if errorlevel
			return
		else
			sendinput, {tab}{delete 4}%ProductCode%{enter}
		return
		}
	:*:cr\:: ;Coated Retain
		send,%ProductCode%`, {shift down}C{shift Up}oated`, {shift down}R{shift Up}etain{tab 4}^a%ProductCode%{tab}{enter}{tab}{space}{Return 2}
		sleep 400
		send,{tab}{right} 
		sleep 200
		send,{tab}{right}
		winwaitactive, NuGenesis LMS - \\Remote, ,8
		if errorlevel 
			return
		else
			click, 70, 520 ;click edit sample template
		winwaitactive, Edit sample template - \\Remote,, 5
		if errorlevel
			return
		else
			sendinput, {tab}{delete 4}%ProductCode%{enter}
		return
:*:m\::Spec_Tab_Edit_Micro()
Spec_Tab_Edit_Micro(){
Global
winactivate, Edit specification - \\Remote
	sendinput, {click 376, 87}{home}
		send,%ProductCode%`, {shift down}F{shift Up}inished`, {shift down}M{shift Up}icro{tab 4}^a%ProductCode%{tab 2}
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
		if errorlevel 
			return
		else
			click, 70, 520 ;click edit sample template
		winwaitactive, Edit sample template - \\Remote,, 5
		if errorlevel
			return
		else
			sendinput, {tab}{delete 4}%ProductCode%{enter}
		return
		}
:*:a\:: ;Analytical
Spec_Tab_Edit_Analytical() {
Global
		If WinActive("Edit sample template - \\Remote")
			Spec_Tab_EditSampleTemplate_A()
		else If winactive("Edit specification - \\Remote")
		{		
			Spec_Tab_EditSpecification_A_A()
		}
		return
		}
:*:ac\::
		sendinput, %ProductCode%`, {shift down}I{shift Up}n {shift down}P{shift Up}rocess`, {shift down}A{shift Up}nalytical
		Sendinput, {tab 4}^a%ProductCode%{tab}{enter}{tab}{space}{enter 2}{tab}{right}
	return ;}
	
	
	
	
	
	
	
	#IfWinActive,
	#include LMS\GUI_SpecTable.ahk