
ProductTab_Table(){
	Global
	try GUI ingredient_table:destroy
	Iniread,ProductTable_X,data.ini,Locations,ProductTable_X
	Iniread,ProductTable_Y,data.ini,Locations,ProductTable_Y
	Excel_Connect()
	Name:=			[]
	LabelClaim:=	[]
	Position:=		[]
	LabelName:=		[]
	Sub_Table_height:=0
	while (Xl.Range("M" . A_Index+7).Value != "") {
		Position[A_index]:=		Xl.Range("F" . A_Index+7).Text
		Name[A_index]:=			Xl.Range("K" . A_Index+7).text
		LabelClaim[A_index]:=	Xl.Range("L" . A_Index+7).Text
		LabelName[A_index]:=	Xl.Range("M" . A_Index+7).Text
		Total_rows:=			A_index +1
		Table_Height:=			A_index
		if (Xl.Range("F" . A_Index+7).text = "")
			Sub_Table_Height:=Sub_Table_Height+1			
	}
	Table_Height:=Table_height-Sub_table_Height
	Gui,Ingredient_Table:Default
	Gui,Ingredient_Table:+LastFound +ToolWindow +Owner +AlwaysOnTop ;-SysMenu 
	GUI,Ingredient_Table:Font,s11 cBlack arial ;Consolas
	Gui,Ingredient_Table:Add,ListView,x0 y0 r%Table_height% W500 Grid NoSortHdr -hdr checked gIngredient_Table,`t |`t|`t|LabelName	
	loop,%Total_Rows% {
		if Position[A_index] =""
		{
			Total_rows:=total_rows - 1
			continue
		}
		else	
			LV_Insert(A_index,"",Position[A_index],Name[A_index],LabelClaim[A_index],LabelName[A_index])
	}
	Gui,Ingredient_Table:Add,Checkbox,vAutoEnter x20,Auto-Enter Results?
	LV_ModifyCol(1,50) 
	LV_ModifyCol(2,200)
	LV_ModifyCol(3,180)			
	LV_ModifyCol(4,0)
	sleep 100		
	CoordMode,mouse,screen
	Gui,Ingredient_Table:Show,x%ProductTable_X% y%ProductTable_Y% w320,%Product%
	CoordMode,mouse,window
	return	
}
	
Ingredient_Table:
	if (A_GuiEvent = "DoubleClick") {
		Gui,Ingredient_Table:submit,NoHide
		Rows_left:=((LV_GetCount()-A_EventInfo)*Autoenter)+1
		Current_Row:=A_EventInfo
		Loop % Rows_left {
			Excel_Get_Current_row()
			ProductTab_EditIngredient(LabelName,LabelClaim,Position)
			if WinExist("Duplicate ingredient ID - \\Remote")
				break 
			
			sleep 300
		}
	}
	return



ProductTab_EditIngredient(Ingredient_Name,Ingredient_Claim,Ingredient_Position){
	Global
	Excel_Get_Current_row()
	Ingredient_Name:=Trim(Ingredient_Name,"`r`n")
	Ingredient_Claim:=Trim(Ingredient_Claim,"`r`n")
	Ingredient_position:=Trim(Ingredient_Position,"`r`n")
	ifWinnotexist, Edit Ingredient - \\Remote
	{	
		WinActivate,Composition - \\Remote
		Mouse_Click("add_Composition")
		sleep 100
		ProductTab_Select_Ingredient()
	}
	if Winexist("Edit Ingredient - \\Remote")
	{
		Winactivate,
		}
	sleep 200
	send,{tab 6}^a%Ingredient_position%{tab}^a
	Sendinput,%Ingredient_Name%
	sleep 100
	If Ingredient_Claim contains Heavy Metal,Allergens
		send,{tab}
	send,{tab 2}^a
	send,%Ingredient_Claim%
	Sleep 400
	Current_Row:= Current_Row+1
	send,{enter}
	return
}




Ingredient_TableGuiClose:
	coordmode,window,Screen
	WinGetPos,ProductTable_X,ProductTable_Y
	sleep 100
	IniWrite,%ProductTable_X%,data.ini,Locations,ProductTable_X
	IniWrite,%ProductTable_Y%,data.ini,Locations,ProductTable_Y
	coordmode,window,Window
	sleep 500
	GUI,Ingredient_Table:destroy
	return



ProductTab_Select_Ingredient() {
	Global
	if Name contains Alpha-Lipoic acid 
		Sendinput,{click 150,73}{tab}{right 10}
	else if Name contains Alpha Lipoic acid 
		Sendinput,{click 150,73}{tab}{right 10}
	else if Name contains ALA 
		Sendinput,{click 150,73}{tab}{right 10}
	else if Name contains Arsenic 
		Sendinput,{click 150,73}{tab}{right 11}
	else if Name contains Biotin 
		Sendinput,{click 150,73}{tab}{right 21}
	else if Name contains Cadmium 
		Sendinput,{click 150,73}{tab}{right 23}
	else if Name Contains Acetyl L-Carnitine HCL 
		Sendinput,{click 150,73}{tab}{right 6}
	else if Name Contains Citicoline sodium 
	{
		Sendinput,{click 150,73}{tab}
		ProductTab_DropDown_Ingredient()
	}
	else if Name Contains Caffeine 
		Sendinput,{click 150,73}{tab}{right 24}
	else if Name contains Calcium 
		Sendinput,{click 150,73}{tab}{right 25}
	else if Name contains Choline 
		Sendinput,{click 150,73}{tab}{right 30}
	else if Name contains Chromium 
		Sendinput,{click 150,73}{tab}{right 32}
	else if Name contains Coenzyme Q 
		Sendinput,{click 150,73}{tab}{right 34}
	else if Name contains Copper 
		Sendinput,{click 150,73}{tab}{right 35}
	else if Name contains Creatine 
		Sendinput,{click 150,73}{tab}{right 36}
	else if LabelName contains calcium L-5-methyltetrahydrofolate
		Sendinput,{click 150,73}{tab}{right 4}
	else if LabelName contains methyltetrahydrofolate
		Sendinput,{click 150,73}{tab}{right 4}
	else if Name contains Folic Acid
		Sendinput,{click 150,73}{tab}{right 52}
	else if Name contains Folate 
		Sendinput,{click 150,73}{tab}{right 52}
	else if Name contains Glucosamine 
		Sendinput,{click 150,73}{tab}{right 127}
	else if Name contains Glycine 
		Sendinput,{click 150,73}{tab}{right 131}		
	else if Name contains Inositol	
		Sendinput,{click 150,73}{tab}{right 150}
	else if Name contains Iodide 	
		Sendinput,{click 150,73}{tab}{right 153}
	else if Name contains Iron 	
		Sendinput,{click 150,73}{tab}{right 155}
	else if Name contains L-Alanine	
		Sendinput,{click 150,73}{tab}{right 161}
	else if Name contains L-Arginine	
		Sendinput,{click 150,73}{tab}{right 162}
	else if Name contains L-Carnitine	
		Sendinput,{click 150,73}{tab}{right 163}
	else if Name contains L-Cysteine	
		Sendinput,{click 150,73}{tab}{right 164}
	else if Name contains L-Cystine	
		Sendinput,{click 150,73}{tab}{right 165}
	else if Name contains Lead 	
		Sendinput,{click 150,73}{tab}{right 167}
	else if Name contains L-Glutamic Acid	
		Sendinput,{click 150,73}{tab}{right 168}
	else if Name contains L-Glutamine	
		Sendinput,{click 150,73}{tab}{right 169}
	else if Name contains L-Glutathione	
		Sendinput,{click 150,73}{tab}{right 170}
	else if Name contains Glycine	
		Sendinput,{click 150,73}{tab}{right 171}
	else if Name contains L-Isoleucine	
		Sendinput,{click 150,73}{tab}{right 172}
	else if Name contains Leucine	
		Sendinput,{click 150,73}{tab}{right 173}
	else if Name contains Lysine	
		Sendinput,{click 150,73}{tab}{right 174}
	else if Name contains L-Methionine	
		Sendinput,{click 150,73}{tab}{right 175}
	else if Name contains Phenylalanine	
		Sendinput,{click 150,73}{tab}{right 178}
	else if Name contains L-Theanine	
		Sendinput,{click 150,73}{tab}{right 179}
	else if Name contains L-Tryptophan	
		Sendinput,{click 150,73}{tab}{right 180}
	else if Name contains L-Tyrosine 	
		Sendinput,{click 150,73}{tab}{right 181}
	else if Name contains Magnesium 	
		Sendinput,{click 150,73}{tab}{right 185}
	else if Name contains Malic Acid 	
		Sendinput,{click 150,73}{tab}{right 186}
	else if Name contains Manganese 	
		Sendinput,{click 150,73}{tab}{right 187}
	else if Name contains Mercury 	
		Sendinput,{click 150,73}{tab}{right 189}
	else if Name contains Methylsulfonylmethane 	
		Sendinput,{click 150,73}{tab}{right 191}
	else if Name contains MSM 	
		Sendinput,{click 150,73}{tab}{right 191}
	else if Name contains Molybdenum 	
		Sendinput,{click 150,73}{tab}{right 195}
	else if Name contains Niacin 	
		Sendinput,{click 150,73}{tab}{right 204}
	else if Name contains PABA 	
		Sendinput,{click 150,73}{tab}{right 206}
	else if Name contains Pantothenic Acid 	
		Sendinput,{click 150,73}{tab}{right 208}
	else if Name contains Phosphorus 	
		Sendinput,{click 150,73}{tab}{right 214}
	else if Name contains Potassium 	
		Sendinput,{click 150,73}{tab}{right 217}
	else if Name contains Protein 	
		Sendinput,{click 150,73}{tab}{right 220}
	else if Name contains Quercetin Dihydrate 	
		Sendinput,{click 150,73}{tab}{right 224}
	else if Name contains Riboflavin 	
		Sendinput,{click 150,73}{tab}{right 230}
	else if Name contains Selenium 	
		Sendinput,{click 150,73}{tab}{right 237}
	else if Name contains Sodium 	
		Sendinput,{click 150,73}{tab}{right 239}
	else if Name contains Taurine 	
		Sendinput,{click 150,73}{tab}{right 247}
	else if Name contains Thiamin 	
		Sendinput,{click 150,73}{tab}{right 250}	
	else if Name contains Probiotic Blend 
		Sendinput,{click 150,73}{tab}{end}{up 17}
	else if Name contains Total Probiotic 
		Sendinput,{click 150,73}{tab}{end}{up 17}
	else if Name contains Vitamin A 
		Sendinput,{click 150,73}{tab}{end}{up 13}
	else if Name contains Vitamin B12 
		Sendinput,{click 150,73}{tab}{end}{up 12}
	else if Name contains Vitamin B6 
		Sendinput,{click 150,73}{tab}{end}{up 11}
	else if Name contains Vitamin C 
		Sendinput,{click 150,73}{tab}{end}{up 10}
	else if Name contains Vitamin D 
		Sendinput,{click 150,73}{tab}{end}{up 9}
	else if Name contains Vitamin E 
		Sendinput,{click 150,73}{tab}{end}{up 8}
	else if Name contains Vitamin K 
		Sendinput,{click 150,73}{tab}{end}{up 7}
	else if Name contains Zinc 
		Sendinput,{click 150,73}{tab}{end}
	else {
		Sendinput,{click 150,73}{tab}
		ProductTab_DropDown_Ingredient()
	} 
	
}	



Formulation_Hotstrings: 
#IfWinActive,ahk_exe WFICA32.EXE
	:*R:#00\::`#00 capsule / 0.917`" x 0.336`"
	:*R:#3\::`#3 capsule / 0.626`" x 0.229`"
	:*R:#2\::`#2 capsule / 0.709`" x 0.250`"
	:*R:#1\::`#1 capsule / 0.765`" x 0.272`"
	:*R:#0\::`#0 capsule / 0.854`" x 0.300`"

	:*R:7/16\::`7/16`" round / 0.4375`"
	:*R:5.5 oblong\::"oblong / 0.750`" x 0.313`"
	:*R:5.5 oval\::"oval / 0.625`" x 0.344`""
	:*R:5 oblong\::"oblong / 0.750`" x 0.250`""
	:*:1\::`Each (1)  contains{ctrl down}{left}{ctrl up}{left}
	:*:2\::`Each two (2)  contains{ctrl down}{left}{ctrl up}{left}
	:*:3\::`Each three (3)  contains{ctrl down}{left}{ctrl up}{left}
	:*:4\::`Each four (4)  contains{ctrl down}{left}{ctrl up}{left}
	:*:5\::`Each five (5)  contains{ctrl down}{left}{ctrl up}{left}
	:*:6\::`Each six (6)  contains{ctrl down}{left}{ctrl up}{left}
	:*:7\::`Each seven (7)  contains{ctrl down}{left}{ctrl up}{left}
	:*:scoop\::scoop ( g){left 3}{tab}Blend+{tab}
	:*:NMT30::`NMT 30 Minutes
	:*:NMT5::`NMT 5 mcg/day
	:*:NMT15::`NMT 15 mcg/day
	:*:H\::Heavy Metals `*
	:*:*H::`* Heavy Metals results are based on a daily dose of (1) capsule{ctrl down}{left}{left}{ctrl up}{right}
;}





ProductTab_EditProduct() {
	global
	Excel_Connect()
	click 120,80 ;click product box
	Sendinput,%Product%`,{space}%Name%{tab 2}%Customer%{tab 2}{right 2}{tab}{right 3}{tab}%Product%{tab 2}
	sleep 200
	sendinput,%Name%{tab 8}
	winwaitactive,NuGenesis LMS - \\Remote,,6
	Mouse_Click("Add_Formulation")
	winactivate,Edit Formulation - \\Remote
	return
}


ProductTab_DropDown_Ingredient(){
	global
	Menu,IngredientMenu,Add,Creatine, IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &A.1,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &B.1,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &C.1,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &D.1,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &E.1,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &F.1,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &G,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &H,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &I,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &J,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &K,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &L,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &M,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &N,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &O,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &P,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &Q,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &R,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &S,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &T,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &U,IngredientMenuHandler
	Menu,IngredientMenu,Add,Generic Ingredient &V,IngredientMenuHandler
	Menu,IngredientMenu,Add,Glucosamine,IngredientMenuHandler
	Menu,IngredientMenu,Add,&Ingredient Note 1,IngredientMenuHandler
	Menu,IngredientMenu,Add,&Ingredient Note 2,IngredientMenuHandler
	Menu,IngredientMenu,Add,&Ingredient Note 3,IngredientMenuHandler
	Menu,IngredientMenu,Add,&Methylsulfonylmethane (MSM),IngredientMenuHandler
	Menu,IngredientMenu,Add,Molybdenum,IngredientMenuHandler
	Menu,IngredientMenu,Add,PABA,IngredientMenuHandler
	Menu,IngredientMenu,Add,Protein,IngredientMenuHandler
	Menu,IngredientMenu,Add,Quercetin Dihydrate,IngredientMenuHandler
	Menu,IngredientMenu,Add,Taurine,IngredientMenuHandler
	Menu,IngredientMenu,Add,Total Probiotic,IngredientMenuHandler
	Menu,IngredientMenu,Show,
	return
	
	IngredientMenuHandler:
	if (A_ThisMenuItem ="&Biotin") 
		Sendinput,{click 150,73}{tab}{right 21}
	else if (A_ThisMenuItem ="Cadmium") 
		Sendinput,{click 150,73}{tab}{right 23}
	else if (A_ThisMenuItem ="Choline") 
		Sendinput,{click 150,73}{tab}{right 30}
	else if (A_ThisMenuItem ="&Chromium") 
		Sendinput,{click 150,73}{tab}{right 32}
	else if (A_ThisMenuItem ="Coenzyme Q10") 
		Sendinput,{click 150,73}{tab}{right 34}
	else if (A_ThisMenuItem ="Creatine") 
		Sendinput,{click 150,73}{tab}{right 36}
	else if (A_ThisMenuItem ="&Folic Acid") 
		Sendinput,{click 150,73}{tab}{right 52}
	else if (A_ThisMenuItem ="Generic Ingredient &A.1") 
		Sendinput,{click 150,73}{tab}{right 57}
	else if (A_ThisMenuItem ="Generic Ingredient &B.1") 
		Sendinput,{click 150,73}{tab}{right 63}
	else if (A_ThisMenuItem ="Generic Ingredient &C.1") 
		Sendinput,{click 150,73}{tab}{right 69}
	else if (A_ThisMenuItem ="Generic Ingredient &D.1") 
		Sendinput,{click 150,73}{tab}{right 75}
	else if (A_ThisMenuItem ="Generic Ingredient &E.1") 
		Sendinput,{click 150,73}{tab}{right 81}
	else if (A_ThisMenuItem ="Generic Ingredient &F.1") 
		Sendinput,{click 150,73}{tab}{right 87}
	else if (A_ThisMenuItem ="Generic Ingredient &G") 
		Sendinput,{click 150,73}{tab}{right 93}
	else if (A_ThisMenuItem ="Generic Ingredient &H") 
		Sendinput,{click 150,73}{tab}{right 94}
	else if (A_ThisMenuItem ="Generic Ingredient &I") 
		Sendinput,{click 150,73}{tab}{right 96}
	else if (A_ThisMenuItem ="Generic Ingredient &J") 
		Sendinput,{click 150,73}{tab}{right 98}
	else if (A_ThisMenuItem ="Generic Ingredient &K") 
		Sendinput,{click 150,73}{tab}{right 100}
	else if (A_ThisMenuItem ="Generic Ingredient &L") 
		Sendinput,{click 150,73}{tab}{right 101}
	else if (A_ThisMenuItem ="Generic Ingredient &M") 
		Sendinput,{click 150,73}{tab}{right 102}
	else if (A_ThisMenuItem ="Generic Ingredient &N") 
		Sendinput,{click 150,73}{tab}{right 103}
	else if (A_ThisMenuItem ="Generic Ingredient &O") 
		Sendinput,{click 150,73}{tab}{right 104}
	else if (A_ThisMenuItem ="Generic Ingredient &P") 
		Sendinput,{click 150,73}{tab}{right 105}
	else if (A_ThisMenuItem ="Generic Ingredient &Q") 
		Sendinput,{click 150,73}{tab}{right 106}
	else if (A_ThisMenuItem ="Generic Ingredient &R") 
		Sendinput,{click 150,73}{tab}{right 107}
	else if (A_ThisMenuItem ="Generic Ingredient &S") 
		Sendinput,{click 150,73}{tab}{right 108}
	else if (A_ThisMenuItem ="Generic Ingredient &T") 
		Sendinput,{click 150,73}{tab}{right 109}
	else if (A_ThisMenuItem ="Generic Ingredient &U") 
		Sendinput,{click 150,73}{tab}{right 110}
	else if (A_ThisMenuItem ="Generic Ingredient &V") 
		Sendinput,{click 150,73}{tab}{right 111}
	else if (A_ThisMenuItem ="Glucosamine") 
		Sendinput,{click 150,73}{tab}{right 127}
	else if (A_ThisMenuItem ="Glycine") 
		Sendinput,{click 150,73}{tab}{right 131}
	else if (A_ThisMenuItem ="&Ingredient Note 1") 
		Sendinput,{click 150,73}{tab}{right 139}
	else if (A_ThisMenuItem ="&Ingredient Note 2") 
		Sendinput,{click 150,73}{tab}{right 141}
	else if (A_ThisMenuItem ="&Ingredient Note 3") 
		Sendinput,{click 150,73}{tab}{right 142}
	else if (A_ThisMenuItem ="Inositol") 
		Sendinput,{click 150,73}{tab}{right 149}
	else if (A_ThisMenuItem ="Lead") 
		Sendinput,{click 150,73}{tab}{right 166}
	else if (A_ThisMenuItem ="&L-Tyrosine") 
		Sendinput,{click 150,73}{tab}{right 180}
	else if (A_ThisMenuItem ="Malic Acid") 
		Sendinput,{click 150,73}{tab}{right 185}
	else if (A_ThisMenuItem ="Mercury") 
		Sendinput,{click 150,73}{tab}{right 188}
	else if (A_ThisMenuItem ="&Methylsulfonylmethane (MSM)") 
		Sendinput,{click 150,73}{tab}{right 190}
	else if (A_ThisMenuItem ="Molybdenum") 
		Sendinput,{click 150,73}{tab}{right 194}
	else if (A_ThisMenuItem ="PABA") 
		Sendinput,{click 150,73}{tab}{right 205}
	else if (A_ThisMenuItem ="Protein") 
		Sendinput,{click 150,73}{tab}{right 219}
	else if (A_ThisMenuItem ="Quercetin Dihydrate") 
		Sendinput,{click 150,73}{tab}{right 223}
	else if (A_ThisMenuItem ="Taurine") 
		Sendinput,{click 150,73}{tab}{right 246}
	else if (A_ThisMenuItem ="Total Probiotic") 
		Sendinput,{click 150,73}{tab}{right 257}
	else
		return
	return
	
}

