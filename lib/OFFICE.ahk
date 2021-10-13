_explorer:
#IfWinActive, ahk_exe explorer.exe
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
	F21 & `;::        Send, {tab}
	F21 & /::         Table_Entry("N/A")
	F21 & n::         Table_Entry("No")
	F21 & y::         Table_Entry("Yes")
	F21 & m::         Table_Entry("Yes")
	F21 & f::         Table_Entry("FALSE")
	F21 & ,::         Table_Entry("FALSE")
	F21 & t::         Table_Entry("TRUE")
	F21 & .::         Table_Entry("TRUE")
	F19 & wheeldown:: 
	F8::              Send, {enter}
	F19 & Wheelleft:: 
	F6::              Send, +{tab}{ctrldown}{c}{ctrlup}{tab}{ctrldown}{v}{ctrlup}
	F19 & Wheelright::
	F7::              Send, {ctrldown}{c}{ctrlup}{Tab}{end}{enter}{ctrldown}{v}{ctrlup}{enter}
	F19::             Clip.Copy()
	F21::             Clip.paste()
		


_Excel:

#IfWinActive, LMS Workbook.xlsb
	F9::    					Excel.Connect(1)
	F19 & space::    			Excel.CopySheetName()
	F19 & backspace::    delete
	; F19 & down::         ^down
	; F19 & up::           ^up
	; F19 & left::         ^left
	; F19 & right::        ^right
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
	F8::                 Send,{shiftDown}{Ctrldown}{u}{CtrlUp}{ShiftUp}
	Media_Prev::         Send,{LWindown}{tab}{lwinup}
	F19 & F7::           ^F8 ;Excel.NextSheet()
	F19 & F6::           ^F9 ;Excel.PrevSheet()
	F19::									Send, ^v
#ifwinactive, Find and Replace ahk_exe EXCEL.EXE,
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
	<+F21::       		   SendInput % Trim(Batch, OmitChars = " `n") " is updated in LMS.{ShiftDown}{Ctrldown}{left 2}{CtrlUp}{ShiftUp}"	
	<+F19::       		   SendInput % Trim(Product, OmitChars = " `n")	
	F21 & F19::          SendInput % Trim(Batch, OmitChars = " `n") " is updated in LMS.{ShiftDown}{Ctrldown}{left 3}{CtrlUp}{ShiftUp}"	

	numpadmult::
	F21::                
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
	F13::						return ; clip.IfNothingSelected("menu")

#Ifwinactive, Affinity Photo ahk_exe Photo.exe
	Numlock::				Send, {Backspace}	
	F19::						Send, ^{click}
	

_Teams:
#ifwinexist, Touchpoint | Microsoft Teams
Numlock::
winactivate, Microsoft Teams
send, {shiftdown}{ctrldown}{m}{ctrlup}{shiftup}
return

_OneNote:
#ifwinactive, OneNote for Windows 10
	^1::                 Send,{altDown}{Ctrldown}{1}{CtrlUp}{altup}
	^2::                 Send,{altDown}{Ctrldown}{2}{CtrlUp}{altup}
	^3::                 Send,{altDown}{Ctrldown}{0}{CtrlUp}{altup}
	^4::                 Send,{Ctrldown}{1}{CtrlUp}
	^5::                 Send,{Ctrldown}{3}{CtrlUp}
	^`::                 Send,{altDown}{Ctrldown}{0}{CtrlUp}{altup}

	#IfWinActive, ahk_exe ONENOTE.EXE
	F9::                 Send,{AltDown}{w}{i}{Altup}
	F6::                 SendInput,{wheelleft 20}
	F7::                 SendInput,{Wheelright 10}
	^1::                 Send,{altDown}{Ctrldown}{1}{CtrlUp}{altup}
	^2::                 Send,{altDown}{Ctrldown}{2}{CtrlUp}{altup}
	^3::                 Send,{altDown}{Ctrldown}{3}{CtrlUp}{altup}
	^4::                 Send,{Ctrldown}{1}{CtrlUp}
#IfWinActive,

_Remote_DESKTOPs:
#IfWinActive, Remote Desktop Connection
#ifwinactive, ahk_class #32770
	F19::              menu.Remote_Login()
#ifwinactive, ahk_class TscShellContainerClass
	F19::            	 menu.Remote_Desktop()

_Firefox:

;  #IfWinActive, Introduction to JasperReports



 #IfWinActive, ahk_exe firefox.exe 
	Numlock::send, {click 1801, 1081}
	Mbutton::send, {click 81, 1093}
 numpaddot::	      sendInput, ^w
 F6::				   	SendInput, !{left}
 F7::				   	Send, !{right}
 F13::				  	Send, {ctrldown}{/}{ctrlup}
 +F13::				 	Send, {esc}
 numpadadd::send, {lwindown}{right}{lwinup}
 numpadsub::send, {lwindown}{left}{lwinup}
 numpadmult::send, {lwindown}{up}{lwinup}


#ifwinactive, Map VQ drive.bat ahk_exe cmd.exe


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







