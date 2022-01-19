return


#ifwinactive,

F22::return
F24::return
; Scrolllock::Scrolllock
Ins::flovar()

	Tab & lbutton::
		send, {ctrldown}
		click left
		send, {ctrlup}
		return
	; <^1::                 return
	; <^2::                 return ;,{ctrldown}{2}{ctrlup}
	; <^3::                 return ;Send,{ctrldown}{0}{ctrlup}
	; ~Lctrl & 1::gosub, Product_cyclebackward
												; if Getkeystate("LControl","p")
													; GetAllProducts()
												; else
													; sendinput,%product%
												; return


	F13 & 2::
												if Getkeystate("LControl","p")
													GetAllBatches()
												else
													sendinput, %Batch%
												return
	F13 & 3::							sendinput, %Lot%
	F13 & 4::							GetAllProducts()
	F13 & 5::							GetAllBatches()
	3::3

	$tab::										send, {tab}
	Lbutton & tab::						sendinput, {shiftdown}{ctrldown}{\}{ctrlup}{shiftup} ;switch column select
	q & tab::                 Sendinput,{ctrldown}{[}{ctrlup}
	q & u::										Sendinput, {q}{u}
	q::q
	`::`
; sendlevel
;;	___ClipCopy&Paste
; F13 & Mbutton::

+^c::											clip.Append()
!^c:: 										clip.Append(A_Space)
!^x:: 										send % clip.Append() "{backspace}"
;; moved over from Vim ____________________________________________________
	F19 & m::              	numpad1
	F19 & ,::              	numpad2
	F19 & .::              	numpad3
	F19 & j::              	numpad4
	F19 & k::              	numpad5
	F19 & l::              	numpad6
	F19 & u::              	numpad7
	F19 & /::              	sendinput, {tab}
	F19 & i::              	numpad8
	F19 & o::              	numpad9
	F19 & `;::             	Sendinput,{numpad0}
	F19 & y::              	sendinput, +{Tab}
	F19 & p::              	numpad0
	F19 & =::              	-
	F19 & -::              	-
	F19 & [::              	left
	F19 & ]::              	right
	F19 & h::              	sendinput, {,}
	F19 & n::              	sendinput, {.}
	F19 & 8::              	sendinput, {*}
	F19 & 0::              	sendinput, {-}
	F19 & '::              	numpad0
	F19 & Backspace::      	backspace
	; F19 & ENTER::        	  Sendinput,{enter}
	F19 & RShift::         	Sendinput,{Tab}
+#s::											send, {lwindown}{s}{lwinup}
	$lwin::									return
	#F6::										#left
	#a::										#left
	#F7::										#right
	#d::										#right
	#F8::										#down
	#s::										#down
	#F9::										#up
	#w::										#up
	; Lwin & F7::right
	; Lwin & F6::left
	; Lwin & F9::up
	; Lwin & F8::down
	Lwin & wheelup::pgup
	Lwin & wheeldown::pgdn

;; moved over from Vim ____________________________________________________
;; 	___Send Codes___


; >+F20::             			varbar.focus("Batch")
>+F19::            					varbar.focus("Product")
<+F19::											Sendinput, {_}
F19 & left::								GetAllProducts()
F19 & down::								GetAllBatches()
F19 & up::									Sendinput % excel.GetAllSheets()
; F13 & Space::								GetAllProducts()
!w::												Sendinput, {up}
!s::												Sendinput, {down}
!a::												Sendinput, {left}
!d::												Sendinput, {right}
!q::												sendinput, {backspace}
!e::												sendinput, {delete}
<#Space::										GetAllProducts()
<!Space::										GetAllBatches()
<#F13::											GetAllProducts("`n")
<!F13::											GetAllBatches("`n")
<#enter::										GetAllProducts("`n")
rwin::return
<#tab::										GetAllProducts(A_tab)
Scrolllock::							suspend ;SetCapsLockState % !GetKeyState("CapsLock", "T")
Numlock::								  4tap()
;;	___Lbuton:
Lbutton & F19::          	Send % BlockRepeat() "{shiftdown}{ctrldown}{2}{ctrlup}{shiftup}"
Lbutton & F20::						send, {shiftdown}{ctrldown}{4}{ctrlup}{shiftup} ;snip and pin


F19 & lbutton::       		send, {shiftdown}{ctrldown}{2}{ctrlup}{shiftup} ;snipaste
F19 & Rbutton::       		clip("OCR")

F20 & lbutton::       		send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup} ;snipaste copy
; Lbutton & Mbutton:: 			send, {lbutton up}^x         	;cut selected word
Mbutton::									3Tap()
Rbutton & Mbutton::				menu.PasteStuff()
Rbutton & Lbutton:: 			Send, {Enter}
Rbutton UP::     	   			2Tap()
Rbutton & F6::
Rbutton & wheelleft::     Send % blockRepeat(50) "{Delete}"
Rbutton & F7::
Rbutton & wheelright::    Send % blockRepeat(50) "{backspace}"
Rbutton & wheeldown::     Send, ^{v}
Rbutton & wheelup::			  sendinput, ^c

Lbutton & Rbutton::       send, ^{x}
; Lbutton & Space::       	Send, {home}{shiftdown}{end}{shiftup}{ctrldown}{c}{ctrlup}

~rbutton & Appskey::				2Tap()
~Rbutton::								return
rshift & Appskey::				return
F19 & \:: 								Sendpassword()
^+7::
Lbutton & / up::				 	clip("OCR")
F20 & /::        	 				clip("OCR")




;;	___Esc:
	esc & 1::						send, {shiftdown}{altdown}{-}{altup}{shiftup}
	esc & 2::						send, {shiftdown}{altdown}{=}{altup}{shiftup}
	esc & 3::						send, {shiftdown}{altdown}{0}{altup}{shiftup}
	esc::								esc
	F17::								Clipboard:=ExampleString
	; Media_Prev::						F15 ;MakeTransparent()
	; Media_Play_Pause::			F16
	F15::
	if A_DebuggerName || DebuggingScript
	{
			ControlSend, , {F11}, ahk_exe Code.exe
			}
		else
			ControlSend, , ^{F15}, ahk_exe Code.exe
			return
	; Media_Next::						F17
	numpadsub::          		4Left()
	numpadadd::          		4right()
	numpadMult::         		4up()
	numpaddot::          		4down()
	pause::							Suspend, Toggle
	<^f::
		if MouseIsOver("ahk_exe Code.exe"){
			FlashScreen("Find")
			If !winactive("ahk_exe Code.exe"){
				winactivate, ahk_exe Code.exe
				sleep 100
			}
			sendinput, {ctrldown}{f}{ctrlup}
			return
		}
		else
		sendinput, ^{f}
		return

	#h::return ;send, !{F2}
	#p::return ;send, +!{h}
	#k::return
	; Lwin::									vkFF
	;; _System actions_
	+^Rbutton::clip("OCR")
	!F7::							Send, {laltdown}{right}{laltup}
	!F6::							Send, {laltdown}{left}{laltup}
	!F9::							Send, {laltdown}{up}{laltup}
	!F8::							Send, {laltdown}{down}{laltup}
	; ~lshift & Rshift::alttab
	; ~rshift & lshift::shiftaltTab
	<!z::							Send, {ctrldown}{y}{ctrlup} ;redu

	+Backspace::			Delete
	^Media_Next::			MakeTransparent()

	lshift & Appskey::			return
	;Lctrl & Appskey::				Return
	<^`;::
		if !winactive("ahk_exe Code.exe")
			Sendinput %CurrentDateTime%
		else
					send, {ctrldown};}{ctrlup}
		return
	/ & .::						Send, {?}
	/::	 							Send, /

	` & F13::					Test(iteration)
	` & 1::							Test(1)
	` & 2::							Test(2)
	` & 3::							Test(3)
	` & 4::							Test(4)
	` & 5::							Test(5)
	` & 6::							Test(6)
	F13 & `::						menu.ProductSelection()
	F13 & esc::
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
	F19 & enter::					Varbar.focus("Edit1")
	F20 & enter::					Varbar.focus("Edit2")
	; F20 & F19::          	Varbar.focus("Edit1")





#if


#Ifwinactive, ahk_exe explorer.exe ;;	___explorer:

	F6::   			sendinput % BlockRepeat(800) "^{e}" product  "{enter}" ;              	Send, {altdown}{left}{altup}
	F7::				Sendinput, ^{e}%product%{enter}
	; F9::ExplorerSearch(Product)
	^w::									4down()
#ifwinactive, ahk_exe Notion.exe
	^h::sendinput, {shiftdown}{ctrldown}{h}{ctrlup}{shiftup}
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


#ifwinactive, AHK RegEx Tester v2.1
	F13 & k::
	up::sendinput, +{tab}
	F13 & j::
	down::sendinput, {tab}
#ifwinexist, CodeQuickTester*
Media_Play_Pause::
if !winactive("CodeQuickTester*")
	WinActivate,
	if Toggle
	send, !k
	else
	send, !r
	Toggle:=!Toggle
	return


#ifwinactive, ahk_exe Snipaste.exe ;;	___Snipaste
	wheeldown::send % Blockrepeat(100) "{-}"
	wheelup::send % Blockrepeat(100) "{=}"
	^wheeldown::send, ^{wheeldown}
	^wheelup::send, ^{wheelup}
	^+2::send, {Mbutton}
	F15::send, {Mbutton}

#Ifwinactive, Mats LMS Workbook.xlsb ;; 	___Excel
	Numpadmult::send, {Home}
	F9::    3up() ;					Excel.Connect(1)
	F13 & 1::    	LMS.searchBar(Product)
	F19 & backspace::    delete
	F19 & space::    Backspace
	; F19::
	F15::sendinput, {pgup}
	; F19 & down::         ^down
	; F19 & up::           ^up
	; F19 & left::         ^left
	; F19 & right::        ^right
	F7::                 Excel.NextSheet()
	F6::                 Excel.PrevSheet()
	F13 & u::sendinput, {shiftdown}{altdown}{ctrldown}{[}{ctrlup}{altup}{shiftup}
	F13 & n::sendinput, {shiftdown}{altdown}{ctrldown}{]}{ctrlup}{altup}{shiftup}

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
	F9::						3up()
	F7::                 excel.Search()
	+Enter::             Sendinput, {altdown}{enter}{altup}
	$Enter::             Sendinput,{enter}
	F8::                 Send,{shiftdownwn}{ctrldown}{u}{ctrlup}{Shiftup}
	Media_Prev::         Send,{Lwindown}{tab}{lwinup}
	F19 & F7::           ^F8 ;Excel.NextSheet()
	F19 & F6::           ^F9 ;Excel.PrevSheet()
	; F19::									Send, ^v
#ifwinactive, Find and Replace ahk_exe EXCEL.EXE,
	enter::
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
	Numlock::sendinput, %Batch% is updated.
	numpadmult::

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
	; Numlock::				Send, {Backspace}
	F19::						Send, ^{click}





#ifwinactive, Touchpoint | Microsoft Teams ;; 	___Teams
; Numlock::MuteTeamsMicrophone()
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
;  F6::				   	Sendinput, !{left}
	;mbutton::space
	F6::sendinput, {altdown}{left}{altup}
	F7::sendinput, {altdown}{right}{altup}
	F8::sendinput, {shiftdown}{ctrldown}{tab}{ctrlup}{shiftup}
	F9::sendinput, {ctrldown}{tab}{ctrlup}
;  F7::				   	Send, !{right}
 F13::				  	Send, {ctrldown}{/}{ctrlup}
;  +F13::				 	Send, {esc}
 numpadadd::sendinput, {lwindown}{right}{lwinup}
 numpaddot::sendinput, {ctrldown}{w}{ctrlup}
 numpadsub::sendinput, {lwindown}{left}{lwinup}
 numpadmult::sendinput, {lwindown}{up}{lwinup}



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





GetAllBatches(Delimiter:=" ",File:=""){
  global
  regBatches:=[]
			if (File){
		clipboard:=
		FileRead, Haystack, %File%
	}
	else
		Haystack:=Clipboard
		sleep 50
  while pos := RegexMatch(Haystack, "i)(?<!Ct#)\b\d{3}-\d{4}\b", aBatch, pos+1) ; {
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
GetAllProducts(Delimiter:=" ",File:=""){
  global
  regProducts:=[]
  pos=0
	if (File){
		clipboard:=
		FileRead, Haystack, %File%
	}
	else
		Haystack:=Clipboard
		sleep 50
  while pos := RegexMatch(Haystack, "i)[abdefghijkl]\d{3}\b", aProduct, pos+1) ; {
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

		Return AllProducts
    ; Send, {blind}%AllProducts%

    ; msgbox, %AllProducts%,
}









