
Sub Paste_Ingredients()
' copy_info Macro
' Keyboard Shortcut: Ctrl+g
Dim ws As Worksheet
Set ws = ActiveSheet 'change Sheet1 to the name of the worksheet you want to use
Dim rngServingSize As Range
Dim rngPercentDaily As Range
Dim ServingSize As String


Dim rngAmount As Range
Application.ScreenUpdating = False
Columns("J:R").EntireColumn.Hidden = False
Rows("42:55").EntireRow.Hidden = False
Rows("65:200").EntireRow.Hidden = False
ActiveCell.Select
    Range("K8").Select
    Selection.PasteSpecial xlPasteValues
    Application.CutCopyMode = False
   ' Range("$K$8:$R$100").Style = "IngredientAmounts"
    Range("$K$8:$M$150").UnMerge


Set rngAmount = ws.Range("L8:M150").Find("Amount per *") 'change A1:Z100 to the range you want to search in
Set rngServingSize = ws.Range("L8:M50").Find("*Serving Size*")
If Not rngServingSize Is Nothing Then
ServingSize = Replace(rngServingSize, "Serving Size: ", "")
ws.Range("B4").Value = ServingSize
End If


If Not rngAmount Is Nothing Then
Dim rngDailyValue As Range

Set rngDailyValue = ws.Range("L8:M150").Find("*Daily Value not* established*")   'change A1:Z100 to the range you want to search in
Set rngPercentDaily = ws.Range("L8:M150").Find("*Percent Daily Values are*")
'Set RngServingSize = ws.Range("L8:R50").Find("*Serving Size*")

'RngServingSize.Copy Range("B5")
    Dim rng As Range
If Not rngDailyValue Is Nothing Or Not rngPercentDaily Is Nothing Then

    Set rng = ws.Range(ws.Cells(rngAmount.Row + 1, rngAmount.Column), ws.Cells(rngDailyValue.Row - 1, rngDailyValue.Column))
    rng.Copy Range("B8")
    'Columns("J:R").EntireColumn.Hidden = True
   ' Application.ScreenUpdating = True
Else
    'Application.ScreenUpdating = True
'Columns("J:R").EntireColumn.Hidden = True
    Dim rngOtherIngredients As Range
    Set rngOtherIngredients = ws.Range("L8:M150").Find("*Other Ingredients*")
    Set rng = ws.Range(ws.Cells(rngAmount.Row + 1, rngAmount.Column), ws.Cells(rngOtherIngredients.Row - 1, rngOtherIngredients.Column + 1))
    rng.Copy Range("B8")
    'MsgBox "Could not find the cell with the words '[*]*Daily Value'."
End If

Else
'Application.ScreenUpdating = True
'Columns("J:R").EntireColumn.Hidden = True
MsgBox "Could not find the cell with the words 'Amount per Serving'."
End If

'delete calorie cells
Dim Deleterng As Range
Set Deleterng = ActiveSheet.Range("B8:B10")
For Each Cell In Deleterng
    If Cell.Value Like "*Calorie*" Or Cell.Value Like "*Total Carbohydrate*" Or Cell.Value Like "*Dietary Fiber*" Or Cell.Value Like "*Total Sugar*" Then Range("B8", Cell.Offset(0, 2)).Delete Shift:=xlUp
    Next Cell


Columns("J:R").EntireColumn.Hidden = True
Rows("42:55").EntireRow.Hidden = True
'Rows("65:150").EntireRow.Hidden = True
Application.ScreenUpdating = True
End Sub


'where to start the range column L12+
"Supplement Facts" Or "Nutrition Facts"
' next
"Serving Size:" 1 Scoop (5.43 g)

' list of rows to delete
"Amount Per Serving,*Servings Per Container,% Daily Value,Calories,Total Fat,Saturated Fat,Trans Fat,Cholesterol,Sodium,Total Carbohydrate,Dietary Fiber,Total Sugars,*Added Sugars"

*Percent Daily Values
†Daily Value not established.
* Daily value not established.
*The % Daily Value tells
"*Other Ingredients*"

'gap to split
Protein  20g
Vitamin D  2.5mcg 
Calcium  30mg
Iron  6.2mg
Potassium  290mg  








'''''''''''''''''''''''''''''''''''delete rows
Sub DeleteCellsContainingPhrases()

    Dim myCell As Range
    Dim myPhrases() As String
    Dim i As Integer

    ' Define the range of cells to search
    Dim myRange As Range
    Set myRange = Range("L12:M100") 'Change this to your desired range

    ' Find the first occurrence of either "Supplement Facts" or "Nutrition Facts" in column L
    Dim startCell As Range
    Set startCell = Columns("L").Find(What:="Supplement Facts", LookIn:=xlValues, LookAt:=xlPart)
    If startCell Is Nothing Then
        Set startCell = Columns("L").Find(What:="Nutrition Facts", LookIn:=xlValues, LookAt:=xlPart)
    End If

   ' If a startCell is found, determine the start row for myRange
    If Not startCell Is Nothing Then
        startRow = Application.Min(startCell.Row, myRange.Cells(1).Row)
        Set myRange = Range("L" & startRow & ":M100")

        ' Get the last row that has a non-blank cell in column K that follows the startCell
        lastRow = startCell.Offset(1, -1).End(xlDown).Row
        Set myRange = Range(myRange.Cells(1), Cells(lastRow, "M"))
    End If



    ' Clear the cells in columns K-Q from lastRow+1 to the end of the worksheet
    Range("K" & lastRow & ":Q" & Rows.Count).ClearContents

    ' Define the phrases to search for
    myPhrases = Split("per serving,per Container,Calories,Total Fat,Saturated Fat,Trans Fat,Cholesterol,Carbohydrate,Dietary Fiber,Total Sugars,Added Sugars,Daily Value,ingredients", ",")

    ' Loop through each cell in the range
    For Each myCell In myRange

        ' Loop through each phrase to search for
        For i = LBound(myPhrases) To UBound(myPhrases)

            ' If the cell contains the phrase, clear the cell and the two cells to the right
            If InStr(1, myCell.Value, myPhrases(i), vbTextCompare) > 0 Then
                Range(Cells(myCell.Row, myCell.Column), Cells(myCell.Row, myCell.Column + 5)).ClearContents
                i = LBound(myPhrases) 'Restart the loop from the beginning
                Exit For 'Exit the loop once a match is found
            End If

        Next i

    Next myCell

End Sub
