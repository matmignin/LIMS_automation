#SingleInstance,Force

EnvGet, ProductCode, ProductCode
GetExcel_LabelCopy()
return

IngredientListGuiClose:
ExitApp


IngredientList:
if (A_GuiEvent = "DoubleClick")  {
    LV_GetText(Position, A_EventInfo,1)	
    LV_GetText(Name, A_EventInfo,2)
    LV_GetText(LabelClaim, A_EventInfo,3)
    LV_GetText(LabelName, A_EventInfo,4)
	sendinput, {space}
	Gui, IngredientList:submit,NoHide
	sleep 300
	EditIngredient(LabelName,LabelClaim,Position)
	;QuickSelectNextIngredient() 
    return
}
else
return
	


#include Functions.ahk
