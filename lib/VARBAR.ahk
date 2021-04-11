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
	Gui VarBar:+LastFound +AlwaysOnTop  -Caption  +ToolWindow +owner  
	WinSet, Transparent, 200
	Gui, VarBar:color, 21a366
	GUI, VarBar:Font, s16 cBlack Bold, Consolas
	Gui, VarBar:Add, edit, vProduct gproductVarBar left ReadOnly h30 x0 y0 w62, %product% ;|%DDLProducts%	
	GUI, VarBar:Font, s12 cBlack Bold, Consolas
	Gui, VarBar:add, Text, vBatch x68 y0 w1200, %Batch%
	GUI, VarBar:Font, s9 cBlack , Arial Narrow
	Gui, VarBar:add, Text, vlot x70 y16 w120, %Lot%
	GUI, VarBar:Font, s7 cBlack , arial
	Gui, VarBar:add, Text, vCoated x120 y18 w100, %Coated%
	GUI, VarBar:Font, s8 cBlack , arial Narrow
	Gui, VarBar:add, Text, vname  x150 -wrap y0 w160, %Name%
	Gui, VarBar:add, Text, vcustomer  x190 -wrap y16 w160, %Customer%
	GUI, VarBar:Font, s11 cBlack Bold, Consolas
	Gui, VarBar:Add, Edit, gIterationVarBar vIteration left x300 h30 y0 w70,
	Gui, VarBar:Add, UpDown, vIterationUpDown wrap x300 h30 y0 w1 Range-300-600, %Iteration%
	OnMessage(0x203, "VarBar.Relocate")
	CoordMode, mouse, screen
	Gui, VarBar:Show, h30 x%VarBar_X% y%VarBar_y%  w340 NoActivate, VarBar
	CoordMode, mouse, window
	return





ProductVarBar:
sleep 100
Gui, VarBar:submit,NoHide
; try
; {
	; XL:= ComObjActive("Excel.Application")
			; Visible := True
	; XL:=XL.Sheets(Product).activate
; }
; Excel.Connect()

return
IterationVarBar:
	sleep 600
	Gui, VarBar:Submit,Nohide
	ControlGetText, Iteration, Edit2, VarBar
	sleep 100
	IniWrite, %Iteration%, data.ini, SavedVariables, Iteration
	return
VarBarGuiClose:
	coordmode, mouse, Screen
	WinGetPos,VarBar_X,Varbar_Y,w,h
	sleep 100
	IniWrite, %VarBar_X%, data.ini, Locations, VarBar_X
	IniWrite, %VarBar_y%, data.ini, Locations, VarBar_Y
	coordmode, mouse, Window
	sleep 500
	GUI, VarBar:destroy
return
}






get(Category)
{
	Global
	If Category contains All
	{
		
		ControlGetText, Product, Edit1, VarBar
		ControlGetText, Batch, Static1, VarBar
		ControlGetText, Lot, Static2, VarBar
		ControlGetText, Coated, Static3, VarBar
		ControlGetText, Name, Static4, VarBar
		ControlGetText, customer, Static5, VarBar
		ControlGetText, Iteration, Edit2, VarBar
		return
	}
	else If Category contains Product
		ControlGetText, Output, Edit1, VarBar
	else If Category contains Batch
		ControlGetText, Output, Static1, VarBar
	else If Category contains Lot
		ControlGetText, output, Static2, VarBar
		else If Category contains Coated
		ControlGetText, output, Static3, VarBar
	else If Category contains Name
		ControlGetText, Output, Static4, VarBar
	else If Category contains Customer
		ControlGetText, Output, Static5, VarBar
	else If Category contains Iteration
		ControlGetText, Output, Edit2, VarBar
	sleep 100
		Return %ouput%
}

Sendinput(Category,ExtraOutput:="")
{
	Global
	BlockInput, on
	sleep 100
	If Category contains Product
		ControlGetText, Output, Edit1, VarBar
	else If Category contains Batch
		ControlGetText, Output, Static1, VarBar
	else If Category contains Lot
		ControlGetText, Output, Static2, VarBar
	else If Category contains coated
		ControlGetText, Output, Static3, VarBar
	else If Category contains Name
		ControlGetText, Output, Static4, VarBar
	else If Category contains Customer
		ControlGetText, Output, Static5, VarBar
	else If Category contains Iteration
		ControlGetText, Output, Edit2, VarBar
	Send, %output%%ExtraOutput%
	sleep 100
	if WinActive("NuGenesis LMS - \\Remote") || WinActive("Select Product - \\Remote") || winactive("ahk_exe explorer.exe")
		send, {enter}	
		blockinput off
if winactive("Find and Replace")
		send, !i
	sleep 400
	return
}


Set(Input:=0){
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
		; Product:=ClipforProduct
		; Try {
			;  XL:=XL.Sheets(Clipforproduct).activate
			;  varbar.Update("iteration")
			;  Gui, VarBar:color, 21a366 ;green
		; }
		; catch
		; {
		; Regexmatch(ClipforProduct, "\b[EGLHKJI]{1}\d{3}\b", ClipForProduct) 
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
		; exit
	; tooltip, % Regexmatch(ClipforBatch, "\b\d{3}-\d{4}\b", ClipforBatch)
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
  send, ^c
  ClipWait, 1,
  Clipboard := Trim((Clipboard, "`r`n"))
	sleep 100
	tooltip, %product%`n%batch%`n%lot%, %varbar_x%, %varbar_y%
	tooltip(Clipboard,2000)
	exit
	}
	tooltip, %product%`n%batch%`n%lot%, %varbar_x%,%varbar_y%
	return
}

Search(input){
	global
	varbar.set()
	WinActivate, NuGenesis LMS - \\Remote
	send, {click 761, 44}
	sleep 150
	click, 500,127, 2 ;click search bar
	sleep 200
	Varbar.sendinput(input)
	return
}


Relocate() 
{
	global
	PostMessage, 0xA1, 2 
	keywait, Lbutton, U
	coordmode, mouse, Screen
	WinGetPos,VarBar_X,VarBar_Y,w,h
	IniWrite, %VarBar_X%, data.ini, Locations, VarBar_X
	IniWrite, %VarBar_Y%, data.ini, Locations, VarBar_Y
	sleep 300
	coordmode, mouse, Window
	return
}


AddIteration(){
	global Iteration
Iteration+=1
ControlSetText, Edit2,%Iteration%, VarBar
return
}
SubIteration(){
	global Iteration
Iteration-=1
ControlSetText, Edit2,%Iteration%, VarBar
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

}