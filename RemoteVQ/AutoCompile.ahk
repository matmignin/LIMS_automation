Preclipboard:=ClipboardAll
clipboard:=
clipboard:="<<QuIT>>"
sleep 800
Run, C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe /in %A_ScriptFullPath% /out \\10.1.2.118\users\vitaquest\mmignin\RemoteVQ\RemoteVQ.exe
clipboard:=Preclipboard
tooltip, done
exitapp