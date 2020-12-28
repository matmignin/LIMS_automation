  #IfWinActive, ahk_exe OUTLOOK.EXE    
    Capslock::return

PrimaryApp() {
    IfWinNotActive, ahk_exe WFICA32.EXE
	  {
	  WinActivate, ahk_exe WFICA32.EXE
	  return
	   }
    IfWinActive, ahk_exe WFICA32.EXE
	  {
	  WinActivate, ahk_exe ONENOTE.EXE
	   return
	   }
    return
    }



    

Calculator:
#ifwinactive, Calculator
    Numpadadd & numpad0::winclose, Calculator
#IfWinActive,
Numpadadd & numpad0::Calculator()
    Calculator(){ ;{
    winactivate, ahk_exe calc.exe
    ifwinnotexist, calculator
	    run calculator://
    winactivate calculator
    return
    }