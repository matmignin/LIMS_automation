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
	Gui, VarBar:Add, ComboBox, vProduct gproductVarBar Center h30 x0 r10 y0 w80, %product%|%DDLProducts%	
	GUI, VarBar:Font, s12 cBlack Bold, Consolas
	Gui, VarBar:add, Text, vBatch x88 y0 w1200, %Batch%
	GUI, VarBar:Font, s9 cBlack , Arial Narrow
	Gui, VarBar:add, Text, vlot x90 y16 w120, %Lot%
	GUI, VarBar:Font, s7 cBlack , arial
	Gui, VarBar:add, Text, vCoated x140 y18 w100, %Coated%
	GUI, VarBar:Font, s8 cBlack , arial Narrow
	Gui, VarBar:add, Text, vname  x170 -wrap y0 w160, %Name%
	Gui, VarBar:add, Text, vcustomer  x210 -wrap y16 w160, %Customer%
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
try
{
	XL:= ComObjActive("Excel.Application")
			Visible := True
	XL:=XL.Sheets(Product).activate
}
;Excel.Connect()
Varbar.Update()
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
	coordmode, mouse, Window
	IniWrite, %VarBar_X%, data.ini, Locations, VarBar_X
	IniWrite, %VarBar_Y%, data.ini, Locations, VarBar_Y
	sleep 500
	GUI, VarBar:destroy
return
}


Update(Skip:=0){
	global
	Gui VarBar:+LastFound
	GuiControl, -redraw, varbar
	try Product:=XL.Range("B7").Value
		ControlSetText, Edit1,%Product%, VarBar
	try Batch:=XL.Range("C1").Value
		ControlSetText, Static1,%Batch%, VarBar
	try Lot:=XL.Range("C2").Value
		ControlSetText, Static2,%lot%, VarBar
	try Coated:=xl.range("E2").value
		ControlSetText, Static3,%Coated%, VarBar
	try Name:=XL.Range("B2").Value
		ControlSetText, Static4,%Name%, VarBar
	try Customer:=XL.Range("B3").Value	
		ControlSetText, Static5,%Customer%, VarBar
		if (Skip := Iteration)
			ControlSetText, Edit2,%Iteration%, VarBar
			GuiControl, +redraw, varbar
			Return
}





get(Category)
{
	Global
	If Category contains Product
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

Send(Category)
{
	Global
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
	Send, %output%
	if WinActive("NuGenesis LMS - \\Remote") || WinActive("Select Product - \\Remote")
		send, {enter}	
	if winactive("Find and Replace")
		send, !i
	sleep 400
	return
}


Set(Input:=0){
	global
			Gui VarBar:+LastFound ; +AlwaysOnTop  -Caption  +ToolWindow +owner ; +E0x20 
	send, ^c
			; XL := ComObjActive("Excel.Application")
	sleep 200
	clipForProduct:= Clipboard
	clipForBatch:= Clipboard
	If (Regexmatch(ClipforProduct, "\b[EGLHKJI]{1}\d{3}", ClipForProduct) > 0) 	
	{
		; Product:=ClipforProduct
		Try {
			 XL:=XL.Sheets(Clipforproduct).activate
			 varbar.Update("iteration")
			 Gui, VarBar:color, 21a366 ;green
		}
		catch
		{
		; Regexmatch(ClipforProduct, "\b[EGLHKJI]{1}\d{3}\b", ClipForProduct) 
			ControlSetText, Edit1,%clipforProduct%, VarBar
		ControlSetText, Static2,, VarBar
		ControlSetText, Static3,, VarBar
		ControlSetText, Static4,, VarBar
		ControlSetText, Static5,, VarBar
			Gui, VarBar:color, 847545 ;brown
		}
		return
		exit
	}
	; tooltip, % Regexmatch(ClipforBatch, "\b\d{3}-\d{4}\b", ClipforBatch)
	if (Regexmatch(ClipforBatch, "\b\d{3}-\d{4}\b", ClipforBatch) > 0)
	{
		; Batch:=ClipforBatch
		Gui VarBar:+LastFound 
		Gui, VarBar:submit,NoHide
			
		 ControlSetText, Static1,%ClipforBatch%, VarBar
		; GuiControl, Text, Batch, %Batch%
		ControlSetText, Static2,, VarBar
		ControlSetText, Static3,, VarBar
		ControlSetText, Static4,, VarBar
		ControlSetText, Static5,, VarBar
		Gui, VarBar:color, 847545 ;brown
	}
	else If input contains Lot
		ControlSetText, Static2,%clip%, VarBar
	else If input contains Coated
		ControlSetText, Static3,%clip%, VarBar
	else If input contains Name
		ControlSetText, Static4,%clip%, VarBar
	else If input contains Customer
		ControlSetText, Static5,%clip%, VarBar
	else If input contains Iteration
		ControlSetText, Edit2,%clip%, VarBar
	else
	return
}

Search(input){
	global
	varbar.set()
	WinActivate, NuGenesis LMS - \\Remote
	click, 500,127, 2 ;click search bar
	sleep 200
	varbar.Send(input)
}


Relocate() 
{
	global
	PostMessage, 0xA1, 2 
	keywait, Lbutton, U
	coordmode, mouse, Screen
	WinGetPos,VarBar_X,VarBar_Y,w,h
	coordmode, mouse, Window
	sleep 300
	IniWrite, %VarBar_X%, data.ini, Locations, VarBar_X
	IniWrite, %VarBar_Y%, data.ini, Locations, VarBar_Y
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
}

}