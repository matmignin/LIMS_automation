



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
;trying tab gui window
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
