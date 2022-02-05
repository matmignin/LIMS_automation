
; return
; ExitMenu:
; Menu,Menu, deleteAll
return
;#include *i D:\VQuest\lib\clip.ahk

class Menu{

    Delete(){
    global
    try Menu,Menu, deleteAll
    }

    add(Item:="",group:="MenuHandle"){
    global
    Menu,menu,add,%item%,%group%
    }











    }

  passwords(){
    global
    Menu,Menu, deleteAll
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


  Apps(){
  global
  try Menu,Menu, deleteAll
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
  try Menu,Menu, deleteAll
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
  Try Menu,menu,show
  }



Remote_desktop(){
  global
  try Menu,Menu, deleteAll
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
return

; ProductsList:
;   XL.activeworkbook.Worksheets(A_ThisMenuItem).activate
; return













ExitMenu:
Menu,Menu, deleteAll
return









;;      Extraactions:




