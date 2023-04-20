
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
    Range("$K$8:$N$100").UnMerge


Set rngAmount = ws.Range("K8:M200").Find("Amount per *") 'change A1:Z100 to the range you want to search in
Set rngServingSize = ws.Range("K8:M50").Find("*Serving Size*")
If Not rngServingSize Is Nothing Then
ServingSize = Replace(rngServingSize, "Serving Size: ", "")
ws.Range("B4").Value = ServingSize
End If


If Not rngAmount Is Nothing Then
Dim rngDailyValue As Range

Set rngDailyValue = ws.Range("K8:M150").Find("*Daily Value not* established*")   'change A1:Z100 to the range you want to search in
Set rngPercentDaily = ws.Range("K8:M150").Find("*Percent Daily Values are*")
'Set RngServingSize = ws.Range("K8:R50").Find("*Serving Size*")

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
    Set rngOtherIngredients = ws.Range("K8:M150").Find("*Other Ingredients*")
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




