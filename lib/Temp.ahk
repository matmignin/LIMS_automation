
#If A_Mode=="TempCode"
  Mbutton:: 
            Gui Varbar:Default
  					GuiControl, ChooseString, ComboBox1, EnteringRotations			
						Excel.Connect(1) 
            TT(A_mode)
						return    ;excel.FindAndReplace("Stage","Specs","B:B",0,1)
  ; F15:


;   send, {click 39, 611}
; 		if !winactive("Edit test (Field Configuration: ")
;     	winwaitactive, Edit test (Field Configuration: ,, 2
;     Send,{Click, 402, 284}{end}(on sample log){click, 334, 618}
;     return



; #If Winactive("Edit specification - \\Remote") && TempCode
;   ; Mbutton:: gosub, NewVersionRAE
; #If Winactive("Select methods tests - \\Remote") && TempCode
; #If Winactive("Results Definition - \\Remote") && TempCode
;     Mbutton::send, {enter}
;     numlock::gosub, AddRAE_ResultsDefinition
;     rbutton::menu.lms()  
;     ; Lbutton::
; #If mouseisover("NuGenesis LMS - \\Remote") && TempCode
;   ; NumLock::gosub, AddRAE ;Send, {Click 83, 560} ; click edit method
;   ; F20::gosub, CheckExcelRow
;   ; F15::gosub, CheckExcelRow

return
#if

Select_next_batch_in_array:
  n+=1
  Haystack:=Products[n]
  whereAt:=listarray(Products)
  whereatsplit:=StrReplace(whereAt, n ": ","`t" )
  pop(whereatsplit)
  RegExMatch(Haystack, "i)(?<Product>([abdefghijkl]\d{3})?).?(?<Batch>(\d{3}-\d{4})?).?(?<Lot>(\d{4}\w\d\w?|Bulk|G\d{7}\w?)?).?(Ct#)?(?<Coated>(\d{3}-\d{4})?)", s)
    if sProduct {
      Product:=sProduct
      GuiControl,Varbar:Text, Product, %sProduct%
    }
    Batch:=sBatch
    lot:=slot
    Coated:=sCoated
    GuiControl,Varbar:Text, Batch, %sBatch%
    GuiControl,Varbar:Text, lot, %slot%
    GuiControl,Varbar:Text, Coated, %sCoated%
    try XL.Sheets(sProduct).activate
    return



return

Test_2: ;;Move to previous Batch in Array
  Select_Previous_Batch_In_Array:
    n-=1
    Haystack:=Products[n]
    whereAt:=listarray(Products)
    whereatsplit:=StrReplace(whereAt, n ": ","`t" )
    pop(whereatsplit)
    RegExMatch(Haystack, "i)(?<Product>([abdefghijkl]\d{3})?).?(?<Batch>(\d{3}-\d{4})?).?(?<Lot>(\d{4}\w\d\w?|Bulk|G\d{7}\w?)?).?(Ct#)?(? <Coated>(\d{3}-\d{4})?)", s)
      if sProduct {
        Product:=sProduct
        GuiControl,Varbar:Text, Product, %sProduct%
      }
      Batch:=sBatch
      lot:=slot
      Coated:=sCoated
      GuiControl,Varbar:Text, Batch, %sBatch%
      GuiControl,Varbar:Text, lot, %slot%
      GuiControl,Varbar:Text, Coated, %sCoated%
      try XL.Sheets(sProduct).activate
  return


test_1:
  Create_a_CheckList_From_recent_products:
    Temp:=[]
    RecentProducts:=
        FileRead, LoadedNotes, RecentProducts.txt
        Temp := StrSplit(LoadedNotes,"`r`n")
		Loop % Temp.MaxIndex(){ 
      RecentProducts.=Temp[a_index]"`r`n"
    }
    sleep 200
    New Checklist(RecentProducts, ReturnFunction := "Validated")
return


Test_4:
  add_a_ToDo_item:
    Gui, Add, Checkbox, vMyCheckBoxVar gMyCheckBoxSub, Add item to do
    Gui, Add, Edit, Disabled vToDoItemVar
    Gui, Add, Button, gSaveSub, Save
    Gui, Show
return




return


MyCheckBoxSub:
  Gui, Submit, NoHide                      ; Save all states to variables so that we can check whether the checkbox has just been checked or unchecked
  If MyCheckBoxVar                         ; If the checkbox has been checked...
    GuiControl, Enable, ToDoItemVar        ; ...enable the edit box
  Else GuiControl, Disable, ToDoItemVar    ; ...otherwise, disable the edit box
return

SaveSub:
  Gui, Submit, NoHide                      ; Save all states to variables so that we can write what is in the edit box to the INI file
  ; Add IniWrite line here and use %ToDoItemVar% as the "value" to write
return
;
Return





F13 & t::REQUESTGUID()
Tab & t::gosub, ADD_A_DROPDOWN_REQUESTGUID_ITEM

REQUESTGUID() { ;; create a dropdown from RequestGUID ini datafile 
		global
		Loop, Read, data\REQUESTGUID.ini
		{
		If A_Index = 1
			Continue
		REQUESTGUID := StrSplit(A_LoopReadLine, "=")
		Selection:= % REQUESTGUID[1]
		Menu, Menu, add, %Selection%, REQUESTGUID
		}
		Menu, Menu, Show,
		return
		REQUESTGUID:
			sleep 200
			InputVar:=A_ThisMenuItem
			IniRead,vOutput, data\REQUESTGUID.ini, REQUESTGUID, %InputVar%
			SendInput, %vOutput%
      menu, Menu, DeleteAll
			return
}


ADD_A_TODO_LIST_ITEM_IN_VSCODE:
InputBox, TODO, Write a Todo
VSCODEToDo:= "☐ " TODO "`n"
FileAppend, %VSCODETODO%, C:\Users\mmignin\Documents\VQuest\TODO
Return
ADD_A_DROPDOWN_REQUESTGUID_ITEM:
InputBox, Variable, Variable Name = Variable 
VARIABLEITEM:= "`n" Variable 
FileAppend, %VARIABLEITEM%, C:\Users\mmignin\Documents\VQuest\Data\REQUESTGUID.ini
Return


  makeADropDown(inifile,Category) {
    try menu,DropdownMenu, Deleteall
    Loop, Read, %inifile% ;data\customers.ini
    {
    If A_Index = 1
      Continue
    ParseList := StrSplit(A_LoopReadLine, "=")
      ; MethodGroup := StrSplit(A_LoopReadLine, "|") ;for a 2nd split
    Selection:= % ParseList[1]
      ; Group:= % MethodGroup[2] ;for a second split
    Menu, Dropdownmenu, add, %Selection%, DropDownhandler
    }
    Menu, DropdownMenu, Show,
    return

    DropDownhandler:
      InputVar:=A_ThisMenuItem
      IniRead,vOutput, %inifile%, %Category%, %InputVar%
      Pop(Inputvar,vOutput)
      return
  }



NoIdle(){
	global
	Menu, Tray, ToggleCheck, NoIdle
	If NoIdle:= !NoIdle
	{
		SetTimer, NoidleTimer, % (3*60*1000)
		Menu, Tray, Check, NoIdle
	}
	else 
	{
		Menu, Tray, unCheck, NoIdle
		Settimer, NoidleTimer,off
	}
	Varbar.Show()
  
NoIdleTimer:
  if (A_TimeIdle > (60*1000) && NoIdle) {
    MouseMove, 1,0,0,R
    SLEEP 50
    MouseMove, -1,0,0,R
  }


}