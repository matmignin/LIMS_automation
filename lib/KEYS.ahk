#ifwinactive, 
    F19:: 
      if (CopyPresses > 0) ; SetTimer already started, so we log the keypress instead.
      {
          CopyPresses += 1
          return
      }
      CopyPresses := 1
      SetTimer, PressCopy, -350 ; Wait for more presses within a 400 millisecond window.
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
          clip.Append("`n","{x}")
          ; Pop(Clipboard)
      }
    CopyPresses := 0
    return

    ~F21::
      if (PastePresses > 0) ; SetTimer already started, so we log the keypress instead.
      {
          PastePresses += 1
          return
      }
      PastePresses := 1
      SetTimer, PressPaste, -350 ; Wait for more presses within a 400 millisecond window.
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
          clip.Append(A_Space)
          ; Pop(Clipboard)
      }
    PastePresses := 0
    return

	$Numlock::				4tap()
	Mbutton::						3Tap()
			Rbutton & Lbutton::   	Send, {Enter}
		; Rbutton::             ;send % Mouse_RbuttonUP() 
	rbutton up::					2tap()
	rshift & Appskey::			return
;;	___Lbuton:
	F19 & \:: 								Sendpassword()
	F19 & /::        	 				OCR()
	Lbutton & F21::          	Send % BlockRepeat() "{shiftdown}{ctrldown}{4}{ctrlup}{shiftup}"
	Lbutton & F19::          	Send % BlockRepeat() "{shiftdown}{ctrldown}{3}{ctrlup}{shiftup}"
	F19 & lbutton::       		send, {shiftdown}{ctrldown}{4}{ctrlup}{shiftup}
	F21 & lbutton::       		send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}
	; Lbutton & ,::        		 OCR()c
	Lbutton & down::           Send, {shiftdown}{ctrldown}{3}{ctrlup}{shiftup}
	; ~>+lbutton::							Send,{shiftDownG}{click}{shiftup}
	F11::F22
	F12::Send, {altdown}{tab}{altup}


;;		___KEY_DEFAULT:
	+^c::clip.Append()
	!^c::clip.Append(A_Space)
	!^x::send % clip.Append() "{backspace}"
	;#b::clip.Append(A_space)
	;;___Esc:
	esc & 1::						send, {shiftdown}{altdown}{-}{altup}{shiftup}
	esc & 2::						send, {shiftdown}{altdown}{=}{altup}{shiftup}
	esc & 3::						send, {shiftdown}{altdown}{0}{altup}{shiftup}
	esc::								esc
	
	Media_Prev::					MakeTransparent()
	Media_Play_Pause::			F16
	Media_Next::					F17
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
	numpadMult::         		#up
	numpaddot::          		#down
	pause::							Suspend, Toggle 
	; F15::							+tab
	F17::								sendinput, {altdown}{tab}{altup}
	; F16::							Send, !{tab}
	
	F15 & Lbutton::				send, {shiftdown}{ctrldown}{5}{ctrlup}{shiftup}
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
	/ & space::						Send, %Coated%
	/ & .::							Send, {?}
	/ & right::	 					Send, %Lot%
	/::	 							Send, /

	; ` & space::						Test(Iteration) 
	` & 1::							Test(1)
	` & 2::							Test(2)
	` & 3::							Test(3)
	`::	 								sendraw, ``
	; <!c::                      clip.Append()


	;;___F19_And_F21:
	F21 & \::            		Sendpassword()
	F21 & wheeldown::				send % Blockrepeat(500) "{numpadDot}"
	F21 & wheelup::				send % Blockrepeat(500) "{numpadmult}"
	; F19 up::      	       	Clip.paste()

	>+F21::             			varbar.focus("Batch")
	>+F19::            		 	varbar.focus("Product")
	F19 & wheeldown::				Send % Blockrepeat(500) "{F8}"
	F19 & wheelup::				send % Blockrepeat(500) "{F9}"
	F19 & wheelleft::				gosub, F6
	F19 & wheelright::			GoSub, F7  
	F21 & up::						sendInput % Coated
	F21 & right::					sendInput % Lot
	F21 & left::					sendInput % product
	F21 & down::					sendInput % Batch
	F13 & esc::						Varbar.reset()	
	F19 & ]::            		CreditCard()
	F19 & backspace::    		Send,{delete}
	F21 & Insert::       		Clip("OCR")
	F21 & F7::           		Excel.NextSheet()
	F21 & F6::           		Excel.PrevSheet()
	F21 & esc::     				run, Taskmgr.exe
	F21 & backspace::    		Send, {delete}
	F21 & .::            		WindowInfo()

	F21 & =::            		Send,{CtrlDown}{=}{Ctrlup}
	F21 & -::            		Send,{CtrlDown}{-}{Ctrlup}
	F19 & enter::					varbar.focus("Edit1")
	F21 & enter::					varbar.focus("Edit2")
	F21 & F19::          		Send, {F22}

	F19 & Media_Play_pause::
										my_screenwidth:=A_ScreenWidth-215
										my_screenheight:=A_Screenheight-115
										IniWrite, %my_screenwidth%, data.ini, Locations, Notes_x
										IniWrite, %my_screenheight%, data.ini, Locations, Notes_y
										Return
	

	F13 & `::					Test(iteration)


;; ___Doubletap F21 & arrows
#If (A_PriorHotKey = "F21 & up" || A_PriorHotKey = "F21 & Down" || A_PriorHotKey = "F21 & left" || A_PriorHotKey = "F21 & right") && (A_TimeSincePriorHotkey < 2000)
	$rshift::               Send, {tab}
	F21 & up::	           Send, {enter}
	F21 & down::           Send, {enter}
	F21 & left::           Send, {enter}
	F21 & right::          Send, {enter}
#if 














