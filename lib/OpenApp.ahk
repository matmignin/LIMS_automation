return
#IfWinActive,
OpenApps:
 !f::OpenApp.Firfefox()
 !v::OpenApp.vsCode()
 ; !c::OpenApp.Clickup()
 !e::send,{LWinDown}{e}{lwinup}
 !+v::OpenApp.VPN()
 !o::OpenApp.Outlook()
 !p::OpenApp.YourPhone()
 !d::OpenApp.Display()
 ; !n::run, notes.ahk, %A_ScriptDir%\lib
 f20 & n::
 !n::openApp.OneNote()
 +!n::openApp.stickyNotes()
 !w::OpenApp.Workbook()

 !l::OpenApp.LMS()



class OpenApp{

Clickup(){
 ifwinnotexist, ahk_exe ClickUp.exe
  WinActivate, ahk_exe ClickUp.exe
 else
  run, ClickUp.exe, C:\Program Files\ClickUp\

 return
 }


PhoneApp(){
 ifwinnotexist, Your Phone
  send, {lwindown}{s}{lwinup}y ;our{enter}
 else
  WinActivate, Your Phone
  ; run, YourPhone.exe, ‪C:\Program Files\WindowsApps

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
 ifwinnotexist, ahk_exe explorer.exe
  send,{LWinDown}{e}{lwinup}
 IfWinNotActive,ahk_exe explorer.exe
  WinActivate, ahk_exe explorer.exe
 IfWinActive, ahk_exe explorer.exe
  send,{altDown}{tab}{altup}
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
  IfWinActive, ahk_exe WFICA32.EXE
    send,{altDown}{tab}{altup}
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
 IfWinActive, ahk_exe mstsc.exe
  send,{altDown}{tab}{altup}
 ifwinnotexist, ahk_exe mstsc.exe
  run, mstsc.exe, C:\Windows\system32
  IfWinNotActive,ahk_exe mstsc.exe
  WinActivate, ahk_exe mstsc.exe
 return
 }

  workbook(){
 IfWinActive, LMS Workbook.xlsb - Excel
  send,{altDown}{tab}{altup}
 ifwinnotexist, LMS Workbook.xlsb - Excel
  run, LMS Workbook.xlsb, C:\Users\mmignin\OneDrive - Vitaquest International\
 IfWinNotActive,LMS Workbook.xlsb - Excel
  WinActivate, LMS Workbook.xlsb - Excel
 return
 }
 VScode(){
 IfWinActive, ahk_exe Code.exe
  send,{altDown}{tab}{altup}
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
 IfWinActive, ahk_exe notepad.exe
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
 IfWinActive, ahk_exe ONENOTE.EXE
  send,{altDown}{tab}{altup}
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