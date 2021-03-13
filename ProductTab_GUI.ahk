autotrim,On
;#maxthreadsperhotkey, 5

;Iniread, VarBar_X, data.ini, Locations, VarBar_X
;Iniread, VarBar_Y, data.ini, Locations, Varbar_Y
iniread, Product, data.ini, Products, 1
iniread, Batch, data.ini, Batches, 1
iniread, Name, data.ini, Names, 1
iniread, Customer, data.ini, Customers, 1
iniread, Lot, data.ini, Lots, 1
iniread, Description, data.ini, Descriptions, 1
iniread, Iteration, data.ini, Iterations, 1
Iniread, ProductTable_X, data.ini, Locations, ProductTable_X
Iniread, ProductTable_Y, data.ini, Locations, ProductTable_Y
Excel_Connect()
Name:=[]
LabelClaim:=[]
Position:=[]
LabelName:=[]
Sub_Table_height:=0
while (Xl.Range("M" . A_Index+7).Value != "") {
	Position[A_index]:=		Xl.Range("F" . A_Index+7).Text
	Name[A_index]:=		Xl.Range("K" . A_Index+7).text
	LabelClaim[A_index]:=	Xl.Range("L" . A_Index+7).Text
	LabelName[A_index]:=	Xl.Range("M" . A_Index+7).Text
	Total_rows:=			A_index +1
	Table_Height:=			A_index
	if (Xl.Range("F" . A_Index+7).text = "")
		Sub_Table_Height:=Sub_Table_Height+1			
}
Table_Height:=Table_height-Sub_table_Height
Gui, IngredientList:Default
Gui, IngredientList:+LastFound +ToolWindow +Owner +AlwaysOnTop ;-SysMenu 
GUI, IngredientList:Font, s13 cBlack arial ;Consolas
Gui, IngredientList:Add, ListView, x0 y0 r%Table_height% W500 Grid NoSortHdr -hdr checked gIngredientList,  `t |`t|`t|LabelName	
loop, %Total_Rows% {
	if Position[A_index] =""
	{
		;Table_height:=table_height
		Total_rows:=total_rows - 1
		continue
	}
	else	
		LV_Insert(A_index,"",Position[A_index],Name[A_index],LabelClaim[A_index],LabelName[A_index])
}
Gui, IngredientList:Add, Checkbox, vAutoEnter x20, Auto-Enter Results?
LV_ModifyCol(1,50) 
LV_ModifyCol(2,200)
LV_ModifyCol(3,180)			
LV_ModifyCol(4,0)
;LV_delete(Total_rows)
sleep 100		
;CoordMode, mouse, screen
Gui, IngredientList:Show, x%ProductTable_X% y%ProductTable_Y% w320, %Product% `t
;CoordMode, mouse, window
return	


/*
	WM_LBUTTONDOWN() { ; move window
		Global
		PostMessage, 0xA1, 2 ; WM_NCLBUTTONDOWN
		keywait, Lbutton, U
		coordmode, mouse, Screen
		WinGetPos,ProductTable_X,ProductTable_Y,w,h
		sleep 100
		tooltip, %ProductTable_x% , %ProductTable_Y%
		IniWrite, %ProductTable_X%, data.ini, Locations, ProductTable_X
		IniWrite, %ProductTable_Y%, data.ini, Locations, ProductTable_Y
		coordmode, mouse, Window
		sleep 1000
		tooltip,
		
		return
	}
*/

IngredientList:
if (A_GuiEvent = "DoubleClick")  {
	Gui, IngredientList:submit,NoHide
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
	Ingredient_Name:=Trim(Ingredient_Name, "`r`n")
	Ingredient_Claim:=Trim(Ingredient_Claim, "`r`n")
	Ingredient_position:=Trim(Ingredient_Position, "`r`n")
	ifWinnotexist Edit Ingredient - \\Remote
	{	
		WinActivate, Composition - \\Remote
		Mouse_Click("add_Composition")
		sleep 100
		ProductTab_Select_Ingredient()
	}
	if Winexist("Edit Ingredient - \\Remote")
	{
		Winactivate,
	}
	sleep 200
	send, {tab 6}^a%Ingredient_position%{tab}^a
	Sendinput,%Ingredient_Name%
	sleep 100
	If Ingredient_Claim contains Heavy Metal, Allergens
		send,{tab}
	send,{tab 2}^a
	send,%Ingredient_Claim%
	Sleep 400
	Current_Row:= Current_Row+1
	send, {enter}
	return
}



+F11::pause

IngredientListGuiClose:
;coordmode, window, Screen
WinGetPos,ProductTable_X,ProductTable_Y
sleep 100
IniWrite, %ProductTable_X%, data.ini, Locations, ProductTable_X
IniWrite, %ProductTable_Y%, data.ini, Locations, ProductTable_Y
;coordmode, window, Window
sleep 500
ExitApp
return



ProductTab_Select_Ingredient() 
{
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
	else if Name Contains Citicoline sodium 
	{
		Sendinput, {click 150,73}{tab}
		ProductTab_DropDown_Ingredient()
	}
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
	else if Name contains Iodide 
		Sendinput, {click 150,73}{tab}{right 152}		
	else if Name contains Iodine 
		Sendinput, {click 150,73}{tab}{right 152}
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
		Sendinput, {click 150,73}{tab}{end}{up 17}
	else if Name contains Total Probiotic 
		Sendinput, {click 150,73}{tab}{end}{up 17}
	else if Name contains Vitamin A 
		Sendinput, {click 150,73}{tab}{end}{up 13}
	else if Name contains Vitamin B12 
		Sendinput, {click 150,73}{tab}{end}{up 12}
	else if Name contains Vitamin B6 
		Sendinput, {click 150,73}{tab}{end}{up 11}
	else if Name contains Vitamin C 
		Sendinput, {click 150,73}{tab}{end}{up 10}
	else if Name contains Vitamin D 
		Sendinput, {click 150,73}{tab}{end}{up 9}
	else if Name contains Vitamin E 
		Sendinput, {click 150,73}{tab}{end}{up 8}
	else if Name contains Vitamin K 
		Sendinput, {click 150,73}{tab}{end}{up 7}
	else if Name contains Zinc 
		Sendinput, {click 150,73}{tab}{end}
	else {
		Sendinput, {click 150,73}{tab}
		ProductTab_DropDown_Ingredient()
	} 
	
}	





#SingleInstance,Force
;#include Lib\
;#include Vquest.ahk