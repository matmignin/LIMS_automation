#ifwinactive, Edit sample (Field Configuration: I`, Physical) - \\Remote
	WheelLeft::
	Excel_ConnectTo()
	sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%
	SelectCustomer()
	;return
	wheelright::ShiptoSelect(304, 437)
	return
#ifwinactive, Edit sample (Field Configuration: CT`, Physical) - \\Remote
	WheelLeft::
	Excel_ConnectTo()
	sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%
	SelectCustomer()
	;return
	wheelright::ShiptoSelect(304, 437)
	return
#ifwinactive, Edit sample (Field Configuration: I`, Analytical) - \\Remote
	WheelLeft::
	Excel_ConnectTo()
	sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%
	SelectCustomer()
	wheelright::ShiptoSelect(304, 444)
	return

#ifwinactive, Edit sample (Field Configuration: F`, Micro) - \\Remote
	WheelLeft::
	Excel_ConnectTo()
	sendinput, {tab 2}{right}{click 277, 139}{tab 7}%Batch%{tab}%Lot%
	SelectCustomer()
	;return
	wheelright::ShiptoSelect(304, 504)

#Ifwinactive, Edit sample (Field Configuration: CT`, Retain) - \\Remote, 
	wheelleft::
	Excel_ConnectTo()
	sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%
	SelectCustomer()
	;return
	wheelright::ShiptoSelect(304, 433)

#ifwinactive, Edit sample (Field Configuration: I`, Retain) - \\Remote
	wheelleft::
	Excel_ConnectTo()
	sendinput, {tab 2}{right}{click 277, 139}{tab 6}%Batch%
	SelectCustomer()
	;return
	wheelright::ShiptoSelect(304, 433)
	return
#Ifwinactive, Register new samples - \\Remote 
		F14::
		Sendinput, {tab 2}{space}
		winwaitactive, Error - \\Remote, , 4
		sendinput, {enter}

			RegisterNewSample()
		return
		
	
#Ifwinactive, Edit test (Field Configuration: F`, Micro) - \\Remote ;
	F14::sendinput, {click 305, 294}{end}(on sample log){click 330, 617}
#Ifwinactive, Edit test (Field Configuration: I`, Analytical) - \\Remote
	F14::sendinput, {click 305, 294}{end}(on sample log){click 330, 617}
#Ifwinactive, Edit test (Field Configuration: I`, Physical) - \\Remote
	F14::sendinput, {click 305, 294}{end}(on sample log){click 330, 617}





#ifwinactive, Select tests for request:       ;{      Select Tests
	wheelright::Click("Select_TestsForRequests")
;}
#ifwinactive, Register new samples - \\Remote
	wheelleft::RegisterNewSample()
#Ifwinactive, Reason For Change - \\Remote 
	enter::click, 239, 239
	+enter::enter

SelectCustomer() {
sendinput, {tab} ;{right 7}{enter} ;501 nutrition was 7
return
}

;Excel_ConnectTo(Product_Code){
;global
	;try {
		;XL := ComObjActive("Excel.Application").Sheets(Product_Code)
		;Visible := True		
	;} Catch 
		;return
	;Name:=Xl.Range("B2").text
	;Batch:=Xl.Range("B4").text
	;Lot:=Xl.Range("B5").text
	;Customer:=Xl.Range("B3").text
	;ServingSize:=Xl.Range("B6").text
	;}