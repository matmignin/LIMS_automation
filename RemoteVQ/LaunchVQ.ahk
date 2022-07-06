if A_username != mmignin
	exitapp
		#SingleInstance,Force
	#Persistent
	Menu, Tray, add, Show &Final Label Copy, ShowFinalLabelCopy
	Menu, Tray, add, Scan &Label Copy, ShowScanLabelCopy
	Menu, Tray, add, Manual &COAs folder, ShowManualCOA
	Menu, Tray, add, &mfg folder, Showmfg
	Menu, Tray, add, &GLOBAL VISION folder, ShowGlobalVision
	Menu, Tray, add, &Total CoAs, ShowFINAL_C_O_A
	Menu, Tray, Add,
	Menu, Tray, Add, LaunchVQ, LaunchVQSub
	Menu, Tray, Add, E&xitsub, Exitsub
	; Menu, Tray, Click, 1
	Menu, Tray, Default, LaunchVQ
	Menu,Tray,NoStandard
	; try Menu, Tray, Icon, \\10.1.2.118\users\vitaquest\mmignin\RemoteVQ\launchicon.ico
OnMessage(0x404, "AHK_NotifyIcon")

	return

AHK_NotifyIcon(wParam, lParam) {
	Static lbutton_presses := 0, PosX := 0, PosY := 0
	If (lParam = 0x202) {	; WM_LBUTTONUP
		CoordMode, Mouse, Screen
		MouseGetPos, PosX, PosY ; store co-ords in case mouse moves during the timed wait below
		SetTimer, AHK_NotifyIcon_Continue, -300 ; Wait 300ms for a second left click, then Continue
		; Set counter (lbutton_presses) to 1, unless already 1; then, set to 2
		lbutton_presses := ((lbutton_presses != 1) ? (1) : (2))
		Return
		AHK_NotifyIcon_Continue:
		If (lbutton_presses = 1) { ; If only a single left click was registered
			CoordMode, Menu, Screen
			Menu, Tray, Show, %PosX%, %PosY% ; Show at stored mouse co-ords from WM_LBUTTONUP
		}
		lbutton_presses := 0 ; Reset the counter to 0
		Return
	} Else If (lParam = 0x203) { ; WM_LBUTTONDBLCLK
		Return ; Do nothing besides the built-in double left click action (open the default menu item).
	} Else If (lParam = 0x205) { ; WM_RBUTTONUP
		return ; Do nothing besides the built-in right click action (show the menu)
	}
	Return true
}

	LaunchVQSub:
	run \\10.1.2.118\users\vitaquest\mmignin\RemoteVQ\RemoteVQ.exe
	return


Exitsub(){
	global
	exitapp
  }
ShowFinalLabelCopy:
	iniRead, Product, Settings.ini, SavedVariables, Product
	run, find "\\10.1.2.118\Label Copy Final"
	sleep 200
	sendinput, {*}%Product%{enter}
	return
ShowScanLabelCopy:
	iniRead, Product, Settings.ini, SavedVariables, Product
	run, find "\\10.1.2.118\share\QC LAB\Label Copy Scans"
	sleep 200
	sendinput, {*}%Product%{enter}
	return

ShowFINAL_C_O_A:
	run, find "\\netapp\final_c_o_a\2022 CoAs"
	return
ShowManualCOA:
	run, find "\\netapp\coa-lot#"
	return
Showmfg:
	run, find "\\10.1.2.118\lms\Information\ECOPY\mfg"
	return
ShowGlobalVision:
	run, find "\\10.1.2.118\share\GLOBAL VISION"
	sleep 200
	sendinput, {*}%Product%{enter}{*}
	return