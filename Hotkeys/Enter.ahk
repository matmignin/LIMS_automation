Enter(){
global
if winactive("Edit Ingredient - \\Remote"){
		click("OK_Product_Tab_EditIngredient")
	} else if Winactive("Reason For Change - \\Remote"){
		sendinput, {click, 239, 239}
	} Else If winactive("Test Definition Editor - \\Remote"){
		Click("Save_Spec_Tab_TestDefinitionEditor")
	} else
		sendinput, {enter}
}



enter::Enter()