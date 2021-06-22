Class ProductTab {


Table(){
  Global
  try GUI, Ingredient_table:destroy
  CoordMode, mouse, Window
  ; CoordMode, , Screen
  WinActivate, ahk_exe WFICA32.EXE
  WinGetPos, LMS_X, LMS_Y, LMS_w, LMS_h, A
  ProductTable_X:= LMS_w+LMS_X-50
  ProductTable_Y:= LMS_Y+100
  Excel.Connect()
  Name:=		 	    []
  LabelClaim:=  	[]
  Position:=		  []
  LabelName:=		  []
  DropDownCount:= []
  Sub_Table_height:=0
  while (Xl.Range("M" . A_Index+7).Value != "") {
    Position[A_index]:=		Xl.Range("F" . A_Index+7).Text
    Name[A_index]:=		 	Xl.Range("K" . A_Index+7).text
    LabelClaim[A_index]:=	Xl.Range("L" . A_Index+7).Text
    LabelName[A_index]:=	Xl.Range("M" . A_Index+7).Text
    DropDownCount[A_index]:=	Xl.Range("A" . A_Index+7).Text
    Total_rows:=		  	A_index +1
    Table_Height:=		 	A_index
    if (Xl.Range("F" . A_Index+7).text = "")
      Sub_Table_Height:=Sub_Table_Height+1
  }
  Table_Height:=Table_height-Sub_table_Height
  Gui,Ingredient_Table:Default
  Gui,Ingredient_Table:+LastFound +ToolWindow +Owner +AlwaysOnTop ;-SysMenu
  GUI,Ingredient_Table:Font,s10 cBlack arial ;Consolas
  Gui,Ingredient_Table:Add,ListView,x0 y0 r%Table_height% W400 Grid NoSortHdr -hdr checked gIngredient_Table, Position|Name|LabelClaim|LabelName|DropdownCount
  loop,%Total_Rows% {
    if Position[A_index] =""
    {
      Total_rows:=total_rows - 1
      continue
    }
    else
      LV_Insert(A_index,"",Position[A_index],Name[A_index],LabelClaim[A_index],LabelName[A_index],DropDownCount[A_index])
  }
  Gui,Ingredient_Table:Add,Checkbox,vAutoEnter x20,Auto-Enter Results?
  LV_ModifyCol(1,50)
  LV_ModifyCol(2,180)
  LV_ModifyCol(3,100)
  LV_ModifyCol(4,0)
  LV_ModifyCol(5,0)
  sleep 100
  CoordMode,mouse,screen
  Gui,Ingredient_Table:Show,x%ProductTable_X% y%ProductTable_Y% w320,%Product%
  CoordMode,mouse,window
  return
}




DropdownSelect(A_DropdownCount){
 global
  ; if Winactive("Duplicate ingredient ID - \\Remote") || winactive("Warning - \\Remote") || winactive("Composition - \\Remote")
  ; {
   ; exit
   ; return
  ; }
 click, 150, 73
 sleep 300
 ;tooltip, %Ingredient_Name%
 AbsSelection:=Abs(A_DropdownCount)
 if (A_DropdownCount > 0)
  sendinput, {tab}{home}{right %A_DropdownCount%}
 if (A_DropdownCount < 0)
  Sendinput, {tab}{end}{left %AbsSelection%}
 if (A_DropdownCount = "-0")
  Sendinput, {tab}{end}
 if (a_DropdownCount = "")
  ProductTab.DropDown_Ingredient()
  sleep 200
  return
 }

EditIngredient(Ingredient_Name,Ingredient_Claim,Ingredient_Position,Dropdown_count){
 Global
 Excel.Get_Current_row()
 Ingredient_Name:=Trim(Ingredient_Name,"`r`n")
 Ingredient_Claim:=Trim(Ingredient_Claim,"`r`n")
 Ingredient_position:=Trim(Ingredient_Position,"`r`n")
 ifWinnotexist, Edit Ingredient - \\Remote
 {
  WinActivate,Composition - \\Remote
  Mouse_Click("add_Composition")
  sleep 200
  ProductTab.DropdownSelect(Dropdown_count)
  ; ProductTab.Select_Ingredient()
 ; tooltip, %Ingredient_Name%
 }
 if Winexist("Edit Ingredient - \\Remote")
 {
  Winactivate,
 }
 sleep 200
 send,{tab 6}^a%Ingredient_position%{tab}^a
 Sendinput,%Ingredient_Name%
 sleep 100
 If Ingredient_Claim contains Heavy Metal,Allergens
  send,{tab}
 send,{tab 2}^a
 send,%Ingredient_Claim%
 Sleep 400
 Current_Row:= Current_Row+1
 send,{enter}
 Tooltip,
return
}




Scoops(n,TextNumber:="{backspace}",Measurment:="scoop"){
  global
  winactivate, Edit Formulation - \\Remote
  click 450, 462, 3
  send, {click 385, 347}
  if (n=1)
    Plural:=""
  else
    Plural:="s"
  if (!color)
    Color:="PENDING"
  send, Each %textNumber% (%n%){space}%measurment%%plural% ( g) contains{left 12}{tab 2}^{a}%color%+{tab}^{a}Blend+{tab}%weight%
  exit
}




EditProduct(){
   global
   Excel.Connect()
   click 120,80 ;click product box
   Sendinput,%Product%`,{space}%Name%{tab 2}%Customer%{tab 2}{right 2}{tab}{right 3}{tab}%Product%{tab 2}
   sleep 200
   sendinput,%Name%{tab 8}
   sleep 400
   winwaitactive,NuGenesis LMS - \\Remote,,10
   WinActivate, NuGenesis LMS - \\Remote
   click, 67, 283
   sleep 200
   ; Mouse_Click("Add_Formulation")
   winactivate, Edit Formulation - \\Remote,
   send, {tab}%product%
			sendinput, {Tab 23}
   return
  }
  HM_ReportOnly(){ ;testing out
   click 125,120 ;click 1st row
   Mouse_Click("add")
   winwaitactive, Edit Ingredient - \\Remote,,4
   Sendinput,{click 150,73}{tab}{right 11} ;arsenic

   WinWaitClose, Edit Ingredient - \\Remote,,4
   click 125,140 ;click 2nd row
   Mouse_Click("add")
   winwaitactive, Edit Ingredient - \\Remote,,4
   Sendinput,{click 150,73}{tab}{right 167} ;lead

   click 390, 659	;click okay
   WinWaitClose, Edit Ingredient - \\Remote,,4
   click 125,180 ;click 3rd row
   Mouse_Click("add")
   winwaitactive, Edit Ingredient - \\Remote,,4
   Sendinput,{click 150,73}{tab}{right 23} ;cadmium

   click 390, 659	;click okay
   WinWaitClose, Edit Ingredient - \\Remote,,4
   click 125,200 ;click 4th row
   Mouse_Click("add")
   winwaitactive, Edit Ingredient - \\Remote,,4
   Sendinput,{click 150,73}{tab}{right 189} ;mercury

   click 390, 659	;click okay
   return
  }

  DropDown_Ingredient(){
   global
   ;Menu,IngredientMenu,Add,Creatine, IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &A.1,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &B.1,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &C.1,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &D.1,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &E.1,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &F.1,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &G,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &H,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &I,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &J,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &K,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &L,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &M,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &N,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &O,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &P,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &Q,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &R,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &S,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &T,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &U,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &V,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &W,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &X,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &Y,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &Z,IngredientMenuHandler
   ; Menu,IngredientMenu,Add,Glucosamine,IngredientMenuHandler
   Menu,IngredientMenu,Add,Ingredient Note 1,IngredientMenuHandler
   Menu,IngredientMenu,Add,Ingredient Note 2,IngredientMenuHandler
   Menu,IngredientMenu,Add,Ingredient Note 3,IngredientMenuHandler
   Menu,IngredientMenu,Add,Methylsulfonylmethane (MSM),IngredientMenuHandler
   ; Menu,IngredientMenu,Add,Molybdenum,IngredientMenuHandler
   ;Menu,IngredientMenu,Add,PABA,IngredientMenuHandler
   Menu,IngredientMenu,Add,Protein,IngredientMenuHandler
   ; Menu,IngredientMenu,Add,Quercetin Dihydrate,IngredientMenuHandler
   ; Menu,IngredientMenu,Add,Taurine,IngredientMenuHandler
   Menu,IngredientMenu,Add,Total Probiotic,IngredientMenuHandler
   Menu,IngredientMenu,Add,STOP,IngredientMenuHandler
   Menu,IngredientMenu,Show,
   return
  }


}






   IngredientMenuHandler:
   Click 150, 73
   ; click, 150, 73
    if (A_ThisMenuItem ="Generic Ingredient &A.1")
     Sendinput,{tab}{Home}{right 2}{right 56}
    else if (A_ThisMenuItem ="Generic Ingredient &B.1")
     Sendinput,{tab}{Home}{right 2}{right 62}
    else if (A_ThisMenuItem ="Generic Ingredient &C.1")
     Sendinput,{tab}{Home}{right 2}{right 68}
    else if (A_ThisMenuItem ="Generic Ingredient &D.1")
     Sendinput,{tab}{home}{right 2}{right 74}
    else if (A_ThisMenuItem ="Generic Ingredient &E.1")
     Sendinput,{tab}{Home}{right 2}{right 80}
    else if (A_ThisMenuItem ="Generic Ingredient &F.1")
     Sendinput,{tab}{Home}{right 2}{right 86}
    else if (A_ThisMenuItem ="Generic Ingredient &G")
     Sendinput,{tab}{Home}{right 2}{right 92}
    else if (A_ThisMenuItem ="Generic Ingredient &H")
     Sendinput,{tab}{Home}{right 2}{right 94}
    else if (A_ThisMenuItem ="Generic Ingredient &I")
     Sendinput,{tab}{Home}{right 2}{right 95}
    else if (A_ThisMenuItem ="Generic Ingredient &J")
     Sendinput,{tab}{Home}{right 2}{right 97}
    else if (A_ThisMenuItem ="Generic Ingredient &K")
     Sendinput,{tab}{Home}{right 2}{right 99}
    else if (A_ThisMenuItem ="Generic Ingredient &L")
     Sendinput,{tab}{Home}{right 2}{right 100}
    else if (A_ThisMenuItem ="Generic Ingredient &M")
     Sendinput,{tab}{Home}{right 2}{right 101}
    else if (A_ThisMenuItem ="Generic Ingredient &N")
     Sendinput,{tab}{Home}{right 2}{right 102}
    else if (A_ThisMenuItem ="Generic Ingredient &O")
     Sendinput,{tab}{Home}{right 2}{right 103}
    else if (A_ThisMenuItem ="Generic Ingredient &P")
     Sendinput,{tab}{Home}{right 2}{right 104}
    else if (A_ThisMenuItem ="Generic Ingredient &Q")
     Sendinput,{tab}{Home}{right 2}{right 105}
    else if (A_ThisMenuItem ="Generic Ingredient &R")
     Sendinput,{tab}{Home}{right 2}{right 106}
    else if (A_ThisMenuItem ="Generic Ingredient &S")
     Sendinput,{tab}{Home}{right 2}{right 107}
    else if (A_ThisMenuItem ="Generic Ingredient &T")
     Sendinput,{tab}{Home}{right 2}{right 108}
    else if (A_ThisMenuItem ="Generic Ingredient &U")
     Sendinput,{tab}{Home}{right 2}{right 109}
    else if (A_ThisMenuItem ="Generic Ingredient &V")
     Sendinput,{tab}{Home}{right 2}{right 110}
    else if (A_ThisMenuItem ="Generic Ingredient &W")
     Sendinput,{tab}{Home}{right 2}{right 111}
    else if (A_ThisMenuItem ="Generic Ingredient &X")
     Sendinput,{tab}{Home}{right 2}{right 112}
    else if (A_ThisMenuItem ="Generic Ingredient &Y")
     Sendinput,{tab}{Home}{right 2}{right 113}
    else if (A_ThisMenuItem ="Generic Ingredient &Z")
     Sendinput,{tab}{Home}{right 2}{right 114}
    else if (A_ThisMenuItem ="Ingredient Note 1")
     Sendinput,{tab}{Home}{right 2}{right 139}
    else if (A_ThisMenuItem ="Ingredient Note 2")
     Sendinput,{tab}{Home}{right 2}{right 141}
    else if (A_ThisMenuItem ="Ingredient Note 3")
     Sendinput,{tab}{Home}{right 2}{right 142}
    else if (A_ThisMenuItem ="Total Probiotic")
     Sendinput,{tab}{Home}{right 258}
    else if (A_ThisMenuItem ="STOP")
     Reload
    else
     return
   return


Ingredient_table:
  if (A_GuiEvent="DoubleClick"){
  Gui,Ingredient_Table:submit,NoHide
  send, {space}
  Rows_left:=((LV_GetCount()-A_EventInfo)*Autoenter)+1
  Current_Row:=A_EventInfo
  Loop % Rows_left {
    Excel.Get_Current_row()
    ProductTab.EditIngredient(LabelName,LabelClaim,Position,DropdownCount)
    if Winactive("Duplicate ingredient ID - \\Remote") || Winactive("NuGenesis LMS - \\Remote") || WinActive("Edit Formulation - \\Remote") || winactive("Warning - \\Remote")
    break
    sleep 300
  }
} 
return

Ingredient_TableGuiClose:
sleep 100
 GUI,Ingredient_Table:destroy
return

Formulation_Hotstrings:
 #IfWinActive,ahk_exe WFICA32.EXE
  :*R:#00\::`#00 capsule / 0.917`" x 0.336`"
  :*R:#00e\::`#00 elongated capsule / 0.995`" x 0.336`"
  :*R:#3\::`#3 capsule / 0.626`" x 0.229`"
  :*R:#2\::`#2 capsule / 0.709`" x 0.250`"
  :*R:#1\::`#1 capsule / 0.765`" x 0.272`"
  :*R:#0\::`#0 capsule / 0.854`" x 0.300`"
  :*R:USP\::Meets USP Requirements
  :*R:fr\::Fixing Rotation
  :*R:?\::?Kilgore7744
  :*R:7/16\::`Round / 0.4375`"
  :*R:5.5 oblong\::Oblong / 0.750`" x 0.313`"
  :*R:5.5 oval\::Oval / 0.625`" x 0.344`""
  :*R:5 oblong\::Oblong / 0.750`" x 0.250`""
  :*:1\::`Each (1){space} contains {ctrl down}{left}{ctrl up}{left}
  :*:2\::`Each two (2){space} contains {ctrl down}{left}{ctrl up}{left}
  :*:3\::`Each three (3){space} contains {ctrl down}{left}{ctrl up}{left}
  :*:4\::`Each four (4){space} contains {ctrl down}{left}{ctrl up}{left}
  :*:5\::`Each five (5){space} contains {ctrl down}{left}{ctrl up}{left}
  :*:6\::`Each six (6){space} contains {ctrl down}{left}{ctrl up}{left}
  :*:7\::`Each seven (7){space} contains {ctrl down}{left}{ctrl up}{left}
  :*:NMT30::`NMT 30 Minutes
  :*:NMT5::`NMT 5 mcg/day
  :*:NMT15::`NMT 15 mcg/day
  :*:H\::Heavy Metals `*
  :*:*H::`* Heavy Metals results are based on a daily dose of (1) capsule{ctrl down}{left}{left}{ctrl up}{right}
  ;}
  :*:stick\::stick packet ( g){left 3}{tab}Blend+{tab}
  :*:1scoop\::
  ProductTab.Scoops(1)
  :*:2scoops::
  ProductTab.Scoops(2,"two")
  :*:3scoops::
  ProductTab.Scoops(3,"three")
  :*:4scoops::
  ProductTab.Scoops(4,"four")
  :*:5scoops::
  ProductTab.Scoops(5,"five")
  :*:6scoops::
  ProductTab.Scoops(6,"six")
  :*:1stick::
  ProductTab.Scoops(1,,"stick packet")
  :*:2sticks::
  ProductTab.Scoops(2,"two","stick packet")
  return


