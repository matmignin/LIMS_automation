
Create_Specification_template:
#ifwinactive, ahk_exe WFICA32.EXE
:*:p\:: ;Physical Spec
	send,%ProductCode%`, In Process`, Physical{tab 4}^a%ProductCode%{tab 2}
		Sleep 200
	send,{Space}
	sleep 200
		winwait, Products List - \\Remote
		send, {enter 2}
				sleep 200
			send,{tab}
		sleep 200
			send,{right} 
	return
:*:cp\::  ;Coated Physical Spec
	send,%ProductCode%`, Coated`, Physical{tab 4}^a%ProductCode%{tab}{enter}{tab}{space}{Return 2}
		winwait, Edit specification, 2
	sleep 200
	send,{tab 2}{right} 
	return
:*:r\:: ;Retain
	send,%ProductCode%`, In Process`, Retain{tab 4}^a%ProductCode%{tab}{enter}{tab}{space}{Return 2}
	sleep 200
	send,{tab}{right} 
	sleep 400
		send,{tab}{right}
	return
	:*:cr\:: ;Coated Retain
	send,%ProductCode%`, Coated`, Retain{tab 4}^a%ProductCode%{tab}{enter}{tab}{space}{Return 2}
	sleep 400
	send,{tab}{right} 
	sleep 200
	send,{tab}{right} 
	return
:*:m\:: ;Micro
	send,%ProductCode%`, Finished`, Micro{tab 4}^a%ProductCode%{tab 2}
	Sleep 200
	send,{Space}
	sleep 200
		winwait, Products List - \\Remote
		send, {enter 2}
		sleep 200
	send,{tab}
		sleep 200
	send,{right} {tab}{left 2}
	return
:*:a\:: ;Analytical
	send,%ProductCode%`, In Process`, Analytical
	IfWinActive, Edit sample template - \\Remote
		send,{tab 2}{Right 6}{tab}{right 6}{tab}{right}
		return
	IfWinActive, Edit specification - \\Remote
			Send,{tab 4}^a%ProductCode%{tab}{enter}{tab}{space}{Return 2}
				winwait, Edit specification, 2
			sleep 200
			send,{tab}{right}{tab}{left 2}
			return
	return

/* 			Result Editor		             
							           */
Result_Editor:  ;{
#ifwinactive, Result Editor - \\Remote
	WheelRight::ResultEditor()
	;Numpadadd::GetExcelData()
	Wheelleft::GetExcelData() ;GetIngredientMenu() ;}
	
ResultEditor(){
	  Global
	  Requirement= %MinLimit% - %MaxLimit% %Units%
	  sleep 150
	  send,{click,47, 139 }
	  sleep 100
	  send,{tab 3}%units%{enter}{tab}{delete}^a
	  send,%Percision%{tab 7}^a
	  send,%MinLimit%{tab}^a
	  send,%MaxLimit%{tab 5}^a
	  sleep 200
	  Sendinput,%Requirement%

	  return
	  } ;}

Results_Definition:	 ;{
#ifwinactive, Results Definition - \\Remote    ;after the products tab>Formulation>Composistion
	Wheelleft::Click,45, 61 ;Add
	WheelRight::Click,84, 72 ;Edit

#IfWinActive,