VariableGet() {
    Global  
    Gui +LastFound 
    Gui destroy
    ;envVariables = %ProductCode%  %BatchCode%
    EnvGet, BatchCode, BatchCodeEnv
    EnvGet, ProductCode, ProductCodeEnv
    Sleep 400
    Gui +LastFound +AlwaysOnTop -Caption +ToolWindow
    Gui, color, EEAA99
	GUI, Font, s13 cBlack Bold, Consolas
      Gui, add, Text, w485 h20 x0 y-2 +Center, %ProductCode%   %BatchCode%  %Clipboard%
      Gui, Show, w485 h20 x%RightScreen% y0
	return
}



#Include Send_Variables.ahk
#Include Set_Variables.ahk
