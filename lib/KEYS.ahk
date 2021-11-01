
#ifwinactive, 
	<^1::                 return
	<^2::                 return ;,{Ctrldown}{2}{CtrlUp}
	<^3::                 return ;Send,{Ctrldown}{0}{CtrlUp}
;;	___ClipCopy&Paste
	Rbutton & F19::
		if (CutPresses > 0) ; SetTimer already started, so we log the keypress instead.
			{
					CutPresses += 1
					return
			}
			CutPresses := 1
			SetTimer, PressCut, -450 ; Wait for more presses within a 400 millisecond window.
			return
			PressCut:
				if (CutPresses = 1) ; The key was pressed once.
				{
						send, ^x
				}
				else if (CutPresses = 2) ; The key was pressed twice.
				{
						clip.Append("`n","{x}")  
				}
				else if (CutPresses > 2)
				{
						clip.Append(A_Space,"{x}")
						; Pop(Clipboard)
				}
			CutPresses := 0
		return
		F19:: 
			if (CopyPresses > 0) ; SetTimer already started, so we log the keypress instead.
			{
					CopyPresses += 1
					return
			}
			CopyPresses := 1
			SetTimer, PressCopy, -450 ; Wait for more presses within a 400 millisecond window.
			return
			PressCopy:
				if (CopyPresses = 1) ; The key was pressed once.
				{
						Clip.Copy()
				}
				else if (CopyPresses = 2) ; The key was pressed twice.
				{
						clip.Append()  
				}
				else if (CopyPresses > 2)
				{
						clip.Append("`t")
						; Pop(Clipboard)
				}
			CopyPresses := 0
		return
		F20::
			if (PastePresses > 0) ; SetTimer already started, so we log the keypress instead.
			{
					PastePresses += 1
					return
			}
			PastePresses := 1
			SetTimer, PressPaste, -450 ; Wait for more presses within a 400 millisecond window.
			return
			PressPaste:
				if (PastePresses = 1) ; The key was pressed once.
				{
						send, ^{v}
				}
				else if (PastePresses = 2) ; The key was pressed twice.
				{
						send, #v 
				}
				else if (PastePresses > 2)
				{
						clip.Append("`t")
						; Pop(Clipboard)
				}
				PastePresses := 0
	return
	+^c::clip.Append()
	!^c::clip.Append(A_Space)
	!^x::send % clip.Append() "{backspace}"	
	; ^1::                 Send,{altDown}{Ctrldown}{1}{CtrlUp}{altup}
	; ^2::                 Send,{altDown}{Ctrldown}{2}{CtrlUp}{altup}
	; ^3::                 Send,{altDown}{Ctrldown}{3}{CtrlUp}{altup}
;; 	___Send Codes
	>+F20::             			varbar.focus("Batch")
	>+F19::            		 	varbar.focus("Product")
	<#1::
	F20 & left::					sendInput % product
	<#2::
	F20 & down::					sendInput % Batch
	<#3::
	F20 & right::					sendInput % Lot
	<#4::
	F20 & up::						sendInput % Coated
F13 & 1::
<!left::
F19 & left::						GetAllProducts()
<!down::
F13 & 2::
F19 & down::						GetAllBatches()
<!up::
F13 & 3::
F19 & Up::							Sendinput % excel.GetAllSheets()
F13 & Space::GetAllProducts()
F13 & lshift::GetAllProducts("`n")
<#Space::GetAllProducts()
<#lshift::GetAllProducts("`n")
<#enter::GetAllProducts("`n")
<#tab::GetAllProducts(A_tab)	




	Scrolllock::SetCapsLockState % !GetKeyState("CapsLock", "T")
	; f15::sendinput, {click 3}
	$Numlock::				4tap()
	Mbutton::						3Tap()
	Rbutton & Mbutton::menu.PasteStuff()
	Rbutton & Lbutton::   	Send, {Enter}
	; Rbutton up::             send % Mouse_RbuttonUP() 
	Rbutton UP::      2Tap() ;      send % Mouse_RbuttonUP() 
	; rbutton up::					2tap()
	rshift & Appskey::			return
;;	___Lbuton:
	F19 & \:: 								Sendpassword()
	^+6::
	F19 & /::        	 				OCR()
	Lbutton & F20::          	Send % BlockRepeat() "{shiftdown}{ctrldown}{4}{ctrlup}{shiftup}"
	lbutton & lwin::
	Lbutton & Mbutton:: send, {lbutton up}^x         	;cut selected word
	lbutton & Lalt::
	Lbutton & Numlock::     ; cut selected word and paste clipboard
	send, {lbutton up}
	preclip:=clipboard
	clipboard:=
	send, ^x
	Clipwait, 0.25
	postclip:=clipboard
	clipboard:=
	clipboard:=Preclip
	clipwait, 0.25
	send, ^v     
	clipboard:=PostClip
	return   	

	Lbutton & F19::          	Send % BlockRepeat() "{shiftdown}{ctrldown}{3}{ctrlup}{shiftup}" ; a pic take 
	Lbutton & Space::       	Send, ^a
	Lbutton & Rbutton::       Send, ^a
	F19 & lbutton::       		send, {shiftdown}{ctrldown}{4}{ctrlup}{shiftup}
	F20 & lbutton::       		send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}
	Lbutton & down::          Send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}
	F11::F22


;; ________KEY_DEFAULT:

	;#b::clip.Append(A_space)
	;;	___Esc:
	esc & 1::						send, {shiftdown}{altdown}{-}{altup}{shiftup}
	esc & 2::						send, {shiftdown}{altdown}{=}{altup}{shiftup}
	esc & 3::						send, {shiftdown}{altdown}{0}{altup}{shiftup}
	esc::								esc
	F17::								send, {ctrl down}{click}{ctrl up}
	Media_Prev::					MakeTransparent()
	Media_Play_Pause::			F16
	Media_Next::						F17
	F13 & -::
	/ & down::   		      	Varbar.SubIteration(0)
	F13 & +::
	/ & up::							Varbar.AddIteration(0)
	F13 & wheelright::			Varbar.AddIteration(250) 
	F13 & wheelleft::   			Varbar.SubIteration()
	F13 & wheelup::				send % Blockrepeat(300) Varbar.AddIteration() 
	F13 & wheeldown::   			send % Blockrepeat(300) Varbar.SubIteration()
	numpadsub::          		4Left()
	numpadadd::          		4right()
	numpadMult::         		4up()
	numpaddot::          		CloseWindow()
	pause::							Suspend, Toggle 
	; F15 & Lbutton::				send, {shiftdown}{ctrldown}{5}{ctrlup}{shiftup}
	F16 & Lbutton::				send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}							

	$#F7::							Send, {lwindown}{right}{lwinup}
	$#F6::							Send, {lwindown}{left}{lwinup}
	$#F9::							Send, {lwindown}{up}{lwinup}
	$#F8::							Send, {lwindown}{down}{lwinup}
	$!F7::							Send, {laltdown}{right}{laltup}
	$!F6::							Send, {laltdown}{left}{laltup}
	$!F9::							Send, {laltdown}{up}{laltup}
	$!F8::							Send, {laltdown}{down}{laltup}
	+Backspace::					backspace
	<+^z::							Send, {Ctrldown}{y}{CtrlUp} ;redu

	~rshift & lshift::shiftAltTab
	~lshift & Rshift::alttab	

	lshift & Appskey::			return
	Lctrl & Appskey::				Return
	<^`;::
	FormatTime, CurrentDateTime,, MM/d/yy
	SendInput %CurrentDateTime%
	return
	
	^Media_Next::					MakeTransparent()
	/ & .::							Send, {?}
	/::	 							Send, /

	; ` & space::						Test(Iteration) 
	` & 1::							Test(1)
	` & 2::							Test(2)
	` & 3::							Test(3)
	` & 4::							Test(4)
	`::	 								sendraw, ``
	; <!c::                      clip.Append()


	;;F20:
	F20 & \::            		Sendpassword()
	F20 & wheeldown::				send % Blockrepeat(500) "{numpadDot}"
	F20 & wheelup::				send % Blockrepeat(500) "{numpadmult}"

	F13 & esc::						Varbar.reset()	
	F20 & ]::            		CreditCard()
	F20 & Insert::       		Clip("OCR")
	F20 & F7::           		Excel.NextSheet()
	F20 & F6::           		Excel.PrevSheet()
	F20 & esc::     				run, Taskmgr.exe
	F20 & backspace::    		Send, {delete}
	F20 & .::            		WindowInfo()

	F20 & =::            		Send,{CtrlDown}{=}{Ctrlup}
	F20 & -::            		Send,{CtrlDown}{-}{Ctrlup}
	F19 & enter::					varbar.focus("Edit1")
	F20 & enter::					varbar.focus("Edit2")
	F20 & F19::          		Send, {F22}

	F19 & Media_Play_pause::
			my_screenwidth:=A_ScreenWidth-215
			my_screenheight:=A_Screenheight-115
			IniWrite, %my_screenwidth%, data.ini, Locations, Notes_x
			IniWrite, %my_screenheight%, data.ini, Locations, Notes_y
			Return
	

	F13 & `::					Test(iteration)



#If (A_PriorHotKey = "F20 & up" || A_PriorHotKey = "F20 & Down" || A_PriorHotKey = "F20 & left" || A_PriorHotKey = "F20 & right") && (A_TimeSincePriorHotkey < 2000) ;;	 ___Doubletap F20 & arrows
	$rshift::               Send, {tab}
	F20 & up::	           Send, {enter}
	F20 & down::           Send, {enter}
	F20 & left::           Send, {enter}
	F20 & right::          Send, {enter}
#if 






#IfWinActive, ahk_exe explorer.exe ;;	___explorer:
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


#IfWinActive, ahk_exe WINWORD.EXE ;; 	___WORD
	F13 & space::					SendInput, +{tab}{tab}
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
		

#ifwinactive, ahk_exe Snipaste.exe ;;	___Snipaste
	wheeldown::send % Blockrepeat(100) "{-}"
	wheelup::send % Blockrepeat(100) "{=}"
	^wheeldown::send, ^{wheeldown}
	^wheelup::send, ^{wheelup}

#IfWinActive, Mats LMS Workbook.xlsb ;; 	___Excel
	F9::    					Excel.Connect(1)
	F19 & space::    			Excel.CopySheetName()
	F19 & backspace::    delete
	; F19::

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
	; Numlock::Send, {shiftdown}{F9}{shiftup}
	; F9::                 excel.search()
	F9::						3tap()
	F7::                 excel.Search()
	+Enter::             SendInput, {altdown}{enter}{altup}
	$Enter::             SendInput,{enter}
	F8::                 Send,{shiftDown}{Ctrldown}{u}{CtrlUp}{ShiftUp}
	Media_Prev::         Send,{LWindown}{tab}{lwinup}
	F19 & F7::           ^F8 ;Excel.NextSheet()
	F19 & F6::           ^F9 ;Excel.PrevSheet()
	; F19::									Send, ^v
#ifwinactive, Find and Replace ahk_exe EXCEL.EXE,
	return::             SendInput, !{i}
	rbutton & Lbutton::  SendInput, !{i}
#ifwinactive, Formula Updates.xlsm - Excel
	F13::
	Mbutton::
	SendInput, MM{tab}
	FormatTime, CurrentDateTime,, MM/d/yy
	SendInput %CurrentDateTime%
	return

	#IfWinActive, ahk_exe OUTLOOK.EXE ;; 	___OUTLOOK
	F19 & enter::        Send, {ctrldown}{enter}{ctrlup}
	<+F20::       		   SendInput % Trim(Batch, OmitChars = " `n") " is updated in LMS.{ShiftDown}{Ctrldown}{left 2}{CtrlUp}{ShiftUp}"	
	<+F19::       		   SendInput % Trim(Product, OmitChars = " `n")	
	F20 & F19::          SendInput % Trim(Batch, OmitChars = " `n") " is updated in LMS.{ShiftDown}{Ctrldown}{left 3}{CtrlUp}{ShiftUp}"	

	numpadmult::
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
	F13::						return ; clip.IfNothingSelected("menu")

#Ifwinactive, Affinity Photo ahk_exe Photo.exe
	Numlock::				Send, {Backspace}	
	F19::						Send, ^{click}
	


#ifwinexist, Touchpoint | Microsoft Teams ;; 	___Teams
Numlock::
winactivate, Microsoft Teams
send, {shiftdown}{ctrldown}{m}{ctrlup}{shiftup}
return


#ifwinactive, OneNote for Windows 10 ;; 	___OneNote
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


#IfWinActive, Remote Desktop Connection ;;	___Remote_DESKTOPs:
#ifwinactive, ahk_class #32770
	F19::              menu.Remote_Login()
#ifwinactive, ahk_class TscShellContainerClass
	F19::            	 menu.Remote_Desktop()



;  #IfWinActive, Introduction to JasperReports



 #IfWinActive, ahk_exe firefox.exe ;; 	___Firefox
 numpaddot::	      sendInput, ^w
 F6::				   	SendInput, !{left}
 F7::				   	Send, !{right}
 F13::				  	Send, {ctrldown}{/}{ctrlup}
;  +F13::				 	Send, {esc}
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





GetAllBatches(){
  global
  regBatches:=[]
  pos=0
  while pos := RegexMatch(Clipboard, "i)\b\d{3}-\d{4}\b", aBatch, pos+1) ; {
    ; if aBatch
      regBatches.insert(aBatch)
  ; }
      AllBatches:=[], oTemp := {}
      for vKey, vValue in regBatches
      {
          if (ObjGetCapacity([vValue], 1) = "") ;is numeric
          {
              if !ObjHasKey(oTemp, vValue+0)
                  AllBatches.Push(vValue+0), oTemp[vValue+0] := ""
          }
          else
          {
              if !ObjHasKey(oTemp, "" vValue)
                  AllBatches.Push("" vValue), oTemp["" vValue] := ""
          }
        }
    AllBatches:=Listarray(AllBatches,"")
    AllBatches:= StrReplace(AllBatches, A_space A_space, A_space)
    GuiControl,Varbar:Text, Note3, %AllBatches%
    ; ControlsetText, Edit8,%AllBatches%,VarBar
		IniWrite, %AllBatches%, data.ini, Notes, note3
    Sendinput, %AllBatches%
    ; msgbox, %AllBatches%,
}
GetAllProducts(Delimiter:=" "){
  global
  regProducts:=[]
  pos=0
  while pos := RegexMatch(Clipboard, "i)[abdefghijkl]\d{3}\b", aProduct, pos+1) ; {
    ; if aBatch
      regProducts.insert(aProduct)
  ; }
      AllProducts:=[], oTemp := {}
      for vKey, vValue in regProducts
      {
          if (ObjGetCapacity([vValue], 1) = "") ;is numeric
          {
              if !ObjHasKey(oTemp, vValue+0)
                  AllProducts.Push(vValue+0), oTemp[vValue+0] := ""
          }
          else
          {
              if !ObjHasKey(oTemp, "" vValue)
                  AllProducts.Push("" vValue), oTemp["" vValue] := ""
          }
        }
    AllProducts:=Listarray(AllProducts,"")
    AllProducts:= StrReplace(AllProducts, A_space A_space, Delimiter)
    GuiControl,Varbar:Text, Note2, %AllProducts%
    ; ControlsetText, Edit7,%AllProducts%,VarBar
    IniWrite, %AllProducts%, data.ini, Notes, note2
    clipboard:=AllProducts
    sleep 200
    send, ^v
    ; Send, {blind}%AllProducts%

    ; msgbox, %AllProducts%,
}









