
#IfWinActive,
;_________________________________________________________________________________________________________________
__________________________________________________________________________________________________KEYBOARD_HOTKEYS: 
;_________________________________________________________________________________________________________________
Rwin::sendinput, {rctrl 2}
Ralt::Rwin
Ralt & Right::sendinput, #{right}
Ralt & Left::sendinput, #{Left}
Ralt & UP::sendinput, #{UP}
Ralt & Down::sendinput, #{Down}
lalt::sendinput, {alt}{alt}
~rshift::sendinput, {shift}
+Ralt::Set_Batch()
+Rwin::Set_ProductCode()
;Ralt::Send_Batch() ;right comm
;Rwin::Send_ProductCode() ;right option
+F12::reload
;\::sendinput, \  
media_prev::SaveRerun()
Media_Play_Pause::
f11::SaveRestart()
Media_Next::run, testing.ahk
+Volume_Up::SaveRestart()

F10::Exitapp

;___________________________________________________________________________________________________________________
______________________________________________________________________________________________________MOUSE_HOTKEYS: 
;___________________________________________________________________________________________________________________

;_________________________________________________________________________
;_________________________________________________________________________RButton
	Rbutton & Wheelup::wheel_cut()
	Rbutton & Wheeldown::wheel_paste()
	Rbutton & WheelLeft::Send_ProductCode()
	Rbutton & WheelRight::Send_Batch()
	Rbutton & Lbutton::Enter
	Rbutton & Mbutton::Esc
	Rbutton & F13::backspace
	Rbutton::Rbutton
;_________________________________________________________________________
;_________________________________________________________________________F13
	F13 & LButton::Sendinput, !#{F3} ;screenshot
	F13 & RButton::^lbutton
	F13 & MButton::Send_Productcode() ;+Lbutton ; sendinput, {F3}
	F13 & WheelLeft::Send_ProductCode()
	F13 & WheelRight::Send_Batch()
	F13 & WheelUp::Send_lot()
	F13 & WheelDown::wheel_paste()
	F13 & F17::Send_batch()
	F13 & F16::Send_ProductCode()
	#If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4000)
		f13::wheel_copy() 
		Wheelup::Set_Lot()
		Wheeldown::sendinput, #v
		F17::Set_ProductCode()
		Wheelleft::Set_ProductCode()
		F16::Set_Batch()
		Wheelright::Set_Batch() 
		mbutton::set_ProductCode()
	#If
	F13:: 
		Tooltip, ☩
		sleep 4000
		tooltip,
		return

;_________________________________________________________________________
;_________________________________________________________________________F15
	#IfWinActive
	F15 & Wheelup::Send_lot()
	F15 & Wheeldown::
	F15 & RButton::+Lbutton
	F15 & LButton::^Lbutton
	F15 & Mbutton:: 
	F15 & Wheelleft::Send_ProductCode()
	F15 & Wheelright::Send_Batch()
	F15::MyMenu()


;_________________________________________________________________________
;_________________________________________________________________________F14
	F14 & WheelRight::#right
	F14 & WheelLeft::#left
	F14 & Wheeldown::Wheel_ZoomOut()
	F14 & wheelup::Wheel_ZoomIn()
	F14 & Lbutton::CloseWindow()
	F14 & Rbutton::#down
	;F14::MouseLocation_Go()
;_________________________________________________________________________
;_________________________________________________________________________MButton
	Mbutton & Rbutton::VariableBar_Relocate()
	Mbutton::Mbutton


	F14 & F15::#tab
	F15 & F14::!^tab

	#IfWinActive,  

	Rbutton & F14::MouseLocation_Show()

MouseLocation_Get() {
	global
	MouseGetPos, MouseLocationX, MouseLocationY
	MouseClick, right,,, 1, 0, D  ; Hold down the left mouse button.
	Loop
	{
	    Sleep, 10
	    if !GetKeyState("Rbutton", "P")  ; The key has been released, so break out of the loop.
		   break
		   MouseGetPos, MouseLocationX, MouseLocationY
		   WinGetTitle, Title, A
		Tooltip, %MouseLocationX% `, %MouseLocationy% `n%Title%

		; ... insert here any other actions you want repeated.
	}
	MouseClick, Right,,, 1, 0, U ; Release the mouse button.
		;WinGetTitle, Title, A
		WinName:=Title
		MousePosition:=MouselocationX "`, " MouselocationY
		Store := [mouselocationx, MouseLocationY]
		
			;DebugWindow(Store[Title],0,0,10,0,0)
	tooltip,
	;msgbox % Store[1] "`n" Title
	return
	}
	
	MouseLocation_Set() {
	global
	;MouseGetPos, MouseX, MouseY
	MouseClick, right,,, 1, 0, D  ; Hold down the left mouse button.
	Loop
	{
	    Sleep, 10
	    if !GetKeyState("Rbutton", "P")  ; The key has been released, so break out of the loop.
		   break
		   MouseGetPos, MouseLocationX, MouseLocationY
		   WinGetTitle, FullWinTitle, A
		Tooltip, %MouseLocationX% `, %MouseLocationy% `n%winTitle%
		; ... insert here any other actions you want repeated.
	}
	tooltip,
	MouseClick, Right,,, 1, 0, U ; Release the mouse button.
		WinTitle:=strreplace(FullwinTitle, A_space,"_")	
		WinTitle:=strreplace(winTitle, "(","")	
		WinTitle:=strsplit(WinTitle,"-","_")
		WinName:= WinTitle[1]
		%WinName%:= {X: MouselocationX, Y: MouselocationY, Win: FullWinTitle}
		;DebugWindow(%WinName%["Win"] "`n" %WinName%["X"] ", " %WinName%["Y"],1,0,10,0,0)
		
	}
	
	
	MouseLocation_Go(){ 
		global
		WinGetTitle, WinTitle, A
		WinTitle:=strreplace(winTitle, A_space,"_")	
		WinTitle:=strreplace(winTitle, "(","")	
		WinTitle:=strsplit(WinTitle,"-","_")
		WinName:= WinTitle[1]
		;%WinName%:= {X: MouselocationX, Y: MouselocationY, Win: WinTitle[1]}
		;%Current_WinName%:= {X: MouselocationX, Y: MouselocationY, Win: FullWinTitle}
		
		MouseX:=%WinName%["X"]
		MouseY:=%WinName%["Y"]
		Click, %mouseX%, %MouseY%
		;DebugWindow(%WinName%["Win"],0,1,10,0,0)
		;DebugWindow(%WinName%["X"] ", " %WinName%["Y"],0,1,10,0,0)
	return
	}
	
	
