StartTest_1(){
    if winexist("Result Editor - \\Remote") || Winexist("Test Definition Editor - \\Remote") || winexist("Results Definition - \\Remote")
    {
      WinActivate
      SpecTab_Table()
    }
    if WinExist("Composition - \\Remote") || Winexist("Edit Ingredient - \\Remote")
    {
      WinActivate
      ProductTab_Table()
    }
      else
    return
  }
  return


;------------------------------------------------------TEST 1------------------------------------------------------------

Test_1(){
global
lms.SearchBar(Product)
return
}
;------------------------------------------------------TEST 2------------------------------------------------------------

Test_2(){
  Global
WindowInfo()
return    
}
;------------------------------------------------------TEST 3------------------------------------------------------------

Test_3(){
global
Varbar.Follow()
send % wX ", " wY ", " wW ", " wH ", "


return
}

















Test_4(){
}

AddCanceled(){
  winactivate, Edit test (Field Configuration: F, Micro) - \\Remote  
sendinput, {click 399, 219}{end}'(Canceled'){enter}
}

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
  
  

  Autofill_SmartDoc()
    setwindelay, 450
  return
  
  
  ToggleFilter_Test_1(){
    WinActivate, NuGenesis LMS - \\Remote
    click 489, 836, R
    sendinput, {down 2}{enter}
  }
  
  FilterSearch_Test(TestName:="", MethodName:=""){
    WinActivate, NuGenesis LMS - \\Remote
    click 1230, 648 ;click name Divider
    send, ^a%TestName%{enter}
    click 1067, 647 ; click method ID Divider
    send, ^a%MethodName%{enter}{tab 4}
  }
  
  return
  