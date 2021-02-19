

VariableBar()

VariableBar() { 
	Global
	Gui Var:destroy
	EnvGet, ProductCode, ProductCode
	EnvGet, Batch, Batch
	Envget, Name, Name
	Envget, Customer, Customer
	Envget, Lot, Lot
	Envget, Description, Description
	Envget, Iteration, Iteration
	
	GUI, Var:Font, s20 cBlack Bold, Consolas
	Gui, Var:Add, Edit, r1 h25 x0 y-6 w80 Limit4 WantReturn vProductCode gProductCodeVar, %ProductCode%
	Gui Var:+LastFound +AlwaysOnTop  -Caption  +ToolWindow ; +E0x20 
	;Gui, Var:add, Text, h25 x0 y-6  +Left, %ProductCode% 
	Gui, Var:color, ef6950	 
	WinSet, Transparent, 200
	GUI, Var:Font, s20 cBlack Bold, Consolas
	GUI, Var:Font, s11 cBlack Bold, Consolas
	Gui, Var:add, Text, h2 x95 y-2 +left, %Batch%
	Gui, Var:add, Text, h40 x95 y12 +left, %Lot%
	GUI, Var:Font, s10 cBlack Bold, Consolas
	Gui, Var:add, Text, h2 x190 y-2 +right, %Name%
	Gui, Var:add, Text, h30 x200 y12 +right, %Customer%
	envget, Varbar_X, Varbar_X
	envget, VarBar_Y, VarBar_Y
	/*
		gui, Var:add, button, x100 y20 w100 h20 g1, %Batch%
		gui, Var:add, button, x150 y20 w100 h20 g2, %Batch2%
		gui, Var:add, button, x200 y20 w100 h20 g3, %Batch3%
		gui, Var:add, button, x250 y20 w100 h20 g4, % BatchArray[0]
	*/
	Try Gui, Var:Show, h30 x%Varbar_X% y%VarBar_Y% w390  NoActivate
	catch
		Gui, Var:Show, h30 x1400 y0 w390  NoActivate
	OnMessage(0x201, "WM_LBUTTONDOWN")
	sendinput, {shift}{ctrl}{alt}{alt}
	
	return
	
	
	gui, show
	return
}
UpdateVar()
{
	global
	ClipSaved := ClipboardAll
	Send, ^c        ; copy the selected word
	ClipWait 1      ; wait for the clipboard to contain data
	If !ErrorLevel  ; If NOT ErrorLevel clipwait found data on the clipboard
	{
		Index++     ; checks the number in the variable "Index" and increases it by 1, each time you press esc.
		if (Index = MaxIndex+1) ; when the specific amount of words is exceeded
		{
			Index := 1      ; set this variable to 1
			MyArray := []   ; recreate the object (empty the array)
		}
		MyArray.Insert(Index, clipboard)    
	}
	Sleep, 300
	clipboard := ClipSaved  ; restore original clipboard
	return
	
	
}

ProductCodeVar:
	run, LMS\GUI_ProductTable.ahk
	return
	Gui, Var:submit,NoHide
	ProductCode:=ProductCode    
	EnvSet, ProductCode, %ProductCode%
	return
BatchVar:
	Gui, Var:submit,NoHide
	Batch:=Batch    
	EnvSet, Batch, %Batch%
	return
ScreenHandler:
VariableBar_Relocate()

;-------------------------------------------------------------------------------
WM_LBUTTONDOWN() { ; move window
	;-------------------------------------------------------------------------------
	PostMessage, 0xA1, 2 ; WM_NCLBUTTONDOWN
	return
}

VariableBar_Relocate() {
	global
	keywait, Rbutton, U
	;MouseClick, Right,,, 1, 0, U ; Release the mouse button.
	coordmode, mouse, Screen
	MouseGetPos, VarBar_X, VarBar_Y
	sleep 100
	envset, Varbar_X, %Varbar_X%
	envset, VarBar_Y, %VarBar_Y%
	coordmode, mouse, Window
	;VariableBar()
	return
}


return