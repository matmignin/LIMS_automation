#SingleInstance force
CoordMode Mouse, Screen
Gosub, DetectScreen
g_size  := 25 ; ca. way to drag gesture for 1 radius

zone_x20_y20 = . >>vv    # Prev|{Backspace}
zone_x10_y20 = . > vv    # FULL Style ---|#8
zone_x00_y20 = .   vv    - FULL SIZE|#{Numpad0}
zone_x01_y20 = .   vv <  # FULL Style +++|#9
zone_x02_y20 = .   vv << # Next|+{Backspace}

zone_x10_y10 = . > v    # UP-LEFT|#{Numpad7}
zone_x00_y10 = .   v    ! UP|#{Numpad8}
zone_x01_y10 = .   v <  # UP-RIGHT|#{Numpad9}

zone_x20_y00 = .  >>    - PREV TASK|!{Esc}
zone_x10_y00 = .   >    - LEFT|#{Numpad4}
zone_x00_y00 =           |{Esc}
zone_x01_y00 = . <      - RIGHT|#{Numpad6}
zone_x02_y00 = . <<     - NEXT TASK|!+{Esc}

zone_x20_y02 = . > ^^   # Expose|{F10}
zone_x10_y01 = . > ^    # DOWN-LEFT|#{Numpad1}
zone_x00_y01 = .   ^    ! DOWN|#{Numpad2}
zone_x01_y01 = .   ^ <  # DOWN-RIGHT|#{Numpad3}
zone_x02_y02 = .   ^^ < # Desktop|{F9}

zone_x00_y02 = .   ^^   - CENTER SIZE|#{Numpad5}

GestureButton = RButton ; you can chang it to MButton if you like
Hotkey, %GestureButton% ,  DoGesture

#Numpad7::WinMove, A,, mLeft        ,mTop       ,mW/2   ,mH/2       ; Top Left      H H 
#Numpad8::WinMove, A,, mLeft        ,mTop       ,mW     ,mH/2       ; Top           F H
#Numpad9::WinMove, A,, mLeft+mW/2   ,mTop       ,mW/2   ,mH/2       ; Top Right     H H 
#Numpad4::WinMove, A,, mLeft        ,mTop       ,mW/2   ,mH         ; Left          H F
#Numpad5::WinMove, A,, mLeft+mW/6   ,mTop       ,mW/1.5 ,mH         ; Center        H F 
#Numpad6::WinMove, A,, mLeft+mW/2   ,mTop       ,mW/2   ,mH         ; Right         H F
#Numpad1::WinMove, A,, mLeft        ,mTop+mH/2  ,mW/2   ,mH/2       ; Bottom Left   H H
#Numpad2::WinMove, A,, mLeft        ,mTop+mH/2  ,mW     ,mH/2       ; Bottom        H F
#Numpad3::WinMove, A,, mLeft+mW/2   ,mTop+mH/2  ,mW/2   ,mH/2       ; Bottom Right  H H
#Numpad0::WinMove, A,, mLeft        ,mTop       ,mW     ,mH         ; Full          F F

#8::WinSet, Style, +0xC00000, A
#9::WinSet, Style, -0xC00000, A
 


DetectScreen:
    WinGetPos,Tx,Ty,Tw,Th,ahk_class Shell_TrayWnd,,,
    border := 4
    mLeft :=                    ( Tw > Th  and  Tx = 0  and  Ty = 0) * Th + border / 2
    mTop  :=                    ( Tw < Th  and  Tx = 0  and  Ty = 0) * Tw + border / 2
    mH    := A_ScreenHeight  -  ( Tw > Th  ) * Th - border
    mW    := A_ScreenWidth   -  ( Tw < Th  ) * Tw - border
Return 

DoGesture:
    MouseGetPos,X1,Y1,id
    MouseGetPos,X2,Y2
    SetTimer, DrawFrame , 300 ; Delay

    zone =
    zone_cmd2 =
    zone_cmd1 =
    Loop {
       ButtonDown:=GetKeyState( GestureButton ,"P")
       IfNotEqual,ButtonDown,1,Break
       
       MouseGetPos,X2,Y2
       dx := X2-X1
       dy := Y2-Y1
       
      ; r := sqrt( dx*dx + dy*dy )
       zone := "x"  ceil((-dx > g_size) * abs(dx)/g_size/5)  "" ceil((dx > g_size) * abs(dx)/g_size/5) "_y" ceil((-dy > g_size) * abs(dy)/g_size/5) "" ceil((dy > g_size) * abs(dy)/g_size/5) ; "_r" ceil( r /g_size/5)
       StringSplit, zone_cmd,zone_%zone%, | 
       Tooltip,  % zone_cmd1 ; zone
      Sleep,15 ; To reduce load on CPU
    }
    
    if ( zone_cmd1 <> "" and zone_cmd2 <> "" )
    {
        StringLeft zone_cmd2a, zone_cmd2, 1
        if zone_cmd2a = #
            WinActivate, ahk_id %id%
        Send, %zone_cmd2%   ; execute defined command
    }
    else
    {
        SetTimer, DrawFrame, off
        Gui, Hide   
        Send, {%GestureButton%}
    }
    ToolTip ; clear
    Gui, Hide
Return

DrawFrame:
    SetTimer, DrawFrame, off
    Rz := 100
    Gui +AlwaysOnTop -Caption +ToolWindow +E0x20 +0x800000
    Gui Color, 0x00CCCCCC
    MouseGetPos x, y
    Gui, +Lastfound ; Make the GUI window the last found window.
    WinSet TransColor, 0x00CCCCCC
    Gui Show, % "w" 2*Rz " h" 2*Rz " x" x-Rz " y" y-Rz, Frame
Return