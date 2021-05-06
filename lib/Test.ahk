



StartTest(){

    ;Rotation_GetTable(1)
 ; SetTimer, SmartDocs, 10
  ;  SpecTab_Table()
  ;  Test()
 ; SpecTab_Table()
}
return

Test(){

} 


;trying tab gui window
Test_2(){
 Global 
  ;  SpecTab_TestSpecs.PasteDescription()()
  ; SpecTab_ResultEditor(MinLimit,MaxLimit,Units,Percision,1,Requirement)
  Gui, Add, Tab3,, Product|Specs
  Gui,Tab, Product
  ProductTab_Table()
  Gui,Tab, Specs
  SpecTab_Table()
 Ingredients()
 return
}
