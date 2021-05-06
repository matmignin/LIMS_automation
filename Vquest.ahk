gosub, vquest_start
  customer:=[]
return
  
Ingredients() {
  global
    IniRead,vSelect, Ingredients.ini, Ingredients, %vIngredient%
    ; Loop, Read, Ingredients.ini
  ; {
    ; If A_Index = 1
      ; Continue
    ; Ingredients := StrSplit(A_LoopReadLine, "=") 
    ; Selection:= % Ingredient[1]
    ; Menu, Ingredientmenu, add, %Selection%, Ingredients
  ; }
    msgbox % vSelect
  ConvertIngredientSelection(vSelect)
  return


  }	
ConvertIngredientSelection(IngredientSelection){
  
  sleep 140
  AbsSelection:=Abs(IngredientSelection)-1
  if (IngredientSelection > 0)
   msgbox, %ingredientSelection% ; sendinput, {home}{right %IngredientSelection%}
  if (IngredientSelection < 0)
    msgbox, %AbsSelection% ;Sendinput, {tab}{end}{left %Absselection%}
  sleep 300
  ; send, {enter}
    return
}

Class SpecTab_TestSpecs{

  Copy(){
    global
    WinActivate, NuGenesis LMS - \\Remote
      click 57, 715 ; edit Test
    ; click 57, 750 ; edit results
    winwaitactive, Test Definition Editor - \\Remote
      click 418, 202
      send, ^a^c
      sleep 200
      Description:=Clipboard
      sleep 200
			Wheel_scroll("100")
			click 240, 488 ;click resulst
			sleep 200
			WinActivate, Results Definition - \\Remote
			WinWaitActive, Results Definition,,0.25
				if errorlevel
					WinActivate, Results Definition
      WinWaitActive, Results Definition - \\Remote
      click 282, 121 ; click row
        sleep 100
    send, ^c
    sleep 200
    if ErrorLevel
      msgbox, yo
    ; sendlevel,0
    sleep 200
    send, {esc}
    ParsedSpecs:=[]
    Loop, parse, Clipboard, `t 
    ParsedSpecs.insert(A_LoopField)
    MinLimit:=Parsedspecs[17]
    MaxLimit:=Parsedspecs[18]
    Percision:=Parsedspecs[19]
    Requirement:=Parsedspecs[20]
    Units:=Parsedspecs[21]
    tooltip(Requirement)
    Return
    }
    
    Paste(){
      Global
      WinActivate, NuGenesis LMS - \\Remote
      click 57, 715 ; edit Test
    ; click 57, 750 ; edit results
      winwaitactive, Test Definition Editor - \\Remote
      click 418, 202
				SpecTab_TestDefinitionEditor(Description) ; the pre window
				sleep 200
					Wheel_scroll("100")
					click 240, 488 ;click resulst
					sleep 200
					WinActivate, Results Definition - \\Remote
					WinWaitActive, Results Definition,,0.25
						if errorlevel
							WinActivate, Results Definition
      Mouse_Click("edit")
      winwaitactive, Result Editor - \\Remote
      SpecTab_ResultEditor(MinLimit,MaxLimit,Units,Percision,1,Requirement)
      return
    }
    
    AddMethod(MethodID){
      WinActivate, NuGenesis LMS - \\Remote
      click 67, 562 ; Add Methods
      winwaitactive, Select methods tests - \\Remote
      click 227, 69. 2 ; method search bar
      sendinput, %MethodID%{enter}^a{click 506, 337}{click 851, 656} ; add test and hit okay
      sleep 200
      WinActivate, NuGenesis LMS - \\Remote
      click 397, 591 ; click attrobutes
      return
    }
    
  }

ReadSpecIntoDataBase:
  iniread, full, data.ini, %Product%,
  Test_Specs:= strsplit(Full,"=")
  Test:=Test_Specs[1]
  Specs:= strsplit(Test_Specs[2],"|")
  msgbox % "test: " Test "`n`nLabelClaim: " Specs[1] "`nMinLimit: " Specs[2] "`nMaxLimit: " Specs[3] "`nUnits: " Specs[4] "`nPercision: " Specs[5] "`nDescription: " Specs[6] "`nMethod: " Specs[7] "`n" "`nTests: " Tests "`nTest_Specs[2]: " Test_Specs[2]

  LabelClaim[A_index] "|" MinLimit[A_index]"|" MaxLimit[A_index]"|" Units[A_index]"|" Percision[A_index] "|" Description[A_index] "|" Method[A_index]
  Return  


TestScriptFillOut:
  WinActivate, Substance ID Registration Verification V.1.0.3.docx - Word ahk_class OpusApp
  Sleep, 333
  Sendinput, {Down}+{Tab}
  sleep 300
  sendinput, ^{c}

  sleep 300
  WinActivate, LMS Workbook.xlsb - Excel ahk_class XLMAIN
  Sleep, 333
  Sendinput, ^{f}
  sleep 200
  WinActivate, Find and Replace ahk_class bosa_sdm_XL9
  Sleep, 333
  Sendinput, ^{v}{Enter}
  sleep 300
  sendinput, {esc}

  Sleep, 333
  Sendinput, {right}
  sleep 200
  sendinput, ^{c}
  WinActivate, Substance ID Registration Verification V.1.0.3.docx - Word ahk_class OpusApp
  Sleep, 333
  Sendinput, {Tab}
  sleep 200
  send, !^{v}
    return
  Test2:
  Autofill_SmartDoc()
    setwindelay, 450
  return


QuickCode(){
  global
  Click, 2
  sleep 100
  WinActivate, Edit Ingredient
  click 357, 340
  send, {home}{space 2}{click 277, 561}
  return
}








CheckActive:
  If WinActive("NuGenesis LMS - \\Remote") || Winactive("ahk_exe EXCEL.EXE") || winactive("ahk_exe OUTLOOK.EXE") || winactive("ahk_exe Code.exe") 
  {
    varbar.move()
    return
    }
  Else if WinActive("VarBar ahk_class AutoHotkeyGUI")
    exit
  else
    WinMove, VarBar ahk_class AutoHotkeyGUI,, 1500, 0
  Return




SmartDocs:
  Autofill_SmartDoc() 
return
  Autofill_SmartDoc(){
    global
    setwindelay, 50
    If Winexist("LMS Actions - \\Remote") {
        WinActivate,
        click 60, 44
        sleep 200
        WinWaitClose, LMS Actions - \\Remote
        return
      }
    else if winexist("Select Iterations - \\Remote"){
      WinActivate, 
        Rotation_GetTable()
      WinWaitClose, Select Iterations - \\Remote
        return
    }
    else If Winexist("New Document - \\Remote") {
      WinActivate,   
      sleep 200                    
      send, {tab 6}{right 5}{tab 4}%Product%{tab 2}{enter}
      sleep 400
      WinActivate, NuGenesis LMS - \\Remote
      sleep 400
      click, 525, 100 ;edit section
      sleep 200			
      return				 
    }
      else If Winexist("Select Product - \\Remote"){
        WinActivate,
        click 105, 62 ;select Formulation search
      sendinput, %product%{enter 2}
      WinWaitClose, Select Product - \\Remote
      return
      }
      else if winactive("Release: Rotational Testing Schedule - \\Remote")
      autofill()
      else if winactive("Sign : 210421_Rotation_0007 - \\Remote")
        AutoFill()
      else if winactive("Release:"){
        AutoFill()
        SetTimer, SmartDocs, off
        exit
      }  
      else
        return
  }


TestSpecCopying:
  ; ToggleFilter_Test()
  ; FilterSearch_Test("Vitamin C","221")
  ; CopyResults_Test()
  ; ParseResultSpecs()
  ;   ; FilterSearch_Test()
  ; 	coordmode, tooltip, Screen
  ;   tooltip, Low: %LowerLimit% `t High: %UpperLimit% `t Unit: %Unit% `t %Precision% `n `t %Requirement%, 1500, 0
  ; ; msgbox, %product% `t %batch% `n %lot%
return
 
ctrlEvent(CtrlHwnd, GuiEvent, EventInfo, ErrLevel:="") {
  
  ;GuiControlGet, OutputVar , , %CtrlHwnd%,
  IniRead,vOutput, Customers.ini, Customers, %OutputVar%
  msgbox, %vOutput%
  }




ToggleFilter_Test(){
  WinActivate, NuGenesis LMS - \\Remote
  click 489, 836, R
  sendinput, {down 2}{enter}
}

FilterSearch_Test(TestName:="", MethodName:=""){
  WinActivate, NuGenesis LMS - \\Remote
  click 1230, 648 ;click name filterbox
  send, ^a%TestName%{enter}
  click 1067, 647 ; click method ID Filterbox
  send, ^a%MethodName%{enter}{tab 4}
}

return





  SendPassword(){
    if winactive, Remote Desktop
    sendinput, ?+{K}ilgore7744{enter}
      else
    sendinput, +{K}ilgore7744{enter}
    return
  }


#IfWinActive,

; Sendlevel 1
  ;Rbutton & F18::send, {F21}
  ; Rbutton & F13::sendinput, {F21}
; Xbutton1 & Xbutton2::
Xbutton2 & Xbutton1::send, {Ctrldown}{Altdown}{tab}{CtrlUp}{AltUp}
  ; Rbutton & F17::F21
 ; F19::Return ;send, {F21}
 !t::ToggleTrackpsd()

  ; Sendlevel 0 
  


KEY_DEFAULT:
  Xbutton1 & F18::Clip("OCR") 
  Mbutton & Xbutton1::SendPassword()
  !f::Open_Firefox()
  !v::Open_vsCode()
  Capslock & `::QuickCode()
  Mbutton::RControl
  ~$mbutton up::
  sendlevel 1
  sendinput, {Rctrl up}{Lctrl up}{Alt Up}{Shift Up}
  sendlevel 0
  return
  Mbutton & Lbutton::sendinput, {CtrlDown}{Lbutton}{CtrlUp}
  Mbutton & WheelDown::sendinput, {ctrldown}{WheelDown}
  Mbutton & Wheelup::sendinput, {ctrldown}{Wheelup}

  Mbutton & F17::Wheel_Right()
  Mbutton & F16::Wheel_left()
  Rbutton & Wheelup::Wheel_cut() 
  Rbutton & Wheeldown::Wheel_paste()
  Rbutton & Xbutton2::Get_WindowInfo()
  Rbutton & F16::Backspace
  Rbutton & Lbutton::Enter
  Rbutton up::Mouse_RbuttonUP()
  Xbutton1 & LButton::Sendinput, +^4 ;screenshot"
  Xbutton1 & RButton::Sendinput, +^3 ;screenshot"
  Xbutton1 & WheelUp::Wheel(Product)
  Xbutton1 & WheelDown::Wheel(Batch)
  Xbutton1 & wheelleft::Excel.PreviousSheet()
  Xbutton1 & wheelright::Excel.NextSheet()
  Xbutton1 & F17::Excel.NextSheet()
  Xbutton1 & F16::Excel.PreviousSheet()
  ; Xbutton2 & Rbutton::Get_WindowInfo()
  Xbutton1::Clip()
  Xbutton1 & Mbutton::Varbar.reset()
  Xbutton2 & wheelDown::Mouse_CloseWindow()
  F18 & Wheelup::!^tab
  ; Xbutton2 & Lbutton::Sendinput, #{down}
  ; Xbutton2::Menu()
  F18 & Wheeldown::+^!tab
  F18 & Lbutton::sendinput, ^{Click}
  F18 & Rbutton::sendinput, +{Click}
  F18 & F17::
  F18 & F16::

  F20 & Right::send, #{right}
  F20 & Left::send, #{Left}
  F20 & UP::send, #{UP}
  F20 & Down::send, #{Down}
  F19 & f20::WinActivate, ahk_exe WFICA32.EXE
  F20 & f19::WinActivate, ahk_exe WFICA32.EXE
  enter::enter

  capslock::sendinput, {esc}{Rctrl up}{Alt Up}
 ; Xbutton2 & Xbutton1::+^Tab
   ;Xbutton2 & Xbutton1::!^Tab
  ; if (A_TimeSincePriorHotkey != -1 & A_TimeSincePriorHotkey <300)
  ;   cnt +=1
  ; else if (A_TimeSincePriorHotkey > 400)
  ;   cnt :=0
    
  ;   if (cnt==2)
  ;   {
  ; ;  try menu, menu, deleteAll
  ;     Autofill()
  ;     tooltip("Tripple")
  ;   }
  ;   if (cnt == 1)
  ;     Menu()
  ;     RETurn

; #If (A_PriorHotKey = "F18" AND A_TimeSincePriorHotkey < 2000) ;____F18____
  ; f18::ReloadScript()
  ; Wheelup::test()
  ; Wheeldown::send, {esc}
  ; F16::sendinput, {Click 354, 44}
  ; F17::sendinput, {click, 743, 41}
  ; Lbutton::sendinput, ^{click}
  ; Rbutton::sendinput, +{click}
  ; mbutton::Clip()
  ; #If
  ; F18::Autofill() ;Tooltip("☩",2000) 

  Xbutton2::Menu()
#If (A_PriorHotKey = "Xbutton2" AND A_TimeSincePriorHotkey < 500)
    ; Browser_forward::#right
    ; Browser_back::#left
    ; Media_Next::sendinput, #{up}
    Wheelup::tooltip(A_ThisHotkey)
    Wheeldown::tooltip(A_ThisHotkey)
    wheelleft::tooltip(A_ThisHotkey)
    wheelright::tooltip(A_ThisHotkey)
    Lbutton::tooltip(A_ThisHotkey)
    Rbutton::tooltip(A_ThisHotkey)
    Xbutton2::msgbox, %A_thishotkey% ;tooltip(A_ThisHotkey)
    mbutton::tooltip(A_ThisHotkey)
    Xbutton1::tooltip(A_ThisHotkey)

    #If




Click_Filter(Code:=0,PostCmd:="",Source:=0){ 
  Global
    ProductFilter:=FilterBox_X
    BatchFilter:=FilterBox_X+60
    LotFilter:=BatchFilter+100
  if (Source ="xl")
    excel.connect()
  if (Source= "clip")
    clip()
  WinActivate, NuGenesis LMS - \\Remote
  if code contains Product
    sendinput, {Click %ProductFilter%, %FilterBox_Y%}{Click %ProductFilter%, %FilterBox_Y%}^a%Product%^a 
  else if code contains Batch
   sendinput, {Click 748, 47}{Click %BatchFilter%, %FilterBox_Y%}^a%batch%^a
  else if code contains Lot
   sendinput, {Click 748, 47}{Click %LotFilter%, %FilterBox_Y%}^a%Lot%^a
  else 
    sendinput, {Click %ProductFilter%, %FilterBox_Y%}{Click %ProductFilter%, %FilterBox_Y%}^a
  Send, {%postCMD%}
  return
}
  
  
  
;___________________________________________________________________________
  F13 & F16::Click_Filter(2,"enter") 
  F13 & F17::Click_Filter(1,"enter") 
  F19::Click_Filter(2) 
  F20::Click_Filter(1) 
KEY_LMS:
  #Ifwinactive, NuGenesis LMS - \\Remote 
 ; F20::send, {Click 462, 182}{Click 463, 144}^a
  Xbutton2 & WheelRight::sendinput, {click, 743, 41}
  Xbutton2 & WheelLeft::sendinput, {Click 354, 44}
  F16::Click_Filter("Product","enter") 
  F17::Click_Filter("Batch","enter") 
  F18::autofill()
  Xbutton2 & WheelUp::Test()
  Xbutton2 & wheeldown::Varbar.SubIteration()
  Xbutton1 & WheelUp::SearchBar("Product")
  Xbutton1 & WheelDown::SearchBar("Batch")
  Mbutton::Excel.Connect()
  Enter::Sendinput, ^a^c{enter}
#Ifwinactive, Select methods tests - \\Remote
  F19 & space::AutoFill()
  F17::Methods()
#IfWinActive, Results Definition - \\Remote
  wheelup::Mouse_click("Edit")
  F16::wheel("{esc}",1000)
  WheelDown::
  Click, 1330, 592
  sleep 100
  click, 338, 619
  Return
#ifwinactive, Edit test (Field Configuration:
  F16::Autofill()
#Ifwinactive, Result Entry - \\Remote  ;Enter Test Results window
  Xbutton1::WorkTab_ChangeTestResults("toggle")	
  F16::WorkTab_ChangeTestResults("toggle")
  F17::WorkTab_ChangeTestResults()
  
#ifwinactive, Register new samples - \\Remote
  Xbutton1 & wheelup::sendinput, {click 180, 103, 2}%Product%{enter}
  F18::Autofill(1)

#IfWinActive, ahk_exe WFICA32.EXE, ;GENERIC LMS
  Xbutton2 & WheelUp::Varbar.AddIteration()
  Xbutton2 & wheeldown::Varbar.SubIteration()
  browser_Forward::Excel.NextSheet()
  browser_Back::Excel.PreviousSheet()
  ; Xbutton1 & F17::Excel.NextSheet()
  ; Xbutton1 & F16::Excel.PreviousSheet()
  Mbutton::AutoFill()
  F18::autofill()
  ; Xbutton1 & WheelUp::Wheel(Product)
  ; Xbutton1 & WheelDown::Wheel(Batch)

#IfWinActive, Enter Product Number ahk_class #32770
  m::1
  ,::2
  .::3
  j::4
  k::5
  l::6
  u::7
  i::8
  o::9
  `;::0
  F19::0
  h::-

KEY_Varbar:
  #If Mouse_IsOver("VarBar ahk_class AutoHotkeyGUI") 
  wheelleft::Excel.PreviousSheet()
  wheelRight::excel.Nextsheet()
  WheelUp::Varbar.AddIteration()
  Wheeldown::Varbar.SubIteration()
  F17::Excel.NextSheet()
  F16::Excel.previoussheet()
  Rbutton::Excel.connect()
  Mbutton & WheelDown::varbar.Move()
  mbutton::Varbar.LaunchTable()
  Rbutton & F16::ProductTab_Table()
  Rbutton & F17::SpecTab_Table()
  #if
  
  
  
Methods() {
  global
  ; Mouse_Click("searchBar_SelectMethodsTest")
  WinActivate, Select methods tests - \\Remote
  click, 229, 72,2
  send, ^a
  Loop, Read, Methods.ini
{
  If A_Index = 1
    Continue
  Method := StrSplit(A_LoopReadLine, "=") 
  ; MethodGroup := StrSplit(A_LoopReadLine, "|") 
  Selection:= % Method[1]
  ; Group:= % MethodGroup[2]
  Menu, Methodmenu, add, %Selection%, Methods
}
   Menu, MethodMenu, Show,
return

Methods:
sleep 200
InputVar:=A_ThisMenuItem
  IniRead,vOutput, Methods.ini, Methods, %InputVar%
  Sendinput, %vOutput%{enter}
   sleep 300
   click 506, 341
   Methods() 
return
}	




KEY_Excel:
  #IfWinActive, LMS Workbook.xlsb
  F18::Excel.Connect(1)
  MButton::Excel.Connect(1)
  F13 & F16::Click_Filter(2,"enter","xl") 
  F13 & F17::Click_Filter(1,"enter","xl") 
  #ifwinactive, Book4
    F17::
      wheelright::sendinput, #{right}
      return
    F16::
      wheelleft::sendinput, #{left}
      return
  #ifwinactive, ahk_exe EXCEL.EXE
  +Enter::sendinput, !{enter}
  $Enter::sendinput, {enter}
  ;F18::Excel.Search()
  Mbutton::Excel.Connect(1)
  F16::wheel("{wheelleft}",80)
  F17::wheel("{wheelRight}",80)
  ; Mbutton & Wheelup::^Wheelup
  ; Mbutton & Wheeldown::^wheeldown
  Xbutton2 & F17::^PgDN ;Excel.NextSheet()
  Xbutton2 & F16::^PgUp ;Excel.PreviousSheet()
  #ifwinactive, Find and Replace,
  Xbutton1 & WheelUp::
  Wheel("!n")
  Sendinput, %Product%
  return
  Xbutton1 & WheelDown::
 ; Wheel("{alt down}n{alt up}")
  Sendinput % Batch
  return
  return::sendinput, !i
  rbutton & Lbutton::sendinput, !i

#IfWinActive, ahk_exe explorer.exe
  Mbutton::Open_in_Notepad()
  Xbutton2 & F17::Excel.NextSheet()
  Xbutton2 & F16::Excel.PreviousSheet()
  ; F18 uP::send, {space}
 #IfWinActive, C:\Users\mmignin\Desktop\Label Copy\All Label Copy ahk_exe explorer.exe OR - search ahk_exe explorer.exe
 Xbutton1 & Wheelup:: ;LabelCopySearch(){
  ; Excel.Connect()
  winactivate, ahk_exe explorer.exe
  blockinput, on
  ControlClick, ModernSearchBox1, ahk_exe explorer.exe, ,Left, 1
  ControlSetText, ModernSearchBox1, %Product%,ahk_exe explorer.exe,
  ; send, ^a%Product%
  sleep 100
  send, {enter}

  sleep 400
   blockinput, Off
  return


KEY_ClickUp:
#IfWinActive,ahk_exe ClickUp.exe


KEY_OUTLOOK:
  #IfWinActive, ahk_exe OUTLOOK.EXE 
  Mbutton::SENDINPUT % Varbar.Sendinput("Batch") " is updated"
  Rbutton & Wheelup::Wheel("{ctrl down}x{ctrl up}")
  Rbutton & wheeldown::Wheel("{ctrl down}v{ctrl up}")
  Rbutton & F17::Varbar.Sendinput("Batch"," is updated.")
  Xbutton2 & WheelDown::searchbar("batch")
  Xbutton2 & Wheelup::searchBar("Product")
  Xbutton1::Clip()
  F19 & Space::Varbar.Sendinput("Product")
  F20 & Space::Varbar.Sendinput("batch")
  Xbutton1 & Wheelright::Varbar.AddIteration()
  Xbutton1 & wheelleft::Varbar.SubIteration()
  F18::LMS_Search()

KEY_Browser:
  #IfWinActive, ahk_exe firefox.exe
  Xbutton2 & WheelDown::Wheel("^w")
  F16::sendinput, !{left}
  Xbutton1 & WheelDOWN::Browser_Back
  F17::!right
  Xbutton2 & wheelUP::Browser_Forward
  Mbutton::Mbutton ;sendinput, ^{click}

KEY_Snipper: 
  #IfWinActive, Snipper - Snipaste ; the capture screen
  rbutton::send, ^c
  WheelDown::wheel("^1")
  Wheelup::Wheel("^5")
  F18::excel.PasteValues("snip")
  #IfWinActive, Paster - Snipaste ahk_exe Snipaste.exe ; the floating window
  F18 & wheelUp::Wheel("{click right}z1{click right}e{ctrl down}5{ctrl up}")
  F18::send, {esc}
  Xbutton1::sendinput, ^c
  F17::sendinput, ^+{+}
  F16::sendinput, ^+{-}
  #If mouse_isover("Paster - Snipaste ahk_class")
  ; sendlevel 1
  F18::send, !{click}
  ; sendlevel 0
  #if

KEY_OneNote:
  #IfWinActive, ahk_exe ONENOTE.EXE
  Mbutton & Wheelup::Wheel_2("^!+{=}",50)
  Mbutton & Wheeldown::Wheel_2("^!+{-}",50)
  Mbutton::send, {AltDown}{Altup}{w}{i}
  F18::F11


Scroll_Fix:
  #if winactive("Result Editor - \\Remote") || winactive("Test Definition Editor - \\Remote")
  wheeldown::Wheel_scroll("100")
  wheelup::Wheel_scroll("-100")
    ; #ifwinactive, Test Definition Editor - \\Remote
  ; wheeldown::Wheel_scroll("100")
  ; wheelup::Wheel_scroll("-100"
  #if
ClipTool:
#IfWinactive, C:\Users\mmignin\Documents\VQuest\lib\CL3\cl3.ahk,
  F19::send, {esc}
  F19 & j::send, {down}
  F19 & k::send, {up}
  F19 & l::send, {enter}
  F19 & h::send, {esc}
  Capslock & j::send, {down}
  Capslock & k::send, {up}
  capslock & l::send, {enter}
  capslock & h::send, {esc}
  capslock::esc
  #IfWinActive


KEY_Otherstuff:
  Media_Play_Pause::Menu() ;4finger tap
  Media_Prev::F7 ;3fringer down
  ; Media_Next:: ;3finger up
  Browser_Back::+!tab ;3finger left
  Browser_Forward::^!tab

  Volume_Down::F11
  Volume_Up::F12
  #right::tooltip(A_ThisHotkey)
  ^+!down::tooltip(A_ThisHotkey)







TrouchPad:
#If (A_PriorHotKey = "Browser_forward" AND A_TimeSincePriorHotkey < 1000)
  browser_forward::Send, !{tab}{space}
  browser_back::send, +!{tab}{space}
  media_Next::Mouse_CloseWindow()
  
#If (A_PriorHotKey = "Media_next" AND A_TimeSincePriorHotkey < 1000)
    Browser_forward::#right
    Browser_back::#left
    Media_Next::sendinput, #{up}
    Wheelup::tooltip(A_ThisHotkey)
    Wheeldown::tooltip(A_ThisHotkey)
    wheelleft::tooltip(A_ThisHotkey)
    wheelright::tooltip(A_ThisHotkey)
    Lbutton::tooltip(A_ThisHotkey)
    Rbutton::tooltip(A_ThisHotkey)
    mbutton::tooltip(A_ThisHotkey)
    #If
  Media_next::Tooltip("Swipe",2000) 

#If WinActive("ahk_exe Code.exe") && Getkeystate("Capslock","p") ;editor
    ,::sendinput, +!/
    m::+!down
    n::+!n
    u::+!up
    '::+^!n
    .::+F1
    up::^+up
    down::^+down
    /::sendinput, !^w
    5::^+/


ToggleTrackpsd(){
  Send, !{f12}
  winactivate, Settings
  sleep 800
  send, {space}!{F4}
  Tooltip("TrackPad Toggled",2000)
  return
  }

open_Firefox(){
  ifwinnotexist, ahk_exe firefox.exe
    run, firefox.exe, "C:\Program Files\Mozilla Firefox\" 
  else 
    WinActivate, ahk_exe firefox.exe

  return
  }

open_VScode(){
  ifwinnotexist,ahk_exe Code.exe
    run, Code.exe, "C:\Program Files\Microsoft VS Code\" 
  else 
    WinActivate, ahk_exe Code.exe

  return
  }

Open_in_Notepad(){
    click
    WinGetClass class, % " ahk_id " WinExist("A")
    for Window in ComObjCreate("Shell.Application").Windows 
      Selection := Window.Document.SelectedItems
    for Items in Selection
      Path_to_Selection := Items.path		
    Run C:\Windows\system32\Notepad.exe %Path_to_Selection%
  }

Snip_groupChange(){
  Wheel("{ctrl down}22{Ctrl up}")
  tooltip("Snip Group Changed",2000)
  return
  }


LMS_Search(){
  Global
  clipboard:=""
  send, ^c
  sleep 200
  ;ClipWait, 1,
  ; Clipboard := Trim((Clipboard, "`r`n"))
  Clip()
  WinActivate, NuGenesis LMS - \\Remote
  click 783, 45
  sleep 200
SearchBar("Batch")
  ; click, 500,127, 2 ;click search bar
  sleep 200
  ; Send, %clipboard%{enter}
  return
  }

StopSub: 
  exitapp
  Return
VarBar_ResetSub:
  VarBar.Reset()
  return
Run_Display:
  run, Display.url, C:\Users\mmignin\Desktop\
Run_CL3:
  Run, cl3.Ahk, lib\CL3
  return
FilterBox_Location:
    KeyWait, Lbutton, D
    sleep 200
    ; KeyWait, Lbutton, D
    CoordMode, mouse, window
    MouseGetPos, FilterBox_X, FilterBox_Y,
  	IniWrite, %FilterBox_X%, data.ini, Locations, FilterBox_X
  	IniWrite, %FilterBox_Y%, data.ini, Locations, FilterBox_Y
    FilterBoxLocation:=FilterBox_X ", " FilterBox_Y
    tooltip(FilterBoxLocation)
    return
run_VIM:
  Run, ViM.Ahk
  return
WindowSpySub: 
  Run, WindowSpy.ahk,C:\Program Files\AutoHotkey\
  return
  
#IfWinActive,
#Include <AutoFill>
#include <varBar>
#include <ProductTab>
#include <WorkTab>
#include <SpecTab>
#include <Rotation>
#include <Excel>
#include <vis2>
#include <SearchBar>
#include <wheel>
#include <VScode>
#include <mouse>
#include <click>
#include <test>




VQuest_Start:
  #Persistent 
  #NoEnv
  #SingleInstance,Force
  #KeyHistory 100
  #WinActivateForce
  SetWorkingDir, %A_ScriptDir%
  Menu, Tray, Add,CL3, Run_cl3
  menu, tray, add, Display settings, Run_display
  Menu, Tray, Add, Set FilterBox Location, Filterbox_Location
  Menu, Tray, Add, Vim, Run_Vim
  Menu, Tray, Add, Stop, StopSub
  Menu, Tray, Add, windowSpy, WindowSpySub 
  Menu, Tray, Add, ResetVarbar, Varbar_ResetSub
  Menu, Tray, Default, ResetVarbar
  SetBatchLines, 20ms
  Setnumlockstate Alwayson
  setCapslockstate alwaysoff
  SetscrolllockState, alwaysOff
  	CoordMode, mouse, Window
    ;SetMouseDelay, 25
  SetDefaultMouseSpeed, 1
  detecthiddenwindows, on
  SetTitleMatchMode, 2
  ; settitlematchmode, Slow
  #MaxHotkeysPerInterval 400
  ; #HotkeyModifierTimeout 400
  #maxthreadsperhotkey, 2
   SetKeyDelay, 0, 0
  setwindelay,450
  AutoTrim, On
  Menu, Tray, Icon, Robot.ico
    Iniread, FilterBox_X, data.ini, Locations, FilterBox_X
    Iniread, FilterBox_Y, data.ini, Locations, FilterBox_Y

    
Results_Definition_edit:="78,63"
Result_Editor_Ok:="370,660"
Results_Definition_ok:="1336,592"
Requests_tab:="865,83"
MyWork_Tab:="761,44"
Mywork_Searchbar:="500,127,2"
  Iniread, Iteration, data.ini, SavedVariables, Iteration
  Iniread, VarBar_X, data.ini, Locations, VarBar_x
  Iniread, VarBar_Y, data.ini, Locations, VarBar_Y
  Excel.Connect(1)
  StartTest()
  


