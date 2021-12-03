
#IfWinActive,
F1::
  if winexist("AutoHotkey Help")
    winactivate, 
  else
    Run, AutoHotkey.chm, C:\Users\mmignin\Documents
  sleep 200
  send, {altdown}{s}{altup}
  return
OpenApps:
  ; <!f::OpenApp.Firefox()
  <#f::OpenApp.Firefox()
  ; !v::OpenApp.vsCode()
  <#v::OpenApp.vsCode()
  ^F1::Varbar.reset()
  #^v::Run, C:\Users\mmignin\Documents\VQuest\
  #^+s::Run, C:\Users\mmignin\OneDrive - Vitaquest International\Screenshots
  #^F3::Run, C:\Users\mmignin\Desktop\Desktop Stuff\Label Copy\All Label Copy
  #^F2::Run, C:\Users\mmignin\Desktop\Desktop Stuff\Label Copy\
  #^F1::Run, C:\Users\mmignin\Downloads\
  +#^F1::Run, C:\Users\mmignin\Desktop\
  #^F4::Run, \\10.1.2.118\users\vitaquest\mmignin
  #^F5::Run, \\10.1.2.118\share\QC LAB\SAMPLE LOG 2021.xlsx
  ; #^F5::Run, C:\Users\mmignin\OneDrive - Vitaquest International
  #^F6::Run, C:\Users\mmignin\OneDrive - Vitaquest International\CofA Team
  #^F7::Run, C:\Users\mmignin\OneDrive - Vitaquest International\LMS Team
  #^F8::Run, \\10.1.2.118\share\QA\Final Labels (Temp)
  #^F9::Run, \\10.1.2.118\Final_C_O_A
  #^F10::Run, \\10.1.2.118\share\QC LAB\QC_Appearance Test.xlsx
  #^F11::Run, \\10.1.2.118\share\QA FINSHED GOODS\SAMPLES TO QC\SAMPLE TO QC 2021.xlsx
  #^F12::Run, \\10.1.2.118\share\QA FINSHED GOODS\SAMPLES TO QC\SAMPLE TO QC 2021 (2) .xlsx
+#^F12::run, \\10.1.2.118\share\QC LAB\Master Rotation WB 2014 (Start from 10-14-2014).xlsx
+#^F11::run, C:\Users\mmignin\OneDrive - Vitaquest International\My JasperSoft Reports
+#^F10::run, \\10.1.2.118\users\vitaquest\mmignin\COA EXAMPLES
+#^F9::run, C:\Users\mmignin\Documents\VQuest\Data\%A_ThisMenuItem%
+#^F8::run, C:\Users\mmignin\Documents\VQuest\Settings.ini
+#^F7::
WinActivate, ahk_exe Code.exe
send, {F9}
sleep 100 
send, %A_ThisMenuItem%
return

  #e::Send,{LWinDown}{e}{lwinup}
  ; !+v::OpenApp.VPN()
  F20 & o::OpenApp.Outlook()
  #o::OpenApp.Outlook()
  #d::OpenApp.Display()
  !d::OpenApp.Display()
  ; F20 & p::
  ; #p::OpenApp.YourPhone()
  f20 & n::
  #n::openApp.notepad()
  +#n::openApp.Notion()
  #w::OpenApp.Workbook()
  F20 & l::
  #l::OpenApp.LMS()
#ifwinnotactive

return



class OpenApp{

Clickup(){
 ifwinnotexist, ahk_exe ClickUp.exe
  WinActivate, ahk_exe ClickUp.exe
 else
  run, ClickUp.exe, C:\Program Files\ClickUp\

 return
 }


PhoneApp(){
 sendlevel 2
 ifwinnotexist, Your Phone
   Send, {shiftdown}{altdown}{F8}{altup}{shiftup}
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
  Send,{altDown}{tab}{altup}
  return
 }
 ifwinnotexist, ahk_exe explorer.exe
  Send,{LWinDown}{e}{lwinup}
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
  Send,{CtrlDown}{l}{Ctrlup}
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
    Send,{altDown}{tab}{altup}
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
  Send,{altDown}{tab}{altup}
 ifwinnotexist, ahk_exe mstsc.exe
  run, mstsc.exe, C:\Windows\system32
  IfWinNotActive,ahk_exe mstsc.exe
  WinActivate, ahk_exe mstsc.exe
 return
 }

  workbook(){
 If WinActive("Mats LMS Workbook.xlsb - Excel"){
  Send,{altDown}{tab}{altup}
  return
 }
 ifwinnotexist, Mats LMS Workbook.xlsb - Excel
  run, Mats LMS Workbook.xlsb, C:\Users\mmignin\OneDrive - Vitaquest International\LMS Team\
 IfWinNotActive,Mats LMS Workbook.xlsb - Excel
  WinActivate, Mats LMS Workbook.xlsb - Excel
 return
 }
 VScode(){
 If WinActive("ahk_exe Code.exe"){
  Send,{altDown}{tab}{altup}
  return
 }
 ifwinnotexist,ahk_exe Code.exe
 {
   run, Code.exe, C:\Program Files\Microsoft VS Code
  Send,{altDown}{Ctrldown}{v}{CtrlUp}{altup}
  winactivate, ahk_exe Code.exe
  WinMove, ahk_exe Code.exe, ,2037, -1080, 1525, 1087,
 }
 IfWinNotActive,ahk_exe Code.exe
  WinActivate, ahk_exe Code.exe
 return
 }
 Notepad(){
 If WinActive("ahk_exe notepad.exe")
  Send,{altDown}{tab}{altup}
 ifwinnotexist,ahk_exe notepad.exe
 {
  run, C:\Windows\system32\Notepad.exe
  winactivate, ahk_exe notepad.exe
  WinMove, ahk_exe notepad.exe, ,17, 122, 505, 504
 }
 IfWinNotActive,ahk_exe notepad.exe
  WinActivate, ahk_exe notepad.exe
 return
 }
 NotePad2(){
 If WinActive("ahk_exe notepad.exe"){
  Send,{altDown}{tab}{altup}
  return
 }
 ifwinnotexist,ahk_exe notepad.exe
 {
   Run, C:\Windows\system32\notepad.exe
  winactivate, ahk_exe notepad.exe
 }
 IfWinNotActive,ahk_exe notepad.exe
  WinActivate, ahk_exe notepad.exe
 return
 }
 OneNote(){
 If WinActive("ahk_exe ONENOTE.EXE"){
  Send,{altDown}{tab}{altup}
  return
 }
 ifwinnotexist,ahk_exe 
 {
   Run, C:\Windows\system32\notepad.exe
  ; run, C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE
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
  Send,{altDown}{tab}{altup}
 ifwinnotexist, ahk_exe stickynot.exe
  Run, Stickynot.exe, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\
  ; Run, stickynot.exe
 IfWinNotActive, ahk_exe stickynot.exe
  WinActivate, ahk_exe stickynot.exe
 return
 }
}