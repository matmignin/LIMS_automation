DetectHiddenWindows On
SetTitleMatchMode,2
WinClose VQ_Helper.ahk - AutoHotkey
Sleep 400
VersionFile:="U:\VQ_Helper\RawFiles\version.txt"
SettingsFile:="U:\VQ_Helper\Settings.ini"
; Read the version number from the text file
; FileReadLine, versionNumber, %VersionFile%, 1
FormatTime, The_Time,, h:mm:ss
; Display the current version number
; MsgBox, Current Version: %versionNumber%
iniRead, Version, %SettingsFile%, Config, Version
; Increment the version number
StringSplit, versionParts, version, .
majorVersion := versionParts[1]
minorVersion := versionParts[2]
minorVersion:=minorVersion + 1
newVersionNumber := majorVersion "." minorVersion

; Update the version number in the text file
FileDelete, %VersionFile%
FileAppend, %The_Time%, %VersionFile%
iniwrite, %The_Time%, %SettingsFile%, Config, CompileTime
iniwrite, %newVersionNumber%, %SettingsFile%, Config, Version

; Display the new version number
; MsgBox, New Version: %newVersionNumber%


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


sleep 3000

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



