
class Vim{
	
	find(){
  send, {ShiftDown}{Ctrldown}{f}{CtrlUp}{ShiftUp}
  ; sleep 200
  input, letter, V,{enter}{lbutton}{lcontrol}{Rcontrol}{return}1234567890
  sleep 200
		    send, {esc}
		; , %letter%{a}
    ; keywait, enter, d
		; send, {esc}
		return
  }
	
		
	Line(LeaderKey){
  send, {esc} 
  Input, Numbers, L3,,{enter}
			send, {:}%Numbers%{enter}
	send, {a}
  return
  }
  
  key(key){
      Send, {esc}%key%{a}
  }
}

    
















VIM:
  #If Getkeystate("Capslock","p") 
    ;#If (A_PriorHotKey = "v" AND A_TimeSincePriorHotkey < 500)
    
  #If (A_PriorHotKey = "d" AND A_TimeSincePriorHotkey < 500)
    d::Send, {home 2}+{end}{Delete}
    w::sendinput, {right}^{left}+^{right}{backspace}
    4::sendinput, +{end}^x
    5::sendinput, ^m^x
    0::sendinput, +{home}^x
  #If (A_PriorHotKey = "y" AND A_TimeSincePriorHotkey < 500)
    d::Send, {home 2}+{end}^c
    ; w::sendinput, {right}{CtrlDown}{left}{shiftDown}{right}{shiftup}{c}{Ctrlup}
    5::sendinput, ^m^c
    4::Vim.key("y$")
    y::vim.key("yy")
    w::send, {ShiftDown}{altDown}{Ctrldown}{s}{altup}{ShiftUp}{c}{Ctrlup}
    0::Vim.key("y0") ;sendinput, +{home}^c
  #If (A_PriorHotKey = "v" AND A_TimeSincePriorHotkey < 500)
    w::send, {ShiftDown}{altDown}{Ctrldown}{s}{CtrlUp}{altup}{ShiftUp}
  #If (A_PriorHotKey = "g" AND A_TimeSincePriorHotkey < 500)
    g::Send, ^{home}
  #If (A_PriorHotKey = "p" AND A_TimeSincePriorHotkey < 500)
    ; p::Sendinput, {~}p{esc}
  #If Getkeystate("Capslock","p") 
    p::vim.key("p")
    1::F1
    2::F2
    ; 3::F3
    `::esc
    j::down
    ; j::down
    k::Up
    t::!down
    s::send, {ShiftDown}{altDown}{Ctrldown}{s}{CtrlUp}{altup}{ShiftUp}
    +s::send, {ShiftDown}{altDown}{Ctrldown}{e}{CtrlUp}{altup}{ShiftUp}
    ; k::Up
    h::left
    ; h::left
    l::right
    ; l::right
    x::Delete
    g::send, ^{end}
    4::end
    0::home ;Send 
    y::return
    d::return ; Send, {home 2}+{end}^x{delete}
    +^j::send, {ShiftDown}{altDown}{Ctrldown}{down}{CtrlUp}{altup}{ShiftUp}
    +^k::send, {ShiftDown}{altDown}{Ctrldown}{up}{CtrlUp}{altup}{ShiftUp}
    *w::Sendinput, {CtrlDown}{right 2}{CtrlUp}
        ; +w::Sendinput, {CtrlDown}{right 2}{CtrlUp}
    e::Sendinput, ^{right}
  ;  u::Send ^z
    up::+up
    down::+down
    right::+right
    left::+left
    b::sendinput, {CtrlDown}{left}{Ctrlup}
    Shift & o::sendinput, {home}{enter}{up}
    ; backspace::sendinput, {CtrlDown}{backspace}{Ctrlup}
    Capslock & o::Send, {end}{enter}
    o::Sendinput, {end}{enter}
    +o::Sendinput, {Home}{enter}
    Shift & ,::sendinput, !{,}
    left::sendinput, {CtrlDown}{[}{Ctrlup}
    right::sendinput, {CtrlDown}{]}{Ctrlup}
    ; f::sendinput, {esc}{CtrlDown}{f}{Ctrlup}
      v::
      while GetKeyState("Capslock","p")
      sendinput, {Shift down}
      sleep 200
      send, {shift up}
      sleep 500
      return
      
    *shift::
      while GetKeyState("Capslock","p")
      sendinput, {Shift down}
      sleep 200
      send, {shift up}
      sleep 500
      return
    *ctrl::
      while GetKeyState("Capslock","p")
        send, {ctrldown}
      sleep 200
      send, {ctrlup}
      return
    *alt::
      while GetKeyState("Capslock","p")
        send, {altdown}
      sleep 200
      send, {altup}
      return

  ,::sendinput, {Altdown}{Ctrldown}{/}{CtrlUp}{AltUp}
  $a::sendinput, {ShiftDown}{altDown}{a}{shiftUp}{altup}

  f::Vim.find("f")
  +5::
    sendraw,`%
    send, {CtrlDown}{right}{Ctrlup}
    sendraw,`%
    return
    '::"
  [::
    sendraw,{
    send, {CtrlDown}{right}{Ctrlup}
    sendraw,}
    return
  ]::
    sendraw,}
    send, {CtrlDown}{left}{Ctrlup}
    sendraw,{
    return
;   3::+F3{
  m::sendinput, {ShiftDown}{CtrlDown}{altDown}{]}{Ctrlup}{altup}{ShiftUp}
  u::sendinput, {ShiftDown}{CtrlDown}{altDown}{[}{altup}{Ctrlup}{ShiftUp}
  ^m::sendinput, {ShiftDown}{altDown}{right}{altup}{ShiftUp}
  ^u::sendinput, {ShiftDown}{altDown}{left}{altup}{ShiftUp}
  ; u::+!up ;pselect revious instance of line
;select next instance of line
  up::sendinput, {Altdown}{shiftdown}{Ctrldown}{up}{shiftup}{CtrlUp}{AltUp}
  down::sendinput, {Altdown}{shiftdown}{Ctrldown}{down}{shiftup}{CtrlUp}{AltUp}
  `;::+!g 
  i::sendinput, {CtrlDown}{i}{Ctrlup}
  5::sendinput, {shiftDown}{Ctrldown}{/}{CtrlUp}{shiftup}
   r::^+!r
       Enter::sendinput, {shiftDown}{enter}{shiftup}
$CapsLock::send, {esc}{shiftup}{Ctrlup}{altup}
    $<^k::sendinput, {Ctrldown}{up}{CtrlUp}
    $<^up::sendinput, {Ctrldown}{up}{CtrlUp}
    $<^l::sendinput, {Ctrldown}{]}{CtrlUp}
    $<^right::sendinput, {Ctrldown}{]}{CtrlUp}
    $<^h::sendinput, {Ctrldown}{[}{CtrlUp}
    $<^left::send, {Ctrldown}{[}{CtrlUp}
    $<^j::send, {Ctrldown}{down}{CtrlUp}
    $<^down::send, {Ctrldown}{down}{CtrlUp}


   #if
; $capslock::esc


#If WinActive("ahk_exe Code.exe") && Getkeystate("Capslock","p") ;editor



    







PsudoNumlock:
  #If Getkeystate("F19","p")
  0::sendinput, {CtrlDown}{0}{Ctrlup}
    ;sendlevel 1
    m::numpad1
    ,::numpad2
    .::numpad3
    j::numpad4
    k::numpad5
    l::numpad6    
    u::numpad7
    h::left
    i::numpad8
    o::numpad9
    `;::sendinput, {numpad0}
    n::Numpaddiv
    y::up
    b::down
    /::numpaddot
    p::numpadmult
    =::sendinput, {=}
    -::sendinput, {-}
    n::sendinput, {-}
    '::right
    F20::send, {F21}
    RShift::sendinput, {Tab}
    ENTER::sendinput, {enter}
    space::SendInput, 0
    Lbutton::Menu()
    ;sendlevel 0
      #if
      
/*      
INDEX(Sub[Find],1),INDEX(Sub[Replace],1)),
INDEX(Sub[Find],2),INDEX(Sub[Replace],2)),
INDEX(Sub[Find],3),INDEX(Sub[Replace],3)),
INDEX(Sub[Find],4),INDEX(Sub[Replace],4)),
INDEX(Sub[Find],5),INDEX(Sub[Replace],5)),
INDEX(Sub[Find],6),INDEX(Sub[Replace],6)),
INDEX(Sub[Find],7),INDEX(Sub[Replace],7)),
INDEX(Sub[Find],8),INDEX(Sub[Replace],8)),
INDEX(Sub[Find],9),INDEX(Sub[Replace],9)),
INDEX(Sub[Find],10),INDEX(Sub[Replace],10)),
INDEX(Sub[Find],11),INDEX(Sub[Replace],11)),
INDEX(Sub[Find],12),INDEX(Sub[Replace],12)),
INDEX(Sub[Find],13),INDEX(Sub[Replace],13)),
INDEX(Sub[Find],14),INDEX(Sub[Replace],14)),
INDEX(Sub[Find],15),INDEX(Sub[Replace],15)),
INDEX(Sub[Find],16),INDEX(Sub[Replace],16)),
INDEX(Sub[Find],17),INDEX(Sub[Replace],17)),
INDEX(Sub[Find],18),INDEX(Sub[Replace],18)),
INDEX(Sub[Find],19),INDEX(Sub[Replace],19)),
INDEX(Sub[Find],20),INDEX(Sub[Replace],20)),
INDEX(Sub[Find],21),INDEX(Sub[Replace],21)),
INDEX(Sub[Find],22),INDEX(Sub[Replace],22)),
INDEX(Sub[Find],23),INDEX(Sub[Replace],23)),
INDEX(Sub[Find],24),INDEX(Sub[Replace],24)),
INDEX(Sub[Find],25),INDEX(Sub[Replace],25)),
INDEX(Sub[Find],26),INDEX(Sub[Replace],26)),
INDEX(Sub[Find],27),INDEX(Sub[Replace],27)),
INDEX(Sub[Find],28),INDEX(Sub[Replace],28)),
INDEX(Sub[Find],29),INDEX(Sub[Replace],29)),
INDEX(Sub[Find],30),INDEX(Sub[Replace],30)),
INDEX(Sub[Find],31),INDEX(Sub[Replace],31)),
INDEX(Sub[Find],32),INDEX(Sub[Replace],32)),
INDEX(Sub[Find],33),INDEX(Sub[Replace],33)),
INDEX(Sub[Find],34),INDEX(Sub[Replace],34)),
INDEX(Sub[Find],35),INDEX(Sub[Replace],35)),
INDEX(Sub[Find],36),INDEX(Sub[Replace],36)),
INDEX(Sub[Find],37),INDEX(Sub[Replace],37)),
INDEX(Sub[Find],38),INDEX(Sub[Replace],38)),
INDEX(Sub[Find],39),INDEX(Sub[Replace],39)),
INDEX(Sub[Find],40),INDEX(Sub[Replace],40)),
INDEX(Sub[Find],41),INDEX(Sub[Replace],41)),
INDEX(Sub[Find],42),INDEX(Sub[Replace],42)),
INDEX(Sub[Find],43),INDEX(Sub[Replace],43)),
INDEX(Sub[Find],44),INDEX(Sub[Replace],44)),
INDEX(Sub[Find],45),INDEX(Sub[Replace],45)),
INDEX(Sub[Find],46),INDEX(Sub[Replace],46)),
INDEX(Sub[Find],47),INDEX(Sub[Replace],47)),
INDEX(Sub[Find],48),INDEX(Sub[Replace],48)),
INDEX(Sub[Find],49),INDEX(Sub[Replace],49)),
INDEX(Sub[Find],50),INDEX(Sub[Replace],50)),
INDEX(Sub[Find],51),INDEX(Sub[Replace],51)),
INDEX(Sub[Find],52),INDEX(Sub[Replace],52)),
INDEX(Sub[Find],53),INDEX(Sub[Replace],53)),
INDEX(Sub[Find],54),INDEX(Sub[Replace],54)),
INDEX(Sub[Find],55),INDEX(Sub[Replace],55)),
INDEX(Sub[Find],56),INDEX(Sub[Replace],56)),
INDEX(Sub[Find],57),INDEX(Sub[Replace],57)),
INDEX(Sub[Find],58),INDEX(Sub[Replace],58)),
INDEX(Sub[Find],59),INDEX(Sub[Replace],59)),
INDEX(Sub[Find],60),INDEX(Sub[Replace],60)),
INDEX(Sub[Find],61),INDEX(Sub[Replace],61)),
Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(Substitute(substitute(
*/