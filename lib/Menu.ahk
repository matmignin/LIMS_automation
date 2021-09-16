
return
class Menu{

    show(){
    global
    Try Menu,menu,show
    }
    
    Delete(){
    global
    try Menu,Menu, deleteAll
    }
    
    add(Item:="",group:="MenuHandle"){
    global
    Menu,menu,add,%item%,%group%
    }
    
    ProductHistory(){
    global
		try Menu,Menu, deleteAll
		Loop, Read, Products.txt
			Menu, Menu, Add, %A_LoopReadLine%, ProductHistory
		Menu, Menu, Show
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
    else if (Tab="Requests")
      clk(61, 635) ;enter results
    else if (Tab="Products")
      clk(67, 754) ;edit results
    else if (Tab="Samples")
        clk(107, 319) ;assign Requests
    else {
      Menu,Menu, add, &Production Server, LMS_Env
      Menu,Menu, add, &Test Server, LMS_Env
    }
    This.show()
  } 
  if winactive("Edit specification - \\Remote"){
    Menu, Menu, add, &Analytical, AutoFill
    Menu, Menu, add, &Physical, AutoFill
    Menu, Menu, add, &Micro, AutoFill
    Menu, Menu, add, &Retain, AutoFill
    Menu, Menu, add, &Coated_Physical, AutoFill
    Menu, Menu, add, &Coated_Retain, AutoFill
  This.show()
  }
  if winactive("Results Definition - \\Remote") || winactive("Composition - \\Remote"){
    ; This.add("&Spec Table","Tests")
    Menu,Menu, add
    Menu, Menu, Add, &USP Heavy Metal,Autofill
    Menu, Menu, Add, &Canada Heavy Metal,Autofill
    Menu, Menu, Add, &Prop65 Heavy Metal,Autofill
    Menu, Menu, Add, &Report Only Heavy Metal,Autofill
  This.show()
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
  This.show()
  return
  }
  if Winactive("Login - \\Remote"){
    Menu,Menu, add, &Login, LMS_Env
    Menu,Menu, add, &Production Server, LMS_Env
    Menu,Menu, add, &Test Server, LMS_Env
  This.show()
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
    This.show()
    }
    Tables(){
    try
    This.delete()
    Menu,Menu,add,&Spec Table,Tests
    Menu,Menu,add,&Ingredient Table,Tests
    ;menu,Menu,add,&Rotation Table,Tests
    This.show()
    ;Menu,menu,add
    }
    passwords(){
    global
    This.delete()
      Menu,Menu, add, &Production Server, LMS_Env
      Menu,Menu, add, &Test Server, LMS_Env
      Menu, Menu, Add, VQ Login, Passwords
      Menu, Menu, Add, Kilgore, Passwords
    This.show()
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
  This.show()
  }

Varbar(){
  global
	   MouseGetPos,,,,WinControl
  try This.delete()
/* 		;this was code that read a text file and of previous Concated Codes, then made it into a menu
  if (WinControl="Edit1" || WinControl="Edit2" || winControl="Edit3"){
      		Loop, Read, Products.txt
			Menu, Menu, Add, %A_LoopReadLine%, Varbar.HistoryMenuItem
      if (A_index > 5)
        return
    }
    else {
    menu, Menu, Add, ProductsMenu, Varbar.HistoryMenuItem
		Loop, Read, Products.txt
    {
			Menu, ProductsMenu, Add, %A_LoopReadLine%, Varbar.HistoryMenuItem
      if A_index>5
        return
    } 
    */
    Menu, Menu, Add, &SwitchWorkSheets , SwitchWorkSheets 
      if SwitchWorkSheets=1  
        menu, menu, Check, &SwitchWorkSheets
        
    Menu, Menu, Add, &ShowNotes, ShowNotes 
      ; if ShowNotes=1  
        ; menu, menu, Check, &ShowNotes
        
    Menu, Menu, Add, Show&SampleID, ShowSampleID 
      if ShowSampleID=1  
        menu, menu, Check, Show&SampleID
        
    Menu, Menu, Add, Show&Coated, ShowCoated 
      if ShowCoated=1  
        menu, menu, Check, Show&Coated
    Menu, SubMenu, Add, &workBook, !w 
    Menu, SubMenu, Add, &Test Log, F2 
    Menu, SubMenu, Add, &Sample Log, +F2 
    Menu, SubMenu, Add, &Product Checklist, F3 
    Menu, SubMenu, Add, &All Label Copy, F4 
  Menu, Menu, add, &WorkSeehts, :SubMenu
    if Winexist("Login - \\Remote"){
      Menu,Menu, add, &Production Server, LMS_Env
      Menu,Menu, add, &Test Server, LMS_Env
      }
          Menu,Menu,add,&Spec Table,Tests
    Menu,Menu,add,&Ingredient Table,Tests
  ; Menu, Menu, add, &Notes, Notes.Show
    ; }
  This.show()
  }

Remote_desktop(){
  global
  try
  This.delete()
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
  This.show()
  return
  }
}
return



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



  Passwords:
    if (A_ThisMenuItem = "Samples")
    SendInput, care{enter}
   else if (A_ThisMenuItem = "Tests")
    SendInput, lab{enter}
   else if (A_ThisMenuItem = "Visual")
    SendInput, open{enter}
   else if (A_ThisMenuItem = "&VQ Login")
    SendInput, ?Kilgore7744{enter}
   else if (A_ThisMenuItem = "&Kilgore")
    SendInput, Kilgore7744{enter}
   else if (A_ThisMenuItem = "&LMS Login")
    SendInput,Mmignin{tab}Kilgore7744{enter}
   else
    Menu,Menu, deleteAll
   return

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
Remote_Desktop:
    If (A_thisMenuItem = "TESTING LMS"){
      SendInput,{Click 182, 97}10.1.2.153{enter}
      winwaitactive, Windows Security,,2
      if !errorlevel
      SendInput, Kilgore7744{enter}
      return
      }
    if (A_thisMenuItem = "TEST_LMS")
      SendInput,{Click 182, 97}10.1.2.152{enter}
    if (A_thisMenuItem = "TEST_NuGen")
      SendInput,{Click 182, 97}10.1.2.150{enter}
    if (A_thisMenuItem = "TEST_SDMS")
      SendInput,{Click 182, 97}10.1.2.149{enter}
    if (A_thisMenuItem = "PRD_Citrix_One")
      SendInput,{Click 182, 97}10.1.2.134{enter}
    if (A_thisMenuItem = "PRD_Citrix_Two")
      SendInput,{Click 182, 97}10.1.2.226{enter}
    if (A_thisMenuItem = "PRD_Citrix_Three")
      SendInput,{Click 182, 97}10.1.2.227{enter}
    if (A_thisMenuItem = "LMS_PRD")
      SendInput,{Click 182, 97}10.1.2.138{enter}
    if (A_thisMenuItem = "NuGenesis")
      SendInput,{Click 182, 97}10.1.2.164{enter}
    if (A_thisMenuItem = "SDMS")
      SendInput,{Click 182, 97}10.1.2.142{enter}
    if (A_thisMenuItem = "PRD_EMPCitrix")
      SendInput,{Click 182, 97}10.1.2.242{enter}
    if (A_thisMenuItem = "Empower")
      SendInput,{Click 182, 97}10.1.2.228{enter}
    else
      Try Menu,Menu, deleteAll
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

   SwitchEnv(ServerEnv){
    sleep 200
    Send,{Tab}{Tab}{Down} ; WinwaitActive, Change Configuration - \\Remote ahk_class Transparent Windows Client
    sleep 200
    Send,{Home}{Right}{Right}{Right}{Right}{LShift Down}{End}{End}{LShift Up}%ServerEnv%{Tab}{Tab}{Tab}{Tab}{Enter}
    sleep 200 ; WinwaitActive, Login - \\Remote ahk_class Transparent Windows Client
    Send,{Enter}
  }



