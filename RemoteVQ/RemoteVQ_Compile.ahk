Preclip:=ClipboardALL
clipboard:="<<QuIT>>"
sleep 300
Clipboard:=Preclip
RunWait "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"
 /in "X:\VQuest\RemoteVQ\RemoteVQ.ahk"
 /out "Y:\RemoteVQTransfer\RemoteVQ Transfer.exe"
 /icon "C:\Users\mmignin\Documents\Icons\RobotBig.ico"
 /base "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"
 /compress 0