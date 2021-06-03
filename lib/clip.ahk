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
	;clipboard:=
	Gui VarBar:+LastFound ; +AlwaysOnTop  -Caption  +ToolWindow +owner ; +E0x20 
	If Input contains OCR
		OCR()
	Else		
		clipboard:=""
	sleep 20
	send, ^c
	clipwait, 1
		Traytip, %Clipboard%,,2
	ProductClipboard:=Clipboard
	BatchClipboard:=Clipboard
	If (Input = "S")
			{
					; Clipboard:=""
						; Send, ^c
						clipwait, 1
					Selection:=StrReplace(Clipboard, "`r`n")
						TrayTip, Copy, %Selection%,,
					return %Selection%
			}
	If (Regexmatch(ProductCLIPBOARD, "\b[ADEFGLHKJIadefglhkji]\d{3}\b", Product) > 0) 	
	{
		; Varbar.Clear("NotProduct)
		GuiControl, Varbar:Text, Product, %Product%
		ControlGetText, Batch, Edit2, VarBar
		ControlGetText, lot, Static2, VarBar
		GuiControl, Varbar:Text, Name,
		GuiControl, Varbar:Text, Customer,
		;FileAppend, %Product%`n, codes.txt
	envset, Product, %Product%
		Gui, VarBar:color, 847545 ;brown
	}
	if (Regexmatch(BatchClipboard, "\b\d{3}-\d{4}\b", Batch) > 0)
	{
		GuiControl, Varbar:Text, Batch, %Batch%
		ControlGetText, Product, Edit1, VarBar
		ControlGetText, lot, Static2, VarBar
		ControlGetText, Coated, Static3, VarBar
		GuiControl, Varbar:Text, Name,
		GuiControl, Varbar:Text, Customer,
		;FileAppend, %Batch%`n, codes.txt
		; if input contains Coated
			; Coated:=Batch
		; else
		; GuiControl, Varbar:Text, Coated, %Coated%
		envset, Batch, %Batch%
		Gui, VarBar:color, 847545 ;brown
	}
		if (Regexmatch(Clipboard, "(\bCt\#\d{3}-\d{4}\b|\bCt\d{3}-\d{4}\b)", Coated) > 0)
	{
		Coated:=trim(Coated,"Ct#")
		ControlGetText, Batch, Edit2, VarBar
		GuiControl, Varbar:Text, Batch, %Batch%
		GuiControl, Varbar:Text, Coated, %Coated%
		ControlGetText, Product, Edit1, VarBar
		ControlGetText, lot, Static2, VarBar
		;FileAppend, %Lot%`n, codes.txt
		envset, Coated, %Coated%
		Gui, VarBar:color, 847545 ;brown
	}
	if (Regexmatch(Clipboard, "(\b\d{4}\w\d\w?|\bBulk\b)", lot) > 0)
	{
		GuiControl, Varbar:Text, Lot, %Lot%
		ControlGetText, Product, Edit1, VarBar
		ControlGetText, Batch, Edit2, VarBar
		GuiControl, Varbar:Text, Name,
		GuiControl, Varbar:Text, Customer,
		;FileAppend, %Lot%`n, codes.txt
		envset, lot, %lot%
		Gui, VarBar:color, 847545 ;brown
	}
	else if input conains 0
	{
  send, ^c
	sleep 100
	; return %clipboard%
	}
	tooltip(Clipboard,2000)
	;Varbar.Update()

	return
}

