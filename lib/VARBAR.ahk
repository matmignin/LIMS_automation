Class VarBar{

Show(X:=1, Y:=1, Destroy:="Reset")
{ 
	Global
	try Gui,VarBar:Destroy
	If (X<>0)
	{
		 Iniread, VarBar_X, data.ini, Locations, VarBar_X
		Iniread, VarBar_Y, data.ini, Locations, Varbar_Y	
	}
	If (X=0)
	{
		Varbar_X:=1
		varbar_y:=1
	}
	if (Destroy:="Reset")
		GUI, VarBar:destroy
	Gui Varbar:Default
	Gui VarBar: +LastFound +AlwaysOnTop  -Caption  +ToolWindow +owner  
	; WinGetPos, LMS_X, LMS_Y, LMS_W,LMS_H, NuGenesis LMS - \\Remote
	; Varbar_X := LMS_X+1000
	WinSet, Transparent, 200
	; Varbar_Y := LMS_Y
	Gui, VarBar:color, 21a366
	GUI, VarBar:Font, s16 cBlack Bold, Consolas
	Gui, VarBar:Add, edit, vProduct gproductVarBar left ReadOnly h30 x0 y0 w62, %product% ;|%DDLProducts%	
	GUI, VarBar:Font, s12 cBlack Bold, Consolas
	Gui, VarBar:add, Text, vBatch x68 y0 w120, %Batch%
	GUI, VarBar:Font, s9 cBlack , Arial Narrow
	Gui, VarBar:add, Text, vlot x70 y16 w90, %Lot%
	GUI, VarBar:Font, s7 cBlack , arial
	Gui, VarBar:add, Text, vCoated x120 y18 w50, %Coated%
	GUI, VarBar:Font, s8 cBlack , arial Narrow
	Gui, VarBar:add, Text, vname  x150 -wrap y0 w160, %Name%
	Gui, VarBar:add, Text, vcustomer  x190 -wrap y16 w160, %Customer%
	GUI, VarBar:Font, s11 cBlack Bold, Consolas
	; Gui, VarBar:Add, text, gIterationVarBar vIteration left x300 h30 y0 w70,
	; Gui, VarBar:Add, UpDown, vIterationUpDown x300 h30 y0 w1 Range0-6, %Iteration%
	OnMessage(0x203, "VarBar.Relocate")
	CoordMode, mouse, screen
	; WinGetPos, VarBar_X, VarBar_Y,,, NuGenesis LMS - \\Remote,
	; varbar_x:= Varbar_x +100
	Gui, VarBar:Show, h30 x%VarBar_X% y%VarBar_y%  w300 NoActivate, VarBar
	; Gui, VarBar:Show, h30 x%offset_X% y%offset_y%  w320 NoActivate, VarBar
	CoordMode, mouse, window
	return





ProductVarBar:
sleep 100
Gui, VarBar:submit,NoHide

return
IterationVarBar:
	; sleep 600
	; Gui, VarBar:Submit,Nohide
	; ControlGetText, Iteration, Edit2, VarBar
	
	; sleep 100
	; IniWrite, %Iteration%, data.ini, SavedVariables, Iteration
	; return
VarBarGuiClose:
	coordmode, mouse, Screen
	; WinGetPos,VarBar_X,Varbar_Y,w,h
		WinGetPos, LMS_X, LMS_Y, LMS_W,LMS_H, NuGenesis LMS - \\Remote
	Varbar_X := LMS_X+1000
	Varbar_Y := LMS_Y
	sleep 100
	IniWrite, %VarBar_X%, data.ini, Locations, VarBar_X
	IniWrite, %VarBar_y%, data.ini, Locations, VarBar_Y
	; coordmode, mouse, Window
	sleep 500
	GUI, VarBar:destroy
return
}


Move(){
	global
	  SetTimer, CheckActive, 800
		WinGetPos, LMS_X, LMS_Y, LMS_W,LMS_H, A
	VarWin_X := LMS_X+(LMS_W/2)-100
	VarWin_Y := LMS_Y 
  WinMove, VarBar ahk_class AutoHotkeyGUI,, VarWin_X, VarWin_Y,
	return
}

Relocate(){
	global
	settimer, checkactive, off
	PostMessage, 0xA1, 2 
	 keywait, Lbutton, U
	 wingetpos, Varbar_X, Varbar_Y,W,H, VarBar ahk_class AutoHotkeyGUI
	IniWrite, %Varbar_X%, data.ini, Locations, VarBar_X
	IniWrite, %Varbar_Y%, data.ini, Locations, VarBar_Y
	sleep 300
	return
}

Clear(Var:="NotProduct"){
	global
	If (Var:= "NotProduct")
	{
		ControlsetText, Static1,, VarBar
		ControlsetText, Static2,, VarBa
		ControlsetText, Static3,, VarBar
		ControlsetText, Static4,, VarBar
		ControlsetText, Static5,, VarBar
	}
If (Var:= "NotBatch")
	{
		ControlsetText, Static2,, VarBar
		ControlsetText, Static3,, VarBar
		ControlsetText, Static4,, VarBar
		ControlsetText, Static5,, VarBar
	}
	If (Var:= "Notlot")
	{
		ControlsetText, Static3,, VarBar
		ControlsetText, Static4,, VarBar
		ControlsetText, Static5,, VarBar
	}
	else
		GuiControl, Varbar:Text, %Var%, 
	
}



get(Category:="All"){
	Global
	If Category contains All
	{
		
		; ControlGetText, Product, Edit1, VarBar
		; ControlGetText, Batch, Static1, VarBar
		; ControlGetText, Lot, Static2, VarBar
		; ControlGetText, Coated, Static3, VarBar
		; ControlGetText, Name, Static4, VarBar
		; ControlGetText, customer, Static5, VarBar
		; ControlGetText, Iteration, Edit2, VarBar
		return
	}
	If Category contains Product
		output:=product
	else If Category contains Batch
		output:=Batch	
	else If Category contains Lot
		output:=Lot
	else If Category contains Coated
		output:=Coated
	else If Category contains Name
		output:=Name
	else If Category contains Customer
		output:=Customer
	else If Category contains Iteration
		output:=Iteration
	sleep 100
		Return %ouput%
}

Sendinput(Category:="",PostOutput:="")
{
	Global
	BlockInput, on
	sleep 100
	if WinActive("Select Product - \\Remote")
	{
		send, {click 106, 64}%Product%{enter}{enter}
		exit
		}
	if WinActive("NuGenesis LMS - \\Remote") 
	{
			Click_SearchBox()
	}
	if winactive("Register new samples - \\Remote")
		send, {click 182, 103}%Product%
	If Category contains Product
		output:=product
	else If Category contains Batch
		output:=Batch	
	else If Category contains Lot
		output:=Lot
	else If Category contains Coated
		output:=Coated
	else If Category contains Name
		output:=Name
	else If Category contains Customer
		output:=Customer
	else If Category contains Iteration
		output:=Iteration
	Send, %output%%PostOutput%
	sleep 100
if WinActive("NuGenesis LMS - \\Remote") || WinActive("Select Product - \\Remote") || winactive("ahk_exe explorer.exe")
		sendinput, ^a^c{enter}	
		blockinput off
if winactive("Find and Replace")
		send, !i
	sleep 400
	return
}


; Set(Input:=0){
; 	global
; 			Gui VarBar:+LastFound ; +AlwaysOnTop  -Caption  +ToolWindow +owner ; +E0x20 
; 			If Input contains OCR
; 					OCR()
; 			if input:="product"
; 			{
; 				product:=product
; 				GuiControl, Varbar:Text, Product, %Product%
; 				Gui, VarBar:color, 847545 ;brow
; 			}
; 			if input:="Batch"
; 			{
; 				Batch:=Batch
; 				GuiControl, Varbar:Text, Batch, %Batch%
; 				Gui, VarBar:color, 847545 ;brow
; 			}
; 			Else		
; 				send, ^c
; 				sleep 200
; 				clipForProduct:= Clipboard
; 				clipForBatch:= Clipboard
; 				clipForlot:= Clipboard
; 			If (Regexmatch(ClipforProduct, "\b[DEGLHKJI]\d{3}", ClipForProduct) > 0) 	
; 			{
; 				Gui VarBar:+LastFound 
; 				Gui, VarBar:submit,NoHide
; 		; Product:=ClipforProduct
; 		; Try {
; 			;  XL:=XL.Sheets(Clipforproduct).activate
; 			;  varbar.Update("iteration")
; 			;  Gui, VarBar:color, 21a366 ;green
; 		; }
; 		; catch
; 		; {
; 		; Regexmatch(ClipforProduct, "\b[DEGLHKJI]{1}\d{3}\b", ClipForProduct) 
; 		GuiControl, Varbar:Text, Product, %Product%
; 		product:=Clipforproduct
; 			Gui, VarBar:color, 847545 ;brown
; 	}

; 	if (Regexmatch(ClipforBatch, "\b\d{3}-\d{4}\b", ClipforBatch) > 0)
; 	{
; 		Gui VarBar:+LastFound 
; 		Gui, VarBar:submit,NoHide
; 		if input contains Coated
; 			GuiControl, Varbar:Text, Coated, %ClipforBatch%
; 		else
; 		 GuiControl, Varbar:Text, Batch, %ClipforBatch%

; 		Batch:=clipforbatch=
; 		Gui, VarBar:color, 847545 ;brown
; 	}
; 	if (Regexmatch(Clipforlot, "\b\d{4}\w\d\w?\b", Clipforlot) > 0)
; 	{
; 			Gui VarBar:+LastFound 
; 		Gui, VarBar:submit,NoHide
; 		GuiControl, Varbar:Text,lot, %Clipforlot%

; 		lot:=clipforlot
; 		Gui, VarBar:color, 847545 ;brown
; 	}
; 	else if (Regexmatch(Clipforlot, "\b\d{4}\w\d\w?\b", Clipforlot) = 0) && (Regexmatch(ClipforBatch, "\b\d{3}-\d{4}\b", ClipforBatch) = 0) && (Regexmatch(ClipforProduct, "\b[DEGHKLJI]\d{3}", ClipForProduct) = 0) 
; 	{
;   send, ^c
;   ClipWait, 1,
;   Clipboard := Trim((Clipboard, "`r`n"))
; 	sleep 100
; 	;tooltip(Clipboard,2000)
; 	exit
; 	}
; 	return
; }

Search(input){
		global
	Clip()
	WinActivate, NuGenesis LMS - \\Remote
	click 746, 47
	sleep 200
	Click_SearchBox()
	Varbar.sendinput("Batch")
	return
}




AddIteration(){
	global Iteration
GuiControl, Varbar:Text, iteration, %iteration%
Iteration+=1
return
}
SubIteration(){
	global Iteration
GuiControl, Varbar:Text, iteration, %iteration%
Iteration-=1
return
}


Reset()
{
	Global
	GUI, VarBar:destroy
	coordmode, mouse, Screen
	MouseGetPos,MousePos_X,MousePos_Y,w,h
	coordmode, mouse, Window
	IniWrite, "0", data.ini, Locations, ProductTable_X
	IniWrite, "0", data.ini, Locations, ProductTable_Y
	IniWrite, "0", data.ini, Locations, SpecTable_X
	IniWrite, "0", data.ini, Locations, SpecTable_Y
	;Gui, VarBar:Show, h30 x%VarBar_X% y%VarBar_y%  w390 ;  NoActivate
	VarBar.show(0)
	return
}


update(){
	Global
	GuiControl, Varbar:Text, Product, %Product%
	GuiControl, Varbar:Text, Batch, %Batch%
	GuiControl, Varbar:Text, lot, %lot%
	GuiControl, Varbar:Text, Coated, %coated%
	GuiControl, Varbar:Text, name, %name%
	GuiControl, Varbar:Text, customer, %Customer%
	GuiControl, Varbar:Text, iteration, %iteration%
	GuiControl, varbar:text, ShapeSize, %shapeSize%
}
}