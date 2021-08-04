Test(n){
	global
	if n=1
	{
		test_1()
		TT("test " n)
		Return
	}
	else if n=2
	{
		test_2()
		TT("test " n)
		Return
	}
	else if n=3
	{
		test_3()
		TT("test " n)
		Return
	}
	else
		test_%n%()
		return
		}




;------------------------------------------------------------------------------------------------------------------------
;------------------------------------------------------TEST 1------------------------------------------------------------
Test_1(){
global
; winactivate, NuGenesis LMS - \\Remote
; lms.SelectWorkTab(SamplesTabTab)
; lms.SelectTab(4)
lms.sampleRequestToggle()
return
}


;---------------------------------------------------------parcing a data file and setting to an array---------------------------------------------------------------
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




;------------------------------------------------------TEST 3------------------------------------------------------------
;------------------------------------------------------------------------------------------------------------------------
;------------------------------------------------------------------------------------------------------------------------

;Test_3:
Test_3(File:="C:\Users\mmignin\Documents\VQuest\lib\Products.txt"){
	; Remove_Duplicates(File:="C:\Users\mmignin\Documents\VQuest\lib\Products.txt")
FileRead, OutputVar, %File%
Sort, OutputVar, u
FileDelete, %File%
sleep, 300
FileAppend, %OutputVar%, %File%
	
	
	
	
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











HasValue(haystack, needle) {
    for index, value in haystack
        if (value = needle)
            return index
    if !(IsObject(haystack))
        throw Exception("Bad haystack!", -1, haystack)
    return 0
}
HasValue2(item, list, del:=","){
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
; 				send, ^c
; 				clipwait, 0.8
; 	sleep 200
; 	winactivate, %The_wintitle%
; 	; click, %caret_X%, %caret_y%
; 	send, {click, %caret_x%, %caret_y%}^{v}
 

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




;;;;;;;;;;;;;;;;;;;;;;;;;;;;; grep all the product codes out of a file and add them to an array without duplicates 
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
 sendinput,{click 399, 219}{end}'(Canceled'){enter}
}

blockRepeat(time=200){
 SetTimer, BlockInput, -%time%
 return
}

BlockInput:
 N=0
return


ToggleFilter_Test_1(){
 ifwinnotactive, NuGenesis LMS - \\Remote
 WinActivate, NuGenesis LMS - \\Remote
 click 489, 836, R
 sendinput,{down 2}{enter}
}

FilterSearch_Test(TestName:="", MethodName:=""){
 ifwinnotactive, NuGenesis LMS - \\Remote
 WinActivate, NuGenesis LMS - \\Remote
 click 1230, 648 ;click name Divider
 send, ^a%TestName%{enter}
 click 1067, 647 ; click method ID Divider
 send, ^a%MethodName%{enter}{tab 4}
}

	ListArray(The_Array){
		global
		for vKey, vValue in The_Array
			ArrayList .=vValue "|"
		; msgbox, %ArrayList%
		return ArrayList
	}
return
