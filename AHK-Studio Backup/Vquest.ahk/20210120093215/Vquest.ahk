#Persistent 
#NoEnv
#SingleInstance,Force
#WinActivateForce
;#MenuMaskKey vkFF
#HotkeyModifierTimeout 100
detecthiddenwindows, on
SetTitleMatchMode, 2
settitlematchmode, slow
#MaxHotkeysPerInterval 800
setwindelay, 200
Menu, Tray, Icon, lib\Robot.ico 
AutoTrim, On
Setnumlockstate Alwayson
setCapslockstate alwaysoff
SetScrollLockState, alwaysOff
rightScreen:= A_ScreenWidth-1270
righterScreen:= A_ScreenWidth-980
TopScreen := 0 ;A_ScreenHeight
BottomScreen := A_ScreenHeight-40
SetKeyDelay, 1,5
VariableWindow()
run, VIM.ahk
#Include Functions.ahk
#Include MouseButtons.ahk
#Include Nugenesis.ahk
#include Other.ahk
;#include lib\XL.ahk
#ifwinactive,
return


^F19::msgbox, yo

F15::
ConnectToExcel(ProductCode)
Menu, VariableMenu, Add, Batch, VariableMenuHandler
Menu, VariableMenu, Add, Name, VariableMenuHandler
Menu, VariableMenu, Add, Lot, VariableMenuHandler
Menu, VariableMenu, Add, Customer, VariableMenuHandler
Menu, VariableMenu, Add, Description, VariableMenuHandler
Menu, VariableMenu, Add, Iteration, VariableMenuHandler
Menu, VariableMenu, Icon, Iteration, lib\Robot.ico 
loop 7
	Menu, IterationMenu, Add, %A_Index%, VariableMenuHandler
Menu, VariableMenu, Add, Iteration, :IterationMenu
Menu, VariableMenu, Show,
return

VariableMenuHandler:
if (A_ThisMenuItem between 1 and 7)
{
	Iteration:=A_ThisMenuItem
	;DebugWindow(Iteration,0,1,20,0)
	return
}
else if (A_thismenuItem = "Batch") 
{	
	Copy_Selection(Batch,"B4")
	Set_Batch() 
	return
}
else if (A_thismenuItem = "Name") 
{
	Copy_Selection(Name,"B2")
	EnvSet, Name, %Name%
	return
}
else if (A_thismenuItem = "Customer") 
{
	Copy_Selection(Cusomer,"B3")
	EnvSet, Customer, %Customer%
	return
}
else if (A_thismenuItem = "lot") 
{
	Copy_Selection(lot,"B5")
	Set_Lot() 	
	EnvSet, lot, %Lot%
	;DebugWindow(Lot,0,1,20,0)
	return
}
else if (A_thismenuItem = "Description") 
{	
	Copy_Selection(Description,"B6")
	EnvSet, Description, %Description%
	return
}
Sleep 50
VariableWindow()









return 

Return & Space::Send_ProductCode()
Return & A::Enter_ProductCode("A")
Return & E::Enter_ProductCode("E")
Return & G::Enter_ProductCode("G")
Return & H::Enter_ProductCode("H")
Return & I::Enter_ProductCode("I")
Return & J::Enter_ProductCode("J")
Return & K::Enter_ProductCode("K")
Return & L::Enter_ProductCode("L")
Return & 1::Enter_Batch("011")
Return & 2::Enter_Batch("012")
Return & 3::Enter_Batch("013")
Return & 4::Enter_Batch("014")
Return & 5::Enter_Batch("015")
Return & 6::Enter_Batch("006")
Return & 7::Enter_Batch("007")
Return & 8::Enter_Batch("008")
Return & 9::Enter_Batch("009")
Return & 0::Enter_Batch("010")