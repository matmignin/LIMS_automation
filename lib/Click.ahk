class click{
  
    SearchBar(){
      global
      if WinActive("NuGenesis LMS - \\Remote")
        send, {click 518, 89, 2}%Product%{enter}
      else if winactive("Select methods tests - \\Remote")
        click, 246,77, 2
      else if winactive("Select Methods Tests")
        click 225, 69, 2
      else
      return
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
      	winwaitactive, Edit sample template - \\Remote,, 1
          if errorlevel
          winactivate, Edit sample template - \\Remote
      return
    }
    Dropdown(){
      if winactive("Edit Ingredient")
        click 272, 67
      else
        return
    }
}