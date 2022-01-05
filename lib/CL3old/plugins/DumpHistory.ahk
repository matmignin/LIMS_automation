/*

Plugin            : DumpHistory()
Purpose           : Export history to plain text file
Version           : 1.0
CL3 version       : 1.32
*/

DumpHistory:
DumpHistoryOutput:=""
GUI, Search:Submit, Destroy
for k, v in history
	{
	 If CBProgram
	 	DumpHistoryOutput .= v.icon "`n"
	 If CBText
	 	DumpHistoryOutput .= v.text "`n`n-------------------------------------`n`n"
	 FileDelete, % DumpFileName
	 FileAppend, % DumpHistoryOutput, % DumpFileName
	}
Return

DumpHistory()	{
	GUI, Search:Destroy
	GUI, Search:+AlwaysOnTop
	GUI, Search:Add, Checkbox, vCBText checked, Export Text
	GUI, Search:Add, Checkbox, vCBProgram, Export Source (program)
	GUI, Search:Add, Edit, vDumpFileName w200, history%A_Now%.txt
	GUI, Search:Add, Button, gDumpHistory default, Export
	GUI, Search:Show,Center, Export CL3 Clipboard History
	}

