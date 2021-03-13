
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
	;Iniread, Product, data.ini, Products, 0
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
;Product:=Product    
;Product:= Trim(Product, "`r`n")
;iniwrite, %Product%, data.ini,Products, 0
;iniwrite, %Batch%,data.ini,Batches, Batch
return
BatchVarBar:
Gui, VarBar:submit, NoHide
return

IterationVarbar:
Gui, Varbar:Submit,Nohide
Iteration:=Iteration
iniwrite, %iteration%, data.ini, iteration, 
sleep 600
;Save_Code("Iteration",Iteration)
DebugWindow("Iteration: " Iteration,0,1,10,0,0)
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
	;Gui, VarBar:Show, h30 x%VarBar_X% y%VarBar_y%  w390 ;  NoActivate
	varbar(0)
}

VarBar_LoadData()
{
	iniread, Lot, data.ini, Lots, 1
	iniread, Product, data.ini, Products, 1
	loop 5 {
		iniread, Temp, data.ini, Batches, [A_Index]
		Batches[A_index]:=Temp
	}
	loop 5 {
		iniread, Temp, data.ini, Products, [A_Index]
		Products[A_index]:=Temp
	}
}
Varbar_Setlot(input) 
{
	Global
	Lot:=Input
	;iniwrite, %Var%, data.ini,Products, 0
	;ControlSend, %Edit1%, ^a%Var%{enter}, VarBar
	ControlSetText, Static2,%lot%, VarBar
	;ControlSetText, Static2,%lot%, VarBar
	;Gui, VarBar:submit, NoHide
	return 
}

Varbar_SetBatch(input) 
{
	Global
	Batch:=Input
	;iniwrite, %Var%, data.ini,Products, 0
	;ControlSend, %Edit1%, ^a%Var%{enter}, VarBar
	ControlSetText, Static1,%Batch%, VarBar
	;ControlSetText, Static2,%lot%, VarBar
	;Gui, VarBar:submit, NoHide
	return 
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
		tooltip(no dice)
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

VarBar_Get(Output) 
{
	global
	;iniread, Product, data.ini, Products, 1
	If Output contains Product
		GuiElement:="Edit1"
	If Output contains Batch
		GuiElement:="Static1"
	If Output contains Lot
		GuiElement:="Static2"
	If Output contains Name
		GuiElement:="Static3"
	If Output contains Customer
		GuiElement:="Static4"
	ControlGetText, Output, %GuiElement%, VarBar
	sleep 100
	Return %Output%
}