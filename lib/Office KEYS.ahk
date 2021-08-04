explorer:
#IfWinActive, ahk_exe explorer.exe
	; Mbutton::            	send, 		{enter}
	F20 & up::           	WinMove,  ahk_exe explorer.exe, , 668, -1200, 974, 577
	F21 & up::           	WinMove,  ahk_exe explorer.exe, , 668, -1200, 974, 577
	F20 & left::         	WinMove,  ahk_exe explorer.exe, , -292, -943, 1175, 904
	F21 & left::         	WinMove,  ahk_exe explorer.exe, , -292, -943, 1175, 904
	F20 & down::         	WinMove,  ahk_exe explorer.exe, , 1162, 427, 1405, 1140
	F21 & down::         	WinMove,  ahk_exe explorer.exe, , 1162, 427, 1405, 1140
	F20 & right::        	WinMove,  ahk_exe explorer.exe, , 1836, -1080, 1664, 1087
	F21 & right::        	WinMove,  ahk_exe explorer.exe, , 1836, -1080, 1664, 1087
	F9::                 	send, 		{lwindown}{e}{lwinup}
	F7::                 	send, 		{lwindown}{s}{lwinup}
	F6::                 	Varbar.SearchExplorer()
	^w::									closewindow()
	
	#ifwinactive, Task View, 
	F7::										send, {right}
	F6::										send, {left}
	F9::										send, {up}
	F8::										send, {down}
	Mbutton::								send, {space}
	Numpaddiv::							
	send, {Click R}
	sleep 100 
	send, {up}{enter}
return
WORD:
#IfWinActive, Word ahk_exe WINWORD.EXE

	F13 & space::					sendinput, +{tab}{tab}

	; clippaste()
	F20 & up::send, PRD{tab 2}Mat Mignin{tab 2}%TimeString%{ctrldown}{f}{ctrlup}waters.eln{enter}{esc}{tab}1.0.22{tab 2}1.0.52
	F21 & up::send, PRD{tab 2}Mat Mignin{tab 2}%TimeString%{ctrldown}{f}{ctrlup}waters.eln{enter}{esc}{tab}1.0.22{tab 2}1.0.52
	F20 & down::send, MMIGNIN-LPT{down 4}Mat{down 4}Mignin{down 3}mmignin{down 3}SYSTEM
	F21 & down::send, MMIGNIN-LPT{down 4}Mat{down 4}Mignin{down 3}mmignin{down 3}SYSTEM
	F20 & right::FindAndReplaceWord("<English>","English")
	F21 & right::FindAndReplaceWord("<English>","English")
	F20 & left::
	F21 & left::
		clipboard:=
		sleep 20
		send, ^c
		clipwait, 0.5
		send, {up}
		FindAndReplaceWord("<" clipboard ">",clipboard,"r")
		return
	F20::clip_C()
	F21::clip_C()
		F20 & k::up
		F20 & j::down
		F20 & h::left
		F20 & l::right
		F19 & space::send, +{tab}{tab}
		F20 & `;::send, {tab}
		
		Table_Entry(Entry){
			Global Iteration
				if Iteration < 0
					Direction:="{Tab}"
				If Iteration > 0
					Direction:="{Down}+{tab}{Tab}"
			send % Entry Direction "{ctrlup}{altup}{shiftup}"
		}
		F20 & /::Table_Entry("N/A")
		F20 & n::Table_Entry("No")
		F20 & y::Table_Entry("Yes")
		F20 & m::Table_Entry("Yes")
		F20 & f::Table_Entry("FALSE")
		F20 & ,::Table_Entry("FALSE")
		F20 & t::Table_Entry("TRUE")
		F20 & .::Table_Entry("TRUE")
		Xbutton2 & Wheelup::			Gosub, F9
		Xbutton2 & Wheeldown::		Gosub, F8
		Xbutton2 & Wheelleft::		Gosub, F6
		Xbutton2 & Wheelright::		Gosub, F7
		Xbutton1 & Wheelup::			Gosub, NumpadMult
		Xbutton1 & Wheeldown::		Gosub, NumpadDiv
		Xbutton1 & Wheelleft::		Gosub, Numpadsub
		Xbutton1 & Wheelright::		Gosub, Numpadadd
		F8::send, {enter}
		F6::send, +{tab}{ctrldown}{c}{ctrlup}{tab}{ctrldown}{v}{ctrlup}
		F7::send, {ctrldown}{c}{ctrlup}{Tab}{end}{enter}{ctrldown}{v}{ctrlup}{enter}
	:*:mm;::
					send, Mat Mignin{tab 2}%TimeString%
					return			


	
FindAndReplaceWord(find,Replace,AllOrOne:="a"){
		send, ^{h}%find%{tab}%replace%{altdown}{%AllOrOne%}{altup}
		if (Allorone=="a"){
			loop 3 {
				sleep 200
				if winactive("Microsoft Word")
					send, {enter}
				sleep 300	
			}
					return
		}
		else 
			send, {enter}{esc}
}

Excel:
	#If (A_PriorHotKey = "Mbutton" AND A_TimeSincePriorHotkey < 9000 AND winactive("LMS Workbook.xlsb"))
	F6::                 
											winactivate, NuGenesis LMS - \\Remote
											sleep 200
											click, xTab3,yTabs
											; excel.connect()
											lms.SearchBar(Product,"{enter}")
											sleep 200
											send, {click, 87, 676, 0}
											return
	F7::                 
											winactivate, NuGenesis LMS - \\Remote
											sleep 200
											click, xTab4,yTabs
											; excel.connect()
											lms.SearchBar(Product,"{enter}")
											sleep 200
											send, {click, 87, 676, 0}
											return
	#if
	#IfWinActive, LMS Workbook.xlsb
               
	F9::      					Excel.Connect(1)
	; Numlock::            lms.searchbar(Product)
	F19 & backspace::    delete
	F19 & down::         ^down
	F19 & up::           ^up
	F19 & left::         ^left
	F19 & right::        ^right
	F7::                 Excel.NextSheet()
	F6::                 Excel.PrevSheet()
	; numlock::            send, {altdown}{down 2}{altup} 
	#ifwinactive, Book
		F9::WinMove, A, , 123, 117, 794, 937
	#ifwinactive, ahk_exe EXCEL.EXE         
		F9::                 
		excel.search()
		sleep 200
	F7::                 send, {lwindown}{right}{lwinup}
	; MoveFindReplace()
	$rbutton::           Mouse_RbuttonUP()
	+Enter::             sendinput, !{enter}
	$Enter::             sendinput,{enter}
	; Numlock::          Excel.SearchWorkbook(Product)
	F8::                 send,{shiftDown}{Ctrldown}{u}{CtrlUp}{ShiftUp}
	Media_Prev::         send,{LWindown}{tab}{lwinup}
	F19 & F7::           ^F8 ;Excel.NextSheet()
	F19 & F6::           ^F9 ;Excel.PrevSheet()
	#ifwinactive, Find and Replace ahk_exe EXCEL.EXE,
		F7::                 MoveFindReplace()
		F20 & WheelUp::      
		F21 & WheelUp::      
		Send, !{n}%Product%
		sleep 400
		return
	F20 & WheelDown::    
	F21 & WheelDown::    
	Sendinput % Batch
	return
	return::             sendinput, !{i}
	rbutton & Lbutton::  sendinput, !{i}
	
	MoveFindReplace(){
		; wina
	; WinGetPos, Win_X, win_Y, win_w, Win_H, "SAMPLE LOG 2021.xlsx"
	; EdgeofWindow:=A_ScreenWidth-466
	; BottomofWindow:=(A_Screenhight/3)+(A_Screenhight/3)
	; excel.Search()
	; winMove, Find and Replace, , %EdgeofWindow%, %BottomofWindow%, %EdgeofWindow%+466, %BottomofWindow%
	}
OUTLOOK:
	#IfWinActive, ahk_exe OUTLOOK.EXE
	F19 & enter::        send, {ctrldown}{enter}{ctrlup}
	numpadadd::         				 send % Trim(Batch, OmitChars = " `n") " is updated.{ShiftDown}{Ctrldown}{left 2}{CtrlUp}{ShiftUp}{space}is updated."
	F20 & F19::          sendinput % Trim(Batch, OmitChars = " `n") " is updated.{ShiftDown}{Ctrldown}{left 2}{CtrlUp}{ShiftUp}"	
	F21 & F19::          sendinput % Trim(Batch, OmitChars = " `n") " is updated.{ShiftDown}{Ctrldown}{left 2}{CtrlUp}{ShiftUp}"	
	; F19 & ,::          sendinput % Trim(Batch, OmitChars = " `n") " is updated{ShiftDown}{Ctrldown}{left 2}{CtrlUp}{ShiftUp}"	
	F20 & Left::         WinMove, ahk_exe OUTLOOK.EXE, 1313, -1080, 1439, 1080 
	F21 & Left::         WinMove, ahk_exe OUTLOOK.EXE, 1313, -1080, 1439, 1080 
	F20::                Clip_c()
	F21::                Clip_c()

	F7::LMS.SearchRequest(Batch)
		; winactivate, NuGenesis LMS - \\Remote
		; sleep 200
		; lms.searchbar(Batch)
		; return
	F9::                 
		winactivate, NuGenesis LMS - \\Remote
		sleep 200
		lms.searchbar(Product)
		return
	F6::LMS.SearchRequest(Batch)    
	return
	
	
	
	
#ifwinactive, OneNote for Windows 10
	^1::                 send,{altDown}{Ctrldown}{1}{CtrlUp}{altup}
	^2::                 send,{altDown}{Ctrldown}{2}{CtrlUp}{altup}
	^3::                 send,{altDown}{Ctrldown}{0}{CtrlUp}{altup}
	^4::                 send,{Ctrldown}{1}{CtrlUp}
	^5::                 send,{Ctrldown}{3}{CtrlUp}
	^`::                 send,{altDown}{Ctrldown}{0}{CtrlUp}{altup}
	F20 & right::        WinMove, OneNote for Windows 10, , 1521, -1080, 1605, 1087
	F21 & right::        WinMove, OneNote for Windows 10, , 1521, -1080, 1605, 1087

OneNote:
	#IfWinActive, ahk_exe ONENOTE.EXE
	; F9 & Wheelup::       Wheel_2("{F11}")
	F9::                 send,{AltDown}{w}{i}{Altup}
	F6::                 sendinput,{wheelleft 20}
	F7::                 sendinput,{Wheelright 10}
	^1::                 send,{altDown}{Ctrldown}{1}{CtrlUp}{altup}
	^2::                 send,{altDown}{Ctrldown}{2}{CtrlUp}{altup}
	^3::                 send,{altDown}{Ctrldown}{3}{CtrlUp}{altup}
	^4::                 send,{Ctrldown}{1}{CtrlUp}
	$Mbutton up::        sendinput,{ctrlup}
	F20 up::             PasteScreenshot()
	F21 up::             PasteScreenshot()
		PasteScreenshot(){
		sleep 200
		sendinput, +^{4}
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
		send,{enter}
		sleep 200 ;screenshot"}
		WinActivate, %mwin%
		sleep 200
		; CLICK, %Mx%, %My%
		send, ^v
		return
		}
	F20 & Right::        WinMove, OneNote 10, , 1626, -1080, 1612, 1087
	F21 & Right::        WinMove, OneNote 10, , 1626, -1080, 1612, 1087

#IfWinActive,

Remote_DESKTOPs:
#IfWinActive, Remote Desktop Connection
	Mbutton::            menu.Remote_Desktop()
	; F13::                TT("`n PRDCitrix1 `t 10.1.2.134`n PRDCitrix2 `t 10.1.2.226`n PRDCitrix3 `t 10.1.2.227 `n LMS-Test `t 10.1.2.152",6000)
#ifwinactive, ahk_class #32770
	Mbutton::            menu.Remote_Login()
	F19::              menu.Remote_Login()
#ifwinactive, ahk_class TscShellContainerClass
	F19::             menu.Remote_Desktop()
	Mbutton::            menu.Remote_Desktop()

