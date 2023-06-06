; #SingleInstance,Force
; #Persistent
; #NoEnv
; CoordMode, mouse, Window
; Menu, Tray, Add, &Reload, !esc
; Menu, Tray, Default, &Reload

return


; #ifwinactive, What do you want to paste
; 	Enter::click, 107, 180
; #ifwinactive,
; #Ifwinactive, NuGenesis LMS
+F10::
Marker_iteration:=Key.length()+1
MouseGetPos, mX, mY,mWin
inputbox,vPaste, What do you want to paste
Key[Marker_iteration]:= New Marker(Marker_Iteration,mX,mY,vPaste)
Return


`::
Marker_iteration:=Key.length()+1
MouseGetPos, mmX, mmY,mmWin
; inputbox,vPaste, What do you want to paste
Key[Marker_iteration]:= New Marker(Marker_Iteration,mmX,mmY,"M")
  Return

; F10::
;   Marker_iteration:=Key.length()+1
; MouseGetPos, mX, mY,mWin
; ;Tooltip,Press Key, mX-10,my-10,4
; ;input,vinput, L1
;   ;Tooltip,,,,4
; Key[Marker_iteration]:= New Marker(Marker_Iteration,mX,mY)
;   Return

^+f10::
MouseGetPos, mX, mY,mWin
Tooltip,Press Key, mX-10,my-10,4
input,vinput, L1
  Tooltip,,,,4
Key[vInput]:= New Marker(vInput,mX,mY)
  Return

F1::Key[1].Activate()
F2::Key[2].Activate()
F3::Key[3].Activate()
F4::Key[4].Activate()
!5::Key[5].Activate()
!q::Key["q"].Activate()
!i::Key["i"].Activate()


Class Marker {
  Static Msgboxes:=0

  __New(input,varX,varY,varoption:="")
  {
  	Marker.Msgboxes++
    this.inputKey:=input
    this.X:=varX
    This.Y:=varY
    this.option:=varoption
    WinGet IDVar,ID,A ; Get ID from Active window.
    This.ID:=IDVar ; Set IDVar to This.ID
    This.msgbox:= Marker.Msgboxes +4
    This.ShowMarker()
  }

  ShowMarker()
  {
  if this.option = "M"
      this.optionindicator:="*"
    else
      this.optionindicator:="^"
    TT(" " this.optionindicator this.inputKey " " ,0,this.X-10,This.Y-10,this.msgbox,200)

    ; WingetTitle TitleVar, A ; Get title from Active window.
		; This.Title:=TitleVar ; Set TitleVar to This.Title
    ;MouseGetPos, varX, varY, varWin
    ;this.Win:=varwin
    return
	}

	Activate() ;Activates window with Title - This.ID
	{
		Global ;SimpleClip
		if (this.inputKey){
   if !winactive("ahk_id " This.ID)
        WinActivate % "ahk_id "This.ID
    if !this.option
      MouseClick,, % this.X, % this.Y, 1
    if This.option
    {
        If (this.option = "M"){
          SendLevel 1

          MouseClick,middle, % this.X, % this.Y, 1
        ; send, {mbutton}

        ; MouseClick,middle, % this.X, % this.Y, 1
        Return
      }
		else {
			simpleclip:=1
			the_preclipboard:=Clipboard
		Clipboard:=
		Clipboard:=This.Paste
		ClipWait, 1, true
				if !ErrorLevel
			send, ^{v}
				Clipboard:=The_Preclipboard
			; simpleclip:=
			}
    }
			; sendinput % this.inputkey
		Return This.ID
	}
}




}


