DetectHiddenWindows On
SetTitleMatchMode,2
;SetBatchLines, -1
Process, Priority, , High
WinClose VQ_Helper.ahk - AutoHotkey
Sleep 600
SettingsFile:="U:\VQ_Helper\Settings.ini"
; Read the version number from the text file
; FileReadLine, versionNumber, %VersionFile%, 1
FormatTime, The_Time,, h:mm:ss


; Update the version number in the text file
iniwrite, %The_Time%, %SettingsFile%, Config, CompileTime


; Display the new version number
; MsgBox, New Version: %newVersionNumber%

compileagain:
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
	WinClose VQ_Helper.ahk
clipboard:="<<QuIT>>"
sleep 500
	goto, compileagain
}


sleep 3000

try
{
   run "U:\VQ_Helper\VQ_Helper.exe"
}
catch e
{
	clipboard:="<<QuIT>>"
	;msgbox, , didnt work `n %e%
	sleep 4000
	Run "U:\VQ_Helper\VQ_Helper.exe"
}
return



