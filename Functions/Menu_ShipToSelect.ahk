	SampleTab_ShipToSelect(x_pos,y_pos)
	{
		global
		Menu, ShipToMenu, Add, &B, ShipToMenuHandler
		Menu, ShipToMenu, Add, &C, ShipToMenuHandler
		Menu, ShipToMenu, Add, &D, ShipToMenuHandler
		Menu, ShipToMenu, Add, &E, ShipToMenuHandler
		Menu, ShipToMenu, Add, &F, ShipToMenuHandler
		Menu, ShipToMenu, Add, &G, ShipToMenuHandler
		Menu, ShipToMenu, Add, &H, ShipToMenuHandler
		Menu, ShipToMenu, Add, &I, ShipToMenuHandler
		Menu, ShipToMenu, Add, &J, ShipToMenuHandler
		Menu, ShipToMenu, Add, &K, ShipToMenuHandler
		Menu, ShipToMenu, Add, &L, ShipToMenuHandler
		Menu, ShipToMenu, Add, &M, ShipToMenuHandler
		Menu, ShipToMenu, Add, &N, ShipToMenuHandler
		Menu, ShipToMenu, Add, &O, ShipToMenuHandler
		Menu, ShipToMenu, Add, &P, ShipToMenuHandler
		Menu, ShipToMenu, Add, &R, ShipToMenuHandler
		Menu, ShipToMenu, Add, &S, ShipToMenuHandler
		Menu, ShipToMenu, Add, &T, ShipToMenuHandler
		Menu, ShipToMenu, Add, &V, ShipToMenuHandler
		Menu, ShipToMenu, Show,noactivate
		Return
		
		ShipToMenuHandler:
		winactivate, Edit sample
		sendinput, {click, %x_pos%, %y_pos%}{Home}
		If (A_ThisMenuItem = "&B") 
			sendinput, {tab}{pgdn 2}
		else if (A_ThisMenuItem = "&C") 
			sendinput, {tab}{pgdn 3}
		else if (A_ThisMenuItem = "&D") 
			sendinput, {tab}{pgdn 4}
		else if (A_ThisMenuItem = "&E") 
			sendinput, {tab}{pgdn 5}
		else if (A_ThisMenuItem = "&F") 
			sendinput, {tab}{pgdn 6}
		else if (A_ThisMenuItem = "&G") 
			sendinput, {tab}{pgdn 7}
		else if (A_ThisMenuItem = "&H") 
			sendinput, {tab}{pgdn 8}
		else if (A_ThisMenuItem = "&I") 
			sendinput, {tab}{pgdn 9}
		else if (A_ThisMenuItem = "&J") 
			sendinput, {tab}{pgdn 10}
		else if (A_ThisMenuItem = "&K") 
			sendinput, {tab}{pgdn 11}
		else if (A_ThisMenuItem = "&L") 
			sendinput, {tab}{pgdn 12}
		else if (A_ThisMenuItem = "&M") 
			sendinput, {tab}{pgdn 13}
		else if (A_ThisMenuItem = "&N") 
			sendinput, {tab}{pgdn 14}
		else if (A_ThisMenuItem = "&O") 
			sendinput, {tab}{end}{pgup 8}
		else if (A_ThisMenuItem = "&P") 
			sendinput, {tab}{end}{pgup 7}
		else if (A_ThisMenuItem = "&R") 
			sendinput, {tab}{end}{pgup 6}
		else if (A_ThisMenuItem = "&S") 
			sendinput, {tab}{end}{pgup 5}
		else if (A_ThisMenuItem = "&T") 
			sendinput, {tab}{end}{pgup 4}
		else if (A_ThisMenuItem = "&V") 
			sendinput, {tab}{end}{pgup 1}
		else
			return
		return
	}