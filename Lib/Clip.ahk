Clip() 
	{
		global
		PreClip:=ClipboardAll
		sleep 50
		Clipboard:=
		Send, ^c    
		clipwait, 0.25
		Clipboard := StrReplace(Clipboard, "`r`n")
		sleep 50
		ToolTip(Selection, 1000)
		Selection:=Clipboard
		clipwait, 0.25
		Clipboard:=Preclip
		clipwait, 0.25
		return %Selection%
	}