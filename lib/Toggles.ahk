copypasteToggle:=0
TabToggle=0

    if (ShowSampleID = 1)
      Menu, Tray, Check, showsampleID
    else {
      Menu, Tray, unCheck, showsampleID
      showsampleID:=
      }
return

MenuCheckboxes:
return


ToggleHandler(VarName, ItemName, ItemPos, MenuName){
	global
	; VarName:=%ItemName%
		
		; PassedVar:=ItemName
		Menu, %MenuName%, ToggleCheck, % ItemName
		If VarNameStatus:=!VarNameStatus
		{
			Menu, %MenuName%, Check,  % ItemName
			; Menu, Tray, Check,  % VarName
			IniWrite, 1, data.ini, Options, %ItemName%
		}
		else 
		{
			Menu, %MenuName%, unCheck, % ItemName
			null:=""
			IniWrite, %null%, data.ini, Options, %ItemName%

    }
		Iniread, %ItemName%, data.ini, Options, %ItemName%

		return ItemName
}

CreateMenu(VarName,MenuType:="Tray"){ 
		global
		VarNameFunc:= Func("ToggleHandler").Bind(%VarName%)
		; VarNameFunc:= Func(VarName) ;.Bind(VarName)
		Iniread, VarNamecheck, data.ini, Options, %VarName%
		sleep 50
		Menu, %MenuType%, Add, %VarName%, % VarNameFunc
		if VarNamecheck=1
      Menu, %MenuType%, Check, % VarName
		else
      Menu, %MenuType%, UnCheck, % VarName
    ; VarNameCheck:= VarNamecheck= 1 ? 1 : ""
			return VarNamecheck= 1 ? 1 : ""
		; else
			; return ""
      }

;; ===Handlers===
ShowNotes(){
  global
  ;  Menu, Tray, ToggleCheck, ShowNotes
  If ShowNotes:= !ShowNotes
  {
  IniRead, Note1, data.ini, Notes, Note1
  IniRead, Note2, data.ini, Notes, Note2
  IniRead, Note3, data.ini, Notes, Note3
  	Notes.Show()
  }
  else
  iniWrite, %Note1%, data.ini, Notes, Note1
  iniWrite, %Note2%, data.ini, Notes, Note2
  iniWrite, %Note3%, data.ini, Notes, Note3
  Notes.Close()
  Varbar.Show()
  }



ShowSampleID(){
  global
  Menu, Tray, ToggleCheck, ShowSampleID
  If ShowSampleID := !ShowSampleID
  IniWrite, 1, data.ini, Options, ShowSampleID
  else
  IniWrite, 0, data.ini, Options, ShowSampleID
  Varbar.Show()
}
ShowCoated(){
  global
  Menu, Tray, ToggleCheck, ShowCoated
  If ShowCoated := !ShowCoated
  IniWrite, 1, data.ini, Options, ShowCoated
  else
  IniWrite, 0, data.ini, Options, ShowCoated
  Varbar.Show()
}
