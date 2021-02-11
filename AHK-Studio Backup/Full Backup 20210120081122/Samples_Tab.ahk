#ifwinactive, Edit sample (Field Configuration: I`, Physical) - \\Remote
WheelLeft::
GetExcel_ProductInfo(ProductCode)
sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%
SelectCustomer()
return
wheelright::
sendinput, %Batch%
return
#ifwinactive, Edit sample (Field Configuration: I`, Analytical) - \\Remote
WheelLeft::
GetExcel_ProductInfo(ProductCode)
sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%
SelectCustomer()
wheelright::
sendinput, %Batch%
return

#ifwinactive, Edit sample (Field Configuration: F`, Micro) - \\Remote
WheelLeft::
GetExcel_ProductInfo(ProductCode)
sendinput, {tab 2}{right}{click 277, 139}{tab 7}%Batch%{tab}%Lot%
SelectCustomer()
return
wheelright::sendinput, %Batch%


#ifwinactive, Edit sample (Field Configuration: I`, Retain) - \\Remote
wheelleft::
GetExcel_ProductInfo(ProductCode)
sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%
SelectCustomer()
return
wheelright::sendinput, %Batch%

#ifwinactive, Select tests for request:
wheelright::Click("Select_TestsForRequests")

#ifwinactive, Register new samples - \\Remote
wheelleft::Send, {click 179, 105}{click}%ProductCode%{enter}

SelectCustomer() {
sendinput, {tab} ;{right 7}{enter} ;501 nutrition was 7
return
}

GetExcel_ProductInfo(Product_Code){
global
	try {
		XL := ComObjActive("Excel.Application").Sheets(Product_Code)
		Visible := True		
	} Catch 
		return
	Name:=Xl.Range("B2").text
	Batch:=Xl.Range("B4").text
	Lot:=Xl.Range("B5").text
	Customer:=Xl.Range("B3").text
	ServingSize:=Xl.Range("B6").text
	}