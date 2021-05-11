



StartTest(){

    ;Rotation_GetTable(1)
 ; SetTimer, SmartDocs, 10
  ;  SpecTab_Table()
  ;  Test()
 ; SpecTab_Table()
}
return

Test(){
;DetectLMSTab(){
global
Tab:=
       CoordMode, Pixel, Window
    ;  PixelSearch, FoundX, FoundY, 816, 72, 820, 74, 0xffd353, 10, Fast RGB
        PixelSearch, FoundX, FoundY, 11, 139, 15, 141, 0x54c7f2, 10, Fast RGB ;icon on left
      If ErrorLevel = 0
        Tab:="Request" 
      If ErrorLevel
        ; PixelSearch, FoundX, FoundY, 740, 72, 744, 74, 0xffd353, 10, Fast RGB
            PixelSearch, FoundX, FoundY, 26, 155, 28, 158, 0x54c8f3, 10, Fast RGB ;icon on left
            If ErrorLevel = 0
                Tab:="Documents"
                If ErrorLevel
                    Tab:="Sample"
            ;    PixelSearch, FoundX, FoundY, 740, 72, 744, 74, 0xffd353, 10, Fast RGB
            ;    If ErrorLevel = 0
    msgbox, %Tab%
  return
} 
AddCanceled(){
  winactivate, Edit test (Field Configuration: F, Micro) - \\Remote  
sendinput, {click 399, 219}{end}'(Canceled'){enter}
}

Test_2(){
  Global 
  ; MouseGetPos, mx, my, mw, 
  sleep 100
  click.edit()
  WinWaitActive, Edit Ingredient, 1
  send, {Click, 382, 343}{end}{enter 2}{tab 2}{enter}
  sleep 100
  ; WinActivate, Composition - \\Remote
  ; WinWaitActive, Composition
  ; mousemove, %MX%, %MY%-25
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
  Test2:
  Autofill_SmartDoc()
    setwindelay, 450
  return
  
  
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
  