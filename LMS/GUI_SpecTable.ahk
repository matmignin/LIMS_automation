AutoTrim,On
EnvGet, ProductCode, ProductCode
Excel_ConnectTo()
	Name:=[]
	Position:=[]
	LabelClaim:=[] 
	MinLimit:=[]
	MaxLimit:=[]
	Units:=[]
	Percision:=[]
	LabelName:=[]
	Description:=[]
	Requirement:=[]
	while (Xl.Range("J" . A_Index+6).Value != "") 
	{
		Position[A_index]:=		Xl.Range("E" . A_Index+7).Text
		Name[A_index]:=		Xl.Range("J" . A_Index+7).text
		LabelClaim[A_index]:=	Xl.Range("K" . A_Index+7).Text
		MinLimit[A_index]:=		Xl.Range("F" . A_Index+7).Text
		MaxLimit[A_index]:=		Xl.Range("G" . A_Index+7).Text
		Units[A_index]:=		Xl.Range("H" . A_Index+7).Text
		Percision[A_index]:=	Xl.Range("I" . A_Index+7).Text
		LabelName[A_index]:=	Xl.Range("L" . A_Index+7).Text
		Description[A_index]:=	Xl.Range("M" . A_Index+7).Text
		Requirement[A_index]:=	Xl.Range("N" . A_Index+7).Text
		Total_rows:=A_index
		Table_Height:=A_index
		if (Table_Height > 30)
			Table_Height = 30
	}
	
	
;GetExcel_Specification(ProductCode)
Gui, SpecList:Default
Gui +LastFound +ToolWindow +Owner +AlwaysOnTop -SysMenu +MinimizeBox
Gui, SpecList:Add, ListView, x0 y0 r%Table_height% w320 Grid NoSortHdr checked gSpecList, `t%ProductCode%|`t%Name%|MinLimit|MaxLimit|Units|Percision|LabelName|Description|Requirement
GUI, SpecLists:Font, s16 cBlack Bold, Consolas
	loop, %Total_Rows% {
		if Position[A_index] =""
			{
			Table_height:=table_height+1
			Total_rows:=total_rows-1
			continue
			}
		else	
			LV_add(,""Name[A_index],LabelClaim[A_index], MinLimit[A_index],MaxLimit[A_index],Units[A_index],Percision[A_index],LabelName[A_index],Description[A_index],Requirement[A_index]) 
			}
LV_ModifyCol(1,150)
LV_ModifyCol(2,0)			
LV_ModifyCol(6,0)
LV_ModifyCol(7,0)
LV_ModifyCol(8,0)
LV_ModifyCol(9,0)
LV_Delete(Table_Height)
sleep 200	
CoordMode, mouse, Screen
MouseGetPos, xPos, yPos	
xPos:=xPos + 200
ypos:=ypos - 150
CoordMode, mouse, window
Gui, SpecList:Show, x%xpos% y%ypos% autosize noactivate, Specifications
return			








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
	LV_GetText(Requirement, A_EventInfo,9)
	sendinput, {space}
	Gui, SpecList:submit,NoHide
	sleep 200
	If WinExist("Result Editor - \\Remote") 
	{
		Spec_Tab_ResultEditor(MinLimit,MaxLimit,Units,Percision)
		return
	}
	else if winexist("Results Definition - \\Remote")
	{	
		winactivate, Results Definition - \\Remote
		Click("Edit")
		sleep 200
		winwaitactive, Result Editor - \\Remote
		Spec_Tab_ResultEditor(MinLimit,MaxLimit,Units,Percision)
		return
	}
	else If WinExist("Test Definition Editor - \\Remote") 
	{
		Spec_Tab_TestDefinitionEditor(Description) ; the first window
		return
	}
	else
	return
}









SpecListGuiClose:
	ExitApp
	return
#SingleInstance,Force
#include Functions.ahk
;#include VariableBar.ahk
