

#IfWinActive, ahk_exe Code.exe



F19 & left::send, {shiftdown}{lwindown}{altdown}{left}{altup}{lwinup}{shiftup}
F19 & up::send, {shiftdown}{lwindown}{altdown}{up}{altup}{lwinup}{shiftup}
F19 & down::send, {shiftdown}{lwindown}{altdown}{down}{altup}{lwinup}{shiftup}
F19 & right::send, {shiftdown}{lwindown}{altdown}{right}{altup}{lwinup}{shiftup}
F19 & F20::send, {shiftdown}{lwindown}{altdown}{home}{altup}{lwinup}{shiftup}
; lwin::
; winactivate, ahk_exe WFICA32.EXE
; Test_3()
; return



Media_play_pause::send,{shiftdown}{altdown}{d}{altup}{shiftup}
; f20 & right::winmove, ahk_exe Code.exe, ,2037, -1080, 1525, 1087,
; f19 & space::sendinput,{ctrldown}{shiftdown}p{shiftup}{ctrlup}
<^j::^down
<^k::^up
<!k::+^up
<!j::+^down
; $<^l::sendinput,{ctrldown}]{ctrlup}
; $<^h::sendinput,{ctrldown}[{ctrlup}
; $<^right::sendinput,{ctrldown}]{ctrlup}
; $<^left::sendinput,{ctrldown}[{ctrlup}
; enter::send,{enter}
tab & f:: sendinput,{shiftdown}{altdown}{ctrldown}{]}{ctrlup}{altup}{shiftup}
tab::tab
!t::tooltip(trackpadhints,5000)
<^r::reloadscript()
; f19 & lctrl::send,{ctrldown}{tab}{ctrlup}

; ~lctrl & f19::send,{shiftdown}{ctrldown}{tab}{ctrlup}{shiftup}

~rshift & lshift::sendinput,{altdown}{left}{altup}
~lshift & rshift::sendinput,{altdown}{right}{altup}

~rshift & space::send,{shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
~lshift & space::send,{shiftdown}{altdown}{ctrldown}{e}{ctrlup}{altup}{shiftup}
;~lshift::f16
;~rshift::f17
rbutton & f7::wheel_2("!{right}",10)
rbutton & f6::wheel_2("!{left}",10)
rbutton & lbutton::sendinput,{shiftdown}{click}{shiftup}
rbutton & wheeldown::wheel_2("{ctrl down}v{ctrl up}",2000)
rbutton & wheelup::wheel_2("{ctrl down}x{ctrl up}",2000)
rbutton & f19::vs_code_windowinfo()

$rbutton up::mouse_rbuttonup()
media_play_pause::f9
; f20 & lbutton::^+4
f9 & f6::return
; f20 & f9::f5
f9 & wheeldown::toggledefinition() ;next search

f9 & wheelup::wheel_2("{shiftdown}{altdown}{up}{altup}{shiftup}",50)

f19 & h::send,{altdown}{left}{altup}
f19 & k::send,{shiftdown}{altdown}{up}{altup}{shiftup}
f19 & j::send,{shiftdown}{altdown}{ctrldown}{left}{shiftup}{altup}{ctrlup}
f19 & l::send,{altdown}{ctrldown}{right}{altup}{ctrlup}
f19 & backspace::delete
; f19 & down::^down
; f19 & up::^up
; f19 & left::^left
; f19 & right::^right
f19 & `::send, ~
f19 & p::send, %process%
f19 & m::send, %mouseposition%
f19 & t::send, %wintitle%
f19 & w::send, %wininfo%
f19 & f6::send,{ctrldown}{[}{ctrlup}
f19 & f7::send,{ctrldown}{]}{ctrlup}
f19 & wheeldown::send,{ctrl down}{down}{ctrl up}
f19 & wheelup::send,{ctrl down}{up}{ctrl up}
f19 & lbutton::send,{ctrldown}{click}{ctrlup}

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
	WinInfo:="WinMove, WINtITE, , " wX ", " wY ", " wW ", " wH
	keywait, F20, U
	sleep 400
	Tooltip,
	; SetTimer, RemoveToolTip, -2000
}

ReloadScript(){
global iteration
ControlGetText, Iteration, Static5, VarBar
tooltip("Reload")
if (iteration = -1)
{
sendinput,{F5}
IniWrite, -2, data.ini, SavedVariables, Iteration
}
else if (iteration = -2)
sendinput,{F4}
else
{
sendinput, ^s
sleep 200
run, VQuest.ahk
}
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
:*r:a\::
sendraw,{altdown}{}{altup}
sendinput,{left 8}
return
:*r:s\::
sendraw,{shiftdown}{}{shiftup}
sendinput,{left 10}
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
:*R:main\::NuGenesis LMS - \\Remote
:*R:lms\::ahk_exe WFICA32.EXE
:*R:bb\::numpadsub
:*R:bf\::numpadadd
:*R:mp\::numpadmult
:*R:mn\::numpaddiv
:*R:wa\::winactivate,{space}
:*R:ifw\::ifwinactive,{space}  
:*R:ifwe\::ifwinexists,{space}  
:*R:#ifw\::#ifwinactive,{space}  

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
  Menu,Menu, Add, &Mouse `t %MousePosition%, vscode
  Menu,Menu, Add, &Window Info, vscode
  Menu,Menu, Add, &Title `t %WinTitle%, vscode
  Menu,Menu, Add, &Process `t %WinProcess%, vscode
  Menu,Menu, Add, &Control `t %WinControl%, vscode
		 Menu,Menu,add,Test_&1,Tests
   Menu,Menu,add,Test_&2,Tests
   Menu,Menu,add,Test_&3,Tests
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
   else
    Menu,Menu, deleteAll
   return


			FlashScreen(){
 send, #^{c}
 sleep 20
 send, #^{c}
return
}

