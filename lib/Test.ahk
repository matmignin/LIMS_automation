Test(n){
	global
	if n=1
	{
		test_1()
		TT("test " n)
	}
	else if n=2
	{
		test_2()
		TT("test " n)
	}
	else if n=3
	{
		test_3()
		TT("test " n)
	}
	else
		test_%n%()
		return
		}

class Breaking {
	Point(){
		Global
		If GetKeyState("Space", "P") || GetKeyState("Esc", "P") || GetKeyState("Lbutton", "P") {	
		TT("Broke")
			exit
		}
		if keep_running = n ;another signal to stop
				Exit
	}
	Preamble(){
		Global
		if keep_running = y
		{
			keep_running = n ;signal other thread to stop
			exit
		}
		keep_running = y
	}
	}
;------------------------------------------------------------------------------------------------------------------------
;------------------------------------------------------TEST 1---------------------------------------------- ABC898779849586 --------------
;------------------------------------------------------TEST 1---------------------------------------------- ABC898779849586 --------------
;------------------------------------------------------TEST 1---------------------------------------------- ABC898779849586 --------------
;------------------------------------------------------------------------------------------------------------------------


Test_1(){  ;array - remove duplicates (case insensitive)
global

try, GUI, Notes:destroy

MyArray:=[]
	FileRead, LoadedNotes, lib/Notes.txt
	MyArray := StrSplit(LoadedNotes,"`r`n")
	LoadedNotes1:=MyArray[1]
	LoadedNotes2:=MyArray[2]
	LoadedNotes3:=MyArray[3]
	LoadedNotes4:=MyArray[4]
	gui, Notes:add, button, Hidden default gNotesButtonOK, OK {
	; loop 4 {
		; TempVar:="vMyEdit".A_index
	gui, Notes:add, edit, w100 -Choose -VScroll +resize -WantReturn vMyEdit1, %LoadedNotes1%
	gui, Notes:add, edit, w100 -Choose -VScroll +resize -WantReturn vMyEdit2, %LoadedNotes2%
	gui, Notes:add, edit, w100 -Choose -VScroll +resize -WantReturn vMyEdit3, %LoadedNotes3%
	gui, Notes:add, edit, w100 -Choose -VScroll +resize -WantReturn vMyEdit4, %LoadedNotes4%
OnMessage(0x84, "WM_NCHITTEST")
OnMessage(0x83, "WM_NCCALCSIZE")
gui, Notes:color, 836000
OnMessage(0x203, "Notes_Relocate")
Gui, Notes: -caption -ToolWindow +owner ;+resize MinSize200x200 maxsize400x400
	gui, Notes:show,,Notes
	WinSet, AlwaysOnTop, on, Notes
	; WinSet, AlwaysOnTop, On5) [, WinTitle, WinText, ExcludeTitle, ExcludeText]
	return
	
	
	NotesGuiClose:
	NotesGuiEscape:
	gui, Notes:destroy
	return
	
	NotesButtonOK:
	gui, Notes:submit
	Filedelete, lib/Notes.txt
	sleep 300
	; loop 4
	Fileappend, %MyEdit1%`n, lib/Notes.txt
	Fileappend, %MyEdit2%`n, lib/Notes.txt
	Fileappend, %MyEdit3%`n, lib/Notes.txt
	Fileappend, %MyEdit4%`n, lib/Notes.txt
	gui, Notes:destroy
	return
	

return

}
Notes_Relocate(){
		global
		PostMessage, 0xA1, 2
		keywait, Lbutton, U
		wingetpos, Notes_x, Notes_y,W,H, Notes ahk_class AutoHotkeyGUI
		; Excel.Connect()
		IniWrite, %Notes_x%, data.ini, Locations, Notes_x
		IniWrite, %Notes_y%, data.ini, Locations, Notes_y
		sleep 300
		return
	}
WM_NCCALCSIZE()
{
    if A_Gui
        return 0    ; Sizes the client area to fill the entire window.
}

; Redefine where the sizing borders are.  This is necessary since
; returning 0 for WM_NCCALCSIZE effectively gives borders zero size.


WM_NCHITTEST(wParam, lParam)
{
    static border_size = 6
    
    if !A_Gui
        return
    
    WinGetPos, gX, gY, gW, gH
    
    x := lParam<<48>>48, y := lParam<<32>>48
    
    hit_left    := x <  gX+border_size
    hit_right   := x >= gX+gW-border_size
    hit_top     := y <  gY+border_size
    hit_bottom  := y >= gY+gH-border_size
    
    if hit_top
    {
        if hit_left
            return 0xD
        else if hit_right
            return 0xE
        else
            return 0xC
    }
    else if hit_bottom
    {
        if hit_left
            return 0x10
        else if hit_right
            return 0x11
        else
            return 0xF
    }
    else if hit_left
        return 0xA
    else if hit_right
        return 0xB
    
    ; else let default hit-testing be done
}













	
	/*
; Needed....,Please Ctrl+Left Click on the contact name field.
Test_%iteration%:
		

*/
Test_4:

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












return
;------------------------------------------------------------------------------------------------------------------------
;------------------------------------------------------TEST 2 ------------------------------------------------------------
;------------------------------------------------------------------------------------------------------------------------

Test_2(){
 Global
; WorkTab_PickCustomer(){
	if !CustomerSelection 
	{
		InputBox, CustomerSelection, what is the count?
		return
	}
	else
sendinput, {tab}{home}{right}{right %CustomerSelection%}{enter}
return

 
 return
}
;------------------------------------------------------------------------------------------------------------------------
;---------------------------TEST 3 -----------------------------------------------------------------
;------------------------------------------------------------------------------------------------------------------------
/* 

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




Test_3(Code:=""){
Global

; Loop, Read, Batch.Txt
	
; 	; If A_Index = 1
; 		; Continue
; 	Batches := StrSplit(A_LoopReadLine, "`n")
; ; loop, read, Batch.txt
; 	; loop, parse, A_LoopReadLine,
; 		; Batches.insert(A_LoopField)
		
; 		Msgbox % Batches[0]













; 	; }
}




AddCanceled(){
 ifwinnotactive, Edit test (Field Configuration: F, Micro) - \\Remote
 	winactivate, Edit test (Field Configuration: F, Micro) - \\Remote
 sendinput,{click 399, 219}{end}'(Canceled'){enter}
}

blockRepeat(time=200){
 SetTimer, BlockInput, -%time%
 return
}

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

return
