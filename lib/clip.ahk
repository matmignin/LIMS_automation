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
	ProductClipboard:=Clipboard
	BatchClipboard:=Clipboard
	If (Input = "S")
			{
					Clipboard:=""
						Send, ^c
						clipwait, 1
					Selection:=StrReplace(Clipboard, "`r`n")
						TrayTip, Copy, %Selection%,,
					return %Selection%
			}
	If (Regexmatch(ProductCLIPBOARD, "\b[ADEGLHKJIadeglhkji]\d{3}\b", Product) > 0) 	
	{
		; Varbar.Clear("NotProduct)
		GuiControl, Varbar:Text, Product, %Product%
		ControlGetText, Batch, Static1, VarBar
		ControlGetText, lot, Static2, VarBar
		GuiControl, Varbar:Text, Name,
		GuiControl, Varbar:Text, Customer,
		;FileAppend, %Product%`n, codes.txt
	envset, Product, %Product%
		Gui, VarBar:color, 847545 ;brown
	}
	if (Regexmatch(BatchClipboard, "\d{3}-\d{4}", Batch) > 0)
	{
		GuiControl, Varbar:Text, Batch, %Batch%
		ControlGetText, Product, Edit1, VarBar
		ControlGetText, lot, Static2, VarBar
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
	if (Regexmatch(Clipboard, "\b\d{4}\w\d\w?", lot) > 0) || (Regexmatch(Clipboard, "Bulk", lot) > 0)
	{
		GuiControl, Varbar:Text, Lot, %Lot%
		ControlGetText, Product, Edit1, VarBar
		ControlGetText, Batch, Static1, VarBar
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
	;tooltip(Clipboard)
	; return %clipboard%
	}
	;Varbar.Update()
	return
}

