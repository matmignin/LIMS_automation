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





/*
Find Formulation code
"i)(?:(Final label copy # )(\w{2}\d))?(?<Product>([abdefghijkl]\d{3}))(\d{3})"
formula plus serving size
i)(?:(Final label copy # )(\w{2}\d))?(?<Product>([abdefghijkl]\d{3}))(\d{3}).*Serving.Size:.(?<ServingSize>([\d\s\w]*\n))

customer, product, pill size, and serving size
"i)(?<Customer>([\w\s][^#\d{6}])*).*(?:Final Label Copy.*)(?<Product>([abdefghijkl]\d{3}))(\d{3}).*(?:(Capsule size|Tablet size)+:) (?<PillSize>((#)?(\w+.)+[^\n])).*Serving.Size:.(?<ServingSize>([\d\s\w]*\n))"

i)(((\d)%$)|(\Q*\E)) ;replacement string for ingredients


	Vitamin A (as natural beta-carotene from Blakeslea trispora)	1,000 mcg	111%
	Vitamin C (as ascorbic acid and from acerola fruit extract)	100 mg	111%
	Vitamin D (as vegan cholecalciferol) (VegaDELight™)	22 mcg (880 IU)	110%
	Vitamin E (as Sunvitol™ d-alpha-tocopherol from sunflower)	16.5 mg	110%
	Thiamin (as thiamin HCl)	1.3 mg	108%
	Riboflavin	1.4 mg	108%
	Niacin (as niacinamide)	17.6 mg	110%
	Vitamin B6 (as pyridoxal-5-phosphate)	1.9 mg	112%
	Folate (as calcium L-5-methyltetrahydrofolate)	400 mcg DFE	100%
	Vitamin B12 (as methylcobalamin)	2.6 mcg	108%
	Biotin	33 mcg	110%
	Pantothenic acid (as D-calcium pantothenate)	5.5 mg	110%
	Calcium (from Aquamin™ mineralized red algae and as dicalcium phosphate)	50 mg	4%
	Phosphorus (as dicalcium phosphate)	8 mg	<2%
	Iodine (from kelp)	100 mcg	67%
	Magnesium (from Aquamin™ MG seawater magnesium and from Aquamin™ mineralized red algae)	50 mg	12%
	Zinc (as zinc bisglycinate chelate) (TRAACS™)	10 mg	91%
	Selenium (as selenium glycinate complex) 	50 mcg	91%
	Copper (as copper citrate)	0.5 mg	56%
	Manganese (as manganese sulfate)	1.5 mg	65%
	Chromium (as chromium polynicotinate)	30 mcg	86%
	Molybdenum (as molybdenum amino acid chelate)	40 mcg	89%
	Vitamin K2 (as menaquinone-7) (K2Vital®)	30 mcg	*
	Organic blueberry powder (fruit)	10 mg	*
	Organic carrot powder (root)	10 mg	*
	Organic kale powder (leaf)	10 mg	*
	Organic pomegranate powder (fruit)	10 mg	*
	Organic raspberry powder (fruit)	10 mg	*
	Organic spinach powder (leaf)	10 mg	*

https://regex101.com/r/LwbVmD/1 latest page of regex

all but product nam regex
^(?<Customer>[\w* ]*)(?:.?).*(?<=\w{3})(?<Product>[abdefghijkl]\d{3})(?=\w{4}).*(?<PillType>(Capsule|Tablet)(?: size:)) (?<PillSize>[\w ]*).*(?:Serving Size: )(?<ServingSize>\d+) (?<ServingType>[\w ]+).+(?:%.Daily Value)\s+(?<Ingredients>[\w.].*)(?=\sDaily Value)

 */
 #If A_debuggerName
  Media_Prev::						F6 ;MakeTransparent()
	Media_Play_Pause::			Numlock
	Media_Next::						F7


#If Mode=="TempCode"
  F20::
  CopyWordDoc:
  F13 & t::
  ; clipboard:=
  ; send, ^c
  ; clipwait, 4
  ; sleep 400
  doc_path := "C:\Users\mmignin\Desktop\Desktop Stuff\Label Copy\All Label Copy\label K883MA (NEW).docx" ; enter path to the Word Doc
oDoc := ComObjGet(doc_path) ; access Word Doc
; clipboard:=
oDoc.range.copy() ; copy Doc contents
; clipwait, 3
sleep 300
oDoc.close()
WordText:=Clipboard
; return
  ; F19::matching_Batch("B086")
  ; F13 & t::
  ; RegExMatch(WordText, "is)(?=% Daily Value)(?<Ingredients>(.*)(?<=Percent Daily Values)")
RegExMatch(WordText, "is)(?<Customer>([\w\s][^#\d{6}])*).*(?:Final Label Copy.*)(?<Product>([abdefghijkl]\d{3}))(\d{3}).*(?:(Capsule size|Tablet size)+:) (?<PillSize>((#)?(\w+.)+[^\n])).*Serving.Size:.(?<ServingSize>([\d\s\w]*\n))", var)
; sleep 200
msgbox % " customer: `t" varCustomer "`n product: `t " varProduct "`n pillsize: `t" varPillsize "`n servingsize: `t" varServingSize "`n`n" WordText
; MsgBox, %WordText%
return
#if


  return

  ; F19::
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


; RemoveFileDuplicates2(File,Sorting:="U CL R"){
; 	global
; 	FileRead, OutputVar, % File
;   ; OutputVar:=Trim(OutputVar, " `t")
;   ; OutputVar:=trim(StrReplace(OutputVar, "`t", ""))
;   ; sleep 200
; 	Sort, OutputVar, % Sorting

; 	; NewOutputVar := RegExReplace( OutputVar , "m`a)(^\s+)|(\s+$)")
; 	FileDelete, % File
; 	sleep, 400
; 	FileAppend, %OutputVar%, % File
; }
RemoveFileDuplicates(File,Sorting:="U CL R"){
	global
	FileRead, vText, % File
  vOutput := ""
  ; vtext:=strReplace(vText, "`n`n", "")
; vText:=Trim(StrReplace(vText, "`t", ""))
VarSetCapacity(vOutput, StrLen(vText)*2*2)
oArray := {}
StrReplace(vText, "`n",, vCount)
oArray.SetCapacity(vCount+1)
;Sort, vText, D, ;add this line to sort the list
Loop Parse, vText, % "`r`n"
{
	if !oArray.HasKey("z" A_LoopField)
		oArray["z" A_LoopField] := 1, vOutput .= A_LoopField "`r`n"
}
; MsgBox, % vOutput

oArray := ""
  ; OutputVar:=Trim(OutputVar, " `t")
  ; OutputVar:=trim(StrReplace(OutputVar, "`t", ""))
  ; sleep 200
	; Sort, OutputVar, % Sorting
  ; vOutput:=trim(vOutput, "`n`n")
	NewOutputVar := RegExReplace(vOutput, "m`a)(\s\r\n)","`n")
	FileDelete, % File
	sleep, 400
	FileAppend, %NewOutputVar%, % File
}

RemoveTextDuplicates(vText){ ;maintaining order and case insensitive

vOutput := ""

; vText:=Trim(StrReplace(vText, "`t", ""))
VarSetCapacity(vOutput, StrLen(vText)*2*2)
oArray := {}
StrReplace(vText, "`n",, vCount)
oArray.SetCapacity(vCount+1)
;Sort, vText, D, ;add this line to sort the list
Loop Parse, vText, % "`n"
{
	if !oArray.HasKey("z" A_LoopField)
		oArray["z" A_LoopField] := 1, vOutput .= A_LoopField "`r`n"
}
; MsgBox, % vOutput

oArray := ""
return vOutput
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