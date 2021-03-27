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
	Gui VarBar:+LastFound +AlwaysOnTop  -Caption  +ToolWindow +owner ; +E0x20 
	WinSet, Transparent, 200
	Gui, VarBar:color, 21a366
	GUI, VarBar:Font, s17 cBlack Bold, Consolas
	Gui, VarBar:Add, ComboBox, vProduct gproductVarBar h30 x0 r10 y0 w80, %product%|%DDLProducts%	
	GUI, VarBar:Font, s12 cBlack Bold, Consolas
	Gui, VarBar:add, Text, vBatch x88 y0 w1200, %Batch%
	GUI, VarBar:Font, s9 cBlack Bold, Consolas
	Gui, VarBar:add, Text, vlot x100 y16 w120, %Lot%
	Gui, VarBar:add, Text, vname  x170 -wrap y0 w180, %Name%
	Gui, VarBar:add, Text, vcustomer  x180 -wrap y16 w170, %Customer%
	GUI, VarBar:Font, s14 cBlack Bold, Consolas
	Gui, VarBar:Add, Edit, gIterationVarBar vIteration x340 h35 y0 w90,
	Gui, VarBar:Add, UpDown, vIterationUpDown wrap x380 h30 y0 w0 Range-300-600, %Iteration%
	OnMessage(0x203, "VarBar.Relocate")
	CoordMode, mouse, screen
	Gui, VarBar:Show, h30 x%VarBar_X% y%VarBar_y%  w400 NoActivate, VarBar
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
Catch
	return
Excel_Connect()
;GuiControl, ,Edit1,%Product%
GuiControl, ,Static1,%Batch%
GuiControl, ,Static2,%lot%
GuiControl, ,Static3,%Name%
GuiControl, ,Static4,%Customer%
GuiControl, ,Edit2,%iteration%
return
IterationVarBar:
	sleep 600
	Gui, VarBar:Submit,Nohide
	ControlGetText, Iteration, Edit2, VarBar
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



get(Category)
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
Send(Category)
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
	; sleep 150
	Send, %output%
	; sleep 150
	if WinActive("NuGenesis LMS - \\Remote") || WinActive("Select Product - \\Remote")
		send, {enter}	
	sleep 400
	return
}


Set(Input:=0){
	global
			Gui VarBar:+LastFound ; +AlwaysOnTop  -Caption  +ToolWindow +owner ; +E0x20 
	send, ^c
; sleep 200	ClipWait, 1.0
sleep 200
	clipForProduct:= Clipboard
	clipForBatch:= Clipboard
	If (Regexmatch(ClipforProduct, "\b[EGLHKJI]{1}\d{3}", ClipForProduct) > 0) 	
	{
		; Product:=ClipforProduct
		Try {
			; XL := ComObjActive("Excel.Application")
			 XL:=XL.Sheets(Clipforproduct).activate
			Excel_Connect(0)
			Product:=XL.Range("B7").Value
			Name:=Xl.Range("B2").Value
			Batch:=Xl.Range("C1").Value
			Lot:=Xl.Range("E1").Value
			Customer:=Xl.Range("B3").Value
			ControlSetText, Edit1,%Product%, VarBar
			ControlSetText, Static1,%Batch%, VarBar
			ControlSetText, Static2,%lot%, VarBar
			ControlSetText, Static3,%Name%, VarBar
			ControlSetText, Static4,%Customer%, VarBar
			;varbar.show()
			; exit
			;gui, varbar:submit, Nohide
		}
		catch
		{
		; Regexmatch(ClipforProduct, "\b[EGLHKJI]{1}\d{3}\b", ClipForProduct) 
			ControlSetText, Edit1,%clipforProduct%, VarBar
			;VarBar.show()
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
			Gui, VarBar:color, 21a366
		 ControlSetText, Static1,%ClipforBatch%, VarBar
		; GuiControl, Text, Batch, %Batch%
		; VarBar.show()
		ControlSetText, Static3,, VarBar
		ControlSetText, Static4,, VarBar
	}
	else If input contains Lot
		ControlSetText, Static2,%clip%, VarBar
	else If input contains Name
		ControlSetText, Static3,%clip%, VarBar
	else If input contains Customer
		ControlSetText, Static4,%clip%, VarBar
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
	sleep 100
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