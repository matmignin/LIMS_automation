return


open_Clickup(){
  ifwinnotexist, ahk_exe ClickUp.exe
    WinActivate, ahk_exe ClickUp.exe
  else 
    run, ClickUp.exe, C:\Program Files\ClickUp\

  return
  }
  
open_Outlook(){
  ifwinnotexist, ahk_exe OUTLOOK.exe
    Run, OUTLOOK.exe, C:\Program Files\Microsoft Office\root\Office16\
  else 
	WinActivate, ahk_exe OUTLOOK.exe
  return
  }	
  
	open_Explorer(){
  ifwinnotexist, ahk_exe explorer.exe
    send, {LWinDown}{e}{lwinup}
  IfWinNotActive,ahk_exe explorer.exe
    WinActivate, ahk_exe explorer.exe
  IfWinActive, ahk_exe explorer.exe
    send, {altDown}{tab}{altup}
  return
  }	
	open_Firefox(){
  ifwinnotexist, ahk_exe firefox.exe 
    run, firefox.exe, "C:\Program Files\Mozilla Firefox\"
  else
    WinActivate, ahk_exe firefox.exe
  ; sleep 200    
  WinWait, ahk_exe firefox.exe,,2
  sleep 200
    ; ControlSend, Control ^l, ahk_exe firefox.exe
    send, {CtrlDown}{l}{Ctrlup}
  return
  }
  
	open_VPN(){
  ifwinnotexist, ahk_exe explorer.exe
    run, https://remote.vitaquest.com/cgi-bin/welcome
		  WinWait, ahk_exe firefox.exe,,2
			sleep 500
    ControlSend, Control, enter, ahk_exe firefox.exe
		sleep 1000
  
    run, http://vqhq-prdcitrix1.vitaquest.int/Citrix/StoreWeb/
  return
  }		
  open_LMS(){
  IfWinActive, ahk_exe WFICA32.EXE 
    send, {altDown}{tab}{altup}
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
  open_Display(){
    run, ms-settings:display
  return
  }	
  
  open_RemoteDesktop(){
  IfWinActive, ahk_exe mstsc.exe
    send, {altDown}{tab}{altup}
  ifwinnotexist, ahk_exe mstsc.exe
    run, mstsc.exe, C:\Windows\system32
    IfWinNotActive,ahk_exe mstsc.exe
    WinActivate, ahk_exe mstsc.exe
  return
  }
  
    open_workbook(){
  IfWinActive, LMS Workbook.xlsb - Excel
    send, {altDown}{tab}{altup}
  ifwinnotexist, LMS Workbook.xlsb - Excel
    run, LMS Workbook.xlsb, C:\Users\mmignin\OneDrive - Vitaquest International\
  IfWinNotActive,LMS Workbook.xlsb - Excel
    WinActivate, LMS Workbook.xlsb - Excel
  return
  }
  open_VScode(){
  IfWinActive, ahk_exe Code.exe
    send, {altDown}{tab}{altup}
  ifwinnotexist,ahk_exe Code.exel
    send, {altDown}{Ctrldown}{v}{CtrlUp}{altup}
    ; run, Visual Studio Code.lnk, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\" 
  IfWinNotActive,ahk_exe Code.exe
    WinActivate, ahk_exe Code.exe

  return
  }