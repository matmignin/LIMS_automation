return
#Include LMS\GUI_ProductTable.ahk
#IfWinActive, Edit Product - \\Remote 
	wheelleft::Product_Tab_EditProduct(ProductCode)

#ifwinactive, Edit Formulation - \\Remote  
	WheelRight::Product_Tab_tabletsizeMenu()
	wheelleft::sendinput,{tab}%ProductCode%+{tab 7}
		
	
#ifwinactive, Composition - \\Remote   
	;Wheelup::Product_Tab_QuickSelectNextIngredient() 
	WheelRight::click("Edit")
	Wheelleft::run, LMS\GUI_ProductTable.ahk
	
#ifwinactive, Edit Ingredient - \\Remote ;  
	wheelright::Product_Tab_DropDown_Ingredient()
	Wheelleft::run, LMS\GUI_ProductTable.ahk
	F13::click("OK_Product_Tab_EditIngredient")
	Enter::click("OK_Product_Tab_EditIngredient")
	+Enter::sendinput, {enter}

#ifwinactive, ;}

	
	
Formulation_Hotstrings: ;{:::::::::::::::::::::::::::::
#IfWinActive, ahk_exe WFICA32.EXE
Capslock::return
	:*R:#00\::#00 capsule / 0.917” x 0.336”
	:*R:#3\::`#3 capsule / 0.626” x 0.229”
	:*R:#2\::`#2 capsule / 0.709” x 0.250”
	:*R:#1\::`#1 capsule / 0.765” x 0.272”
	:*R:#0\::`#0 capsule / 0.854” x 0.300”
	:*R:7/16\::`7/16” round / 0.4375”
	:*R:5 1/2\::`5 ½ cap oblong / 0.750” x 0.313”

;#ifwinactive,
;\::
;Gui, List_tabletsize:Default
;Gui, +lastFound ;+ToolWindow +Owner +AlwaysOnTop 
;Gui, List_TabletSize:Add, ListView, x0 y0 r10 w320 Grid gList_TabletSize, Tablet Size|text
;GUI, List_TabletSizes:Font, s16 cBlack Bold, Consolaont, s16 cBlack Bold, Consolas
;LV_add(,"5/16” round / 0.3125”")
;LV_add(,"11/32” round / 0.34375”")
;LV_add(,"0.365” deep / 0.365”")
;LV_add(,"3/8” round / 0.375”")
;LV_add(,"13/32” round 0.40625”")
;LV_add(,"7/16” round / 0.4375”")
;LV_add(,"1/2” round / 0.500”")
;LV_add(,"5/8” round / 0.625”")
;LV_add(,"3/4” round / 0.750”")
;LV_add(,"1” round / 1.000”")

;Gui, List_TabletSizes:Show, ,Tablet Size
;return
	
	
;List_TabletSize:
;if (A_GuiEvent = "DoubleClick" )  {	
	;LV_GetText(TabletSize, A_EventInfo,1)
	;msgbox % tabletsize
	;}
;return
	
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




return




