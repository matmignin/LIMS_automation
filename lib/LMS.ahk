




	Class LMS {
OrientBoxes(){
	global
	Ifwinactive, NuGenesis LMS - \\Remote
	if errorlevel
		return
	CoordMode, mouse, Window
	WinGetPos,wX,wY,wW,wH, NuGenesis LMS - \\Remote
	xSamplesTab:=(Ww/2)-80
	xRequestsTab:=(Ww/2)+20
	xDocumentsTab:=(Ww/3)+(Ww/3)-50
	xResultsTab:=(Ww/3)+(Ww/3)-50
	xDivider:=(Ww/5)
	xWorkTab:=334, 47
	yWorkTabFilterBar:=82
	yWorkTabSearch:=128
	XCoA:=(Ww-131)
	xClearfilter:=xDivider+16
	yClearfilter:=270

	xProductsSearch:=xDivider+180
	xSpecsSearch:=xDivider+183
	yProductsSearch:=93
	ySpecsSearch:=93
	xRequestsSearch:=xDivider+150 ;103
	xRequestSearch_default:=xDivider+151
	xSamplesSearch_default:=xDivider+145
	xResultsSearch_Default:=xDivider+130
	xSamplesSearch:=xDivider+145
	xResultsSearch:=xDivider+105
	xTestsSearch:=xDivider+125
	xDocumentsSearch:=xDivider+25
	
	yProductFilter:=181
	ySpecsFilter:=181
	
	xProductFilter:=xDivider+20
	xBatchFilter:=xDivider+60
	xLotFilter:=xDivider+100
	yMyWorkFilter:=182

	xDocumentsFilter:=xDivider+68
	yDocumentsFilter:=300
	xFormulationFilter:=xDivider+75
	xBatchFilter:=xDivider+168
	xLotFilter:=xDivider+229
	; xProductSearch:=xDivider+35
	xEdit_Composition:=76
	yEdit_Composition:=443 
	xAdd_methods:=74
	yAdd_methods:=565
}
ClearFilter(){
	Global
	LMS.Filterstatus()
	Clk(xClearFilter,yClearFilter,"Right")
	sleep 200
	send, {shiftDown}{tab 2}{shiftup}{enter}
	}
SearchBar(Code:="",PostCmd:=""){
	Global
	WinActivate, ahk_exe WFICA32.EXE
	ControlGetText, Batch, Edit2, VarBar
	ControlGetText, Lot, Edit3, VarBar
	ControlGetText, Product, Edit1, VarBar
	LMS.OrientBoxes()
	blockinput on
	Mouse_Save()
   if winactive("Select methods tests - \\Remote")
   click, 246,77, 2
   else If winactive("Register new samples - \\Remote")
   send, {click 180, 103, 2}%Product%%mouseReturn%
   else if winactive("NuGenesis LMS - \\Remote")
          ;   ; LMS.DetectTab()
    LMS.DetectTab()
		if (Tab="Products")
			clk(xProductsSearch,yProductsSearch)
		else if (Tab="Specs")
      clk(xSpecsSearch,ySpecsSearch)
		else if (Tab="Requests")
      clk(xRequestsSearch,yWorkTabSearch)
		else if (Tab="Documents")
      clk(xDocumentsSearch,yWorkTabSearch)
		else if (Tab="Samples")
      clk(xSamplesSearch,yWorkTabSearch)
		else if (Tab="Results")
      clk(xResultsSearch,yWorkTabSearch)
		else if (Tab="Tests")
      clk(xTestsSearch,yWorkTabSearch)
    else
      msgbox, no dice
			send, ^{a}%Code%^{a}
		if PostCmd!=""
			send % PostCmd
	sleep 300
	blockinput off
;   tooltip(Tab,,10,10,2)
	; sleep 300

	return
	}


FilterBar(Code){

	}

FilterStatus(){
 global
	WinActivate, NuGenesis LMS - \\Remote
   WinGetPos,wX,wY,wW,wH, NuGenesis LMS - \\Remote
   xFilterIcon:=Ww-22
   yFilterIcon:=131
	winactivate, ahk_exe WFICA32.EXE
	if WinActive("NuGenesis LMS - \\Remote")
		PixelSearch, FoundX, FoundY, %xFilterIcon%, %yFilterIcon%, %xFilterIcon%+2, %YFilterIcon%+2, 0xf9e681, 10, Fast RGB
		{
			If ErrorLevel  ;is yellow/on?
				clk(xFilterIcon,yFilterIcon)
			else ;is off/blue
				Return
		}
		return	
	return
}



CoA(){
	global
	Click
	sleep 100
	clk(xCoa, yWorkTabSearch)
	sleep 100
	send, +{tab}{enter}
	}

	ViewCoA(){
	global
	lms.OrientBoxes()
	lms.DetectTab()
	if (Tab = "Samples" || Tab= "Requests")
		LMS.CoA()
	If (Tab = "Products")
		clk(xEdit_Composition,yEdit_Composition)
	If (Tab="Specs")
		clk(xAdd_Methods,yAdd_Methods)
	else
		tooltip(Tab)
		return
	}

SaveCode(){
		Send, {CtrlDown}{a}{c}{Ctrlup}
		sleep 100
		send, {enter}
		FileAppend, %Clipboard%`n, Codes.txt
		return
}




AddCOASpace(){
	Global
	WinActivate, Composition - \\Remote
	click
	Mouse_Save()
	click 74, 64
	sleep 200
	send, {click 354, 336}{end}{enter}{click 283, 559}
	WinActivate, Composition - \\Remote
	send %mouseReturn%
	MouseMove, 0, 36, 0, r
	sleep 200
	return
}
RemoveCOASpace(){
	Global
	WinActivate, Composition - \\Remote
	click
	Mouse_Save()
	click 74, 64
	sleep 200
	send, {click 354, 336}{F8 2}{backspace}{click 283, 559}
	WinActivate, Composition - \\Remote
	send %mouseReturn%
	MouseMove, 0, 36, 0, r
	sleep 200
	return
}

Methods() {
	global
	; Mouse_Click("searchBar_SelectMethodsTest")
	WinActivate, Select methods tests - \\Remote
	click, 229, 72,2
	send, ^a
	Loop, Read, Methods.ini
	{
	If A_Index = 1
		Continue
	Method := StrSplit(A_LoopReadLine, "=")
	; MethodGroup := StrSplit(A_LoopReadLine, "|")
	Selection:= % Method[1]
	; Group:= % MethodGroup[2]
	Menu, Methodmenu, add, %Selection%, Methods
	}
	Menu, MethodMenu, Show,
	return


}

CheckDepartment(){
	global
	;clipboard:=
Send, ^c
sleep 300
if (Regexmatch(Clipboard, "(\bAnalytical \(In Process\)|\bI, Analytical\b|\bIn Process, Analytical\b)", Anal) > 0)
	Department:="Analytical"
else if (Regexmatch(Clipboard, "(\bFinished, \bMicro\b|\bF, Micro\b|\bMicro \(Finished\)|\bMicro Lab\b)",Micr) > 0)
	Department:="Micro"
else if (Regexmatch(Clipboard, "(\bI, Retain\b|\bIn Process, Retain\b)", Retain) > 0)
	Department:="Retain"
else if (Regexmatch(Clipboard, "(\bI, Physical\b|In Process, Physical\b|\bPhysical \(In Process\))", Phys) > 0)
	Department:="Physical"
else if (Regexmatch(Clipboard, "(\bCT, Physical\b|Coated, Physical\b|\bCoated, Physical\b)", CTPhys) > 0)
	Department:="CTPhysical"
else if (Regexmatch(Clipboard, "(\bCT, Retain\|Coated, Retain\b)", CTRetain) > 0)
	Department:="CTRetain"
else {
	Tooltip(nope)

	sleep 300
	exit
}
}

DeleteRetain(){
	gLOBAL
	MouseGetPos, mx, mY
	InputBox, n, number of retains to delte, , , , , mx, my,
	loop %n%
	{
	sleep 100
	send, {click 61, 258}
	winwait, Delete Tests - \\Remote
	sleep 100
	send, {enter}
	sleep 800
	}
	return
}


DetectTab(){
	global
	Tab:=
	LMS.OrientBoxes()
	winactivate, ahk_exe WFICA32.EXE
	if WinActive("NuGenesis LMS - \\Remote")
	{
		PixelSearch, FoundX, FoundY, 11, 66, 15, 72, 0xF9FBFE, 10, Fast RGB
			If ErrorLevel { ;Product/Spec Tab?
					PixelSearch, FoundX, FoundY, 18, 353, 20, 355, 0x0b77ae, 10, Fast RGB ;icon on
							If ErrorLevel
								Tab=Specs
							else
								Tab=Products
							return
			}
			else { ; is work tab?
				PixelSearch, FoundX, FoundY, 11, 139, 15, 141, 0x54c7f2, 10, Fast RGB ;icon on left
					If ErrorLevel
						Tab=Samples
					else {
						PixelSearch, FoundX, FoundY, 18, 142, 19, 143, 0xffffff, 10, Fast RGB ;icon on left
							If ErrorLevel
								Tab=Requests
							else {
								PixelSearch, FoundX, FoundY, 12, 614, 14, 616, 0x54c7f2, 10, Fast RGB ;icon on left
									If ErrorLevel
										Tab=Documents
									else
										Tab=Tests
								return
							}
						return
					}
				return
			}
		return
	}
	else
		return
}

DetectFilter(){
	global
	Tab:=
	; LMS.OrientBoxes()
	winactivate, ahk_exe WFICA32.EXE
	if WinActive("NuGenesis LMS - \\Remote")
	{
		PixelSearch, FoundX, FoundY, 11, 66, 15, 72, 0xF9FBFE, 10, Fast RGB
			If ErrorLevel { ;Product/Spec Tab?
					PixelSearch, FoundX, FoundY, 18, 353, 20, 355, 0x0b77ae, 10, Fast RGB ;icon on
							If ErrorLevel
								Tab=Specs
							else
								Tab=Products
							return
			}
			else { ; is work tab?
				PixelSearch, FoundX, FoundY, 11, 139, 15, 141, 0x54c7f2, 10, Fast RGB ;icon on left
					If ErrorLevel
						Tab=Samples
					else {
						PixelSearch, FoundX, FoundY, 18, 142, 19, 143, 0xffffff, 10, Fast RGB ;icon on left
							If ErrorLevel
								Tab=Requests
							else {
								PixelSearch, FoundX, FoundY, 12, 614, 14, 616, 0x54c7f2, 10, Fast RGB ;icon on left
									If ErrorLevel
										Tab=Documents
									else
										Tab=Tests
								return
							}
						return
					}
				return
			}
		return
	}
	else
		return
}


}


Methods:
	sleep 200
	InputVar:=A_ThisMenuItem
	IniRead,vOutput, Methods.ini, Methods, %InputVar%
	Sendinput, %vOutput%{enter}
	sleep 300
	click 506, 341
	LMS.Methods()
	return


	Scroll_Fix:
	#If mouse_isover("Result Editor - \\Remote") || mouse_isover("Test Definition Editor - \\Remote") || mouse_isover("Edit Formulation - \\Remote") ||
	wheeldown::
	Mouse.Save()
	Wheel_scroll("130")

	wheelup::Wheel_scroll("-130")
	#if