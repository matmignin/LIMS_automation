return

Class VarBar{
	Show(X:=1, Y:=1, Destroy:="Reset"){
		Global
		try GUI,VarBar:Destroy
		TopScreen:=1 ;A_ScreenHeight-35
		MidScreen:=A_ScreenWidth//2
		wingetpos, Nugenesis_X, Nugenesis_y, Nugenesis_w, Nugenesis_h, NuGenesis LMS
		wingetpos, Win_X, Win_y, Win_w, Win_h, A
		VarBar_H=29
		VarBar_H_max=56
		VarBar_T:=235
		VarBar_W=370
		VarBar_x:=Nugenesis_X+(Nugenesis_W/3)
		; VarBar_Y:=-Nugenesis_h
		VarBar_Y:=Nugenesis_Y+2
		Gui VarBar: +AlwaysOnTop -Caption +Toolwindow +owner +HwndGUIID
		Gui Varbar:Default
		Gui, Varbar:+Delimiter`n
		winSet, Transparent, 100, %GUIID%
		GUI, VarBar:color,DC734F, 97BA7F
		; this.AddEdit("Product",	 "left h29 x1 y0 w65",				"16 Bold")
			GUI,VarBar:Font,			 s16 Bold , consolas
			GUI,VarBar:Add,edit,		vProduct +wrap -multi	gVarbarHandler left h29 x1 y0 w65,	%Product%
		this.AddEdit("Batch",	 "left h29 x+0 y0 w90", 			"12,Consolas")
		this.AddEdit("Lot",		 "left h29 x+0 y0 w75", 			"9, Consolas")
		this.AddEdit("Coated",	 "left h29 x+0 y0 wrap w70",		"8.5, Arial Narrow")
		GUI, Varbar:font, cBlack s9 Norm w500 , Consolas
		This.AddEdit("Iteration", "x+2 h29 left y0 w60",			 "16 Bold 107C41, Consolas")	; Text1
		this.AddBoxes()
		CoordMode, mouse, screen
		try GUI, VarBar:Show, x%Varbar_X% y%Varbar_y% w%VarBar_w% h%varbar_H% Noactivate, VarBar
		catch
			GUI, VarBar:Show, x%Win_X% y%Win_Y% w%VarBar_w% h%varbar_H% Noactivate, VarBar
		CoordMode, mouse, window
		; OnMessage(0x0201, "WM_LBUTTONDOWN")
		this.loadSavedVariables()

		OnMessage(0x002C, "ODDDL_MeasureItem") ; WM_MEASUREITEM
		OnMessage(0x002B, "ODDDL_DrawItem") ; WM_DRAWITEM
		winSet, Transparent, %Varbar_T%, AHK_id %GUIID%
		Return

		VarBarHandler:
		; while (A_TimeIdle < 1000) && winactive("VarBar")
		; sleep 25
		; sleep 300
			; sleep 1000
			PriorCodestring:=CodeString
			GUI, VarBar:submit,NoHide
			; ControlGetText, Product, Edit1, VarBar
			; ControlGetText, Batch, Edit2, VarBar
			; ControlGetText, Lot, Edit3, VarBar
			; ControlGetText, Coated, Edit4, VarBar
			; ControlGetText, Iteration, Edit5, VarBar
			Ct:=Coated ? " ct#" : ""
			; CodeString:=clip.CodesRegex(clipboard)
			CodeString:=trim(Product " " Batch " " Lot Ct Coated)
			      if (PriorCodestring!=Codestring){
					FileDelete, %CodeFile%
					sleep 200
					FileAppend, %CodeString%, %CodeFile%
				}
			; iniwrite, %CodeString%, \\10.1.2.118\users\vitaquest\mmignin\RemoteVQ\Settings.ini, SavedVariables, Code

		return
		VarBarGuiClose:
		VarBarButtonOK:
		VarBarGuiEscape:
			; GUI, VarBar:submit,NoHide
			sleep 50
			VarBar.SaveVariables()
		return
	}

	AddEdit(Variable,Dimensions:="",Font:=""){
		global
		GUI,VarBar:Font,			 s%Font% , consolas ;cBlack Bold, %Font%
		GUI,VarBar:Add,edit,		v%Variable% +wrap -multi	gVarbarHandler %Dimensions%,		% %Variable%
	}
	AddText(Variable,Dimensions:="",Font:=""){
		global
		GUI,VarBar:Font,			 s%Font% ;cBlack Bold, %Font%
		GUI,VarBar:Add,Text,		v%Variable% 	%Dimensions%,		% %Variable%
	}

	Menu(){
		global
		MouseGetPos,,,,winControl
		try Menu, VarBarmenu, DeleteAll
		Menu, VarbarMenu, Add, All Batches, AllBatchesMsgbox
		Menu, VarbarMenu, Add, All Products, AllProductsMsgbox
		Menu, VarbarMenu, add, Show Final Label Copy, ShowFinalLabelCopy
		Menu, VarbarMenu, add, Show Scan Label Copy, ShowScanLabelCopy
		Menu, VarbarMenu, add, Show Total CoAs, ShowFINAL_C_O_A
		Menu, VarbarMenu, add, Show EditBox, ShowEditBox
		Menu, VarbarMenu, add, Paste Spec, +F10
		Menu, VarbarMenu, Add, Show Variables, ShowVariables
		Try Menu,VarBarmenu,show
	}
	Reset(){
		Global
		coordmode, mouse, Screen
		; keywait, Lbutton, U T2
		MouseGetPos,Varbar_X,Varbar_Y
		VarBar.show(0)
		coordmode, mouse, window
		return
	}

	Focus(Control){
		global
		; winGetTitle, the_winTitle, A
		winactivate, VarBar ahk_exe RemoteVQ.exe
		; caret_x:=A_CaretX
		GuiControl Varbar:Focus, %Control%
		; caret_y:=A_Carety
		; winactivate, VarBar ahk_exe RemoteVQ.exe
		; FlashScreen()
		Sendinput, +{left}
		return
	}

	Search(input){
		global
		Clip()
		LMS.SearchBar(input)
		return
	}

	AddIteration(speed:=300){
		global Iteration, NAdd
			If NAdd
				exit
			; #maxthreadsperhotkey, 1
			; #MaxHotkeysPerInterval, 500
		; GuiControl, -redraw, varbar
		NAdd:=1
		sleep 55
		Iteration+=1
		sleep %Speed%
		ControlsetText, Edit5,%Iteration%,VarBar
		; sleep 100
			; #MaxHotkeysPerInterval, 70
		NAdd:=0
		; #maxthreadsperhotkey, 2
		return
	}
	SubIteration(speed:=300){
		global Iteration, NSub
			If Nsub
				exit
			; #maxthreadsperhotkey, 1
		; #MaxHotkeysPerInterval, 500
		Nsub:=1
		; GuiControl, -redraw, varbar
		sleep 55
		Iteration-=1
		sleep %speed%
		ControlsetText, Edit5,%Iteration%,VarBar
		; sleep 100
		Nsub:=0
			; #maxthreadsperhotkey, 2
		return
	}
	SaveVariables(){ ;;_________________SAVING VARIABLES_________________________
	global
		GUI, varbar:default
		GUI, Varbar:Submit, Nohide
		ControlGetText, Product, Edit1, VarBar
		ControlGetText, Batch, Edit2, VarBar
		ControlGetText, Lot, Edit3, VarBar
		ControlGetText, Coated, Edit4, VarBar
		ControlGetText, Iteration, Edit5, VarBar
		Null:=""
		sleep 100
		if Product
			iniwrite, %Product%, Settings.ini, SavedVariables, Product
		else
			iniwrite, %Null%, Settings.ini, SavedVariables, Product
		if Batch
			iniwrite, %Batch%, Settings.ini, SavedVariables, Batch
		else
			iniwrite, %Null%, Settings.ini, SavedVariables, Batch
		if lot
			iniwrite, %Lot%, Settings.ini, SavedVariables, Lot
		else
			iniwrite, %Null%, Settings.ini, SavedVariables, Lot
		if Coated
			iniwrite, %Coated%, Settings.ini, SavedVariables, Coated
		else
			iniwrite, %Null%, Settings.ini, SavedVariables, Coated
		if SampleID
			iniwrite, %SampleID%, Settings.ini, SavedVariables, SampleID
		else
			iniwrite, %Null%, Settings.ini, SavedVariables, SampleID
		; if CustomerPosition
			; IniWrite, %Iteration%, Settings.ini, SavedVariables, Iteration
	}
loadSavedVariables(){ ;;___________________________LOADING VARIABLES_________________________
	global
		GUI, varbar:default
		; Iniread, Iteration, Settings.ini, SavedVariables, Iteration
		iniRead, Product, Settings.ini, SavedVariables, Product
		iniRead, Batch, Settings.ini, SavedVariables, Batch
		iniRead, Lot, Settings.ini, SavedVariables, Lot
		iniRead, Coated, Settings.ini, SavedVariables, Coated
		iniRead, SampleID, Settings.ini, SavedVariables, SampleID


		; if !Iteration
			; GuiControl,Varbar:Text, Iteration, %Iteration%
		;  if !Product
			; GuiControl,Varbar:Text, Product, %Product%
		; if Batch
		; 	GuiControl,Varbar:Text, Batch, %Batch%
		; if lot
		; 	GuiControl,Varbar:Text, lot, %lot%
		; if Coated
		; 	GuiControl,Varbar:Text, Coated, %Coated%
		; GUI, Varbar:Submit, Nohide
	}
}

;;||||||||||||||||||||||||||||||||||| KEYBINDINGS |||||||||||||||||||||||||||||||||||||
#Ifwinactive, VarBar ahk_exe RemoteVQ.exe
	enter::
		ControlGetFocus,winControl,VarBar ahk_exe RemoteVQ.exe
		if (winControl="Edit1") || (winControl="Edit2") || (winControl="Edit3"){
			GUI, varbar:default
			Gui, Varbar:submit, nohide
			LMS.Searchbar(clipboard,"{enter}")
		}
			else if (winControl="Edit4"){
				Coated:=
				GUI, varbar:default
				ControlsetText, Edit4,%Coated%,VarBar ahk_exe RemoteVQ.exe
				Gui, Varbar:submit, nohide
				iniwrite, Coated, Settings.ini, SavedVariables, Coated
			}

	return
	Mbutton::
			; ControlGetFocus,winControl,VarBar ahk_exe RemoteVQ.exe
			; MouseGetPos, , , winid, wincontrol
			; if (winControl="Edit1") || (winControl="Edit2") || (winControl="Edit3"){
				VarBar.Menu()
				return
			; }
			; else if (winControl="Edit4"){
				; Coated:=
				; GUI, varbar:default
				; ControlsetText, Edit4,%Coated%,VarBar ahk_exe RemoteVQ.exe
				; Gui, Varbar:submit, nohide
				; iniwrite, Coated, Settings.ini, SavedVariables, Coated
			; }
#ifwinactive

#If MouseIsOver("VarBar ahk_exe RemoteVQ.exe")
; Wheeldown::Varbar.SubIteration(250)
; Wheelup::Varbar.AddIteration(250)
Wheelup::
	iniread, PriorCodeString, Settings.ini, SavedVariables, PriorCodeString
	sleep 200
	clip.CodesRegex(PriorCodeString)
	; sleep 400
	return
Wheeldown::
	iniread, CodeString, Settings.ini, SavedVariables, CodeString
	sleep 200
	; Fileread, CodeString, %CodeFile%
	; iniread, CodeString, Settings.ini, SavedVariables, CodeString
	clip.CodesRegex(CodeString)
	; sleep 400
	return
+wheelup::Varbar.AddIteration(350)
+wheeldown::Varbar.SubIteration(350)
Mbutton::
Rbutton::
		; ControlGetFocus,winControl,VarBar ahk_exe RemoteVQ.exe
		MouseGetPos, , , winid, wincontrol
		if (winControl="Edit1"){
			VarBar.Menu()
		}
		else if (winControl="Edit2"){
			Batch:=
			GUI, varbar:default
			ControlsetText, Edit2,%Batch%,VarBar
			iniwrite, Batch, Settings.ini, SavedVariables, Batch
		}
		else if (winControl="Edit3"){
			Lot:=
			GUI, varbar:default
			ControlsetText, Edit3,%Lot%,VarBar
			iniwrite, Lot, Settings.ini, SavedVariables, Lot
		}
		else if (winControl="Edit4"){
			Coated:=
			GUI, varbar:default
			ControlsetText, Edit4,%Coated%,VarBar
			iniwrite, Coated, Settings.ini, SavedVariables, Coated
		}
		else if (winControl="Edit5")
			worktab.CustomerMenu()
		return
#if

VarBar_ResetSub:
	VarBar.Reset()
return

