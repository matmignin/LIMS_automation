autotrim,On
EnvGet, ProductCode, ProductCode
	Excel_ConnectTo(ProductCode)
	Name:=[]
	LabelClaim:=[]
	Position:=[]
	LabelName:=[]
	while (Xl.Range("J" . A_Index+6).Value != "") {
		Position[A_index]:=		Xl.Range("E" . A_Index+7).Text
		Name[A_index]:=		Xl.Range("J" . A_Index+7).text
		LabelClaim[A_index]:=	Xl.Range("K" . A_Index+7).Text
		LabelName[A_index]:=	Xl.Range("L" . A_Index+7).Text
		Total_rows:=			A_index 
		Table_Height:=			A_index
	}
	Gui, IngredientList:Default
	Gui, IngredientList:+LastFound +ToolWindow +Owner +AlwaysOnTop ;-SysMenu 
	GUI, IngredientList:Font, s11 cBlack ;Consolas
	Gui, IngredientList:Add, ListView, x0 y0 r%Table_height% w500 Grid NoSortHdr checked gIngredientList,  `t%ProductCode%|`t%Name%|`t%Customer%|LabelName	
	loop, %Total_Rows% {
		if Position[A_index] =""
			{
			Table_height:=table_height+1
			Total_rows:=total_rows-1
			continue
			}
		else	
			LV_add("",Position[A_index],Name[A_index],LabelClaim[A_index],LabelName[A_index])
	}
	LV_ModifyCol(1,50) 
	LV_ModifyCol(2,250)
	LV_ModifyCol(3,150)			
	LV_ModifyCol(4,0)
	LV_Delete(Table_Height)
	sleep 100		
	CoordMode, mouse, Screen
	MouseGetPos, xPos, yPos	
	xPos:=xPos + 200
	ypos:=ypos + 550
	CoordMode, mouse, window
	Gui, IngredientList:Show, x%xpos% y%ypos% autosize, Ingredients
	return	



IngredientList:
if (A_GuiEvent = "DoubleClick")  {
    LV_GetText(Position, A_EventInfo,1)	
    LV_GetText(Name, A_EventInfo,2)
    LV_GetText(LabelClaim, A_EventInfo,3)
    LV_GetText(LabelName, A_EventInfo,4)
	sendinput, {space}
	Gui, IngredientList:submit,NoHide
	sleep 200
	if Winexist("Edit Ingredient - \\Remote")
		Product_Tab_EditIngredient(LabelName,LabelClaim,Position)
		else
	{
		winactivate, Composition - \\Remote
		click("add_Composition")
		sleep 200
		Product_Tab_EditIngredient(LabelName,LabelClaim,Position)
	}
    return
}
	else
	return
	
Product_Tab_EditIngredient(Ingredient_Name,Ingredient_Claim,Ingredient_Position){
	Global
	Ingredient_Name:=Trim(Ingredient_Name, "`r`n")
	Ingredient_Claim:=Trim(Ingredient_Claim, "`r`n")
	Ingredient_position:=Trim(Ingredient_Position, "`r`n")
	
	Winactivate, Edit Ingredient - \\Remote
	sleep 100
	Product_Tab_Select_Ingredient()
	winactivate, Edit Ingredient - \\Remote
	send,{tab 6}^a%Ingredient_position%{tab}^a
	Sendinput,%Ingredient_Name%
	sleep 100
		If Ingredient_Claim contains Heavy Metal, Allergens
			send,{tab}
	send,{tab 2}^a
	send,%Ingredient_Claim%
	Sleep 400
;	send,{Enter}
	;send,^a{delete}{tab 2} ;{enter} 
	return
}	
	
	
	
	
	
Product_Tab_Select_Ingredient(){
Global
	if Name contains Alpha-Lipoic acid 
		Sendinput, {click 150,73}{tab}{right 10}
	else if Name contains Alpha Lipoic acid 
		Sendinput, {click 150,73}{tab}{right 10}
	else if Name contains ALA 
		Sendinput, {click 150,73}{tab}{right 10}
	else if Name contains Arsenic 
		Sendinput, {click 150,73}{tab}{right 11}
	else if Name contains Biotin 
		Sendinput, {click 150,73}{tab}{right 21}
	else if Name contains Cadmium 
		Sendinput, {click 150,73}{tab}{right 23}
	else if Name Contains Acetyl L-Carnitine HCL 
		Sendinput, {click 150,73}{tab}{right 6}
	else if Name Contains Caffeine 
		Sendinput, {click 150,73}{tab}{right 24}
	else if Name contains Calcium 
		Sendinput, {click 150,73}{tab}{right 25}
	else if Name contains Choline 
		Sendinput, {click 150,73}{tab}{right 30}
	else if Name contains Chromium 
		Sendinput, {click 150,73}{tab}{right 32}
	else if Name contains Coenzyme Q 
		Sendinput, {click 150,73}{tab}{right 34}
	else if Name contains Copper 
		Sendinput, {click 150,73}{tab}{right 35}
	else if Name contains Creatine 
		Sendinput, {click 150,73}{tab}{right 36}
	else if LabelName contains calcium L-5-methyltetrahydrofolate
		Sendinput, {click 150,73}{tab}{right 4}
	else if LabelName contains methyltetrahydrofolate
		Sendinput, {click 150,73}{tab}{right 4}
	else if Name contains Folic Acid
		Sendinput, {click 150,73}{tab}{right 52}
	else if Name contains Folate 
		Sendinput, {click 150,73}{tab}{right 52}
	else if Name contains Glucosamine 
		Sendinput, {click 150,73}{tab}{right 127}
	else if Name contains Glycine 
		Sendinput, {click 150,73}{tab}{right 131}
	else if Name contains Inositol 
		Sendinput, {click 150,73}{tab}{right 149}
	else if Name contains Iron 
		Sendinput, {click 150,73}{tab}{right 154}
	else if Name contains L-Alanine
		Sendinput, {click 150,73}{tab}{right 160}		
	else if Name contains L-Arginine
		Sendinput, {click 150,73}{tab}{right 161}
	else if Name contains L-Carnitine
		Sendinput, {click 150,73}{tab}{right 162}
	else if Name contains L-Cysteine
		Sendinput, {click 150,73}{tab}{right 163}		
	else if Name contains L-Cystine
		Sendinput, {click 150,73}{tab}{right 164}		
	else if Name contains Lead 
		Sendinput, {click 150,73}{tab}{right 166}
	else if Name contains L-Glutamic Acid
		Sendinput, {click 150,73}{tab}{right 167}
	else if Name contains L-Glutamine
		Sendinput, {click 150,73}{tab}{right 168}
	else if Name contains L-Glutathione
		Sendinput, {click 150,73}{tab}{right 169}		
	else if Name contains Glycine
		Sendinput, {click 150,73}{tab}{right 170}
	else if Name contains L-Isoleucine
		Sendinput, {click 150,73}{tab}{right 171}
	else if Name contains Leucine
		Sendinput, {click 150,73}{tab}{right 172}		
	else if Name contains Lysine
		Sendinput, {click 150,73}{tab}{right 173}
	else if Name contains L-Methionine
		Sendinput, {click 150,73}{tab}{right 174}
	else if Name contains Phenylalanine
		Sendinput, {click 150,73}{tab}{right 177}		
	else if Name contains L-Theanine
		Sendinput, {click 150,73}{tab}{right 178}
	else if Name contains L-Tryptophan
		Sendinput, {click 150,73}{tab}{right 179}		
	else if Name contains L-Tyrosine 
		Sendinput, {click 150,73}{tab}{right 180}
	else if Name contains Magnesium 
		Sendinput, {click 150,73}{tab}{right 184}
	else if Name contains Malic Acid 
		Sendinput, {click 150,73}{tab}{right 185}
	else if Name contains Manganese 
		Sendinput, {click 150,73}{tab}{right 186}
	else if Name contains Mercury 
		Sendinput, {click 150,73}{tab}{right 188}
	else if Name contains Methylsulfonylmethane 
		Sendinput, {click 150,73}{tab}{right 190}
	else if Name contains MSM 
		Sendinput, {click 150,73}{tab}{right 190}
	else if Name contains Molybdenum 
		Sendinput, {click 150,73}{tab}{right 194}
	else if Name contains Niacin 
		Sendinput, {click 150,73}{tab}{right 203}
	else if Name contains PABA 
		Sendinput, {click 150,73}{tab}{right 205}
	else if Name contains Pantothenic Acid 
		Sendinput, {click 150,73}{tab}{right 207}
	else if Name contains Phosphorus 
		Sendinput, {click 150,73}{tab}{right 213}
	else if Name contains Potassium 
		Sendinput, {click 150,73}{tab}{right 216}
	else if Name contains Protein 
		Sendinput, {click 150,73}{tab}{right 219}
	else if Name contains Quercetin Dihydrate 
		Sendinput, {click 150,73}{tab}{right 223}
	else if Name contains Riboflavin 
		Sendinput, {click 150,73}{tab}{right 229}
	else if Name contains Selenium 
		Sendinput, {click 150,73}{tab}{right 236}
	else if Name contains Sodium 
		Sendinput, {click 150,73}{tab}{right 238}
	else if Name contains Taurine 
		Sendinput, {click 150,73}{tab}{right 246}
	else if Name contains Thiamin 
		Sendinput, {click 150,73}{tab}{right 249}
	else if Name contains Probiotic Blend 
		Sendinput, {click 150,73}{tab}{end}{up 17} ;{right 257}
	else if Name contains Total Probiotic 
		Sendinput, {click 150,73}{tab}{end}{up 17} ;{right 257}
	else if Name contains Vitamin A 
		Sendinput, {click 150,73}{tab}{end}{up 13} ;{right 261}
	else if Name contains Vitamin B12 
		Sendinput, {click 150,73}{tab}{end}{up 12} ;{right 262}
	else if Name contains Vitamin B6 
		Sendinput, {click 150,73}{tab}{end}{up 11} ;{right 263}
	else if Name contains Vitamin C 
		Sendinput, {click 150,73}{tab}{end}{up 10} ;{right 264}
	else if Name contains Vitamin D 
		Sendinput, {click 150,73}{tab}{end}{up 9} ;{right 265}
	else if Name contains Vitamin E 
		Sendinput, {click 150,73}{tab}{end}{up 8} ;{right 266}
	else if Name contains Vitamin K 
		Sendinput, {click 150,73}{tab}{end}{up 7} ;{right 267}
	else if Name contains Zinc 
		Sendinput, {click 150,73}{tab}{end} ;{right 274}
	else {
		Sendinput, {click 150,73} {tab}
		Product_Tab_DropDown_Ingredient() ;{right 57} ;general ing. A.1
		}
	}	
	
	
	
	
	
	
	
IngredientListGuiClose:
ExitApp


#SingleInstance,Force
#include Functions.ahk