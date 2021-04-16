Clip() {
	global
	sendlevel, 2
	PreClip:=ClipboardAll
	Clipboard:=
	sleep 50
	Send, ^c    
	clipwait, 1
	Clipboard := StrReplace(Clipboard, "`r`n")
	sleep 50
	; ToolTip(Selection, 1000)
	Selection:=Clipboard
	clipwait, 0.25
	Clipboard:=Preclip
	clipwait, 0.25
	sendlevel, 0
	return %Selection%
}


clip_set(input:=0){
	global
	Gui VarBar:+LastFound ; +AlwaysOnTop  -Caption  +ToolWindow +owner ; +E0x20 
	If Input contains OCR
	OCR()
	Else		
	send, ^c
	sleep 200
	clipForProduct:= Clipboard
	clipForBatch:= Clipboard
	clipForlot:= Clipboard
	If (Regexmatch(ClipforProduct, "\b[EGLHKJI]\d{3}", ClipForProduct) > 0) 	
	{
		ControlSetText, Edit1,%clipforProduct%, VarBar
		ControlSetText, Static2,, VarBar
		ControlSetText, Static3,, VarBar
		ControlSetText, Static4,, VarBar
		ControlSetText, Static5,, VarBar
		product:=Clipforproduct
		Batch:=
		lot:=
		Name:=
		Customer:=
		coated:=
			Gui, VarBar:color, 847545 ;brown
	}
	if (Regexmatch(ClipforBatch, "\b\d{3}-\d{4}\b", ClipforBatch) > 0)
	{
		; Batch:=ClipforBatch
		Gui VarBar:+LastFound 
		Gui, VarBar:submit,NoHide
		if input contains Coated
			ControlSetText, Static3,%ClipforBatch%, VarBar
		else
		 ControlSetText, Static1,%ClipforBatch%, VarBar
		; GuiControl, Text, Batch, %Batch%
		ControlSetText, Static2,, VarBar
		ControlSetText, Static4,, VarBar
		ControlSetText, Static5,, VarBar
		Batch:=clipforbatch
		lot:=
		Name:=
		Customer:=
		coated:=
		Gui, VarBar:color, 847545 ;brown
	}
	if (Regexmatch(Clipforlot, "\b\d{4}\w\d\w?\b", Clipforlot) > 0)
	{
			Gui VarBar:+LastFound 
		Gui, VarBar:submit,NoHide
		ControlSetText, Static3,%Clipforlot%, VarBar
		ControlSetText, Static4,, VarBar
		ControlSetText, Static5,, VarBar
		lot:=clipforlot
		Name:=
		Customer:=
		coated:=
		Gui, VarBar:color, 847545 ;brown
	}
	else if (Regexmatch(Clipforlot, "\b\d{4}\w\d\w?\b", Clipforlot) = 0) && (Regexmatch(ClipforBatch, "\b\d{3}-\d{4}\b", ClipforBatch) = 0) && (Regexmatch(ClipforProduct, "\b[EGLHKJI]\d{3}", ClipForProduct) = 0) 
	{
  send, {ctrl down}c{ctrl up}
  ClipWait, 3
  Clipboard := Trim((Clipboard, "`r`n"))
	sleep 100
	tooltip(Clipboard,2000)
	exit
	}
	return
}