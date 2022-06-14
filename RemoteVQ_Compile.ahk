	ClipboardSaved:=ClipboardAll
    clipboard:=
	sleep 100
	Clipboard:="<<QuIT>>"
	sleep 500
	; Clipboard:="<<QuIT>>"
	; clipboard:=ClipboardSaved
	; sleep 800

RunWait "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"
 /in "RemoteVQ\RemoteVQ.ahk"
 /out "\\10.1.2.118\users\vitaquest\mmignin\RemoteVQ\RemoteVQ.exe"
 /icon "C:\Users\mmignin\Documents\Icons\RobotBig.ico"
 /base "C:\Program Files\AutoHotkey\Compiler\Unicode 64-bit.bin"
 /compress 0
ToolTip, DONE!, Compile Complete
sleep 3000


