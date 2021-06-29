ToolTip(msg, time=1500, X:="",Y:="",W:="") {
	global
	tooltip, %msg%, %X%, %Y%,%W%
	SetTimer, RemoveToolTip%W%, -%time%
return
RemoveToolTip:
ToolTip
return
RemoveToolTip1:
ToolTip,,,,1
return
RemoveToolTip2:
ToolTip,,,,2
return
RemoveToolTip3:
ToolTip,,,,3
return
N=0
}

