#NoEnv
#SingleInstance force
;SetBatchLines -1
 SetTitleMatchMode, 2
ListLines Off
;SendMode Input
SetWorkingDir %A_ScriptDir%

; Autoexecute
	MakeGUI()
   ; MakeTrayMenu()
    MakeCallTable()
    LoadListView()
return

GuiCall:
    Call[A_GuiControl].()
return

MenuCall:
    Call[A_ThisMenuItem].()
return

OpenFavorite:
    EnvGet, BatchCode, BatchCodeEnv
    EnvGet, ProductCode, ProductCodeEnv
    LV_GetText(Path, A_ThisMenuItemPos, 2)
    if (A_ThisHotkey = "^F14") {
        NewWindow(Path,Productcode)
    }    
    if (A_ThisHotkey = "Ralt") {
        NewWindow(Path,Productcode)
    }
    else {
        WinWaitActive ahk_id %WinId%
        Call[WinGetClass("A")].(Path)
    }
return

GuiClose:
    Cancel()
    Gui, IngredientList:destroy
return

Ralt::Menu Favorites, Show
F15 & F14::Menu Favorites, Show
F14 & Ctrl::Menu Favorites, Show
;~ return

#If Call.HasKey(ClassMouseOver())
MButton::
    WinId := WinMouseOver()
    WinActivate ahk_id %WinId%
    Menu Favorites, Show
return

MakeCallTable()
{
    global Call := []
    
    Call["MyList"] := Func("UpdateButtons")
    Call["&Add"] := Func("Add")
    Call["&Remove"] := Func("Remove")
    Call["&Modify"] := Func("Modify")
    Call["&Separator"] := Func("Separator")
    Call["Move &Up"] := Func("MoveUp")
    Call["Move &Down"] := Func("MoveDown")
    Call["&OK"] := Func("OK")
    Call["&Cancel"] := Func("Cancel")
    Call["Re&vert"] := Func("LoadListView")
    Call["About"] := Func("About")
   ; Call["Edit Custom Menu"] := Func("ShowGUI")
    Call["Edit This Menu"] := Func("ShowGUI")
    
    Call["Progman"] := Func("NewWindow")
    Call["CabinetWClass"] := Func("Explorer")
    Call["#32770"] := Func("Dialog")
    Call["ConsoleWindowClass"] := Func("Console")
}

LoadListView()
{
	if FileExist("DirMenu.txt")
		ReadFile()
	else
		FirstRun()
    GuiControl Disable, Re&vert
}

; If there is no settings file, set up a a default custom menu
FirstRun()
{
    LV_Delete()
    LV_Add("Select Focus", "Mats Workbook", "C:\Users\mmignin\OneDrive - Vitaquest International\Mats Workbook.xlsm")
    LV_Add("", "`t---Folders---", "C:\")
    LV_Add("", "Label Copy Final", "\\10.1.2.118\Label Copy Final")
    LV_Add("", "Label Copy Scan", "Q:\QC LAB\Label Copy Scans") 
    LV_Add("", "mfg", "\\10.1.2.118\Ecopy\mfg")
    LV_Add("", "Vendor Label Copy", "\\10.1.2.118\share\SCANS\Lab\jpatel\Finished Product Labels")    
    LV_Add("", "`t---Logs---", "")
    LV_Add("", "LMS Checklist", "\\10.1.2.118\lms\Products on LMS\LMS Products Checklist.xlsm")
    LV_Add("", "Sample Log 2020", "\\10.1.2.118\share\QC LAB\SAMPLE LOG 2020.xlsx")
    LV_Add("", "Sample to QC Log", "\\10.1.2.118\share\QA FINSHED GOODS\Samples Photo Library\SAMPLES TO QC\SAMPLE TO QC 2020 1.xlsx")
    LV_Add("", "Master Rotation", "\\10.1.2.118\share\QC LAB\Master Rotation WB 2014 (Start from 10-14-2014).xlsx")
        LV_Add("", "QC_appearance Test", "\\10.1.2.118\share\QC LAB\QC_Appearance Test.xlsx")
    LV_ModifyCol(1, "AutoHdr")
    LV_ModifyCol(2, "AutoHdr")
    UpdateMenu()
}

; Read the ListView entries from the settings file
ReadFile()
{
    LV_Delete()
    Loop Read, DirMenu.txt
    {
        StringSplit Item, A_LoopReadLine, %A_Tab%
		LV_Add("", Item1, Item2)
    }
    LV_Modify(1, "Select Focus")
    LV_ModifyCol(1, "AutoHdr")
    LV_ModifyCol(2, "AutoHdr")
    UpdateMenu()
}

; Update the custom menu to match the ListView
UpdateMenu()
{
    Menu Favorites, Add
    Menu Favorites, DeleteAll
    Loop % LV_GetCount() {
        LV_GetText(Name, A_Index, 1)
        if (Name = "---------------")
            Menu Favorites, Add
        else
            Menu Favorites, Add, %Name%, OpenFavorite
    }
    Menu Favorites, Add
   ; Menu Favorites, Add, Edit This Menu, MenuCall
}

NewWindow(Path,Product_Code)
{
    Run Explorer.exe /n`,%Path%
    winwait, %path%,, 3
        if errorlevel
            return
    sleep 1000 
    WinActivate, %path%,
    click, 1483, 110, 1
        ;~ send,^e
    sleep 700
        Sendinput,%Product_Code%
        sleep 200
        send,{enter}
}

Console(Path)
{
    Send cd /d %Path%{Enter}
}

Dialog(Path)
{
    WinGetTitle Title, A
    if not RegExMatch(Title, "i)save|open") {
        NewWindow(Path,Product_Code)
        return
    }
    ControlFocus Edit1, A
    ControlGetText OldText, Edit1, A
    ControlSetText Edit1, %Path%, A
    ControlSend Edit1, {Enter}, A
    ControlSetText Edit1, %OldText%, A
}

Explorer(Path)
{
    if RegExMatch(A_OSVersion, "WIN_VISTA|WIN_7") 
        Win7_Explorer(Path)
    else
        XP_Explorer(Path)
}

Win7_Explorer(Path)
{
    Send !d
    Send %Path%{Enter}
}

XP_Explorer(Path)
{
    if not ControlExist("Edit1", "A") {
        PostMessage 0x111, 41477, 0, , A ; Show Address Bar
        while not ControlExist("Edit1", "A")
            Sleep 0
        PostMessage 0x111, 41477, 0, , A ; Hide Address Bar
    }
    ControlFocus Edit1, A
    ControlSetText Edit1, %Path%, A
    ControlSend Edit1, {Enter}, A
}

; Add a new entry to the ListView
Add()
{
    Gui +OwnDialogs
    
    FileSelectFolder Path, *C:\
    if (Path = "")
        return
    
    InputBox Name, Menu Name, Please Enter a name for the new entry:, , 250, 120
    if (ErrorLevel)
        return
    
    LV_Insert(LV_GetCount() ? LV_GetNext() : 1, "Select Focus", Name, Path)
    LV_ModifyCol(1, "AutoHdr")
    LV_ModifyCol(2, "AutoHdr")
    GuiControl Enable, Re&vert
}

; Remove an entry from the ListView
Remove()
{
    LV_Delete(LV_GetNext())
    GuiControl Enable, Re&vert
}

; Modify an existing entry in th ListView
Modify()
{
    Gui +OwnDialogs
    SelectedRow := LV_GetNext()
    LV_GetText(Name, SelectedRow, 1)
    LV_GetText(Path, SelectedRow, 2)
    
    FileSelectFolder NewPath, *%Path%
    if (NewPath = "")
        return
    
    InputBox NewName, Menu Name
           , Enter a name for the entry:, , 250, 120, , , , , %Name%
    if (ErrorLevel)
        return
    
    LV_Modify(SelectedRow, "", NewName, NewPath)
    LV_ModifyCol(1, "AutoHdr")
    LV_ModifyCol(2, "AutoHdr")    
    GuiControl Enable, Re&vert
}

; Insert a separator line into the ListView
Separator()
{
    LV_Insert(LV_GetCount() 
            ? LV_GetNext() 
            : 1
            , "Select Focus", "---------------", "---------------")
    GuiControl Enable, Re&vert
}

; Move an entry down in the ListView
; LV_Modify is used to avoid flickering
MoveDown()
{
    SelectedRow := LV_GetNext()
    LV_GetText(ThisName, SelectedRow, 1)
    LV_GetText(ThisPath, SelectedRow, 2)
    
    LV_GetText(NextName, SelectedRow + 1, 1)
    LV_GetText(NextPath, SelectedRow + 1, 2)
    
    LV_Modify(SelectedRow, "", NextName, NextPath)
    LV_Modify(SelectedRow + 1, "Select Focus", ThisName, ThisPath)
    GuiControl Enable, Re&vert
}

; Move an entry up in the ListView
; LV_Modify is used to avoid flickering
MoveUp()
{
    SelectedRow := LV_GetNext()
    LV_GetText(ThisName, SelectedRow, 1)
    LV_GetText(ThisPath, SelectedRow, 2)
    
    LV_GetText(PriorName, SelectedRow - 1, 1)
    LV_GetText(PriorPath, SelectedRow - 1, 2)
    
    LV_Modify(SelectedRow, "", PriorName, PriorPath)
    LV_Modify(SelectedRow - 1, "Select Focus", ThisName, ThisPath)
    GuiControl Enable, Re&vert
}

; Save the ListView entries to the settings file
OK()
{
    Gui Cancel    
    FileDelete DirMenu.txt
    
    Loop % LV_GetCount() {
        LV_GetText(Name, A_Index, 1)
        LV_GetText(Path, A_Index, 2)
        FileAppend % Name . A_Tab . Path "`n", DirMenu.txt
    }
    FileSetAttrib +H, DirMenu.txt
    GuiControl Disable, Re&vert
    UpdateMenu()
}

Cancel()
{
    Gui Cancel
    LoadListView()
}

; This is called anytime the listview changes
UpdateButtons()
{
    Critical

    TotalNumberOfRows := LV_GetCount()
    
    ; Make sure there is always one selected row
    SelectedRow := LV_GetNext(0, "Focused")
    LV_Modify(SelectedRow, "Select")

    GuiControl % (TotalNumberOfRows = 0) ? "Disable" : "Enable", &Remove
    GuiControl % (SelectedRow <= 1) ? "Disable" : "Enable", Move &Up
    GuiControl % (SelectedRow = TotalNumberOfRows) ? "Disable" : "Enable", Move &Down
}

WinMouseOver()
{
    MouseGetPos, , , WinId
    return WinId
}

WinGetClass(WinTitle = "", WinText = "", ExTitle = "", ExText = "")
{
    WinGetClass out, % WinTitle, % WinText, % ExTitle, % ExText
    return out
}

ClassMouseOver()
{
    return WinGetClass("ahk_id" WinMouseOver())
}

; Determine if a particular control exists in a particular window
ControlExist(Cntrl = "", WTitle = "", WText = "", ExTitle = "", ExText = "")
{
    ControlGet out, Enabled,, % Cntrl, % WTitle, % WText, % ExTitle, % ExText
    return not ErrorLevel
}

About()
{
    MsgBox, , About DirMenu,
    ( LTrim
        DirMenu gives you easy access to your favorite folders.

        Clicking middle mouse button while hovering over certain window types
        will bring up a custom menu of your favorite folders. Upon selecting a
        favorite, the script will instantly switch to that folder within the 
        active window. 
        
        Holding down the Shift key while clicking the middle mouse button
        will bring up the menu regardless of which window the mouse is over.
        The folder in this case will be shown in a new Explorer window.

        By default, The following window types are supported:
        Standard file-open or file-save dialogs
        Explorer windows
         (command prompt) windows
        The Desktop

        A set up screen is provided that makes it easy to change the folders
        shown or change their order.

        Both Windows XP and Windows 7 are supported.

        rbrtryn 2012
    )
}

ShowGUI()
{
    Gui Show, , Favorite Folders
}

MakeGUI()
{
    global
    
    Gui , Add, ListView
        , xm w350 h240 Count15 -Multi NoSortHdr AltSubmit vMyList gGuiCall
        , Name|Path
    Gui, Add, Button, x+10 w75 r1 gGuiCall, &Add
    Gui, Add, Button, w75 r1 gGuiCall, &Remove
    Gui, Add, Button, W75 r1 gGuiCall, &Modify
    Gui, Add, Button, w75 r1 gGuiCall, &Separator
    Gui, Add, Button, w75 r1 gGuiCall, Move &Up
    Gui, Add, Button, w75 r1 gGuiCall, Move &Down
    Gui, Add, Button, xm+85 w75 r1 gGuiCall Default, &OK
    Gui, Add, Button, x+20 w75 r1 gGuiCall, &Cancel
    Gui, Add, Button, x+20 w75 r1 gGuiCall, Re&vert
}

;~ MakeTrayMenu()
;~ {
	;~ Menu Default Menu, Standard
	;~ Menu Tray, NoStandard
	;~ Menu Tray, Add, About, MenuCall
	;~ Menu Tray, Add
	;~ Menu Tray, Add, Default Menu, :Default Menu
	;~ Menu Tray, Add
	;~ ;Menu Tray, Add, Edit Custom Menu, MenuCall
	;~ ;Menu Tray, Default, Edit Custom Menu
;~ }
