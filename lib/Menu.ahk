
; return
; ExitMenu:
; Menu,Menu, deleteAll
return
;#include *i C:\Users\mmignin\Documents\VQuest\lib\clip.ahk

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



return

; ProductsList:
;   XL.activeworkbook.Worksheets(A_ThisMenuItem).activate
; return













ExitMenu:
Menu,Menu, deleteAll
return









;;      Extraactions:




