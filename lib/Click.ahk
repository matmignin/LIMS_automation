class click{


  SearchBar(Code:=0,PostCmd:="",FilterBox:=0){ 
    Global
            CoordMode, mouse, Window
    ; If code Contains Product
      ; A_Code:=Product
    ; If code Contains Batch
      ; A_Code:=Batch
    ; If code Contains lot
      ; A_Code:=lot
    ControlGetText, Batch, Static1, VarBar
    ControlGetText, Lot, Static2, VarBar
    ControlGetText, Product, Edit1, VarBar                          
    ProductFilter:=FilterBox_X
    BatchFilter:=FilterBox_X+60
    LotFilter:=BatchFilter+100
    SampleSearch_y:=Filterbox_Y-60
    samplesearch_X:=Filterbox_X+80
    ProductSearch_X:=Filterbox_X+130
    ProductSearch_Y:=Filterbox_Y-90
    
    blockinput on
    
    WinActivate, ahk_exe WFICA32.EXE
    DetectTab()
    if Tab contains Product_Spec
    {
      send, {Click %ProductSearch_X%,%ProductSearch_Y%, 2}^a%Product%^a 
      return
    }
    else if tab contains Document
      {
      msgbox, document
            return
    }
    else 
      if Filterbox:=0
      {
        send, {Click %SampleSearch_X%,%SampleSearch_Y%, 2}^a ;%Code%^a
              return
    }
      else
        if (Code:=Product)
        {
          Send, {Click %ProductFilter%, %Filterbox_Y%,2}^a ;%Code%^a
                return
    }
        else if (Code:=Batch)
        {
          Send, {Click %BatchFilter%, %Filterbox_Y%,2}^a ; %Code%^a
                return
    }
        else (Code:=Lot)
        {
          Send, {Click %LotFilter%, %Filterbox_Y%,2}^a ;%Code%^a
                return
    }
          
    ; if tab contains sample
        ; Sendinput, {Click %Code%%Filter%, %Filterbox_Y%,2}^a%A_Code%^a
    ; if tab contains Request
        ; Sendinput, {Click %Code%%Filter%, %Filterbox_Y%,2}^a%A_Code%^a
      
      
  ;  If WinActive("NuGenesis LMS - \\Remote")
  ;   {   
  ;     if code contains Product
  ;     {
  ;     WinActivate, NuGenesis LMS - \\Remote
  ;       CoordMode, Pixel, Window
  ;       PixelSearch, FoundX, FoundY, 11, 66, 15, 72, 0xF8FBFE, 10, Fast RGB
  ;       If ErrorLevel = 0 ; Work Tab
  ;         Sendinput, {Click %ProductFilter%, %Filterbox_Y%,2}^a%Product%^a
  ;       If ErrorLevel  ;Product/Spec Tab
  ;         sendinput, {Click 520, 97, 2}^a%Product%^a   
  ;     }
  ;     else if code contains Batch
  ;     {
  ;     WinActivate, NuGenesis LMS - \\Remote
  ;             Click 360, 45
  ;             sleep 200
  ;         send, {Click %BatchFilter%, %FilterBox_Y%}^a%batch%^a
  ;     }
  ;     else if code contains Lot
  ;     {
  ;     WinActivate, NuGenesis LMS - \\Remote
  ;         Click 360, 45
  ;         sleep 200
  ;         send, {Click %lotFilter%, %FilterBox_Y%}^a%lot%^a
  ;     }
  ;  }
  ;  
    if winactive("Select methods tests - \\Remote")
      click, 246,77, 2  
    else If winactive("Register new samples - \\Remote")
        send, {click 180, 103, 2}%Product%{enter}  
    else
      return
      ; Send, ^a%Product%
    ; Send, {%postCMD%}
    	blockinput off
      return
  
  
  }
  
  
  
  
  
  Save(){
    if winactive("Edit Product")
      click 275, 578	
    else If Winactive("Composition")
      click 1236, 888
    else If Winactive("Test Definition Editor ")
      Click 341, 618
    Else
      return
  }
  edit(){
    if winactive("Results Definition")
      click 78,63
    else 
      click 84, 65
    return 
  }
  Add(){
    if winactive("Formulation")
      click, 73, 280
    else
      click 45, 65
    return
  }
  okay(){
    if winactive("Results Definition")
      click 1336,592
    else If WinActive("Result Editor")
      click 370,660
    else if Edit Ingredient
      click 265, 561
    else if winactive("Result Entry")
      click, 1028, 808
    Else
      return
  }
  Requests_tab(){
    click 865,83
    return
  }
  MyWork_Tab(){
    click 761,44
    return
  }
  Mywork_Searchbar(){
    click 500,127, 2
    return
  }
  EditTest(){
    WinActivate, NuGenesis LMS - \\Remote
    Send, {click, 56, 784 }
    return
  }
  EnterResults(){
    WinActivate, NuGenesis LMS - \\Remote
    click 74, 900
    return
  }
  MoveOverTest(){
    if winactive("Select Methods Tests")
      Send, {Click}{click 506, 341}
    Else
      return
  }
  Orient(){
    if winactive("Result Entry")
      click 843, 202, 2
    else if winactive("Test Definition Editor")
      Click, 187, 200 

      
    Else
      return
  }
  CopySpecTemplate(){
    WinActivate, NuGenesis LMS - \\Remote
    click 102, 289 ;copy into new spec
    WinWaitActive, Edit specification - Remote, ,1
    if ErrorLevel
      winactivate, Edit specification - Remote
    ; click 317, 83
    ; sleep 100
    return
  } 
  NewSampleTemplate(){
    WinActivate, NuGenesis LMS - \\Remote
    click 103, 325
    return
  }
  EditSampleTemplate(){
    WinActivate, NuGenesis LMS - \\Remote
    click 70, 518
    winwaitactive, Edit sample template - \\Remote,, 5
    ; if errorlevel
      ; winactivate, Edit sample template - \\Remote
    ; return
  }
  Dropdown(){
    if winactive("Edit Ingredient")
      click 272, 67
  else
      return
  }
}