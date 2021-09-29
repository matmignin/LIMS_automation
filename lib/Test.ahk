#ifwinactive,







Test_4:
FileRead, Note2, CurrentCodes.txt 
ControlsetText, Note2,%Note2%,VarBar
return 




 

	~F20 & Space::  ;; Testing Backcycle
	If !ActiveWindowID
		WinGet, ActiveWindowID, ID, A
	cyclebackward:=1
	PreviousClipCycleCounter:=0 ; 13/10/2017 test
	ClipCycleCounter:=1
	ClipCycleFirst:=1
	While GetKeyState("F20","D") and cyclebackward
	{
		If (ClipCycleCounter <> 0)
		{	
			; Var:=Product[%ClipCycleCounter%]
			Var:=Products[ClipCycleCounter]
			TT(Var,1000,,,,250,"C")
			; Gui, History:+AlwaysOnTop +Disabled -SysMenu +Owner  ; +Owner avoids a taskbar button.
			; Gui, History:Add, Text,, %Var%
			; Gui, History:Show, NoActivate, var 
			; ttext:=% DispToolTipText(Var)
		}
		else
			ttext:="[cancelled]"
		If (oldttext <> ttext)
		{	
			ToolTip, % ttext,A_CaretX, A_CaretY,
			oldttext:=ttext
		}
		Sleep 50
		KeyWait, Space,
	}
	Gui, History:Destroy
	If (ClipCycleCounter > 0) ; If zero we've cancelled it
	{
		Gosub, ClipboardHandler
		ClipCycleCounter:=1
	}
Return

F20 & Space Up::
	PreviousClipCycleCounter:=ClipCycleCounter
	If (ClipCycleFirst = 0)
		ClipCycleCounter++
	ClipCycleFirst:=0
Return   
ClipBoardHandler:
	oldttext:="", ttext:="", ActiveWindowID:=""
	If (Var <> Clipboard)
	{
		StrReplace(ClipText,"`n", "`n", Count)
	}
	Clipboard:=Var
	;  StartTime:=A_TickCount
	;  If ((StartTime - PasteTime) < 75) ; to prevent double paste after using #f/#v in combination
	; Return
	;  WinActivate, ahk_id %ActiveWindowID%
	; Sleep, 20
	send % BlockRepeat(25) "^v"
	; Send, ^v
	;  PasteTime := A_TickCount
	oldttext:="", ttext:="", ActiveWindowID:="",ClipboardOwnerProcessName:=""
	; sleep 300
Return

` & Space::FloVar()
	; Product:=[]
	; Batch:=[]
	; Lot:=[]
FloVar(){
	Global
; try Gui, FloVar:Destroy
CustomColor := "C7603F"  ; Can be any RGB color (it will be made transparent below).
Gui FloVar: +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, FloVar:Color, %CustomColor%
Gui, FloVar:Font, s32  ; Set a large font size (32-point).
Gui, FloVar:Add, Text, vMyText cFFFFFF, XXXXX YYYYY  ; XX & YY serve to auto-size the window.
; Make all pixels of this color transparent and make the text itself translucent (150):
WinSet, TransColor, %CustomColor% 150
SetTimer, UpdateOSD, 250
Gosub, UpdateOSD  ; Make the first update immediate rather than waiting for the timer.
Gui, FloVar:Show, x%Flovar_x% y%Flovar_y% NoActivate  ; NoActivate avoids deactivating the currently active window.
return
}
UpdateOSD:
; MouseGetPos, MouseX, MouseY
		; ControlGetText, Batch, Edit2, VarBar
		; ControlGetText, Lot, Edit3, VarBar
		; ControlGetText, Product, Edit1, VarBar
		; ControlGetText, Coated, Edit4, VarBar
GuiControl, FloVar:Text, MyText, %Product% %Batch%
return
	; loop 4 {
	; 	temp:=Product A_Index
	; 	Iniread, Temp, data.ini, SavedVariables, Temp
	; 	 if hasValue(Product, Temp) ;check to see if duplicate value from list
	; 	continue
	; 	Product.Push(Temp)
	; 	msgbox % Product[A_index]
	;  iniwrite, %Temp%, data.ini, Products, Product
		; iniwrite, K111, data.ini, Products, Product1
		; iniwrite, K222, data.ini, Products, Product2
		; iniwrite, K333, data.ini, Products, Product3
		; iniwrite, K444, data.ini, Products, Product4
	; }
return



Test(n){
	global
	if Iteration==1
	{
		test_1()
		Return
	}
	else if iteration==2
	{
		test_2()
		; TT("test " n)
		Return
	}
	else if iteration==3
	{
		test_3()
		; TT("test " n)
		Return
	}
	else
		gosub, test_%n%
return
}

return

Gui, Add, Text, x10 y12, Load file.
Gui, Add, Button, x10 y30 w90 h20 gloadfile, Open File
Gui, Show, w300 h300,TEST
#ifwinactive#
	DispToolTipText(TextIn,Format=0)
{
	TextOut:=RegExReplace(TextIn,"^\s*")
	TextOut:=SubStr(TextOut,1,750)
	;StringReplace,TextOut,TextOut,`;,``;,All
	FormatFunc:=StrReplace(CyclePlugins[Format]," ")
	If IsFunc(FormatFunc)
		TextOut:=%FormatFunc%(TextOut)
Return TextOut
} 



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
GuiClose:
ExitApp 
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
Test_3(File:="C:\Users\mmignin\Documents\VQuest\lib\Products.txt"){
	; Remove_Duplicates(File:="C:\Users\mmignin\Documents\VQuest\lib\Products.txt")
	FileRead, OutputVar, Products.txt 
	Sort, OutputVar, u
	; NewOutputVar := RegExReplace( OutputVar , "m`a)(^\s+)|(\s+$)")
	FileDelete, Products.txt
	sleep, 300
	FileAppend, %OutputVar%, Products.txt

}
; Loop
; {
; 	Sleep, 1
; 	GetKeyState, KeyState, Numbpadadd, D
; 	if KeyState = D

; 			break
; }
; MouseGetPos, ContactNamePosX, ContactNamePosy
; Send {Ctrl Up}{LButton Up}
;	}

return

/*

~Numlock:: ;Clipchain_v()
MouseGetPos, xx
TimeButtonDown = %A_TickCount%
; Wait for it to be released
Loop
{
   Sleep 10
   GetKeyState, LButtonState, Numlock, P
  ;  if NumlockState = U  ; Button has been released.
  ;  {
      ; If WinActive("Crimson Editor") and (xx < 25) ; Single Click in the Selection Area of CE
      ; {
      ;    Send, ^c
      ;    return
      ;    return
      ; }
      ; break
  ;  }
   elapsed = %A_TickCount%
   elapsed -= %TimeButtonDown%
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
TimeButtonUp = %A_TickCount%
Loop
{
   Sleep 10
   GetKeyState, NumlockState, Numlock, P
   if NumlockState = D  ; Button has been pressed down again.
      break
   elapsed = %A_TickCount%
   elapsed -= %TimeButtonUp%
   if elapsed > 350  ; No click has occurred within the allowed time, so assume it's not a double-click.
      return
}

;Button pressed down again, it's at least a double-click
TimeButtonUp2 = %A_TickCount%
Loop
{
   Sleep 10
   GetKeyState, NumlockState2, Numlock, P
   if NumlockState2 = U  ; Button has been released a 2nd time, let's see if it's a tripple-click.
      break
}
;Button released a 2nd time
TimeButtonUp3 = %A_TickCount%
Loop
; GetKeyState, OutputVar, WhichKey [, Mode (P|T)]
{
   Sleep 10
   GetKeyState, NumlockState3, Numlock, P
   if numlockState3 = D  ; Button has been pressed down a 3rd time.
      break
   elapsed = %A_TickCount%
   elapsed -= %TimeButtonUp%
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
; WinGetTitle, the_WinTitle, A
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
oldttext:="", ttext:="", ActiveWindowID:=""
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
WinGet, ClipboardOwnerProcessName, ProcessName, % "ahk_id " DllCall("GetClipboardOwner", Ptr)

If (ClipboardOwnerProcessName = "")
	WinGet, ClipboardOwnerProcessName, ProcessName, A

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

WinGet, IconExe, ProcessPath , A
If ((History.MaxIndex() = 0) or (History.MaxIndex() = "")) ; just make sure we have the History Object and add "some" text
	History.Insert(1,{"text":"Text","icon": IconExe,"lines": 1})

History_Save:=1

; Skipping Excel.exe +
; Skipping CF_METAFILEPICT avoids "This picture is too large and will be truncated" error MsgBox in Excel it seems
; this allows the various formats to be stored (temporarily) so we can paste the formatted text which may have been changed by AutoReplace - this avoids the need to turn AR on/off to get something to paste
If !WinActive("ahk_exe excel.exe")
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
	fileread, ProductList, Data.ini ;read the data.ini file
pos=0
while pos := RegexMatch(productlist, "i)[abdefghijkl]\d{3}", var, pos+1) { ;fine each regex match in the ini file
								if hasValue(Products, Var) ;check to see if duplicate value from list
									continue
								Products.insert(var) ; add to products array
}
msgbox % listarray(products)
return 
*/

; 	; }

AddCanceled(){
	ifwinnotactive, Edit test (Field Configuration: F, Micro) - \\Remote
		winactivate, Edit test (Field Configuration: F, Micro) - \\Remote
	SendInput,{click 399, 219}{end}'(Canceled'){enter}
}

ToggleFilter_Test_1(){
	ifwinnotactive, NuGenesis LMS - \\Remote
		WinActivate, NuGenesis LMS - \\Remote
	click 489, 836, R
	SendInput,{down 2}{enter}
}

FilterSearch_Test(TestName:="", MethodName:=""){
	ifwinnotactive, NuGenesis LMS - \\Remote
		WinActivate, NuGenesis LMS - \\Remote
	click 1230, 648 ;click name Divider
	Send, ^a%TestName%{enter}
	click 1067, 647 ; click method ID Divider
	Send, ^a%MethodName%{enter}{tab 4}
}

ListArray(The_Array,Option:="n"){
	global
	if (option<>"n"){
		for Each, Element in The_Array
			ArrayList .=Element " " Option " "
		msgbox, %ArrayList%
		return ArrayList
	}
	else {  
  ; ArrayList := "1: "
  For Each, Element In The_Array {
    ;  If (ArrayList <> "1: ") ; ArrayList is not empty, so add a line feed
        ArrayList .= "`n" A_index ": "
    ArrayList .= Element
  }
  MsgBox, %ArrayList%
	return ArrayList
  }
}

HasValue(haystack, needle) {
	for index, value in haystack
		if (value = needle)
		return index
	if !(IsObject(haystack))
		throw Exception("Bad haystack!", -1, haystack)
return 0
}