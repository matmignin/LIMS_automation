Gui, Add, Tab, x1 y1 w360 h70 , Tab1|Tab2
Gui, Tab, Tab1
	Gui, color, 21a366
	Gui, Add, Tab, x1 y-5 w360 h60 , Tab1|Tab2
Gui, Tab, Tab1
	GUI, Font, s16 cBlack Bold, Consolas
Gui, Add, edit, vProduct gproductleft ReadOnly h30 x1 y15 w62, %product% ;|%DDLProducts%	
	GUI, Font, s11 cBlack Bold, Consolas
	Gui, add, Text, vBatch x70 y15 w100 H21, %Batch%
	GUI, Font, s9 cBlack, Arial Narrow
	Gui, add, Text, vlot x70 y30 left w120 h20, %Lot%
	GUI, Font, s7 cBlack , arial
	Gui, add, Text, vCoated x90 y20 w100, %Coated%
	GUI, Font, s8 cBlack , arial Narrow
	;Gui, add, Text, vname  x180 left y20 w160 h20, %Name%
	Gui, add, Text, vcustomer  x190 left -wrap y35 w160, %Customer%
	GUI, Font, s11 cBlack Bold, Consolas
	Gui, Add, Edit, gIterationvIteration left x300 h30 y20 w70,
	Gui, Add, UpDown, vIterationUpDown x300 h30 y20 w1 Range0-6, %Iteration%
; Generated using SmartGUI Creator 4.0
Gui, Show, x717 y366 h76 w356, New GUI Window
Return

GuiClose:
ExitApp