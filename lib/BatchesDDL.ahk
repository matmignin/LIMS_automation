#NoEnv
SetBatchLines, -1
; ==================================================================================================================================
; The following two variables must be set according to the most recent Gui, Font, ... command before the control is created by
; Gui, Add, ... If the default font is used, leave them empty. (see also OD_MeasureItem())
GuiFontName := "Arial"
GuiFontOpts := ""
Product:="K772"
; ==================================================================================================================================
; Message handlers for owner drawing
OnMessage(0x002C, "ODDDL_MeasureItem") ; WM_MEASUREITEM
OnMessage(0x002B, "ODDDL_DrawItem")    ; WM_DRAWITEM
	; CurrentCode:=[]

   ; CodeList:=[]
   CurrentCodesDDL2 =
		loop, read, C:\Users\mmignin\Documents\VQuest\Data\CurrentCodes.txt
			; CodeList.Insert(A_LoopReadLine)
			CurrentCodesDDL2 .= A_LoopReadLine "|"
; ==================================================================================================================================
CurrentCodesDDL =
(Join|
%CurrentCodesDDL2%
)

Gui, Margin, 10, 10
Gui, Font, %GuiFontOpts%, %GuiFontName%
; Important: You have to add the CBS_OWNERDRAWFIXED (0x0010) as well as the CBS_HASSTRINGS (0x0200) style
Gui, Add, DDL, w600 vDDL hwndHDDL +0x0210, %Product%|%CurrentCodesDDL%
Gui, Add, Button, x+10 yp vBtn, Button
Gui, Add, DDL, xm w600, %DDLContent%
GuiControlGet, Btn, Pos
GuiControlGet, DDL, Pos
Y := DDLY + ((BtnH - DDLH) // 2)
GuiControl, Move, DDL, y%Y%
Gui, Show, , Test
GuiControl, MoveDraw, DDL ; needed to ensure that the control will shown properly after the first Gui, Show, ...
Return



; ==================================================================================================================================
; GuiClose:
; ExitApp
; ==================================================================================================================================
; Sent to the parent window of an owner-drawn DDL when a visual aspect of the combo box has changed.
; WM_DRAWITEM      -> msdn.microsoft.com/en-us/library/bb775923(v=vs.85).aspx
; DRAWITEMSTRUCT   -> msdn.microsoft.com/en-us/library/bb775802(v=vs.85).aspx
; ==================================================================================================================================
ODDDL_DrawItem(wParam, lParam) {
   Static DCBrush := DllCall("GetStockObject", "Int", 18, "UPtr") ; DC_BRUSH
   ; Background and text colors for selected and default states
   Static DefBkgClr := 0xFFFFFF ; white
   Static DefTxtClr := 0x000000 ; black
   Static SelBkgClr := 0xFBF1E5 ; win 10 selection color
   Static SelTxtClr := 0x000000 ; black
   ; OD actions
   Static ODA := {DrawEntire: 1, Select: 2, Focus: 4}
   ; OD states
   Static ODS := {SELECTED: 0x0001, COMBOBOXEDIT: 0x1000}
   ; OD types
   Static ODT := {Menu: 2, ListBox: 2, ComboBox: 3, Button: 4, Static: 5, Header: 100, Tab: 101, ListView: 102}
   ; lParam -> DRAWITEMSTRUCT offsets
   Static OffType := 0
        , OffItem := 8
        , Offaction := OffItem + 4
        , OffState := Offaction + 4
        , OffHWND := OffState + A_PtrSize
        , OffHDC := OffHWND + A_PtrSize
        , OffRECT := OffHDC + A_PtrSize
   Type := NumGet(lParam + OffType, "UInt")
   , Item := NumGet(lParam + OffItem, "Int")
   , State := Numget(lParam + OffState, "UInt")
   , HWND := NumGet(lParam + OffHWND, "UPtr")
   , HDC := NumGet(lParam + OffHDC, "UPtr")
   , RECT := lParam + OffRECT
   If (State & ODS.SELECTED) || (State & ODS.COMBOBOXEDIT) { ; it's either the selection field or a selected item
      DCBrushColor := SelBkgClr
      TxtColor := SelTxtClr
   }
   Else {
      DCBrushColor := DefBkgClr
      TxtColor := DefTxtClr
   }
   DllCall("SetDCBrushColor", "Ptr", HDC, "UInt", DCBrushColor, "UInt")
   , DllCall("FillRect", "Ptr", HDC, "Ptr", RECT, "Ptr", DCBrush)
   , DllCall("SetBkMode", "Ptr", HDC, "Int", 1) ; TRANSPARENT
   , DllCall("SetTextColor", "Ptr", HDC, "Int", TxtColor) ; black
   If !(State & ODS.COMBOBOXEDIT)
      DllCall("InflateRect", "Ptr", RECT, "Int", -2, "Int", 0)
   If (Item >= 0) {
      TxtLen := DllCall("SendMessage", "Ptr", HWND, "UInt", 0x0149, "Ptr", Item, "Ptr", 0, "Ptr") ; CB_GETLBTEXTLEN
      , VarSetCapacity(Txt, TxtLen << !!A_IsUnicode, 0)
      , DllCall("SendMessage", "Ptr", HWND, "UInt", 0x0148, "Ptr", Item, "Ptr", &Txt) ; CB_GETLBTEXT
      ; Low-order byte of uFormat:  DT_VCENTER | DT_EXPANDTABS | DT_EXPANDTABS | DT_TABSTOP
      ; High-order byte of uFormat: The number of characters for each tab. The default number of characters per tab is eight.
      , DllCall("DrawText", "Ptr", HDC, "Str", Txt, "Int", -1, "Ptr", RECT, "UInt", 0x00E4)
   }
   Return True
}
; ==================================================================================================================================
; Sent once to the parent window of an OWNERDRAWFIXED DDL when the control is being created. When the owner receives this message,
; the system has not yet determined the height and width of the font used in the control. That is why you have to set the global
; variables GuiFontName and GuiFontOpts to the name and the options of the most recent Gui, Font, ... command before you add the
; control via Gui, Add, ...
; WM_MEASUREITEM      -> http://msdn.microsoft.com/en-us/library/bb775925(v=vs.85).aspx
; MEASUREITEMSTRUCT   -> http://msdn.microsoft.com/en-us/library/bb775804(v=vs.85).aspx
; ==================================================================================================================================
ODDDL_MeasureItem(wParam, lParam, Msg, Hwnd) {
   ; lParam -> MEASUREITEMSTRUCT offsets
   Static OffHeight := 16
   Global GuiFontName, GuiFontOpts
   Gui, MeasureItemGUI:Font, %GuiFontOpts%, %GuiFontName%
   Gui, MeasureItemGUI:Add, ListBox, hwndHLB, 1|2|3
   ItemHeight := DllCall("SendMessage", "Ptr", HLB, "UInt", 0x01A1, "Ptr", 0, "Ptr", 0, "Int") + 2
   Gui, MeasureItemGUI:Destroy
   NumPut(ItemHeight, lParam + 0, OffHeight, "Int")
   Return True
}