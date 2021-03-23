
VarBar(X:=1, Y:=1, Destroy:="Reset")
{ 
	Global
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
	Gui, VarBar:color, ef6950	 
	GUI, VarBar:Font, s20 cBlack Bold, Consolas
	Gui, VarBar:Add, Edit, h35 x0 y0 w80 -Wantreturn vProductVar , %Product%
	gui, varbar:Add, Button, +Default gProductVarBar
	GUI, VarBar:Font, s10 cBlack Bold, Consolas
	Gui, VarBar:add, Text, vBatch x90 y0 w100, %Batch%
	Gui, VarBar:add, Text, vlot x100 y18 w100, %Lot%
	Gui, VarBar:add, Text, vname  x170 -wrap y0 w160, %Name%
	Gui, VarBar:add, Text, vcustomer  x175 -wrap y18 w160, %Customer%
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
	XL:=XL.Sheets(ProductVar).activate
}
Catch
	return
Excel_Connect()
;GuiControl, ,Edit1, %Product%
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
	Sendinput, %output%
	if WinActive("NuGenesis LMS - \\Remote") || WinActive("Select Product - \\Remote")
		send, {enter}	
	sleep 500
	return
}


Varbar_Set(Input)
{
	global
	clip:= Mouse_clip()
	If input contains Product		
	{
		GuiElement:="Edit1"
		Product:=Clip
		;ControlSetText, Edit1, %clip%, VarBar
		Try {
			XL := ComObjActive("Excel.Application")
			XL:=XL.Sheets(Var).activate
			Product:=XL.Range("B7").Value
			Name:=Xl.Range("B2").Value
			Batch:=Xl.Range("C1").Value
			Lot:=Xl.Range("E1").Value
			Customer:=Xl.Range("B3").Value
			Excel_Connect()
			ControlSetText, Static1,%Batch%, VarBar
			ControlSetText, Static2,%lot%, VarBar
			ControlSetText, Static3, %Name%, VarBar
			ControlSetText, Static4,%Customer%, VarBar
			Gui, VarBar:color, 21a366
		}
		catch
			Gui, VarBar:color, ef6950	
	}
	else If input contains Batch
		GuiElement:="Static1"
	else If input contains Lot
		GuiElement:="Static2"
	else If input contains Name
		GuiElement:="Static3"
	else If input contains Customer
		GuiElement:="Static4"
	else If input contains Iteration
		guielement:="Edit2"
	ControlSetText, %GuiElement%,%clip%, VarBar
	;DebugWindow("clip: " clip, 1,1,10,0,0)
	;debugwindow("Input: " Input "  Guielement: " GuiElement,0,1,10)
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

; Varbar_Addup(){
; 	global
;  Iteration:= Iteration +1
; gosub, IterationVarbar
; ;Tooltip(Iteration)
; ; Controlsettext, %Iteration%, Edit2, varbar
; ;Varbar()
; ;gui, VarBar:submit,NoHide
; return
; }