


;------------------------------------------------------TEST 1------------------------------------------------------------



blockRepeat(time=200){
 SetTimer, BlockInput, -%time%
 return
}























return



AddCanceled(){
 winactivate, Edit test (Field Configuration: F, Micro) - \\Remote
 sendinput,{click 399, 219}{end}'(Canceled'){enter}
}


ToggleFilter_Test_1(){
 WinActivate, NuGenesis LMS - \\Remote
 click 489, 836, R
 sendinput,{down 2}{enter}
}

FilterSearch_Test(TestName:="", MethodName:=""){
 WinActivate, NuGenesis LMS - \\Remote
 click 1230, 648 ;click name Divider
 send, ^a%TestName%{enter}
 click 1067, 647 ; click method ID Divider
 send, ^a%MethodName%{enter}{tab 4}
}

return
