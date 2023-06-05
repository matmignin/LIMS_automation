#SingleInstance,Force
#Persistent
#NoEnv
CoordMode, mouse, Window
Menu, Tray, Add, &Reload, !esc
Menu, Tray, Default, &Reload


Key:= {}
return


+F10::
iteration:=Key.length()+1
MouseGetPos, mX, mY,mWin
inputbox,vPaste, What do you want to paste
Key[iteration]:= New Marker(Iteration,mX,mY,vPaste)
  Return

F10::
iteration:=Key.length()+1
MouseGetPos, mX, mY,mWin
;Tooltip,Press Key, mX-10,my-10,4
;input,vinput, L1
  ;Tooltip,,,,4
Key[iteration]:= New Marker(Iteration,mY,mY)
  Return

`::
MouseGetPos, mX, mY,mWin
Tooltip,Press Key, mX-10,my-10,4
input,vinput, L1
  Tooltip,,,,4
Key[vInput]:= New Marker(vInput,mX,mY)
  Return

1::
If Key[A_ThisHotkey]
    Key[A_ThisHotkey].Activate()
  else
  msgbox, no dice
return


2::
If Key[A_ThisHotkey]
  Key[A_ThisHotkey].Activate()
  else
  msgbox, nope
return

3::
If Key[A_ThisHotkey]
  Key[A_ThisHotkey].Activate()
  else
  msgbox, nope
return

4::key[index]


!esc::reload


Class Marker {
  Static Msgboxes:=0 

  __New(input,varX,varY,varPaste:="")
  {
  	Marker.Msgboxes++
    this.inputKey:=input
    this.X:=varX
    This.Y:=varY
    this.Paste:=varPaste
    WinGet IDVar,ID,A ; Get ID from Active window.
    This.ID:=IDVar ; Set IDVar to This.ID
    This.msgbox:= Marker.Msgboxes +4
    This.ShowMarker()
  }

	ShowMarker()
  {
  	if this.paste
      	this.pasteindicator:="*"
      TT(" " this.pasteindicator this.inputKey " " ,0,this.X-10,This.Y-10,†his.msgbox,200)
  		
    ; WingetTitle TitleVar, A ; Get title from Active window.
		; This.Title:=TitleVar ; Set TitleVar to This.Title
    ;MouseGetPos, varX, varY, varWin
    ;this.Win:=varwin
	}

	Activate() ;Activates window with Title - This.ID
  {
   if !winactive("ahk_id " This.ID)
    WinActivate % "ahk_id "This.ID
    MouseClick,, % this.X, % this.Y, 1
    If this.Paste
    	sendinput % this.paste
		Return This.ID
	}


}

/*
save_marker(marker:=""){
  global
  if !marker
  {
    MouseGetPos, mx, my
    Tooltip,Press Key, mX-10,my-10,4
    input,marker, L1
    Tooltip,,,,4
  }
  WinGetTitle, %marker%WinMemory, A
  MouseGetPos, %marker%MouseMemoryX, %marker%MouseMemoryY, %marker%MouseMemoryWin, %marker%MouseMemoryControl
  TT(" " marker " " ,0,%marker%MouseMemoryX-10,%marker%MouseMemoryY-10,5 + marker,260)

  return marker
}

click_marker(marker, pasteValue:=""){
  global
  If !(%marker%WinMemory)
  {
    send, {%marker%}
    return
  }
  else
  {
    ifwinactive % %marker%WinMemory
      winactivate % %marker%WinMemory
    ifwinactive % %marker%WinMemory
      MouseClick,, % %marker%MouseMemoryX, % %marker%MouseMemoryY, 1
    if pasteValue
    {
      sleep 200
      sendinput, %pasteValue%
    }
  }
}

 */


 TT(msg:="yo", time=1500, X:="",Y:="",N:="", Transparent:="",Position:="S") {
	global
	my:=100
	Mx:=100
	MouseGetPos, mX, mY
	; CoordMode, Mouse, screen
	; CoordMode, ToolTip, screen
	; CoordMode, ToolTip, Relative
	sleep 20
	if Position = M
		tooltip, %msg%, %X%+%mX%, %Y%+%mY%,%N%
	else
		tooltip, %msg%, %X%+100, %Y%+100,%N%
	; X+=100

	; else
	hwnd := winExist("ahk_class tooltips_class32")
	if Transparent
		WinSet, Exstyle, 0x20, % "ahk_id" hwnd
	WinSet, AlwaysOnTop, On, % "ahk_id" hwnd
	winSet, Trans, %Transparent%, % "ahk_id" hwnd
	; WinSet, Transparent, 128, % "ahk_id" hwnd
	; winSet, TransColor, 0xE5513C 200, % "ahk_id" hwnd
	; winSet, Trans, 200, %W%
	; if Position = "S"
	if !(time=0)
		SetTimer, RemoveToolTip%N%, -%time%
	return
	RemoveToolTip:
	ToolTip
	return
	RemoveToolTip1:
	ToolTip,,,,1
	return
	RemoveToolTip2:
	ToolTip,,,,2
	return
	RemoveToolTip3:
	ToolTip,,,,3
	return
	RemoveToolTip4:
	ToolTip,,,,4
	return
	RemoveToolTip5:
	ToolTip,,,,5
	return
	RemoveToolTip6:
	ToolTip,,,,6
	return
	RemoveToolTip7:
	ToolTip,,,,7
	return
	RemoveToolTip8:
	ToolTip,,,,8
	return
	RemoveToolTip9:
	ToolTip,,,,9
	return
	RemoveToolTip10:
	ToolTip,,,,10
	return
	RemoveToolTip11:
	ToolTip,,,,11
	return
	RemoveToolTip12:
	ToolTip,,,,12
	return
	RemoveToolTip13:
	ToolTip,,,,13
	return
	RemoveToolTip14:
	ToolTip,,,,14
	return
	RemoveToolTip15:
	ToolTip,,,,15
	return
	RemoveToolTip16:
	ToolTip,,,,16
	return
	RemoveToolTip17:
	ToolTip,,,,17
	return
	RemoveToolTip18:
	ToolTip,,,,18
	return
	RemoveToolTip19:
	ToolTip,,,,19
	return
	RemoveToolTip20:
	ToolTip,,,,20
	return
	return
}