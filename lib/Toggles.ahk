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
  Iniread, EnteringRotationsStatus, data.ini, Options, EnteringRotations
    Menu, Tray, Add, EnteringRotations, EnteringRotations
    EnteringRotations:= EnteringRotationsStatus = 1 ? 1 : ""
    if EnteringRotations
      Menu, Tray, Check, EnteringRotations

  Iniread, TempCodeStatus, data.ini, Options, TempCode
    Menu, Tray, Add, TempCode, TempCode
    Tempcode:= TempcodeStatus = 1 ? 1 : ""
    if TempCode
      Menu, Tray, Check, TempCode

	TempCode(){
		global
		Menu, Tray, ToggleCheck, TempCode
		If TempCode:= !TempCode
		{
			IniWrite, 1, data.ini, Options, TempCode
			Menu, Tray, Check, TempCode
		}
		else 
		{
			IniWrite, 0, data.ini, Options, TempCode
			Menu, Tray, unCheck, TempCode  
		}
  }

showVarbar(){
	global
	msgbox, %showVarBar%
	}

ToggleHandler(VarName, ItemName, ItemPos, MenuName){
	global
	; VarName:=%ItemName%
		
		; PassedVar:=ItemName
		Menu, Tray, ToggleCheck, % ItemName
		If VarNameStatus:=!VarNameStatus
		{
			Menu, Tray, Check,  % ItemName
			; Menu, Tray, Check,  % VarName
			IniWrite, 1, data.ini, Options, %ItemName%
		}
		else 
		{
			Menu, Tray, unCheck, % ItemName
			null:=""
			IniWrite, %null%, data.ini, Options, %ItemName%

    }
		Iniread, %ItemName%, data.ini, Options, %ItemName%
		return 
}

togglemenu(VarName){ 
		global
		VarNameFunc:= Func("ToggleHandler").Bind(%VarName%)
		; VarNameFunc:= Func(VarName) ;.Bind(VarName)
		Iniread, VarNameStatus, data.ini, Options, %VarName%
    VarNameCheck:= VarNameStatus = 1 ? 1 : ""
    Menu, Tray, Add, %VarName%, % VarNameFunc
		if VarNameCheck
      Menu, Tray, Check, % VarName
			; Varname:=VarNameCheck
		return VarNameCheck
      }

  Iniread, SwitchWorkSheetsStatus, data.ini, Options, SwitchWorkSheets
    SwitchWorkSheets:= SwitchWorkSheetsStatus = 1 ? 1 : "" 
    Menu, Tray, Add, SwitchWorkSheets, SwitchWorkSheets
    if SwitchWorkSheets
      Menu, Tray, Check, SwitchWorkSheets


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

	SwitchWorkSheets(){
	global
	Menu, Tray, ToggleCheck, SwitchWorkSheets
	If SwitchWorkSheets:= !SwitchWorkSheets
	{
		IniWrite, 1, data.ini, Options, SwitchWorkSheets
		Menu, Tray, Check, SwitchWorkSheets
	}
	else 
	{
		IniWrite, 0, data.ini, Options, SwitchWorkSheets
		Menu, Tray, unCheck, SwitchWorkSheets
	}
	Varbar.Show()
}
NoIdle(){
	global
	Menu, Tray, ToggleCheck, NoIdle
	If NoIdle:= !NoIdle
	{
		SetTimer, NoidleTimer, % (3*60*1000)
		Menu, Tray, Check, NoIdle
	}
	else 
	{
		Menu, Tray, unCheck, NoIdle
		Settimer, NoidleTimer,off
	}
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
  EnteringRotations(){
	  global
		Menu, Tray, ToggleCheck, EnteringRotations
		If EnteringRotations:= !EnteringRotations
		{
			IniWrite, 1, data.ini, Options, EnteringRotations
			Menu, Tray, Check, EnteringRotations
		}
		else 
		{
			IniWrite, 0, data.ini, Options, EnteringRotations
			Menu, Tray, unCheck, EnteringRotations
		}
  }
