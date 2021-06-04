return
	F20 & \::Sendinput, mmignin{tab}Kilgore7744
	F19 & \::Sendinput, ?Kilgore7744
  $F12::Reload 
  F1::help
  F2::Run, WindowSpy.ahk,C:\Program Files\AutoHotkey\
  lctrl & Capslock::return
  ^Capslock::return
  ; $F3::ListLines, On
  $^F12::ListLines,
  $+F12::ListLines,
  Media_Play_Pause::send, {F5}
  ^esc::return
;	#!\::Login()

return 



#IfWinActive, ahk_exe Code.exe
    F19 & space::sendinput, {Ctrldown}{shiftdown}p{shiftup}{CtrlUp}
    F19 & h::sendinput, {ShiftDown}{altDown}{left}{altup}{ShiftUp}
    F19 & k::sendinput, {ShiftDown}{altDown}{up}{altup}{ShiftUp}
    F19 & j::sendinput, {ShiftDown}{altDown}{Ctrldown}{left}{shiftUp}{altup}
    F19 & l::sendinput, {ShiftDown}{altDown}{Ctrldown}{right}{shiftUp}{altup}
    F19 & -::sendinput, {CtrlDown}{-}{Ctrlup}
    F19 & =::sendinput, {CtrlDown}{=}{Ctrlup}
    F19 & backspace::Delete
    F19 & w::Windownames()
    F19::menu.vscode()
    F19 & `::sendinput, ~
    F19 & m::sendinput, %MousePosition%
    F19 & t::sendinput, %wintitle%

VsCode_:
    ; Mbutton & Wheeldown::Wheel_2("!d",1000)
    ; mbutton::wheel_2("^m",2000)
    Tab & f:: sendinput, {ShiftDown}{altDown}{Ctrldown}{]}{CtrlUp}{altup}{ShiftUp}
    tab::tab
    !t::tooltip(trackpadhints,9000)
    <^r::ReloadScript()
    Mbutton & F7::Sendinput, {Ctrldown}]{CtrlUp}
    Mbutton & F6::sendinput,{Ctrldown}[{CtrlUp}
    Mbutton & wheelUP::sendinput, {ctrl down}{u}{ctrl up}
    Mbutton & WheelDOWN::sendinput, {ctrl down}{m}{ctrl up}
    Mbutton & Rbutton::sendinput, {shiftdown}{altDown}{Ctrldown}m{CtrlUp}{altup}{shiftup} ; toggle bookmark

    Rbutton & F7::Wheel_2("!{right}",10)
    Rbutton & F6::Wheel_2("!{left}",10)
	  Rbutton & Lbutton::sendinput, {Shiftdown}{click}{ShiftUp}
    Rbutton & wheeldown::Wheel_2("{ctrl down}v{ctrl up}",2000)
    Rbutton & Wheelup::Wheel_2("{ctrl down}x{ctrl up}",2000)
    Rbutton & Xbutton2::Get_WindowInfo()
    
    Xbutton2 & F7::sendinput, {CtrlDown}{]}{Ctrlup}
    Xbutton2 & F6::sendinput, {CtrlDown}{[}{Ctrlup}
    Xbutton2 & wheeldown::sendinput, {ctrl down}{down}{ctrl up}
    Xbutton2 & wheelup::sendinput, {ctrl down}{up}{ctrl up}
    $Rbutton up::Mouse_RbuttonUP()
    Xbutton2 & Lbutton::sendinput, {CtrlDown}{click}{Ctrlup}
    Media_Play_Pause::F8
    ; Xbutton1 & Lbutton::^+4
		F8 & F6::return
    ; Xbutton1 & F8::F5
		F8 & F7::return
    F8 & wheeldown::ToggleDefinition() ;next search
    Mbutton up::sendinput, {CtrlDown}{f}{Ctrlup} ;search
    F8 & wheelup::wheel_2("{ShiftDown}{altdown}{up}{altUp}{ShiftUp}",50) ;projects
    F20::sendinput, {ShiftDown}{Ctrldown}{p}{CtrlUp}{ShiftUp}
    ;$*capslock up::send,{esc}{
    ~*Lbutton up::send, {ctrlup}
    ; ~*lctrl up::send, {ctrlup}
    F6::sendinput, {altDown}{left}{altup}
    F7::sendinput, {altDown}{right}{altup}
    ; capslock up::send, {esc}
    capslock & n::send, {numpaddiv}
    capslock & tab::send, {ShiftDown}{altDown}{Ctrldown}{]}{CtrlUp}{altup}{ShiftUp}

return
  
;FUNCTIONS-----------------------------------------------------------

  Login(){
      sendinput, 4130220009588038
      trayTip, ,11/21  127
      return
    }

    getWindowInfo(){
      global
        CoordMode, mouse, window
        MouseGetPos, MousePosX, MousePosY, ,WinControl
        WinGetTitle, winTitle, A
        WinGetClass, Winclass, A
        WinGet, WinProcess, ProcessName, A			
        MousePosition:="click" MousePosX "`, " MousePosY
        Sleep, 100
        Tooltip(MousePosition "`n Title: " winTitle " `n Process:  " WinProcess " `n Control:  "winControl " `n Class:  " winclass )
				Process:= "ahk_exe " WinProcess
      ; SetTimer, RemoveToolTip, -2000
        
    }
      
    Get_WindowInfo() {
      global
      CoordMode, mouse, window
      MouseGetPos, MousePosX, MousePosY, , WinControl
      ; MouseClick, right,,, 1, 0, D ; Hold down the right mouse button.
      Loop
      {
        if !GetKeyState("Rbutton", "P") ; The key has been released, so break out of the loop.
          break
        MouseGetPos, MousePosX, MousePosY, ,WinControl
        sleep 20
        WinGetTitle, winTitle, A
        WinGetClass, Winclass, A
        WinGet, WinProcess, ProcessName, A			
        Sleep, 100
        MousePosition:=MousePosX "`, " MousePosY
        Tooltip, %MousePosition%`n Title: %winTitle% `n Process: %WinProcess% `n Control: %winControl% `n Class: %winclass%
				Process:="ahk_exe " WinProcess

      }
      winTitle:=Wintitle
      SetTimer, RemoveToolTip, -2000
      Winclass:=Winclass
     ; WinGet, WinProcess, ProcessName, A	
      ; MouseClick, Right,,, 1, 0, U ; Release the mouse button.
      ;clipboard:=MousePosition
      ;mouseclick, right
      ;sendinput, {esc}
      ;MouseClick, left,,, 1, 0,
      return
    }

    ReloadScript(){
    global iteration
      ControlGetText, Iteration, Edit3, VarBar
      tooltip("Reload")
      if (iteration = -1)
      {
        sendinput, {F5}
        IniWrite, -2, data.ini, SavedVariables, Iteration
      }
      else if (iteration = -2)
        sendinput, {F4}
      else
      {
        sendinput, ^s
        sleep 200
        run, VQuest.ahk
      }
      send, {altup}{CtrlUp}{ShiftUp}{LWinUp}
    }

  ToggleDefinition(){
      global
      If toggle := !toggle
        sendinput  ^d
      else 
        sendinput, +{esc}
      return
      return
    }
    
    
    
    
      
    VSCODE_Hotstrings:
    :*R:cd\::{CtrlDown}
    :*R:cu\::{Ctrlup}
    :*R:ad\::{altDown}
    :*R:au\::{altup}
    :*R:sd\::{shiftDown}
    :*R:su\::{shiftup}
  Modifier_Hotstrings: 
    :*R:c\::
    sendraw, {CtrlDown}{}{Ctrlup}
    sendinput, {left 9}
    return
    :*R:a\::
    sendraw, {altDown}{}{altup}
    sendinput, {left 8}
    return
    :*R:s\::
    sendraw, {shiftDown}{}{shiftup}
    sendinput, {left 10}
    return
    :*R:sac\::
    :*R:cas\::
    sendraw, {ShiftDown}{altDown}{Ctrldown}{}{CtrlUp}{altup}{ShiftUp}
    sendinput, {left 25}
    return
    :*R:sc\::
    :*R:cs\::
    sendraw, {ShiftDown}{Ctrldown}{}{CtrlUp}{ShiftUp}
    sendinput, {left 18}
    return
    :*R:sa\::
    :*R:as\::
    sendraw, {ShiftDown}{altDown}{}{altup}{ShiftUp}
    sendinput, {left 17}
    return
    :*R:ca\::
    :*R:ac\::
    sendraw, {altDown}{Ctrldown}{}{CtrlUp}{altup}
    sendinput, {left 16}
    return
    
    
    

