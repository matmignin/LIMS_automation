
VarBar(X:=1, Y:=1, Destroy:="Reset")
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
		Varbar_X:=0
		varbar_y:=0
	}
	if (Destroy:="Reset")
		GUI, VarBar:destroy
	Gui VarBar:+LastFound +AlwaysOnTop  -Caption  +ToolWindow +owner ; +E0x20 
	WinSet, Transparent, 200
	Gui, VarBar:color, 21a366
 
	GUI, VarBar:Font, s18 cBlack Bold, Consolas
	; Gui, VarBar:Add, Edit, h35 x0 y0 w80 -Wantreturn vProductVar , %Product%
	
	Gui, VarBar:Add, ComboBox, vProductvar gproductVarbar h35 x0 r10 y0 w80, %Product%|%DDLProducts%	
	; Gui, VarBar:Add, DropDownList, vProductvar gproductVarbar h35 x0 r10 y0 w80, %Product%|%DDLProducts%	


	; gui, varbar:Add, Button, +Default gProductVarBar
	GUI, VarBar:Font, s12 cBlack Bold, Consolas
	Gui, VarBar:add, Text, vBatch x88 y0 w1200, %Batch%
	GUI, VarBar:Font, s10 cBlack Bold, Consolas
	Gui, VarBar:add, Text, vlot x100 y18 w120, %Lot%
	Gui, VarBar:add, Text, vname  x180 -wrap y0 w180, %Name%
	Gui, VarBar:add, Text, vcustomer  x235 -wrap y18 w170, %Customer%
	GUI, VarBar:Font, s15 cBlack Bold, Consolas
	Gui, VarBar:Add, Edit, gIterationVarbar vIteration x340 h35 y0 w60,
	Gui, VarBar:Add, UpDown, vIterationUpDown wrap x380 h35 y0 w0 Range1-5, %Iteration%
	OnMessage(0x203, "VarBar_Relocate")
	CoordMode, mouse, screen
	Gui, VarBar:Show, h35 x%VarBar_X% y%VarBar_y%  w370 NoActivate, VarBar
	CoordMode, mouse, window

	return
}
ProductVarBar:
Gui, VarBar:submit,NoHide
try
{
	XL:= ComObjActive("Excel.Application")
			Visible := True
	XL:=XL.Sheets(ProductVar).activate
}
Catch
	return
Excel_Connect()
GuiControl, ,Static1,%Batch%
GuiControl, ,Static2,%lot%
GuiControl, ,Static3,%Name%
GuiControl, ,Static4,%Customer%
GuiControl, ,Edit2,%iteration%
return
BatchVarBar:
	Gui, VarBar:submit, NoHide
	ControlGetText, Batch, Static1, VarBar
	return
IterationVarbar:
	sleep 600
	Gui, Varbar:Submit,Nohide
	ControlGetText, Iteration, Edit2, VarBar
	return
VarBarGuiClose:
	coordmode, mouse, Screen
	WinGetPos,VarBar_X,Varbar_Y,w,h
	coordmode, mouse, Window
	sleep 100
	IniWrite, %VarBar_X%, data.ini, Locations, VarBar_X
	IniWrite, %VarBar_Y%, data.ini, Locations, VarBar_Y
	sleep 500
	GUI, VarBar:destroy
return



varbar_get(Category)
{
	Global
	If Category contains Product
		ControlGetText, Output, Edit1, VarBar
	else If Category contains Batch
		ControlGetText, Output, Static1, VarBar
	else If Category contains Lot
	{
		ControlGetText, lot, Static2, VarBar
		Return %lot%
	}
	else If Category contains Name
		ControlGetText, Output, Static3, VarBar
	else If Category contains Customer
		ControlGetText, Output, Static4, VarBar
	else If Category contains Iteration
		ControlGetText, Output, Edit2, VarBar
	sleep 100
		Return %ouput%
}
varbar_Send(Category)
{
	Global
	If Category contains Product
		ControlGetText, Output, Edit1, VarBar
	else If Category contains Batch
		ControlGetText, Output, Static1, VarBar
	else If Category contains Lot
	{
		ControlGetText, lot, Static2, VarBar
		Return %lot%
	}
	else If Category contains Name
		ControlGetText, Output, Static3, VarBar
	else If Category contains Customer
		ControlGetText, Output, Static4, VarBar
	else If Category contains Iteration
		ControlGetText, Output, Edit2, VarBar
	sleep 150
	Send, %output%
	sleep 150
	if WinActive("NuGenesis LMS - \\Remote") || WinActive("Select Product - \\Remote")
		send, {enter}	
	sleep 600
	return
}


Varbar_Set(Input:=0){
	global
	clipForProduct:= Clip()
	clipForBatch:= ClipForProduct
	tooltip % Regexmatch(ClipforProduct, "\b[EGLHKJI]{1}\d{3}", ClipforProduct)
	If (Regexmatch(ClipforProduct, "\b[EGLHKJI]{1}\d{3}", ClipForProduct) > 0) 	
	{
		Product:=ClipforProduct
		Try {

			XL := ComObjActive("Excel.Application")
			XL:=XL.Sheets(Var).activate
			Product:=XL.Range("B7").Value
			Name:=Xl.Range("B2").Value
			Batch:=Xl.Range("C1").Value
			Lot:=Xl.Range("E1").Value
			Customer:=Xl.Range("B3").Value
			;VarBar(1,1,1)
			; Excel_Connect()
			; Gui, VarBar:color, 21a366 ;green
			ControlSetText, Static1,%Batch%, VarBar
			ControlSetText, Static2,%lot%, VarBar
			ControlSetText, Static3,%Name%, VarBar
			ControlSetText, Static4,%Customer%, VarBar
		
		}
		catch
		{
			Gui VarBar:+LastFound ; +AlwaysOnTop  -Caption  +ToolWindow +owner ; +E0x20 
			ControlSetText, Edit1,%clipforProduct%, VarBar
			VarBar()
			Gui, VarBar:color, ef6950 ;red
		}
		Regexmatch(ClipforProduct, "\b[EGLHKJI]{1}\d{3}\b", ClipForProduct) 
	}
	tooltip, % Regexmatch(ClipforBatch, "\b\d{3}-\d{4}\b", ClipforBatch)
	if (Regexmatch(ClipforBatch, "\b\d{3}-\d{4}\b", ClipforBatch) > 0)
	{
		Batch:=ClipforBatch
		Gui VarBar:+LastFound ; +AlwaysOnTop  -Caption  +ToolWindow +owner ; +E0x20 
		; Regexmatch(Clip, "\b\d{3}-\d{4}\b", Clip) 
		; Gui, VarBar:color, ef6950	
		; GUI, VarBar:Font, s18 cBlack Bold, Consolas
		ControlSetText, Static1,%clip%, VarBar
		;Gui, VarBar:submit,NoHide
		VarBar()
		ControlSetText, Static3,, VarBar
		ControlSetText, Static4,, VarBar
		Gui, VarBar:color, ef6950 ;red
	}
	else If input contains Lot
		ControlSetText, Static2,%clip%, VarBar
	else If input contains Name
		ControlSetText, Static3,%clip%, VarBar
	else If input contains Customer
		ControlSetText, Static4,%clip%, VarBar
	else If input contains Iteration
		ControlSetText, Edit2,%clip%, VarBar
	; ControlSetText, %GuiElement%,%clip%, VarBar
	else
	return
}


Varbar_Focus() {
	global
	ControlFocus, Edit1,VarBar
	return
}

VarBar_Relocate() 
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
VarBar_Reset()
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
	varbar(0)
}

