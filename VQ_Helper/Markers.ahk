; #SingleInstance,Force
; #Persistent
; #NoEnv
; CoordMode, mouse, Window
; Menu, Tray, Add, &Reload, !esc
; Menu, Tray, Default, &Reload

return


 +F10:: ;;{{MARKER
Marker_iteration:=Key.length()+1
MouseGetPos, mX, mY,mWin
inputbox,vPaste, What do you want to paste
Key[Marker_iteration]:= New Marker(Marker_Iteration,mX,mY,vPaste)
Return


`:: ;;{{MARKER
Marker_iteration:=Key.length()+1
MouseGetPos, mmX, mmY,mmWin
  ; inputbox,vPaste, What do you want to past`
Key[Marker_iteration]:= New Marker(Marker_Iteration,mmX,mmY,"M")
; Key[Marker_iteration]:= New Marker(Marker_Iteration,mmX,mmY)
  Return



F10:: ;;{{{Marker
	ContinueToRun:=1
	If spectab.CountUncheckedRows() <1
	{
		Key[A_index].Activate()
	return
}
	else
  loop % spectab.CountUncheckedRows(){
  if !(Key[1])
      spectab.ClickEmptyRequirements()
    if Key[A_index]
      {
      Key[A_index].Activate()
      }
    else if Key[1]
      {
    Key[1].Activate()
      return
      }
}

; clipbar.AddIteration()
ContinueToRun:=
  Return


; #ifwinactive, What do you want to paste
; 	Enter::click, 107, 180
; #ifwinactive,
; #Ifwinactive, NuGenesis LMS



; F10::
;   Marker_iteration:=Key.length()+1
; MouseGetPos, mX, mY,mWin
; ;Tooltip,Press Key, mX-10,my-10,4
; ;input,vinput, L1
;   ;Tooltip,,,,4
; Key[Marker_iteration]:= New Marker(Marker_Iteration,mX,mY)
;   Return




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
  if !this.option
      this.optionindicator:=""
  else if this.option = "M"
      this.optionindicator:="*"
  else
      this.optionindicator:="^"
    TT(" " this.optionindicator this.inputKey " " ,0,this.X,This.Y,this.msgbox,200,"M")

    ; WingetTitle TitleVar, A ; Get title from Active window.
		; This.Title:=TitleVar ; Set TitleVar to This.Title
    ;MouseGetPos, varX, varY, varWin
    ;this.Win:=varwin
    return
	}

	Activate() ;Activates window with Title - This.ID
	{
    Global ;SimpleClip
    tooltip, % this.inputkey,10,10,4
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
          sendlevel 0
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
    }
    else
    	Return 0
		Return This.ID
    }






}


