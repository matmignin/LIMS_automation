

	
;#Ifwinactive, Edit test (Field Configuration: F`, Micro) - \\Remote ;
	;F14::sendinput, {click 305, 294}{end}(on sample log){click 330, 617}
;#Ifwinactive, Edit test (Field Configuration: I`, Analytical) - \\Remote
	;F14::sendinput, {click 305, 294}{end}(on sample log){click 330, 617}
;#Ifwinactive, Edit test (Field Configuration: I`, Physical) - \\Remote
	;F14::sendinput, {click 305, 294}{end}(on sample log){click 330, 617}



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