#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%



;; Varbar

	; Focus(Control){
	; 	global
	; 	WinGetTitle, the_WinTitle, A
	; 	caret_x:=A_CaretX
	; 	caret_y:=A_Carety
	; 	WinActivate, VarBar ahk_exe AutoHotkey.exe
	; 	GuiControl Varbar:Focus, %Control%
	; 	; sleep 100
	; 	SendInput, ^{a}{ctrlup}{altup}
	; 	return
	; 	}	


	
	Follow(){
		global
		if !winexist("ahk_exe WFICA32.EXE")
			return
		if winactive("VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe")
			return
		WinGet, NewWindow, ProcessName, A
		; WinGetPos, Varbar_ox,Varbar_oy,,,A ;{altdown}{}{altup}NewWindow, ProcessName, A
		if (NewWindow=CurrentWindow) 
			return
			CurrentWindow:=NewWindow
		if winactive("ahk_exe EXCEL.EXE") { 
			WinGetPos, VarBar_oX, VarBar_oY, Varbar_oW,Varbar_oH, A
					WinMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,varbar_ox+100, Varbar_oy +2 ;+ Varbar_oh-33
			return
		}
		if winactive("ahk_exe Code.exe") || !winexist("ahk_exe WFICA32.EXE"){ 
			WinGetPos, VarBar_oX, VarBar_oY, Varbar_oW,Varbar_oH, A
					WinMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,varbar_ox+400, Varbar_oy + Varbar_oh-35
			return
		}
		if winactive("Inbox ahk_exe OUTLOOK.EXE") { 
			WinGetPos, VarBar_oX, VarBar_oY, Varbar_oW,Varbar_oH, A
					WinMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,varbar_ox+400, Varbar_oy + Varbar_oh-30
			return
		}
		if winactive("ahk_exe explorer.exe") { 
			; WinGetPos, VarBar_X, VarBar_Y, Varbar_W,Varbar_x, 
			varbar_NuX:=A_ScreenWidth/2
			varbar_wy:=A_ScreenHeight
			WinMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,varbar_NuX, varbar_wy
			return
		}
		if  winactive("ahk_exe WFICA32.EXE") && !winactive("ahk_exe EXCEL.EXE") && !winactive("ahk_exe Code.exe") && !winactive("ahk_exe OUTLOOK.EXE") { ;&& (ActiveWin="LMS"){
			lms.Orient()
			WinMove, VarBar ahk_class AutoHotkeyGUI ahk_exe AutoHotkey.exe, ,varbar_NuX, Varbar_wy
			return
		}
	}



;;LMS


AddCanceled(){
	ifwinnotactive, Edit test (Field Configuration: F, Micro) - \\Remote
		winactivate, Edit test (Field Configuration: F, Micro) - \\Remote
	SendInput,{click 399, 219}{end}'(Canceled'){enter}
}

ToggleFilter_Test_1(){
	ifwinnotactive, NuGenesis LMS - \\Remote
		WinActivate, NuGenesis LMS - \\Remote
	click 489, 836, R
	SendInput,{down 2}{enter}
}

FilterSearch_Test(TestName:="", MethodName:=""){
	ifwinnotactive, NuGenesis LMS - \\Remote
		WinActivate, NuGenesis LMS - \\Remote
	click 1230, 648 ;click name Divider
	Send, ^a%TestName%{enter}
	click 1067, 647 ; click method ID Divider
	Send, ^a%MethodName%{enter}{tab 4}
}

FilterStatus(){
 global
	FilterOn:=
	Filter:=
	ifwinnotactive, ahk_exe WFICA32.EXE 
		winactivate, ahk_exe WFICA32.EXE
	if WinActive("NuGenesis LMS - \\Remote")
		PixelSearch, FilterOn, FoundY, %xFilterIcon%, %yFilterIcon%, %xFilterIcon%+2, %YFilterIcon%+2, 0xf9e681, 10, Fast RGB
			if FilterOn
				return FilterOn
			else 
				FilterOn:=
				Return 
				; clk(xFilterIcon,yFilterIcon)
				; Return FilterOff
				
			; If ErrorLevel  ;is yellow/on?
			; {
				; FilterOn="on"
			; }
			; else ;is off/blue
	; return
	}