#Persistent
#NoEnv
#SingleInstance,Force
setworkingdir, "C:\Users\mmignin\Documents\VQuest\"
#maxthreadsperhotkey, 1
Menu, Tray, Add, Edit, F12
Menu, Tray, Default, Edit
return
\::Keyhistory
F12::Edit
Capslock::exit
^r::
send, ^s
sleep 200
reload
return



F13::numlock


APpskey::ToolTip Press < or > to cycle through windows.
APpskey Up::ToolTip
~APpskey & left::Send !+{Esc}
~APpskey & right::Send !{Esc}


