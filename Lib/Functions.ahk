


Varbar_Save(Code,Section,Index:=0)
{
Global
temp:=Code


}


Save_Code(Code, Input:=0)
{
	global
	If (Input = 0)
	{
		tooltip, %Code%
		ClipSaved := ClipboardAll
		Clipboard := ""
		Send, {ctrl down}c{ctrl up}       
		ClipWait 1.0
		If !ErrorLevel 
		{
			N := "([^\S]+\S+[^\S])+"
			Regexmatch(Clipboard, N, Clipboard)
			Stringreplace, Clipboard , Clipboard , `R , , All
			%Code%.Insert(1, clipboard)
			clipboard := ClipSaved 
			VarBar()
			sleep 900
		}
	}
	else if (input <> 0) 
	{
		%Code%.Insert(1, Input)
		Input:=0
	}
	for i in %Code% {	
		value := %Code%[A_index]
		iniwrite, %Value%, data.ini, %Code%, %a_index%
		
		;Gui, Var:submit,NoHide
	}
	Tooltip,
	return
}








Send_Product() 
{
	global
	iniread, Product, data.ini, Products, 1
	Product := Trim(Product, "`r`n")
	sleep 100
	If Winexist("Find and Replace") 
	{
		winactivate
		send, !n%Product%!i
	}
	else if winactive("ahk_exe explorer.exe")
	{
		;Send, ^e^a
		sendinput, ^e%Product%
		sleep 300
		send, {enter}
		return
	}
	else If winactive("NuGenesis LMS - \\Remote")
	{
		Sendinput, %Product%{enter}
		return
	}
	else
		Sendinput, %Product%
	sleep 800
	return
}
send_Customer()
{
	global
	;Envget, Customer, Customer
	Customer:= Trim(Customer, "`r`n")
	sendinput, %Customer%
	sleep 800
	return
}
send_Name()
{
	global
	Name:= Trim(Name, "`r`n")
	sendinput, %Name%
	sleep 800
	return
}
send_Lot()
{
	global
	;Envget, Lot, Lot
	Lot:= Trim(Lot, "`r`n")
	sendinput, %lot%
	sleep 800
	return
}
Send_Batch() 
{ 
	global
	iniread, Batch, data.ini, Batches, 1
	Batch:= Trim(Batch, "`r`n")
	If Winexist("Find and Replace") 
	{
		winactivate
		send, !n%Batch%!i
	}
	else if winactive("Outlook")
	{
		;Send, ^e^a
		sendinput, %Batch% is updated.
		sleep 200
		return
	}
	else If winactive("NuGenesis LMS - \\Remote")
	{
		Sendinput, %Batch%{enter}  ;{Click 361, 41}{Click 620, 119, 2} click bar
			return
		}
		else 
			Sendinput, %Batch%
		sleep 800
	}
	
	Set_Product() 
	{ 
		global
		ToolTip, Product
		PreClip:= ClipboardAll
		sleep 200
		Send, ^c    
		clipwait, 0.25
		Clipboard := StrReplace(Clipboard, "`r`n")
		sleep 100
		Product:=Clipboard    
		clipwait, 0.25
		Clipboard:=Preclip
		Sleep 200
		VarBar()
		sleep 400
		tooltip,
		return 
	}
	
	Set_lot() 
	{ 
		global
		ToolTip, Lot
		PreClip:=ClipboardAll
		sleep 100
		Sendinput, ^c    
		clipwait, 0.25
		Clipboard := StrReplace(Clipboard, "`r`n")
		sleep 100
		Lot:=Clipboard 
		clipwait, 0.25
		Clipboard:=Preclip
		sleep 100
		;Envset, lot, %Lot%
		Sleep 200
		VarBar()
		sleep 400
		tooltip,
		return %Lot%
	}
	
	Set_Batch() 
	{
		global
		Batch_Code:=Batch
		sleep 100
		Batches.insert(Batch_code)
		Sleep 200
		For i, Batch in Batches
			iniwrite, %Batch%, data.ini, Batches, %a_index%
		VarBar()
		sleep 200
		return
	}
	
	Set_Batch2() 
	{
		global
		ToolTip, Batch
		PreClip:=ClipboardAll
		sleep 100
		Send, ^c    
		clipwait, 0.25
		Clipboard := StrReplace(Clipboard, "`r`n")
		sleep 100
		Batch_Code:=Clipboard
		clipwait, 0.25
		Clipboard:=Preclip
		sleep 100
		Batches.insert(Batch_code)
		Sleep 200
		VarBar()
		sleep 200
		tooltip,
		return ; %Batch%
	}
	
	Set_Customer() 
	{
		global
		ToolTip, Customer
		PreClip:=ClipboardAll
		sleep 100
		Send, ^c    
		clipwait, 0.25
		Clipboard := StrReplace(Clipboard, "`r`n")
		sleep 100
		Customer:=Clipboard
		clipwait, 0.25
		Clipboard:=Preclip
		sleep 100
		Sleep 200
		VarBar()
		sleep 200
		tooltip,
		return 
	}


	
	