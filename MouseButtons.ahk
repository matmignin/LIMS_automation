Right_Click:
    Rbutton & Wheelup::wheelcut()
    Rbutton & Wheeldown::wheelpaste()
    Rbutton & WheelLeft::MouseSendProductCode()
    Rbutton & WheelRight::MouseSendBatchCode()
    Rbutton & Mbutton::#v
    Rbutton & Lbutton::enter
    Rbutton & F15::WinActivate, ahk_exe ONENOTE.EXE
    Rbutton & F14::WinActivate, ahk_exe EXCEL.EXE
    Rbutton & F13::sendinput, +{Click}
    Rbutton::
	  KeyWait,RButton
	  sendinput, {Click, Right}
	  return 
Thumb_Click: 
    F13 & LButton::sendinput, ^{Click}
    F13 & RButton::sendinput, ^{F1}
    F13 & MButton::sendinput, {F3}
    F13 & WheelLeft::Sendinput,{Lwin down}{left}{lwin up}
    F13 & WheelRight::Sendinput,{lwin down}{right}{lwin up}
    F13 & WheelUp::Sendinput,{lwin down}{up}{lwin up}
    F13 & WheelDown::Closewindow()   
    F13::wheelcopy()   
Ctrl_Click: 
    F15 & Wheelup::MouseClick,WheelUp,,,10,0,D,R   
    F15 & Wheeldown::MouseClick,WheelDown,,,10,0,D,R
    F15 & RButton::+Lbutton
    F15 & LButton::^Lbutton
    F15 & Mbutton:: 

    F15 & Wheelleft::backspace
    F15 & Wheelright::Sendinput,{home}+{end}
    F15::ClipboardToProductCode()
    
Alt_Click:
    F14 & WheelRight::MouseSendProductCode()
    F14 & Mbutton::^a
    F14 & WheelLeft::MouseSendBatchCode()
    F14 & Wheelup::^WheelUp    
    F14 & Wheeldown::^wheeldown
    F14 & Lbutton::WheelPaste()
    F14 & Rbutton::enter
    F14::ClipboardToBatchCode()
    
Mbutton_Click:
    Mbutton & Wheelup::sendinput,^{wheelup}
    Mbutton & Wheeldown::send,^{Wheeldown}
    Mbutton & Wheelright::send,^#{Right}
    Mbutton & Wheelleft::send,^#{left}
    Mbutton::Mbutton




#Include Fucnctions_MouseButton.ahk