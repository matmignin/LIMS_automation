MouseSendProductCode() {
	  global
	      ProductCode := Trim((ProductCode, "`r`n"))
	  IfWinActive, Find and Replace, 
		send,!n%ProductCode%!i
	  ifwinactive, ahk_exe explorer.exe 
        {
		Send,^e^a
            sendinput,%ProductCode%
            send,{enter}
            return
        }
	  IfWinActive, Edit Product - \\Remote
		sendinput,%ProductCode%
        IfWinActive, NuGenesis LMS - \\Remote
        {
            click 532,76
            sendinput, {ctrl down}a{ctrl up}%ProductCode%
            sleep 200
            send, {enter}
            return
        }
	  else
		Sendinput,%ProductCode%
	   sleep 800
	   return
	  }
MouseSendBatchCode() {
	  global
	  Sendinput,%BatchCode%
	  return 
	  }