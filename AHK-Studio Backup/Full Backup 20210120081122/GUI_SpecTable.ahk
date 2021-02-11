#SingleInstance,Force

EnvGet, ProductCode, ProductCode
;GuiControl, -Redraw, SpecList
GetExcel_Specification()
Gui, SpecList:Default
Gui +LastFound +ToolWindow +Owner +AlwaysOnTop -Sysmenu +MinimizeBox
Gui, SpecList:Add, ListView, x0 y0 r%Table_height% w320 Grid NoSortHdr checked gSpecList, `t%XL_Code%|`t%XL_Name%|`t%XL_Customer%|MaxLimit|Units|Percision|LabelName|Description
GuiControl, +Redraw, SpecList
loop, %Total_Rows%
	LV_add(,""Name[A_index],LabelClaim[A_index], MinLimit[A_index],MaxLimit[A_index],Units[A_index],Percision[A_index],LabelName[A_index],Description[A_index]) 
LV_ModifyCol(1,150)
LV_ModifyCol(2,0)			
LV_ModifyCol(6,0)
LV_ModifyCol(7,0)
LV_ModifyCol(8,0)
;LV_Delete(Table_Height)
sleep 200	
CoordMode, mouse, Screen
MouseGetPos, xPos, yPos	
xPos:=xPos + 300
ypos:=ypos - 50
CoordMode, mouse, window
Gui, SpecList:Show, x%xpos% y%ypos% autosize noactivate, Specifications
return			

				SpecListGuiClose:
ExitApp

				SpecList:
if (A_GuiEvent = "DoubleClick" )  {	
	LV_GetText(Name, A_EventInfo,1)
	LV_GetText(LabelClaim, A_EventInfo,2)
	LV_GetText(MinLimit, A_EventInfo,3)
	LV_GetText(MaxLimit, A_EventInfo,4)
	LV_GetText(Units, A_EventInfo,5)
	LV_GetText(Percision, A_EventInfo,6)
	LV_GetText(LabelName, A_EventInfo,7)
	LV_GetText(Description, A_EventInfo,8)
	sendinput, {space}
	Gui, SpecList:submit,NoHide
	sleep 200
	IfWinExist, Result Editor - \\Remote 
	{
		WinActivate, Result Editor - \\Remote 
		ResultEditor(MinLimit,MaxLimit,Units,Percision)
		return
	}
	IfWinExist, Test Definition Editor - \\Remote 
	{
		WinActivate, Test Definition Editor - \\Remote 
		TestDefinitionEditor(Description)
		click 79, 64 ;click edit
		sleep 500
		ifwinexist, Result Editor - \\Remote 
			ResultEditor(MinLimit,MaxLimit,Units,Percision)
		return
	}
	else
	return
}




;SPEC_TAB_FUNCTIONS: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::




;#include Specification_Tab.ahk
#include Functions.ahk
