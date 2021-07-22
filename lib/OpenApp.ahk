return
#IfWinActive,
F1::send, {lwindown}{e}{lwinup}
+F2::
		Run, SAMPLE TO QC 2021.xlsx, \\10.1.2.118\share\QA FINSHED GOODS\Samples Photo Library\SAMPLES TO QC
		winwait, File in Use,,1
		send, {altdown}{r}{altup}
    return
F2::
  if winexist("SAMPLE LOG 2021"){
    winactivate
    return
  }
  Run, SAMPLE LOG 2021.xlsx, \\10.1.2.118\share\QC LAB\
  winactivate, ahk_exe EXCEL.EXE
  sleep 200
  winwait,File in Use,,9
    if !errorlevel
      send, {altdown}{r}{altup}
  winwait, Password,,2
    if !errorlevel
      send, lab{enter}
  winwait, SAMPLE LOG 2021.xlsx,, 3
    if !errorlevel
      excel.search()
  return
F3::
  if winexist("LMS Products Checklist"){
    winactivate
    return
  }
  Run, LMS Products Checklist.xlsm, \\10.1.2.118\share\QC LAB\
  winactivate, ahk_exe EXCEL.EXE
  sleep 200
  return
F4::
  if winexist("C:\Users\mmignin\Desktop\Desktop Stuff\Label Copy\All Label Copy"){
    winactivate
    sleep 200 
    send, {ctrldown}{e}{ctrlup}
    return
  }
  Run, C:\Users\mmignin\Desktop\Desktop Stuff\Label Copy\All Label Copy
  winactivate, ahk_exe EXCEL.EXE
  sleep 200 
  send, {ctrldown}{e}{ctrlup}
  return
^F1::
  if winexist("AutoHotkey Help")
    winactivate
  Run, AutoHotkey.chm, C:\Users\mmignin\Documents
  return
OpenApps:
#IfWinNotActive, ahk_exe Code.exe
 F13 & f::OpenApp.Firefox()
 !f::OpenApp.Firefox()
 F13 & v::OpenApp.vsCode()
 !v::OpenApp.vsCode()
 ; !c::OpenApp.Clickup()
 !e::send,{LWinDown}{e}{lwinup}
 !+v::OpenApp.VPN()
 !o::OpenApp.Outlook()
 !p::OpenApp.YourPhone()
 F20 & p::OpenApp.YourPhone()
 !d::OpenApp.Display()
 ; !n::run, notes.ahk, %A_ScriptDir%\lib
 f20 & n::
 !n::openApp.OneNote()
 +!n::openApp.stickyNotes()
 !w::OpenApp.Workbook()
 F13 & e::OpenApp.Workbook()

 !l::OpenApp.LMS()
#ifwinnotactive


class OpenApp{

Clickup(){
 ifwinnotexist, ahk_exe ClickUp.exe
  WinActivate, ahk_exe ClickUp.exe
 else
  run, ClickUp.exe, C:\Program Files\ClickUp\

 return
 }


PhoneApp(){
 sendlevel 1
 ifwinnotexist, Your Phone
   send, {shiftdown}{altdown}{F8}{altup}{shiftup}
 else
  WinActivate, Your Phone
 sendlevel 0
 return
 }

Outlook(){
 ifwinnotexist, ahk_exe OUTLOOK.exe
 {
  Run, OUTLOOK.exe, C:\Program Files\Microsoft Office\root\Office16\
  winactivate, ahk_exe OUTLOOK.EXE
  WinMove, ahk_exe OUTLOOK.EXE, ,1683, -1080, 1484, 1080
 }
 else
	WinActivate, ahk_exe OUTLOOK.exe
 return
 }

	Explorer(){
 If WinActive("ahk_exe explorer.exe"){
  send,{altDown}{tab}{altup}
  return
 }
 ifwinnotexist, ahk_exe explorer.exe
  send,{LWinDown}{e}{lwinup}
 IfWinNotActive,ahk_exe explorer.exe
  WinActivate, ahk_exe explorer.exe
 return
 }
	Firefox(){
 ifwinnotexist, ahk_exe firefox.exe
  run, firefox.exe, "C:\Program Files\Mozilla Firefox\"
 else
  WinActivate, ahk_exe firefox.exe
 ; sleep 200
 WinWait, ahk_exe firefox.exe,,2
 sleep 200
  ; ControlSend, Control ^l, ahk_exe firefox.exe
  send,{CtrlDown}{l}{Ctrlup}
 return
 }

	VPN(){
 ifwinnotexist, ahk_exe explorer.exe
  run, https://remote.vitaquest.com/cgi-bin/welcome
		 WinWait, ahk_exe firefox.exe,,2
			sleep 500
  ControlSend, Control, enter, ahk_exe firefox.exe
		sleep 1000

  run, http://vqhq-prdcitrix1.vitaquest.int/Citrix/StoreWeb/
 return
 }
 
  LMS(){
  If WinActive("ahk_exe WFICA32.EXE"){
    send,{altDown}{tab}{altup}
    return
  }
  ifwinnotexist, ahk_exe WFICA32.EXE
  {
    run, http://vqhq-prdcitrix1.vitaquest.int/Citrix/StoreWeb/
      WinWait, ahk_exe firefox.exe,,2
        sleep 500
    ControlSend, Control, down, ahk_exe firefox.exe
    ControlSend, Control, down, ahk_exe firefox.exe
    ControlSend, Control, enter, ahk_exe firefox.exe
      sleep 1000
  }
  IfWinNotActive, ahk_exe WFICA32.EXE
    WinActivate, ahk_exe WFICA32.EXE

 return
 }
 Display(){
  run, ms-settings:display
 return
 }

 RemoteDesktop(){
 If WinActive("ahk_exe mstsc.exe")
  send,{altDown}{tab}{altup}
 ifwinnotexist, ahk_exe mstsc.exe
  run, mstsc.exe, C:\Windows\system32
  IfWinNotActive,ahk_exe mstsc.exe
  WinActivate, ahk_exe mstsc.exe
 return
 }

  workbook(){
 If WinActive("LMS Workbook.xlsb - Excel"){
  send,{altDown}{tab}{altup}
  return
 }
 ifwinnotexist, LMS Workbook.xlsb - Excel
  run, LMS Workbook.xlsb, C:\Users\mmignin\OneDrive - Vitaquest International\
 IfWinNotActive,LMS Workbook.xlsb - Excel
  WinActivate, LMS Workbook.xlsb - Excel
 return
 }
 VScode(){
 If WinActive("ahk_exe Code.exe"){
  send,{altDown}{tab}{altup}
  return
 }
 ifwinnotexist,ahk_exe Code.exe
 {
   run, Code.exe, C:\Program Files\Microsoft VS Code
  send,{altDown}{Ctrldown}{v}{CtrlUp}{altup}
  winactivate, ahk_exe Code.exe
  WinMove, ahk_exe Code.exe, ,2037, -1080, 1525, 1087,
 }
 IfWinNotActive,ahk_exe Code.exe
  WinActivate, ahk_exe Code.exe
 return
 }
 Notepad(){
 If WinActive("ahk_exe notepad.exe")
  send,{altDown}{tab}{altup}
 ifwinnotexist,ahk_exe notepad.exe
 {
  run, C:\Windows\system32\Notepad.exe
  winactivate, ahk_exe notepad.exe
  WinMove, ahk_exe notepad.exe, ,-292, -1200, 974, 584,
 }
 IfWinNotActive,ahk_exe notepad.exe
  WinActivate, ahk_exe notepad.exe
 return
 }
 OneNote(){
 If WinActive("ahk_exe ONENOTE.EXE"){
  send,{altDown}{tab}{altup}
  return
 }
 ifwinnotexist,ahk_exe ONENOTE.EXE
 {
  run, C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE
  winactivate, ahk_exe ONENOTE.EXE
 }
 IfWinNotActive,ahk_exe ONENOTE.EXE
  WinActivate, ahk_exe ONENOTE.EXE
 return
 }

; OpenApp.in_Notepad(){
;   click
;   WinGetClass class, % " ahk_id " WinExist("A")
;   for Window in ComObjCreate("Shell.Application").Windows
;    Selection := Window.Document.SelectedItems
;   for Items in Selection
;    Path_to_Selection := Items.path
;   Run C:\Windows\system32\Notepad.exe %Path_to_Selection%
;  }
StickyNotes(){
 IfWinActive, ahk_exe stickynot.exe
  send,{altDown}{tab}{altup}
 ifwinnotexist, ahk_exe stickynot.exe
  Run, Stickynot.exe, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\
  ; Run, stickynot.exe
 IfWinNotActive, ahk_exe stickynot.exe
  WinActivate, ahk_exe stickynot.exe
 return
 }
}