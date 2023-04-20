try 
{
RunWait "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"
 /in "\\tsclient\RemoteVQ\RemoteVQ.ahk"
 /out "U:\RemoteVQ\RemoteVQ.exe"
 /icon "U:\RemoteVQ\icon.ico"
 /base "C:\Program Files\AutoHotkey\Compiler\AutoHotkeySC.bin"
 /compress 0
 traytip, ,worked
;sleep 500
}
Catch e
{
   msgbox, Didnt Work `n `n %e%
}
;tooltip
;sleep 5000
;traytip,,
return