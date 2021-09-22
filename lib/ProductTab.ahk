Class ProductTab {


 


Table(){
  Global
  try GUI, Ingredient_table:destroy
  CoordMode, mouse, Window
  ; CoordMode, , Screen
  ifwinnotactive, ahk_exe WFICA32.EXE 
    WinActivate, ahk_exe WFICA32.EXE
  WinGetPos, LMS_X, LMS_Y, LMS_w, LMS_h, A
  Table_height=10
  ProductTable_X:= LMS_w+LMS_X-50
  ProductTable_Y:= LMS_Y+100
  Excel.Connect()
  Name:=		 	    []
  LabelClaim:=  	[]
  Position:=		  []
  LabelName:=		  []
  DropDownCount:= []
  Sub_Table_height:=0
  If (XL.Range("A1").Value!=1){ ; old sheets
    while (Xl.Range("M" . A_Index+7).Value != "") {
      Position[A_index]     :=  Xl.Range("F" . A_Index+7).Text
      Name[A_index]         :=  Xl.Range("K" . A_Index+7).text
      LabelClaim[A_index]   :=	Xl.Range("L" . A_Index+7).Text
      LabelName[A_index]    :=	Xl.Range("M" . A_Index+7).Text
      DropDownCount[A_index]:=	Xl.Range("A" . A_Index+7).Text
      Total_rows            :=	A_index +1
      Table_Height          :=	A_index
      if (Xl.Range("F" . A_Index+7).text = "")
        Sub_Table_Height:=Sub_Table_Height+1
    }
  } 
  Else { ; new sheets
    while (Xl.Range("AK" . A_Index+7).Value != "") {
      Position[A_index]     :=  Xl.Range("AD" . A_Index+7).Text
      Name[A_index]         :=  Xl.Range("AI" . A_Index+7).text
      LabelClaim[A_index]   :=	Xl.Range("AJ" . A_Index+7).Text
      LabelName[A_index]    :=	Xl.Range("AK" . A_Index+7).Text
      DropDownCount[A_index]:=	Xl.Range("AM" . A_Index+7).Text
      Total_rows            :=	A_index +1
      Table_Height          :=	A_index
      if (Xl.Range("AD" . A_Index+7).text = "")
        Sub_Table_Height:=Sub_Table_Height+1
    }
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
  Gui,Ingredient_Table:Add,Checkbox,vAutoEnter x20 checked,Auto-Enter Results?
  LV_ModifyCol(1,50)
  LV_ModifyCol(2,180)
  LV_ModifyCol(3,100)
  LV_ModifyCol(4,2)
  LV_ModifyCol(5,2)
  sleep 100
  CoordMode,mouse,screen
  ScreenEdge_X:=A_ScreenWidth-550
  ScreenEdge_Y:=A_Screenheight-450
  try Gui,Ingredient_Table:Show,x%ProductTable_X% y%ProductTable_Y% w320,%Product% Ingredient Table
  catch Gui,Ingredient_Table:Show,x%ScreenEdge_X% y%ScreenEdge_Y% w380, %Product% Ingredient Table
  CoordMode,mouse,window
  return
}






  EditIngredient(Ingredient_Name,Ingredient_Claim,Ingredient_Position,Dropdown_count){ ;the final input window for adding ingredients
    Global
    Ingredient_Name:=Trim(Ingredient_Name,"`r`n")
    Ingredient_Claim:=Trim(Ingredient_Claim,"`r`n")
    Ingredient_position:=Trim(Ingredient_Position,"`r`n")
    ifWinnotexist, Edit Ingredient - \\Remote
    {
    WinActivate, Composition - \\Remote
    Breaking.Point()
    sleep 200
    click 57, 65 ;Mouse_Click("add_Composition")
    sleep 150
    Breaking.Point()
    this.DropdownSelect(Dropdown_count)
    ; sleep 200
    }
      Winactivate, Edit Ingredient - \\Remote
    Excel.Get_Current_row()
    sleep 150
    if winactive("Composition - \\Remote")
      return
    Send,{tab 6}^a%Ingredient_position%{tab}^a
    SendInput,%Ingredient_Name%
    sleep 100
    If Ingredient_Claim contains Heavy Metal,Allergens
    Send,{tab}
    Send,{tab 2}^a
    Send,%Ingredient_Claim%
    Sleep 200
    Current_Row:= Current_Row+1
    Breaking.Point()
    Send,{enter}
    Tooltip,
    return
    }

  DropdownSelect(A_DropdownCount){
    global
    click, 150, 73 ;click dropdown boxx
    sleep 100
    Breaking.Point()

    AbsSelection:=Abs(A_DropdownCount)
    if (A_DropdownCount > 0)
    SendInput, {tab}{home}{right %A_DropdownCount%}
    if (A_DropdownCount < 0)
    SendInput, {tab}{end}{left %AbsSelection%}
    if (A_DropdownCount = "-0")
    SendInput, {tab}{end}
    if (a_DropdownCount = "")
    this.DropDown_Ingredient()
    Breaking.Point()
    return
    }


  AddCOASpace(){
    Global
    SetWinDelay, 450
    ControlGetText, Iteration, Static1, VarBar
    ; WinActivate, Composition - \\Remote
    click
    Mouse_Save()
    click 74, 64
    sleep 200
    ifwinnotactive, Edit Ingredient - \\Remote
    WinActivate, Edit Ingredient - \\Remote
    if (Iteration > 0)
      SendInput, {Tab 7}{pgdn 2}{end}{enter}{click 283, 559}
    if (Iteration < 0)
      SendInput, {tab 7}{pgdn 2}{end}{backspace}{click 283, 559}
      sleep 200
    ifwinnotactive, Composition - \\Remote
    WinActivate, Composition - \\Remote
    send %mouseReturn%
    MouseMove, 0, 36, 0, r
    sleep 200
    return
  }


Scoops(n,TextNumber:="{backspace}",Measurment:="scoop"){
  global
   SetWinDelay, 450
  winactivate, Edit Formulation - \\Remote
  click 450, 462, 3
  Send, {click 385, 347}
  if (n=1)
    Plural:=""
  else
    Plural:="s"
  if (!color)
    Color:="PENDING"
  Send, Each %textNumber% (%n%){space}%measurment%%plural% ( g) contains{left 12}{tab 2}^{a}%color%+{tab}^{a}Blend+{tab}%weight%
  exit
}




  EditProduct(){ ;for naming Product code and customer, 
    global Product, Name, Customer, ShapeAndSize, color
    SetWinDelay, 450
    ; Excel.Connect(1)
    click 120,80 ;click product box
    SendInput,%Product%`,{space}%Name%{tab 2}%Customer%{tab 2}{right 2}{tab}{right 3}{tab}%Product%{tab 2}
    sleep 200
    SendInput,%Name%{tab 8}
    sleep 400
    winwaitactive,NuGenesis LMS - \\Remote,,16
    WinActivate, NuGenesis LMS - \\Remote
    click, 67, 283
    sleep 200
    Breaking.Point()
    This.EditFormulation()
    ; clk(287, 578) ;click save
    return
    ;setwindelay, 200
  } 

  EditFormulation(){ ;then click on Edit Formulation, puts in code, then tabs to serving size
    global Product, ShapeAndSize, color
    ; Mouse_Click("Add_Formulation")
    if !winactive("Edit Formulation - \\Remote") && winexist("Edit Formulation - \\Remote")
      winactivate, Edit Formulation - \\Remote,
    Send, {tab}%product%
      Send, {Tab 23} ;{click 268, 578}
      sleep 200
    Breaking.Point()
    if ShapeAndSize
    send, {tab}^a%ShapeAndSize%{shiftdown}{tab}{shiftup}
    ShapeAndsize:=  
    sleep 200
    If Color Contains IF(B7
      color:=
    else
      send, {tab 2}^a%Color%{shiftdown}{tab 2}{shiftup}
    sleep 200
    ; clk(287, 578) ;click save
    return
    ;setwindelay, 200
  } 

  HM_ReportOnly(){ 
  SetWinDelay, 450 ;testing out
   click 125,120 ;click 1st row
  ;  Mouse_Click("add") ;trying to eliminate mouseclick function
   clk(45, 65)
   winwaitactive, Edit Ingredient - \\Remote,,4
   SendInput,{click 150,73}{tab}{right 11} ;arsenic
   Breaking.Point()

   WinWaitClose, Edit Ingredient - \\Remote,,4
   click 125,140 ;click 2nd row
  ;  Mouse_Click("add") ;trying to eliminate mouseclick function
   clk(45, 65)
   winwaitactive, Edit Ingredient - \\Remote,,4
   SendInput,{click 150,73}{tab}{right 167} ;lead
   Breaking.Point()

   click 390, 659	;click okay
   WinWaitClose, Edit Ingredient - \\Remote,,4
   click 125,180 ;click 3rd row
  ;  Mouse_Click("add") ;trying to eliminate mouseclick function
   clk(45, 65)
   winwaitactive, Edit Ingredient - \\Remote,,4
   SendInput,{click 150,73}{tab}{right 23} ;cadmium
   Breaking.Point()

   click 390, 659	;click okay
   WinWaitClose, Edit Ingredient - \\Remote,,4
   click 125,200 ;click 4th row
  ;  Mouse_Click("add") ;trying to eliminate mouseclick function
   clk(45, 65)
   winwaitactive, Edit Ingredient - \\Remote,,4
   SendInput,{click 150,73}{tab}{right 189} ;mercury
   Breaking.Point()

   click 390, 659	;click okay
   return
  }

  DropDown_Ingredient(){
   global
    SetWinDelay, 450
  ; if (GeneralCount=2){
    ; SendInput,{tab}{Home}{right 2}{right 62}
    ; return
  ; }
   ;Menu,IngredientMenu,Add,Creatine, IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &A,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &B,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &C,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &D,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &E,IngredientMenuHandler
   Menu,IngredientMenu,Add,Generic Ingredient &F,IngredientMenuHandler
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
; tt(GeneralCount)
Click 150, 73
; if !GeneralCount
; clk(150, 73)
  ; GeneralCount=1
; tt(GeneralCount)
if (A_ThisMenuItem ="Generic Ingredient &A")
  SendInput,{tab}{Home}{right 2}{right 56}
else if (A_ThisMenuItem ="Generic Ingredient &B") || (GeneralCount=2)
  SendInput,{tab}{Home}{right 2}{right 62}
else if (A_ThisMenuItem ="Generic Ingredient &C") || (GeneralCount=3)
  SendInput,{tab}{Home}{right 2}{right 68}
else if (A_ThisMenuItem ="Generic Ingredient &D") || (GeneralCount=4)
  SendInput,{tab}{home}{right 2}{right 74}
else if (A_ThisMenuItem ="Generic Ingredient &E" || GeneralCount==5)
  SendInput,{tab}{Home}{right 2}{right 80}
else if (A_ThisMenuItem ="Generic Ingredient &F" || GeneralCount==6)
  SendInput,{tab}{Home}{right 2}{right 86}
else if (A_ThisMenuItem ="Generic Ingredient &G" || GeneralCount==7)
  SendInput,{tab}{Home}{right 2}{right 92}
else if (A_ThisMenuItem ="Generic Ingredient &H" || GeneralCount==8)
  SendInput,{tab}{Home}{right 2}{right 93}
else if (A_ThisMenuItem ="Generic Ingredient &I" || GeneralCount==9)
  SendInput,{tab}{Home}{right 2}{right 95}
else if (A_ThisMenuItem ="Generic Ingredient &J" || GeneralCount==10)
  SendInput,{tab}{Home}{right 2}{right 97}
else if (A_ThisMenuItem ="Generic Ingredient &K" || GeneralCount==11)
  SendInput,{tab}{Home}{right 2}{right 99}
else if (A_ThisMenuItem ="Generic Ingredient &L" || GeneralCount==12)
  SendInput,{tab}{Home}{right 2}{right 100}
else if (A_ThisMenuItem ="Generic Ingredient &M" || GeneralCount==13)
  SendInput,{tab}{Home}{right 2}{right 101}
else if (A_ThisMenuItem ="Generic Ingredient &N" || GeneralCount==14)
  SendInput,{tab}{Home}{right 2}{right 102}
else if (A_ThisMenuItem ="Generic Ingredient &O" || GeneralCount==15)
  SendInput,{tab}{Home}{right 2}{right 103}
else if (A_ThisMenuItem ="Generic Ingredient &P" || GeneralCount==16)
  SendInput,{tab}{Home}{right 2}{right 104}
else if (A_ThisMenuItem ="Generic Ingredient &Q" || GeneralCount==17)
  SendInput,{tab}{Home}{right 2}{right 105}
else if (A_ThisMenuItem ="Generic Ingredient &R" || GeneralCount==18)
  SendInput,{tab}{Home}{right 2}{right 106}
else if (A_ThisMenuItem ="Generic Ingredient &S" || GeneralCount==19)
  SendInput,{tab}{Home}{right 2}{right 107}
else if (A_ThisMenuItem ="Generic Ingredient &T" || GeneralCount==20)
  SendInput,{tab}{Home}{right 2}{right 108}
else if (A_ThisMenuItem ="Generic Ingredient &U" || GeneralCount==21)
  SendInput,{tab}{Home}{right 2}{right 109}
else if (A_ThisMenuItem ="Generic Ingredient &V" || GeneralCount==22)
  SendInput,{tab}{Home}{right 2}{right 110}
else if (A_ThisMenuItem ="Generic Ingredient &W" || GeneralCount==23)
  SendInput,{tab}{Home}{right 2}{right 111}
else if (A_ThisMenuItem ="Generic Ingredient &X" || GeneralCount==24)
  SendInput,{tab}{Home}{right 2}{right 112}
else if (A_ThisMenuItem ="Generic Ingredient &Y" || GeneralCount==25)
  SendInput,{tab}{Home}{right 2}{right 113}
else if (A_ThisMenuItem ="Generic Ingredient &Z" || GeneralCount==26)
  SendInput,{tab}{Home}{right 2}{right 114}
else if (A_ThisMenuItem ="Ingredient Note 1")
  SendInput,{tab}{Home}{right 2}{right 139}
else if (A_ThisMenuItem ="Ingredient Note 2")
  SendInput,{tab}{Home}{right 2}{right 141}
else if (A_ThisMenuItem ="Ingredient Note 3")
  SendInput,{tab}{Home}{right 2}{right 142}
else if (A_ThisMenuItem ="Total Probiotic")
  SendInput,{tab}{Home}{right 258}
else if (A_ThisMenuItem ="STOP")
  Reload
else
  return
; tt(GeneralCount,,0,0,2)
; GeneralCount++  
; tt(GeneralCount)
return


Ingredient_table:
  if (A_GuiEvent="DoubleClick"){
  Gui,Ingredient_Table:submit,NoHide
  Send, {space}
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
  ;setwindelay, 200
return




