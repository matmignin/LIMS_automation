Tooltip(msg, time:=3000, X:="",Y:="") {
	global
	tooltip, %msg%, %X%, %Y%,
	SetTimer, RemoveToolTip, -%time%
return

RemoveToolTip:
ToolTip
return
}

