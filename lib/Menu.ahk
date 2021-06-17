class Menu{

show(){
 global
Menu,menu,show
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
 Menu.delete()
 if winactive("NuGenesis LMS - \\Remote"){
  Menu, Menu, add, New &Request, AutoFill
  Menu,Menu, add, Copy &Template, autofill
 If CopyPasteToggle=1
  Menu,Menu, add, Paste &Specs, Autofill
 If CopyPasteToggle=0
  Menu,Menu, add, Copy &Specs, Autofill
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
 Menu.add("&Spec Table","Tests")
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
  Menu,Menu, add, &Login, LMS_Env
  Menu,Menu, add, &Production Server, LMS_Env
  Menu,Menu, add, &Test Server, LMS_Env
 Menu.show()
 }
 else
  return

 }

Variable(){
 global
Menu, Menu, add, &Variables, Variable
  Menu, Variables, Add, &Product `t %Product%, Variable
  Menu, Variables, Add, &Batch `t %Batch%, Variable
  Menu, Variables, Add, &Lot `t %Lot%, Variable
  Menu, Variables, Add, &Name `t %name%, Variable
  Menu, Variables, Add, Cus&tomer `t %Customer%, Variable
  Menu, Variables, Add, C&oated `t %Coated%, Variable
  Menu, Variables, Add, &Color `t %Color%, Variable
  Menu, Variables, Add, &ShapeSize `t %ShapeSize%, Variable
  Menu, Variables, Add, &Weight `t %Weight%, Variable
Menu,Menu, add, &Variables, :Variables
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
 }
}
return



   Variable:
    if A_thismenuItem contains &Product `t %Product%,
    Sendinput % Product
   else if A_thismenuItem contains &Batch `t %Batch%
    sendinput % Batch
   else if A_thismenuItem contains &name `t %name%
    sendinput % Name
   else if A_thismenuItem contains &lot `t %Lot%
    sendinput % Lot
   else if A_thismenuItem contains C&oated `t %Coated%
    Clip("Coated")
   else if A_thismenuItem contains Cus&tomer `t %Customer%
    sendinput % Customer
   else if A_thismenuItem contains &Color `t %Color%
    sendinput % Color
   else if A_thismenuItem contains &ShapeSize `t %ShapeSize%
    sendinput % shapesize
   else if A_thismenuItem contains &Weight `t %Weight%
    sendinput % Weight
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
    ProductTab_Table()
   else if A_thismenuItem contains &Spec Table
    SpecTab_Table()
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

  ; Heavy_meatals(){
   ; Global
    ; Menu, Menu, Add, USP Heavy Metal,Heavy_metals
    ; Menu, Menu, Add, Canada Heavy Metal,Heavy_metals
    ; Menu, Menu, Add, Prop65 Heavy Metal,Heavy_metals
    ; Menu, Menu, Add, Report Only Heavy Metal,Heavy_metals
   ; return
   Heavy_metals:
    if (A_ThisMenuItem = "USP Heavy Metal")
    SpecTab_HM_USP()
   else if (A_ThisMenuItem = "Canada Heavy Metal")
    SpecTab_HM_Canada()
   else if (A_ThisMenuItem = "Prop65 Heavy Metal")
    SpecTab_HM_Prop65()
   else if (A_ThisMenuItem = "Report Only Heavy Metal")
    SpecTab_HM_ReportOnly()
   else
    Menu,Menu, deleteAll
   return

  ; LMS_autofill(){
   ; Global
   ; Menu,Menu, add,
   ; ;Excel.Connect()
   ; Menu,Menu, add, Copy Spec Template, autofill
   ; Menu,Menu, add,
   ; Menu,Menu, add, Copy Specs, Autofill
   ; Menu,Menu, add, Paste Specs, Autofill
   ; if winactive("Edit specification - \\Remote"){
    ; Menu,Menu, add, Departments, Autofill
    ;  Menu, DepartmentsMenu, add, Analytical, AutoFill
    ;  Menu, DepartmentsMenu, add, Physical, AutoFill
    ;  Menu, DepartmentsMenu, add, Micro, AutoFill
    ;  Menu, DepartmentsMenu, add, Retain, AutoFill
    ;  Menu, DepartmentsMenu, add, Coated_Physical, AutoFill
    ;  Menu, DepartmentsMenu, add, Coated_Retain, AutoFill
    ; Menu,Menu, add, departments, :DepartmentsMenu
   ; }
   ;	Menu, Menu, Show,
   ;Excel.Connect()


   Autofill:
    if A_thismenuitem contains &Analytical
    SpecTab_Edit_Analytical()
   else if A_thismenuitem contains &Coated_Retain
    SpecTab_Edit_CoatedRetain()
   else if A_thismenuitem contains &Coated_Physical
    SpecTab_Edit_CoatedPhysical()
   else if A_thismenuitem contains &Retain
    SpecTab_Edit_Retain()
   else if A_thismenuitem contains &Micro
    SpecTab_Edit_Micro() ; copyMicro spec tests
   else if A_thismenuitem contains &Physical
    SpecTab_Edit_Physical()
   else if A_thismenuitem contains Copy &Specs
    SpecTab_TestSpecs.Copy()
   else if A_thismenuitem contains Paste &Specs
    SpecTab_TestSpecs.Paste()
   else if A_thismenuitem contains Copy &Template
    SpecTab_CopySpecTemplate()
   else if A_thismenuitem contains New &Request
    {
  ;  MouseGetPos, MX, MY, MWin,,
    WorkTab.NewRequest()
    ; winwaitactive, NuGenesis LMS - \\Remote
    ; Click, MX, Y+25,
    }
   else if (A_ThisMenuItem = "&USP Heavy Metal")
    SpecTab_HM_USP()
   else if (A_ThisMenuItem = "&Canada Heavy Metal")
    SpecTab_HM_Canada()
   else if (A_ThisMenuItem = "&Prop65 Heavy Metal")
    SpecTab_HM_Prop65()
   else if (A_ThisMenuItem = "&Report Only Heavy Metal")
    SpecTab_HM_ReportOnly()
    Menu,Menu, deleteAll
   return

   Remote_Desktop:
    If (A_thisMenuItem = "TESTING LMS"){
    sendinput,{Click 182, 97}10.1.2.153{enter}
    winwaitactive, Windows Security,,1
    if !errorlevel
    sendinput, Kilgore7744{enter}
    ; return
   else if (A_thisMenuItem = "TEST_LMS")
    sendinput,{Click 182, 97}10.1.2.152{enter}
   else if (A_thisMenuItem = "TEST_NuGen")
    sendinput,{Click 182, 97}10.1.2.150{enter}
   else if (A_thisMenuItem = "TEST_SDMS")
    sendinput,{Click 182, 97}10.1.2.149{enter}
   else if (A_thisMenuItem = "PRD_Citrix_One")
    sendinput,{Click 182, 97}10.1.2.134{enter}
   else if (A_thisMenuItem = "PRD_Citrix_Two")
    sendinput,{Click 182, 97}10.1.2.226{enter}
   else if (A_thisMenuItem = "PRD_Citrix_Three")
    sendinput,{Click 182, 97}10.1.2.227{enter}
   else if (A_thisMenuItem = "LMS_PRD")
    sendinput,{Click 182, 97}10.1.2.138{enter}
   else if (A_thisMenuItem = "NuGenesis")
    sendinput,{Click 182, 97}10.1.2.164{enter}
   else if (A_thisMenuItem = "SDMS")
    sendinput,{Click 182, 97}10.1.2.142{enter}
   else if (A_thisMenuItem = "PRD_EMPCitrix")
    sendinput,{Click 182, 97}10.1.2.242{enter}
   else if (A_thisMenuItem = "Empower")
    sendinput,{Click 182, 97}10.1.2.228{enter}
   else
    Menu,Menu, deleteAll
    return
    }

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

