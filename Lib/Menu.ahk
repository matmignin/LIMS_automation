SetWorkingDir "C:\Users\mmignin\OneDrive - Vitaquest International\VQuest"
Menu() 
{
	Global
	try 
	menu, menu, deleteAll
	
	If Winactive("Edit sample template - \\Remote") || Winactive("Edit specification - \\Remote")
	{
		Excel_Connect()
		Menu, Menu, add, &Analytical, Menu
		Menu, Menu, add, &Physical, Menu
		Menu, Menu, add, &Micro, Menu
		Menu, Menu, add, &Retain, Menu		
		Menu, Menu, add, &Coated_Physical, Menu
		Menu, Menu, add, &Coated_Retain, Menu
		Menu, Menu, Show,
	}
	Else
	{
		;Varbar()	
		
		;menu, menu, icon, &Product Code`t%Product%, lib\Product.png,,0 
		menu, menu, Add, Table&s`t%Product%, menu
		menu, SubMenu, Add, &Product Table, menu
		menu, SubMenu, Add, &Spec Table, menu
		menu, menu, add, Table&s`t%Product%, :Submenu
		
		Menu, Menu, Add, &Name `t %Name%, Menu
		Menu, Menu, Add, &Customer `t %Customer%, Menu
		menu, menu, add
		Menu, Menu, Add, Test &1, Menu
		Menu, Menu, Add, Test &2, Menu
		/*
			Menu, Menu, Add, QuickSelect, Menu
			Menu, SubMenu, Add, Enter Results, Menu
			Menu, Menu, Add, QuickSelect, :SubMenu
		*/
		Menu, Menu, Show,
	}
	return
	
	Menu:
	if A_ThisMenuItem between 1 and 5
	{
		Iteration:=A_ThisMenuItem
		iniwrite, %Iteration%,data.ini,Iterations, 1
		;Save_Code("Iterations", %A_ThisMenuItem%)
	}
	
	else if A_thismenuitem contains &Product Table
		ProductTab_Table()
	else if A_thismenuItem contains &Spec Table
		SpecTab_Table()
	
	else if A_thismenuitem contains &Analytical 
		SpecTab_Edit_Analytical()
	else if A_thismenuitem contains &Coated_Retain
		SpecTab_Edit_CoatedRetain()
	else if A_thismenuitem contains &Coated_Physical
		SpecTab_Edit_CoatedPhysical()
	else if A_thismenuitem contains &Retain
		SpecTab_Edit_Retain()
	else if A_thismenuitem contains &Micro
		SpecTab_Edit_Micro()
	else if A_thismenuitem contains &Physical
		SpecTab_Edit_Physical()		
	else if A_thismenuitem contains Test &1
		Test()	
	else if A_thismenuitem contains Test &2
		Test2()	
	else
		menu, menu, deleteAll
	return
	
}

;#Include  Functions.ahk