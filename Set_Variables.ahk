
SetBatchCode() {
    global
    Inputbox, BatchCode, Variable for batch #?,,, 200,100,,,, %Default_fill%	  
	  if ErrorLevel
		return
	  else
    EnvSet, BatchCodeEnv, %BatchCode%
    Sleep 200
    VariableGet()
    return 
	}
SetProductCode() {
    global
    Inputbox, ProductCode, Variable for Product #?,,, 200,100,,,, %Default_fill%	  
	  if ErrorLevel
		return
	  else
    EnvSet, ProductCodeEnv, %ProductCode%
    Sleep 200
    VariableGet()
    return 
	}
ClipboardToProductCode() {
    global
    PreClip:=Clipboard
    sleep 100
    Sendinput, ^c    
    sleep 300
    Clipboard := StrReplace(Clipboard, "`r`n")
    ProductCode:=Clipboard    
    Clipboard:=Preclip
    ToolTip, Product
    EnvSet, ProductCodeEnv, %ProductCode%
    Sleep 200
    VariableGet()
    return 
	}
	
ClipboardToBatchCode() {
    global
    PreClip:=Clipboard
    sleep 100
    Sendinput, ^c    
    sleep 300
    Clipboard := StrReplace(Clipboard, "`r`n")
    BatchCode:=Clipboard
    Clipboard:=Preclip
    ToolTip, Batch
    EnvSet, BatchCodeEnv, %BatchCode%
    Sleep 200
    VariableGet()
    return 
	}

SaveBatchVar(key) {
	global
	inputbox,Batch,, `t %key%-,,70,120,,,,,%Batch%
	    if ErrorLevel
		return
	  else
	BatchCode:=key . "-" . Batch
	EnvSet, BatchCodeEnv, %BatchCode%
	Sleep 200		
	VariableGet()
	return
	}
SaveProductVar(key){
	global
	inputbox,Code,,  %key%`t ,,70,120,,,,,%Code%
	  if ErrorLevel
		return
	  else
	ProductCode:=key . Code
	EnvSet, ProductCodeEnv, %ProductCode%
	Sleep 200	
      IfWinActive, NuGenesis LMS - \\Remote
        sendinput, {ctrl down}a{ctrl up}%ProductCode%{enter}
	VariableGet()
	return
} 
	    


    
SaveBatch_and_ProductVar: ;{    
    Return & up::
    F11::SetBatchCode()
    F12::SetProductCode() 
Return & Numlock::sendinput,%BatchCode%
Return & rwin::sendinput,%BatchCode%
Return & Space::MouseSendProductCode()
Return & J::SaveProductVar("J")
Return & K::SaveProductVar("K")
Return & L::SaveProductVar("L")
Return & I::SaveProductVar("I")
Return & E::SaveProductVar("E")
Return & H::SaveProductVar("H")
Return & G::SaveProductVar("G")
Return & A::SaveProductVar("A")

Return & 1::SaveBatchVar("011")
Return & 2::SaveBatchVar("012")
Return & 3::SaveBatchVar("013")
Return & 4::SaveBatchVar("014")
Return & 5::SaveBatchVar("015")
Return & 6::SaveBatchVar("006")
Return & 7::SaveBatchVar("007")
Return & 8::SaveBatchVar("008")
Return & 9::SaveBatchVar("009")
Return & 0::SaveBatchVar("010")
numpadadd & numpad9::HeavyMetalsComponents() ;}