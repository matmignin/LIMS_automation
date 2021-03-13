return


/*
	} else if winactive("Edit Product - \\Remote"){
		
		
		;F13::Mouse_Click("OK_Product_Tab_EditIngredient")
		
		;+Enter::sendinput, {enter}
		
*/
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



ProductTab_EditProduct() 
{
	global
	Excel_Connect()
	click 120, 80 ;click product box
	Sendinput,%Product%`,{space}%Name%{tab 2}%Customer%{tab 2}{right 2}{tab}{right 3}{tab}%Product%{tab 2}
	sleep 200
	sendinput,%Name%{tab 8}
	winwaitactive, NuGenesis LMS - \\Remote, , 6
	Mouse_Click("Add_Formulation")
	winactivate,  Edit Formulation - \\Remote
	return
}


ProductTab_DropDown_Ingredient()
{
	global
	Menu, IngredientMenu, Add, Creatine, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &A.1, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &B.1, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &C.1, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &D.1, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &E.1, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &F.1, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &G, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &H, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &I, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &J, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &K, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &L, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &M, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &N, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &O, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &P, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &Q, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &R, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &S, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &T, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &U, IngredientMenuHandler
	Menu, IngredientMenu, Add, Generic Ingredient &V, IngredientMenuHandler
	Menu, IngredientMenu, Add, Glucosamine, IngredientMenuHandler
	Menu, IngredientMenu, Add, &Ingredient Note 1, IngredientMenuHandler
	Menu, IngredientMenu, Add, &Ingredient Note 2, IngredientMenuHandler
	Menu, IngredientMenu, Add, &Ingredient Note 3, IngredientMenuHandler
	Menu, IngredientMenu, Add, &Methylsulfonylmethane (MSM), IngredientMenuHandler
	Menu, IngredientMenu, Add, Molybdenum, IngredientMenuHandler
	Menu, IngredientMenu, Add, PABA, IngredientMenuHandler
	Menu, IngredientMenu, Add, Protein, IngredientMenuHandler
	Menu, IngredientMenu, Add, Quercetin Dihydrate, IngredientMenuHandler
	Menu, IngredientMenu, Add, Taurine, IngredientMenuHandler
	Menu, IngredientMenu, Add, Total Probiotic, IngredientMenuHandler
	Menu, IngredientMenu, Show,
	return
	
	IngredientMenuHandler:
	
	if (A_ThisMenuItem ="&Biotin") 
		Sendinput, {click 150,73}{tab}{right 21}
	else if (A_ThisMenuItem ="Cadmium") 
		Sendinput, {click 150,73}{tab}{right 23}
	
	else if (A_ThisMenuItem ="Choline") 
		Sendinput, {click 150,73}{tab}{right 30}
	else if (A_ThisMenuItem ="&Chromium") 
		Sendinput, {click 150,73}{tab}{right 32}
	else if (A_ThisMenuItem ="Coenzyme Q10") 
		Sendinput, {click 150,73}{tab}{right 34}
	
	else if (A_ThisMenuItem ="Creatine") 
		Sendinput, {click 150,73}{tab}{right 36}
	else if (A_ThisMenuItem ="&Folic Acid") 
		Sendinput, {click 150,73}{tab}{right 52}
	else if (A_ThisMenuItem ="Generic Ingredient &A.1") 
		Sendinput, {click 150,73}{tab}{right 57}
	else if (A_ThisMenuItem ="Generic Ingredient &B.1") 
		Sendinput, {click 150,73}{tab}{right 63}
	else if (A_ThisMenuItem ="Generic Ingredient &C.1") 
		Sendinput, {click 150,73}{tab}{right 69}
	else if (A_ThisMenuItem ="Generic Ingredient &D.1") 
		Sendinput, {click 150,73}{tab}{right 75}
	else if (A_ThisMenuItem ="Generic Ingredient &E.1") 
		Sendinput, {click 150,73}{tab}{right 81}
	else if (A_ThisMenuItem ="Generic Ingredient &F.1") 
		Sendinput, {click 150,73}{tab}{right 87}
	else if (A_ThisMenuItem ="Generic Ingredient &G") 
		Sendinput, {click 150,73}{tab}{right 93}
	else if (A_ThisMenuItem ="Generic Ingredient &H") 
		Sendinput, {click 150,73}{tab}{right 94}
	else if (A_ThisMenuItem ="Generic Ingredient &I") 
		Sendinput, {click 150,73}{tab}{right 96}
	else if (A_ThisMenuItem ="Generic Ingredient &J") 
		Sendinput, {click 150,73}{tab}{right 98}
	else if (A_ThisMenuItem ="Generic Ingredient &K") 
		Sendinput, {click 150,73}{tab}{right 100}
	else if (A_ThisMenuItem ="Generic Ingredient &L") 
		Sendinput, {click 150,73}{tab}{right 101}
	else if (A_ThisMenuItem ="Generic Ingredient &M") 
		Sendinput, {click 150,73}{tab}{right 102}
	else if (A_ThisMenuItem ="Generic Ingredient &N") 
		Sendinput, {click 150,73}{tab}{right 103}
	else if (A_ThisMenuItem ="Generic Ingredient &O") 
		Sendinput, {click 150,73}{tab}{right 104}
	else if (A_ThisMenuItem ="Generic Ingredient &P") 
		Sendinput, {click 150,73}{tab}{right 105}
	else if (A_ThisMenuItem ="Generic Ingredient &Q") 
		Sendinput, {click 150,73}{tab}{right 106}
	else if (A_ThisMenuItem ="Generic Ingredient &R") 
		Sendinput, {click 150,73}{tab}{right 107}
	else if (A_ThisMenuItem ="Generic Ingredient &S") 
		Sendinput, {click 150,73}{tab}{right 108}
	else if (A_ThisMenuItem ="Generic Ingredient &T") 
		Sendinput, {click 150,73}{tab}{right 109}
	else if (A_ThisMenuItem ="Generic Ingredient &U") 
		Sendinput, {click 150,73}{tab}{right 110}
	else if (A_ThisMenuItem ="Generic Ingredient &V") 
		Sendinput, {click 150,73}{tab}{right 111}
	else if (A_ThisMenuItem ="Glucosamine") 
		Sendinput, {click 150,73}{tab}{right 127}
	else if (A_ThisMenuItem ="Glycine") 
		Sendinput, {click 150,73}{tab}{right 131}
	else if (A_ThisMenuItem ="&Ingredient Note 1") 
		Sendinput, {click 150,73}{tab}{right 139}
	else if (A_ThisMenuItem ="&Ingredient Note 2") 
		Sendinput, {click 150,73}{tab}{right 141}
	else if (A_ThisMenuItem ="&Ingredient Note 3") 
		Sendinput, {click 150,73}{tab}{right 142}
	else if (A_ThisMenuItem ="Inositol") 
		Sendinput, {click 150,73}{tab}{right 149}
	else if (A_ThisMenuItem ="Lead") 
		Sendinput, {click 150,73}{tab}{right 166}
	else if (A_ThisMenuItem ="&L-Tyrosine") 
		Sendinput, {click 150,73}{tab}{right 180}
	else if (A_ThisMenuItem ="Malic Acid") 
		Sendinput, {click 150,73}{tab}{right 185}
	else if (A_ThisMenuItem ="Mercury") 
		Sendinput, {click 150,73}{tab}{right 188}
	else if (A_ThisMenuItem ="&Methylsulfonylmethane (MSM)") 
		Sendinput, {click 150,73}{tab}{right 190}
	else if (A_ThisMenuItem ="Molybdenum") 
		Sendinput, {click 150,73}{tab}{right 194}
	else if (A_ThisMenuItem ="PABA") 
		Sendinput, {click 150,73}{tab}{right 205}
	else if (A_ThisMenuItem ="Protein") 
		Sendinput, {click 150,73}{tab}{right 219}
	else if (A_ThisMenuItem ="Quercetin Dihydrate") 
		Sendinput, {click 150,73}{tab}{right 223}
	else if (A_ThisMenuItem ="Taurine") 
		Sendinput, {click 150,73}{tab}{right 246}
	else if (A_ThisMenuItem ="Total Probiotic") 
		Sendinput, {click 150,73}{tab}{right 257}
	else
		return
	return
	
}

ProductTab_QuickSelectNextIngredient() 
{
	Global
	;Winactivate, Composition - \\Remote
	sleep 200
	Click, 47,67 ;click Add
	sleep 200
	winactivate, Edit Ingredient - \\Remote
	;click 280, 75 ;click dropdown
	;ProductTab_DropDown_Ingredient()	
}
ProductTab_tabletsizeMenu()
{
	Menu, tabletsizeMenu, Add, Round / 0.34375”, 		tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 0.365” deep / 0.365”, 		tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, Round / 0.375”, 			tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, Round / 0.40625”, 		tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, Round / 0.4375”, 			tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, Round / 0.625”, 			tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, Round / 0.500”, 			tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, Round / 0.750”, 			tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, Round / 1.000”, 			tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add
	Menu, tabletsizeMenu, Add, 5 ½ oval / 0.625” x 0.344”, 				tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 5 cap oblong / 0.750” x 0.250”, 			tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 5 ½ cap oblong / 0.750” x 0.313”, 		tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 5 ½ bisect oblong / 0.750” x 0.313”, 		tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, mod oblong (4 cap) / 0.687” x 0.281”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 6 mod oblong 0.748” x 0.380”, 				tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 6 ¼ mod oblong 0.775” x 0.400”, 				tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 6 ½ mod oblong 0.875” x 0.375”, 				tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 7 mod oblong 0.910” x 0.405”, 				tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 6 special oblong / 0.825” x 0.325”, 			tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 6 cap oblong / 0.830” x 0.320”, 				tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 6 ½ cap oblong / 0.860” x 0.330”, 				tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, 6 oval / 0.760” x 0.325”, 					tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add
	Menu, tabletsizeMenu, Add, Small “M” Oval Fit punch / 0.672” x 0.336”,	 tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, bisect oval / 0.750” x 0.350”,		 tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, oval / 0.750” x 0.375”, 				tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, Triangle (Tri-G) / 0.375” (height), 			tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, Square / 0.390” x 0.390”, 					tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, Hexagon / 0.433”, 						tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add
	Menu, tabletsizeMenu, Add, #3 capsule / 0.626” x 0.229”, 				tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, #2 capsule / 0.709” x 0.250”, 				tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, #1 capsule / 0.765” x 0.272”, 				tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, #0 capsule / 0.854” x 0.300”, 				tabletsizeMenuHandler
	Menu, tabletsizeMenu, Add, #00 capsule / 0.917” x 0.336”, 				
	Menu, tabletsizeMenu, Add, #00 elongated capsule / 0.995” x 0.336”, tabletsizeMenuHandler
	Menu, tabletsizeMenu, Show
	return
	
	tabletsizeMenuHandler:
	send, ^a
	sleep 200
	if (A_ThisMenuItem = "11/32” round / 0.34375”") 
		SendRaw, 11/32” round / 0.34375”
	else if (A_ThisMenuItem = "0.365” deep / 0.365”") 
		SendRaw, 0.365” deep / 0.365”
	else if (A_ThisMenuItem = "3/8” round / 0.375”") 
		SendRaw, 3/8” round / 0.375”"
	else if (A_ThisMenuItem = "13/32” round 0.40625”") 
		SendRaw, 13/32” round 0.40625”"
	else if (A_ThisMenuItem = "7/16” round / 0.4375”") 
		SendRaw, 7/16” round / 0.4375”
	else if (A_ThisMenuItem = "1/2” round / 0.500”") 
		SendRaw, 1/2” round / 0.500”
	else if (A_ThisMenuItem = "5/8” round / 0.625”") 
		SendRaw, 5/8” round / 0.625”
	else if (A_ThisMenuItem = "3/4” round / 0.750”") 
		SendRaw, 3/4” round / 0.750”
	else if (A_ThisMenuItem = "1” round / 1.000”") 
		SendRaw, 1” round / 1.000”
	else if (A_ThisMenuItem = "5 ½ oval / 0.625” x 0.344”") 
		SendRaw, oval / 0.625” x 0.344”
	else if (A_ThisMenuItem = "5 cap oblong / 0.750” x 0.250”") 
		SendRaw, cap oblong / 0.750” x 0.250”
	else if (A_ThisMenuItem = "5 ½ cap oblong / 0.750” x 0.313”") 
		SendRaw, cap oblong / 0.750” x 0.313”
	else if (A_ThisMenuItem = "5 ½ bisect oblong / 0.750” x 0.313”") 
		SendRaw, bisect oblong / 0.750” x 0.313”
	else if (A_ThisMenuItem = "mod oblong (4 cap) / 0.687” x 0.281”") 
		SendRaw, mod oblong (4 cap) / 0.687” x 0.281”
	else if (A_ThisMenuItem = "6 mod oblong 0.748” x 0.380”") 
		SendRaw, 6 mod oblong 0.748” x 0.380”
	else if (A_ThisMenuItem = "6 ¼ mod oblong 0.775” x 0.400”") 
		SendRaw, 6 ¼ mod oblong 0.775” x 0.400”
	else if (A_ThisMenuItem = "6 ½ mod oblong 0.875” x 0.375”") 
		SendRaw, 6 ½ mod oblong 0.875” x 0.375”
	else if (A_ThisMenuItem = "7 mod oblong 0.910” x 0.405”") 
		SendRaw, 7 mod oblong 0.910” x 0.405”
	else if (A_ThisMenuItem = "6 special oblong / 0.825” x 0.325”") 
		SendRaw, 6 special oblong / 0.825” x 0.325”
	else if (A_ThisMenuItem = "6 cap oblong / 0.830” x 0.320”") 
		SendRaw, 6 cap oblong / 0.830” x 0.320”
	else if (A_ThisMenuItem = "6 ½ cap oblong / 0.860” x 0.330”") 
		SendRaw, 6 ½ cap oblong / 0.860” x 0.330”
	else if (A_ThisMenuItem = "6 oval / 0.760” x 0.325”") 
		SendRaw, 6 oval / 0.760” x 0.325”
	else if (A_ThisMenuItem = "Small “M” Oval Fit punch / 0.672” x 0.336”") 
		SendRaw, Small “M” Oval Fit punch / 0.672” x 0.336”
	else if (A_ThisMenuItem = "bisect oval / 0.750” x 0.350”") 
		SendRaw, bisect oval / 0.750” x 0.350”
	else if (A_ThisMenuItem = "750x375 oval / 0.750” x 0.375”") 
		SendRaw, 750x375 oval / 0.750 x 0.375
	else if (A_ThisMenuItem = "Triangle (Tri-G) / 0.375” (height)”") 
		SendRaw, Triangle (Tri-G) / 0.375” (height)
	else if (A_ThisMenuItem = "Square / 0.390” x 0.390”") 
		SendRaw, Square / 0.390” x 0.390”
	else if (A_ThisMenuItem = "Hexagon / 0.433”") 
		SendRaw, Hexagon / 0.433”
	else if (A_ThisMenuItem = "#3 capsule / 0.626” x 0.229”") 
		Sendraw, #3 capsule / 0.626” x 0.229”
	else if (A_ThisMenuItem = "#2 capsule / 0.709” x 0.250”") 
		Sendraw, #2 capsule / 0.709” x 0.250”
	else if (A_ThisMenuItem = "#1 capsule / 0.765” x 0.272”") 
		Sendraw, #1 capsule / 0.765” x 0.272”
	else if (A_ThisMenuItem = "#0 capsule / 0.854” x 0.300”") 
		Sendraw, #0 capsule / 0.854” x 0.300”
	else if (A_ThisMenuItem = "#00 capsule / 0.917” x 0.336”") 
		sendRaw, #00 capsule / 0.917” x 0.336”
	else if (A_ThisMenuItem = "#00 capsule / 0.917” x 0.336”") 
		sendRaw, #00 elongated capsule / 0.995” x 0.336” 
	return
	Sleep 100
	return
}