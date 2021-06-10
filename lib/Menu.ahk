

class menu{

  show(){
    global
    menu,menu,show
  }
  Delete(){
    global
    try menu, menu, deleteAll
  }
  add(Item:="",group:="MenuHandle"){
    global
    menu,menu,add,%item%,%group%
  }

  LMS(){
    menu.delete()
    if winactive("NuGenesis LMS - \\Remote") {
      Menu, Menu, add, New &Request, AutoFill
      menu, menu, add, Copy Spec &Template, autofill
      menu, menu, add, &Copy Specs, Autofill 
      menu, menu, add, &Paste Specs, Autofill
    }
    if winactive("Edit specification - \\Remote") {
      Menu, Menu, add, &Analytical, AutoFill
      Menu, Menu, add, &Physical, AutoFill
      Menu, Menu, add, &Micro, AutoFill
      Menu, Menu, add, &Retain, AutoFill		
      Menu, Menu, add, &Coated_Physical, AutoFill
      Menu, Menu, add, &Coated_Retain, AutoFill
    }
    if winactive("Results Definition - \\Remote") {
      menu.add("&Spec Table","Tests")
      menu, menu, add
      Menu, Menu, Add, &USP Heavy Metal,Autofill
      Menu, Menu, Add, &Canada Heavy Metal,Autofill
      Menu, Menu, Add, &Prop65 Heavy Metal,Autofill
      Menu, Menu, Add, &Report Only Heavy Metal,Autofill
    }
  menu.show()
  }

Variable(){
  global
  menu, Menu, add, &Variables, Variable
  Menu, Variables, Add, &Product `t %Product%, Variable
  Menu, Variables, Add, &Batch `t %Batch%, Variable
  Menu, Variables, Add, &Lot `t %Lot%, Variable
  Menu, Variables, Add, &Name `t %name%, Variable
  Menu, Variables, Add, Cus&tomer `t %Customer%, Variable
  Menu, Variables, Add, C&oated `t %Coated%, Variable
  Menu, Variables, Add, &Color `t %Color%, Variable
  Menu, Variables, Add, &ShapeSize `t %ShapeSize%, Variable
  Menu, Variables, Add, &Weight `t %Weight%, Variable
  menu, menu, add, &Variables, :Variables
menu.show()
}
tests(){
      menu.delete()
  menu,Menu,add,Test_&1,Tests
  menu,Menu,add,Test_&2,Tests
  menu.show()
}

Tables(){
      menu.delete()
  menu,Menu,add,&Spec Table,Tests
  menu,Menu,add,&Ingredient Table,Tests
  menu,Menu,add,&Rotation Table,Tests
  menu.show()
  ; menu,menu,add
}

VScode(){
  global
  menu.delete()
  menu, Menu, Add, Search Hotkeys, vscode
  Menu, hotkeyMenu, Add, Xbutton1, vscode
  Menu, hotkeyMenu, Add, Numlock, vscode
  Menu, hotkeyMenu, Add, Xbutton3, vscode
  Menu, hotkeyMenu, Add, F15, vscode
  Menu, hotkeyMenu, Add, F6, vscode
  Menu, hotkeyMenu, Add, F7, vscode
  Menu, hotkeyMenu, Add, F8, vscode
  Menu, hotkeyMenu, Add, Mbutton, vscode
  Menu, hotkeyMenu, Add, Rbutton, vscode
  Menu, hotkeyMenu, Add, Wheel, vscode
  menu, Menu, add, Search Hotkeys, :HotkeyMenu
  Menu, menu, Add, &Mouse `t %MousePosition%, vscode
  Menu, menu, Add, &Title `t %WinTitle%, vscode
  Menu, menu, Add, &Process `t %WinProcess%, vscode
  Menu, menu, Add, &Control `t %WinControl%, vscode
menu.show()

}

passwords() {
  global
  menu.delete()
  menu, menu, add,
  Menu, Menu, Add, VQ Login, Passwords
  Menu, Menu, Add, Kilgore, Passwords
  menu.show()
}
LMS_Env(){
  menu.delete()
  menu, menu, add, &Login, LMS_Env
  menu, menu, add, &Production Server, LMS_Env
  menu, menu, add, &Test Server, LMS_Env
menu.show()
}

remote_desktop(){
menu.delete()
  Menu, Menu, Add, TESTING LMS, Remote_desktop
  Menu, Menu, Add, PRD_Citrix_One, Remote_desktop
  Menu, Menu, Add, PRD_Citrix_Two, Remote_desktop
  Menu, Menu, Add, PRD_Citrix_Three, Remote_desktop
  menu, Menu, Add, Other Servers, Remote_desktop
  Menu, SubMenu, Add, TEST_LMS, Remote_desktop
  Menu, SubMenu, Add, TEST_NuGen, Remote_desktop
  Menu, SubMenu, Add, TEST_SDMS, Remote_desktop
  Menu, SubMenu, Add, LMS_PRD, Remote_desktop
  Menu, SubMenu, Add, NuGenesis, Remote_desktop`
  Menu, SubMenu, Add, SDMS, Remote_desktop
  Menu, SubMenu, Add, PRD_EMPCitrix, Remote_desktop
  Menu, SubMenu, Add, Empower, Remote_desktop
  menu, Menu, add, Other Servers, :SubMenu
menu.show()
}

}

VScode:
  if (A_thismenuitem = "Xbutton1")
    Sendinput, ^{f}Xbutton1`:`:{Tab 6}{down 2}
    else if (A_thismenuitem = "Numlock")
      Sendinput, ^f_Psudo Numpad{Tab 6}{down 2}
    else if (A_thismenuitem = "Xbutton3")
      Sendinput, ^fXbutton3`:`:{Tab 6}{down 2}
      else if (A_thismenuitem = "F15")
        Sendinput, ^fF15`:`:{Tab 6}{down 2}
        else if (A_thismenuitem = "F6")
      Sendinput, ^fF6`:`:{Tab 6}{down 2}
        else if (A_thismenuitem = "F7")
      Sendinput, ^fF7`:`:{Tab 6}{down 2}
        else if (A_thismenuitem = "F19")
      Sendinput, ^fF19`:`:{Tab 6}{down 2}
        else if (A_thismenuitem = "F20")
      Sendinput, ^fF20`:`:{Tab 6}{down 2}
      else if (A_thismenuitem = "Mbutton")
        Sendinput, ^fMbutton{Tab 6}{down 2}
      else if (A_thismenuitem = "Rbutton")
        Sendinput, ^fRbutton{Tab 6}{down 2}
      else if (A_thismenuitem = "Wheel")
        Sendinput, ^fWheel{Tab 6}{down 2}
  else if A_thismenuItem contains &Mouse `t %MousePosition%
    sendinput, %MousePosition%
  else if A_thismenuItem contains &Title `t %WinTitle%
    Sendinput, %WinTitle%
  else if A_thismenuItem contains &Process `t %WinProcess%
    sendinput, ahk_exe %WinProcess%
  else if A_thismenuItem Contains &Control `t %WinControl%
    sendinput, %WinControl%
  else 
        menu, menu, deleteAll
      return

;notp

MenuHandle:
  if A_thismenuItem contains &TestItem
    msgbox, yo
return

Menu(n:=0){
  Global
  try menu, menu, deleteAll
  default()
  if winactive("Edit Formulation - \\Remote")
    Formulation_autofill()
  If Winactive("Password ahk_class bosa_sdm_XL9") 
    passwords()
  if Winactive("Login - \\Remote")
    LMS_Env()
  If Winactive("Edit sample template - \\Remote") || Winactive("Edit specification - \\Remote") || winactive("NuGenesis LMS - \\Remote")
    LMS_autofill()
  If winactive("Results Definition - \\Remote")
    Heavy_meatals()
  if WinActive("ahk_exe Code.exe")
    menu.VScode()
  If WinActive("Remote Desktop Connection") 
    remote_desktop()
  Menu, Menu, Show,
return
}

default(){
  global
  if Testing contains 1
    Tests()
  ; If Winactive("ahk_exe WFICA32.EXE"){
  ;     menu, Menu, add, &Variables, Variable
  ; Menu, Variables, Add, &Product `t %Product%, Variable
  ; Menu, Variables, Add, &Batch `t %Batch%, Variable
  ; Menu, Variables, Add, &Lot `t %Lot%, Variable
  ; Menu, Variables, Add, &Name `t %name%, Variable
  ; Menu, Variables, Add, Cus&tomer `t %Customer%, Variable
  ; Menu, Variables, Add, C&oated `t %Coated%, Variable
  ; Menu, Variables, Add, &Color `t %Color%, Variable
  ; Menu, Variables, Add, &ShapeSize `t %ShapeSize%, Variable
  ; Menu, Variables, Add, &Weight `t %Weight%, Variable
  ; menu, menu, add, &Variables, :Variables
  ;   Menu, Menu, Add,
  ; }
  If Winactive("NuGenesis LMS - \\Remote")
    Menu, Menu, add, New &Request, AutoFill
  if WinActive("ahk_exe explorer.exe") || Winactive("ahk_exe OUTLOOK.EXE")
  {
    menu, menu, add
    loop 5
      menu, menu, add, %a_index%, Variable
    ; menu, menu, add, Paste to Excel, Tables
    menu, menu, add
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
    try menu, menu, deleteAll
  menu, menu, deleteAll
return

}
Tests(){
  Global
  menu,Menu,add,Test_&1,Tests
  menu,Menu,add,Test_&2,Tests
  menu,Menu,add,&Ingredient Table,Tests
  menu,Menu,add,&Spec Table,Tests
  menu,Menu,add,&Rotation Table,Tests

  menu,menu,add
return

Tests:
  if A_thismenuItem contains Test_&1
    Test_1()
  else if A_thismenuItem contains Test_&2
    Test_2()
  else if A_thismenuitem contains &Ingredient Table
    ProductTab_Table()
  else if A_thismenuItem contains &Spec Table
    SpecTab_Table()
  else if A_thismenuItem contains &Rotation Table
    Rotation_GetTable()
  else 
    menu, menu, deleteAll
return

}

passwords() {
  global
  menu, menu, add,
  Menu, Menu, Add, VQ Login, Passwords
  Menu, Menu, Add, Kilgore, Passwords

  ; IfWinActive, [ WinTitle, WinText, ExcludeTitle, ExcludeText]
  ; {
  ; Menu, Menu, Add, Samples, Passwords
  ; Menu, Menu, Add, Tests, Passwords
  ; Menu, Menu, Add, Visual, Passwords
  ; }
  ;Menu, Menu, Show,
return

Passwords:
  if (A_ThisMenuItem = "Samples")
    sendinput, care{enter}
  else if (A_ThisMenuItem = "Tests")
    Sendinput, lab{enter}
  else if (A_ThisMenuItem = "Visual")
    Sendinput, open{enter}
  else if (A_ThisMenuItem = "VQ Login")
    Sendinput, ?Kilgore7744{enter}
  else if (A_ThisMenuItem = "Kilgore")
    Sendinput, Kilgore7744{enter}
  else 
    menu, menu, deleteAll
return
}		

Heavy_meatals(){
  Global
  Menu, Menu, Add, USP Heavy Metal,Heavy_metals
  Menu, Menu, Add, Canada Heavy Metal,Heavy_metals
  Menu, Menu, Add, Prop65 Heavy Metal,Heavy_metals
  Menu, Menu, Add, Report Only Heavy Metal,Heavy_metals
return
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
    menu, menu, deleteAll
return
}

Formulation_Autofill(){
  Global
  if winexist("Edit Formulation - \\Remote")
    menu, menu, add,
  Menu, Menu, add,1 scoop,Autofill
  Menu, Menu, add,2 scoops,Autofill
  Menu, Menu, add,3 scoops,Autofill
  Menu, Menu, add,4 scoops,Autofill
  Menu, Menu, add,5 scoops,Autofill
  Menu, Menu, add,6 scoops,Autofill
  Menu, Menu, add,1 stick,Autofill
  Menu, Menu, add,2 sticks,Autofill
return
}

LMS_autofill(){
  Global
  menu, menu, add,
  ;Excel.Connect()
  menu, menu, add, Copy Spec Template, autofill
  menu, menu, add,
  menu, menu, add, Copy Specs, Autofill 
  menu, menu, add, Paste Specs, Autofill
  if winactive("Edit specification - \\Remote") {
    Menu, Menu, add, Analytical, AutoFill
    Menu, Menu, add, Physical, AutoFill
    Menu, Menu, add, Micro, AutoFill
    Menu, Menu, add, Retain, AutoFill		
    Menu, Menu, add, Coated_Physical, AutoFill
    Menu, Menu, add, Coated_Retain, AutoFill
  }
  ;	Menu, Menu, Show,
  ;Excel.Connect()
return

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
    SpecTab_Edit_Micro() ; copy micro spec tests
  else if A_thismenuitem contains &Physical
    SpecTab_Edit_Physical() 
  else if A_thismenuitem contains &Copy Specs
    SpecTab_TestSpecs.Copy() 
  else if A_thismenuitem contains &Paste Specs
    SpecTab_TestSpecs.Paste()
  else if A_thismenuitem contains Copy Spec &Template
    SpecTab_CopySpecTemplate()
  else if A_thismenuitem contains New &Request
  {
    MouseGetPos, MX, MY, MWin,, 
    WorkTab.NewRequest()
    winwaitactive, NuGenesis LMS - \\Remote
    Click, MX, Y+25,
  }
  else if (A_ThisMenuItem = "&USP Heavy Metal")
    SpecTab_HM_USP()
  else if (A_ThisMenuItem = "&Canada Heavy Metal")
    SpecTab_HM_Canada()
  else if (A_ThisMenuItem = "&Prop65 Heavy Metal")
    SpecTab_HM_Prop65()
  else if (A_ThisMenuItem = "&Report Only Heavy Metal")
    SpecTab_HM_ReportOnly() 
  else if A_thismenuitem contains 1 scoop
    ProductTab_Scoops(1)
  else if A_thismenuitem contains 2 scoops
    ProductTab_Scoops(2,"two")
  else if A_thismenuitem contains 3 scoops
    ProductTab_Scoops(3,"three")
  else if A_thismenuitem contains 4 scoops
    ProductTab_Scoops(4,"four")
  else if A_thismenuitem contains 5 scoops
    ProductTab_Scoops(5,"five")
  else if A_thismenuitem contains 6 scoops
    ProductTab_Scoops(6,"six")
  else if A_thismenuitem contains 1 stick
    ProductTab_Scoops(1,,"stick packet")
  else if A_thismenuitem contains 2 sticks
    ProductTab_Scoops(2,"two","stick packet")
  else 
    menu, menu, deleteAll
return
}


          

            remote_desktop(){
              global
              menu, menu, add,	
              Menu, Menu, Add, TESTING LMS, Remote_desktop
              Menu, Menu, Add, PRD_Citrix_One, Remote_desktop
              Menu, Menu, Add, PRD_Citrix_Two, Remote_desktop
              Menu, Menu, Add, PRD_Citrix_Three, Remote_desktop
              menu, Menu, Add, Other Servers, Remote_desktop
              Menu, SubMenu, Add, TEST_LMS, Remote_desktop
              Menu, SubMenu, Add, TEST_NuGen, Remote_desktop
              Menu, SubMenu, Add, TEST_SDMS, Remote_desktop
              Menu, SubMenu, Add, LMS_PRD, Remote_desktop
              Menu, SubMenu, Add, NuGenesis, Remote_desktop`
              Menu, SubMenu, Add, SDMS, Remote_desktop
              Menu, SubMenu, Add, PRD_EMPCitrix, Remote_desktop
              Menu, SubMenu, Add, Empower, Remote_desktop
              menu, Menu, add, Other Servers, :SubMenu
              Passwords()

              return
              Remote_Desktop:
                If (A_thisMenuItem = "TESTING LMS") { 
                  sendinput, {Click 182, 97}10.1.2.153{enter}
                  winwaitactive, Windows Security,,1 
                  if !errorlevel
                    sendinput, Kilgore7744{enter}
                  return
                }
                Else if (A_thisMenuItem = "TEST_LMS") 
                  sendinput, {Click 182, 97}10.1.2.152{enter}
                Else if (A_thisMenuItem = "TEST_NuGen")
                  sendinput, {Click 182, 97}10.1.2.150{enter}
                Else if (A_thisMenuItem = "TEST_SDMS") 
                  sendinput, {Click 182, 97}10.1.2.149{enter}
                Else if (A_thisMenuItem = "PRD_Citrix_One") 
                  sendinput, {Click 182, 97}10.1.2.134{enter}
                Else if (A_thisMenuItem = "PRD_Citrix_Two") 
                  sendinput, {Click 182, 97}10.1.2.226{enter}
                Else if (A_thisMenuItem = "PRD_Citrix_Three") 
                  sendinput, {Click 182, 97}10.1.2.227{enter}
                Else if (A_thisMenuItem = "LMS_PRD") 
                  sendinput, {Click 182, 97}10.1.2.138{enter}
                Else if (A_thisMenuItem = "NuGenesis") 
                  sendinput, {Click 182, 97}10.1.2.164{enter}
                Else if (A_thisMenuItem = "SDMS") 
                  sendinput, {Click 182, 97}10.1.2.142{enter}
                Else if (A_thisMenuItem = "PRD_EMPCitrix") 
                  sendinput, {Click 182, 97}10.1.2.242{enter}
                Else if (A_thisMenuItem = "Empower") 
                  sendinput, {Click 182, 97}10.1.2.228{enter}
                else 
                  menu, menu, deleteAll
              return
            }
            LMS_Env(){
              Global
              try menu, menu, deleteAll
              menu, menu, add, 
              menu, menu, add, &Login, LMS_Env
              menu, menu, add, &Production Server, LMS_Env
              menu, menu, add, &Test Server, LMS_Env
              menu, menu, add, 
              return
              LMS_Env:
                sleep 200
                Send, mmignin{tab}Kilgore7744
                if A_thismenuItem contains &Login 
                  send, {enter}
                else if A_thismenuItem contains &Production Server
                  SwitchEnv("Prd")
                else if A_thismenuItem contains &Test Server
                  SwitchEnv("Test")
                else
                  menu, menu, deleteall
              return
            }

            SwitchEnv(ServerEnv){
              sleep 200
              Send, {Tab}{Tab}{Down} ; WinwaitActive, Change Configuration - \\Remote ahk_class Transparent Windows Client
              sleep 200
              Send, {Home}{Right}{Right}{Right}{Right}{LShift Down}{End}{End}{LShift Up}%ServerEnv%{Tab}{Tab}{Tab}{Tab}{Enter}
              sleep 200 ; WinwaitActive, Login - \\Remote ahk_class Transparent Windows Client
              Send, {Enter}
              return
            }

