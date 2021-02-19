#Persistent 
#NoEnv
#SingleInstance,Force
#HotkeyModifierTimeout 800
SetDefaultMouseSpeed, 0
detecthiddenwindows, on
SetTitleMatchMode, 2
settitlematchmode, slow
#MaxHotkeysPerInterval 400
#maxthreadsperhotkey, 1
SetKeyDelay, 1,5 
setwindelay, 250
AutoTrim, On
Setnumlockstate Alwayson
setCapslockstate alwaysoff
SetscrolllockState, alwaysOff
Menu, Tray, Icon, lib\Robot.ico 


;Excel_ConnectTo(0)

; Create an object (array) to save the selected word (value) 
; each time you press your key (combination): 
/*
	
	MyArray := []
	Index := 0
	MaxIndex = 12       ; specific amount of words
	
*/

rightScreen:=		A_ScreenWidth-1270
TopScreen:=		0 


VariableBar()

#include LMS\Product_Tab.ahk 
#Include LMS\Spec_Tab.ahk
#include LMS\RotationsMenu.ahk
#include LMS\Samples_Tab.ahk
#Include LMS\Main.ahk
#Include Hotkeys\ViM.ahk
#include Apps\Other.ahk
#Include Functions.ahk
#Include Hotkeys\Keyboard.ahk
#Include Hotkeys\Enter.ahk
#Include MouseKeys\F13.ahk
#Include MouseKeys\F14.ahk
#Include MouseKeys\F15.ahk
#Include MouseKeys\WheelLeft.ahk
#Include MouseKeys\WheelRight.ahk
#Include MouseKeys\RightButton.ahk
#Include MouseKeys\Middlebutton.ahk
#Include VariableBar.ahk
#Include Testing.ahk

#IfWinActive,
return

F14::F14()

F14 & Mbutton::MouseLocation_Show()












mymenu() {
	Try {
		If Winactive("Edit sample template - \\Remote")
			Menu, myMenu, add, Analytical, myMenuHandler
		Else If Winactive("Edit specification - \\Remote")
		{
			Excel_ConnectTo()
			Menu, myMenu, add, Analytical, myMenuHandler
			Menu, myMenu, add, Physical, myMenuHandler
			Menu, myMenu, add, Micro, myMenuHandler
			Menu, myMenu, add, Retain, myMenuHandler
		}
		
		
		Else if winactive("ahk_exe WFICA32.EXE") || winactive("ahk_exe EXCEL.EXE") || WinActive("ahk_exe OUTLOOK.EXE") || winactive("AHK Studio")
		{
			EnvGet, ProductCode, ProductCode
			EnvGet, Batch, Batch
			Envget, Name, Name
			Envget, Customer, Customer
			Envget, Lot, Lot
			Envget, Description, Description
			Envget, Iteration, Iteration
			Menu, myMenu, Add, Iteration, myMenuHandler
			loop 7
				Menu, IterationMenu, Add, %A_Index%, myMenuHandler
			menu, mymenu, add
			Menu, myMenu, Add, Iteration, :IterationMenu
			menu, mymenu, rename, Iteration, Iteration `t &%Iteration%
			Menu, myMenu, Add, &Product Code`t%ProductCode% , myMenuHandler
			;menu, mymenu, icon, &Product Code`t%ProductCode%, lib\ProductCode.png,,0 
			
			Menu, myMenu, Add, &Batch`t%Batch%, myMenuHandler
			;menu, mymenu, icon, &Batch`t%Batch%, lib\Batch.png,,0 
			
			
			Menu, myMenu, Add, &Lot`t%lot%, myMenuHandler
			;menu, mymenu, icon, &Lot`t%lot%, lib\Lot.png,,0 
			menu, mymenu, add
			
			Menu, myMenu, Add, QuickSelect, myMenuHandler
			Menu, QuickSelectMenu, Add, Enter Results, myMenuHandler
			Menu, myMenu, Add, QuickSelect, :QuickSelectMenu
			
			Menu, myMenu, Add, &Name `t %Name%, myMenuHandler
			
			Menu, myMenu, Add, &Customer `t %Customer%, myMenuHandler
			
		}
		Else If winactive("NuGenesis LMS - \\Remote") 
			menu, myMenu, add, Products_Tab, myMenuHandler
		Menu, myMenu, Show,
		menu, mymenu, deleteAll
		return
	}
	Catch 
		return
	return	
	
	
	myMenuHandler:
	if A_ThisMenuItem between 1 and 5
	{
		Iteration:=A_ThisMenuItem
		envset, Iteration, %Iteration%
	}
	else if A_thismenuitem contains Product Code
		VarSet_ProductCode()
	else if A_thismenuItem contains Batch
		VarSet_Batch() 
	else if A_thismenuItem contains Name
		VarSet_Name()
	else if A_thismenuItem contains Customer
		VarSet_Customer()
	else if A_thismenuItem contains Lot
		VarSet_lot() 
	else if A_thismenuitem contains Analytical 
		Spec_Tab_Edit_Analytical()
	;{
		;If WinActive("Edit sample template - \\Remote")
		;Spec_Tab_EditSampleTemplate_A()
		;else if winactive("Edit specification - \\Remote")		
		;Spec_Tab_EditSpecification_A_A()
		;return
	;}
	else if A_thismenuitem contains Retain
		Spec_Tab_Edit_Retain()
	else if A_thismenuitem contains Micro
		Spec_Tab_Edit_Micro()
	else if A_thismenuitem contains Physical
		Spec_Tab_Edit_Physical()		
	else
		menu, mymenu, deleteAll
	return
	
	
	
}
