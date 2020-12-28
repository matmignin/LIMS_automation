
	
CreateGUITable(){   ;Display Excel Table
	Global
  ; GuiControl, -Redraw, IngredientList
    Gui, IngredientList:Default
    Gui +LastFound +ToolWindow +Owner +AlwaysOnTop
    Gui, IngredientList:Add, ListView, x0 y0 r%Table_height% w430 Grid NoSortHdr checked gIngredientList, Position|Name|LabelClaim|MinLimit|MaxLimit|Units|Percision|LabelName|Description
	  loop, %Total_Rows%
	  LV_add(,""Position[A_index],Name[A_index],LabelClaim[A_index],MinLimit[A_index],MaxLimit[A_index],Units[A_index],Percision[A_index],LabelName[A_index],Description[A_index])
    ;GuiControl, +Redraw, IngredientList
    LV_ModifyCol(1,50) 
    LV_ModifyCol(2,250)
    LV_ModifyCol(3,100)
    LV_ModifyCol(4,0)
    LV_ModifyCol(5,0)
    LV_ModifyCol(6,0)
    LV_ModifyCol(7,0)
    LV_ModifyCol(8,0)
    LV_ModifyCol(9,0)
    LV_Delete(Table_Height)
    sleep 200
    Gui, IngredientList:Show, x50 y100 autosize, Ingredients
    return
    
GuiClose: 
    Gui, IngredientList:destroy
    Return

}




IngredientList:
if (A_GuiEvent = "DoubleClick")
{
    LV_GetText(Position, A_EventInfo,1)	
    LV_GetText(Name, A_EventInfo,2)
    LV_GetText(LabelClaim, A_EventInfo,3)
    LV_GetText(MinLimit, A_EventInfo,4)
    LV_GetText(MaxLimit, A_EventInfo,5)
    LV_GetText(Units, A_EventInfo,6)
    LV_GetText(Percision, A_EventInfo,7)
    LV_GetText(LabelName, A_EventInfo,8)
    LV_GetText(Description, A_EventInfo,9)
	sendinput, {space}
	Gui, IngredientList:submit,NoHide
 
 IfWinExist, Edit Ingredient - \\Remote 
  {
    Winactivate, Edit Ingredient - \\Remote
    sleep 200
    EditIngredient(LabelName,LabelClaim,Position)
    sleep 200
    send,{enter}
    WinWaitActive, Edit Ingredient - \\Remote
	  sleep 400
	  gosub Composition
    Return
  }
  IfWinExist, Result Editor - \\Remote 
  {
    WinActivate, Result Editor - \\Remote 
    ResultEditor()
    return
  }
  IfWinExist, Test Definition Editor - \\Remote 
  {
    WinActivate, Test Definition Editor - \\Remote 
    TestDefinitionEditor()
    Send, {tab 19}{space}
    winwait, Results Definition - \\Remote 
    {
	sleep 100
	Click,84, 72 ;Edit
	winwait, Result Editor - \\Remote  
	{
	  WinActivate,
	  Sleep 100
	  ResultEditor()
	  return
	}
    }
   }
	 else
	  msgbox % "A_eventInfo: `t" A_EventInfo " `nPosition: `t" Position "  `nLabelName: `t" LabelName "  `nLabelClaim: `t" LabelClaim " `nMin/max: `t" MinLimit "/" MaxLimit " `nUnits: `t" units " `nPercision: `t" Percision
return
} 