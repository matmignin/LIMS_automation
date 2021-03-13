
#IfWinActive
;F17::sendinput, {rctrl 2}

F20 & Right::sendinput, #{right}
F20 & Left::sendinput, #{Left}
F20 & UP::sendinput, #{UP}
F20 & Down::sendinput, #{Down}
F20::Send_batch()
F19::sendinput, % Varbar_Get(Product)()

;~rshift::sendinput, {shift}
+F20::Set_Batch()
+F17::Set_Product()
;F20::Send_Batch() ;right comm
+F12::reload
;F17::sendinput, % Varbar_Get(Product)() ;right option
;\::sendinput, \  
media_prev::SaveRerun()
Media_Play_Pause::
f11::SaveRestart()
Media_Next::run, testing.ahk
+Volume_Up::SaveRestart()

F10::Exitapp



enter::Enter()
Enter()
{
	global
	if winactive("Edit Ingredient - \\Remote"){
		Mouse_Click("OK_ProductTab_EditIngredient")
	} else if Winactive("Reason For Change - \\Remote"){
		sendinput, {click, 239, 239}
	} Else If winactive("Test Definition Editor - \\Remote"){
		Mouse_Click("Save_SpecTab_TestDefinitionEditor")

		
	} Else If Winexist("Find and Replace"){
		winactivate,
		Sendinput, !i
	} else
		sendinput, {enter}
}
