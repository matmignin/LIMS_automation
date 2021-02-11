#Persistent
SetTimer, Refresh, % (3*60*1000) ; Converting 5 mins x equivalent milliseconds
Return


Refresh:
MouseMove, 5,0
SLEEP 300
MouseMove, -5,0
Return