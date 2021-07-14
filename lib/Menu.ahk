
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
  
  LMS(){
  Global
  try Menu.delete()
  if winactive("NuGenesis LMS - \\Remote"){
  LMS.DetectTab()
  if (Tab="Samples")
    Menu, Menu, add, New &Request, AutoFill
  if (Tab="Specs") {
      Menu,Menu, add, Copy &Template, autofill
    If CopyPasteToggle=1
      Menu,Menu, add, Paste &Specs, Autofill
    If CopyPasteToggle=0
      Menu,Menu, add, Copy &Specs, Autofill
  }
  if (Tab="Tests")
    Menu,Menu, add, &Delete Retain, Autofill
    
  Menu.show()
  }
  
  if winactive("Edit specification - \\Remote"){
    Menu, Menu, add, &Analytical, AutoFill
    Menu, Menu, add, &Physical, AutoFill
    Menu, Menu, add, &Micro, AutoFill
    Menu, Menu, add, &Retain, AutoFill
    Menu, Menu, add, &Coated_Physical, AutoFill
    Menu, Menu, add, &Coated_Retain, AutoFill
  Menu.show()
  }
  if winactive("Results Definition - \\Remote") || winactive("Composition - \\Remote"){
    ; Menu.add("&Spec Table","Tests")
    Menu,Menu, add
    Menu, Menu, Add, &USP Heavy Metal,Autofill
    Menu, Menu, Add, &Canada Heavy Metal,Autofill
    Menu, Menu, Add, &Prop65 Heavy Metal,Autofill
    Menu, Menu, Add, &Report Only Heavy Metal,Autofill
  Menu.show()
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
  Menu.show()
  }
  if Winactive("Login - \\Remote"){
    ; Menu,Menu, add, &Login, LMS_Env
    Menu,Menu, add, &Production Server, LMS_Env
    Menu,Menu, add, &Test Server, LMS_Env
  Menu.show()
  }
  else
    return
  }
  
  
  Variable(){
  global
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
  Menu.show()
  }
  Tables(){
  try
  Menu.delete()
  Menu,Menu,add,&Spec Table,Tests
  Menu,Menu,add,&Ingredient Table,Tests
  ;menu,Menu,add,&Rotation Table,Tests
  Menu.show()
  ;Menu,menu,add
  }
  passwords(){
  global
  Menu.delete()
    Menu, Menu, Add, VQ Login, Passwords
    Menu, Menu, Add, Kilgore, Passwords
  Menu.show()
  }
  Remote_desktop(){
  global
  try
  Menu.delete()
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
  Menu.show()
  return
  }
}
return



   Variable:
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


   Passwords:
    if (A_ThisMenuItem = "Samples")
    sendinput, care{enter}
   else if (A_ThisMenuItem = "Tests")
    Sendinput, lab{enter}
   else if (A_ThisMenuItem = "Visual")
    Sendinput, open{enter}
   else if (A_ThisMenuItem = "&VQ Login")
    Sendinput, ?Kilgore7744{enter}
   else if (A_ThisMenuItem = "&Kilgore")
    Sendinput, Kilgore7744{enter}
   else if (A_ThisMenuItem = "&LMS Login")
    Sendinput,Mmignin{tab}Kilgore7744{enter}
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

Remote_Desktop:
    If (A_thisMenuItem = "TESTING LMS"){
      sendinput,{Click 182, 97}10.1.2.153{enter}
      winwaitactive, Windows Security,,2
      if !errorlevel
      sendinput, Kilgore7744{enter}
      return
      }
    if (A_thisMenuItem = "TEST_LMS")
      sendinput,{Click 182, 97}10.1.2.152{enter}
    if (A_thisMenuItem = "TEST_NuGen")
      sendinput,{Click 182, 97}10.1.2.150{enter}
    if (A_thisMenuItem = "TEST_SDMS")
      sendinput,{Click 182, 97}10.1.2.149{enter}
    if (A_thisMenuItem = "PRD_Citrix_One")
      sendinput,{Click 182, 97}10.1.2.134{enter}
    if (A_thisMenuItem = "PRD_Citrix_Two")
      sendinput,{Click 182, 97}10.1.2.226{enter}
    if (A_thisMenuItem = "PRD_Citrix_Three")
      sendinput,{Click 182, 97}10.1.2.227{enter}
    if (A_thisMenuItem = "LMS_PRD")
      sendinput,{Click 182, 97}10.1.2.138{enter}
    if (A_thisMenuItem = "NuGenesis")
      sendinput,{Click 182, 97}10.1.2.164{enter}
    if (A_thisMenuItem = "SDMS")
      sendinput,{Click 182, 97}10.1.2.142{enter}
    if (A_thisMenuItem = "PRD_EMPCitrix")
      sendinput,{Click 182, 97}10.1.2.242{enter}
    if (A_thisMenuItem = "Empower")
      sendinput,{Click 182, 97}10.1.2.228{enter}
    else
      Try Menu,Menu, deleteAll
    return
    
    

   LMS_Env:
    sleep 200
    Send,mmignin{tab}Kilgore7744
    if A_thismenuItem contains &Login
    send,{enter}
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



