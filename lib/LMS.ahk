KEY_LMS:
#Ifwinactive, NuGenesis LMS - \\Remote 
; F20::send, {Click 462, 182}{Click 463, 144}^a
	F8::Mouse_CloseWindow()
	Xbutton2 & WheelRight::sendinput, {click, 743, 41}
	Xbutton2 & WheelLeft::sendinput, {Click 354, 44}

	rshift & lbutton::sendinput, {shiftDown}{click}{shiftup}
	F20 & space::send, %Batch%{enter}
	F19 & space::Send, %Product%{enter}
	F6::Send, %Product%{enter}
	F7::send, %Batch%{enter}
	~Lbutton & Rbutton::send, {enter}
	Xbutton1 & WheelUp::Click.SearchBar(Product,"{enter}")
	Xbutton1 & WheelDown::Click.SearchBar(Batch,"{enter}") 
	Xbutton1 & F6::Click.SearchBar(Product,"{enter}",1)
	Xbutton1 & F7::Click.SearchBar(Batch,"{enter}",1) 
	Xbutton2 & wheeldown::Varbar.SubIteration()
	Mbutton::
  clip()
  menu.LMS()
  return
	Media_Prev::send % "{click 360, 48}{click 803, 83}" mousereturn
	Browser_Forward::send % MouseSave() "{click 54, 747}{click 831, 689,0}" MouseReturn
	Enter::LMS.SaveCode()
	F19::Menu.LMS()
		
#Ifwinactive, Select methods tests - \\Remote
	F7::LMS.Methods()
	F6::esc
#IfWinActive, Composition - \\Remote
	F6::esc
	F7::enter
#IfWinActive, Test Definition Editor - \\Remote
	F6::esc
	F7::click 330, 619 ;click save
#IfWinActive, Results Definition - \\Remote
	F6::esc
	F7::enter
	wheelup::Mouse_click("Edit")
	WheelDown::
	Click, 1330, 592
	sleep 100
	click, 338, 619
	Return
#IfWinActive, Edit specification - \\Remote
#ifwinactive, Edit test (Field Configuration:
	F6::Autofill()
	F6::esc
#Ifwinactive, Result Entry - \\Remote  ;Enter Test Results window
	Rbutton::WorkTab.ChangeTestResults("toggle")	
	F6::WorkTab.ChangeTestResults("toggle")
	#MaxThreadsPerHotkey 2
	;setwindelay,10
		F8::WorkTab.ChangeTestResults("loop")
	;setwindelay,500
	#MaxThreadsPerHotkey 1
	; F8::WorkTab.ChangeTestResults("loop")
	F7::WorkTab.ChangeTestResults()
	;F7::WorkTab.ChangeTestResults()
	F6::esc
#ifwinactive, Register new samples - \\Remote
	Xbutton1 & wheelup::Click.Searchbar()
	Mbutton::Autofill()
	space::autofill()
	F8::Click.Searchbar(,"{enter}")
	F7::send, % MouseSave() "{click 502, 354}" Next
	F9::Send, {click 194, 188}^a
	F6::esc
#IfWinActive, Select tests for request: R
	Mbutton::WorkTab.SelectTestSample()
#ifwinactive, Select samples for test:
	F7::sendinput % MouseSave() "{click 504, 324}" MouseReturn ; add test. 
	F6::esc
#IfWinActive, ahk_exe WFICA32.EXE, ;GENERIC LMS
	Xbutton2::Menu.LMS() 
	F20 & F19::Sendinput, %Batch%
	F20 & space::Sendinput, %Product%
	F9::send, {enter}
	F19::menu.LMS()
	$Rbutton up::Mouse_RbuttonUP()
	Xbutton2 & WheelUp::Varbar.AddIteration()
	Xbutton2 & wheeldown::Varbar.SubIteration()
	; browser_Forward::Excel.NextSheet()
	; browser_Back::Excel.PreviousSheet()
	Mbutton::AutoFill()
	enter::click.okay()
	esc::click.esc()

	left::left
	Down::down
	right::right
  up::up
#IfWinActive,

 

  
  Class LMS {
    
SearchBar(Code:=0,PostCmd:="",Divider:=0){ 
  Global
  WinActivate, ahk_exe WFICA32.EXE
  ControlGetText, Batch, Edit2, VarBar
  ControlGetText, Lot, Edit3, VarBar
  ControlGetText, Product, Edit1, VarBar
  LMS.OrientBoxes()                   
  blockinput on
  ; mousesave()
    if winactive("Select methods tests - \\Remote")
      click, 246,77, 2  
    else If winactive("Register new samples - \\Remote")
      send, {click 180, 103, 2}%Product%%mouseReturn% 
    else if winactive("NuGenesis LMS - \\Remote")
      LMS.DetectTab()
        if Tab contains Product_Spec
          clk(xProductSpecBar,yProductSpecBar)
        else if tab contains Request
          clk(xRequestSearch,yRequestSearch)
        else if tab contains Documents
          clk(xRDocumentFilterBar,yDocumentFilterBar)
        else if tab contains Sample
          clk(xSampleSearch,ySampleSearch)
        else if tab contains Request
          clk(xRequestSearch,yRequestSearch)                    
      send, ^{a}%Code%^{a}%PostCMD% 
    sleep 300
    blockinput off

    sleep 300
    return


  }
    
    
    
SaveCode(){
		Send, {CtrlDown}{a}{c}{Ctrlup}
		sleep 100
		send, {enter}
		FileAppend, %Clipboard%`n, Codes.txt
		return
}

OrientBoxes(){
  global
  ; winactivate, NuGenesis LMS - \\Remote
  CoordMode, mouse, Window
  WinGetPos,wX,wY,wW,wH, NuGenesis LMS - \\Remote
  xSamplesTab:=(Ww/2)-80
  xRequestsTab:=(Ww/2)+20
  xDivider:=(Ww/5)
  xDocumentsTab:=(Ww/3)+(Ww/3)-50
  xResTab:=(Ww/3)+(Ww/3)-50
  yWorkTabs:=82
  WorkTab:="334, 47"
  ProductFilter:=xDivider
  BatchFilter:=xDivider+60
  LotFilter:=BatchFilter+100
  xProductSpecBar:=xDivider+180
  yProductSpecBar:=93
  yMyWorkBar:=125
  yFilterBar:=181
  yDocumentFilterBar:=300
  xDocumentFilterBar:=xDivider+68
  xFomulationFilterBar:=xDivider+75
  xBatchFilterBar:=xDivider+168
  xLotFilterBar:=xDivider+229
  xProductSearch:=xDivider+35
  xRequestsearch_default:=xDivider+151
  xRequestsearch:=xDivider+160   ;103
  xSamplessearch_default:=xDivider+145
  xSamplessearch:=xDivider+155
  xResultssearch_Default:=xDivider+130
  xResultssearch_:=xDivider+465
}
    
Search(){
  Global
  clipboard:=
  send, ^c
  ClipWait, 1,
  Clipboard := Trim((Clipboard, "`r`n"))
  Clip()
  WinActivate, NuGenesis LMS - \\Remote
  click % WorkTab
  click % RequestTab
  
  sleep 200
  click.SearchBar(Batch)
  ; click, 500,127, 2 ;click search bar
  ; sleep 200
  ; Send, %clipboard%{enter}
  ; return
  }
  
AddCOASpace(){
  Global
  WinActivate, Composition - \\Remote
  click
  MouseSave()
  click 74, 64
  sleep 200
  send, {click 354, 336}{end}{enter}{click 283, 559}
  WinActivate, Composition - \\Remote
  send %mouseReturn%
  MouseMove, 0, 36, 0, r
  sleep 200
  return
}
RemoveCOASpace(){
  Global
  WinActivate, Composition - \\Remote
  click
  MouseSave()
  click 74, 64
  sleep 200
  send, {click 354, 336}{pgdn 2}{backspace}{click 283, 559}
  WinActivate, Composition - \\Remote
  send %mouseReturn%
  MouseMove, 0, 36, 0, r
  sleep 200
  return
}
  
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


}	
  
CheckDepartment(){
  global 
  ;clipboard:=
Send, ^c
sleep 300
if (Regexmatch(Clipboard, "(\bAnalytical \(In Process\)|\bI, Analytical\b|\bIn Process, Analytical\b)", Anal) > 0)
    Department:="Analytical"
else if (Regexmatch(Clipboard, "(\bFinished, \bMicro\b|\bF, Micro\b|\bMicro \(Finished\)|\bMicro Lab\b)",Micr) > 0)
    Department:="Micro"
else if (Regexmatch(Clipboard, "(\bI, Retain\b|\bIn Process, Retain\b)", Retain) > 0)
    Department:="Retain"
else if (Regexmatch(Clipboard, "(\bI, Physical\b|In Process, Physical\b|\bPhysical \(In Process\))", Phys) > 0)
    Department:="Physical"
else if (Regexmatch(Clipboard, "(\bCT, Physical\b|Coated, Physical\b|\bCoated, Physical\b)", CTPhys) > 0) 
    Department:="CTPhysical"
else if (Regexmatch(Clipboard, "(\bCT, Retain\|Coated, Retain\b)", CTRetain) > 0)
    Department:="CTRetain"
else {
  Tooltip(nope)
  
  sleep 300
  exit
}
}  
  
DeleteRetain(){
  gLOBAL
  MouseGetPos, mx, mY
  InputBox, n, number of retains to delte, , , , , mx, my,
  loop %n%
  {
    sleep 100
    send, {click 61, 258}
    winwait, Delete Tests - \\Remote
    sleep 100
    send, {enter}
    sleep 800
    }
  return
}
  
  
DetectTab(){
  global
  Tab:=
  
  if WinActive("NuGenesis LMS - \\Remote")
  {
    PixelSearch, FoundX, FoundY, 11, 66, 15, 72, 0xF8FBFE, 10, Fast RGB 
        If ErrorLevel 
        { ;Product}/Spec Tab?
          Tab="Product_Spec"
          ; tooltip(Tab)
        }
        If ErrorLevel = 0 ;is worktab?
          {
            PixelSearch, FoundX, FoundY, 11, 139, 15, 141, 0x54c7f2, 10, Fast RGB ;icon on left
            If ErrorLevel
            {
              Tab:="Sample"               
              ; tooltip(Tab)
            }
            If ErrorLevel = 0
            {
              PixelSearch, FoundX, FoundY, 18, 142, 19, 143, 0xffffff, 10, Fast RGB ;icon on left
              If ErrorLevel = 0
              {
                Tab:="Documents"                
                ; tooltip(Tab)
              }
              If ErrorLevel
              {
                Tab:="Request" 
                ; tooltip(Tab)
              }
            }        
          }
  }
  else    
    ; tooltip("nothing")
    return
  }
  }
  
  
Methods:
  sleep 200
  InputVar:=A_ThisMenuItem
    IniRead,vOutput, Methods.ini, Methods, %InputVar%
    Sendinput, %vOutput%{enter}
    sleep 300
    click 506, 341
    LMS.Methods() 
  return
  
  
  Scroll_Fix:
  #If mouse_isover("Result Editor - \\Remote") || mouse_isover("Test Definition Editor - \\Remote") || mouse_isover("Edit Formulation - \\Remote") ||
  wheeldown::
  Mouse.Save()
  Wheel_scroll("130")
  
  wheelup::Wheel_scroll("-130")
  #if