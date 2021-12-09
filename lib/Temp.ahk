ExampleString:=
(
"K741 107-0431 0278H1
H624 400657
B324 105-1172 0656H1
J929 910-0128 0623I1
J837 109-0445 0670I1
H259 109-0359 0555I1 Ct#109-0744
B086 108-0752 Ct#109-0635
B086 108-0752 Bulk Ct#109-0635
K741 107-0431 0278H1
H624 400657
B324 105-1172 0656H1
J929 910-0128 0623I1
J837 109-0445 0670I1
J837 109-0445 0670I1
J837 109-0445 7777A7
J837 109-0445
H259 109-0359 0555I1 Ct#109-0744
B086 108-0752 Ct#109-0635
B086 108-0752 Bulk Ct#109-0635"
)


#If A_debuggerName
  Media_Prev::						F6 ;MakeTransparent()
	Media_Play_Pause::			Numlock
	Media_Next::						F7

#If Mode=="TempCode"
  F20::

try
	; create an XMLDOMDocument object
	; set its top-level node
	x := new xml("<root/>")
catch pe ; catch parsing error(if any)
	MsgBox, 16, PARSE ERROR
	, % "Exception thrown!!`n`nWhat: " pe.What "`nFile: " pe.File
	. "`nLine: " pe.Line "`nMessage: " pe.Message "`nExtra: " pe.Extra
; check if top-level node exists in this case, 'root'
  ; x.loadXML("Data\Codes2.xml")
if x.documentElement {
	; add a 'comment' node
	; x.addChild("//Product", "comment", "Products")
	; x.addChild("//Product", "e", "Batch")
  ; x.AddElement("Product", "//Products", "K277")
	; x.addChild("//root", "e", "Product")
  x.AddElement("Product", "//root", "K277")
  x.AddElement("Product", "//root", "K888")
	x.addChild("//Product", "e", "Batch")
	x.addChild("//Batch", "e", "Lot")
  ; x.AddElement("Batch", "//Product", "222-2222")
  ; x.AddElement("Batch", "//Product", "333-3333")
  ; x.AddElement("Lot", "//Batch", "0033A3")
	; x.addChild("//root", "e", "Product")
	; x.addChild("//Batch", "e", "Lot")
	; x.addChild("//P", "e", "Batch")
  ; x.AddElement("Lot", "//Batch", "2220A2")
  ; x.AddElement("Batch", "//K277", "333-3333")
  ; x.AddElement("Product", "//Parent", "Product")
  ; x.addelement("Batch", "111", "//child", {attribute: "value " "111"}, "b")

	; add an 'element' node to the 'root' node
	; and set its 'nodeName' property to 'child'
	; x.addElement("Batch", "Product")
;
	; add some child nodes
	; for a, b in ["e", "s", "r", "Wednesday", "Thursday", "Friday", "Saturday"]
		; x.addElement("Batch_" a, "//Products", {attribute: "value " a}, b)

	; Traverse and show 'attribute' and 'text' value
	; of the newly appended nodes
	; Loop, 7 {
		; n := x.getChild("//child", "element", A_Index)
		; MsgBox, % "Attribute: " n.getAttribute("attribute")
			; . "`nText: " n.text
	; }

	; view XML document
	; transform document using internal stylesheet
	x.transformXML()
	x.viewXML()
  x.save("Data\Codes.xml")
}
    ; e := xmlObj.addElement("Node", "//Parent", {name: "Element"}, "Text")
    ; e := xmlObj.insertElement("Node", "//Sibling", {name: "Element"}, {att: "Value"})
RETURN ;VALUE: An object. Returns the new element node

  return

  F19::
  ; loop, read, Data\CurrentCodes.txt
			; CurrentCodes .= "|yoyoyoyo||yeyeyey"
  return
  ;Mbutton::GetAllBatches()

  Update_Varbar_Dropdown:
    Gui Varbar:Default
    GuiControl,,DDL, % "K999||"
    return

  Select_Dropdown_Menu_on_VarBar:
            Gui Varbar:Default
  					GuiControl, ChooseString, ComboBox1, Debugging
						Excel.Connect(1)
            gui, Varbar:Submit, nohide
            TT(A_mode)
            Varbar.SetColor()
						return    ;excel.FindAndReplace("Stage","Specs","B:B",0,1)
  ; F15:


;   send, {click 39, 611}
; 		if !winactive("Edit test (Field Configuration: ")
;     	winwaitactive, Edit test (Field Configuration: ,, 2
;     Send,{Click, 402, 284}{end}(on sample log){click, 334, 618}
;     return



; #If winactive("Edit specification - \\Remote") && TempCode
;   ; Mbutton:: gosub, NewVersionRAE
; #If winactive("Select methods tests - \\Remote") && TempCode
; #If winactive("Results Definition - \\Remote") && TempCode
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

Test_2:       ;;|||||||||||||||||||||||||||||||||||||||||||||||||||||||| TEST 2 ||||||||||||||||||||||||||||||||||||||||||||||||||||
GetAllBatches()
return
; Select_next_batch_in_array:
SelectPreviousBatch(){
  global
  n+=1
  Haystack:=Products[n]
  whereAt:=listarray(Products)
  whereatsplit:=StrReplace(whereAt, n ": ","`t" )
  pop(whereatsplit)
  clip.regex(Haystack)
  ; RegExMatch(Haystack, "i)(?<Product>([abdefghijkl]\d{3})?).?(?<Batch>(\d{3}-\d{4})?).?(?<Lot>(\d{4}\w\d\w?|Bulk|G\d{7}\w?)?).?(Ct#)?(?<Coated>(\d{3}-\d{4})?)", s)
  ;   if sProduct {
  ;     Product:=sProduct
  ;     GuiControl,Varbar:Text, Product, %sProduct%
  ;   }
  ;   Batch:=sBatch
  ;   lot:=slot
  ;   Coated:=sCoated
  ;   GuiControl,Varbar:Text, Batch, %sBatch%
  ;   GuiControl,Varbar:Text, lot, %slot%
  ;   GuiControl,Varbar:Text, Coated, %sCoated%
    try XL.Sheets(sProduct).activate
}
    return



return
Test_1:       ;;|||||||||||||||||||||||||||||||||||||||||||||||||||||||| TEST 1 ||||||||||||||||||||||||||||||||||||||||||||||||||||
return
  ;Select_Previous_Batch_In_Array: ;Move to previous Batch in Array
    SelectNextBatch(){
    n-=1
    Haystack:=Products[n]
    whereAt:=listarray(Products)
    whereatsplit:=StrReplace(whereAt, n ": ","`t" )
    pop(whereatsplit)
    Clip.Regex(Haystack)
    ; RegExMatch(Haystack, "i)(?<Product>([abdefghijkl]\d{3})?).?(?<Batch>(\d{3}-\d{4})?).?(?<Lot>(\d{4}\w\d\w?|Bulk|G\d{7}\w?)?).?(Ct#)?(?<Coated>(\d{3}-\d{4})?)", s)
      ; if sProduct {
      ;   Product:=sProduct
      ;   GuiControl,Varbar:Text, Product, %sProduct%
      ; }
      ; Batch:=sBatch
      ; lot:=slot
      ; Coated:=sCoated
      ; GuiControl,Varbar:Text, Batch, %sBatch%
      ; GuiControl,Varbar:Text, lot, %slot%
      ; GuiControl,Varbar:Text, Coated, %sCoated%
      try XL.Sheets(sProduct).activate
    }
  return

RemoveFileDuplicates("C:\Users\mmignin\Documents\VQuest\Data\Duplicate Test - Copy.txt")
; test_3() ; delete duplicates
return


RemoveFileDuplicates(File,Sorting:="U CL R"){
	global
	FileRead, OutputVar, % File
  OutputVar:=Trim(OutputVar, " `t")
	Sort, OutputVar, % Sorting

	; NewOutputVar := RegExReplace( OutputVar , "m`a)(^\s+)|(\s+$)")
	FileDelete, % File
	sleep, 300
	FileAppend, %OutputVar%, % File
}








create_CurrentCodes_Dropdown:
menu.ProductSelection()
return
Test_4:       ;;|||||||||||||||||||||||||||||||||||||||||||||||||||||||| TEST 4 ||||||||||||||||||||||||||||||||||||||||||||||||||||
    try menu,DropdownMenu, Deleteall
    Loop, Read, data\CurrentCodes.Txt
    {
    ; If A_Index = 1 ;for if its an INI file
      ; Continue
    ParseList := StrSplit(A_LoopReadLine, "`n")
    ; Sort, ParseList, U
      ; MethodGroup := StrSplit(A_LoopReadLine, "|") ;for a 2nd split
    Selection:= % "&" A_index " " ParseList[1]
      ; Group:= % MethodGroup[2] ;for a second split
    Menu, Dropdownmenu, add, %Selection%, CurrentCodesMenu
    }
    Menu, DropdownMenu, Show,
    return

    CurrentCodesMenu:
      sleep 200
    RegExMatch(A_ThisMenuItem, "i)(?<Product>([abdefghijkl]\d{3})?).?(?<Batch>(\d{3}-\d{4})?).?(?<Lot>(\d{4}\w\d\w?|Bulk|G\d{7}\w?)?).?(Ct#)?(?<Coated>(\d{3}-\d{4})?)", s)
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

      ; IniRead,vOutput, %inifile%, %Category%, %InputVar%
      Pop(A_ThisMenuItem,vOutput)
      return




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





` & r::REQUESTGUID()
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
    menu, menu, add
    menu, menu, add, E&xit, ExitMenu
		Menu, Menu, Show,
		return
		REQUESTGUID:
			sleep 200
			InputVar:=A_ThisMenuItem
			IniRead,vOutput, data\REQUESTGUID.ini, REQUESTGUID, %InputVar%
			Sendinput, %vOutput%{Lwinup}
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


  makeADropdown(inifile,Category) {
    try menu,DropdownMenu, Deleteall
    Loop, Read, %inifile% ;data\customers.ini
    {
    If A_Index = 1
      Continue
    ParseList := StrSplit(A_LoopReadLine, "`n")
      ; MethodGroup := StrSplit(A_LoopReadLine, "|") ;for a 2nd split
    Selection:= % ParseList[1]
      ; Group:= % MethodGroup[2] ;for a second split
    Menu, Dropdownmenu, add, %Selection%, Dropdownhandler
    }
    Menu, DropdownMenu, Show,
    return

    Dropdownhandler:
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