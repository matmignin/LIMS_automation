
F15(){
global
	If Winactive("NuGenesis LMS - \\Remote"){
		MyMenu()

	} Else If winactive("Edit sample template - \\Remote"){
		mymenu()
	} Else If winactive("Results Definition - \\Remote"){
		return
	} Else If winactive("Test Definition Editor - \\Remote "){
			Menu, Results_DefinitionMenu, Add, USP Heavy Metal, Results_DefinitionMenuHandler
			Menu, Results_DefinitionMenu, Add, Canada Heavy Metal, Results_DefinitionMenuHandler
			Menu, Results_DefinitionMenu, Add, Prop65 Heavy Metal, Results_DefinitionMenuHandler
			Menu, Results_DefinitionMenu, Show,
			return
			Results_DefinitionMenuHandler:
			if (A_ThisMenuItem = "USP Heavy Metal")
				HeavymetalsComponentsUS_Spec_Tab()
			else if (A_ThisMenuItem = "Canada Heavy Metal")
				HeavymetalsComponentsCanada_Spec_Tab()
			else if (A_ThisMenuItem = "Prop65 Heavy Metal")
				HeavymetalsComponentsProp65_Spec_Tab()
			return
			
} else
	return
}
	
	
	
;_________________________________________________________________________
;_________________________________________________________________________F15	
	
	F15 & Wheelup::Send_lot()
	F15 & Wheeldown::

	F15 & LButton::^Lbutton
	F15 & Rbutton:: 
	F15 & Wheelleft::Send_ProductCode()
	F15 & MButton::VariableBar_Relocate()
	F15 & Wheelright::Send_Batch()
	F15 & F14::#tab