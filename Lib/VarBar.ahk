F13 & LButton::Sendinput, +^4 ;screenshot

F13 & MButton::Sendinput, % Varbar_get(Product)
F13 & WheelLeft::Sendinput, % Varbar_get(Product)
F13 & WheelUp::Sendinput, % Varbar_get(lot)
F13 & WheelRight::Sendinput, % Varbar_get(Batch)
Mbutton & F15::Varbar_Reset()
#If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4000) && winactive("ahk_exe OUTLOOK.EXE")
{
	f13::Mouse_Wheelcopy() 
	Wheelup::Set_lot()
	Wheeldown::sendinput, #v
	Wheelleft::
	Save_Code("Products") ;
	Set_Product()
	return
	F17::
	Wheelright::
	sendinput, ^+{right 2}
	Save_Code("Batches") 
	return  
	#if
}
#If (A_PriorHotKey = "F13" AND A_TimeSincePriorHotkey < 4000)
{
	f13::Mouse_Wheelcopy() 
	Wheelup::Varbar_SetLot(Mouse_clip()) ;Set_lot()
	Wheeldown::sendinput, #v
	F16::
	Wheelleft::Varbar_SetProduct(Mouse_clip()) 
	F17::
	Wheelright::Varbar_SetBatch(Mouse_clip()) 
	Lbutton::^+4 ;screenshot
	Rbutton::OCR()
	mbutton::Varbar_SetProduct(Mouse_clip())
	#If
}
F13:: Tooltip("☩",4000)
#if










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
	Gui, VarBar:Add, Edit, gIterationVarbar  x340 h35 y0 w60,
	Gui, VarBar:Add, UpDown, vIteration wrap x380 h35 y0 w0 Range1-5, %Iteration%
	OnMessage(0x203, "VarBar_Relocate")
	
	
	CoordMode, mouse, screen
	Gui, VarBar:Show, h35 x%VarBar_X% y%VarBar_y%  w370 NoActivate, VarBar
	CoordMode, mouse, window
	
	return
}


ProductVarBar:
Gui, VarBar:submit,NoHide
;Excel_SetProduct(Product)
try
{
	XL := ComObjActive("Excel.Application")
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
DebugWindow("Iteration after submit: " Iteration,0,1,10,0,0)
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


VarBar_GetProduct() 
{
	global
	ControlGetText, Product, Edit1, VarBar
	Return %Product%
}
VarBar_GetIteration() 
{
	global
	ControlGetText, Iteration, Edit2, VarBar
	Return %Iteration%
}
Varbar_getlot()
{
	global
	ControlGetText, lot, Static2, VarBar
	Return %lot%
}
;iniread, Product, data.ini, Products, 1
varbar_get(output)
{
	Global
	If Output contains Product
		The_GuiElement:="Edit1"
	else If Output contains Batch
		The_GuiElement:="Static1"
	else If Output contains Lot
	{
		ControlGetText, lot, Static2, VarBar
		Return %lot%
	}
	else If Output contains Name
		The_GuiElement:="Static3"
	else If Output contains Customer
		The_GuiElement:="Static4"
	else If (Output:= "Iteration")
		The_guielement:="Edit2"
	;ControlGetText, Output, %The_GuiElement%, VarBar
	sleep 100
	Return %Output%
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

Varbar_Set(Input)
{
	clip:= Mouse_clip()
	If input contains Product
		The_GuiElement:="Edit1"
	else If input contains Batch
		The_GuiElement:="Static1"
	else If input contains Lot
		The_GuiElement:="Static2"
	else If input contains Name
		The_GuiElement:="Static3"
	else If input contains Customer
		The_GuiElement:="Static4"
	else If input   := Iteration
		The_guielement:="Edit2"
		ControlSetText, %The_GuiElement%,%clip%, VarBar
	DebugWindow("input: " input,0,1,10,0,0)
}
Varbar_Setlot(input) 
{
	Global
	Lot:=Input
	ControlSetText, Static2,%lot%, VarBar
}

Varbar_SetBatch(input) 
{
	Global
	Batch:=Input
	ControlSetText, Static1,%Batch%, VarBar
}
Varbar_SetProduct(input) 
{
	Global
	Var:=Input
	;iniwrite, %Var%, data.ini,Products, 0
	ControlSend, %Edit1%, ^a%Var%{enter}, VarBar
	try
	{
		XL := ComObjActive("Excel.Application")
		XL:=XL.Sheets(Var).activate
	}
	Catch
		Return
	Product:=XL.Range("B7").Value
	Name:=Xl.Range("B2").Value
	Batch:=Xl.Range("C1").Value
	Lot:=Xl.Range("E1").Value
	Customer:=Xl.Range("B3").Value
	Excel_Connect()
	ControlSetText, Edit1, %Product%
	ControlSetText, Static1,%Batch%, VarBar
	ControlSetText, Static2,%lot%, VarBar
	ControlSetText, Static3,%Name%, VarBar
	ControlSetText, Static4,%Customer%, VarBar
	;ControlSend, %CNN%, {enter}, VarBar
	;Gui, VarBar:submit, NoHide
	;debugwindow("var: "Var "`nProduct: " Product)
	return 
}

