AutoTrim,On
;Iniread, Varbar_X, data.ini, Locations, Varbar_X
;Iniread, Varbar_Y, data.ini, Locations, Varbar_Y
Iniread, SpecTable_X, data.ini, Locations, SpecTable_X
Iniread, SpecTable_Y, data.ini, Locations, SpecTable_Y
iniread, Product, data.ini, Products, 1
iniread, Batch, data.ini, Batches, 1
iniread, Name, data.ini, Names, 1
iniread, Customer, data.ini, Customers, 1
iniread, Lot, data.ini, Lots, 1
iniread, Description, data.ini, Descriptions, 1
iniread, Iteration, data.ini, Iterations, 1
Excel_Connect()
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
while (Xl.Range("M" . A_Index+6).Value != "") 
{
		Position[A_index]:=		Xl.Range("F" . A_Index+7).Text
		Name[A_index]:=		Xl.Range("K" . A_Index+7).text
		LabelClaim[A_index]:=	Xl.Range("L" . A_Index+7).Text
		MinLimit[A_index]:=		Xl.Range("G" . A_Index+7).Text
		MaxLimit[A_index]:=		Xl.Range("H" . A_Index+7).Text
		Units[A_index]:=		Xl.Range("I" . A_Index+7).Text
		Percision[A_index]:=	Xl.Range("J" . A_Index+7).Text
		Description[A_index]:=	Xl.Range("N" . A_Index+7).Text

		Total_rows:=A_index
		Table_Height:=A_index
		if (Table_Height > 30)
			Table_Height = 30
	}
	
	
;GetExcel_Specification(Product)
Gui, SpecList:Default
Gui +LastFound +ToolWindow +Owner +AlwaysOnTop -SysMenu +MinimizeBox
Gui, SpecList:Add, ListView, x0 y0 r%Table_height% w320 Grid NoSortHdr checked gSpecList, `t%Product%|`t%Name%|MinLimit|MaxLimit|Units|Percision|Description
GUI, SpecLists:Font, s16 cBlack Bold, Consolas
	loop, %Total_Rows% {
		if Position[A_index] =""
			{
			Table_height:=table_height+1
			Total_rows:=total_rows-1
			continue
			}
		else	
			LV_add(,""Name[A_index],LabelClaim[A_index], MinLimit[A_index],MaxLimit[A_index],Units[A_index],Percision[A_index],Description[A_index]) 
			}
LV_ModifyCol(1,150)
LV_ModifyCol(2,0)			
LV_ModifyCol(6,0)
LV_ModifyCol(7,0)
LV_ModifyCol(8,0)
LV_ModifyCol(9,0)
LV_Delete(Table_Height)
sleep 200	
	CoordMode, mouse, screen
		Gui, SpecList:Show, x%SpecTable_X% y%SpecTable_Y% w320, %Product%
	CoordMode, mouse, window
return			








SpecList:
if (A_GuiEvent = "DoubleClick" )  {	
	LV_GetText(Name, A_EventInfo,1)
	LV_GetText(LabelClaim, A_EventInfo,2)
	LV_GetText(MinLimit, A_EventInfo,3)
	LV_GetText(MaxLimit, A_EventInfo,4)
	LV_GetText(Units, A_EventInfo,5)
	LV_GetText(Percision, A_EventInfo,6)
	LV_GetText(Description, A_EventInfo,7)
	sendinput, {space}
	Gui, SpecList:submit,NoHide
	sleep 200
	If WinExist("Result Editor - \\Remote") 
	{
		SpecTab_ResultEditor(MinLimit,MaxLimit,Units,Percision)
		return
	}
	else if winexist("Results Definition - \\Remote")
	{	
		winactivate, Results Definition - \\Remote
		Mouse_Click("Edit")
		sleep 200
		winwaitactive, Result Editor - \\Remote
		SpecTab_ResultEditor(MinLimit,MaxLimit,Units,Percision)
		return
	}
	else If WinExist("Test Definition Editor - \\Remote") 
	{
		SpecTab_TestDefinitionEditor(Description) ; the first window
		return
	}
	else If Winexist("NuGenesis LMS - \\Remote") 
	{
		winactivate,
		Mouse_Click("Main_EditTest")
		sleep 200
		winactivate, Results Definition - \\Remote
		Mouse_Click("Edit")
		SpecTab_ResultEditor(MinLimit,MaxLimit,Units,Percision)
		return
	}
	else
	return
}









SpecListGuiClose:
coordmode, mouse, Screen
WinGetPos,SpecTable_X,SpecTable_Y,w,h
sleep 100
IniWrite, %SpecTable_X%, data.ini, Locations, SpecTable_X
IniWrite, %SpecTable_Y%, data.ini, Locations, SpecTable_Y
coordmode, mouse, Window
sleep 500
ExitApp
return

;SetWorkingDir "C:\Users\mmignin\OneDrive - Vitaquest International\VQuest"
#SingleInstance,Force
;#include Functions.ahk
;#include Vquest.ahk
;#Include Lib\