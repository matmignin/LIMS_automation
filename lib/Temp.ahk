
; #If TempCode
;   Mbutton::    
;   send, {click 39, 611}
; 		if !winactive("Edit test (Field Configuration: ")
;     	winwaitactive, Edit test (Field Configuration: ,, 2
;     Send,{Click, 402, 284}{end}(on sample log){click, 334, 618}
;     return



; #If Winactive("Edit specification - \\Remote") && TempCode
;   ; Mbutton:: gosub, NewVersionRAE
; #If Winactive("Select methods tests - \\Remote") && TempCode
; #If Winactive("Results Definition - \\Remote") && TempCode
;     Mbutton::send, {enter}
;     numlock::gosub, AddRAE_ResultsDefinition
;     rbutton::menu.lms()  
;     ; Lbutton::
; #If mouseisover("NuGenesis LMS - \\Remote") && TempCode
;   ; NumLock::gosub, AddRAE ;Send, {Click 83, 560} ; click edit method
;   ; F20::gosub, CheckExcelRow
;   ; F15::gosub, CheckExcelRow


#if


SelectHeavyMetalTest: 
  send {click 225, 70}{click}icp-ms (chem{enter}
  sleep 200
  send, {click 506, 339}{click 846, 657} ;click it over
return

AddRAE:
  Send, {Click 58, 757} ; click Edit Results  "NuGenesis LMS - \\Remote"
  sleep 200
AddRAE_ResultsDefinition:
  send, {click 80, 66} ; Click edit Results  "Definition - \\Remote" 
  sleep 800
  send, {tab 5}mcg%A_space%rae{click 505, 568}{click 464, 547} ; tab to units and select mcg rae 284, 197 ;click scrollbar then Requirement window "Result Editor - \\Remote"
  send, {end}%a_space%RAE
  sleep 200
  send, {click 377, 649} ;click done
return
NewVersionRAE:
  ; send, {click 64, 243} ;click new version
  ; sleep 400
  send, {click 429, 184}^{a}Update All Vitamin A Units with RAE{click 338, 616} ;click description "Edit specification - \\Remote"
return	

CheckExcelRow: ;goes down a lms search and fills out a excel table depending on a pixel search
  LMSwb:=ComObjActive("Excel.Application")
  loop 8 {
  clipboard:=
  send, ^c
  clipwait, 1
  sleep 200
  send, {down}
  RT:=lmswb.ActiveSheet.Range("A:A").Find(Product).offset(0,4)
  Status:=lmswb.ActiveSheet.Range("A:A").Find(Product).offset(0,3)
  if IsPixel(1203, 899,"F3EFEA")
      RT.Value:=""
    else
      RT.Value:="RT"
    sleep 400
  }
return





#t::
Test_2: ;;Move to previous Batch in Array

  n-=1
  Haystack:=Products[n]
  whereAt:=listarray(Products)
 whereatsplit:=StrReplace(whereAt, n ": ","`t" )
pop(whereatsplit)
  RegExMatch(Haystack, "i)(?<Product>([abdefghijkl]\d{3})?).?(?<Batch>(\d{3}-\d{4})?).?(?<Lot>(\d{4}\w\d\w?|Bulk|G\d{7}\w?)?).?(Ct#)?(?<Coated>(\d{3}-\d{4})?)", s)
    if sProduct {
      Product:=sProduct
      GuiControl,Varbar:Text, Product, %sProduct%
    }
    Batch:=sBatch
    lot:=slot
    Coated:=sCoated
    GuiControl,Varbar:Text, Batch, %sBatch%
    GuiControl,Varbar:Text, lot, %slot%
    GuiControl,Varbar:Text, Coated, %sCoated%
    try XL.Sheets(sProduct).activate
    return

#h::
Test_3: ;;Move to next Batch in Array
  n+=1
  Haystack:=Products[n]
  whereAt:=listarray(Products)
  whereatsplit:=StrReplace(whereAt, n ": ","`t" )
  pop(whereatsplit)
  RegExMatch(Haystack, "i)(?<Product>([abdefghijkl]\d{3})?).?(?<Batch>(\d{3}-\d{4})?).?(?<Lot>(\d{4}\w\d\w?|Bulk|G\d{7}\w?)?).?(Ct#)?(?<Coated>(\d{3}-\d{4})?)", s)
    if sProduct {
      Product:=sProduct
      GuiControl,Varbar:Text, Product, %sProduct%
    }
    Batch:=sBatch
    lot:=slot
    Coated:=sCoated
    GuiControl,Varbar:Text, Batch, %sBatch%
    GuiControl,Varbar:Text, lot, %slot%
    GuiControl,Varbar:Text, Coated, %sCoated%
    try XL.Sheets(sProduct).activate
    return



return


return
test_1:
    Temp:=[]
     RecentProducts:=
        FileRead, LoadedNotes, RecentProducts.txt
        Temp := StrSplit(LoadedNotes,"`r`n")
		Loop % Temp.MaxIndex(){ 
      RecentProducts.=Temp[a_index]"`r`n"
    }

    sleep 200
	New Checklist(RecentProducts, ReturnFunction := "Validated")
  
return


Test_4:
Gui, Add, Checkbox, vMyCheckBoxVar gMyCheckBoxSub, Add item to do
Gui, Add, Edit, Disabled vToDoItemVar
Gui, Add, Button, gSaveSub, Save
Gui, Show

MyCheckBoxSub:
  Gui, Submit, NoHide                      ; Save all states to variables so that we can check whether the checkbox has just been checked or unchecked
  If MyCheckBoxVar                         ; If the checkbox has been checked...
    GuiControl, Enable, ToDoItemVar        ; ...enable the edit box
  Else GuiControl, Disable, ToDoItemVar    ; ...otherwise, disable the edit box
return

SaveSub:
  Gui, Submit, NoHide                      ; Save all states to variables so that we can write what is in the edit box to the INI file
  ; Add IniWrite line here and use %ToDoItemVar% as the "value" to write
return
;
Return










; Lwin & AppsKey::return ;, send, {lwin}

; Lwin Up::return ;send, {esc};,;
; Lwin:: ;MouseGesture(LeftAction:="{left}",RightAction:="{Right}")
; 		MouseGetPos, xi,yi
;       ; tt("x: " x "`ny: " y,1300,xi,yi)
;     ; pop(" ",,3000,"right")
; 		; sleep = 2
;       ; setkeydelay -1,1
;       ; SetBatchLines, 5000ms
; 		While GetKeyState("Lwin","P")
; 		{
; 			MouseGetPos, Xf,Yf
;       x:=((xf-xi)//20)
;       y:=((yf-yi)//20)
;       tt("x: " x "`ny: " y,1300,xi,yi)
;       if abs(x) < 15 && abs(y) < 15
;         continue
;       ; if (abs(x) > 20 && abs(y) > 20)
;         ; continue
;       if (abs(x) <= 15 && abs(y) >= 15){
;         if y >= 15
;           send, #{down}
;         if y <= -15
;           send, #{up}
;         ; yi:=yF
;         sleep, 1100
;         Return
;       }
;       if (abs(x) >= 15 && abs(y) <= 15){
;         if x >= 15
;           send, #{right}
;         if x <= -15
;           send, #{left}
;         ; xi:=xF      
;         sleep, 1100
;         Return
;       }
;       sleep 2000

;       ; if abs(y) < 20
;       ; if (abs(x) < 20 && abs(y) < 20){
;         ; continue
;       ; if x > 20 && abs(y) < 20 ; && y > -20
;         ; send, {right}
;       ; if x < 20 && abs(y) < 20 ; && y > -20
;         ; send, {left}
;       ;  sleep 100
;       ; sleep % abs(x) +20
;       ; sleep %n%
; 		}
; 		; if (xi>Xf){
; 			; tt("Left")
; 			; return
; 		; }
; 		; if (xi<Xf){
; 			; send % RightAction
; 			; tt("Right")
; 			; return
; 		; }
; 		return
; 	; }

  makeADropDown(inifile,Category) {
    try menu,DropdownMenu, Deleteall
    Loop, Read, %inifile% ;data\customers.ini
    {
    If A_Index = 1
      Continue
    ParseList := StrSplit(A_LoopReadLine, "=")
      ; MethodGroup := StrSplit(A_LoopReadLine, "|") ;for a 2nd split
    Selection:= % ParseList[1]
      ; Group:= % MethodGroup[2] ;for a second split
    Menu, Dropdownmenu, add, %Selection%, DropDownhandler
    }
    Menu, DropdownMenu, Show,
    return

    DropDownhandler:
      InputVar:=A_ThisMenuItem
      IniRead,vOutput, %inifile%, %Category%, %InputVar%
      Pop(Inputvar,vOutput)
      return
  }

