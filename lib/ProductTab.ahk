
ProductTab_Table(){
  Global
  try GUI ingredient_table:destroy
  ; Iniread,Varbar_X,data.ini,Locations,varbar_X
  ; Iniread,Varbar_Y,data.ini,Locations,VarBar_Y
  ProductTable_Y:=Varbar_Y + 40
  Producttable_X:=Varbar_X + 100
  Excel.Connect()
  Name:=		  	[]
  LabelClaim:=	[]
  Position:=		[]
  LabelName:=		[]
  DropdownCount:=[]
  Sub_Table_height:=0
  while (Xl.Range("M" . A_Index+7).Value != "") {
    Position[A_index]:=		Xl.Range("F" . A_Index+7).Text
    Name[A_index]:=		  	Xl.Range("K" . A_Index+7).text
    LabelClaim[A_index]:=	Xl.Range("L" . A_Index+7).Text
    LabelName[A_index]:=	Xl.Range("M" . A_Index+7).Text
    DropDownCount[A_index]:=	Xl.Range("A" . A_Index+7).Text
    Total_rows:=		    	A_index +1
    Table_Height:=		  	A_index
    if (Xl.Range("F" . A_Index+7).text = "")
      Sub_Table_Height:=Sub_Table_Height+1			
  }
  Table_Height:=Table_height-Sub_table_Height
  Gui,Ingredient_Table:Default
  Gui,Ingredient_Table:+LastFound +ToolWindow +Owner +AlwaysOnTop ;-SysMenu 
  GUI,Ingredient_Table:Font,s11 cBlack arial ;Consolas
  Gui,Ingredient_Table:Add,ListView,x0 y0 r%Table_height% W500 Grid NoSortHdr -hdr checked gIngredient_Table, Position|Name|LabelClaim|LabelName|DropdownCount
  loop,%Total_Rows% {
    if Position[A_index] =""
    {
      Total_rows:=total_rows - 1
      continue
    }
    else	
      LV_Insert(A_index,"",Position[A_index],Name[A_index],LabelClaim[A_index],LabelName[A_index],DropdownCount[A_index])
  }
  Gui,Ingredient_Table:Add,Checkbox,vAutoEnter x20,Auto-Enter Results?
  LV_ModifyCol(1,50) 
  LV_ModifyCol(2,200)
  LV_ModifyCol(3,180)			
  LV_ModifyCol(4,0)
  sleep 100		
  CoordMode,mouse,screen
  Gui,Ingredient_Table:Show,x%ProductTable_X% y%ProductTable_Y% w420,%Product%
  CoordMode,mouse,window
  return	
}

Ingredient_Table:
  if (A_GuiEvent = "DoubleClick") {
    Gui,Ingredient_Table:submit,NoHide
    Rows_left:=((LV_GetCount()-A_EventInfo)*Autoenter)+1
    Current_Row:=A_EventInfo
    Loop % Rows_left {
      Excel.Get_Current_row()
      ProductTab_EditIngredient(LabelName,LabelClaim,Position,DropdownCount)
      if WinExist("Duplicate ingredient ID - \\Remote")
        break 

      sleep 300
    }
  }
return

ProductTab_DropdownSelect(A_DropdownCount){
  global
      click, 150, 73
  tooltip, %Ingredient_Name%
  AbsSelection:=Abs(A_DropdownCount)
  if (a_DropdownCount > 0)
    sendinput, {tab}{home}{right %A_DropdownCount%}
  if (a_DropdownCount < 0)
    Sendinput, {tab}{end}{left %Absselection%}
  if (a_DropdownCount = ""){
    ProductTab_DropDown_Ingredient()
    ;exit
  }
    sleep 200
  }


ProductTab_EditIngredient(Ingredient_Name,Ingredient_Claim,Ingredient_Position,Dropdown_count){
  Global
  Excel.Get_Current_row()
  Ingredient_Name:=Trim(Ingredient_Name,"`r`n")
  Ingredient_Claim:=Trim(Ingredient_Claim,"`r`n")
  Ingredient_position:=Trim(Ingredient_Position,"`r`n")
  ifWinnotexist, Edit Ingredient - \\Remote
  {	
    WinActivate,Composition - \\Remote
    Mouse_Click("add_Composition")
    sleep 100
    ProductTab_DropdownSelect(Dropdown_Count)
    ; ProductTab_Select_Ingredient()
  ; tooltip, %Ingredient_Name%
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
  Tooltip, 
return
}

Ingredient_TableGuiClose:
  GUI,Ingredient_Table:destroy
return

ProductTab_Select_Ingredient(){
  Global
  click, 150, 73
  tooltip, %Ingredient_Name%
  if Name contains Alpha-Lipoic acid 
    Sendinput,{tab}{right 10}
  else if Name contains Alpha Lipoic acid 
    Sendinput,{tab}{right 10} 
  else If inStr(Name, "AHA",True)
    Sendinput,{tab}{right 10}
  else if Name contains Arsenic 
    Sendinput,{tab}{right 11}
  else if Name contains Betaine HCl 
    Sendinput,{tab}{right 18}
  else if Name contains Biotin 
    Sendinput,{tab}{right 21}
  else if Name contains Boron
    Sendinput,{tab}{right 22}
  else if Name contains Cadmium 
    Sendinput,{tab}{right 23}
  else if Name Contains Acetyl L-Carnitine HCL 
    Sendinput,{tab}{right 6}
  else if Name Contains Citicoline sodium 
  {
    Sendinput,{tab}
    ProductTab_DropDown_Ingredient()
  }
  else if Name Contains Caffeine 
    Sendinput,{tab}{right 24}
  else if Name contains Calcium 
    Sendinput,{tab}{right 25}
  else if Name contains Choline 
    Sendinput,{tab}{right 30}
  else if Name contains Chromium 
    Sendinput,{tab}{right 32}
  else if Name contains Coenzyme Q 
    Sendinput,{tab}{right 34}
  else if Name contains Copper 
    Sendinput,{tab}{right 35}
  else if Name contains Creatine 
    Sendinput,{tab}{right 36}
  else if LabelName contains calcium L-5-methyltetrahydrofolate
    Sendinput,{tab}{right 4}
  else if LabelName contains methyltetrahydrofolate
    Sendinput,{tab}{right 4}
  else if Name contains Folic Acid
    Sendinput,{tab}{right 52}
  else if Name contains Folate 
    Sendinput,{tab}{right 52}
  else if Name contains Glucosamine 
    Sendinput,{tab}{right 127}
  else if Name contains Glycine 
    Sendinput,{tab}{right 131}		
  else if Name contains Inositol	
    Sendinput,{tab}{right 150}
  else if Name contains Iodine 	
    Sendinput,{tab}{right 153}
  else if Name contains Iron 	
    Sendinput,{tab}{right 155}
  else if Name contains L-Alanine	
    Sendinput,{tab}{end}{left 116}
  else if Name contains L-Arginine	
    Sendinput,{tab}{end}{left 115}
  else if Name contains L-Carnitine	
    Sendinput,{tab}{end}{left 114}
  else if Name contains L-Cysteine	
    Sendinput,{tab}{end}{left 113}
  else if Name contains L-Cystine	
    Sendinput,{tab}{end}{left 112}
  else if Name contains Lead 	
    Sendinput,{tab}{end}{left 110}
  else if Name contains L-Glutamic Acid	
    Sendinput,{tab}{end}{left 109}
  else if Name contains L-Glutamine	
    Sendinput,{tab}{end}{left 108}
  else if Name contains L-Glutathione	
    Sendinput,{tab}{end}{left 107}
  else if Name contains Glycine	
    Sendinput,{tab}{end}{left 106}
  else if Name contains L-Isoleucine	
    Sendinput,{tab}{end}{left 105}
  else if Name contains Leucine	
    Sendinput,{tab}{end}{left 103}
  else if Name contains Lysine	
    Sendinput,{tab}{end}{left 102}
  else if Name contains L-Methionine	
    Sendinput,{tab}{end}{left 101}
  else if Name contains Phenylalanine	
    Sendinput,{tab}{end}{left 98}
  else if Name contains L-Theanine	
    Sendinput,{tab}{end}{left 97}
  else if Name contains L-Tryptophan	
    Sendinput,{tab}{end}{left 96}
  else if Name contains L-Tyrosine 	
    Sendinput,{tab}{end}{left 95}  
  else if Name contains Lutein 	
    Sendinput,{tab}{end}{left 94}
  else if Name contains Magnesium 	
    Sendinput,{tab}{end}{left 91}
  else if Name contains Malic Acid 	
    Sendinput,{tab}{end}{left 90}
  else if Name contains Manganese 	
    Sendinput,{tab}{end}{left 89} 
  else if Name contains Mercury 	
    Sendinput,{tab}{end}{left 86} 
  else if Name contains Methylsulfonylmethane 	
    Sendinput,{tab}{end}{left 84} 
  else if Name contains MSM 	
    Sendinput,{tab}{end}{left 84} 
  else if Name contains Molybdenum 	
    Sendinput,{tab}{end}{left 80} 
  else if Name contains Niacin 	
    Sendinput,{tab}{end}{left 71}
  else if Name contains PABA 	
    Sendinput,{tab}{end}{left 69} 
  else if Name contains Pantothenic Acid 	
    Sendinput,{tab}{end}{left 68}
  else if Name contains Phosphorus 	
    Sendinput,{tab}{end}{left 61}
  else if Name contains Potassium 	
    Sendinput,{tab}{end}{left 58}
  else if Name contains Protein 	
    Sendinput,{tab}{end}{left 55}
  else if Name contains Quercetin Dihydrate	
    Sendinput,{tab}{end}{left 51}  
	else if Name contains Quercetin	
    Sendinput,{tab}{end}{left 51}
	else if Name contains Resveratrol	
    Sendinput,{tab}{end}{left 48}
  else if Name contains Riboflavin 	
    Sendinput,{tab}{end}{left 45}
  else if Name contains Selenium 	
    Sendinput,{tab}{end}{left 38}
  else if Name contains Sodium 	
    Sendinput,{tab}{end}{left 36}
  else if Name contains Taurine 	
    Sendinput,{tab}{end}{left 27}
  else if Name contains Thiamin 	
    Sendinput,{tab}{end}{left 25}	
    else if Name contains Probiotic Blend 
      Sendinput,{tab}{end}{left 17}
    else if Name contains Probiotics 
      Sendinput,{tab}{end}{left 17}
    else if Name contains Total Probiotic 
      Sendinput,{tab}{end}{left 17}
  else if Name contains Vanadium
    Sendinput,{tab}{end}{left 14}
  else if Name contains Vitamin A 
    Sendinput,{tab}{end}{left 13}
  else if Name contains Vitamin B12 
    Sendinput,{tab}{end}{left 12}
  else if Name contains Vitamin B6 
    Sendinput,{tab}{end}{left 11}
  else if Name contains Vitamin C 
    Sendinput,{tab}{end}{left 10}
  else if Name contains Vitamin D 
    Sendinput,{tab}{end}{left 9}
  else if Name contains Vitamin E 
    Sendinput,{tab}{end}{left 8}
  else if Name contains Vitamin K 
    Sendinput,{tab}{end}{left 7}
  else if Name contains Zinc 
    Sendinput,{tab}{end}
  else {
    Sendinput,{tab}
    ProductTab_DropDown_Ingredient()
  } 

}	
/* 
ProductTab_Select_Ingredient2() {
  Global
  click 15, 73
  if Name contains Alpha-Lipoic acid 
    Sendinput,{tab}{right 10}
  else if Name contains Alpha Lipoic acid 
    Sendinput,{tab}{right 10} 
  else If inStr(Name, "AHA",True)
    Sendinput,{tab}{right 10}
  else if Name contains Arsenic 
    Sendinput,{tab}{right 11}
  else if Name contains Betaine HCl 
    Sendinput,{tab}{right 18}
  else if Name contains Biotin 
    Sendinput,{tab}{right 21}
  else if Name contains Cadmium 
    Sendinput,{tab}{right 23}
  else if Name Contains Acetyl L-Carnitine HCL 
    Sendinput,{tab}{right 6}
  else if Name Contains Citicoline sodium 
  {
    Sendinput,{tab}
    ProductTab_DropDown_Ingredient()
  }
  else if Name Contains Caffeine 
    Sendinput,{tab}{right 24}
  else if Name contains Calcium 
    Sendinput,{tab}{right 25}
  else if Name contains Choline 
    Sendinput,{tab}{right 30}
  else if Name contains Chromium 
    Sendinput,{tab}{right 32}
  else if Name contains Coenzyme Q 
    Sendinput,{tab}{right 34}
  else if Name contains Copper 
    Sendinput,{tab}{right 35}
  else if Name contains Creatine 
    Sendinput,{tab}{right 36}
  else if LabelName contains calcium L-5-methyltetrahydrofolate
    Sendinput,{tab}{right 4}
  else if LabelName contains methyltetrahydrofolate
    Sendinput,{tab}{right 4}
  else if Name contains Folic Acid
    Sendinput,{tab}{right 52}
  else if Name contains Folate 
    Sendinput,{tab}{right 52}
  else if Name contains Glucosamine 
    Sendinput,{tab}{right 127}
  else if Name contains Glycine 
    Sendinput,{tab}{right 131}		
  else if Name contains Inositol	
    Sendinput,{tab}{right 150}
  else if Name contains Iodine 	
    Sendinput,{tab}{right 153}
  else if Name contains Iron 	
    Sendinput,{tab}{right 155}
  else if Name contains L-Alanine	
    Sendinput,{tab}{right 161}
  else if Name contains L-Arginine	
    Sendinput,{tab}{right 162}
  else if Name contains L-Carnitine	
    Sendinput,{tab}{right 163}
  else if Name contains L-Cysteine	
    Sendinput,{tab}{right 164}
  else if Name contains L-Cystine	
    Sendinput,{tab}{right 165}
  else if Name contains Lead 	
    Sendinput,{tab}{right 167}
  else if Name contains L-Glutamic Acid	
    Sendinput,{tab}{right 168}
  else if Name contains L-Glutamine	
    Sendinput,{tab}{right 169}
  else if Name contains L-Glutathione	
    Sendinput,{tab}{right 170}
  else if Name contains Glycine	
    Sendinput,{tab}{right 171}
  else if Name contains L-Isoleucine	
    Sendinput,{tab}{right 172}
  else if Name contains Leucine	
    Sendinput,{tab}{right 173}
  else if Name contains Lysine	
    Sendinput,{tab}{right 174}
  else if Name contains L-Methionine	
    Sendinput,{tab}{right 175}
  else if Name contains Phenylalanine	
    Sendinput,{tab}{right 178}
  else if Name contains L-Theanine	
    Sendinput,{tab}{right 179}
  else if Name contains L-Tryptophan	
    Sendinput,{tab}{right 180}
  else if Name contains L-Tyrosine 	
    Sendinput,{tab}{right 181}  
  else if Name contains Lutein 	
    Sendinput,{tab}{right 182}
  else if Name contains Magnesium 	
    Sendinput,{tab}{right 185}
  else if Name contains Malic Acid 	
    Sendinput,{tab}{right 186}
  else if Name contains Manganese 	
    Sendinput,{tab}{right 187}
  else if Name contains Mercury 	
    Sendinput,{tab}{right 189}
  else if Name contains Methylsulfonylmethane 	
    Sendinput,{tab}{right 191}
  else if Name contains MSM 	
    Sendinput,{tab}{right 191}
  else if Name contains Molybdenum 	
    Sendinput,{tab}{right 195}
  else if Name contains Niacin 	
    Sendinput,{tab}{right 204}
  else if Name contains PABA 	
    Sendinput,{tab}{right 206}
  else if Name contains Pantothenic Acid 	
    Sendinput,{tab}{right 208}
  else if Name contains Phosphorus 	
    Sendinput,{tab}{right 214}
  else if Name contains Potassium 	
    Sendinput,{tab}{end}{left 58}
  else if Name contains Protein 	
    Sendinput,{tab}{end}{left 55}
  else if Name contains Quercetin Dihydrate	
    Sendinput,{tab}{end}{left 51}  
	else if Name contains Quercetin	
    Sendinput,{tab}{end}{left 51}
	else if Name contains Resveratrol	
    Sendinput,{tab}{end}{left 48}
  else if Name contains Riboflavin 	
    Sendinput,{tab}{end}{left 45}
  else if Name contains Selenium 	
    Sendinput,{tab}{end}{left 38}
  else if Name contains Sodium 	
    Sendinput,{tab}{end}{left 36}
  else if Name contains Taurine 	
    Sendinput,{tab}{end}{left 27}
  else if Name contains Thiamin 	
    Sendinput,{tab}{end}{left 25}	
  else if Name contains Probiotic Blend 
    Sendinput,{tab}{end}{left 17}
  else if Name contains Total Probiotic 
    Sendinput,{tab}{end}{left 17}
  else if Name contains Vitamin A 
    Sendinput,{tab}{end}{left 13}
  else if Name contains Vitamin B12 
    Sendinput,{tab}{end}{left 12}
  else if Name contains Vitamin B6 
    Sendinput,{tab}{end}{left 11}
  else if Name contains Vitamin C 
    Sendinput,{tab}{end}{left 10}
  else if Name contains Vitamin D 
    Sendinput,{tab}{end}{left 9}
  else if Name contains Vitamin E 
    Sendinput,{tab}{end}{left 8}
  else if Name contains Vitamin K 
    Sendinput,{tab}{end}{left 7}
  else if Name contains Zinc 
    Sendinput,{tab}{end}
  else {
    Sendinput,{tab}
    ProductTab_DropDown_Ingredient()
  } 

}	 

 select_ingr(ingr){
  global
  Sendinput,{tab}
  abs_ingr:=Abs(ingr)-1
    if (ingr > 0)
      sendinput, {right %ingr%}
    else if (ingr < 0)
      sendinput, {end}{left %abs_ingr%}
} 
*/



Formulation_Hotstrings:
  #IfWinActive,ahk_exe WFICA32.EXE
    :*R:#00\::`#00 capsule / 0.917`" x 0.336`"
    :*R:#00e\::`#00 elongated capsule / 0.995`" x 0.336`"
    :*R:#3\::`#3 capsule / 0.626`" x 0.229`"
    :*R:#2\::`#2 capsule / 0.709`" x 0.250`"
    :*R:#1\::`#1 capsule / 0.765`" x 0.272`"
    :*R:#0\::`#0 capsule / 0.854`" x 0.300`"
    :*R:USP\::Meets USP Requirements
    :*R:fr\::Fixing Rotation
    :*R:?\::?Kilgore7744
    :*R:7/16\::`Round / 0.4375`"
    :*R:5.5 oblong\::Oblong / 0.750`" x 0.313`"
    :*R:5.5 oval\::Oval / 0.625`" x 0.344`""
    :*R:5 oblong\::Oblong / 0.750`" x 0.250`""
    :*:1\::`Each (1){space} contains {ctrl down}{left}{ctrl up}{left}
    :*:2\::`Each two (2){space} contains {ctrl down}{left}{ctrl up}{left}
    :*:3\::`Each three (3){space} contains {ctrl down}{left}{ctrl up}{left}
    :*:4\::`Each four (4){space} contains {ctrl down}{left}{ctrl up}{left}
    :*:5\::`Each five (5){space} contains {ctrl down}{left}{ctrl up}{left}
    :*:6\::`Each six (6){space} contains {ctrl down}{left}{ctrl up}{left}
    :*:7\::`Each seven (7){space} contains {ctrl down}{left}{ctrl up}{left}
    :*:NMT30::`NMT 30 Minutes
    :*:NMT5::`NMT 5 mcg/day
    :*:NMT15::`NMT 15 mcg/day
    :*:H\::Heavy Metals `*
    :*:*H::`* Heavy Metals results are based on a daily dose of (1) capsule{ctrl down}{left}{left}{ctrl up}{right}
    ;}

    :*:1scoop\::
    ProductTab_Scoops(1)
    :*:2scoops::
    ProductTab_Scoops(2,"two")
    :*:3scoops::
    ProductTab_Scoops(3,"three")
    :*:4scoops::
    ProductTab_Scoops(4,"four")
    :*:5scoops::
    ProductTab_Scoops(5,"five")
    :*:6scoops::
    ProductTab_Scoops(6,"six")
    :*:1stick::
    ProductTab_Scoops(1,,"stick packet")
    :*:2sticks::
    ProductTab_Scoops(2,"two","stick packet")
    return        
    
  ProductTab_Scoops(n,TextNumber:="{backspace}",Measurment:="scoop"){
    global
    winactivate, Edit Formulation - \\Remote
    click 450, 462, 3
    send, {click 385, 347}
    if (n=1)
      Plural:=""
    else
      Plural:="s"
    if (!color)
      Color:="PENDING"
    send, Each %textNumber% (%n%){space}%measurment%%plural% ( g) contains{left 12}{tab 2}^{a}%color%+{tab}^{a}Blend+{tab}%weight%
    exit
    }
    
    :*:stick\::stick packet ( g){left 3}{tab}Blend+{tab}

    ; :*:scoop\::
    ; sendinput, scoop ( g){left 3}{tab 2}%color%+{tab}Blend+{tab}
    ; return
    ; :*:scoops\::scoops ( g){left 3}{tab}Blend+{tab}


    ProductTab_EditProduct() {
      global
      Excel.Connect()
      click 120,80 ;click product box
      Sendinput,%Product%`,{space}%Name%{tab 2}%Customer%{tab 2}{right 2}{tab}{right 3}{tab}%Product%{tab 2}
      sleep 200
      sendinput,%Name%{tab 8}
      sleep 400
      winwaitactive,NuGenesis LMS - \\Remote,,10
      WinActivate, NuGenesis LMS - \\Remote
      click, 67, 283
      sleep 200
      ; Mouse_Click("Add_Formulation")
      winactivate, Edit Formulation - \\Remote,
      send, {tab}%product%
			sendinput, {Tab 23}
      return
    }
    ProductTab__HM_ReportOnly(){ ;testing out
      click 125,120 ;click 1st row
      Mouse_Click("add")	
      winwaitactive, Edit Ingredient - \\Remote,,4
      Sendinput,{click 150,73}{tab}{right 11} ;arsenic

      WinWaitClose, Edit Ingredient - \\Remote,,4
      click 125,140 ;click 2nd row
      Mouse_Click("add")
      winwaitactive, Edit Ingredient - \\Remote,,4
      Sendinput,{click 150,73}{tab}{right 167} ;lead

      click 390, 659	;click okay
      WinWaitClose, Edit Ingredient - \\Remote,,4
      click 125,180 ;click 3rd row
      Mouse_Click("add")
      winwaitactive, Edit Ingredient - \\Remote,,4
      Sendinput,{click 150,73}{tab}{right 23} ;cadmium

      click 390, 659	;click okay
      WinWaitClose, Edit Ingredient - \\Remote,,4
      click 125,200 ;click 4th row
      Mouse_Click("add")
      winwaitactive, Edit Ingredient - \\Remote,,4
      Sendinput,{click 150,73}{tab}{right 189} ;mercury

      click 390, 659	;click okay
      return
    }

    ProductTab_DropDown_Ingredient(){
      global
      ;Menu,IngredientMenu,Add,Creatine, IngredientMenuHandler
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
      Menu,IngredientMenu,Add,Generic Ingredient &W,IngredientMenuHandler
      Menu,IngredientMenu,Add,Generic Ingredient &X,IngredientMenuHandler
      Menu,IngredientMenu,Add,Generic Ingredient &Y,IngredientMenuHandler
      Menu,IngredientMenu,Add,Generic Ingredient &Z,IngredientMenuHandler
     ; Menu,IngredientMenu,Add,Glucosamine,IngredientMenuHandler
      Menu,IngredientMenu,Add,Ingredient Note 1,IngredientMenuHandler
      Menu,IngredientMenu,Add,Ingredient Note 2,IngredientMenuHandler
      Menu,IngredientMenu,Add,Ingredient Note 3,IngredientMenuHandler
      Menu,IngredientMenu,Add,Methylsulfonylmethane (MSM),IngredientMenuHandler
     ; Menu,IngredientMenu,Add,Molybdenum,IngredientMenuHandler
      ;Menu,IngredientMenu,Add,PABA,IngredientMenuHandler
      Menu,IngredientMenu,Add,Protein,IngredientMenuHandler
     ; Menu,IngredientMenu,Add,Quercetin Dihydrate,IngredientMenuHandler
     ; Menu,IngredientMenu,Add,Taurine,IngredientMenuHandler
      Menu,IngredientMenu,Add,Total Probiotic,IngredientMenuHandler
      Menu,IngredientMenu,Add,STOP,IngredientMenuHandler
      Menu,IngredientMenu,Show,
      return

      IngredientMenuHandler:
      Click 150, 73
      ; click, 150, 73
        if (A_ThisMenuItem ="Generic Ingredient &A.1") 
          Sendinput,{tab}{Home}{right 56}
        else if (A_ThisMenuItem ="Generic Ingredient &B.1") 
          Sendinput,{tab}{Home}{right 62}
        else if (A_ThisMenuItem ="Generic Ingredient &C.1") 
          Sendinput,{tab}{Home}{right 68}
        else if (A_ThisMenuItem ="Generic Ingredient &D.1") 
          Sendinput,{tab}{home}{right 74}
        else if (A_ThisMenuItem ="Generic Ingredient &E.1") 
          Sendinput,{tab}{Home}{right 80}
        else if (A_ThisMenuItem ="Generic Ingredient &F.1") 
          Sendinput,{tab}{Home}{right 86}
        else if (A_ThisMenuItem ="Generic Ingredient &G") 
          Sendinput,{tab}{Home}{right 92}
        else if (A_ThisMenuItem ="Generic Ingredient &H") 
          Sendinput,{tab}{Home}{right 94}
        else if (A_ThisMenuItem ="Generic Ingredient &I") 
          Sendinput,{tab}{Home}{right 95}
        else if (A_ThisMenuItem ="Generic Ingredient &J") 
          Sendinput,{tab}{Home}{right 97}
        else if (A_ThisMenuItem ="Generic Ingredient &K") 
          Sendinput,{tab}{Home}{right 99}
        else if (A_ThisMenuItem ="Generic Ingredient &L") 
          Sendinput,{tab}{Home}{right 100}
        else if (A_ThisMenuItem ="Generic Ingredient &M") 
          Sendinput,{tab}{Home}{right 101}
        else if (A_ThisMenuItem ="Generic Ingredient &N") 
          Sendinput,{tab}{Home}{right 102}
        else if (A_ThisMenuItem ="Generic Ingredient &O") 
          Sendinput,{tab}{Home}{right 103}
        else if (A_ThisMenuItem ="Generic Ingredient &P") 
          Sendinput,{tab}{Home}{right 104}
        else if (A_ThisMenuItem ="Generic Ingredient &Q") 
          Sendinput,{tab}{Home}{right 105}
        else if (A_ThisMenuItem ="Generic Ingredient &R") 
          Sendinput,{tab}{Home}{right 106}
        else if (A_ThisMenuItem ="Generic Ingredient &S") 
          Sendinput,{tab}{Home}{right 107}
        else if (A_ThisMenuItem ="Generic Ingredient &T") 
          Sendinput,{tab}{Home}{right 108}
        else if (A_ThisMenuItem ="Generic Ingredient &U") 
          Sendinput,{tab}{Home}{right 109}
        else if (A_ThisMenuItem ="Generic Ingredient &V") 
          Sendinput,{tab}{Home}{right 110}
        else if (A_ThisMenuItem ="Generic Ingredient &W") 
          Sendinput,{tab}{Home}{right 111}
        else if (A_ThisMenuItem ="Generic Ingredient &X") 
          Sendinput,{tab}{Home}{right 112}
        else if (A_ThisMenuItem ="Generic Ingredient &Y") 
          Sendinput,{tab}{Home}{right 113}
        else if (A_ThisMenuItem ="Generic Ingredient &Z") 
          Sendinput,{tab}{Home}{right 114}
        else if (A_ThisMenuItem ="Glucosamine") 
          Sendinput,{tab}{Home}{right 126}
        else if (A_ThisMenuItem ="Glycine") 
          Sendinput,{tab}{Home}{right 130}
        else if (A_ThisMenuItem ="Ingredient Note 1") 
          Sendinput,{tab}{Home}{right 139}
        else if (A_ThisMenuItem ="Ingredient Note 2") 
          Sendinput,{tab}{Home}{right 141}
        else if (A_ThisMenuItem ="Ingredient Note 3") 
          Sendinput,{tab}{Home}{right 142}
        else if (A_ThisMenuItem ="Quercetin Dihydrate") 
          Sendinput,{tab}{Home}{right 224}
        else if (A_ThisMenuItem ="Total Probiotic") 
          Sendinput,{tab}{Home}{right 258}
        else if (A_ThisMenuItem ="STOP") 
          exit
        else
          return
      return

    }


   

	