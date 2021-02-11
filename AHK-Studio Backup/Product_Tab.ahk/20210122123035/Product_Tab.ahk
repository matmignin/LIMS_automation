
return

PRODUCT_TAB_HOTKEYS: 
#IfWinActive, Edit Product - \\Remote ; top window has customer and trade name .etc
	wheelleft::EditProduct(ProductCode)

#ifwinactive, Edit Formulation - \\Remote  ;the products   before composition (Reportable Quality, shape color)
	WheelRight::Send,{Tab 14}{Return} 
	wheelleft::
	F15::Shape_and_Size(){
		
	
	}
	
	
	
#ifwinactive, Composition - \\Remote    ;products tab>Formulation>Composistion ;  list of COA ingredients to add
	Wheelleft::QuickSelectNextIngredient() 
	WheelRight::click 84, 72
	
	
#ifwinactive, Edit Ingredient - \\Remote ;  (ingredient dropdown, position, description, label claim, ingredient group
	;\::Select(ingredient_ID_dropdown)
	wheelright::IngredientSelect()
	Wheelleft::run, GUI_ProductTable.ahk
	Enter::click 265, 561 ;OK_EditIngredient
	+Enter::sendinput, {enter}

	
	
Formulation_Hotstrings: ;{:::::::::::::::::::::::::::::
#IfWinActive, ahk_exe WFICA32.EXE
Capslock::return
	:*R:#00\::#00 capsule / 0.917” x 0.336”
	:*R:#3\::`#3 capsule / 0.626” x 0.229”
	:*R:#2\::`#2 capsule / 0.709” x 0.250”
	:*R:#1\::`#1 capsule / 0.765” x 0.272”
	:*R:#0\::`#0 capsule / 0.854” x 0.300”
	:*:1\::`Each (1)  contains{ctrl down}{left}{ctrl up}{left}
	:*:2\::`Each two (2)  contains{ctrl down}{left}{ctrl up}{left}
	:*:3\::`Each three (3)  contains{ctrl down}{left}{ctrl up}{left}
	:*:4\::`Each four (4)  contains{ctrl down}{left}{ctrl up}{left}
	:*:5\::`Each five (5)  contains{ctrl down}{left}{ctrl up}{left}
	:*:6\::`Each six (6)  contains{ctrl down}{left}{ctrl up}{left}
	:*:7\::`Each seven (7)  contains{ctrl down}{left}{ctrl up}{left}
	:*:NMT30::`NMT 30 Minutes
	:*:NMT5::`NMT 5 mcg/day
	:*:NMT15::`NMT 15 mcg/day
	:*:H\::Heavy Metals `*
	:*:*H::`* Heavy Metals results are based on a daily dose of (1) capsule{ctrl down}{left}{left}{ctrl up}{right}
;}






#Include GUI_ProductTable.ahk