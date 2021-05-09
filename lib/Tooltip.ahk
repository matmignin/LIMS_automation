Tooltip(msg, time:=1000, X:="",Y:="") {
	global
	tooltip, %msg%, %X%, %Y%,
	SetTimer, RemoveToolTip, %time%
return

RemoveToolTip:
ToolTip
return
}

