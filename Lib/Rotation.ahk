return

#IfWinActive, Select Iterations - \\Remote
1::
2::
3::
4::
5::
Rotation_GetTable(0)
WinActivate, Select Iterations - \\Remote
sleep 100
Rotation_Iterations(A_ThisHotkey,Cycle)
;SetKeyDelay 10
send,{tab 4}{enter}
Return




Rotation_GetTable(showTable=1){ 
	Global
	Excel_Connect()
	Chemicals:=[]
	;RotationOrder:=[]
	while (Xl.Range("M" . A_Index).Value != "|") {
		;RotationOrder[A_index]:=Xl.Range("P" . A_Index+1).Text
		Chemicals[A_index]:=Xl.Range("Q" . A_Index+1).Text
		Total_rows:=A_index
		Cycle:=A_Index
	}	
	loop, %Cycle%,
	{
		ChemicalRotation:= A_index " `t  " Chemicals[A_index]
		Menu, RotationMenu, Add, &%ChemicalRotation%, RotationMenuHandler
	}
	If (ShowTable=1)
		Menu, RotationMenu, Show
	else
		return
	Return
	
	
	RotationMenuHandler:
	Rotation:=A_ThisMenuItemPos
	WinActivate, Select Iterations - \\Remote
	sleep 200
	Rotation_Iterations(Rotation,Cycle)
	SetKeyDelay 5
	send,{tab 4}{enter}
	return
	
	
}
Rotation_Iterations(Rotations,Cycles) {  
	global
	If (Rotations = 1) {
		If (Cycles = 2) 
			Sendinput,{tab}{tab}{space}35791{space}11{space}11{space}11{space}11{space}12{Space}22{Space}22{Space}22{Space}22{Space}23{Space}33{Space}33{Space}33{Space}33{Space}34{Space}44{Space}44{Space}44{Space}44{Space}45{Space}55{Space}55{Space}55{Space}55{Space}56{Space}66{Space}66{Space}66{Space}66{Space}67{Space}77{Space}77{Space}77{Space}77{Space}78{Space}88{Space}88{Space}88{Space}88{Space}89{Space}99{Space}99{Space}99{Space}99{Space}9
		If (Cycles = 3)
			Sendinput,{tab}{tab}{space}4711{space}1{space}11{space}1{space}11{space}1{space}12{space}2{space}22{space}2{space}22{space}2{space}23{space}33{space}3{space}33{space}3{space}344{space}4{space}44{space}4{space}44{space}4{space}45{space}5{space}55{space}5{space}55{space}5{space}56{space}66{space}6{space}66{space}6{space}677{space}7{space}77{space}7{space}77{space}7{space}78{space}8{space}88{space}8{space}88{space}8{space}89{space}99{space}9{space}99{space}9{space}91
		If (Cycles = 4)	
			Sendinput,{tab}{tab}{space}591{space}1{space}1{space}11{space}1{space}1{space}12{space}22{space}2{space}2{space}22{space}2{space}2{space}23{space}3{space}3{space}33{space}3{space}3{space}34{space}44{space}4{space}4{space}44{space}4{space}4{space}45{space}5{space}5{space}55{space}5{space}5{space}56{space}66{space}6{space}6{space}66{space}6{space}6{space}67{space}7{space}7{space}77{space}7{space}7{space}78{space}88{space}8{space}8{space}88{space}8{space}8{space}89{space}9{space}9{space}99{space}9{space}9{space}9
		if (Cycles = 5)
			Sendinput,{tab}{tab}{space}61{Space}11{Space}1{Space}1{Space}1{Space}12{Space}22{Space}2{Space}2{Space}2{Space}23{Space}33{Space}3{Space}3{Space}3{Space}34{Space}44{Space}4{Space}4{Space}4{Space}45{Space}55{Space}5{Space}5{Space}5{Space}56{Space}66{Space}6{Space}6{Space}6{Space}67{Space}77{Space}7{Space}7{Space}7{Space}78{Space}88{Space}8{Space}8{Space}8{Space}89{Space}99{Space}9{Space}9{Space}9{Space}9
	}
	If (Rotations = 2) {
		If (Cycles = 2)
			Sendinput,{tab}{tab}246811{Space}11{Space}11{Space}11{Space}122{Space}22{Space}22{Space}22{Space}233{Space}33{Space}33{Space}33{Space}344{Space}44{Space}44{Space}44{Space}455{Space}55{Space}55{Space}55{Space}566{Space}66{Space}66{Space}66{Space}677{Space}77{Space}77{Space}77{Space}788{Space}88{Space}88{Space}88{Space}899{Space}99{Space}99{Space}99{Space}91
		If (Cycles = 3)
			Sendinput,{tab}{tab}2581{space}11{space}1{space}11{space}1{space}122{space}2{space}22{space}2{space}22{space}2{space}23{space}3{space}33{space}3{space}33{space}3{space}34{space}44{space}4{space}44{space}4{space}455{space}5{space}55{space}5{space}55{space}5{space}56{space}6{space}66{space}6{space}66{space}6{space}67{space}77{space}7{space}77{space}7{space}788{space}8{space}88{space}8{space}88{space}8{space}89{space}9{space}99{space}9{space}99{space}9{space}9
		If (Cycles = 4)	
			Sendinput,{tab}{tab}2611{space}1{space}1{space}11{space}1{space}1{space}12{space}2{space}22{space}2{space}2{space}233{space}3{space}3{space}33{space}3{space}3{space}34{space}4{space}44{space}4{space}4{space}455{space}5{space}5{space}55{space}5{space}5{space}56{space}6{space}66{space}6{space}6{space}677{space}7{space}7{space}77{space}7{space}7{space}78{space}8{space}88{space}8{space}8{space}899{space}9{space}9{space}99{space}9{space}9{space}9
		if (Cycles = 5)
			Sendinput,{tab}{tab}271{Space}1{Space}11{Space}1{Space}1{Space}1{Space}12{Space}2{Space}22{Space}2{Space}2{Space}2{Space}23{Space}3{Space}33{Space}3{Space}3{Space}3{Space}34{Space}4{Space}44{Space}4{Space}4{Space}4{Space}45{Space}5{Space}55{Space}5{Space}5{Space}5{Space}56{Space}6{Space}66{Space}6{Space}6{Space}6{Space}67{Space}7{Space}77{Space}7{Space}7{Space}7{Space}78{Space}8{Space}88{Space}8{Space}8{Space}8{Space}89{Space}9{Space}99{Space}9{Space}9{Space}9{Space}9
	}
	If (Rotations = 3) {
		If (Cycles = 3)
			Sendinput,{tab}{tab}3691{Space}1{space}11{space}1{space}11{space}1{space}12{space}22{space}2{space}22{space}2{space}233{space}3{space}33{space}3{space}33{space}3{space}34{space}4{space}44{space}4{space}44{space}4{space}45{space}55{space}5{space}55{space}5{space}566{space}6{space}66{space}6{space}66{space}6{space}67{space}7{space}77{space}7{space}77{space}7{space}78{space}88{space}8{space}88{space}8{space}899{space}9{space}99{space}9{space}99{space}9{space}9
		If (Cycles = 4)	
			Sendinput,{tab}{tab}371{space}11{space}1{space}1{space}11{space}1{space}1{space}12{space}2{space}2{space}22{space}2{space}2{space}23{space}33{space}3{space}3{space}33{space}3{space}3{space}34{space}4{space}4{space}44{space}4{space}4{space}45{space}55{space}5{space}5{space}55{space}5{space}5{space}56{space}6{space}6{space}66{space}6{space}6{space}67{space}77{space}7{space}7{space}77{space}7{space}7{space}78{space}8{space}8{space}88{space}8{space}8{space}89{space}99{space}9{space}9{space}99{space}9{space}9{space}9
		if (Cycles = 5)
			Sendinput,{tab}{tab}381{Space}1{Space}1{Space}11{Space}1{Space}1{Space}1{Space}12{Space}2{Space}2{Space}22{Space}2{Space}2{Space}2{Space}23{Space}3{Space}3{Space}33{Space}3{Space}3{Space}3{Space}34{Space}4{Space}4{Space}44{Space}4{Space}4{Space}4{Space}45{Space}5{Space}5{Space}55{Space}5{Space}5{Space}5{Space}56{Space}6{Space}6{Space}66{Space}6{Space}6{Space}6{Space}67{Space}7{Space}7{Space}77{Space}7{Space}7{Space}7{Space}78{Space}8{Space}8{Space}88{Space}8{Space}8{Space}8{Space}89{Space}9{Space}9{Space}99{Space}9{Space}9{Space}9{Space}9
	}
	If (Rotations = 4) {
		If (Cycles = 4)	
			Sendinput,{tab}{tab}481{Space}1{space}11{space}1{space}1{space}122{space}2{space}2{space}22{space}2{space}2{space}23{space}3{space}33{space}3{space}3{space}344{space}4{space}4{space}44{space}4{space}4{space}45{space}5{space}55{space}5{space}5{space}566{space}6{space}6{space}66{space}6{space}6{space}67{space}7{space}77{space}7{space}7{space}788{space}8{space}8{space}88{space}8{space}8{space}89{space}9{space}99{space}9{space}9{space}91
		if (Cycles = 5)
			Sendinput,{tab}{tab}491{Space}1{Space}1{Space}1{Space}11{Space}1{Space}1{Space}1{Space}12{Space}2{Space}2{Space}2{Space}22{Space}2{Space}2{Space}2{Space}23{Space}3{Space}3{Space}3{Space}33{Space}3{Space}3{Space}3{Space}34{Space}4{Space}4{Space}4{Space}44{Space}4{Space}4{Space}4{Space}45{Space}5{Space}5{Space}5{Space}55{Space}5{Space}5{Space}5{Space}56{Space}6{Space}6{Space}6{Space}66{Space}6{Space}6{Space}6{Space}67{Space}7{Space}7{Space}7{Space}77{Space}7{Space}7{Space}7{Space}78{Space}8{Space}8{Space}8{Space}88{Space}8{Space}8{Space}8{Space}89{Space}9{Space}9{Space}9{Space}99{Space}9{Space}9{Space}9{Space}9
	}
	If (Rotations = 5) {
		if (Cycles = 5)
			Sendinput,{tab}{tab}511{Space}1{Space}1{Space}1{Space}122{Space}2{Space}2{Space}2{Space}233{Space}3{Space}3{Space}3{Space}344{Space}4{Space}4{Space}4{Space}455{Space}5{Space}5{Space}5{Space}566{Space}6{Space}6{Space}6{Space}677{Space}7{Space}7{Space}7{Space}788{Space}8{Space}8{Space}8{Space}899{Space}9{Space}9{Space}9{Space}91
	}
	return
}





