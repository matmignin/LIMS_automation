#IfWinActive,
Rwin::RAlt
Ralt::Rwin
Ralt & Right::sendinput, #{right}
Ralt & Left::sendinput, #{Left}
Ralt & UP::sendinput, #{UP}
Ralt & Down::sendinput, #{Down}
lalt::sendinput, {alt}{alt}
~rshift::sendinput, {shift}
+Ralt::Set_Batch()
+Rwin::Set_ProductCode()
Ralt::Send_Batch() ;right comm
Rwin::Send_ProductCode() ;right option

;_________________________________________________________________________RButton
	Rbutton & Wheelup::wheel_cut()
	Rbutton & Wheeldown::wheel_paste()
	Rbutton & WheelLeft::Send_ProductCode()
	Rbutton & WheelRight::Send_Batch()
	Rbutton & Lbutton::Enter
	Rbutton & Mbutton::Esc
	Rbutton & F13::backspace
	Rbutton::Rbutton

;_________________________________________________________________________F13
	F13 & LButton::Sendinput, !#{F3} ;screenshot
	F13 & RButton::^lbutton
	F13 & MButton::+Lbutton ; sendinput, {F3}
	F13 & WheelLeft::Set_ProductCode()
	F13 & WheelRight::Set_Batch()
	F13 & WheelUp::Set_lot()
	F13 & WheelDown::wheel_paste()
	#If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4000)
		f13::wheel_copy() 
		Wheelup::Set_Lot()
		Wheeldown::sendinput, #v
		Wheelleft::Set_ProductCode()
		Wheelright::Set_Batch() 
	#If
	F13:: 
		Tooltip, ☩
		sleep 4000
		tooltip,
		return


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



;_________________________________________________________________________F14
	#If (A_PriorHotKey = "F14" AND A_TimeSincePriorHotkey < 8000)
		f14::!Tab
		Wheelup::
		Wheeldown::sendinput, ^0
		Wheelleft::
		Wheelright::
	#If
	F14 & WheelRight::#right
	F14 & Mbutton::#up
	F14 & WheelLeft::#left
	F14 & Wheeldown::Wheel_ZoomOut()
	F14 & wheelup::Wheel_ZoomIn()
	F14 & Rbutton::CloseWindow()
	F14 & Lbutton::#down
	F14::click, %MouseLocationX%, %MouseLocationY%


Mbutton & Wheeldown::
Mbutton::Mbutton


F14 & F15::!tab
F15 & F14::!^tab

#IfWinActive,  

Rbutton & F14::MouseLocation_Set()

GetMouseLocation() { ;#[Vquest]
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
		windowTitle:=Title
		MousePosition:=MouselocationX "`, " MouselocationY
		Store := [mouselocationx, MouseLocationY]
		
			DebugWindow(Store[Title],0,0,10,0,0)
	tooltip,
	msgbox % Store[1] "`n" Title
	return
	}
	
	MouseLocation_Set() { ;#[Vquest]
	global
	;MouseGetPos, MouseX, MouseY
	MouseClick, right,,, 1, 0, D  ; Hold down the left mouse button.
	Loop
	{
	    Sleep, 10
	    if !GetKeyState("Rbutton", "P")  ; The key has been released, so break out of the loop.
		   break
		   MouseGetPos, MouseLocationX, MouseLocationY
		   WinGetTitle, WinTitle, A
		Tooltip, %MouseLocationX% `, %MouseLocationy% `n%winTitle%

		; ... insert here any other actions you want repeated.
	}
	tooltip,
	MouseClick, Right,,, 1, 0, U ; Release the mouse button.
		WinTitle:=strreplace(winTitle, A_space,"_")	
		WinTitle:=strSplit(WinTitle,"-","_")
		WindowTitle:= WinTitle[1]
		%WindowTitle%:= {X: MouselocationX, Y: MouselocationY, Win: WinTitle[1]}
		DebugWindow(%WindowTitle%["Win"],1,0,10,0,0)
		DebugWindow(%WindowTitle%["X"] ", " %WindowTitle%["Y"],0,1,10,0,0)
	return
	}
	
	MouseLocation_Get() { ;#[Vquest]
		global
		WinGetTitle, WinTitle, A
		WinTitle:=strreplace(winTitle, A_space,"_")	
		WinTitle:=strSplit(WinTitle,"-","_")
		WindowTitle:= WinTitle[1]
		%WindowTitle%:= {X: MouselocationX, Y: MouselocationY, Win: WinTitle[1]}
			msgbox % %Wintitle%["X"] 

		DebugWindow(%WindowTitle%["Win"],1,0,10,0,0)
		DebugWindow(%WindowTitle%["X"] ", " %WindowTitle%["Y"],0,1,10,0,0)
	return
	}
	
	