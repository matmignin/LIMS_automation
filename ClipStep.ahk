; This script keeps a record of the clipboard contents so that in effect, you have
; more than one clipboard.  To restore the old clipboards (one by one), press the
; Win+Space or Shift+Win+Space hotkeys (or other hotkeys as configured below).
; The script give you feedback about what's on the clipboard via Tooltips.

; CONFIGURATION SECTION. SET YOUR PREFERENCES HERE:
MaxClipboards = 5  ; How many clipboards to maintain in the list.
HotkeyBack = #space  ; Hotkey to move backward through the list of clipboards.
HotkeyFwd = #+space  ; Hotkey to move forward through the list of clipboards.

; END OF CONFIGURATION SECTION

Hotkey, %HotkeyBack%, HotkeyBack
Hotkey, %HotkeyFwd%, HotkeyFwd

#Persistent
ClipIndex = 0
ClipIndexToRestore = 0

OnClipboardChange:
if (A_EventInfo = 0 OR NoSaveClipboard)
	return  ; Empty or the hotkey told us not to save its own change to the clipboard.
; Check if what's on the clipboard now exactly matches the previously saved item. If it
; does, don't save it.  This solves the fact that some apps save each clipboard twice.
if ClipIndex > 0
{
	ClipSavedTemp := ClipboardAll  ; ...because can't compare directly to ClipboardAll.
	if ClipSaved%ClipIndex% = %ClipSavedTemp%  ; Must be old-style if-statement.
		return
}
ClipIndex += 1  ; Move to the next slot.
if (ClipIndex > MaxClipboards)  ; Wrap back around to the beginning.
	ClipIndex = 1
ClipIndexToRestore := ClipIndex  ; Reset the hotkey's bookmark each time a save occurs.
ClipSaved%ClipIndex% := ClipboardAll  ; Save the current contents of the clipboard.
ToolTip, %ClipIndex%, A_CaretX, A_CaretY  ; Briefly notify the user of the item number.
SetTimer, ToolTipOff, 1000
return

HotkeyBack:
HotkeyFwd:
if ClipIndexToRestore = 0  ; No saved clipboards yet.
	return
if (A_ThisHotkey = HotkeyBack)
{
	ClipIndexToRestore -= 1  ; Move backward through the list.
	if ClipIndexToRestore <= 0  ; Wrap around to the tail end of list.
		ClipIndexToRestore := MaxClipboards
}
else  ; (A_ThisHotkey = HotkeyFwd)
{
	ClipIndexToRestore += 1  ; Move forward through the list.
	if ClipIndexToRestore > %MaxClipboards%  ; Wrap around to beginning or list.
		ClipIndexToRestore := 1
}
if StrLen(ClipSaved%ClipIndexToRestore%) = 0  ; Nothing saved, so don't do it.
{
	ToolTip Restored Clipboard #%ClipIndexToRestore% is empty., A_CaretX, A_CaretY
	SetTimer, ToolTipOff, 2000
	return
}
NoSaveClipboard := true  ; Tell OnClipboardChange not to save our clipboard change.
Clipboard := ClipSaved%ClipIndexToRestore%
ToolTip Restored Clipboard #%ClipIndexToRestore%:`n%Clipboard%, A_CaretX, A_CaretY
SetTimer, ToolTipOff, 2000
Sleep 30  ; This gives the OnClipboardChange subroutine an opportunity to run.
NoSaveClipboard := false
return

ToolTipOff:
ToolTip
SetTimer, ToolTipOff, Off
return