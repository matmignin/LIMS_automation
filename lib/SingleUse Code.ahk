
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







Paste_Screenshot:
	sleep 200
	SendInput, +^{4}
	sleep 200
	KeyWait, LButton, d
	MouseClick, left,,, 1, 0, D
	; sleep 200
	KeyWait, LButton,
	; sleep 200
	sleep 200
	KeyWait, F20,
	MouseClick, left,,, 1, 0, u
	Send,{enter}
	sleep 200 ;screenshot"}
	WinActivate, %mwin%
	sleep 200
	; CLICK, %Mx%, %My%
	Send, ^v
	return



Delete_a_file_if_its_old:
    Filegettime, filetime, data\CurrentCodes.txt
    TimeSince:= A_Now - FileTime
    if TimeSince >  50000
      FileDelete, data\CurrentCodes.txt