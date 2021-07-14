class TouchPad {
	3Right(){
		global
		If winactive("NuGenesis LMS - \\Remote")
			LMS.SearchBar(Batch,"{enter}")
		else If winactive("Result Entry - \\Remote")
			WorkTab.ChangeTestResults()
		else If winactive("Select methods tests - \\Remote")
			SpecTab.Methods()
		else If WinActive("Composition - \\Remote")
			send, {enter}
		else If WinActive("Test Definition Editor - \\Remote")
			clk(330, 619) ;click save
		else If WinActive("Results Definition - \\Remote")
			send, {enter}
		else if winactive("Register new samples - \\Remote")
			clk(502, 354)
		else if winactive("Select samples for test:")
			send % Clk(504, 324) "{click, 849, 661}"  ; add test.
		else	
			send, {WheelRight}
		return
		}


	3left(){
			global
		If winactive("NuGenesis LMS - \\Remote")
			LMS.SearchBar(Product,"{enter}")
		else If winactive("Select methods tests - \\Remote")
			send, {esc}
		else If WinActive("Composition - \\Remote")
			send, {esc}
		else If WinActive("Test Definition Editor - \\Remote")
			send, {esc}
		else If WinActive("Results Definition - \\Remote")
			send, {esc}
		else if winactive("Edit test (Field Configuration:")
			send, {esc}
		else If winactive("Result Entry - \\Remote")  ;Enter Test Results window"
			WorkTab.ChangeTestResults("toggle")
		else if winactive("Register new samples - \\Remote")
			send, {esc}
		else if winactive("Select samples for test:")
			send, {esc}
		else 
			send, {wheelleft}
		return
		}


	3Down(){
		global
		If winactive("NuGenesis LMS - \\Remote")
			LMS.Filter(Clear)
		else if winactive("Select samples for test:")
			Clk(853, 657) ; click okay.
		else
			return
		return
			
		}


	3up(){
		global
		If winactive("NuGenesis LMS - \\Remote")
			LMS.ViewCoa()
		else if winactive("Edit test (Field Configuration:")
			Autofill()
		else if winactive("Register new samples - \\Remote")
			LMS.SearchBar(Product,"{enter}")
		else If WinActive("Select tests for request: R")
			clk(638, 70)
		else if winactive("Select samples for test:")
			send % Clk(250, 70) "{up}" ; click okay.
		else If WinActive("Composition - \\Remote")
			ProductTab.AddCOASpace()
		else
			return
		return
		
		}


	3tap(){
		global
		If winactive("NuGenesis LMS - \\Remote") {
			LMS.Detecttab()
			if (Tab="Requests")
				clk(61, 635) ;enter results
			else if (Tab="Products")
				clk(86, 443) ;edit composition
			else if (Tab="Welcome") {
			Menu,Menu, add, &Production Server, LMS_Env
			Menu,Menu, add, &Test Server, LMS_Env
			Menu.show()
				
			}
			else
				Menu.LMS()
		}
		else if winactive("Edit Formulation - \\Remote"){
			mouseclick, left, 455, 472,2,0
			clk(250, 284)
		return	
		}
		else if winactive("Edit Product - \\Remote")
			ProductTab.EditProduct()
		else If WinActive("Select tests for request: R")
			WorkTab.SelectTestSample()
		else If WinActive("Paster - Snipaste") || WINACTIVE("Snipper - Snipaste") {
			sendlevel 1
			 send, {ctrldown}{7}{ctrlup}
			 sendlevel 0
		}
		Else
			Autofill()
		return
		
		}


	4tap(){
		global
		If winactive("NuGenesis LMS - \\Remote") {
			LMS.Detecttab()
			if (Tab="Requests")
				{
				clk(61, 635) ;enter results
				Return
				}
			else if (Tab="Products")
				{
				clk(86, 443) ;edit composition
				Return
				}
			else if (Tab="Specs")
				{
				clk(67, 754) ;edit results
				Return
				}
			else
				Menu.LMS()
		}
		Else
			Autofill()
		return
		}



	2right(){
		global
		If winactive("NuGenesis LMS - \\Remote")
			lms.SearchBar(Batch,"{enter}")
		Else
			send, %batch%
		return
		}


	2Left(){
		global
		If winactive("NuGenesis LMS - \\Remote")
			lms.SearchBar(Product,"{enter}")
		Else
			send, %Product%
		return
		}


}