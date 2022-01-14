
return
ExitMenu:
Menu,Menu, deleteAll
return

class Menu{

    Delete(){
    global
    try Menu,Menu, deleteAll
    }

    add(Item:="",group:="MenuHandle"){
    global
    Menu,menu,add,%item%,%group%
    }

    PasteStuff(){
    global
		try Menu,Menu, deleteAll
      Menu, Menu, add, All &Products,   <#Space
      Menu, Menu, add, All &Batches,    <!Space
      Menu, Menu, add, All &WorkSheets, F19 & up
      ; Menu, Menu, add, %Product%, F20 & left
      Menu, Menu, add, Products_Tab, <#space
      Menu, Menu, add, Batches_Tab, <!space
      if winactive("ahk_exe Code.exe")
        Menu, Menu, add, &LMS Title, InputToVsCode
        Menu, Menu, add, window &Title, InputToVsCode
        Menu, Menu, add, window &Process, InputToVsCode
        Menu, Menu, add, &Click Position, InputToVsCode
        Menu, Menu, add, &Mouse Position, InputToVsCode
        Menu, Menu, add, window Location, InputToVsCode
        Menu, Menu, add,
        Menu, Menu, add, E&xit, ExitMenu
      Menu, Menu, Show
      ; KeyWait, Rbutton, U
        ; try Menu,Menu, deleteAll
    }

    ProductHistory(){
    global
		try Menu,Menu, deleteAll
		Loop, Read, data\Products.txt
			Menu, Menu, Add, %A_LoopReadLine%, ProductHistory
		Menu, Menu, Show
    return
    }
    ProductSelection(){
    global
    try menu,DropdownMenu, Deleteall
    Loop, Read, data\CurrentCodes.Txt
    {
    ; If A_Index = 1 ;for if its an INI file
      ; Continue
    ParseList := StrSplit(A_LoopReadLine, "`n")
      if A_index < 10
        Selection:= % "&" A_index " " ParseList[1]
       else
        Selection:= % A_index " " ParseList[1]
    Menu, Dropdownmenu, add, %Selection%, CurrentCodesMenu
    }
    Menu, DropdownMenu, Show,
    return

    CurrentCodesMenu:
      sleep 200
      Clipboard:=A_ThismenuItem
      return
    }


    VsCode(){
    global
		try Menu,Menu, deleteAll
    if winactive("ahk_exe Code.exe")
      Menu, Menu, add, &LMS Title, InputToVsCode
    Menu, Menu, add, window Title, InputToVsCode
    Menu, Menu, add, window Process, InputToVsCode
    Menu, Menu, add, Click Position, InputToVsCode
    Menu, Menu, add, Mouse Position, InputToVsCode
    Menu, Menu, add, window Location, InputToVsCode
    Menu, Menu, add,
    Menu, Menu, add, E&xit, ExitMenu
    try Menu, Menu, Show
    return

    InputToVSCode:
    if A_thismenuItem contains &LMS Title
    {
      winactivate, ahk_exe WFICA32.EXE
      windowInfo()
      winactivate, ahk_exe Code.exe
      send % wintitle
      return
    }
    else if (A_thismenuitem Contains E&xit) || (A_priorkey contains esc)
      Menu,Menu, deleteAll
    else
    {
    tt("find window and click space",3000)
    KeyWait, Space, d
    windowInfo()
    winactivate, ahk_exe Code.exe
    sleep 200
    if A_thismenuItem contains window &Title
      send % wintitle
    else if A_thismenuItem contains window &Process
      send % Process
    else if A_thismenuItem contains &Click Position
      send % "{click " MousePosition "}"
    else if A_thismenuItem contains &Mouse Position
      send % MousePosition
    else if A_thismenuItem contains window Location
      send % winLocation
    ; sendinput, %A_thismenuItem%
    try Menu,Menu, deleteAll
    }
    return
    }


  CopyPasteSpec(){
    global copypasteToggle
     click
      try This.delete()
        Menu,Menu, add, Copy &Template, autofill
      If CopyPasteToggle=1
        Menu,Menu, add, Paste &Specs, Autofill
      If CopyPasteToggle=0
        Menu,Menu, add, Copy &Specs, Autofill
      return
  }
LMS(){
  Global
  try This.delete()
  if winactive("NuGenesis LMS - \\Remote"){
    ; LMS.Orient()
    LMS.DetectTab()

    ; msgbox, %Tab%
    ; click
    if (Tab="Samples")
      Menu, Menu, add, New &Request, AutoFill
    else if (Tab="Tests")
      Menu,Menu, add, &Delete Retain, Autofill
    else if (Tab="Specs"){
      this.CopyPasteSpec()
      Menu,Menu, add, &Delete Retain, Autofill
    }

    else {
      Menu,Menu, add, &Production Server, LMS_Env
      Menu,Menu, add, &Test Server, LMS_Env
    }
      Menu, Menu, add, Paste All &Products,   F19 & down
      Menu, Menu, add, Paste All &Batches,    F19 & Left
      Menu, Menu, add, Paste All &WorkSheets, F19 & up
    Try Menu,menu,show
  }
  if winactive("Edit specification - \\Remote"){
    Menu, Menu, add, &Analytical, AutoFill
    Menu, Menu, add, &Physical, AutoFill
    Menu, Menu, add, &Micro, AutoFill
    Menu, Menu, add, &Retain, AutoFill
    Menu, Menu, add, &Coated_Physical, AutoFill
    Menu, Menu, add, &Coated_Retain, AutoFill
  Try Menu,menu,show
  }
  if winactive("Results Definition - \\Remote") || winactive("Composition - \\Remote"){
    ; This.add("&Spec Table","Tests")
    Menu,Menu, add
    Menu, Menu, Add, &USP Heavy Metal,Autofill
    Menu, Menu, Add, &Canada Heavy Metal,Autofill
    Menu, Menu, Add, &Prop65 Heavy Metal,Autofill
    Menu, Menu, Add, &Report Only Heavy Metal,Autofill
  Try Menu,menu,show
  return
  }
  if winactive("Edit specification - \\Remote"){
    Menu,Menu, add, Departments, Autofill
    Menu, DepartmentsMenu, add, Analytical, AutoFill
    Menu, DepartmentsMenu, add, Physical, AutoFill
    Menu, DepartmentsMenu, add, Micro, AutoFill
    Menu, DepartmentsMenu, add, Retain, AutoFill
    Menu, DepartmentsMenu, add, Coated_Physical, AutoFill
    Menu, DepartmentsMenu, add, Coated_Retain, AutoFill
    Menu,Menu, add, departments, :DepartmentsMenu
  Try Menu,menu,show
  return
  }
  if winactive("Login - \\Remote"){
    Menu,Menu, add, &Login, LMS_Env
    Menu,Menu, add, &Production Server, LMS_Env
    Menu,Menu, add, &Test Server, LMS_Env
  Try Menu,menu,show
  }
  else
    return
  }


Variable(){
    global
    ; CoordMode, mouse, Screen
    ; MouseGetPos, mx, my
    try
    this.delete()
    ; Menu, Menu, add, &Variables, Variable
      if Product
        Menu, menu, Add, &Product `t %Product%, Variable
      if Batch
        Menu, menu, Add, &Batch `t %Batch%, Variable
      if Lot
        Menu, menu, Add, &Lot `t %Lot%, Variable
      if SampleID
        Menu, menu, Add, &SampleID `t %SampleID%, Variable
      if Name
        Menu, menu, Add, &Name `t %name%, Variable
      if Customer
        Menu, menu, Add, Cus&tomer `t %Customer%, Variable
      if Coated
        Menu, menu, Add, &Coated `t %Coated%, Variable
      if Color
        Menu, menu, Add, C&olor `t %Color%, Variable
      if ShapeSize
        Menu, menu, Add, Sha&peSize `t %ShapeSize%, Variable
      if Weight
        Menu, menu, Add, &Weight `t %Weight%, Variable
    ; Menu,Menu, add, &Variables, :Variables
    Try Menu,menu,show
    Return
  Variable:
    sleep 300
    click
    if A_thismenuItem contains &Product `t %Product%,
      send % Product
    else if A_thismenuItem contains &Batch `t %Batch%
      send % Batch
    else if A_thismenuItem contains &name `t %name%
      send % Name
    else if A_thismenuItem contains &SampleID `t %SampleID%
      send % SampleID
    else if A_thismenuItem contains &lot `t %Lot%
      send % Lot
    else if A_thismenuItem contains &Coated `t %Coated%
      send % Coated
    else if A_thismenuItem contains Cus&tomer `t %Customer%
      send % Customer
    else if A_thismenuItem contains C&olor `t %Color%
      send % Color
    else if A_thismenuItem contains Sha&peSize `t %ShapeSize%
      send % shapesize
    else if A_thismenuItem contains &Weight `t %Weight%
      send % Weight
    else if A_ThisMenuItem is digit
      {
        Iteration:=A_Thismenuitem
        GuiControl, Varbar:Text, iteration, %A_thismenuitem%
        Clip()
        sleep 200
        varbar.Search("Batch")
      }
    else
      Menu,Menu, deleteAll
    return



    }
  Tables(){
    try
    This.delete()
    Menu,Menu,add,&Spec Table,Tests
    Menu,Menu,add,&Ingredient Table,Tests
    ;menu,Menu,add,&Rotation Table,Tests
    Try Menu,menu,show
    ;Menu,menu,add
    }
  passwords(){
    global
    This.delete()
      Menu,Menu, add, &Production Server, LMS_Env
      Menu,Menu, add, &Test Server, LMS_Env
      menu, menu, add
      ; Menu, Menu, Add, VQ Login, Passwords
      ; Menu, Menu, Add, Kilgore, Passwords
        Menu, Menu, Add, &Aditi,Passwords
        Menu, Menu, Add, &Bharat,Passwords
        Menu, Menu, Add, &Mmignin,Passwords
    Try Menu,menu,show
    return
  Passwords:
    if (A_ThisMenuItem = "Samples")
    Sendinput, care{enter}
   else if (A_ThisMenuItem = "Tests")
    Sendinput, lab{enter}
   else if (A_ThisMenuItem = "Visual")
    Sendinput, open{enter}
   else if (A_ThisMenuItem = "&VQ Login")
    Sendinput, +Kilgore7744{enter}
   else if (A_ThisMenuItem = "&Aditi")
    Sendinput, asharma{tab}lab1234{enter}
   else if (A_ThisMenuItem = "&Bharat")
    Sendinput, bgohel{tab}lab123{enter}
   else if (A_ThisMenuItem = "&mmignin")
    Sendinput,mmignin{tab}Kilgore7744{enter}
   else
    Menu,Menu, deleteAll
   return
    }
  Reasons(){
    global
    This.delete()
    menu,menu,add, Fixing Rotation, Reasons
    menu,menu,add, Removing B12 from Rotation AL %daystring%, Reasons
    Try Menu,menu,show
    Return

    Reasons:
		winactivate, Reason For Change - \\Remote
		Send,{click 143, 118}%A_ThisMenuItem%
   if A_thismenuitem contains Fixing Rotation
    send, {click 240, 239}
  ;  else if A_thismenuItem contains Removing B12 from Rotation AL %daystring%
    ; ReasonText:="Removing B12 from rotation AL " Daystring
  ;  else if A_thismenuItem contains Duplicate Entry
    ; ReasonText:="Duplicate Entry"
  ;  else
		; Send,{click 143, 118}%A_ThisMenuItem%{click 240, 239}
    Menu,Menu, deleteAll
   return
    }

  Apps(){
  global
  try This.delete()
    menu, menu, add
    Menu, Menu, Add, &LMS , !l
    Menu, Menu, Add, &VScode , !v
    Menu, Menu, Add, &Outlook, !o
    Menu, Menu, Add, &Phone, !p
    ; Menu, Menu, Add, &Workbook, !w
    Menu, Menu, Add, &Explorer, !e
    ; Menu, Menu, Add, &WorkSheets, Tests
    Menu, SubMenu, Add, &workBook, !w
    Menu, SubMenu, Add, &Test Log, F2
    Menu, SubMenu, Add, &Sample Log, +F2
    Menu, SubMenu, Add, &Rotations, ^F4
    Menu, SubMenu, Add, &Product Checklist, F3
    Menu, SubMenu, Add, &All Label Copy, F4
  Menu, Menu, add, &WorkSeehts, :SubMenu
    if winexist("Login - \\Remote"){
      Menu,Menu, add, &Production Server, LMS_Env
      Menu,Menu, add, &Test Server, LMS_Env
      }
  Try Menu,menu,show
  }

TaskBar(){
  global
  try This.delete()
    ; Menu, Menu, Add, &Editing_Batches , Editing_Batches
    Menu, Menu, Add, downloads , #^F1
    Menu, Menu, Add, Desktop , +#^F1
    Menu, Menu, Add, &VQuest , #^v
    Menu, Menu, Add, &Settings.ini , +#^F8
    Menu, DataFiles, Add, CurrentCodes.txt, +#^F9
    Menu, DataFiles, Add, SavedTextMenu.ini, +#^F9
    Menu, DataFiles, Add, Methods.ini, +#^F9
    Menu, DataFiles, Add, Debug.txt, +#^F9
    Menu, Menu, add, Data Files, :DataFiles
    Menu, ExampleCode, Add, AHK Regex, +#^F7
    Menu, ExampleCode, Add, AHK Regex Advanced, +#^F7
    Menu, ExampleCode, Add, ClipboardHistory, +#^F7
    Menu, ExampleCode, Add, RegexTester, +#^F7
    Menu, Menu, add, &Example Code, :ExampleCode
    menu, menu, add, AHK Help, F1


    menu, menu, add
    Menu, Menu, Add, &Screenshots, #^+s
    Menu, Menu, Add, &mmignin, #^F4
    ; Menu, OneDrive, Add, &OneDrive, #^F5
    Menu, JasperSoft, Add, My &Reports, +#^F11
    Menu, JasperSoft, Add, COA &EXAMPLEs, +#^F10
    Menu, Menu, add, &JasperSoft, :JasperSoft
    Menu, OneDrive, Add, &CofA Team, #^F6
    Menu, OneDrive, Add, &LMS Team, #^F7
    Menu, Menu, add, &OneDrive, :OneDrive

    ; Menu, Menu, Add, &Workbook, !w
    Menu, LabelCopyFolder, Add, &Label Copy Foldier, #^F2
    Menu, LabelCopyFolder, Add, &All Label Copy, #^F3
    Menu, LabelCopyFolder, Add, &Sample Log, #^F5
    Menu, LabelCopyFolder, Add, &QC SAMPLE (1), #^F11
    Menu, LabelCopyFolder, Add, &QC SAMPLE (2), #^F12
    ; Menu, Menu, Add, &WorkSheets, Tests
    Menu, LabelCopyFolder, Add, &QC Appearance, #^F10
    Menu, LabelCopyFolder, Add, &Final Labels, #^F8
    Menu, LabelCopyFolder, Add, &FINAL C_O_A, #^F9
    Menu, LabelCopyFolder, Add, &Rotations, +#^F12
  Menu, Menu, add, &Label Copy, :LabelCopyFolder
    if winexist("Mats Workbook") && winactive("NuGenesis LMS - \\Remote"){
      Menu,Menu,add,				&Spec Table,						Tests
			Menu,Menu,add,				&Ingredient Table,			Tests
      }
  Try Menu,menu,show
  }



Remote_desktop(){
  global
  try This.delete()
      if winexist("Login - \\Remote"){
      Menu,Menu, add, &Production Server, LMS_Env
      Menu,Menu, add, &Test Server, LMS_Env
      }
    Menu, Menu, Add, TESTING LMS, Remote_desktop
    Menu, Menu, Add, PRD_Citrix_One, Remote_desktop
    Menu, Menu, Add, PRD_Citrix_Two, Remote_desktop
    Menu, Menu, Add, PRD_Citrix_Three, Remote_desktop
    Menu, Menu, Add, Other Servers, Remote_desktop
    Menu, SubMenu, Add, TEST_LMS, Remote_desktop
    Menu, SubMenu, Add, TEST_NuGen, Remote_desktop
    Menu, SubMenu, Add, TEST_SDMS, Remote_desktop
    Menu, SubMenu, Add, LMS_PRD, Remote_desktop
    Menu, SubMenu, Add, NuGenesis, Remote_desktop`
    Menu, SubMenu, Add, SDMS, Remote_desktop
    Menu, SubMenu, Add, PRD_EMPCitrix, Remote_desktop
    Menu, SubMenu, Add,empower, Remote_desktop
    Menu, SubMenu, Add,LACEs, Remote_desktop

    Menu, Menu, add, Other Servers, :SubMenu
    Menu, Menu, Add, &LMS Login, Passwords
    Menu, Menu, Add, &VQ Login, Passwords
    Menu, Menu, Add,&Kilgore, Passwords
  Try Menu,menu,show
  return
  Remote_Desktop:
    If (A_thisMenuItem = "TESTING LMS"){
      Sendinput,{Click 182, 97}10.1.2.153 ;{enter}
      ; winwaitactive, windows Security,,2
      ; if !errorlevel
      ; Sendinput, Kilgore7744 ;{enter}
      return
      }
    if (A_thisMenuItem = "TEST_LMS")
      Sendinput,{Click 182, 97}10.1.2.152 ;{enter}
    if (A_thisMenuItem = "TEST_NuGen")
      Sendinput,{Click 182, 97}10.1.2.150 ;{enter}
    if (A_thisMenuItem = "TEST_SDMS")
      Sendinput,{Click 182, 97}10.1.2.149 ;{enter}
    if (A_thisMenuItem = "PRD_Citrix_One")
      Sendinput,{Click 182, 97}10.1.2.134 ;{enter}
    if (A_thisMenuItem = "PRD_Citrix_Two")
      Sendinput,{Click 182, 97}10.1.2.226 ;{enter}
    if (A_thisMenuItem = "PRD_Citrix_Three")
      Sendinput,{Click 182, 97}10.1.2.227 ;{enter}
    if (A_thisMenuItem = "LMS_PRD")
      Sendinput,{Click 182, 97}10.1.2.138 ;{enter}
    if (A_thisMenuItem = "NuGenesis")
      Sendinput,{Click 182, 97}10.1.2.164 ;{enter}
    if (A_thisMenuItem = "SDMS")
      Sendinput,{Click 182, 97}10.1.2.142 ;{enter}
    if (A_thisMenuItem = "PRD_EMPCitrix")
      Sendinput,{Click 182, 97}10.1.2.242 ;{enter}
    if (A_thisMenuItem = "Empower")
      Sendinput,{Click 182, 97}10.1.2.228 ;{enter}
    if (A_thisMenuItem = "LACEs")
      Sendinput,{Click 182, 97}LACE-#{shiftdown}{left}{shiftup} ;{enter}
    else
      Try Menu,Menu, deleteAll
    return

  }


  Products(){
    global
      This.delete()
    If !winExist("Mats LMS Workbook.xlsb - Excel"){
      varbar.historymenuItem()
      return
    }
    menu,menu,add, [%Product%], ProductsList
    menu,menu,Disable,[%Product%]
    menu,menu,add
    loop % Products.maxindex(){
      temp:=Products[A_index]
      menu,menu,add, %temp%, ProductsList
    if (Products[a_index]=Product)
          menu,menu,Check, %temp%,
    }
    Try Menu,menu,show
    ProductsList:
    if !A_ThisMenuItem
      return
    try XL.activeworkbook.Worksheets(A_ThisMenuItem).activate
    excel.InfoLocations()
      ; Pop(Product,Batch " " lot)
    excel.MatchColor()
    return

    }
  Batches(){
      global
      Batches:=[]
      This.Delete()
      If !winExist("Mats LMS Workbook.xlsb - Excel"){
        varbar.historymenuItem()
        return
      }
      ListOfBatches:=XL.Range("H1").Value
      Batches:= StrSplit(ListOfBatches,"`n")
      Sleep 50
      loop % Batches.MaxIndex(){
        temp:=Batches[A_index]
        if (Batches[A_index]){
        menu,menu,add, %temp%, BatchesList
        if (Batches[a_index]=Batch) ;XL.Range("E1").Value)
          menu,menu,check, %temp%,
        }
      }
      Try Menu,menu,show

      return

  BatchesList:
    if !A_ThisMenuItem
      return
    excel.RegexCell(A_ThisMenuItem)
    XL.Range("E1").Value := A_ThisMenuItem
    	GuiControl, Varbar:Text, lot, %lot%
      GuiControl, Varbar:Text, Batch, %Batch%
      GuiControl, Varbar:Text, Coated, %coated%
    excel.MatchColor()
    return
    }
    SetStatus(){
      global
      Status:=["CoA","Specs","Reviewed","Samples","Completed"]
      This.Delete()
      loop % Status.MaxIndex(){
        temp:=Status[A_index]
        menu,menu,add, %temp%, SetStatusList
        if (Status[a_index]=XL.Range("B7").Value)
          menu,menu,check, %temp%,
      }
      Try Menu,menu,show

  SetStatusList:
    XL.Range("B7").Value := A_ThisMenuItem
    excel.MatchColor()
    	; GuiControl, Varbar:Text, lot, %lot%
      ; GuiControl, Varbar:Text, Batch, %Batch%
      ; GuiControl, Varbar:Text, Coated, %coated%
    return
    }
}
return

; ProductsList:
;   XL.activeworkbook.Worksheets(A_ThisMenuItem).activate
; return























;;      Extraactions:



   Heavy_metals:
    if (A_ThisMenuItem = "USP Heavy Metal")
    SpecTab.HM_USP()
   else if (A_ThisMenuItem = "Canada Heavy Metal")
    SpecTab.HM_Canada()
   else if (A_ThisMenuItem = "Prop65 Heavy Metal")
    SpecTab.HM_Prop65()
   else if (A_ThisMenuItem = "Report Only Heavy Metal")
    SpecTab.HM_ReportOnly()
   else
    Menu,Menu, deleteAll
   return



   Autofill:
    if A_thismenuitem contains &Analytical
      SpecTab.Edit_Analytical()
    else if A_thismenuitem contains &Coated_Retain
      SpecTab.Edit_CoatedRetain()
    else if A_thismenuitem contains &Coated_Physical
      SpecTab.Edit_CoatedPhysical()
    else if A_thismenuitem contains &Retain
      SpecTab.Edit_Retain()
    else if A_thismenuitem contains &Micro
      SpecTab.Edit_Micro() ; copyMicro spec tests
    else if A_thismenuitem contains &Physical
      SpecTab.Edit_Physical()
    else if A_thismenuitem contains Copy &Specs
      SpecTab.CopySpecs()
    else if A_thismenuitem contains Paste &Specs
      SpecTab.PasteSpecs()
    else if A_thismenuitem contains Copy &Template
      SpecTab.CopySpecTemplate()
    else if A_thismenuitem contains New &Request
      WorkTab.NewRequest()
    else if (A_ThisMenuItem = "&USP Heavy Metal")
      SpecTab.HM_USP()
    else if (A_ThisMenuItem = "&Canada Heavy Metal")
      SpecTab.HM_Canada()
    else if (A_ThisMenuItem = "&Prop65 Heavy Metal")
      SpecTab.HM_Prop65()
    else if (A_ThisMenuItem = "&Report Only Heavy Metal")
      SpecTab.HM_ReportOnly()
    else if (A_ThisMenuItem = "&Delete Retain")
      WorkTab.DeleteRetain()
    Menu,Menu, deleteAll
   return

Tests:
   if A_thismenuitem contains &Ingredient Table
    ProductTab.Table()
   else if A_thismenuItem contains &Spec Table
    SpecTab.Table()
   else if A_thismenuItem contains &Rotation Table
    Rotation_GetTable()
   else
    Menu,Menu, deleteAll
   return




   LMS_Env:
   IfwinExist, Login - \\Remote,
      winactivate, Login - \\Remote
    sleep 200
    Send,mmignin{tab}Kilgore7744
    if A_thismenuItem contains &Login
    Send,{enter}
   else if A_thismenuItem contains &Production Server
    SwitchEnv("Prd")
   else if A_thismenuItem contains &Test Server
    SwitchEnv("Test")
   else
    Menu,Menu, deleteall
   return




		; TT("Fixing Rotation",2000)




   SwitchEnv(ServerEnv){
    sleep 200
    Send,{Tab}{Tab}{down} ; winwaitactive, Change Configuration - \\Remote ahk_class Transparent windows Client
    sleep 200
    Send,{Home}{Right}{Right}{Right}{Right}{LShift down}{End}{End}{LShift up}%ServerEnv%{Tab}{Tab}{Tab}{Tab}{Enter}
    sleep 200 ; winwaitactive, Login - \\Remote ahk_class Transparent windows Client
    Send,{Enter}
  }



