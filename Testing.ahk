


Batch1:
 {
	Set_Batchs(Batch)
 }
return

Batch2:
 {
	Set_Batchs(Batch2)
 }
return

Batch3:
 {
	Set_Batchs(Batch3)
 }
return

Batch4:
 {
   clipboard := Lot[0]
 }
return

guiclose:
gui, Destroy



ScreenHandler:
VariableBar_Relocate()

	ProductCodeVar:
	run, LMS\GUI_ProductTable.ahk
	return
	Gui, Var:submit,NoHide
	ProductCode:=ProductCode    
	EnvSet, ProductCode, %ProductCode%
	return
	BatchVar:
	Gui, Var:submit,NoHide
	Batch:=Batch    
	EnvSet, Batch, %Batch%
	return
