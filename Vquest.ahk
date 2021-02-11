#Persistent 
#NoEnv
#SingleInstance,Force
#HotkeyModifierTimeout 100
detecthiddenwindows, on
SetTitleMatchMode, 2
settitlematchmode, slow
#MaxHotkeysPerInterval 800
setwindelay, 250
AutoTrim, On
Setnumlockstate Alwayson
setCapslockstate alwaysoff
SetscrolllockState, alwaysOff
Menu, Tray, Icon, Robot.ico 
	rightScreen:=		A_ScreenWidth-1270
	righterScreen:=	A_ScreenWidth-980
	RightofMonitor1:=	A_ScreenWidth-980
	RightofMonitor2:=	1000
	RightOfMonitor3:=	1920+1000
	TopScreen:=		0 
	TopOfMonitor1:=	0
	TopOfMonitor2:=	1445 
	TopOfMonitor3:=	5
	BottomScreen:=		A_ScreenHeight-40
	VarWindowX:=		RightofMonitor2
	VarWindowY:=		TopOfMonitor2
SetKeyDelay, 1,5 
EnvGet, Batch, Batch
EnvGet, ProductCode, ProductCode
Envget, Name, Name
Envget, Customer, Customer
Envget, Lot, Lot
Envget, Description, Description
Envget, Iteration, Iteration
VariableBar()

#include LMS\Product_Tab.ahk 
#Include LMS\Spec_Tab.ahk
#include LMS\RotationsMenu.ahk
#include LMS\Samples_Tab.ahk
#Include LMS\Main.ahk
#Include Apps\ViM.ahk
#Include Apps\Browsers.ahk
#include Apps\Other.ahk
#include Apps\Outlook.ahk
#Include Apps\OneNote.ahk
#Include Apps\AhkStudio.ahk
#Include Apps\Excel.ahk
#Include Apps\RemoteDesktop.ahk
#Include Functions.ahk
#Include Hotkeys.ahk
#IfWinActive,
return



	
	


mymenu() { ;#[MyMenu]
Try {
if winactive("ahk_exe WFICA32.EXE") || winactive("ahk_exe EXCEL.EXE") || WinActive("ahk_exe OUTLOOK.EXE") || winactive("AHK Studio")
{
	EnvGet, ProductCode, ProductCode
	EnvGet, Batch, Batch
	Envget, Name, Name
	Envget, Customer, Customer
	Envget, Lot, Lot
	Envget, Description, Description
	Envget, Iteration, Iteration
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
	menu, mymenu, add
	Menu, myMenu, Add, Iteration, myMenuHandler
	loop 7
		Menu, IterationMenu, Add, %A_Index%, myMenuHandler
	Menu, myMenu, Add, Iteration, :IterationMenu
		menu, mymenu, rename, Iteration, Iteration `t &%Iteration%
	
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
		set_ProductCode()
	else if A_thismenuItem contains Batch
		Set_Batch() 
	else if A_thismenuItem contains Name
		set_name()
	else if A_thismenuItem contains Customer
		set_customer()
	else if A_thismenuItem contains Lot
		Set_Lot() 
		else
menu, mymenu, deleteAll
return
;exitapp
	return 


}
