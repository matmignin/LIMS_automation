; Clip() {
; 	global
; 	;PreClip:=ClipboardAll
; 	Clipboard:=
; 	sleep 50
; 	Send, ^c    
; 	clipwait, 1
; 	;Clipboard := StrReplace(Clipboard, "`r`n")
; 	sleep 50
; 	;ToolTip(Selection, 1000)
; 	Selection:=Clipboard
; 	; clipwait, 0.25
; 	;Clipboard:=Preclip
; 	; clipwait, 0.25
; 	return %Selection%
; }


Clip(input:=0){
	global
	; clipboard:=
	Gui VarBar:+LastFound ; +AlwaysOnTop  -Caption  +ToolWindow +owner ; +E0x20 
	If Input contains OCR
		OCR()
	Else		
	clipboard:=""
	sleep 20
		send, ^c
		clipwait, 1
		If (Input = "S")
		{
				Clipboard:=""
					Send, ^c    
					clipwait, 1
				Selection:=StrReplace(Clipboard, "`r`n")
					TrayTip, Copy, %Selection%,,
				return %Selection%
		}
	If (Regexmatch(CLIPBOARD, "[ADEGLHKJI]\d{3}", Product) > 0) 	
	{
		Varbar.Clear("notProduct")
		GuiControl, Varbar:Text, Product, %Product%
		Gui, VarBar:color, 847545 ;brown
	}
	if (Regexmatch(Clipboard, "\d{3}-\d{4}", Batch) > 0)
	{
		GuiControl, Varbar:Text, Batch, %Batch%
		; if input contains Coated
			; Coated:=Batch
		; else
		; GuiControl, Varbar:Text, Coated, %Coated%
		Gui, VarBar:color, 847545 ;brown
	}
	if (Regexmatch(Clipboard, "\b\d{4}\w\d\w?", lot) > 0) || (Regexmatch(Clipboard, "Bulk", lot) > 0)
	{
		GuiControl, Varbar:Text, Lot, %Lot%
		Gui, VarBar:color, 847545 ;brown
	}
	else
	{
  send, {ctrl down}c{ctrl up}
	sleep 100
	tooltip(Clipboard)
	; return %clipboard%
	}
	return
}