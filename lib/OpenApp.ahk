
#Ifwinactive,
F1::
  if winexist("AutoHotkey Help")
    winactivate,
  else
  {
    if winactive("ahk_exe Code.exe") {
      send, ^c
     Run, AutoHotkey.chm, C:\Users\mmignin\Documents
    sleep 200
    send, {altdown}{s}{altup}
    sleep 100
    send, ^v{enter}
    }
    else
      Run, AutoHotkey.chm, C:\Users\mmignin\Documents
  }
  return
OpenApps:
  ;<!f::OpenApp.Firefox()
  ;<#f::OpenApp.Firefox()
  ;<#v::OpenApp.vsCode()
  ;!v::OpenApp.vsCode()
  ^F1::Varbar.reset()
  !v::run, C:\Users\mmignin\Documents\VQuest\Example Code\CodeQuickTester.ahk
  #^v::Run, C:\Users\mmignin\Documents\VQuest\
  #^+s::Run, C:\Users\mmignin\OneDrive - Vitaquest International\Screenshots
  #^F3::Run, C:\Users\mmignin\Desktop\Desktop Stuff\Label Copy\All Label Copy
  #^F2::Run, C:\Users\mmignin\Desktop\Desktop Stuff\Label Copy\
  #^F1::Run, C:\Users\mmignin\downloads\
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
winactivate, ahk_exe Code.exe
send, {F9}
sleep 100
send, %A_ThisMenuItem%
return

  #e::return ; Send,{Lwindown}{e}{lwinup}
  <#f::OpenApp.Firefox()

  <#v::OpenApp.vsCode()
  ; !+v::OpenApp.VPN()
  F20 & o::OpenApp.Outlook()
  #o::OpenApp.Outlook()
  #1::OpenApp.Display()
  +#1::OpenApp.Touchpadsettings()
  ; F20 & p::
  ; #p::OpenApp.YourPhone()
  f20 & n::
  ; #n::openApp.Notion()
  +#n::openApp.notepad()
  ; #w::OpenApp.Workbook()
  F20 & l::OpenApp.LMS()
#ifwinnotactive

return



class OpenApp{

Clickup(){
 ifwinnotexist, ahk_exe Clickup.exe
  winactivate, ahk_exe Clickup.exe
 else
  run, Clickup.exe, C:\Program Files\Clickup\

 return
 }


PhoneApp(){
 sendlevel 2
 ifwinnotexist, Your Phone
   Send, {shiftdown}{altdown}{F8}{altup}{shiftup}
 else
  winactivate, Your Phone
 sendlevel 0
 return
 }

Outlook(){
 ifwinnotexist, ahk_exe OUTLOOK.exe
 {
  Run, OUTLOOK.exe, C:\Program Files\Microsoft Office\root\Office16\
  winactivate, ahk_exe OUTLOOK.EXE
  winMove, ahk_exe OUTLOOK.EXE, ,1683, -1080, 1484, 1080
 }
 else
	winactivate, ahk_exe OUTLOOK.exe
 return
 }

	Explorer(){
 If winactive("ahk_exe explorer.exe"){
  Send,{altdown}{tab}{altup}
  return
 }
 ifwinnotexist, ahk_exe explorer.exe
  Send,{Lwindown}{e}{lwinup}
 IfwinNotactive,ahk_exe explorer.exe
  winactivate, ahk_exe explorer.exe
 return
 }
	Firefox(){
  if winactive("ahk_exe firefox.exe") {
  send, {ctrldown}{t}{ctrlup}
  return
 }
 ifwinnotexist, ahk_exe firefox.exe
 {
  run, firefox.exe, "C:\Program Files\Mozilla Firefox\"
  sleep 200
  winactivate
 }
 else
  winactivate, ahk_exe firefox.exe
 ; sleep 200
 winWait, ahk_exe firefox.exe,,2
 sleep 200
  ; ControlSend, Control ^l, ahk_exe firefox.exe
  Send,{ctrldown}{l}{ctrlup}
 return
 }

	VPN(){
 ifwinnotexist, ahk_exe explorer.exe
  run, https://remote.vitaquest.com/cgi-bin/welcome
		 winWait, ahk_exe firefox.exe,,2
			sleep 500
  ControlSend, Control, enter, ahk_exe firefox.exe
		sleep 1000

  run, http://vqhq-prdcitrix1.vitaquest.int/Citrix/StoreWeb/
 return
 }

  LMS(){
  If winactive("ahk_exe WFICA32.EXE"){
    Send,{altdown}{tab}{altup}
    return
  }
  ifwinnotexist, ahk_exe WFICA32.EXE
  {
    run, http://vqhq-prdcitrix1.vitaquest.int/Citrix/StoreWeb/
      winWait, ahk_exe firefox.exe,,2
        sleep 500
    ControlSend, Control, down, ahk_exe firefox.exe
    ControlSend, Control, down, ahk_exe firefox.exe
    ControlSend, Control, enter, ahk_exe firefox.exe
      sleep 1000
  }
  IfwinNotactive, ahk_exe WFICA32.EXE
    winactivate, ahk_exe WFICA32.EXE

 return
 }
 Display(){
  run, ms-settings:display
 return
 }
 Touchpadsettings(){
  run, ms-settings:devices-touchpad
  sleep 400
  send, {tab 4}
  sleep 100
  send, {space}
  sleep 400
  send, !{f4}
 return
 }

 RemoteDesktop(){
 If winactive("ahk_exe mstsc.exe")
  Send,{altdown}{tab}{altup}
 ifwinnotexist, ahk_exe mstsc.exe
  run, mstsc.exe, C:\windows\system32
  IfwinNotactive,ahk_exe mstsc.exe
  winactivate, ahk_exe mstsc.exe
 return
 }

  workbook(){
 If winactive("Mats LMS Workbook.xlsb - Excel"){
  Send,{altdown}{tab}{altup}
  return
 }
 ifwinnotexist, Mats LMS Workbook.xlsb - Excel
  run, Mats LMS Workbook.xlsb, C:\Users\mmignin\OneDrive - Vitaquest International\LMS Team\
 IfwinNotactive,Mats LMS Workbook.xlsb - Excel
  winactivate, Mats LMS Workbook.xlsb - Excel
 return
 }
 VScode(){
 if !WinExist("ahk_exe Code.exe")
 {
  ;run, Code.exe, "C:\Program Files\Microsoft VS Code"
  Send,{altdown}{ctrldown}{v}{ctrlup}{altup}
  winactivate, ahk_exe Code.exe
  winMove, ahk_exe Code.exe, ,2037, -1080, 1525, 1087,
 }
 IfwinNotactive,ahk_exe Code.exe
  winactivate, ahk_exe Code.exe
 return
 }
 Notepad(){
 If winactive("ahk_exe notepad.exe")
  Send,{altdown}{tab}{altup}
 ifwinnotexist,ahk_exe notepad.exe
 {
  run, C:\windows\system32\Notepad.exe
  winactivate, ahk_exe notepad.exe
  winMove, ahk_exe notepad.exe, ,17, 122, 505, 504
 }
 IfwinNotactive,ahk_exe notepad.exe
  winactivate, ahk_exe notepad.exe
 return
 }
 NotePad2(){
 If winactive("ahk_exe notepad.exe"){
  Send,{altdown}{tab}{altup}
  return
 }
 ifwinnotexist,ahk_exe notepad.exe
 {
   Run, C:\windows\system32\notepad.exe
  winactivate, ahk_exe notepad.exe
 }
 IfwinNotactive,ahk_exe notepad.exe
  winactivate, ahk_exe notepad.exe
 return
 }
 OneNote(){
 If winactive("ahk_exe ONENOTE.EXE"){
  Send,{altdown}{tab}{altup}
  return
 }
 ifwinnotexist,ahk_exe
 {
   Run, C:\windows\system32\notepad.exe
  ; run, C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE
  winactivate, ahk_exe ONENOTE.EXE
 }
 IfwinNotactive,ahk_exe ONENOTE.EXE
  winactivate, ahk_exe ONENOTE.EXE
 return
 }

; OpenApp.in_Notepad(){
;   click
;   winGetClass class, % " ahk_id " winExist("A")
;   for window in ComObjCreate("Shell.Application").windows
;    Selection := window.Document.SelectedItems
;   for Items in Selection
;    Path_to_Selection := Items.path
;   Run C:\windows\system32\Notepad.exe %Path_to_Selection%
;  }
StickyNotes(){
 Ifwinactive, ahk_exe stickynot.exe
  Send,{altdown}{tab}{altup}
 ifwinnotexist, ahk_exe stickynot.exe
  Run, Stickynot.exe, C:\ProgramData\Microsoft\windows\Start Menu\Programs\Accessories\
  ; Run, stickynot.exe
 IfwinNotactive, ahk_exe stickynot.exe
  winactivate, ahk_exe stickynot.exe
 return
 }
}