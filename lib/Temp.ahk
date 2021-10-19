

#If Winactive("Select Iterations - \\Remote")
  F20::GoSub, PasteProductRotation
#If Winactive("Book")
  F19::Gosub, CopyProductRotation
  Mbutton::send, ^{c}

#If Winactive("Edit specification - \\Remote") && TempCode
  Mbutton:: gosub, NewVersionRAE
#If Winactive("Select methods tests - \\Remote") && TempCode
#If Winactive("Results Definition - \\Remote") && TempCode
    Mbutton::send, {enter}
    numlock::gosub, AddRAE_ResultsDefinition
    rbutton::menu.lms()
    ; Lbutton::
#If mouseisover("NuGenesis LMS - \\Remote") && TempCode
  NumLock::gosub, AddRAE ;Send, {Click 83, 560} ; click edit method
  ; F20::gosub, CheckExcelRow
  ; F15::gosub, CheckExcelRow
#If TempCode
#if


SelectHeavyMetalTest:
  send {click 225, 70}{click}icp-ms (chem{enter}
  sleep 200
  send, {click 506, 339}{click 846, 657} ;click it over
return

AddRAE:
  Send, {Click 58, 757} ; click Edit Results  "NuGenesis LMS - \\Remote"
  sleep 200
AddRAE_ResultsDefinition:
  send, {click 80, 66} ; Click edit Results  "Definition - \\Remote"
  sleep 800
  send, {tab 5}mcg%A_space%rae{click 505, 568}{click 464, 547} ; tab to units and select mcg rae 284, 197 ;click scrollbar then Requirement window "Result Editor - \\Remote"
  send, {end}%a_space%RAE
  sleep 200
  send, {click 377, 649} ;click done
return
NewVersionRAE:
  ; send, {click 64, 243} ;click new version
  ; sleep 400
  sendinput, {click 429, 184}^{a}Update All Vitamin A Units with RAE{click 338, 616} ;click description "Edit specification - \\Remote"
return	

CheckExcelRow: ;goes down a lms search and fills out a excel table depending on a pixel search
  LMSwb:=ComObjActive("Excel.Application")
  loop 8 {
  clipboard:=
  send, ^c
  clipwait, 1
  sleep 200
  send, {down}
  RT:=lmswb.ActiveSheet.Range("A:A").Find(Product).offset(0,4)
  Status:=lmswb.ActiveSheet.Range("A:A").Find(Product).offset(0,3)
  if IsPixel(1203, 899,"F3EFEA")
      RT.Value:=""
    else
      RT.Value:="RT"
    sleep 400
  }
return
CopyProductRotation:
  clipboard:=
  send, ^c
  clipwait, 1
  sleep 400
  filename:= "C:\Users\mmignin\Documents\VQuest\Rotations\" Product ".txt"
  FileDelete, %FileName%
  FileAppend, %Clipboard%, %Filename%
  LMSwb:=ComObjActive("Excel.Application")
  Rotation:=lmswb.ActiveSheet.Range("A:A").Find(Product).offset(0,5)
  Rotation.Value:=Product ".txt"
  ; iniwrite %Clipboard%, data.ini, Rotations, %Product%
return  
PasteProductRotation:
  filename:= "C:\Users\mmignin\Documents\VQuest\Rotations\" Product ".txt"
  FileRead, Clipboard, %Filename%
  ; iniread Clipboard,data.ini, Rotations, %Product%
  LMSwb:=ComObjActive("Excel.Application")
  RotationDone:=lmswb.ActiveSheet.Range("A:A").Find(Product).offset(0,6)
  RotationDone.Value:="1"
  sleep 200
  send, ^v
return




#t::
Test_2:

  n-=1
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

#h::
Test_3:
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


return
test_1:  
	New Checklist(Products, ReturnFunction := "Validated")`
  
return


Test_4:


return




 
 
 
 












  makeADropDown(inifile,Category) {
    try menu,DropdownMenu, Deleteall
    Loop, Read, %inifile% ;lib\data\customers.ini
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

