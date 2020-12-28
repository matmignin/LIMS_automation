#ifwinactive,


EditIngredient(Ingredient_Name,Ingredient_Claim,Ingredient_Position){
		Global
		sleep 100
		send,{tab 6}^a%Ingredient_position%{tab}^a
		Send,%Ingredient_Name%
		sleep 100
		send,{tab 2}^a
		send,%Ingredient_Claim%{tab 2} ;{enter} 
		return
} ;}


Test_Definition_Editor: ;{
#ifwinactive, Test Definition Editor - \\Remote
	Numpadadd::InsertDescription()
	WheelLeft::GetExcelData() ; GetIngredientMenu() ;

	TestDefinitionEditor(){
			Global
		DescriptionRaw:=Description
		Description:=RTrim(DescriptionRaw, " `n")
		Click, 100, 199 
		Send,^a%Description%
		return
		}
	InsertDescription(){
		Global
		DescriptionRaw:=Description
		Description:=RTrim(DescriptionRaw, " `n")
		Send,^a%Description%
		Return
} ;}
							     
Edit_Product: ;{   top window (has customer and trade name .etc
    #IfWinActive, Edit Product - \\Remote
    \::
         Clipboard := StrReplace(Clipboard, "`r`n")
	  Send,%ProductCode%`,{space}%BatchCode%{tab 2}%clipboard%{tab 2}{right 2}{tab}{right 3}{tab}%ProductCode%{tab 2}
	  sleep 200
	  sendinput,%BatchCode%{tab 8}
	  return   ;}

Edit_Formulation: ;{  before composition (Reportable Quality, shape color)
#ifwinactive, Edit Formulation - \\Remote  ;the products 
    WheelRight::Send,{Tab 14}{Return} 
    ;}

Composition:  ;{   list of COA ingredients to add
#ifwinactive, Composition - \\Remote    ;products tab>Formulation>Composistion
	Wheelleft::
	Click, 47,67 ;click Add
	winwait, Edit Ingredient - \\Remote
	  sleep 200
	  gosub, Quick_Ingredient_Dropdown
return
	WheelRight::Click,84, 62 ;Click Edit
	;}



Edit_Ingredient: ;{   (ingredient dropdown, position, description, label claim, ingredient group
#ifwinactive, Edit Ingredient - \\Remote
	    Wheelleft::GetExcelData() 
	    wheelright::
Quick_Ingredient_Dropdown: 
	    input, alphakey,L1,
	 If alphakey contains a,b
				IngredientListScroll(1,0)
	 If alphakey contains c,d,e
				IngredientListScroll(2,0)
	 If alphakey contains f
				IngredientListScroll(3,0)		  
	 If alphakey contains g
				IngredientListScroll(5,0)		  
	 If alphakey contains h
				IngredientListScroll(7,5)	
	 If alphakey contains i,p
				IngredientListScroll(8,5)		    
	 If alphakey contains l
				IngredientListScroll(9,0)		    
	 If alphakey contains m,n
				IngredientListScroll(9,1)			  
	 If alphakey contains o,
				IngredientListScroll(10,0)	
	 If alphakey contains q,r
				IngredientListScroll(12,5)	
	 If alphakey contains s,t
				IngredientListScroll(13,5)
	 If alphakey contains v,w,y,z
				IngredientListScroll(14,5)	
	  else
	  return ;}
    return
	  
IngredientListScroll(PageDown,DownArrow) { 
		sendinput,{click, 250,71}{pgdn %PageDown%}{down %downArrow%}
		return
    }
    
    
    Formulation_Hotstrings: ;{
    #IfWinActive, ahk_exe WFICA32.EXE
    Capslock::return
    :*:1\::`Each (1) contains{ctrl down}{left}{ctrl up}
    :*:2\::`Each two (2) contains{ctrl down}{left}{ctrl up}
    :*:3\::`Each three (3) contains{ctrl down}{left}{ctrl up}
    :*:4\::`Each four (4) contains{ctrl down}{left}{ctrl up}
    :*:5\::`Each five (5) contains{ctrl down}{left}{ctrl up}
    :*:6\::`Each six (6) contains{ctrl down}{left}{ctrl up}
    :*:7\::`Each seven (7) contains{ctrl down}{left}{ctrl up}

    :*:NMT30::`NMT 30 Minutes
    :*:NMT5::`NMT 5 mcg/day
    :*:NMT15::`NMT 15 mcg/day
    :*:H\::Heavy Metals `*
    :*:*H::`* Heavy Metals results are based on a daily dose of (1) capsule{ctrl down}{left}{left}{ctrl up}{right}
;}