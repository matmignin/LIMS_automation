try
{
RunWait "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"
/in "U:\VQ_Helper\RawFiles\VQ_Helper\VQ_Helper.ahk"
 /out "U:\VQ_Helper\VQ_Helper.exe"
 /icon "U:\VQ_Helper\icon.ico"
 /base "C:\Program Files\AutoHotkey\Compiler\AutoHotkeySC.bin"
 /compress 0
 traytip, ,worked
;sleep 500
}
Catch e
{
   msgbox, Didnt Work `n `n %e%
   clipboard:="<<QuIT>>"
}
;tooltip
;sleep 5000
;traytip,,
return

