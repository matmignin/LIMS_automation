

	GuiClose:
GUI,Destroy
return

	Validated(){
		MsgBox % "All Items on Checklist Have Been Reviewd.`n`nPress Okay to being next Process."
	}


	;------------------------------------------------------------------------------
	; Checklist.ahk
	; by Casper Harkin
	;
	; This is a simple class that creates a checklist of items from a list
	; and once all checked off, will call another function.
	;
	; Class Checklist(List, ReturnFunction)
	;	List - Pass a list of items to be checked off.
	;	ReturnFunction - Pass the name (as a string) of the MenuHandler or function
	;	to call once the checklist items have been ticked and validated.
	;
	;
	; last updated 03/09/2021
	;------------------------------------------------------------------------------


	Class Checklist {

		__New(List, ReturnFunction){
			Obj := {}
			Obj.ReturnFunction := ReturnFunction
			Obj.List := List
			This.CheckListGUI(Obj)
		}

		CheckListGUI(Obj){
			Obj["Checklist"] := {}

			GUI, Color, 0xFFF7D1
			GUI, Add, Tab3,, Page 1

			Array := StrSplit(Obj.List, "`n")
				for each, item in Array {
					GUI, Add, Checkbox, Wrap y+1 wp +hwndh%each% -Theme, % item
					Obj["Checklist"]["h"each] := h%each%
					If (A_Index = 10) or (A_Index = 20) or (A_Index = 30){
						GuiControl, Text, SysTabControl321, % (A_Index = 10) ? "|Page 1|Page 2" : (A_Index = 20) ? "|Page 1|Page 2|Page 3" : (A_Index = 30) ? "|Page 1|Page 2| Page 3|Page 4" :
						GUI, Tab, % (A_Index = 10) ? "2" : (A_Index = 20) ? "3" : (A_Index = 30) ? "4" :
					}
				}

			GUI, Tab

			GUI, Add, Button, xp y+1 wp  +hwndhOkay , Okay

			MenuHandler := ObjBindMethod(this,"ValidateChecklist", Obj)
			GuiControl +g, % hOkay , % MenuHandler

			GUI, Show,, CheckList
		}

		ValidateChecklist(Obj){
			for each, item in Obj["Checklist"] {
				GuiControlGet, tick,, % item
				If (tick = 0){
					GUI, Font, cRed
					GuiControl, Font, % item
					s := 0
				}
			}

			If (s = 0)
				MsgBox % "Error: Not All Items on Checklist have been checked.`n`nMissed Items are marked red."
			Else {
				ReturnFunction := Obj.ReturnFunction
				%ReturnFunction%()
			}
		}
	}