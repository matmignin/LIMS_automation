#include C:\Windows\ShellNew\TemplateIncludeFile.ahk
    RegexProduct:="i)[abcdefghijkl]\d{3}"
    RegexBatch:=  "i)(?<!Ct#)\d{3}-\d{4}\b"
    RegexLot:=    "i)\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?|V[A-Z]\d{5}[A-Z]\d?|\d{5}\[A-Z]{3}\d"
    RegexCoated:= "i)(coated: |ct#?|ct\s?|coated\s?)(?P<oated>\d{3}-\d{4})"

iniread, CodeString, D:\VQuest\CodeString.ini, SavedVariables, CodeString
regexmatch(CodeString,RegexProduct,Product)
regexmatch(CodeString,RegexBatch,Batch)
regexmatch(CodeString,RegexCoated,C)


        winactivate, Edit Formulation - \\Remote,
      Send, %product%
       ; Send, {Tab 23} ;{click 268, 578}
        sleep 200
      ; if (ServingSize=1 ? "(" ServingSize ")" : "Two (" ServingSize ")" ) ;|| ServingSize=2 || ServingSize=3 || ServingSize=4)
        ;  send, Each %ServingType% {space} contains {ctrl down}{left}{ctrl up}{left}
				; if ShapeAndSize
					send, {tab}^a%Batch%{shiftdown}{tab}{shiftup}
exitapp