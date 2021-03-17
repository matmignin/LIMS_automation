






Test(n=0)
{
	Global
	if (n=0) 
	{	
		listvars
	}
	else if (n=1)
	{
		DebugWindow("Product: " Varbar_get("product"))
	}
	else if (n=2)
	{
		DebugWindow("Batch: " Varbar_get("Batch"))
	}
	else if (n=3)
	{
		debugwindow("lot: " varbar_get("lot"))
	}
	else
	{
		sendinput, %n%
	}
	return
}


debug(text,var)
{
global
Text:=Text ": "
Debugwindow(Text var, 0,1,10,0,0)
}

;DebugWindow(Text,Clear:=0,LineBreak:=0,Sleep:=0,AutoHide:=0,MsgBox:=0){
	;x:=ComObjActive("{DBD5A90A-A85C-11E4-B0C7-43449580656B}"),x.DebugWindow(Text,Clear,LineBreak,Sleep,AutoHide,MsgBox)
;}