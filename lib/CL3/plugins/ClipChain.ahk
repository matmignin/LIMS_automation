/*

Plugin            : ClipChain
Purpose           : Cycle through a predefined clipboard history on each paste
Version           : 1.6
CL3 version       : 1.5

History:
- 1.6 Attempt to prevent XMLRoot error - https://github.com/hi5/CL3/issues/15
- 1.5.1 Fix for hotkey, using much more reliable #If
- 1.5 Clipchain: you can now define a hotkey (via settings) to "progress to next item" - this will allow you to keep ^v for normal copy/paste actions - see Clipchain HK (settings)
- 1.4 Added QEDL() for edit and insert (not public)
- 1.3 Added DoubleClick to paste and progress ClipChain
- 1.2 Fixed LV_Modify empty parameters because of AutoHotkey v1.1.23.03 update
- 1.1 Added minor fix for "non-empty" empty lines?

*/
#include <Tooltip>

ClipChainInit:
	CoordMode, Mouse Screen
	MouseGetPos, Mx, MY,
	IniRead, ClipChainX , %A_ScriptDir%\ClipData\ClipChain\ClipChain.ini, Settings, ClipChainX,
	IniRead, ClipChainY , %A_ScriptDir%\ClipData\ClipChain\ClipChain.ini, Settings, ClipChainY, 
	IniRead, ClipChainNoHistory , %A_ScriptDir%\ClipData\ClipChain\ClipChain.ini, Settings, ClipChainNoHistory , 0
	IniRead, ClipChainTrans , %A_ScriptDir%\ClipData\ClipChain\ClipChain.ini, Settings, ClipChainTrans , 0
	IniRead, ClipChainPause , %A_ScriptDir%\ClipData\ClipChain\ClipChain.ini, Settings, ClipChainPause , 0
	CoordMode, Mouse, relative
	sleep 20
	If (ClipChainX := 0) Myr (ClipChainX = "ERROR")
		ClipChainX:=My
	If (ClipChainY := 0) or (ClipChainY = "ERROR")
		ClipChainY:=My
	
	If !IsObject(ClipChainData)
	{
		IfExist, %A_ScriptDir%\ClipData\ClipChain\ClipChain.xml
		{
			If (XA_Load(A_ScriptDir "\ClipData\ClipChain\ClipChain.xml") = 1) ; the name of the variable containing the array is returned OR the value 1 in case of error
			{
				MsgBox, 16, ClipChain, ClipChain.xml seems to be corrupt, starting new empty chain.
				FileDelete, %A_ScriptDir%\ClipData\ClipChain\ClipChain.xml
				ClipChain:=[]
			}
		}
		else
		{
			ClipChain:=[]
		}
	}

	ClipChainIndex:=1

	Menu, ClipChainMenu, Add
	Menu, ClipChainMenu, Delete

	Menu, ClipChainMenu, Add, Transparent, ClipChainTrans
	Menu, ClipChainMenu, Add, Load from Clipboard, ClipChainLoad
	Menu, ClipChainMenu, Add
	Menu, ClipChainMenu, Add, Load from File, ClipChainLoadFile
	Menu, ClipChainMenu, Add, Save to File, ClipChainSaveFile
	Menu, ClipChainMenu, Add, Edit box, #x
	Menu, ClipChainMenu, Add
	Menu, ClipChainMenu, Add, Clear ClipChain, ClipChainClear

	Gui, ClipChain:Default
	Gui, ClipChain:Font, % dpi("s7")
	Gui, ClipChain:+Border +ToolWindow +AlwaysOnTop +E0x08000000 ; +E0x08000000 = WS_EX_NOACTIVATE ; ontop and don't activate
	Gui, ClipChain:Add, Listview, % dpi("x0 y0 w195 h350 r10 NoSortHdr -hdr grid vLVCGIndex gClipChainClicked hwndHLV"), | |IDX
	LV_ModifyCol(1,dpi()*25)
	LV_ModifyCol(2,dpi()*160)
	LV_ModifyCol(3,*0)
	;LV_ModifyCol(2,100) ; debug
	;LV_ModifyCol(3,30)  ; debug
	Gosub, ClipChainListview
	Gui, ClipChain:Add, Button, % dpi("gClipChainMoveUp   vButton1"), % Chr(0x25B2) ; â–²
	Gui, ClipChain:Add, Button, % dpi("x+1 gClipChainMoveDown vButton2"), % Chr(0x25BC) ; â–¼

	; Gui, ClipChain:font,% dpi("s8")
	; Gui, ClipChain:Add, GroupBox, % dpi("x2 yp+355 w181 h50 vGbox1"), Chain(s)
	; Gui, ClipChain:Add, Button, % dpi("xp+28 yp    w26 h26   gClipChainInsert   vButton3"), Ins
	; Gui, ClipChain:font,% dpi("s11") ; " Wingdings"
	; Gui, ClipChain:Add, Button, % dpi("xp+28 yp    w26 h26   gClipChainEdit     vButton4"), % Chr(0x270E) ; âœŽ ; % Chr(33) ; Edit (pencil)
	; Gui, ClipChain:font
	; Gui, ClipChain:font, % dpi("s12 bold")
	; Gui, ClipChain:Add, Button, % dpi("xp+28 yp    w26 h26   gClipChainDel      vButton5"), % Chr(0x1f5d1) ; trashcan ; X ; Del (X)
	; Gui, ClipChain:font
	; Gui, ClipChain:font,% dpi("s11") ; " Wingdings "
	; Gui, ClipChain:Add, Button, % dpi("xp+28 yp    w26 h26   gClipChainMenu     vButton6"), % Chr(0x1F4C2) ; open folder ðŸ“‚; % Chr(49)
	; Gui, ClipChain:font
	; Gui, ClipChain:font,% dpi("s8")
	; Gui, ClipChain:Add, GroupBox, % dpi("x2 yp+40 w181 h80 vGbox2"), Options
	; Gui, ClipChain:Add, Checkbox, % dpi("xp+10 yp+18 w75 h24 vClipChainNoHistory gClipChainCheckboxes"), No History
	; Gui, ClipChain:Add, Checkbox, % dpi("xp+80 yp    w85 h24 vClipChainTrans     gClipChainCheckboxes"), Transparent
	; Gui, ClipChain:Add, Checkbox, % dpi("xp-80 yp+30 w75 h24 vClipChainPause     gClipChainCheckboxes"), Pause
	; Gui, ClipChain:Add, Button  , % dpi("xp+80 yp    w85 h24 vClipChainGuiClose  gClipChainGuiClose"  ), Close ClipChain

	; GuiControl, ClipChain:, ClipChainNoHistory  , %ClipChainNoHistory%
	GuiControl, ClipChain:, ClipChainTrans      , %ClipChainTrans%
	; GuiControl, ClipChain:, ClipChainPause      , %ClipChainPause%

	Gosub, ClipChainCheckboxes
	ClipChainLvHandle := New LV_Rows(HLV)
		WinSet, Transparent, 100, CL3ClipChain ahk_class AutoHotkeyGUI
Return




#If Mouse_IsOver("CL3ClipChain")
	Rbutton::			        gosub, clipchainmenu
	; wheeldown::			       gosub, ClipchainMoveDown
	Backspace::			     gosub, ClipChainDel
#If Mouse_IsOver("cl3.ahk ahk_exe AutoHotkey.exe")
	+Enter::	
	F19::						
	; ^Down::			       gosub, ClipchainMoveDown
	; ^up::			         gosub, ClipchainMoveUp
	^enter::							
				ControlGetText, ClipChainIns, Edit1, cl3.ahk ahk_exe AutoHotkey.exe, Insert text into chain after  item,
				clipboard:=ClipChainIns
				sleep 200
				gosub, ClipChainInsertGuiOK
				return
#if
	; Numlock::  ;send, {shiftdown}{ctrldown}{4}{ctrlup}{shiftup}
	; 		if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 200)
	; 			send, {esc}{F21}
	; 		else
	; 			send, {shiftdown}{ctrldown}{4}{ctrlup}{shiftup}
	; 		return
			
#IfWinActive, CL3ClipChain Insert text
#IfWinActive, CL3ClipChain Insert text
#IfWinActive, cl3.ahk ahk_exe AutoHotkey.exe, Insert text into chain after  item
	+Enter::	
	F19::						
	^enter::							
	; ^enter::							ControlClick, Button1, A, A, left, 1
												ControlGetText, ClipChainIns, Edit1, cl3.ahk ahk_exe AutoHotkey.exe, Insert text into chain after  item,
												clipboard:=ClipChainIns
												sleep 200
												gosub, ClipChainInsertGuiOK
												return
#IfWinActive, CL3ClipChain
	Rbutton::			        gosub, clipchainmenu
	; up::			         gosub, ClipchainMoveUp
	; Down::			       gosub, ClipchainMoveDown
	Backspace::			     gosub, ClipChainDel

	#IfWinExist CL3ClipChain ahk_class AutoHotkeyGUI
		; sendlevel 3

	; ^v::Gosub, ClipChainPasteDoubleClick
	; sendlevel 0

Lwin & Lbutton::
	click
	Gosub, ClipChainPasteDoubleClick
return
; ~Lbutton::
; If ClipChainPause
; 	Return
; If (A_TimeSincePriorHotkey<400) and (A_TimeSincePriorHotkey<>-1)
; 	{ ; check if you doubleclicked on the listview if so move away focus from listview otherwise we couldn't set the new active item by double clicking in the LV
; 	 ControlGetFocus, CL3ClipChainListview, CL3ClipChain ahk_class AutoHotkeyGUI
; 	 If (CL3ClipChainListview = "SysListView321")
; 	 	{
; 	 	 ControlFocus, Button12, CL3ClipChain ahk_class AutoHotkeyGUI ; Button12 is Close ClipChain
; 	 	 Return
; 	 	}
; 	 Gosub, ClipChainPasteDoubleClick
; 	}
; Return

clipChain_v(){
	Global
	gosub, ClipChainPasteDoubleClick
}

clipChain_c(){
	Global
	sendinput, {ctrlup}{altup}
	KeyWait, F20, T0.20
	If ErrorLevel
	{
		KeyWait, F20, T4
		if (A_PriorKey!="F20")
			exit
		if (A_PriorKey="F20")
			If !ErrorLevel
		{
			sendinput, {home}+{end}^c
			ClipChainInsert()
			exit
		}
		KeyWait, F20, T4
		Return
	}
	if Errorlevel = 0
		KeyWait, F20, T4
	if !ErrorLevel
		ClipChainInsert()
return
}

F20 & Space::
	clipboard:=
	send, ^{c}
	clipwait, 0.4
	gosub, ClipChainLoad
return

; ::
#x::
	clipboard:=
	send, ^{c}
	clipwait, 0.5
	clipboard:=Trim(Clipboard, "`n")
	Gosub, ClipChainInsertGui
	gosub, ClipChainLoad
return
#IfWinActive

ClickText(button:="")
{
	mousegetpos, mousex, mousey
	SetDefaultMouseSpeed, 0
	Click, %A_CaretX% %A_caretY%, %button%
	mousemove, %mousex%, %mousey%, 0
	SetDefaultMouseSpeed, 1
return
}

#If ClipChainActive()
	^Numpadmult::
	; F20 & up::			   MoveIndicatorUp()
	^numpaddot::
	; F20 & Down::			MoveIndicatorDown()
	Rshift & up::			gosub, ClipchainMoveUp
	Rshift & down::		gosub, ClipchainMoveDown
	; gosub, ClipchainMoveDown
	Delete::			 	   gosub, ClipChainDel
	^c::			     	   send, ^c
	F11::
								clipchaininsert()
								send, ^x
								return
	\::	  					gosub, clipchainmenu
	F20 & F19::				;Gui, ClipChain:Destroy
	F22:: 					gosub, ClipChainGuiClose
	F19::			        
								clicktext(3)
								clipChain_v()
								return
	
	$Rshift::			    
								sendinput, +{tab}{tab}
								ClipChainInsert()
								return
	>+Enter::			    
								send, +{tab}{tab}
								sleep 50
								clipChain_v()
								return
	F21::			       	 ClipChainInsert()
	; F20::			        ClipChainInsert()
	; F20::			     		clipChain_c()
	numlock::				clipChain_v()
	Mbutton::  				clipchaininsert()
	
#if

ClipChainInsert(){
	global
	clipboard:=
	sendinput, ^c
	clipwait, 0.2
	if errorlevel
	{
		If (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<400) ;if double clic
			ClickText(3)
		Else
			ClickText(2)
		; ClipChainInsert(
		sendinput, ^c
		clipwait, 0.2
	}
	If (ClipChainGuiTitle = "")
		ClipChainGuiTitle:="CL3ClipChain Insert text"
	ClipChainInsertCounter:=0
	ClipChainPauseStore:=ClipChainPause
	ClipChainPause:=1
	GuiControl, ClipChain:, ClipChainPause , %ClipChainPause%

	ClipChainIns:=Clipboard
	ClipChainDataIndex:=""
	Gui, ClipChain:Default
	Gui, ClipChain:Submit, NoHide
	LVCGIndex := LV_GetNext()
	If (LVCGIndex = 0)
		LVCGIndex = 1
	LV_GetText(ClipChainDataIndex, LVCGIndex, 3)
	If (ClipChainDataIndex = "")
	{
		ClipChainDataIndex:=1
		ClipChainInsertCounter:=0
	}
	If (ClipChainInsEdit = 1)
		ClipChainIns:=ClipChainData[ClipChainDataIndex]

	If (ClipChainIns = "")
	{
		ClipChainPause:=ClipChainPauseStore
		ClipChainPauseStore:=""
		GuiControl, ClipChain:, ClipChainPause , %ClipChainPause%

		Return
	}
	If (ClipChainInsEdit = 1)
	{
		ClipChainData[ClipChainDataIndex]:=ClipChainIns
		If (ClipChainInsertCounter = 0)
			LV_Add(1,,,,1)
		LV_Modify(ClipChainDataIndex,"Col2",ClipChainHelper(ClipChainIns))
	}
	else
	{
		ClipChainData.InsertAt(ClipChainDataIndex+ClipChainInsertCounter,ClipChainIns)
		LV_Insert(ClipChainDataIndex+0, , , ClipChainHelper(ClipChainIns))
	}
	Gosub, ClipChainUpdateIDX
	ClipChainInsEdit:=0

	ClipChainPause:=ClipChainPauseStore
	ClipChainPauseStore:=""
	GuiControl, ClipChain:, ClipChainPause , %ClipChainPause%
	ClipChainGuiTitle:=""
	Gosub, ClipChainSet
	XMLSave("ClipChainData")
	gosub, ClipChainInsertGuiOK
Return
}

;$^v::
ClipChainPasteDoubleClick:
	Gui, ClipChain:Default
	Gui, ClipChain:Submit, NoHide
	If ClipChainPause
		Return
	If (ClipChainIndex > ClipChainData.MaxIndex())
	{
		ClipChainIndex:=1
	}
	If ClipChainNoHistory
		OnClipboardChange("FuncOnClipboardChange", 0)
	Clipboard:=ClipChainData[ClipChainIndex]
	PasteIt()
	Sleep 50
	Clipboard:=History[1].text
	If ClipChainNoHistory
		OnClipboardChange("FuncOnClipboardChange", 1)
	stats.clipchain++
	ClipChainIndex++
	nextclip:=ClipChainData[ClipChainIndex]
	; tooltip(NextClip,3000,A_ScreenWidth/2,40)
	Gosub, ClipChainUpdateIndicator
return
#If

;^#F11::
hk_clipchain:
	If !WinExist("CL3ClipChain ahk_class AutoHotkeyGUI")
		Gui, ClipChain:Show, % dpi("w185 NA x") ClipChainX " y" ClipChainY, CL3ClipChain
	else
	{
		Gosub, ClipChainSaveWindowPosition
		Gui, ClipChain:Hide
	}
	Gosub, ClipChainCheckboxes
Return

ClipChainMenu:
	Menu, ClipChainMenu, Show
Return

ClipChainSaveFile:
	SaveAsName:=""
	Gui, ClipChain:Submit, Hide
	InputBox, SaveAsName, Name for XML, Save Clipchain as
		If (SaveAsName = "")
	{
		MsgBox, Enter filename!`nSlots not saved.
		Gui, ClipChain:Show
		Return
	}
	StringReplace, SaveAsName, SaveAsName, .xml,,All
	XA_Save("ClipChainData", A_ScriptDir "\ClipData\ClipChain\" SaveAsName ".xml") ; put variable name in quotes
Return

ClipChainClear:
	Gui, ClipChain:Default
	LV_Delete()
	ClipChainDataNew:=[]
Return

ClipChainSet:
	ClipChainNewOrder:=""
	ClipChainDataNew:=[]
	ClipChainIns:=""
	ClipChainDataIndex:=""
	Loop, % LV_GetCount()
	{
		LV_GetText(ClipChainDataIndex, A_Index, 3)
		ClipChainNewOrder .= ClipChainDataIndex ","
	}
	ClipChainNewOrder:=RTrim(ClipChainNewOrder,",")
	Loop, parse, ClipChainNewOrder, CSV
		ClipChainDataNew.push(ClipChainData[A_LoopField])
	ClipChainData:=[]
	ClipChainData:=ClipChainDataNew
	ClipChainDataNew:=[]
	Gosub, ClipChainUpdateIDX
	Gosub, ClipChainUpdateIndicator
Return

ClipChainUpdateIDX:
	Loop, % LV_GetCount()
		LV_Modify(A_Index,"Col3",A_Index)
Return

ClipChainEdit: ; falls through to Insert
	ClipChainGuiTitle:="CL3ClipChain Edit text"
	ClipChainInsEdit:=1

ClipChainInsert:
	If (ClipChainGuiTitle = "")
		ClipChainGuiTitle:="CL3ClipChain Insert text"
	ClipChainInsertCounter:=1
	ClipChainPauseStore:=ClipChainPause
	ClipChainPause:=1
	GuiControl, ClipChain:, ClipChainPause , %ClipChainPause%

	ClipChainIns:=Clipboard
	ClipChainDataIndex:=""
	Gui, ClipChain:Default
	Gui, ClipChain:Submit, NoHide
	LVCGIndex := LV_GetNext()
	If (LVCGIndex = 0)
		LVCGIndex = 1
	LV_GetText(ClipChainDataIndex, LVCGIndex, 3)
	If (ClipChainDataIndex = "")
	{
		ClipChainDataIndex:=1
		ClipChainInsertCounter:=0
	}
	If (ClipChainInsEdit = 1)
		ClipChainIns:=ClipChainData[ClipChainDataIndex]
	Gosub, ClipChainInsertGui
	If (ClipChainIns = "")
	{
		ClipChainPause:=ClipChainPauseStore
		ClipChainPauseStore:=""
		GuiControl, ClipChain:, ClipChainPause , %ClipChainPause%
		Return
	}
	If (ClipChainInsEdit = 1)
	{
		ClipChainData[ClipChainDataIndex]:=ClipChainIns
		If (ClipChainInsertCounter = 0)
			LV_Add(1,,,,1)
		LV_Modify(ClipChainDataIndex,"Col2",ClipChainHelper(ClipChainIns))
	}
	else
	{
		ClipChainData.InsertAt(ClipChainDataIndex+ClipChainInsertCounter,ClipChainIns)
		LV_Insert(ClipChainDataIndex+1, , , ClipChainHelper(ClipChainIns))
	}
	Gosub, ClipChainUpdateIDX
	ClipChainInsEdit:=0

	ClipChainPause:=ClipChainPauseStore
	ClipChainPauseStore:=""
	GuiControl, ClipChain:, ClipChainPause , %ClipChainPause%
	ClipChainGuiTitle:=""
	Gosub, ClipChainSet
	XMLSave("ClipChainData")
Return

ClipChainInsertGui:
	ClipChainInsertActive:=0

	; not public
	#include *i %A_ScriptDir%\plugins\MyQEDLG-ClipChain.ahk

	Gui, ClipChainInsertGui:Destroy
	Gui, ClipChainInsertGui:Add, Text, x5 y5, Insert text into chain after %ClipChainDataIndex% item:
	Gui, ClipChainInsertGui:Add, Edit, xp yp+20 w500 h300 vClipChainIns, %ClipChainIns%
	Gui, ClipChainInsertGui:Add, Button, gClipChainInsertGuiOK w100, OK
	Gui, ClipChainInsertGui:Add, Button, xp+120 gClipChainInsertGuiCancel w100, Cancel
	Gui, ClipChainInsertGui:Show, , %ClipChainGuiTitle%
	While (ClipChainInsertActive = 0)
	{
		Sleep 20
	}
Return

ClipChainDel:
	XMLSave("ClipChainData","-" A_Now)
	ClipChainDataIndex:=""
	Gui, ClipChain:Default
	Gui, ClipChain:Submit, NoHide
	LVCGIndex := LV_GetNext()
	If (LVCGIndex = 0)
		LVCGIndex = 1
	LV_GetText(ClipChainDataIndex, LVCGIndex, 3)
	for k, v in ClipChainData
		if (v = ClipChainData[ClipChainDataIndex])
		LV_Delete(A_Index)
	If (ClipChainData.Length() <> 0)
		ClipChainData.RemoveAt(ClipChainDataIndex)
	Gosub, ClipChainUpdateIDX
	Gosub, ClipChainSet
	XMLSave("ClipChainData")
Return

ClipChainCheckboxes:
	Gui, ClipChain:Default
	Gui, ClipChain:Submit, NoHide

	; no longer used v1.95
	;If ClipChainNoHistory
	;	ScriptClipClipChain:=1
	;else If !ClipChainNoHistory
	;	ScriptClipClipChain:=0
	If ClipChainTrans
	
		WinSet, Transparent, 200, CL3ClipChain ahk_class AutoHotkeyGUI
	else If !ClipChainTrans
		WinSet, Transparent, 255, CL3ClipChain ahk_class AutoHotkeyGUI

Return
ClipChainTrans:
	if ClipChainTrans := !ClipChainTrans
		WinSet, Transparent, 180, CL3ClipChain ahk_class AutoHotkeyGUI
	else
		WinSet, Transparent, 250, CL3ClipChain ahk_class AutoHotkeyGUI
return
ClipChainClicked:
	Gui, ClipChain:Default
	ClipChainIndex:=A_EventInfo
	Gosub, ClipChainUpdateIndicator
Return

ClipChainLoad:
	XMLSave("ClipChainData","-" A_Now)
	ClipChainData:=RegExReplace(Clipboard,"m)^\s+$") ; v1.1 remove white space from empty lines
	If (Asc(SubStr(ClipChainData,1,1)) = 65279) ; fix: remove BOM char from first entry, could mess up a filepath...
		ClipChainData:=SubStr(ClipChainData,2)
	; StringReplace,ClipChainData,ClipChainData,`r`n`r`n, % Chr(7), All
	StringReplace,ClipChainData,ClipChainData,`r`n, % Chr(7), All ;i did this.
	#Include *i %A_ScriptDir%\plugins\ClipChainPRIVATERULES.ahk
	ClipChainData:=StrSplit(ClipChainData,Chr(7))
ClipChainListview:
	Gui, ClipChain:Default
	LV_Delete()
	for k,v in ClipChainData
		LV_Add("", "", ClipChainHelper(v), A_Index)
	LV_Modify(1,"Col1", "||")
	XMLSave("ClipChainData")
Return

ClipChainHelper(in) {
	StringReplace, in, in, `r`n, \n, All
	StringReplace, in, in, `n, \n, All
	StringReplace, in, in, `r, \n, All
return in
}

ClipChainUpdateIndicator:
	Gui, ClipChain:Default
	Loop, % ClipChainData.MaxIndex()
		LV_Modify(A_Index,"Col1"," ")

	If (ClipChainIndex > ClipChainData.MaxIndex()) or (ClipChainIndex <= 1)
	{
		LV_Modify(1,"Col1","||")
		LV_Modify(1, "Vis")
		return
	}

	LV_Modify(ClipChainIndex,"Col1",">>")
	LV_Modify(ClipChainIndex, "Vis")

Return

ClipChainGuiEscape:
ClipChainGuiClose:
	ScriptClipClipChain:=0
	Gosub, ClipChainSaveWindowPosition
	Gosub, ClipChainSet
	Gui, ClipChain:Default
	Gui, ClipChain:Submit, Hide
	XA_Save("ClipChainData",A_ScriptDir "\ClipData\ClipChain\ClipChain.xml")
Return

ClipChainSaveWindowPosition:
	IniWrite, %ClipChainNoHistory% , %A_ScriptDir%\ClipData\ClipChain\ClipChain.ini, Settings, ClipChainNoHistory
	IniWrite, %ClipChainTrans% , %A_ScriptDir%\ClipData\ClipChain\ClipChain.ini, Settings, ClipChainTrans
	IniWrite, %ClipChainPause% , %A_ScriptDir%\ClipData\ClipChain\ClipChain.ini, Settings, ClipChainPause
	if (clipchainX := 0) or (clipchainY := 0)
		return
	WinGetPos, ClipChainX, ClipChainY, , , CL3ClipChain ahk_class AutoHotkeyGUI
	IniWrite, %ClipChainX%, %A_ScriptDir%\ClipData\ClipChain\ClipChain.ini, Settings, ClipChainX
	IniWrite, %ClipChainY%, %A_ScriptDir%\ClipData\ClipChain\ClipChain.ini, Settings, ClipChainY
Return

MoveIndicatorDown(){
	Clipchainindex++ 
	gosub, ClipChainUpdateIndicator
	}
MoveIndicatorUp(){
	Clipchainindex-- 
	gosub, ClipChainUpdateIndicator
}

ClipChainMoveUp:
	ClipChainLvHandle.Move(1) ; Move selected rows up.
	Gosub, ClipChainSet
return

ClipChainMoveDown:
	ClipChainLvHandle.Move() ; Move selected rows down.
	Gosub, ClipChainSet
return

ClipChainInsertGuiGuiExit:
ClipChainInsertGuiGuiClose:
ClipChainInsertGuiOK:

	Gui, ClipChainInsertGui:Submit, Destroy
	ClipChainInsertActive:=1
Return

ClipChainInsertGuiCancel:
	Gui, ClipChainInsertGui:Destroy
	ClipChainInsertActive:=1
Return

ClipChainLoadFile:
	Menu, ClipChainLoadFile, Add
	Menu, ClipChainLoadFile, Delete
	Menu, ClipChainLoadFile, Add
	Menu, ClipChainLoadFile, Delete
	Menu, ClipChainLoadFile, Add, ClipChain.xml, MenuHandlerClipChainLoadFile
	Menu, ClipChainLoadFile, Add
	Loop, %A_ScriptDir%\ClipData\ClipChain\*.xml
	{
		If (A_LoopFileName = "ClipChain.xml")
			Continue
		Menu, ClipChainLoadFile, Add, %A_LoopFileName%, MenuHandlerClipChainLoadFile
	}
	Menu, ClipChainLoadFile, Show
Return

MenuHandlerClipChainLoadFile:
	If (XA_Load(A_ScriptDir "\ClipData\ClipChain\" A_ThisMenuItem) = 1) ; the name of the variable containing the array is returned OR the value 1 in case of error
	{
		MsgBox, 16, ClipChain, %A_ThisMenuItem% seems to be corrupt, starting new empty ClipChain.
		FileDelete, %A_ScriptDir%\ClipData\ClipChain\%A_ThisMenuItem%
		ClipChainData:=[]
	}
	Gui, ClipChain:Default
	LV_Delete()
	Gosub, ClipChainListview
Return

; v1.5.1 for #If Hotkeys
ClipChainActive()
{
	If (WinExist("CL3ClipChain ahk_class AutoHotkeyGUI") and (ClipChainPause <> 1))
		Return true
	Else
		Return false
}

Mouse_IsOver(WinTitle){
	Global
	MouseGetPos,,, Win
	Return WinExist(WinTitle . " ahk_id " . Win)
}


#include %A_ScriptDir%\lib\class_lv_rows.ahk
