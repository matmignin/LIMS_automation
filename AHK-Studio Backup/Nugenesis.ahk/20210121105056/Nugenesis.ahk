#include Product_Tab.ahk 
#Include Spec_Tab.ahk
#include RotationsMenu.ahk
#include Samples_Tab.ahk



#ifwinactive, NuGenesis LMS - \\Remote
Wheelright::Sendinput, {Click}{click 74, 776}    			; click Enter Results
wheelleft::
ScrollLock::Click_ProductSpec_SearchBar(ProductCode)  	; rigth comm button
Rwin::Click_Sample_SearchBar(Batch)     	   	     ; right alt button
#ifwinactive, Result Entry - \\Remote
Wheelleft::ChangeTestResults()
Wheelright::ChangeTestResults("Toggle")
f14::Click("OK_ResultEntry")



#ifwinactive,


