;[updated: 2019-11-12]

;==================================================

;BASICS (CREATE/DELETE OBJECTS, GET/SET A KEY'S VALUE)
;INI TO ARRAY
;INI TO ARRAY (HANDY TRICK)
;OBJECT() V. ARRAY() (AHK V1)
;KEY NAMES (NUMERIC V. STRING)
;FUNCTIONALITY OF OBJECT()
;REFER TO KEYS
;LOOPING THROUGH AN OBJECT'S KEYS AND VALUES
;FOR LOOP EXAMPLES
;A KEY CAN HAVE A VALUE OR CHILD KEYS, BUT NOT BOTH
;ARRAY STARTING AT 0/1/OTHER (AHK V1)
;ARRAY STARTING AT 0 (AHK V1/V2)
;PUSH KEYS / ASSIGN MULTIPLE KEYS
;KEY NAMES THAT CLASH WITH METHOD NAMES
;FREQUENCY COUNT (CASE INSENSITIVE) (SORT)
;FREQUENCY COUNT (CASE INSENSITIVE) (MAINTAIN ORDER)
;FREQUENCY COUNT (CASE SENSITIVE) (MAINTAIN ORDER/SORT)
;REMOVE DUPLICATES (CASE INSENSITIVE) (MAINTAIN ORDER/SORT)
;REMOVE DUPLICATES (CASE SENSITIVE) (MAINTAIN ORDER/SORT)

;==================================================

;BASICS (CREATE/DELETE OBJECTS, GET/SET A KEY'S VALUE)

;note 'array' is used to mean both linear array
;and associative array in this tutorial

;create an array/object (all 5 lines are equivalent)
obj := []
obj := Array()
obj := {}
obj := Object()
obj := StrSplit("")

;note in AHK v2:
;[]/Array/StrSplit will create an array
;{}/Object (and/or a replacement for Object) will create an object(/map?)

;create an array/object (all 5 lines are equivalent)
obj := ["value1", "value2", "value3"]
obj := Array("value1", "value2", "value3")
obj := {1:"value1", 2:"value2", 3:"value3"}
obj := Object(1, "value1", 2, "value2", 3, "value3")
obj := StrSplit("value1,value2,value3", ",")

;4 further examples equivalent to the 5 above:
objtemp := StrSplit("1,value1,2,value2,3,value3", ",")
obj := Object(objtemp*)

objtemp := StrSplit("1=value1,2=value2,3=value3", ["=", ","])
obj := Object(objtemp*)

obj := Object(StrSplit("1,value1,2,value2,3,value3", ",")*)

obj := Object(StrSplit("1=value1,2=value2,3=value3", ["=", ","])*)

;refer to a key
MsgBox, % obj.1
MsgBox, % obj[1] ;same as above
Loop 3
	MsgBox, % obj[A_Index]

;delete an object
obj := ""

;list keys and values
vOutput := ""
for vKey, vValue in oArray
	vOutput .= vKey " " vValue "`r`n"
MsgBox, % vOutput

;==================================================

;INI TO ARRAY

;ini to array:
vText := "
(
a=1
b=2
c=3
)"
oArray := {}
Loop Parse, vText, % "`n", % "`r"
{
	oTemp := StrSplit(A_LoopField, "=")
	oArray[oTemp.1] := oTemp.2
}

MsgBox, % oArray.c

MsgBox, % oArray["c"]

vList := "a,b,c"
vOutput := ""
Loop Parse, vList, % ","
	vOutput .= A_LoopField " " oArray[A_LoopField] "`r`n"
MsgBox, % vOutput

vOutput := ""
for vKey, vValue in oArray
	vOutput .= vKey " " vValue "`r`n"
MsgBox, % vOutput

;==================================================

;INI TO ARRAY (HANDY TRICK)

;ini to array:
vText := "
(
a=1
b=2
c=3
)"
oArray := Object(StrSplit(vText, ["=", "`n"])*)

vOutput := ""
for vKey, vValue in oArray
	vOutput .= vKey " " vValue "`r`n"
MsgBox, % vOutput

;==============================

;two columns to array:
vText := "
(
a	1
b	2
c	3
)"
oArray := Object(StrSplit(vText, ["`t", "`n"])*)

vOutput := ""
for vKey, vValue in oArray
	vOutput .= vKey " " vValue "`r`n"
MsgBox, % vOutput

;==============================

;note the * is for use with variadic functions:
;the following 4 lines are equivalent:
oArray := Object("a", "A", "b", "B", "c", "C")
oArray := Object(["a", "A", "b", "B", "c", "C"]*)
oTemp := ["a", "A", "b", "B", "c", "C"], oArray := Object(oTemp*)
oTemp := StrSplit("a,A,b,B,c,C", ","), oArray := Object(oTemp*)

;==================================================

;OBJECT() V. ARRAY() (AHK V1)

;Differentiating Between Array and Object - Ask for Help - AutoHotkey Community
;https://autohotkey.com/board/topic/95303-differentiating-between-array-and-object/

;Objects and arrays are exactly the same thing in AutoHotkey, there is no difference. [a, b, c] is just syntax sugar for {1: a, 2: b, 3: c}.

;==================================================

;KEY NAMES (NUMERIC V. STRING)

;note: currently in AHK v2 (this may change):
;obj["1"] is equivalent to obj[1]
;and you cannot create a string key called '1'
;the rest of the information in this section is mostly AHK v1-specific

;get key's value - where key name looks numeric
obj := {}
obj[1] := "value1" ;key where '1' is numeric
obj["1"] := "value2" ;key where '1' is string
MsgBox, % obj[1] " " obj["1"] ;value1 value2
MsgBox, % obj.1 ;value1

obj := {}
obj["1"] := "value2"
MsgBox, % obj.1 ;(blank)

;get key's value - where key name doesn't look numeric
obj := {}
var := "mykey"
obj[var] := "value1"
MsgBox, % obj[var] ;value1
MsgBox, % obj.mykey ;value1
MsgBox, % obj["mykey"] ;value1

obj := {}
obj["a"] := "value1"
MsgBox, % obj.a ;value1
MsgBox, % obj["a"] ;value1

;define objects - where key name looks numeric
obj := {1:"value1", 2:"value2", 3:"value3"}
MsgBox, % obj.1 ;value1
obj := {"1":"value1", "2":"value2", "3":"value3"}
MsgBox, % obj.1 ;(blank)

obj := Object(1, "value1", 2, "value2", 3, "value3")
MsgBox, % obj.1 ;value1
obj := Object("1", "value1", "2", "value2", "3", "value3")
MsgBox, % obj.1 ;(blank)

obj := {0xF:"value15"}
MsgBox, % obj.0xF ;value15
MsgBox, % obj.0xf ;value15
MsgBox, % obj.15 ;value15

obj := {15:"value15"}
MsgBox, % obj.0xF ;value15
MsgBox, % obj.0xf ;value15
MsgBox, % obj.15 ;value15

;define objects - where key name doesn't look numeric
obj := {a:"value1", b:"value2", c:"value3"}
MsgBox, % obj.a ;value1
obj := {"a":"value1", "b":"value2", "c":"value3"}
MsgBox, % obj.a ;value1

var := "mykey"
obj := Object(var, "value1")
MsgBox, % obj.mykey ;value1
obj := Object("a", "value1", "b", "value2", "c", "value3")
MsgBox, % obj.a ;value1

;==================================================

;FUNCTIONALITY OF OBJECT()

;0 parameters: create an empty array
obj := Object()

;2n parameters (where n is a positive integer): create an array with keys
obj := Object("key1", "value1", "key2", "value2", "key3", "value3")

;1 parameter: get a pointer to the object (AHK v1 only)
address := Object(obj) ;AHK v1
ObjAddRef(address := &obj) ;AHK v1/v2

;1 parameter: get the object in a usable form (may be removed in AHK v2)
obj := Object(address)

;==================================================

;REFER TO KEYS

obj1 := {}
obj2 := {}
obj1.a := "A" ;this works
obj2["a"] := "A" ;this works
MsgBox, % obj1.a ;A
MsgBox, % obj2.a ;A
obj1.b.c := "BC" ;this does not work
obj2["b", "c"] := "BC" ;this works
MsgBox, % obj1.b.c ;(blank)
MsgBox, % obj2.b.c ;BC
obj1 := obj2 := ""

obj := {}
obj["a", "b", "c", "d", "e"] := "ABCDE"
MsgBox, % obj.a.b.c.d.e ;ABCDE
MsgBox, % obj.a.b["c"].d.e ;ABCDE
MsgBox, % obj["a"].b["c"].d["e"] ;ABCDE
MsgBox, % obj["a", "b"].c["d", "e"] ;ABCDE

var := "c"
MsgBox, % obj.a.b[var].d.e ;ABCDE

obj := {}
obj["a", "b", "c", "d", "e"] := "ABCDE"
MsgBox, % obj.a.b.c.d.e ;ABCDE
MsgBox, % obj.a.b["c"].d.e ;ABCDE
MsgBox, % obj["a", "b"].c["d", "e"] ;ABCDE
MsgBox, % obj["a"].b["c"].d["e"] ;ABCDE
MsgBox, % obj.a["b"].c["d"].e ;ABCDE

obj := {}
obj["a", "b", "c", "d", "e"] := "ABCDE"
obj2 := ["a", "b", "c", "d", "e"]
obj3 := ["a", "b", "c", "d"]
obj4 := ["b", "c", "d", "e"]
obj5 := ["b", "c", "d"]
MsgBox, % obj[obj2*] ;ABCDE
MsgBox, % obj[obj3*, "e"] ;(blank)
MsgBox, % obj[obj3*]["e"] ;ABCDE
MsgBox, % obj["a", obj4*] ;ABCDE
MsgBox, % obj["a", obj5*, "e"] ;(blank)
MsgBox, % obj["a", obj5*]["e"] ;ABCDE

;Functions
;https://autohotkey.com/docs/Functions.htm#VariadicCall
;Only the right-most parameter can be expanded this way. For example, Func(x, y*) is supported but Func(x*, y) is not.

;==================================================

;LOOPING THROUGH AN OBJECT'S KEYS AND VALUES

oArray := {a:"A", b:"B", c:"C"}

;generally this is how I would loop through an object:
for vKey, vValue in oArray
	vOutput .= vKey " " vValue "`r`n"

;if values are not needed:
for vKey in oArray
	vOutput .= vKey "`r`n"

;if keys are not needed (where '_' is a variable):
for _, vValue in oArray
	vOutput .= vValue "`r`n"

;I would not do this (where 'each' is a variable):
for each, vValue in oArray
	vOutput .= vValue "`r`n"

MsgBox, % vOutput

;if the object has numeric keys only, you could use the word
;'index' instead of 'key', but I'd stick with 'key' always

vOutput := ""
oArray := ["A", "B", "C"]
;oArray := {1:"A", 2:"B", 3:"C"} ;equivalent
for vIndex, vValue in oArray
	vOutput .= vIndex " " vValue "`r`n"
MsgBox, % vOutput
oArray := ""

;==================================================

;FOR LOOP EXAMPLES

;for loop examples (loop through an array's key-value pairs)

;list keys and values: linear array
oArray := ["a", "b", "c"]
vOutput := ""
for vKey, vValue in oArray
	vOutput .= vKey " " vValue "`r`n"
MsgBox, % vOutput

;list keys: linear array
oArray := ["a", "b", "c"]
vOutput := ""
for vKey in oArray
	vOutput .= vKey "`r`n"
MsgBox, % vOutput

;list keys and values: associative array
oArray := {a:"A", b:"B", c:"C"}
vOutput := ""
for vKey, vValue in oArray
	vOutput .= vKey " " vValue "`r`n"
MsgBox, % vOutput

;list keys and values: linear array (via StrSplit)
oArray := StrSplit("abc,def,ghi", ",")
vOutput := ""
for vKey, vValue in oArray
	vOutput .= vKey " " vValue "`r`n"
MsgBox, % vOutput

;list keys and values: linear array (directly)
vOutput := ""
for vKey, vValue in ["a", "b", "c"]
	vOutput .= vKey " " vValue "`r`n"
MsgBox, % vOutput

;list keys and values: associative array (directly)
vOutput := ""
for vKey, vValue in {a:"A", b:"B", c:"C"}
	vOutput .= vKey " " vValue "`r`n"
MsgBox, % vOutput

;list keys and values: linear array (via StrSplit) (directly)
vOutput := ""
for vKey, vValue in StrSplit("abc,def,ghi", ",")
	vOutput .= vKey " " vValue "`r`n"
MsgBox, % vOutput

;==================================================

;A KEY CAN HAVE A VALUE OR CHILD KEYS, BUT NOT BOTH
;an object's key can have a value or it can have child keys but not both

obj := {}
obj["a"] := "A"
MsgBox, % obj.a
obj["a", "b"] := "AB"
MsgBox, % obj.a.b ;(blank) ;obj.a is a value so cannot have subkeys
obj["a"] := {} ;if we make obj.a an object, it can now be given child keys
obj["a", "b"] := "AB"
MsgBox, % obj.a.b ;AB

obj := {}
obj["a", "b", "c"] := "ABC"
MsgBox, % obj.a.b.c ;ABC
obj["a", "b", "c", "d"] := "ABCD"
MsgBox, % obj.a.b.c.d ;(blank)
obj.a.b.Delete("c")
obj["a", "b", "c", "d"] := "ABCD"
MsgBox, % obj.a.b.c.d ;ABCD

;==================================================

;ARRAY STARTING AT 0/1/OTHER (AHK V1)
;shift a linear array to start at a specific index

;array starting at 1
oArray := ["A", "B", "C"]

;array starting at 0
oArray := []
oArray.InsertAt(0, "A", "B", "C")

;array starting at 0 (one-liner)
(oArray := []).InsertAt(0, "A", "B", "C")

;array starting at 0 (alternative) (one-liner)
(oArray := ["A", "B", "C"]).RemoveAt(0)

;array starting at 11 (one-liner)
(oArray := []).InsertAt(11, "K", "L", "M")

;==================================================

;ARRAY STARTING AT 0 (AHK V1/V2)

oArray := ComObjArray(VT_VARIANT:=12, 3)
for vKey, vValue in StrSplit("zero,one,two", ",")
		oArray[A_Index-1] := vValue
MsgBox, % oArray[0]
MsgBox, % oArray[1]
MsgBox, % oArray[2]

;==================================================

;PUSH KEYS / ASSIGN MULTIPLE KEYS

;APPEND KEYS TO A LINEAR ARRAY

;this will create keys 1, 2, 3
oArray := ["a", "b", "c"]

;we can add key 4 like so:
oArray.Push("d")

;or instead, we can add keys 4, 5, 6 like so:
oArray.Push("d", "e", "f")

;alternatively:

;we can assign key 4 like so:
oArray.4 := "d"

;or we can add(/overwrite) keys 4, 5, 6 like so:
for vKey, vValue in {4:"d", 5:"e", 6:"f"}
	oArray[vKey] := vValue

;to list the keys
vOutput := ""
for vKey, vValue in oArray
	vOutput .= vKey " " vValue "`r`n"
MsgBox, % vOutput

;ADD(/OVERWRITE) KEYS TO A ASSOCIATIVE ARRAY

;this will create keys a, b, c
oArray := {a:"A", b:"B", c:"C"}

;we can add(/overwrite) keys d, e, f like so:
for vKey, vValue in {d:"D", e:"E", f:"F"}
	oArray[vKey] := vValue

;to list the keys
vOutput := ""
for vKey, vValue in oArray
	vOutput .= vKey " " vValue "`r`n"
MsgBox, % vOutput

;==================================================

;KEY NAMES THAT CLASH WITH METHOD NAMES

;if you create a key with the same name as a method
;the method stops working until you delete the key

;note: this is a problem in AHK v1, but not in AHK v2

oArray := ["a", "b", "c"]
MsgBox, % oArray.Length() ;3
oArray["Length"] := "x"
MsgBox, % oArray.Length() ;(blank)
oArray.Delete("Length")
MsgBox, % oArray.Length() ;3

oArray := ["a", "b", "c"]
MsgBox, % oArray.HasKey(2) ;1
oArray["HasKey"] := "x"
MsgBox, % oArray.HasKey(2) ;(blank)
oArray.Delete("HasKey")
MsgBox, % oArray.HasKey(2) ;1

;for this reason, in the examples below,
;when we create keys with arbitrary names,
;we add an arbitrary prefix to prevent clashes,
;'z' was chosen since no AHK method names begin with 'z'

;==================================================

;FREQUENCY COUNT (CASE INSENSITIVE) (SORT)

;note: 'z' is used to avoid creating a key
;with the same name as a method

;q:: ;frequency count (case insensitive)
vText := "f,e,d,C,B,A,a,b,c,A,B,C"

oArray := {}
StrReplace(vText, ",",, vCount)
oArray.SetCapacity(vCount+1)
Loop Parse, vText, % ","
{
	if oArray.HasKey("z" A_LoopField)
		oArray["z" A_LoopField]++
	else
		oArray["z" A_LoopField] := 1
}

;list all items
vOutput := ""
VarSetCapacity(vOutput, StrLen(vText)*2*2)
for vKey, vValue in oArray
	vOutput .= vValue "`t" SubStr(vKey, 2) "`r`n"
MsgBox, % vOutput

;list items that appear n times
vNum := 1
vOutput := ""
VarSetCapacity(vOutput, StrLen(vText)*2*2)
for vKey, vValue in oArray
{
	if (vValue = vNum)
		vOutput .= vValue "`t" SubStr(vKey, 2) "`r`n"
}
MsgBox, % vOutput

oArray := ""
return

;==================================================

;FREQUENCY COUNT (CASE INSENSITIVE) (MAINTAIN ORDER)

;q:: ;frequency count (case insensitive)
vText := "f,e,d,C,B,A,a,b,c,A,B,C"

oTemp := ComObjCreate("Scripting.Dictionary")
Loop Parse, vText, % ","
{
	vTemp := Format("{:L}", A_LoopField)
	if oTemp.Exists("" vTemp)
		oTemp.Item["" vTemp]++
	else
		oTemp.Item["" vTemp] := 1
}

;list all items
vOutput := ""
VarSetCapacity(vOutput, StrLen(vText)*2*2)
oArray := {}
oArray.SetCapacity(oTemp.Count)
Loop Parse, vText, % ","
{
	if !oArray.HasKey("z" A_LoopField)
	{
		oArray["z" A_LoopField] := 1
		vOutput .= A_LoopField "`t" oTemp.Item["" Format("{:L}", A_LoopField)] "`r`n"
	}
}
MsgBox, % vOutput

;list items that appear n times
vNum := 1
vOutput := ""
VarSetCapacity(vOutput, StrLen(vText)*2*2)
oArray := {}
oArray.SetCapacity(oTemp.Count)
Loop Parse, vText, % ","
{
	if !oArray.HasKey("z" A_LoopField)
	{
		oArray["z" A_LoopField] := 1
		vValue := oTemp.Item["" Format("{:L}", A_LoopField)]
		if (vValue = vNum)
			vOutput .= A_LoopField "`t" vValue "`r`n"
	}
}
MsgBox, % vOutput

oArray := oTemp := ""
return

;==================================================

;FREQUENCY COUNT (CASE SENSITIVE) (MAINTAIN ORDER/SORT)

;w:: ;frequency count (case sensitive)
vText := "f,e,d,C,B,A,a,b,c,A,B,C"

oArray := ComObjCreate("Scripting.Dictionary")
;Sort, vText, CS D, ;add this line to sort the list
Loop Parse, vText, % ","
{
	if oArray.Exists("" A_LoopField)
		oArray.Item["" A_LoopField]++
	else
		oArray.Item["" A_LoopField] := 1
}

;list all items
vOutput := ""
VarSetCapacity(vOutput, StrLen(vText)*2*2)
for vKey in oArray
	vOutput .= oArray.Item[vKey] "`t" vKey "`r`n"
MsgBox, % vOutput

;list items that appear n times
vNum := 1
vOutput := ""
VarSetCapacity(vOutput, StrLen(vText)*2*2)
for vKey in oArray
{
	if (oArray.Item[vKey] = vNum)
		vOutput .= oArray.Item[vKey] "`t" vKey "`r`n"
}
MsgBox, % vOutput

oArray := ""
return

;==================================================

;REMOVE DUPLICATES (CASE INSENSITIVE) (MAINTAIN ORDER/SORT)

;note: 'z' is used to avoid creating a key
;with the same name as a method

;q:: ;remove duplicates (case insensitive)
vText := "f,e,d,C,B,A,a,b,c,A,B,C"

vOutput := ""
VarSetCapacity(vOutput, StrLen(vText)*2*2)
oArray := {}
StrReplace(vText, ",",, vCount)
oArray.SetCapacity(vCount+1)
;Sort, vText, D, ;add this line to sort the list
Loop Parse, vText, % ","
{
	if !oArray.HasKey("z" A_LoopField)
		oArray["z" A_LoopField] := 1, vOutput .= A_LoopField "`r`n"
}
MsgBox, % vOutput

oArray := ""
return

;==================================================

;REMOVE DUPLICATES (CASE SENSITIVE) (MAINTAIN ORDER/SORT)

;w:: ;remove duplicates (case sensitive)
vText := "f,e,d,C,B,A,a,b,c,A,B,C"

vOutput := ""
VarSetCapacity(vOutput, StrLen(vText)*2*2)
oArray := ComObjCreate("Scripting.Dictionary")
;Sort, vText, CS D, ;add this line to sort the list
Loop Parse, vText, % ","
{
	if !oArray.Exists("" A_LoopField)
		oArray.Item["" A_LoopField] := 1, vOutput .= A_LoopField "`r`n"
}
MsgBox, % vOutput

oArray := ""
return

;==================================================

;REFERENCE COUNT

;get ref count (get reference count) (undocumented) (not recommended)
oArray := ["a", "b", "c"]

oArray2 := oArray
vCountRef := NumGet(&oArray + A_PtrSize)
MsgBox, % vCountRef ;2

oArray3 := oArray
vCountRef := NumGet(&oArray + A_PtrSize)
MsgBox, % vCountRef ;3

oArray3 := ""
vCountRef := NumGet(&oArray + A_PtrSize)
MsgBox, % vCountRef ;2

;get ref count (get reference count) (preferred)
oArray := ["a", "b", "c"]

oArray2 := oArray
ObjAddRef(&oArray)
vCountRef := ObjRelease(&oArray)
MsgBox, % vCountRef ;2

oArray3 := oArray
ObjAddRef(&oArray)
vCountRef := ObjRelease(&oArray)
MsgBox, % vCountRef ;3

oArray3 := ""
ObjAddRef(&oArray)
vCountRef := ObjRelease(&oArray)
MsgBox, % vCountRef ;2

;==================================================

;KEY COUNT

;get key count (undocumented) (not recommended)
;For a normal AHK array to get its key count:
;oArray := ["a", "b", "c"]
;vCount := NumGet(&oArray + 4*A_PtrSize)
;MsgBox, % vCount
;from:
;ObjCount() or ObjLength() or ObjLen() - AutoHotkey Community
;https://autohotkey.com/boards/viewtopic.php?f=37&t=3950&p=21579#p21578

;get key count (preferred)
;the .Count() method and ObjCount() were added in AHK v1.1.29
oArray := ["a", "b", "c"]
MsgBox, % oArray.Count()
MsgBox, % ObjCount(oArray)

;get key count (also)
oArray := ["a", "b", "c"]
vCount := 0
for vKey, vValue in oArray
	vCount := A_Index
MsgBox, % vCount

;==================================================
