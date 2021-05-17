return


open_Clickup(){
  ifwinnotexist, ahk_exe ClickUp.exe
    run, ClickUp.exe, "C:\Program Files\" 
  else 
    WinActivate, ahk_exe ClickUp.exe

  return
  }
  
	open_Explorer(){
  ifwinnotexist, ahk_exe explorer.exe
    send, {LWinDown}{e}{lwinup}
  else 
    WinActivate, ahk_exe explorer.exe

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
  
  open_RemoteDesktop(){
  ifwinnotexist, ahk_exe mstsc.exe
    run, mstsc.exe, "C:\Windows\system32\"
  else
    WinActivate, ahk_exe mstsc.exe
  return
  }
  
    open_workbook(){
  ifwinnotexist, LMS Workbook.xlsb - Excel
    run, LMS Workbook.xlsb, "C:\Users\mmignin\OneDrive - Vitaquest International\"
  else
    WinActivate, LMS Workbook.xlsb - Excel
  return
  }