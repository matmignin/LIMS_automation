#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#Persistent
#SingleInstance,Force
setworkingdir, "C:\Users\mmignin\Documents\VQuest\"
#maxthreadsperhotkey, 1


Global clip := [], max := 20, choices, clipNum
gui, default
gui +alwaysontop
Gui, Font, s9
Gui, +Delimiter`n
Gui, Add, combobox, simple w200 r10 AltSubmit vclipNum
Gui, Add, Button, xm ym Hidden Default gDROPDOWN, OK
OnClipboardChange("clipChanged"), 
;OnMessage(WM_LBUTTONUP := 0x0202, "WM_LBUTTONUP")



Gui, Show,noactivate, Clipboard

return
GuiEscape:
GuiClose:
msgbox % "Choices `n" Choices "`nClipNum:`n" clipnum "`n ConnectedProduct:`n" ConnectedProduct
Gui, Hide
Return

clipChanged(type) {
 If (type != 1)
  Return
 ;SoundBeep, 2500
 If clip.Count() = max ;max list count
  clip.RemoveAt(max), choices := RegExReplace(choices, ".+\K\|.*")





RegexProduct:="i)(?<=\w{3})?[abdefghijkl]\d{3}"
RegexBatch:="i)(?<!Ct#)\d{3}-\d{4}\b"
RegexLot:="i)(\b\d{4}\w\d\w?|\bBulk\b|G\d{7}\w?\b|VC\d{6}[ABCDEFGH]?)"
RegexCoated:="i)(coated: |ct#\s|Ct#|ct\s|coated\s)(?P<Coated>\d{3}-\d{4})"
      Haystack:=Clipboard
      RegExMatch(HayStack, regexProduct,cProduct)
      RegExMatch(HayStack, RegexBatch, cBatch)
      RegExMatch(HayStack, RegexLot, clot)
      RegExMatch(HayStack, RegexCoated, c)
        if cProduct {
            ConnectedProduct:=cProduct
            if cBatch
              ConnectedProduct.= a_space cBatch
            if cLot
              ConnectedProduct.= a_space cLot
            if cCoated
              ConnectedProduct.= a_space "Ct#" cCoated
}
         ConnectedProduct:= cProduct a_space cBatch a_space clot a_space cCoated
 if Trim(ConnectedProduct)       
 clip.InsertAt(1, ConnectedProduct) ;insert at spot 1 of array
 GuiControl,, clipNum, % choices := "`n" ConnectedProduct "`n" Trim(StrReplace(choices, "`n`n", "`n"), "`n") ;appennds the "Choices" dorpdown
} 

DROPDOWN(wParam := "", lParam := "") {  ; User clicked on the GUI
 Gui, Submit, nohide
;clipboard:=clipnum
 ;SendInput % "{Text}" clip[clipNum]
}



Mbutton::msgbox, %Example%

Example:=
(
Pure Trim Passion Fruit Punch Boost Tea 240g	K135	106-0921	Awareness Corcoparion	0109J1
Pure Trim Passion Fruit Punch Boost Tea 240g	K135	106-0922	Awareness Corcoparion	0110J1
Chocolate M/R 884.1g CA	J641	109-0927	Bariatric Fusion	0077L1A
Chocolate M/R 884.1g	J641	109-0928	Bariatric Fusion	0077L1B
Chocolate M/R 884.1g	J641	109-0928	Bariatric Fusion	0088L1
Momma 18 Probiotic Strains 30's	K495	112-0375	EU Natural	0437L1
Momma 18 Probiotic Strains 30's	K495	112-0375	EU Natural	0488L1
Vanilla Whey 732g Bag	K820	110-0465	Kion llc	0108L1
Cocoa Chocolate Whey 810g Bag	K821	111-0057	Kion llc	0061K1
Cocoa Chocolate Whey 810g Bag	K821	111-0058	Kion llc	0061K1A
Cocoa Chocolate Whey 810g Bag	K821	111-0059	Kion llc	0061K1B
Nutriclean Fiber 341.6g	B338	108-1182	Market America	0116L1
Symbiotic V7  10's  Blister 	K286	112-0508	Netbus Inc	0425L1
SF Keto Vanilla 347g fuji	J236	111-0500	Slimfast	G3622021
SF Keto Vanilla 347g fuji	J236	111-0501	Slimfast	G3622021A
SF Keto Vanilla 347g fuji	J236	111-0502	Slimfast	G3632021
Wellber Men's 90's	K785	110-0352	Wellber Inc	0029K1
Trimstix Fruit Punch 5.5g Stick	I138	110-1057	Xyngular Corporation	0112L1E
Zipfizz Grape 11g Vial	J904	111-0663	Zipfizz Corporation	0605K1
Zipfizz Lemon Lime 11g Vial	J913	110-0938	Zipfizz Corporation	0143K1
Zipfizz Fruit Punch 11g Vial	J905	110-0970	Zipfizz Corporation	0374K1
Immuno 150 Blend 1:30 PM	K247	111-0505	Liquid Assets	Bulk
)






RemoveTextDuplicates(vText){
vOutput := ""

; vText:=Trim(StrReplace(vText, "`t", ""))
VarSetCapacity(vOutput, StrLen(vText)*2*2)
oArray := {}
StrReplace(vText, "`n",, vCount)
oArray.SetCapacity(vCount+1)
;Sort, vText, D, ;add this line to sort the list
Loop Parse, vText, % "`n"
{
	if !oArray.HasKey("z" A_LoopField)
		oArray["z" A_LoopField] := 1, vOutput .= A_LoopField "`r`n"
}
; MsgBox, % vOutput

oArray := ""
return vOutput
}

