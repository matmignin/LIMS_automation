    #Persistent
    #NoEnv
    #SingleInstance,Force
    #KeyHistory 300
    #InstallKeybdHook
    #InstallMouseHook
    ; #HotkeyInterval 50
    #MaxHotkeysPerInterval 500
    #MaxThreadsBuffer, On
    #InstallKeybdHook
    #InstallMouseHook
    ; #HotkeyModifierTimeout 1
    try Menu, Tray, Icon, lib\fish.ico
    #maxthreadsperhotkey, 1
    SetControlDelay, 1
    SetKeyDelay, 1, 0.25
    setwindelay, 250
    SetNumLockState, on
    SetscrolllockState, off
    CoordMode, mouse, Window
    SetMouseDelay, 1
    SetDefaultMouseSpeed, 1
    SetTitleMatchMode, 2
	 AutoTrim, On
    CrLf=`r`n
    SetWorkingDir, %A_ScriptDir%
    SetNumlockState Alwayson
    setcapslockstate alwaysoff
    SetscrolllockState, alwaysOff
	ParsedSample:=[]
#Include C:\Users\mmignin\Documents\VQuest\lib\DebugVars\TreeListView.ahk


clipboard:=
  send, ^c 
  clipwait, 2
    if errorlevel
  sleep 400

  Loop, parse, Clipboard, `t
  ParsedSample.insert(A_LoopField)
  ShipToColumn:=HasValue(ParsedSample, "Ship To")
  TradeNameColumn:=HasValue(ParsedSample, "Product Trade Name")
  TotalColumns:=Parsedsample.maxindex()//2
  ShipToIndex:=ShipToColumn + TotalColumns
  TradeNameIndex:=TradeNameColumn + TotalColumns
  InputVar:=ParsedSample[ShipToIndex]
  Input2Var:=ParsedSample[TradeNameIndex]
  IniRead,vOutput, Customers.ini, Customers, %InputVar%
  ; Pop(Input2Var,Inputvar "`t" vOutput)
; tlv := new TreeListViewTest(TestNode(ParsedSample), "w600 h400", "Index|Variable")
; tlv := new TreeListViewTest(TestNode(ParsedSample), "w600 h400", "Index|Variable")
; Dropdown()
; Gui Show
return



DropDown() {
	Loop, Read, Customers.ini
	{
	If A_Index = 1
		Continue
	Method := StrSplit(A_LoopReadLine, "=")
	  ; MethodGroup := StrSplit(A_LoopReadLine, "|") ;for a 2nd split
	Selection:= % Method[1]
    ; Group:= % MethodGroup[2] ;for a second split
	Menu, Methodmenu, add, %Selection%, DropDown
	}
	Menu, MethodMenu, Show,
	return

	DropDown:
		InputVar:=A_ThisMenuItem
		IniRead,vOutput, Customers.ini, Customers, %InputVar%
		Pop(Inputvar,vOutput)
		return
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

Pop(Line1,Line2:=""){
  global
try {
  gui, TestPop:destroy ;:
  settimer, destroyGui, off
}
TestPopColor1:="CE6D4B"
TestPopColor2:="FFFFFF"
TestPopTrans:=190
CoordMode, mouse, Screen
MouseGetPos, TestPop_x,TestPop_y,
TestPop_y:=TestPop_y+30
Gui, TestPop: +AlwaysOnTop +Disabled -SysMenu +Owner -Caption +ToolWindow +HwndGUIID  ;+AlwaysOnTop +owner +HwndGUIID +Owner avoids a taskbar button.

Gui, TestPop:color,%TestPopColor1%, %TestPopColor2%  
Gui, TestPop:Font,s16 cBlack Bold, Consolas
Gui, TestPop:Add, Text,left, %Line1%
Gui, TestPop:Font,s10 cBlack Bold, Consolas
  if (Line2)
    Gui, TestPop:Add, Text,Center, %Line2%
Gui, TestPop:Show, NoActivate x%TestPop_x% y%TestPop_y%
 WinSet, Transparent, %TestPopTrans%, AHK_Id %GUIID%
CoordMode, mouse, Window

settimer, destroyGui, -3000
return
}

DestroyGui:
  try gui, TestPop:destroy
return





; For testing cleanup of nodes (on control destruction
; or when object (value 2) is replaced with string):
; tlv.root.children[3].children.push(new RefCountTestNode)
tlv.InsertChild(tlv.root, 3, nz := TestNode([], "z"))
tlv.InsertChild(nz, 1, new RefCountTestNode), nz := ""
class RefCountTestNode {
    values := ["One", "Two"]
    __delete() {
        MsgBox Delete RefCountTestNode
    }
}


class TreeListViewTest extends TreeListView {
    AfterPopulate() {
        LV_ModifyCol(1, 150)
        LV_ModifyCol(2, "AutoHdr")
        LV_ModifyCol(3, "AutoHdr")
    }
    CanEdit(r, c) {
        ; This is just to show how tabbing works when some cells are
        ; not editable.
        if (c != "" && LV_GetText(text, r, c) && InStr(text, "object"))
            return false
        return base.CanEdit(r, c)
    }
}

; This is used to construct a tree from an object, but since the TLV
; allows a node to have both editable values and children, they aren't
; linked (i.e. replacing the initial "Object" value does not affect the
; child nodes).
TestNode(value, name:="") {
    this := {}
    this.values := [GetValueString(name), GetValueString(value)]
    if IsObject(value) {
        this.expandable := true
        this.children := []
        for k,v in value
            this.children.Push(TestNode(v, k))
    }
    return this
}

GetValueString(value) {
    if IsObject(value) {
        try if value.ToString
            return value.ToString()
        try if className := value.__Class
            return className
        return "Object"
    }
    return value
}