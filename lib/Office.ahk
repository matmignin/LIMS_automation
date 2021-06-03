

KEY_Excel:
  #IfWinActive, LMS Workbook.xlsb
  F8::Excel.Connect(1)
  MButton::Excel.Connect(1)
  F19 & backspace::delete
  F19 & down::^down
  F19 & up::^up
  F19 & left::^left
  F19 & right::^right
  F13 & F6::Click.SearchBar(2,"Product","xl") 
  F13 & F7::Click.SearchBar("Batch","{enter}","xl") 
#ifwinactive, Book
      F7::sendinput, #{right}
      wheelright::sendinput, #{right}
      F6::sendinput, #{left}
      wheelleft::sendinput, #{left}
#ifwinactive, ahk_exe EXCEL.EXE
    $rbutton::Mouse_RbuttonUP()
  +Enter::sendinput, !{enter}
  $Enter::sendinput, {enter}
  F10::send, ^f!t!h{right}{enter}!s{right}!t!n
;  Excel_Search()
  ; Mbutton::Excel.Connect(1)
  F6::wheel("{wheelleft}",80)
  F7::wheel("{wheelRight}",80)
  ; Mbutton & Wheelup::^Wheelup
  ; Mbutton & Wheeldown::^wheeldown
  Xbutton2 & F7::^PgDN ;Excel.NextSheet()
  Xbutton2 & F6::^PgUp ;Excel.PreviousSheet()
#ifwinactive, Find and Replace,
  Xbutton1 & WheelUp::
  Send, !{n}%Product%
  sleep 400
  return
  Xbutton1 & WheelDown::
 ; Wheel("{alt down}n{alt up}")
  Sendinput % Batch
  return
  return::sendinput, !{i}
  rbutton & Lbutton::sendinput, !{i}


KEY_OUTLOOK:
  #IfWinActive, ahk_exe OUTLOOK.EXE 
  Mbutton::SENDINPUT % Varbar.Sendinput("Batch") " is updated"
  Rbutton & Wheelup::Wheel("{ctrl down}x{ctrl up}")
  Rbutton & wheeldown::Wheel("{ctrl down}v{ctrl up}")
  Rbutton & F7::Varbar.Sendinput("Batch"," is updated.")
  Xbutton2 & WheelDown::Mouse_CloseWindow() ; searchbar("batch")
  Xbutton2 & Wheelup::searchBar("Product")
  Xbutton1::Clip()
  F20 & Space::sendinput % Trim(Batch, OmitChars = " `n")
  Xbutton1 & Wheelright::Varbar.AddIteration()
  Xbutton1 & wheelleft::Varbar.SubIteration()
  F8::LMS_Search()


KEY_OneNote:
  #IfWinActive, ahk_exe ONENOTE.EXE
  Mbutton & Wheelup::Wheel_2("{shiftdown}{altdown}{ctrldown}{=}{altup}{shiftup}{ctrlup}",50)
  Mbutton & Wheeldown::Wheel_2("{altdown}{shiftdown}{ctrldown}{-}{altup}{shiftup}{ctrlup}",50)
	F8 & Wheelup::Wheel_2("{F11}")
  F8::send, {AltDown}{w}{i}{Altup}
  F6::sendinput, {wheelleft 20}
  F7::sendinput, {Wheelright 10}
	mbutton::ctrl
  $mbutton up::sendinput, {ctrlup}
  Xbutton1 up::PasteScreenshot()
    PasteScreenshot(){
    sleep 200
    sendinput, +^{4}
    sleep 200
    KeyWait, LButton, d 
    MouseClick, left,,, 1, 0, D
    ; sleep 200
    KeyWait, LButton,  
    ; sleep 200
    sleep 200
    KeyWait, Xbutton1, 
    MouseClick, left,,, 1, 0, u
    send, {enter}
    sleep 200 ;screenshot"}
    WinActivate, %mwin%
    sleep 200
    ; CLICK, %Mx%, %My%
    send, ^v
    return
          }
    #IfWinActive,