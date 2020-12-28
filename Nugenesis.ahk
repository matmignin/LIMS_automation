	
	ClickSearchBar(){
	Global
	ifwinactive, Select methods tests - \\Remote 
	{
		click, 246,77, 2
		return
	}
IfWinActive, NuGenesis LMS - \\Remote 
	{
		click 316,84
		click 191,109
		Return
	}
;~ Click, 2
	sleep 100
	;~ Send,%ProductCode%{enter}
}


SearchFolder(filepath){
	global
	Run, %filepath% 
	winwait, %filepath% 
	Send,^e
	sleep 250
	Send, %ProductCode%+{home}
	return
}

HeavyMetalsComponents() {
		click 80,70
		sleep 400
	send, {tab 5}mcg/day{enter}{tab 7}{space}{tab 2}15{tab 5}NMT 15 mcg/day{click 390, 659}
		click 143,146
		sleep 100
		click 808,70
		sleep 400
	send, {tab 5}mcg/day{enter}{tab 7}{space}{tab 2}15{tab 5}NMT 5 mcg/day{click 390, 659}	
		click 126,169
		sleep 100
		click 80,70
		sleep 400
	send, {tab 5}mcg/day{enter}{tab 7}{space}{tab 2}15{tab 5}NMT 5 mcg/day{click 390, 659}
			click 65,199
		sleep 100
		click 80,70
		sleep 400
	send, {tab 5}mcg/day{enter}{tab 7}{space}{tab 2}15{tab 5}NMT 15 mcg/day{click 390, 659}
	return
}



#Ifwinactive, NuGenesis LMS - \\Remote
wheelleft::ClickSearchBar()

 #IfWinActive,   ;}
 
#Include GetExcelData.ahk
#Include CreateGuiWindow.ahk
#include ProductTab.ahk 
#include RotationsMenu.ahk
#Include SpecificationTab.ahk