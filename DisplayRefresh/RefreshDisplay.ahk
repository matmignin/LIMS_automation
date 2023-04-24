#NoEnv
#SingleInstance, Force
#Persistent
SendMode, Input
#maxthreadsperhotkey, 2
; SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Window
CoordMode, Pixel, Window
CoordMode, ToolTip, Window
Menu,Tray,NoStandard
Menu, Tray, Add, Stop Timer, StopTimer
; Menu, Tray, Add, Show Variables, ShowVariables
Menu, Tray, Add, Exitsub, Exitsub
Menu, Tray, Default, Exitsub
MouseGetPos, xpos, ypos
Sleep 1000
	winactivate, NuGenesis LMS
SetTimer,WindowCheck, 300000


		;
; ToolTip, is Idle, %xpos%, %ypos%
return


StopTimer(){
		SetTimer, WindowCheck, Off
		Return
  }
Exitsub(){
	global
	; ifwinnotexist, VQ_Helper ahk_exe explorer.exe
	exitApp
	sleep 200
  }

ShowVariables:
	listvars
	return



WindowCheck:
PrevXpos:=xPos
BottomBarX:=
FoundTestTabX:=
MouseGetPos, xpos, ypos
sleep 50

if (xpos = PrevXpos) && winactive("NuGenesis LMS"){
	WinGetPos, Xwin, Ywin, Wwin, Hwin, NuGenesis LMS
	TestTabX:=Floor(Wwin * 0.5247093)+10
	TestTabY:=75
	RefreshButtonX:=265
	RefreshButtonY:=126
	; ScrollDownX:=Wwin - 20
	; ScrollDownY:=Hwin - 85
	PixelSearch, FoundTestTab, FoundTestTabY, %TestTabX%, %TestTabY%, %TestTabX%+10, %TestTabY%+10, 0xffd353, 50, Fast RGB
		if errorlevel {
			sleep 120000
			click %TestTabX% %TestTabY%
		}
			else
			click %RefreshButtonX% %RefreshButtonY%
			click %Xpos% %YPos% 0
					sleep 6000
	}


Return
return