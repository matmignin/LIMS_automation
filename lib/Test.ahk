
#ifwinactive,


return





	MouseGesture(Leftaction:="",Rightaction:=""){
		global
		MouseGetPos, xi,yi
		sleep =
		While GetKeyState(A_ThisHotkey,"P")
		{
			MouseGetPos, Xf,Yf
		}
		if (xi>Xf){
			send % leftaction
			tt("Left")
			return
		}
		if (xi<Xf){
			send % Rightaction
			tt("Right")
			return
		}
		return
	}



return


; 	F20 & Space::  ;; Testing Backcycle
; 	If !activewindowID
; 		winGet, activewindowID, ID, A
; 	cyclebackward:=1
; 	PreviousClipCycleCounter:=0 ; 13/10/2017 test
; 	ClipCycleCounter:=1
; 	ClipCycleFirst:=1
; 	While GetKeyState("F20","D") and cyclebackward
; 	{
; 		If (ClipCycleCounter <> 0)
; 		{
; 			; Var:=Product[%ClipCycleCounter%]
; 			Var:=Products[ClipCycleCounter]
; 			TT(Var,1000,,,,250,"C")
; 			; Gui, History:+AlwaysOnTop +Disabled -SysMenu +Owner  ; +Owner avoids a taskbar button.
; 			; Gui, History:Add, Text,, %Var%
; 			; Gui, History:Show, Noactivate, var
; 			; ttext:=% DispToolTipText(Var)
; 		}
; 		else
; 			ttext:="[cancelled]"
; 		If (oldttext <> ttext)
; 		{
; 			ToolTip, % ttext,A_CaretX, A_CaretY,
; 			oldttext:=ttext
; 		}
; 		Sleep 50
; 		KeyWait, Space,
; 	}
; 	Gui, History:Destroy
; 	If (ClipCycleCounter > 0) ; If zero we've cancelled it
; 	{
; 		Gosub, ClipboardHandler
; 		ClipCycleCounter:=1
; 	}
; Return

; F20 & Space up::
; 	PreviousClipCycleCounter:=ClipCycleCounter
; 	If (ClipCycleFirst = 0)
; 		ClipCycleCounter++
; 	ClipCycleFirst:=0
; Return
; ClipBoardHandler2:
; 	oldttext:="", ttext:="", activewindowID:=""
; 	If (Var <> Clipboard)
; 	{
; 		StrReplace(ClipText,"`n", "`n", Count)
; 	}
; 	Clipboard:=Var
; 	;  StartTime:=A_TickCount
; 	;  If ((StartTime - PasteTime) < 75) ; to prevent double paste after using #f/#v in combination
; 	; Return
; 	;  winactivate, ahk_id %activewindowID%
; 	; Sleep, 20
; 	send % BlockRepeat(25) "^v"
; 	; Send, ^v
; 	;  PasteTime := A_TickCount
; 	oldttext:="", ttext:="", activewindowID:="",ClipboardOwnerProcessName:=""
; 	; sleep 300
; Return

` & t::FloVar(0,1,8)
` & Space::FloVar()
	; Product:=[]
	; Batch:=[]
	; Lot:=[]

	; loop 4 {
	; 	temp:=Product A_Index
	; 	Iniread, Temp, Settings.ini, SavedVariables, Temp
	; 	 if hasValue(Product, Temp) ;check to see if duplicate value from list
	; 	continue
	; 	Product.Push(Temp)
	; 	msgbox % Product[A_index]
	;  iniwrite, %Temp%, Settings.ini, Products, Product
		; iniwrite, K111, Settings.ini, Products, Product1
		; iniwrite, K222, Settings.ini, Products, Product2
		; iniwrite, K333, Settings.ini, Products, Product3
		; iniwrite, K444, Settings.ini, Products, Product4
	; }
return



Test(n){
	global
		gosub, test_%n%
		; Catch e
			; msgbox % e.line "`n" e.error
return
}

return

; Gui, Add, Text, x10 y12, Load file.
; Gui, Add, Button, x10 y30 w90 h20 gloadfile, Open File
; Gui, Show, w300 h300,TEST

; #ifwinactive
; 	DispToolTipText(TextIn,Format=0)
; {
; 	TextOut:=RegExReplace(TextIn,"^\s*")
; 	TextOut:=SubStr(TextOut,1,750)
; 	;StringReplace,TextOut,TextOut,`;,``;,All
; 	FormatFunc:=StrReplace(CyclePlugins[Format]," ")
; 	If IsFunc(FormatFunc)
; 		TextOut:=%FormatFunc%(TextOut)
; Return TextOut
; }



;; 	lms.dettesting individual regex------------------------------------------------------------------------
;------------------------------------------------------TEST 1------------------------------------------------------------
return
Test_1(){
	global
	clipboard:=
	Send, ^c
	clipwait, 1
	; SplitLMSSample(){
	RowSplit:=[]
	ParsedSample:=[]
	RowSplit:= strsplit(Clipboard,"`n")
	row2:=RowSplit[2]
	Loop, parse, Row2, `t
		ParsedSample.insert(A_LoopField)
	msgbox % "Product:" ParsedSample[1] "`n|Batch| " ParsedSample[2] "`n|PkgLot| " ParsedSample[3] "`n|Coated| " ParsedSample[4] "`n|Blister|" ParsedSample[5] "`n|ShipTo| " ParsedSample[8] "`n||`n" ParsedSample[6]
return
}

;; 	parcing a data file and setting to an array---------------------------------------------------------------
;------------------------------------------------------TEST 2 ------------------------------------------------------------
Test_2(){
	global
	Gui, Add, Text, x10 y12, Load file.
	Gui, Add, Button, x10 y30 w90 h20 gloadfile, Open File
	Gui, Show, w300 h300,TEST
	Products:=[]
return
GuiClose2:
; Gui,Destroy
return
loadfile:
	FileSelectFile, eFile, 3, , Open the file, All FIles (*.*) ;* ; *.html; *.csv)
	fileread,contents,%eFile%
	RegExReplace(contents,"\n","",totalLines) ;match the number of new line character
	totalLines++ ;always 1 short
	loop,parse,contents,`n
	{
		Counter := 0 ; COUNTER IS ZEROED SO THAT THE RESULT IS AN OFFSET OF CURRENT LINE (ERASE ANY OFFSETS OF PAST LINES)
		CURRENT_LINE := A_LoopField
		While, OutputVar := RegExMatch(CURRENT_LINE,"i)[abdefghijkl]\d{3}\b",Product)
		{
			Counter += OutputVar ; COUNTER IS INCREMENTED SO THAT IN A LINE WITH MULTIPLE RESULTS, THE MSGBOX OFFSETS THE CORRECT POSITION.
			; MsgBox, %Counter% & %Product%
			StringTrimLeft, CURRENT_LINE, CURRENT_LINE, %OutputVar%
			sleep 50
			Products.insert(CURRENT_LINE) ; add to products array
			msgbox % Listarray(products)
		}
	}
return

}

;------------------------------------------------------TEST 3----------------------------------------------------------
;;	 remove duplicates from text file-------------------------------
;------------------------------------------------------------------------------------------------------------------------

;Test_3:
Test_3(File:="C:\Users\mmignin\Documents\VQuest\lib\Data\CurrentCodes.txt"){
	; Remove_Duplicates(File:="C:\Users\mmignin\Documents\VQuest\lib\data\Products.txt")
	FileRead, OutputVar, data\CurrentCodes.txt
	Sort, OutputVar, u CL
	; NewOutputVar := RegExReplace( OutputVar , "m`a)(^\s+)|(\s+$)")
	FileDelete, data\CurrentCodes.txt
	sleep, 300
	FileAppend, %OutputVar%, data\CurrentCodes.txt

}

; Loop
; {
; 	Sleep, 1
; 	GetKeyState, KeyState, Numbpadadd, D
; 	if KeyState = D

; 			break
; }
; MouseGetPos, ContactNamePosX, ContactNamePosy
; Send {ctrl up}{LButton up}
;	}



/*

~Numlock:: ;Clipchain_v()
MouseGetPos, xx
TimeButtondown = %A_TickCount%
; Wait for it to be released
Loop
{
   Sleep 10
   GetKeyState, LButtonState, Numlock, P
  ;  if NumlockState = U  ; Button has been released.
  ;  {
      ; If winactive("Crimson Editor") and (xx < 25) ; Single Click in the Selection Area of CE
      ; {
      ;    Send, ^c
      ;    return
      ;    return
      ; }
      ; break
  ;  }
   elapsed = %A_TickCount%
   elapsed -= %TimeButtondown%
   if elapsed > 200  ; Button was held down too long, so assume it's not a double-click.
   {
      MouseGetPos x0, y0            ; save start mouse position
      Loop
   {
     Sleep 20                    ; yield time to others
     GetKeyState, keystate, Numlock
     IfEqual keystate, U, {
       MouseGetPos x, y          ; position when button released
       break
     }
   }
   if (x-x0 > 5 or x-x0 < -5 or y-y0 > 5 or y-y0 < -5)
   {                             ; mouse has moved
      ; clip0 := ClipBoardAll      ; save old clipboard
      ;ClipBoard =
      ; Send ^c
			                    ; selection -> clipboard
      ClipWait 1, 1              ; restore clipboard if no data
      IfEqual ClipBoard,, SetEnv ClipBoard, %clip0%
   }
      return
   }
}
; Otherwise, button was released quickly enough.  Wait to see if it's a double-click:
TimeButtonup = %A_TickCount%
Loop
{
   Sleep 10
   GetKeyState, NumlockState, Numlock, P
   if NumlockState = D  ; Button has been pressed down again.
      break
   elapsed = %A_TickCount%
   elapsed -= %TimeButtonup%
   if elapsed > 350  ; No click has occurred within the allowed time, so assume it's not a double-click.
      return
}

;Button pressed down again, it's at least a double-click
TimeButtonup2 = %A_TickCount%
Loop
{
   Sleep 10
   GetKeyState, NumlockState2, Numlock, P
   if NumlockState2 = U  ; Button has been released a 2nd time, let's see if it's a tripple-click.
      break
}
;Button released a 2nd time
TimeButtonup3 = %A_TickCount%
Loop
; GetKeyState, OutputVar, WhichKey [, Mode (P|T)]
{
   Sleep 10
   GetKeyState, NumlockState3, Numlock, P
   if numlockState3 = D  ; Button has been pressed down a 3rd time.
      break
   elapsed = %A_TickCount%
   elapsed -= %TimeButtonup%
   if elapsed > 350  ; No click has occurred within the allowed time, so assume it's not a tripple-click.
   {  ;Double-click
      Send, ^c
      return
   }
}
;Tripple-click:
   Sleep, 100
   Send, ^c
return

HasValue2(item, list, del:=","){ ;detect duplicate in array
	haystack:=del
	if !IsObject(list)
		haystack.= list del
	else
		for k,v in list
			haystack.= v del
	Return !!InStr(del haystack del, del item del)
}

return
;------------------------------------------------------------------------------------------------------------------------
;---------------------------TEST 3 -----------------------------------------------------------------
;------------------------------------------------------------------------------------------------------------------------

Test_3(Code:=""){
Global

}

/*
; winGetTitle, the_winTitle, A
; 	caret_x:=A_CaretX
; 	caret_y:=A_Carety
; 	clipboard:=
; tt(Caret_x ", " caret_y,5000,Caret_x,caret_y,2)
; keywait, Lbutton, d
; MouseClick, left,,, 1, 0, D
; 				keywait, Lbutton, U
; 				MouseClick, left,,, 1, 0, U
; 				Send, ^c
; 				clipwait, 0.8
; 	sleep 200
; 	winactivate, %The_wintitle%
; 	; click, %caret_X%, %caret_y%
; 	Send, {click, %caret_x%, %caret_y%}^{v}


ClipHandler:
oldttext:="", ttext:="", activewindowID:=""
If (ClipText <> Clipboard)
	{
	 StrReplace(ClipText,"`n", "`n", Count)
		IconExe:="res\" iconT
	 History.Insert(1,{"text":ClipText,"icon": IconExe,"lines": Count+1})
	}
OnClipboardChange("clipFuncOnClipboardChange", 0)
Clipboard:=ClipText
OnClipboardChange("ClipFuncOnClipboardChange", 1)
PasteIt()
Gosub, CheckHistory
MenuItemPos:=0
Return

ClipFuncOnClipboardChange() {
 global

; The built-in variable A_EventInfo contains:
; 0 if @the clipboard is now empty;
; 1 if it contains something that can be expressed as text (this includes files copied from an Explorer window);
; 2 if it contains something entirely non-text such as a picture.

If (A_EventInfo <> 1)
	Return

;ProcesshWnd:=DllCall("GetClipboardOwner", Ptr) ; may not work for all Executables
winGet, ClipboardOwnerProcessName, ProcessName, % "ahk_id " DllCall("GetClipboardOwner", Ptr)

If (ClipboardOwnerProcessName = "")
	winGet, ClipboardOwnerProcessName, ProcessName, A

StringLower, ClipboardOwnerProcessName, ClipboardOwnerProcessName ; just in case process has mixed case "KeePass.exe" - Exclude is set to lowercase after IniRead (lib\settings.ahk)

if ClipboardOwnerProcessName in %Exclude%
	{
	 ClipboardOwnerProcessName:="",ClipboardPrivate:=1
	 Return
	}
else
	ClipboardOwnerProcessName:="", ClipboardPrivate:=0

If CopyDelay
	Sleep % CopyDelay

winGet, IconExe, ProcessPath , A
If ((History.MaxIndex() = 0) or (History.MaxIndex() = "")) ; just make sure we have the History Object and add "some" text
	History.Insert(1,{"text":"Text","icon": IconExe,"lines": 1})

History_Save:=1

; Skipping Excel.exe +
; Skipping CF_METAFILEPICT avoids "This picture is too large and will be truncated" error MsgBox in Excel it seems
; this allows the various formats to be stored (temporarily) so we can paste the formatted text which may have been changed by AutoReplace - this avoids the need to turn AR on/off to get something to paste
If !winactive("ahk_exe excel.exe")
	{
	 If (hk_BypassAutoReplace <> "")
		{
		 ClipboardByPass:=ClipboardAll
		}
	}
else ; Excel is active; check CF_METAFILEPICT, if not present we can safely store ClipboardAll
	If (DllCall("IsClipboardFormatAvailable", "Uint", 3) = 0)
		ClipboardByPass:=ClipboardAll

if (Clipboard = "") ; or (ScriptClipClipChain = 1) ; avoid empty entries or changes made by script which you don't want to keep
	Return
If (Clipboard == History[1].text) ; v1.95
	{
	 ClipText:=""
	 Return
	}
ClipText=%Clipboard%
StrReplace(ClipText, "`n", "`n", Count)
History.Insert(1,{"text":ClipText,"icon": IconExe,"lines": Count+1})
Gosub, clipCheckHistory
stats.copieditems++
ClipText:=""
Return
}

ClipCheckHistory: ; check for duplicate entries
 newhistory:=[]

for k, v in History
	{
	 check:=v.text
	 icon:=v.icon
	 lines:=v.lines
	 new:=true
	 for p, q in newhistory
		{
		 if (check == q.text)
			{
			 new:=false
			}
		}
	 if new
		newhistory.push({"text":check,"icon":icon,"lines":lines})
	 if (A_Index >= MaxHistory)
		break
	}
History:=newhistory
check:="", new:="", icon:="", lines:=""
newhistory:=[]
Return

*/

; Loop, Read, Batch.Txt

; 	; If A_Index = 1
; 		; Continue
; 	Batches := StrSplit(A_LoopReadLine, "`n")
; ; loop, read, Batch.txt
; 	; loop, parse, A_LoopReadLine,
; 		; Batches.insert(A_LoopField)

; 		Msgbox % Batches[0]

;; 	 grep all the product codes out of a file and add them to an array without duplicates
/*
products:=[]
	fileread, ProductList, Settings.ini ;read the Settings.ini file
pos=0
while pos := RegexMatch(productlist, "i)[abdefghijkl]\d{3}", var, pos+1) { ;fine each regex match in the ini file
								if hasValue(Products, Var) ;check to see if duplicate value from list
									continue
								Products.insert(var) ; add to products array
}
msgbox % listarray(products)
return
*/

; ; 	; }
; CreateDDL(){
; 	global CurrentCodeDDL, CurrentCodes
; 	CurrentCode:=[]
; 	FileRead, CurrentCodes, CurrentCodes.txt
; 	CurrentCode := StrSplit(CurrentCodes,a_space)
; 	CurrentCodesDDL:=CurrentCode[1]
; 	loop % CurrentCode.maxindex(){
; 		if A_Index:=1
; 			continue
; 		CurrenwtCodesDDL.="|" CurrentCode[A_index]
; 		}
; 	Return CurrentCode
; }
/*
	Class Notes{
		Show(){  ;array - remove duplicates (case insensitive)
			global
			try, GUI, Notes:destroy
			Iniread, Notes_X, Settings.ini, Locations, Notes_X
			Iniread, Notes_Y, Settings.ini, Locations, Notes_Y
			my_screenwidth:=Notes_x
			my_screenheight:=Notes_y
			MyArray:=[]
			FileRead, LoadedNotes, lib/Notes.txt
			MyArray := StrSplit(LoadedNotes,"`r`n")
			; loop % myarray.maxindex() {
				; LoadedNotes1:=MyArray[A_index]
			; }
			LoadedNotes1:=MyArray[1]
			LoadedNotes2:=MyArray[2]
			LoadedNotes3:=MyArray[3]
			; LoadedNotes4:=MyArray[4]
			; LoadedNotes5:=MyArray[5]
			; LoadedNotes8:=MyArray[8]
			; LoadedNotes6:=MyArray[6]
			; LoadedNotes7:=MyArray[7]
			gui Notes:+LastFound +AlwaysOnTop -Caption -Toolwindow +owner
			gui, Notes:add, button, Hidden default gNotesButtonOK, OK
			gui, Notes:add, edit, y2 x2 w140 -Choose -VScroll +resize vMyEdit1, %LoadedNotes1%
			; gui, Notes:add, edit, w140 -Choose -VScroll +resize vMyedit2, %LoadedNotes2%
			; gui, Notes:add, edit, w140 -Choose -VScroll +resize vMyedit3, %LoadedNotes3%
			loop 2 {
				n:=A_index + 1
				Myedit=myedit%n%
				Note:=myArray[n]
				gui, Notes:add, edit, w140 -Choose -VScroll +resize v%Myedit%, % myarray[n]
			}
			; OnMessage(0x84, "WM_NCHITTEST")
			; OnMessage(0x83, "WM_NCCALCSIZE")
			gui, Notes:color, 21a366
			; OnMessage(0x203, "Notes.Relocate")
			Notes_x:=Varbar_x+136
			Notes_y:=Varbar_Y+30
			gui, Notes:show, w145 x%Notes_x% y%Notes_y% ,Notes
			winSet, Transparent, 195
			return

		}
		Add(){
			global
			; notes.close()
			; notes.show
			; n:=4
			Myedit:="vmyedit4"
			loadedNotes:="loadednotes4"
				gui, Notes:add, edit, w140 -Choose -VScroll +resize %Myedit%, %LoadedNotes%
			return


		}
		close(){
			global
				gui, Notes:submit, nohide
		Filedelete, lib/Notes.txt
			sleep 200
			; loop 4
			IniWrite, %Notes_X%, Settings.ini, Notes, Notes_X
			IniWrite, %Notes_y%, Settings.ini, Notes, Notes_Y
			Fileappend, %MyEdit1%`n, lib/Notes.txt
			Fileappend, %MyEdit2%`n, lib/Notes.txt
			Fileappend, %Myedit3%`n, lib/Notes.txt
			; Fileappend, %Myedit4%`n, lib/Notes.txt
			; Fileappend, %Myedit5%`n, lib/Notes.txt
			gui, Notes:destroy
		return
		}
			Save(){
				global
			gui, Notes:submit, nohide
			Filedelete, lib/Notes.txt
			sleep 200
			Fileappend, %MyEdit1%`n, lib/Notes.txt
			Fileappend, %MyEdit2%`n, lib/Notes.txt
			Fileappend, %Myedit3%`n, lib/Notes.txt
			; Fileappend, %Myedit4%`n, lib/Notes.txt
			; Fileappend, %Myedit5%`n, lib/Notes.txt
			; Fileappend, %Myedit6%`n, lib/Notes.txt
			; Fileappend, %Myedit7%`n, lib/Notes.txt
			; Fileappend, %Myedit8%`n, lib/Notes.txt
			; Fileappend, %Myedit9%`n, lib/Notes.txt
			; Fileappend, %Myedit10%`n, lib/Notes.txt
			gui, Notes:destroy
			return
		}
		Relocate(){
				global
				; PostMessage, 0xA1, 2
				; keywait, Lbutton, U
				wingetpos, Notes_x, Notes_y,W,H, Notes ahk_class AutoHotkeyGUI
				; Excel.Connect()
				IniWrite, %Notes_x%, Settings.ini, Locations, Notes_x
				IniWrite, %Notes_y%, Settings.ini, Locations, Notes_y
				sleep 300
				return
			}
		WM_NCCALCSIZE()
		{
			if A_Gui
				return 0    ; Sizes the client area to fill the entire window.
		}
		}
		; ButtonAdd:
			; gui, Notes:submit
			; sleep 100
			; Note:=RegExReplace(Note "`n", "m`a)(?=^\s*;).*\R") ; remove commented lines
			; Note:=RegExReplace(Note, "\R+\R", "`r`n")     ; remove empty lines
		NotesButtonOK:
			notes.Save()
			notes.Close()
			return

			NotesGuiClose:
			NotesGuiEscape:
			notes.Save()
			notes.Close()
			; gui, Notes:submit, nohide
			; gui, Notes:destroy
			return \
			*/

