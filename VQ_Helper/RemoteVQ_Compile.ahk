DetectHiddenWindows On
SetTitleMatchMode,2
WinClose VQ_Helper.ahk - AutoHotkey
Sleep 400

Try
{
RunWait "U:\VQ_Helper\RawFiles\AHK\Compiler\Ahk2Exe.exe"
 /in "U:\VQ_Helper\RawFiles\VQ_Helper.ahk"
 /out "U:\VQ_Helper\VQ_Helper.exe"
 /icon "U:\VQ_Helper\icon.ico"
 /base "U:\VQ_Helper\RawFiles\AHK\Compiler\Unicode 64-bit.bin"
 /compress 0
}
Catch e
{
	msgbox,, Compile didnt work `n %e%
	exit
}


sleep 1000

try
{
   Run "U:\VQ_Helper\VQ_Helper.exe"
}
catch e
{
	clipboard:="<<QuIT>>"
	msgbox, , didnt work `n %e%
	sleep 3000
	Run "U:\VQ_Helper\VQ_Helper.exe"
}
return