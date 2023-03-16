ClipboardSaved:=ClipboardAll
clipboard:=
sleep 100
Clipboard:="<<QuIT>>"
sleep 600





RunWait "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"
 /in "\\tsclient\RemoteVQ\RemoteVQ.ahk"
 /out "U:\RemoteVQ\RemoteVQ.exe"
 /icon "U:\RemoteVQ\icon.ico"
 /base "C:\Program Files\AutoHotkey\Compiler\AutoHotkeySC.bin"
 /compress 0

Clipboard:=ClipboardSaved
ToolTip, DONE!, Compile Complete,
sleep 500
;run, U:\RemoteVQ\RemoteVQ.exe
sleep 2000


