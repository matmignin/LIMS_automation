

#IfWinActive, ahk_exe Code.exe


  ; $numpadMult:: send, {ShiftDown}{altDown}{up}{altup}{ShiftUp}  ;4up
 numpaddiv::send, {altDown}{lwindown}{Shiftdown}{down}{altup}{ShiftUp}{lwinup}
 numpadmult::send, {altDown}{lwindown}{Shiftdown}{UP}{ShiftUp}{altup}{lwinup}

~Space & Lctrl::Backspace
  Mbutton:: 
     TT(A_ThisHotkey,600,,,2)
     Input, Akey, T0.6 ,{NumpadAdd}{Numpadsub}{Numpadmult}{numpad0}{numpad5}{numpad4}{numpad3}{Numpad2}{Numpad1}{numpad9}{numpad8}{numpad7}{numpad6}{Numpaddiv}{space}{Mbutton}{F6}{F7}{F8}{F9}{F19}{F20}{Lbutton}{numlock}
      If InStr(ErrorLevel, "EndKey:")
      {
        If InStr(ErrorLevel, "NumpadAdd")
          send, {altDown}{lwindown}{Shiftdown}{right}{ShiftUp}{lwinup}{altup}
        If InStr(ErrorLevel, "NumpadSub")
          send, {altDown}{lwindown}{Shiftdown}{left}{ShiftUp}{lwinup}{altup}
        If InStr(ErrorLevel, "NumpadMult")
          send, {altdown}{ctrldown}{up}{ctrlup}{altup}
        If InStr(ErrorLevel, "Numpaddiv") {
          send, {shiftdown}{altdown}{ctrldown}{v}{ctrlup}{altup}{shiftup}
          TT("column select",3000)
        }
        If InStr(ErrorLevel, "F9")
          send, {pgup}
        If InStr(ErrorLevel, "F6")
          send, {altDown}{lwindown}{o}{lwinup}{altup}
        If InStr(ErrorLevel, "F7")
          send, {ctrldown}{f}{ctrlup}
        If InStr(ErrorLevel, "F8")
        send, {pgdn}
          
        exit
      }
      If ErrorLevel = TimeOut
      {
          ; TT("Previous ",800)
          send, {ctrldown}{f}{ctrlup}
          exit
      }
      return
  ; Mbutton::sendinput, {shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup} ;search
  F6::send, {altDown}{left}{altup}
  F7::send, {altDown}{right}{altup}
  F8::ToggleDefinition()
  F9::send, {ShiftDown}{altDown}{up}{altup}{ShiftUp}
  numpadadd::send, {shiftdown}{ctrldown}{pgdn}{ctrlup}{shiftup}
  numpadsub::send, {shiftdown}{ctrldown}{pgup}{ctrlup}{shiftup}
  

F20 & Right::WinMove, ahk_exe Code.exe, , 1858, -1080, 1642, 1087
F20 & Down::WinMove, ahk_exe Code.exe, , 603, 14, 1963, 1354
F19 & left::send, {shiftdown}{lwindown}{altdown}{left}{altup}{lwinup}{shiftup}
F19 & up::send, {shiftdown}{lwindown}{altdown}{up}{altup}{lwinup}{shiftup}
F19 & down::send, {shiftdown}{lwindown}{altdown}{down}{altup}{lwinup}{shiftup}
F19 & right::send, {shiftdown}{lwindown}{altdown}{right}{altup}{lwinup}{shiftup}
F19 & F20::vscode_menu()
F19 & -::send, {ctrldown}{-}{ctrlup}
F19 & =::send, {ctrldown}{=}{ctrlup}
; lwin::
; winactivate, ahk_exe WFICA32.EXE 
; Test_3()
;  
; Tooltip()
; ~Wheelleft::send, {altdown}{left}{altup}
;   var++
;   If var>=2
;   {
;     send, {altdown}{left}{altup}
;   }
;   SetTimer, clearVar, -100
;   return
; ~wheelright::send, {altdown}{right}{altup}
;   var++
;   If var>=2
;     {
;       send, {altdown}{right}{altup}
;     }
;   SetTimer, clearVar, -100
; return


; <!k::+^up
; <!j::+^down
; $<^l::sendinput,{ctrldown}]{ctrlup}
; $<^h::sendinput,{ctrldown}[{ctrlup}
; $<^right::sendinput,{ctrldown}]{ctrlup}
; $<^left::sendinput,{ctrldown}[{ctrlup}
; enter::send,{enter}
tab & f:: sendinput,{shiftdown}{altdown}{ctrldown}{]}{ctrlup}{altup}{shiftup}
tab::tab
!t::TT(trackpadhints,5000)
<^r::reloadscript()
; f19 & lctrl::send,{ctrldown}{tab}{ctrlup}

<^f19::send,{shiftdown}{ctrldown}{tab}{ctrlup}{shiftup}



Lshift::DoublePress("{altdown}{left}{altup}",,"Backward")
Rshift::DoublePress("{altdown}{right}{altup}",,"Forward")
LCtrl::DoublePress("{altdown}{shiftdown}{up}{shiftup}{altup}")
; Lalt::send, {altdown}{shiftdown}{up}{shiftup}{altup}

DoublePress(action,SecondAction:="", ToolTip:=""){

  If (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<300){
    send, %action%{shiftup}{altup}{ctrlup}{lwinup}
    tt(ToolTip)
  }
  Else
    send % SecondAction "{shiftup}{altup}{ctrlup}{lwinup}"
  Return
}



LCtrl & Appskey::return
; Lalt & Appskey::return
Lwin & Appskey::return
Lwin::doublepress("{backspace}")
rshift & space::send,{shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
<^lwin::delete
<+space::send,{shiftdown}{altdown}{ctrldown}{e}{ctrlup}{altup}{shiftup}
;~lshift::f16
;~rshift::f17
rbutton & f7::wheel_2("!{right}",10)
rbutton & f6::wheel_2("!{left}",10)
rbutton & lbutton::sendinput,{shiftdown}{click}{shiftup}
rbutton & wheeldown::wheel_2("{ctrldown}v{ctrlup}",2000)
rbutton & wheelup::wheel_2("{ctrldown}x{ctrlup}",2000)
rbutton & f19::vs_code_windowinfo()
^s::sendinput, {ctrldown}{end}{ctrlup}
; $rbutton up::mouse_rbuttonup()
media_play_pause::f9
; f20 & lbutton::^+4
f9 & f6::return
; f20 & f9::f5
f9 & wheeldown::toggledefinition() ;next search

f9 & wheelup::wheel_2("{shiftdown}{altdown}{up}{altup}{shiftup}",50)

F20 & h::send, {shiftdown}{altdown}{lwindown}{left}{lwinup}{altup}{shiftup}
F20 & k::send, {shiftdown}{altdown}{lwindown}{up}{lwinup}{altup}{shiftup}
F20 & j::send, {shiftdown}{altdown}{lwindown}{down}{lwinup}{altup}{shiftup}
F20 & l::send, {shiftdown}{altdown}{lwindown}{right}{lwinup}{altup}{shiftup}
F19 & k::send, {shiftdown}{altdown}{lwindown}{up}{lwinup}{altup}{shiftup}
F19 & j::send, {shiftdown}{altdown}{lwindown}{down}{lwinup}{altup}{shiftup}
F19 & l::send, {shiftdown}{ctrldown}{pgdn}{ctrlup}{shiftup}
F19 & h::send, {shiftdown}{ctrldown}{pgup}{ctrlup}{shiftup}
F20 & backspace::delete
; f19 & down::^down
; f19 & up::^up
; f19 & left::^left
; f19 & right::^rightVariable()
f19 & `::send, ~
f19 & p::send, %process%


f19 & m::send, %mouseposition%
f19 & t::send, %wintitle%
f19 & w::send, %wininfo%
f19 & f6::send,{ctrldown}{[}{ctrlup}
f19 & f7::send,{ctrldown}{]}{ctrlup}
f19 & wheeldown::send,{ctrldown}{down}{ctrlup}
f19 & wheelup::send,{ctrldown}{up}{ctrlup}
f19 & lbutton::send,{ctrldown}{click}{ctrlup}
; ~Lctrl & Space::vscode_menu()

; #If WinActive("ahk_exe Code.exe") && Getkeystate("F13","p") ;editor



F13::send, {esc}{ctrlup}{altup}
;FUNCTIONS-----------------------------------------------------------
#IfWinActive, 

VS_Code_WindowInfo(){
	global
	CoordMode, mouse, window
	MouseGetPos, mX, mY, ,WinControl
	WinGetPos,wX,wY,wW,wH, A
	WinGetTitle, winTitle, A
	WinGetClass, Winclass, A
	WinGet, WinProcess, ProcessName, A
	MousePosition:=mX "`, " mY
	Sleep, 100
	Tooltip % MousePosition "`n Title: " winTitle " `n Process: " WinProcess " `n Control: "winControl " `n Class: " winclass "`nWindowPosition " wX ", " wY ", " wW ", " wH
	Process:= "ahk_exe " WinProcess
	WinInfo:="WinMove, " Wintitle ", , " wX ", " wY ", " wW ", " wH
	keywait, F20, U
	sleep 400
	Tooltip,
	; SetTimer, RemoveToolTip, -2000
}



#IfWinExist, ahk_exe AutoHotkey.exe Vquest.ahk
  Mbutton::WinClose, ahk_exe AutoHotkey.exe Vquest.ahk
  #ifwinexists,C:\Users\mmignin\Documents\VQuest\Vquest.ahk - AutoHotkey 
    Media_Play_Pause::Send, {F5}
#ifwinactive,

ReloadScript(){
; global iteration
; ControlGetText, Iteration, Static5, VarBar
TT("Reload")
IfWinExist, ahk_exe AutoHotkey.exe Vquest.ahk
  WinActivate,
sendinput, ^s
sleep 200
run, VQuest.ahk
send,{altup}{CtrlUp}{ShiftUp}{LWinUp}
}

ToggleDefinition(){
global
If toggle := !toggle
sendinput ^d
else
sendinput, +{esc}
return
}

VSCODE_Hotstrings:
:*r:cd\::{ctrldown}
:*r:cu\::{ctrlup}
:*r:ad\::{altdown}
:*r:au\::{altup}
:*r:sd\::{shiftdown}
:*r:su\::{shiftup}
:*r:wd\::{lwindown}
:*r:wu\::{lwinup}
Modifier_Hotstrings:
:*R:c\::
sendraw,{ctrldown}{}{ctrlup}
sendinput,{left 9}
return
:*R:w\::
sendraw,{lwindown}{}{lwinup}
sendinput,{left 9}
return
:*r:a\::
sendraw,{altdown}{}{altup}
sendinput,{left 8}
return
:*r:s\::
sendraw,{shiftdown}{}{shiftup}
sendinput,{left 10}
return
:*r:asw\::
:*r:aws\::
:*r:saw\::
:*r:swa\::
:*r:was\::
:*r:wsa\::
sendraw,{shiftdown}{altdown}{lwindown}{}{lwinup}{altup}{shiftup}
sendinput,{left 25}
return
:*r:asc\::
:*r:acs\::
:*r:sac\::
:*r:sca\::
:*r:cas\::
:*r:csa\::
sendraw,{shiftdown}{altdown}{ctrldown}{}{ctrlup}{altup}{shiftup}
sendinput,{left 25}
return
:*r:sc\::
:*r:cs\::
sendraw,{shiftdown}{ctrldown}{}{ctrlup}{shiftup}
sendinput,{left 18}
return
:*r:sw\::
:*r:ws\::
sendraw,{shiftdown}{lwindown}{}{lwinup}{shiftup}
sendinput,{left 18}
return
:*r:sa\::
:*r:as\::
sendraw,{shiftdown}{altdown}{}{altup}{shiftup}
sendinput,{left 17}
return
:*r:ca\::
:*r:ac\::
sendraw,{altdown}{ctrldown}{}{ctrlup}{altup}
sendinput,{left 16}
return
:*r:wa\::
:*r:aw\::
sendraw,{altdown}{lwindown}{}{lwinup}{altup}
sendinput,{left 16}
return
:*R:main\::NuGenesis LMS - \\Remote
:*R:lms\::ahk_exe WFICA32.EXE
:*R:wa\::winactivate,
:*R:ifw\::ifwinactive,  
:*R:ifwe\::ifwinexists, 
:*R:#ifw\::#ifwinactive, 
:*R:iel\::if ErrorLevel, 

#ifwinactive,

F2::Run, WindowSpy.ahk, C:\Program Files\AutoHotkey\
$+F12::ListLines
;:HelpFile:
#ifwinactive, C:\Users\mmignin\Documents\VQuest\Vquest.ahk - AutoHotkey
Media_Play_Pause::F5



VScode_menu(){
 global
Menu.delete()
Menu, Menu, Add, Search Hotkeys, vscode
  Menu, hotkeyMenu, Add, F20, vscode
  Menu, hotkeyMenu, Add, Ins, vscode
  Menu, hotkeyMenu, Add, Xbutton3, vscode
  Menu, hotkeyMenu, Add, F15, vscode
  Menu, hotkeyMenu, Add, numpadsub, vscode
  Menu, hotkeyMenu, Add, numpadadd, vscode
  Menu, hotkeyMenu, Add, F9, vscode
  Menu, hotkeyMenu, Add, Mbutton, vscode
  Menu, hotkeyMenu, Add, Rbutton, vscode
  Menu, hotkeyMenu, Add, Wheel, vscode
Menu, Menu, add, Search Hotkeys, :HotkeyMenu
    Menu,Menu, Add, &NeGenesis, vscode
    Menu,Menu, Add, &LMS, vscode
  
  
  if MousePosition
    Menu,Menu, Add, &Mouse `t %MousePosition%, vscode
  if WinInfo
    Menu,Menu, Add, &Window Info, vscode
  if WinTitle
    Menu,Menu, Add, &Title `t %WinTitle%, vscode
  if WinProcess
    Menu,Menu, Add, &Process `t %WinProcess%, vscode
  if WinControl
    Menu,Menu, Add, &Control `t %WinControl%, vscode

	;   Menu,Menu,add,Test_&1,Tests
  ;  Menu,Menu,add,Test_&2,Tests
  ;  Menu,Menu,add,Test_&3,Tests
Menu.show()

 }



	VScode:
 if (A_thismenuitem = "F20")
 Sendinput, ^{f}F20`:`:{Tab 6}{down 2}
	else if (A_thismenuitem = "Numlock")
 Sendinput, ^f_Psudo Numpad{Tab 6}{down 2}
	else if (A_thismenuitem = "Xbutton3")
 Sendinput, ^fXbutton3`:`:{Tab 6}{down 2}
 else if (A_thismenuitem = "F15")
  Sendinput, ^fF15`:`:{Tab 6}{down 2}
   else if (A_thismenuitem = "numpadsub")
  Sendinput, ^fnumpadsub`:`:{Tab 6}{down 2}
   else if (A_thismenuitem = "numpadadd")
   Sendinput, ^fnumpadadd`:`:{Tab 6}{down 2}
   else if (A_thismenuitem = "F19")
   Sendinput, ^fF19`:`:{Tab 6}{down 2}
   else if (A_thismenuitem = "F20")
    Sendinput, ^fF20`:`:{Tab 6}{down 2}
   else if (A_thismenuitem = "Mbutton")
    Sendinput, ^fMbutton{Tab 6}{down 2}
   else if (A_thismenuitem = "Rbutton")
    Sendinput, ^fRbutton{Tab 6}{down 2}
   else if (A_thismenuitem = "Wheel")
    Sendinput, ^fWheel{Tab 6}{down 2}
   else if A_thismenuItem contains &Mouse `t %MousePosition%
    sendinput, %MousePosition%
   else if A_thismenuItem contains &Window Info
    sendinput, %WinInfo%
   else if A_thismenuItem contains &Title `t %WinTitle%
    Sendinput, %WinTitle%
   else if A_thismenuItem contains &Process `t %WinProcess%
    sendinput, ahk_exe %WinProcess%
   else if A_thismenuItem Contains &Control `t %WinControl%
    sendinput, %WinControl%
   else if A_thismenuItem Contains &NuGenesis
    sendinput, NuGenesis LMS - \\Remote
   else if A_thismenuItem Contains &LMS
    sendinput, ahk_exe WFICA32.EXE
   else
    Menu,Menu, deleteAll
   return


FlashScreen(){
 send, #^{c}
 sleep 40
 send, #^{c}
return
}

TT(msg, time=1500, X:="",Y:="",W:="") {
	global
	tooltip, %msg%, %X%, %Y%,%W%
	SetTimer, RemoveToolTip%W%, -%time%
return


RemoveToolTip:
ToolTip
N=0
return
RemoveToolTip1:
ToolTip,,,,1
N=0
return
RemoveToolTip2:
ToolTip,,,,2
N=0
return
RemoveToolTip3:
ToolTip,,,,3
N=0
return
RemoveToolTip4:
ToolTip,,,,3
N=0
return
}