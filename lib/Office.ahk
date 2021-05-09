

KEY_Excel:
  #IfWinActive, LMS Workbook.xlsb
  F18::Excel.Connect(1)
  MButton::Excel.Connect(1)
  F13 & F16::Click.Filter(2,"Product","xl") 
  F13 & F17::Click.Filter("Batch","enter","xl") 
  #ifwinactive, Book4
    F17::
      wheelright::sendinput, #{right}
      return
    F16::
      wheelleft::sendinput, #{left}
      return
  #ifwinactive, ahk_exe EXCEL.EXE
  +Enter::sendinput, !{enter}
  $Enter::sendinput, {enter}
  F18::Excel.Search()
  ; Mbutton::Excel.Connect(1)
  F16::wheel("{wheelleft}",80)
  F17::wheel("{wheelRight}",80)
  ; Mbutton & Wheelup::^Wheelup
  ; Mbutton & Wheeldown::^wheeldown
  Xbutton2 & F17::^PgDN ;Excel.NextSheet()
  Xbutton2 & F16::^PgUp ;Excel.PreviousSheet()
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
  Rbutton & F17::Varbar.Sendinput("Batch"," is updated.")
  Xbutton2 & WheelDown::Mouse_CloseWindow() ; searchbar("batch")
  Xbutton2 & Wheelup::searchBar("Product")
  Xbutton1::Clip()

  Xbutton1 & Wheelright::Varbar.AddIteration()
  Xbutton1 & wheelleft::Varbar.SubIteration()
  F18::LMS_Search()


KEY_OneNote:
  #IfWinActive, ahk_exe ONENOTE.EXE
  Mbutton & Wheelup::Wheel_2("{shiftdown}{altdown}{ctrldown}{=}{altup}{shiftup}{ctrlup}",50)
  Mbutton & Wheeldown::Wheel_2("{altdown}{shiftdown}{ctrldown}{-}{altup}{shiftup}{ctrlup}",50)
	F18 & Wheelup::Wheel_2("{F11}")
  F18::send, {AltDown}{w}{i}{Altup}
  F16::sendinput, {wheelleft 20}
  f17::sendinput, {Wheelright 10}
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