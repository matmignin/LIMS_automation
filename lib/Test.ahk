



StartTest(){

    ;Rotation_GetTable(1)
 ; SetTimer, SmartDocs, 10
  ;  SpecTab_Table()
  ;  Test()
 ; SpecTab_Table()
}
return

Test(){
  ;DetectTab(){
global
Tab:=
CoordMode, Pixel, Window
WinActivate, NuGenesis LMS - \\Remote
  PixelSearch, FoundX, FoundY, 11, 66, 15, 72, 0xF8FBFE, 10, Fast RGB 
      If ErrorLevel  ;Product/Spec Tab?
        Tab="Product_Spec"
      If ErrorLevel = 0 ;is worktab?
        {
          PixelSearch, FoundX, FoundY, 11, 139, 15, 141, 0x54c7f2, 10, Fast RGB ;icon on left
          If ErrorLevel
            Tab:="Sample" 
          If ErrorLevel = 0
          {
            PixelSearch, FoundX, FoundY, 18, 142, 19, 143, 0xffffff, 10, Fast RGB ;icon on left
            If ErrorLevel = 0
              Tab:="Documents"
            If ErrorLevel
            Tab:="Request" 
          }        
        }
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

