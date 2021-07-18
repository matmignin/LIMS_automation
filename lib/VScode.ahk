#IfWinActive, ahk_exe Code.exe


  $Lwin Up::            SendInput !+i
  Tab & h::             ^[  
  Tab & l::             ^]
  Tab & j::             down
  Tab & k::             up
  Tab & f13::           send, {shiftdown}{altdown}{lwindown}{q}{lwinup}{altup}{shiftup}
  Tab & 1::             send, {shiftdown}{altdown}{lwindown}{1}{lwinup}{altup}{shiftup}
  Tab & 2::             send, {shiftdown}{altdown}{lwindown}{2}{lwinup}{altup}{shiftup}
  Tab & 3::             send, {shiftdown}{altdown}{lwindown}{3}{lwinup}{altup}{shiftup}
  Tab & `::             send, {shiftdown}{altdown}{lwindown}{``}{lwinup}{altup}{shiftup}
  Tab & F15::           send, {shiftdown}{altdown}{lwindown}{4}{lwinup}{altup}{shiftup}
  F14::                 ReloadScript()
; F15::                 sendinput, {up 10}
  F16::                 send, {shiftdown}{altdown}{ctrldown}{z}{ctrlup}{altup}{shiftup}
  F17::                 send, {shiftdown}{altdown}{ctrldown}{x}{ctrlup}{altup}{shiftup}
  ` & Tab::             send, {shiftdown}{altdown}{lwindown}{4}{lwinup}{altup}{shiftup}
  ; `::                 send, {``}
  ^F::                  
                        tt("Find",200)
                        send, {ctrldown}{f}{ctrlup}
                        return
  F6::                  F6
  F7::                  F7
  F8::                  F8
  F9::                  F9


F20 & Right::           WinMove, ahk_exe Code.exe, , 1858, -1080, 1642, 1087
F20 & Down::            WinMove, ahk_exe Code.exe, , 603, 14, 1963, 1354
F19 & left::            send, {shiftdown}{lwindown}{altdown}{left}{altup}{lwinup}{shiftup}
F19 & up::              send, {shiftdown}{lwindown}{altdown}{up}{altup}{lwinup}{shiftup}
F19 & down::            send, {shiftdown}{lwindown}{altdown}{down}{altup}{lwinup}{shiftup}
F19 & right::           send, {shiftdown}{lwindown}{altdown}{right}{altup}{lwinup}{shiftup}
F19 & -::               send, {ctrldown}{-}{ctrlup}
F19 & =::               send, {ctrldown}{=}{ctrlup}
F19 & y::               send, {ctrldown}{w}{ctrlup}
F19 & /::               send, {shiftdown}{altdown}{ctrldown}{/}{ctrlup}{altup}{shiftup}
tab & f::                sendinput,{shiftdown}{altdown}{ctrldown}{]}{ctrlup}{altup}{shiftup}

tab::                   tab
`::                     send, {``}
!t::                    TT(trackpadhints,5000)
<^r::                   reloadscript()
  LCtrl & Appskey::     return

  <^f19::               send,{shiftdown}{ctrldown}{tab}{ctrlup}{shiftup}
  Lshift::              DoublePress("{altdown}{left}{altup}",,"Backward")
  Rshift::              DoublePress("{altdown}{right}{altup}",,"Forward")
  LCtrl up::            doublepress("{altdown}{shiftdown}{up}{shiftup}{altup}")
  Lwin & Appskey::      return
  Lalt & Appskey::      return
  Lwin::                doublepress("{altdown}{shiftdown}{up}{shiftup}{altup}+{2}")
  rshift & space::      send,{shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}
  <^lwin::              delete
  <+space::             send,{shiftdown}{altdown}{ctrldown}{e}{ctrlup}{altup}{shiftup}

  $<^F13::              shift

  rbutton & f7::        wheel_2("!{right}",10)
  rbutton & f6::        wheel_2("!{left}",10)
  rbutton & lbutton::   sendinput,{shiftdown}{click}{shiftup}
  rbutton & wheeldown:: wheel_2("{ctrldown}v{ctrlup}",2000)
  rbutton & wheelup::   wheel_2("{ctrldown}x{ctrlup}",2000)
  rbutton & f19::       vs_code_windowinfo()
  ^s::                  sendinput, {ctrldown}{end}{ctrlup}
  f9 & f6::             return
  F20 & h::             send, {shiftdown}{altdown}{lwindown}{left}{lwinup}{altup}{shiftup}
  F20 & k::             send, {shiftdown}{altdown}{lwindown}{up}{lwinup}{altup}{shiftup}
  F20 & j::             send, {shiftdown}{altdown}{lwindown}{down}{lwinup}{altup}{shiftup}
  F20 & l::             send, {shiftdown}{altdown}{lwindown}{right}{lwinup}{altup}{shiftup}
  F19 & k::             send, {shiftdown}{altdown}{lwindown}{up}{lwinup}{altup}{shiftup}
  F19 & j::             send, {shiftdown}{altdown}{lwindown}{down}{lwinup}{altup}{shiftup}
  F19 & l::             send, {shiftdown}{ctrldown}{pgdn}{ctrlup}{shiftup}
  F19 & h::             send, {shiftdown}{ctrldown}{pgup}{ctrlup}{shiftup}
  F20 & backspace::     delete
  f19 & `::             send, ~
  f19 & r::             send, %process%
  f19 & n::             send, {shiftdown}{altdown}{lwindown}{m}{lwinup}{altup}{shiftup} ;navigate bookmarks
  f19 & c::             send, %mouseposition%
  f19 & t::             send, %wintitle%
  f19 & w::             send, %wininfo%
  f19 & f6::            send,{ctrldown}{[}{ctrlup}
  f19 & f7::            send,{ctrldown}{]}{ctrlup}
  f19 & wheeldown::     send,{ctrldown}{down}{ctrlup}
  f19 & wheelup::       send,{ctrldown}{up}{ctrlup}
  f19 & lbutton::       ^lbutton
  F13 up::              send, {esc}{ctrlup}{altup}
  F13 & space::         send, {shiftdown}{altdown}{ctrldown}{s}{ctrlup}{altup}{shiftup}

#If (A_PriorKey = "F19" AND A_TimeSincePriorkey < 950)
numpadsub::             numpadsub
numpadadd::             numpadadd
numpadmult::            send, {shiftdown}{altdown}{lwindown}{p}{lwinup}{altup}{shiftup}
numpaddiv::             send, {ctrldown}{w}{ctrlup}
F8::                    send, {ctrldown}{F8}{ctrlup}
F9::                    send, {ctrldown}{F9}{ctrlup}
F7::                    send, {ctrldown}{F7}{ctrlup}
F6::                    send, {ctrldown}{F6}{ctrlup}
wheelup::               Numpadmult
wheeldown::             tt(yo)
#if
#IfWinActive, ahk_exe Code.exe
numpadsub::             numpadsub
numpadadd::             numpadadd
numpadmult::            numpadmult
numpaddiv::             numpaddiv
^numpaddiv::            send, {ctrldown}{w}{ctrlup}
F19 up::                send, {F19}
; ^f9::                 send, {shiftdown}{altdown}{Up}{altup}{shiftup}
; ^f9::                 send, {shiftdown}{altdown}{F8}{altup}{shiftup}
; ^f9::                 send, {shiftdown}{altdown}{F9}{altup}{shiftup}
; ^f9::                 send, {shiftdown}{altdown}{Up}{altup}{shiftup}

VSCODE_Hotstrings:
  :*r:cd\::             {ctrldown}
  :*r:cu\::             {ctrlup}
  :*r:ad\::             {altdown}
  :*r:au\::             {altup}
  :*r:sd\::             {shiftdown}
  :*r:su\::             {shiftup}
  :*r:wd\::             {lwindown}
  :*r:wu\::             {lwinup}
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
  :*r:csw\::            
  :*r:cws\::            
  :*r:scw\::            
  :*r:swc\::            
  :*r:wcs\::            
  :*r:wsc\::            
                        sendraw,{shiftdown}{ctrldown}{lwindown}{}{lwinup}{ctrlup}{shiftup}
                        sendinput,{left 26}
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
  :*R:main\::           
                        sendraw, NuGenesis LMS - \\Remote
                        return
                        :*R:lms\::            
                        sendraw, ahk_exe WFICA32.EXE
                        return
                        :*R:wa\::             
                        sendraw,  winactivate,
                        return
                        :*R:ifw\::            
                        sendraw, ifwinactive,  
                        return
                        :*R:ifwe\::           
                        sendraw, ifwinexists, 
                        return
                        :*R:#ifw\::           
                        sendraw, #ifwinactive, 
                        return
                        :*R:iel\::            
                        sendraw, if ErrorLevel,
                        return
                        :*R:rtn::             Return
                        return  
   

#ifwinactive,


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

DoublePress(action,SecondAction:="", ToolTip:=""){

  If (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<300){
    send, %action%{shiftup}{altup}{ctrlup}{lwinup}
    tt(ToolTip)
  }
  Else
    send % SecondAction "{shiftup}{altup}{ctrlup}{lwinup}"
  Return
}



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

ReloadScript(){
TT("Reload")
IfWinExist, ahk_exe AutoHotkey.exe Vquest.ahk
  WinActivate,
sendinput, ^s
sleep 200
run, VQuest.ahk
send,{altup}{CtrlUp}{ShiftUp}{LWinUp}
}
