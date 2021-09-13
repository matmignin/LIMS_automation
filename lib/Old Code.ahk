

Ingredients(){
 global
 IniRead,vSelect, Ingredients.ini, Ingredients, %vIngredient%
 msgbox % vSelect
 ConvertIngredientSelection(vSelect)
return

}
ConvertIngredientSelection(IngredientSelection){

 sleep 140
 AbsSelection:=Abs(IngredientSelection)-1
 if (IngredientSelection > 0)
  msgbox, %ingredientSelection% ; SendInput,{home}{right %IngredientSelection%}
 if (IngredientSelection < 0)
  msgbox, %AbsSelection% ;SendInput,{tab}{end}{left %Absselection%}
 sleep 300
 ; Send,{enter}
return
}