_explorer:
#IfWinActive, ahk_exe explorer.exe
	; F20 & up::           	WinMove,  ahk_exe explorer.exe, , A_ScreenWidth/2, 0, A_ScreenWidth/2, A_ScreenHeight/2
	; F20 & left::         	WinMove,  ahk_exe explorer.exe, , -292, -943, 1175, 904
	; F20 & down::         	WinMove,  ahk_exe explorer.exe, , A_ScreenWidth/2, A_screenheight/2, A_ScreenWidth/2, A_ScreenHeight/2-45
	; F20 & right::        	WinMove,  ahk_exe explorer.exe, , 1836, -1080, 1664, 1087
	; F7::                 	Send, {altdown}{right}{altup}
	F19 & space::   send % BlockRepeat(400) product  "{enter}" ;              	Send, {altdown}{left}{altup}
	F6::   			sendinput % BlockRepeat(800) product  "{enter}" ;              	Send, {altdown}{left}{altup}
	F7::				Sendinput, ^{e}%product%{enter}
	F9::ExplorerSearch(Product)
	^w::									closewindow()

#ifwinactive, Task View, 
	F7::										Send, {right}
	F6::										Send, {left}
	F9::										Send, {up}
	F8::										Send, {down}
	Mbutton::								Send, {space}
	Numpaddiv::							
												Send, {Click R}
												sleep 100 
												Send, {up}{enter}
												return

_WORD:
#IfWinActive, ahk_exe WINWORD.EXE
	F13 & space::					SendInput, +{tab}{tab}
	; F20 & up::        Send, PRD{tab 2}Mat Mignin{tab 2}%DateString%{ctrldown}{f}{ctrlup}waters.eln{enter}{esc}{tab}1.0.22{tab 2}1.0.52
	; F20 & down::      Send, MMIGNIN-LPT{down 4}Mat{down 4}Mignin{down 3}mmignin{down 3}SYSTEM
	; F20 & right::     FindAndReplaceWord("<English>","English")
	; F20 & left::      
	; 						clipboard:=
	; 						sleep 20
	; 						Send, ^c
	; 						clipwait, 0.5
	; 						Send, {up}
	; 						FindAndReplaceWord("<" clipboard ">",clipboard,"r")
	; 						return
	; F20 & k::         up
	; F20 & j::         down
	; F20 & h::         left
	; F20 & l::         right
	; F19 & space::     Send, +{tab}{tab}
	F20 & `;::        Send, {tab}
	F20 & /::         Table_Entry("N/A")
	F20 & n::         Table_Entry("No")
	F20 & y::         Table_Entry("Yes")
	F20 & m::         Table_Entry("Yes")
	F20 & f::         Table_Entry("FALSE")
	F20 & ,::         Table_Entry("FALSE")
	F20 & t::         Table_Entry("TRUE")
	F20 & .::         Table_Entry("TRUE")
	F19 & wheeldown:: 
	F8::              Send, {enter}
	F19 & Wheelleft:: 
	F6::              Send, +{tab}{ctrldown}{c}{ctrlup}{tab}{ctrldown}{v}{ctrlup}
	F19 & Wheelright::
	F7::              Send, {ctrldown}{c}{ctrlup}{Tab}{end}{enter}{ctrldown}{v}{ctrlup}{enter}
	F19::             Clip.Copy()
	F20::             Clip.paste()
		


_Excel:
	/*   ; searchbar and tabswitch
		#If (A_PriorHotKey = "Mbutton" AND A_TimeSincePriorHotkey < 9000 AND winactive("LMS Workbook.xlsb"))
		F6::                 
							winactivate, NuGenesis LMS - \\Remote
							sleep 200
							click, xTab3,yTabs
							; excel.connect()
							lms.SearchBar(Product,"{enter}")
							sleep 200
							Send, {click, 87, 676, 0}
							return
		F7::                 
							winactivate, NuGenesis LMS - \\Remote
							sleep 200
							click, xTab4,yTabs
							; excel.connect()
							lms.SearchBar(Product,"{enter}")
							sleep 200
							Send, {click, 87, 676, 0}
							return
		#if 
		*/
#IfWinActive, LMS Workbook.xlsb
	F9::    					Excel.Connect(1)
	F19 & space::    			Excel.CopySheetName()
	F19 & backspace::    delete
	F19 & down::         ^down
	F19 & up::           ^up
	F19 & left::         ^left
	F19 & right::        ^right
	F7::                 Excel.NextSheet()
	F6::                 Excel.PrevSheet()

	numpaddot::						
								excel.Connect(1)
								ExplorerSearch(Product)
								return

#ifwinactive, Excel ahk_exe WFICA32.EXE 
	; F9::						WinMove, A, , A_ScreenWidth/3, 0, A_ScreenWidth/3, A_ScreenHeight/4
	F6::						WinMove, A, , A_ScreenWidth/3, 0, A_ScreenWidth/3, A_ScreenHeight/4
	; F9::						Send, {lwindown}{down}{lwinup}
	^wheelup::				Send, {click 3}%SampleID%
	^wheeldown::			Send, %SampleID%
#ifwinactive, ahk_exe EXCEL.EXE     
	F1::F1
	F2::F2
	F4::F4
	Numlock::Send, {shiftdown}{F9}{shiftup}
	; F9::                 excel.search()
	F9::						3tap()
	F7::                 excel.Search()
	+Enter::             SendInput, {altdown}{enter}{altup}
	$Enter::             SendInput,{enter}
	; Numlock::          Excel.SearchWorkbook(Product)
	F8::                 Send,{shiftDown}{Ctrldown}{u}{CtrlUp}{ShiftUp}
	Media_Prev::         Send,{LWindown}{tab}{lwinup}
	F19 & F7::           ^F8 ;Excel.NextSheet()
	F19 & F6::           ^F9 ;Excel.PrevSheet()
	F19::						Send, ^v
#ifwinactive, Find and Replace ahk_exe EXCEL.EXE,
	; F20 & space::      	Send, !{n}%Product%
	; F19 & space::     	Send, !{n}%Batch%
	return::             SendInput, !{i}
	rbutton & Lbutton::  SendInput, !{i}
#ifwinactive, LMS Products Checklist.xlsm - Excel
	F13::
	Mbutton::
	SendInput, MM{tab}
	FormatTime, CurrentDateTime,, MM/d/yy
	SendInput %CurrentDateTime%
	return
_OUTLOOK:
	#IfWinActive, ahk_exe OUTLOOK.EXE
	F19 & enter::        Send, {ctrldown}{enter}{ctrlup}
	; numpadadd::         	send % Trim(Batch, OmitChars = " `n") " is updated.{ShiftDown}{Ctrldown}{left 2}{CtrlUp}{ShiftUp}{space}is updated."
	<+F20::       		   SendInput % Trim(Batch, OmitChars = " `n") " is updated.{ShiftDown}{Ctrldown}{left 2}{CtrlUp}{ShiftUp}"	
	<+F19::       		   SendInput % Trim(Product, OmitChars = " `n")	
	F20 & F19::          SendInput % Trim(Batch, OmitChars = " `n") " is updated.{ShiftDown}{Ctrldown}{left 3}{CtrlUp}{ShiftUp}"	
	; F19 & ,::          SendInput % Trim(Batch, OmitChars = " `n") " is updated{ShiftDown}{Ctrldown}{left 2}{CtrlUp}{ShiftUp}"	
	; Numpadsub::
	; F20 & Left::         WinMove, ahk_exe OUTLOOK.EXE, ,1226, -1098, 1489, 1080

	numpadmult::
	; F20 & up::	         WinMove, ahk_exe OUTLOOK.EXE, , 1945, -738, 1076, 1158
	; F20 & right::	      WinMove, ahk_exe OUTLOOK.EXE, , 2197, 0, 363, 1554
	F20::                
								Send, ^{c}
								Clip.Copy()
								return
	F7::						LMS.SearchRequest(Batch,"{enter}")
	F9::                 
								winactivate, NuGenesis LMS - \\Remote
								sleep 200
								lms.searchbar(Product)
								return
	F6::						LMS.SearchRequest(Batch,"{enter}")    
	^wheelup::				Block(500,"^{v}")
	; ^wheeldown::send % Blockrepeat(500) Clip.Copy()
	F13::						return ; clip.IfNothingSelected("menu")

#Ifwinactive, Affinity Photo ahk_exe Photo.exe
	Numlock::				Send, {Backspace}	
	; F20::Send, {backspace}
	F19::						Send, ^{click}
	



_OneNote:
#ifwinactive, OneNote for Windows 10
	^1::                 Send,{altDown}{Ctrldown}{1}{CtrlUp}{altup}
	^2::                 Send,{altDown}{Ctrldown}{2}{CtrlUp}{altup}
	^3::                 Send,{altDown}{Ctrldown}{0}{CtrlUp}{altup}
	^4::                 Send,{Ctrldown}{1}{CtrlUp}
	^5::                 Send,{Ctrldown}{3}{CtrlUp}
	^`::                 Send,{altDown}{Ctrldown}{0}{CtrlUp}{altup}
	; F20 & right::        WinMove, OneNote for Windows 10, , 1521, -1080, 1605, 1087

	#IfWinActive, ahk_exe ONENOTE.EXE
	; F9 & Wheelup::       Wheel_2("{F11}")
	F9::                 Send,{AltDown}{w}{i}{Altup}
	F6::                 SendInput,{wheelleft 20}
	F7::                 SendInput,{Wheelright 10}
	^1::                 Send,{altDown}{Ctrldown}{1}{CtrlUp}{altup}
	^2::                 Send,{altDown}{Ctrldown}{2}{CtrlUp}{altup}
	^3::                 Send,{altDown}{Ctrldown}{3}{CtrlUp}{altup}
	^4::                 Send,{Ctrldown}{1}{CtrlUp}
	$Mbutton up::        SendInput,{ctrlup}
	; F20 up::             PasteScreenshot()
	; F21 up::             PasteScreenshot()
	; F20 & Right::        WinMove, OneNote 10, , 1626, -1080, 1612, 1087

#IfWinActive,

_Remote_DESKTOPs:
#IfWinActive, Remote Desktop Connection
	; F13::                TT("`n PRDCitrix1 `t 10.1.2.134`n PRDCitrix2 `t 10.1.2.226`n PRDCitrix3 `t 10.1.2.227 `n LMS-Test `t 10.1.2.152",6000)
#IfWinActive, ahk_exe mstsc.exe
	F20::
	SendLevel, 2
	Send, ^{c}
	sendlevel, 0
	return
#ifwinactive, ahk_class #32770
	F19::              menu.Remote_Login()
#ifwinactive, ahk_class TscShellContainerClass
	F19::            	 menu.Remote_Desktop()


_Firefox:
 #IfWinActive, ahk_exe firefox.exe 
 numpaddot::	      sendInput, ^w
 F6::				   	SendInput, !{left}
 F7::				   	Send, !{right}
 F13::				  	Send, {ctrldown}{/}{ctrlup}
 +F13::				 	Send, {esc}
 numpadadd::send, {lwindown}{right}{lwinup}
 numpadsub::send, {lwindown}{left}{lwinup}
 numpadmult::send, {lwindown}{up}{lwinup}


#ifwinactive, Map VQ drive.bat ahk_exe cmd.exe
	mbutton::
	F19 & \::sendinput, mmignin{enter}{/}Kilgore7744{enter}

#IfWinActive, Getting Started with Jaspersoft Studio — Mozilla Firefox ahk_exe firefox.exe



ExplorerSearch(text){
		excel.connect(1)
		AllLabelCopy:="C:\Users\mmignin\Desktop\Desktop Stuff\Label Copy\All Label Copy"
		SearchWindow:="search-ms:displayname"
		IfWinNotExist, %Sea% && ifwinNotexist, %AllLabelCopy%	
			return									
		;  Run, %AllLabelCopy%
		; IfWinNotExist, ahk_exe explorer.exe && ifwinNotexist, %AllLabelCopy%										Run, %AllLabelCopy%
			; run, %AllLabelCopy%
		IfWinExist, %Sear% 
		IfWinExist, %SearchWindow% 
			winactivate, %AllLabelCopy%
		winwait, %AllLabelCopy%, ,2
		if errorlevel
			winactivate, ahk_exe explorer.exe
		sleep 300
		WinGetPos, wX, wY, wW, wH, A
		clk(ww-175, 75)
		sleep 400
		; SetKeyDelay, 20, 1 
		Send, %Text%
		sleep 300
		Send, {enter}
		; setkeydelay, 0 , 0
		return
		}



FindAndReplaceWord(find,Replace,AllOrOne:="a"){
		Send, ^{h}%find%{tab}%replace%{altdown}{%AllOrOne%}{altup}
		if (Allorone=="a"){
			loop 3 {
				sleep 200
				if winactive("Microsoft Word")
					Send, {enter}
				sleep 300	
			}
					return
		}
		else 
			Send, {enter}{esc}
}

Table_Entry(Entry){
		Global Iteration
			if Iteration < 0
				Direction:="{Tab}"
			If Iteration > 0
				Direction:="{Down}+{tab}{Tab}"
		send % Entry Direction "{ctrlup}{altup}{shiftup}"
	}







