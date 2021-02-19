;______________________________________________________________________________________________
_________________________________________________________________________KEYBOARD_HOTKEYS: 
;_______________________________________________________________________________________________
F17::sendinput, {rctrl 2}
F18::F17
F18 & Right::sendinput, #{right}
F18 & Left::sendinput, #{Left}
F18 & UP::sendinput, #{UP}
F18 & Down::sendinput, #{Down}
F18::Send_batch()
F19::Send_ProductCode()

;~rshift::sendinput, {shift}
+F18::VarSet_Batch()
+F17::VarSet_ProductCode()
;F18::Send_Batch() ;right comm
;F17::Send_ProductCode() ;right option
+F12::reload
;\::sendinput, \  
media_prev::SaveRerun()
Media_Play_Pause::
f11::SaveRestart()
Media_Next::run, testing.ahk
+Volume_Up::SaveRestart()

F10::Exitapp





	