SetWorkingDir "C:\Users\mmignin\OneDrive - Vitaquest International\VQuest"
mymenu() 
{
	Global
	
	If Winactive("Edit sample template - \\Remote") || Winactive("Edit specification - \\Remote")
	{
		Excel_Connect()
		Menu, myMenu, add, Analytical, myMenuHandler
		Menu, myMenu, add, Physical, myMenuHandler
		Menu, myMenu, add, Micro, myMenuHandler
		Menu, myMenu, add, Retain, myMenuHandler
		Menu, myMenu, Show,
	}
	Else
	{
		;Varbar()
		;Menu, myMenu, Add, %Iteration%, myMenuHandler
		
		Menu, myMenu, Add, &Product GUI`t%Product% , myMenuHandler
		;menu, mymenu, icon, &Product Code`t%Product%, lib\Product.png,,0 
		Menu, myMenu, Add, &Spec GUI`t%Product%, myMenuHandler
		Menu, myMenu, Add, &Name `t %Name%, myMenuHandler
		Menu, myMenu, Add, &Customer `t %Customer%, myMenuHandler
		Menu, myMenu, Add, Test &1, myMenuHandler
		Menu, myMenu, Add, Test &2, myMenuHandler
		menu, mymenu, add
		;Menu, myMenu, Add, QuickSelect, myMenuHandler
		;Menu, QuickSelectMenu, Add, Enter Results, myMenuHandler
		;Menu, myMenu, Add, QuickSelect, :QuickSelectMenu
		Menu, myMenu, Show,
	}
	return
	
	
	myMenuHandler:
	if A_ThisMenuItem between 1 and 5
	{
		Iteration:=A_ThisMenuItem
		iniwrite, %Iteration%,data.ini,Iterations, 1
		;Save_Code("Iterations", %A_ThisMenuItem%)
	}
	
	else if A_thismenuitem contains &Product GUI
		run, ProductTab_GUI.ahk
	else if A_thismenuItem contains &Spec GUI
		run, SpecTab_GUI.ahk
	
	else if A_thismenuitem contains Analytical 
		SpecTab_Edit_Analytical()
	else if A_thismenuitem contains Retain
		SpecTab_Edit_Retain()
	else if A_thismenuitem contains Micro
		SpecTab_Edit_Micro()
	else if A_thismenuitem contains Physical
		SpecTab_Edit_Physical()		
	else if A_thismenuitem contains Test &1
		Test()	
	else if A_thismenuitem contains Test &2
		Test2()	
	else
		menu, mymenu, deleteAll
	return
	
}

;#Include  Functions.ahk