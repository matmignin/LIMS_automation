return

#ifwinactive,
	F13 & Lbutton::
		click down left
		keywait F13
		click up left
		return
	Tab & lbutton::
		send, {ctrldown}
		click left
		send, {ctrlup}
		return
	Tab & wheeldown::sendinput, ^{down}
	Tab & wheelup::sendinput, ^{up}
	Tab & wheelleft::^[
	Tab & wheelright::^]
	<^1::                 return
	<^2::                 return ;,{ctrldown}{2}{ctrlup}
	<^3::                 return ;Send,{ctrldown}{0}{ctrlup}
	F13 & 1::							sendinput,%product%
	F13 & 2::							sendinput, %Batch%
	F13 & 3::							sendinput, %Lot%
	F13 & 4::							GetAllProducts()
	F13 & 5::							GetAllBatches()

; sendlevel
;;	___ClipCopy&Paste
; F13 & Mbutton::
+F20::
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
; F13 & Rbutton::
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
		Clip.EditBox()
		}
		else if (PastePresses > 2)
		{
				Send, +{F18}
				; send, #v
		}
		PastePresses := 0
return
+^c::clip.Append()
!^c:: clip.Append(A_Space)
!^x:: send % clip.Append() "{backspace}"




;; 	___Send Codes___


; >+F20::             	varbar.focus("Batch")
>+F19::            		varbar.focus("Product")
<+F19::								Sendinput, {_}
F20 & left::					sendInput % product
F20 & down::					sendInput % Batch
F20 & right::					sendInput % Lot
F20 & up::						sendInput % Coated
F13 & `::										menu.ProductSelection()
F19 & left::								GetAllProducts()
F19 & down::								GetAllBatches()
F19 & up::									Sendinput % excel.GetAllSheets()
; F13 & Space::								GetAllProducts()
<#Space::										GetAllProducts()
<!Space::										GetAllBatches()
<#F13::											GetAllProducts("`n")
<!F13::											GetAllBatches("`n")
<#enter::										GetAllProducts("`n")
rwin::return
<#tab::										GetAllProducts(A_tab)
Scrolllock::							suspend ;SetCapsLockState % !GetKeyState("CapsLock", "T")
$Numlock::								4tap()
Mbutton::									3Tap()
Rbutton & Mbutton::				menu.PasteStuff()
Rbutton & Lbutton:: 			Send, {Enter}
Rbutton UP::     	   			2Tap()
Rbutton & wheelleft::     Send % blockRepeat(50) "{Delete}"
Rbutton & wheelright::    Send % blockRepeat(50) "{backspace}"
Rbutton & wheelup::
Send % Blockrepeat(800) "^{c}" pop(Clipboard,,1000,"window")
sleep 20
; pop(Clipboard,,1000,"window")
return
Rbutton & wheeldown::     Send, ^{v}
Lbutton & Rbutton::       send, ^{x}
Lbutton & Space::       	Send, {home}{shiftdown}{end}{shiftup}{ctrldown}{c}{ctrlup}

rbutton & Appskey::				2Tap()
rshift & Appskey::				return
F19 & \:: 								Sendpassword()
^+7::
;;	___Lbuton:
Lbutton & F19::          	Send % BlockRepeat() "{shiftdown}{ctrldown}{2}{ctrlup}{shiftup}"
Lbutton & F20::          	clip("OCR") ;Send % BlockRepeat() "{shiftdown}{ctrldown}{4}{ctrlup}{shiftup}"
; Lbutton & Mbutton:: 			send, {lbutton up}^x         	;cut selected word

F20 & /::        	 				clip("OCR")

F19 & lbutton::       		send, {shiftdown}{ctrldown}{4}{ctrlup}{shiftup}
F20 & lbutton::       		send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}



;;	___Esc:
	esc & 1::						send, {shiftdown}{altdown}{-}{altup}{shiftup}
	esc & 2::						send, {shiftdown}{altdown}{=}{altup}{shiftup}
	esc & 3::						send, {shiftdown}{altdown}{0}{altup}{shiftup}
	esc::								esc
	F17::								Clipboard:=ExampleString
	Media_Prev::						F15 ;MakeTransparent()
	Media_Play_Pause::			F16
	Media_Next::						F17
	numpadsub::          		4Left()
	numpadadd::          		4right()
	numpadMult::         		4up()
	numpaddot::          		4down()
	pause::							Suspend, Toggle
	#h::return ;send, !{F2}
	#p::return ;send, +!{h}
	#k::return
	Lwin::									vkFF
	;; _System actions_

	!F7::							Send, {laltdown}{right}{laltup}
	!F6::							Send, {laltdown}{left}{laltup}
	!F9::							Send, {laltdown}{up}{laltup}
	!F8::							Send, {laltdown}{down}{laltup}
	~lshift & Rshift::alttab
	~rshift & lshift::shiftaltTab
	<!z::							Send, {ctrldown}{y}{ctrlup} ;redu

	+Backspace::			Delete
	^Media_Next::			MakeTransparent()

	lshift & Appskey::			return
	Lctrl & Appskey::				Return
	<^`;::Sendinput %CurrentDateTime%
	/ & .::						Send, {?}
	/::	 							Send, /

	` & F13::					Test(iteration)
	` & 1::							Test(1)
	` & 2::							Test(2)
	` & 3::							Test(3)
	` & 4::							Test(4)
	` & 5::							Test(5)
	` & 6::							Test(6)
	` & esc::						Varbar.reset()
	`::	 								sendraw, ``


	;; _F20_
	F20 & \::            		Sendpassword()
	F20 & wheeldown::				send % Blockrepeat(500) "{numpadDot}"
	F20 & wheelup::				send % Blockrepeat(500) "{numpadmult}"


	F20 & ]::            		CreditCard()
	F20 & F7::           		Excel.NextSheet()
	F20 & F6::           		Excel.PrevSheet()
	F20 & esc::     				run, Taskmgr.exe
	F20 & backspace::    		Send, {delete}
	F20 & .::            		windowInfo()

	F20 & =::            		Send,{ctrldown}{=}{ctrlup}
	F20 & -::            		Send,{ctrldown}{-}{ctrlup}
	F19 & enter::					varbar.focus("Edit1")
	F20 & enter::					varbar.focus("Edit2")
	F20 & F19::          		Send, +{F18}





#if


#Ifwinactive, ahk_exe explorer.exe ;;	___explorer:
	F19 & space::   send % BlockRepeat(400) "^{e}" product  "{enter}" ;              	Send, {altdown}{left}{altup}
	F6::   			sendinput % BlockRepeat(800) "^{e}" product  "{enter}" ;              	Send, {altdown}{left}{altup}
	F7::				Sendinput, ^{e}%product%{enter}
	F9::ExplorerSearch(Product)
	^w::									4down()

 #ifwinactive, Connection Information
	mbutton::sendinput, doR314Nle{enter}
#Ifwinactive, ahk_exe WINWORD.EXE ;; 	___WORD
	F13 & space::			Sendinput, +{tab}{tab}
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
	^+2::send, {Mbutton}
	F15::send, {Mbutton}

#Ifwinactive, Mats LMS Workbook.xlsb ;; 	___Excel
	Numpadmult::send, {Home}
	F9::    					Excel.Connect(1)
	F19 & space::    	LMS.searchBar(Product)
	F19 & backspace::    delete
	; F19::
	F15::sendinput, {pgup}
	F16::sendinput, {pgdn}
	; F19 & down::         ^down
	; F19 & up::           ^up
	; F19 & left::         ^left
	; F19 & right::        ^right
	F7::                 Excel.NextSheet()
	F6::                 Excel.PrevSheet()
	F13 & u::sendinput, {ctrldown}{up}{ctrlup}
	F13 & n::sendinput, {ctrldown}{down}{ctrlup}

	numpaddot::
								excel.Connect(1)
								ExplorerSearch(Product)
								return

#ifwinactive, Excel ahk_exe WFICA32.EXE
	; F9::						winMove, A, , A_ScreenWidth/3, 0, A_ScreenWidth/3, A_ScreenHeight/4
	F6::						winMove, A, , A_ScreenWidth/3, 0, A_ScreenWidth/3, A_ScreenHeight/4
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
	+Enter::             Sendinput, {altdown}{enter}{altup}
	$Enter::             Sendinput,{enter}
	F8::                 Send,{shiftdownwn}{ctrldown}{u}{ctrlup}{Shiftup}
	Media_Prev::         Send,{Lwindown}{tab}{lwinup}
	F19 & F7::           ^F8 ;Excel.NextSheet()
	F19 & F6::           ^F9 ;Excel.PrevSheet()
	; F19::									Send, ^v
#ifwinactive, Find and Replace ahk_exe EXCEL.EXE,
	return::             Sendinput, !{i}
	rbutton & Lbutton::  Sendinput, !{i}
#ifwinactive, Formula updates.xlsm - Excel
	F13::
	; Mbutton::
	Sendinput, MM{tab}
	FormatTime, CurrentDateTime,, MM/d/yy
	Sendinput %CurrentDateTime%
	return

	#Ifwinactive, ahk_exe OUTLOOK.EXE ;; 	___OUTLOOK
		F13 & 1::							sendinput,%product%%A_space%
	F13 & 2::							sendinput, %Batch%%A_Space%
	F13 & 3::							sendinput, %Lot%%A_space%
	F19 & enter::        Send, {ctrldown}{enter}{ctrlup}
	<+F20::       		   Sendinput % Trim(Batch, OmitChars = " `n") " is updated in LMS.{Shiftdownwn}{ctrldown}{left 2}{ctrlup}{Shiftup}"
	; <+F19::       		   Sendinput % Trim(Product, OmitChars = " `n")
	;F20 & F19::          Sendinput % Trim(Batch, OmitChars = " `n") " is updated in LMS.

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
Numlock::MuteTeamsMicrophone()
F15::MuteTeamsMicrophone()

#ifwinactive, OneNote for windows 10 ;; 	___OneNote
	^1::                 Send,{altdown}{ctrldown}{1}{ctrlup}{altup}
	^2::                 Send,{altdown}{ctrldown}{2}{ctrlup}{altup}
	^3::                 Send,{altdown}{ctrldown}{0}{ctrlup}{altup}
	^4::                 Send,{ctrldown}{1}{ctrlup}
	^5::                 Send,{ctrldown}{3}{ctrlup}
	^`::                 Send,{altdown}{ctrldown}{0}{ctrlup}{altup}

#Ifwinactive, ahk_exe ONENOTE.EXE
	F9::                 Send,{altdown}{w}{i}{altup}
	F6::                 Sendinput,{wheelleft 20}
	F7::                 Sendinput,{Wheelright 10}
	^1::                 Send,{altdown}{ctrldown}{1}{ctrlup}{altup}
	^2::         	        Send,{altdown}{ctrldown}{2}{ctrlup}{altup}
	^3::                 Send,{altdown}{ctrldown}{3}{ctrlup}{altup}
	^4::                 Send,{ctrldown}{1}{ctrlup}
#Ifwinactive,


; #Ifwinactive, Remote Desktop Connection ;;	___Remote_DESKTOPs:
; #ifwinactive, ahk_class #32770
	; F19::              menu.Remote_Login()
; #ifwinactive, ahk_class TscShellContainerClass
	; F19::            	 menu.Remote_Desktop()



;  #Ifwinactive, Introduction to JasperReports



 #Ifwinactive, ahk_exe firefox.exe ;; 	___Firefox
 numpaddot::	      sendInput, ^w
;  F6::				   	Sendinput, !{left}
	;mbutton::space
	F6::sendinput, +{wheelleft 10}
	F7::sendinput, +{wheelright 10}
	F8::sendinput, +{wheeldown 10}
	F9::sendinput, +{wheelup 10}
;  F7::				   	Send, !{right}
 F13::				  	Send, {ctrldown}{/}{ctrlup}
;  +F13::				 	Send, {esc}
 numpadadd::send, {lwindown}{right}{lwinup}
 numpadsub::send, {lwindown}{left}{lwinup}
 numpadmult::send, {lwindown}{up}{lwinup}


#ifwinactive, Map VQ drive.bat ahk_exe cmd.exe


ExplorerSearch(text){
		;excel.connect(1)
		AllLabelCopy:="C:\Users\mmignin\Desktop\Desktop Stuff\Label Copy\All Label Copy"
		Searchwindow:="search-ms:displayname"
		IfwinNotExist, %Searchwindow% && ifwinNotexist, %AllLabelCopy%
			return
		;  Run, %AllLabelCopy%
		; IfwinNotExist, ahk_exe explorer.exe && ifwinNotexist, %AllLabelCopy%										Run, %AllLabelCopy%
			; run, %AllLabelCopy%
		IfwinExist, %Searchwindow%
			winactivate, %AllLabelCopy%
		winwait, %AllLabelCopy%, ,2
		if errorlevel
			winactivate, ahk_exe explorer.exe
		sleep 300
		winGetPos, wX, wY, wW, wH, A
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
				Direction:="{down}+{tab}{Tab}"
		send % Entry Direction "{ctrlup}{altup}{shiftup}"
	}





GetAllBatches(Delimiter:=" "){
  global
  regBatches:=[]
  pos=0
	PreventPopup:=1
		; PreClipboard:=clipboardAll
		;clipboard:=
		; FileRead, clipboard, Data\CurrentCodes.txt
  while pos := RegexMatch(Clipboard, "i)(?<!Ct#)\d{3}-\d{4}\b", aBatch, pos+1) ; {
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
    AllBatches:= StrReplace(AllBatches, A_space A_space, Delimiter)
    ; GuiControl,Varbar:Text, Note3, %AllBatches%
    ; ControlsetText, Edit8,%AllBatches%,VarBar
		FileAppend, AllBatches,Data\Batches.txt

		clipboard:=AllBatches
		sleep 200
		send, ^v
		; Sendinput, %AllBatches%

		PreventPopup:=
		return %AllBatches%
    ; msgbox, %AllBatches%,
}
GetAllProducts(Delimiter:=" "){
  global
  regProducts:=[]
  pos=0
	PreventPopup:=1
	clipboard:=
	FileRead, clipboard, Data\CurrentCodes.txt
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
    ; IniWrite, %AllProducts%, Settings.ini, Notes, note2
    clipboard:=AllProducts
    sleep 200
    send, ^v
		PreventPopup:=

		Return AllProducts
    ; Send, {blind}%AllProducts%

    ; msgbox, %AllProducts%,
}









