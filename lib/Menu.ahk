
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
      Menu, Menu, add, All &Products,   F19 & left
      Menu, Menu, add, All &Batches,    F19 & down
      Menu, Menu, add, All &WorkSheets, F19 & up
      Menu, Menu, add, %Product%, F20 & left
      Menu, Menu, add, %Batch%, F20 & down
      Menu, Menu, add, %Lot%, F20 & right
      Menu, Menu, Show
      KeyWait, Rbutton, U
        try Menu,Menu, deleteAll
        
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
		try Menu,Menu, deleteAll
     Products:=[]
        FileRead, LoadedNotes, data\CurrentCodes.txt
        Products := StrSplit(LoadedNotes,"`r`n")
		Loop % Products.MaxIndex(){ ; Read, debug.txt
      temp:=Products[a_index]
        Menu, Menu, Add, %temp%, SelectProducts
    }
    GuiControl,Varbar:Text, Product, %Product%
    GuiControl,Varbar:Text, Batch, %Batch%
    GuiControl,Varbar:Text, lot, %lot%
    GuiControl,Varbar:Text, Coated, %Coated%
    if product
      selectedItem:= product 
    if Batch
      selectedItem.= " " Batch
    if lot
      selectedItem.= " " lot
    if Coated
      selectedItem.= " Ct#" Coated
    try menu,menu,default, %selectedItem%
    ;  try menu,menu,default, %product%
		try Menu, Menu, Show
    return

    SelectProducts:
    RegExMatch(A_ThisMenuItem, "i)(?<Product>([abdefghijkl]\d{3})?).?(?<Batch>(\d{3}-\d{4})?).?(?<Lot>(\d{4}\w\d\w?|Bulk|G\d{7}\w?)?).?(Ct#)?(?<Coated>(\d{3}-\d{4})?)", s)
    if sProduct {
      Product:=sProduct
      GuiControl,Varbar:Text, Product, %sProduct%
    }
    Batch:=sBatch
    lot:=slot
    Coated:=sCoated
    n:=A_ThisMenuItemPos
    GuiControl,Varbar:Text, Batch, %sBatch%
    GuiControl,Varbar:Text, lot, %slot%
    GuiControl,Varbar:Text, Coated, %sCoated%
    try XL.Sheets(sProduct).activate
  ; clipboard:=A_ThismenuItem
; varbar.show()
  ;  Pop(A_ThisMenuItem,,3000)
    return
    }
    
    
    VsCode(){
    global
		try Menu,Menu, deleteAll
    if WinActive("ahk_exe Code.exe")
      Menu, Menu, add, &LMS Title, InputToVsCode
    Menu, Menu, add, Window Title, InputToVsCode
    Menu, Menu, add, Window Process, InputToVsCode
    Menu, Menu, add, Click Position, InputToVsCode
    Menu, Menu, add, Mouse Position, InputToVsCode
    Menu, Menu, add, Window Location, InputToVsCode
    try Menu, Menu, Show
    return
    
    InputToVSCode:
    if A_thismenuItem contains &LMS Title  
    {
      winactivate, ahk_exe WFICA32.EXE
      windowInfo()
      winactivate, ahk_exe Code.exe
      send % Wintitle
      return
    }
    else 
    pop("find window and click Mbutton")
    KeyWait, Space, d
    WindowInfo()
    winactivate, ahk_exe Code.exe
    sleep 200
    if A_thismenuItem contains Window Title
      send % Wintitle
    else if A_thismenuItem contains Window Process
      send % Process
    else if A_thismenuItem contains Click Position
      send % "{click " MousePosition "}"
    else if A_thismenuItem contains Mouse Position
      send % MousePosition
    else if A_thismenuItem contains Window Location
      send % WinLocation
    ; sendinput, %A_thismenuItem%
    try Menu,Menu, deleteAll
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
      Menu, Menu, add, Paste All &Products,   F19 & Down
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
  if Winactive("Login - \\Remote"){
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
      Menu, Menu, Add, VQ Login, Passwords
      Menu, Menu, Add, Kilgore, Passwords
    Try Menu,menu,show
    return
  Passwords:
    if (A_ThisMenuItem = "Samples")
    SendInput, care{enter}
   else if (A_ThisMenuItem = "Tests")
    SendInput, lab{enter}
   else if (A_ThisMenuItem = "Visual")
    SendInput, open{enter}
   else if (A_ThisMenuItem = "&VQ Login")
    SendInput, +Kilgore7744{enter}
   else if (A_ThisMenuItem = "+Kilgore")
    SendInput, Kilgore7744{enter}
   else if (A_ThisMenuItem = "&LMS Login")
    SendInput,Mmignin{tab}Kilgore7744{enter}
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
    Menu, Menu, Add, &SwitchWorkSheets , SwitchWorkSheets 
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
    if Winexist("Login - \\Remote"){
      Menu,Menu, add, &Production Server, LMS_Env
      Menu,Menu, add, &Test Server, LMS_Env
      }
  Try Menu,menu,show
  }

TaskBar(){
  global
  try This.delete()
    ; Menu, Menu, Add, &SwitchWorkSheets , SwitchWorkSheets 
    Menu, Menu, Add, &Downloads , #^F1
    Menu, Menu, Add, &VQuest , #^v 
    menu, menu, add
    Menu, Menu, Add, &Screenshots, #^+s
    Menu, Menu, Add, &mmignin, #^F4
    ; Menu, OneDrive, Add, &OneDrive, #^F5
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
    Menu, LabelCopyFolder, Add, &Final C_O_A, #^F9
  Menu, Menu, add, &Label Copy, :LabelCopyFolder
    if Winexist("Mats Workbook") && WinActive("NuGenesis LMS - \\Remote"){
      Menu,Menu,add,				&Spec Table,						Tests
			Menu,Menu,add,				&Ingredient Table,			Tests
      }
  Try Menu,menu,show
  }



Remote_desktop(){
  global
  try This.delete()
      if Winexist("Login - \\Remote"){
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
    Menu, Menu, add, Other Servers, :SubMenu
    Menu, Menu, Add, &LMS Login, Passwords
    Menu, Menu, Add, &VQ Login, Passwords
    Menu, Menu, Add,&Kilgore, Passwords
  Try Menu,menu,show
  return
  Remote_Desktop:
    If (A_thisMenuItem = "TESTING LMS"){
      SendInput,{Click 182, 97}10.1.2.153 ;{enter}
      ; winwaitactive, Windows Security,,2
      ; if !errorlevel
      ; SendInput, Kilgore7744 ;{enter}
      return
      }
    if (A_thisMenuItem = "TEST_LMS")
      SendInput,{Click 182, 97}10.1.2.152 ;{enter}
    if (A_thisMenuItem = "TEST_NuGen")
      SendInput,{Click 182, 97}10.1.2.150 ;{enter}
    if (A_thisMenuItem = "TEST_SDMS")
      SendInput,{Click 182, 97}10.1.2.149 ;{enter}
    if (A_thisMenuItem = "PRD_Citrix_One")
      SendInput,{Click 182, 97}10.1.2.134 ;{enter}
    if (A_thisMenuItem = "PRD_Citrix_Two")
      SendInput,{Click 182, 97}10.1.2.226 ;{enter}
    if (A_thisMenuItem = "PRD_Citrix_Three")
      SendInput,{Click 182, 97}10.1.2.227 ;{enter}
    if (A_thisMenuItem = "LMS_PRD")
      SendInput,{Click 182, 97}10.1.2.138 ;{enter}
    if (A_thisMenuItem = "NuGenesis")
      SendInput,{Click 182, 97}10.1.2.164 ;{enter}
    if (A_thisMenuItem = "SDMS")
      SendInput,{Click 182, 97}10.1.2.142 ;{enter}
    if (A_thisMenuItem = "PRD_EMPCitrix")
      SendInput,{Click 182, 97}10.1.2.242 ;{enter}
    if (A_thisMenuItem = "Empower")
      SendInput,{Click 182, 97}10.1.2.228 ;{enter}
    else
      Try Menu,Menu, deleteAll
    return

  }

  
  Products(){
    global
      This.delete()
    If !WinExist("Mats LMS Workbook.xlsb - Excel"){
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
    try XL.activeworkbook.Worksheets(A_ThisMenuItem).Activate
    excel.InfoLocations()
      ; Pop(Product,Batch " " lot)
    excel.MatchColor()
    return

    }
  Batches(){
      global
      Batches:=[]
      This.Delete()
      If !WinExist("Mats LMS Workbook.xlsb - Excel"){
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
      Menu,menu,show

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
;   XL.activeworkbook.Worksheets(A_ThisMenuItem).Activate
; return























;;      ExtraActions:



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
   IfWinExist, Login - \\Remote, 
      WinActivate, Login - \\Remote
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
    Send,{Tab}{Tab}{Down} ; WinwaitActive, Change Configuration - \\Remote ahk_class Transparent Windows Client
    sleep 200
    Send,{Home}{Right}{Right}{Right}{Right}{LShift Down}{End}{End}{LShift Up}%ServerEnv%{Tab}{Tab}{Tab}{Tab}{Enter}
    sleep 200 ; WinwaitActive, Login - \\Remote ahk_class Transparent Windows Client
    Send,{Enter}
  }



