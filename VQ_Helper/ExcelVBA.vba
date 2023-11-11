
Sub GetLabelCopyText()
    Dim productSearchRange As Range
    Dim sizeSearchRange As Range
    Dim servingsSearchRange As Range
    Dim productCell As Range
    Dim sizeCell As Range
    Dim servingsCell As Range
    Dim productSearchString As String
    Dim productStartPosition As Long
    Dim productResult As String
    Dim sizeSearchString As String
    Dim sizeStartPosition As Long
    Dim sizeResult As String
    Dim servingsSearchString As String
    Dim servingsStartPosition As Long
    Dim servingsResult As String

    ' Set the search range to cells J8:L10
    Set productSearchRange = ActiveSheet.Range("K8:K10")
    Set sizeSearchRange = ActiveSheet.Range("K10:K14")
    Set servingsSearchRange = ActiveSheet.Range("L15:L20")

    ' Loop through each cell in the search range
    For Each productCell In productSearchRange
            ' Check if the productCell starts with "Final Label Copy"
        productSearchString = "Final label copy"
        If Left(productCell.Value, Len(productSearchString)) = productSearchString Then
            ' Check if the productCell contains "000", "BL0", or "# " and extract 4 characters after the keyword
            If InStr(productCell.Value, "000") > 0 Then
                productStartPosition = InStr(productCell.Value, "000") + 3
                productResult = Mid(productCell.Value, productStartPosition, 4)


                        For Each sizeCell In sizeSearchRange
                                ' Check if the sizeCell starts with "Final Label Copy"
                            sizeSearchString = "Capsule size"
                            If Left(sizeCell.Value, Len(sizeSearchString)) = sizeSearchString Then
                                ' Check if the sizeCell contains "000", "BL0", or "# " and extract 4 characters after the keyword
                                If InStr(sizeCell.Value, "size: ") > 0 Then
                                    sizeStartPosition = InStr(sizeCell.Value, ": ") + 2
                                '    sizeStopPosition = ' InStr(sizeCell.Value, "clear")
                                    sizeResult = Mid(sizeCell.Value, sizeStartPosition)
                                    Exit For
                                ElseIf InStr(sizeCell.Value, " #") > 0 Then
                                    sizeStartPosition = InStr(sizeCell.Value, " #") - 1
                                    sizeResult = Mid(sizeCell.Value, sizeStartPosition, sizeStopPosition)
                                        Exit For
                                    End If
                                End If
                            Next sizeCell


                Exit For
            ElseIf InStr(productCell.Value, "BL0") > 0 Then
                productStartPosition = InStr(productCell.Value, "BL0") + 3
                productResult = Mid(productCell.Value, productStartPosition, 4)
                Exit For
            ElseIf InStr(productCell.Value, "# ") > 0 Then
                productStartPosition = InStr(productCell.Value, "# ") + 2
                productResult = Mid(productCell.Value, productStartPosition, 4)
                Exit For
            End If
        End If
    Next productCell




    For Each servingsCell In servingsSearchRange
        ' Check if the servingsCell starts with "Final Label Copy"
        servingsSearchString = "Serving Size"
        If Left(servingsCell.Value, Len(servingsSearchString)) = servingsSearchString Then
            ' Check if the servingsCell contains "000", "BL0", or "# " and extract 4 characters after the keyword
            If InStr(servingsCell.Value, ": ") > 0 Then
                servingsStartPosition = InStr(servingsCell.Value, ": ") + 2
                servingsResult = Mid(servingsCell.Value, servingsStartPosition)
                Exit For
            ' ElseIf InStr(servingsCell.Value, "BL0") > 0 Then
            '     servingsStartPosition = InStr(servingsCell.Value, "BL0") + 3
            '     result = Mid(servingsCell.Value, servingsStartPosition, 4)
            '     Exit For

            End If
        End If
    Next servingsCell

    ' Display the result in a message box
    If productResult <> "" Then ActiveSheet.Range("B1") = productResult


    If sizeResult <> "" Then ActiveSheet.Range("C4") = sizeResult


    If servingsResult <> "" Then ActiveSheet.Range("B4") = servingsResult

End Sub


Sub MergeSheets()

    Dim oldWb As Workbook
    Dim newWb As Workbook
    Dim newWs As Worksheet
    Dim sheet As Worksheet
    Dim lastRow As Long
    Dim i As Integer

    ' Open the workbooks
    Set oldWb = Workbooks.Open("path/to/OldRotations.xlsx")
    Set newWb = Workbooks.Open("path/to/NewRotations.xlsx")

    ' Add a new worksheet to the new workbook
    Set newWs = newWb.Sheets.Add(After:=newWb.Sheets(newWb.Sheets.Count))
    newWs.Name = "Merged Data"

    ' Loop through each sheet in the old workbook, but only for the first 10 sheets
    For i = 1 To 10
        Set sheet = oldWb.Sheets(i)

        ' Find the last row with data in column C of the new worksheet
        lastRow = newWs.Cells(newWs.Rows.Count, "C").End(xlUp).Row

        ' Copy the data (from column A to DA and down to the last filled row) from the old worksheet to the new worksheet
        sheet.Range("A1:DA" & sheet.Cells(sheet.Rows.Count, "A").End(xlUp).Row).Copy
        newWs.Cells(lastRow + 1, 1).Value = sheet.Name
        newWs.Cells(lastRow + 1, 3).PasteSpecial Paste:=xlPasteValues
    Next i

    ' Close the old workbook without saving
    oldWb.Close SaveChanges:=False

    ' Inform the user
    MsgBox "Data merged successfully!", vbInformation

End Sub






' ---[new WORKSHEET CHANGE]

Private Sub Worksheet_Change(ByVal Target As Range)
    Dim KeyCells As Range
  Dim ws As Worksheet
  Dim x As Integer
  Dim CurrentSheetName As Worksheet
  Dim Sheetname As String
  Dim MicroStatus As Range
  Set CurrentSheetName = ActiveSheet
  If Application.ActiveSheet.Name = "Template" Then Exit Sub
  Set KeyCells = ActiveSheet.Range("B7")
   Set MicroStatus = ActiveSheet.Range("Y1")
        On Error GoTo Exitthesub
    If ActiveSheet.Range("A55") <> "[M]" AND MicroStatus.Value = "Micro" OR MicroStatus.Value = "Micro Probiotic" Then
        Application.DisplayAlerts = False
        ActiveSheet.Range("A55").Value = "[M]"
            Worksheets("Main").Range("E:E").Find(ActiveSheet.Name, LookIn:=xlValues).Offset(0, -1).Value = "M"
        If ActiveSheet.Range("B7") = "CoA" Then ActiveSheet.Tab.ColorIndex = 23
            ElseIf ActiveSheet.Range("B7") = "Specs" Then ActiveSheet.Tab.ColorIndex = 46
            ElseIf ActiveSheet.Range("B7") = "Reviewed" Then ActiveSheet.Tab.ColorIndex = 44
            ElseIf ActiveSheet.Range("B7") = "__________" Then ActiveSheet.Tab.ColorIndex = 50
        end If
            Application.DisplayAlerts = True
    End If

      If Not Application.Intersect(KeyCells, Range(Target.Address)) _
        Is Nothing Then
  Sheetname = ActiveSheet.Range("B1").Value
  Application.ScreenUpdating = False
'coa

        ActiveSheet.Tab.ColorIndex = 37
'Specs
        ActiveSheet.Tab.ColorIndex = 45
'Reviewed

'samples
        ActiveSheet.Tab.ColorIndex = 2

 Call CreateTOC
End If

Exitthesub:
Application.ScreenUpdating = True
  Exit Sub
ErrHandler:
Application.ScreenUpdating = True
'Application.ActiveSheet.Name = Target.Value & ".2"
End Sub

' ----[[old worksheet change
Private Sub Worksheet_Change(ByVal Target As Range)
    Dim KeyCells As Range
  Dim ws As Worksheet
  Dim x As Integer
  Dim CurrentSheetName As Worksheet
  Dim Sheetname As String
  Dim MicroStatus As Range
  Set CurrentSheetName = ActiveSheet
  If Application.ActiveSheet.Name = "Template" Then Exit Sub
  Set KeyCells = ActiveSheet.Range("B7")
  Set MicroStatus = ActiveSheet.Range("Y1")

    If ActiveSheet.Range("A55").value = "" and MicroStatus.Value = "Micro" Then
        Application.DisplayAlerts = False
        ActiveSheet.Range("A55").Value = "[M]"
           Worksheets("Main").Range("E:E").Find(ActiveSheet.Name, LookIn:=xlValues).Offset(0, -1).Value = "M"
       Application.DisplayAlerts = True
    End If

On Error GoTo Exitthesub

If Not Application.Intersect(KeyCells, Range(Target.Address)) Is Nothing Then
    Sheetname = ActiveSheet.Range("B1").Value
    Application.ScreenUpdating = False
    Call StatusChange
    Application.ScreenUpdating = True
End If

Exitthesub:
    Application.ScreenUpdating = True
    Exit Sub
ErrHandler:
    Application.ScreenUpdating = True
    'Application.ActiveSheet.Name = Target.Value & ".2"
End Sub

' ---[[new micro click
Sub Status_Change()
Dim Status as string
Dim Micro as string

Status = ActiveSheet.Range("B7").value
Micro = ActiveSheet.Range("Y1").value
' Application.ScreenUpdating = False

    If Status = "CoA" Then
        If Micro <> "Micro" Then ActiveSheet.Tab.ColorIndex = 26
        If Micro = "Micro" Then ActiveSheet.Tab.ColorIndex = 20
    end If
    If Status = "Specs" Then
        If Micro <> "Micro" Then ActiveSheet.Tab.ColorIndex = 76
        If Micro = "Micro" Then ActiveSheet.Tab.ColorIndex = 75
        ActiveSheet.Move After:=ActiveWorkbook.Sheets("Specs")
    End If
    If Status = "Reviewed" Then
        If Micro <> "Micro" Then ActiveSheet.Tab.ColorIndex = 6
        If Micro = "Micro" Then ActiveSheet.Tab.ColorIndex = 36
        ActiveSheet.Move Before:=ActiveWorkbook.Sheets("Specs")
    End If
    If Status = "Samples" then
        If Micro <> "Micro" Then ActiveSheet.Tab.ColorIndex = 15
        If Micro = "Micro" Then ActiveSheet.Tab.ColorIndex = 56
    end if
    If Status = "Completed" Then
        Worksheets("Main").Range("D:D").Find(ActiveSheet.Range("B1").Value, LookIn:=xlValues).Offset(0, 10).Value = "x"
        if ActiveSheet.Range("AG2").Value <> "" Then 'if rotation
            ActiveSheet.Range("B7").value = "Rotation"
            ActiveSheet.Move After:=ActiveWorkbook.Sheets("Rotation")
            ActiveSheet.Tab.ColorIndex = 54
            Call UnFormula
        else
            ActiveSheet.Tab.ColorIndex = 1
            Application.ScreenUpdating = True
            ActiveSheet.Delete
        End if
    END if
    If Status = "Rotation" Then
            ActiveSheet.Move After:=ActiveWorkbook.Sheets("Rotation")
            ActiveSheet.Tab.ColorIndex = 54
            Call UnFormula
    END IF

end sub



Public Sub Status_Change(byval sht As Worksheet)
Dim Status As String
Dim Micro As String

Status = ActiveSheet.Range("B7").Value
Micro = ActiveSheet.Range("Y1").Value

    If Status = "CoA" Then
        If Micro <> "Micro" Then ActiveWorkbook.Sheets(sht).Tab.ColorIndex = 26
        If Micro = "Micro" Then ActiveWorkbook.Sheets(sht).Tab.ColorIndex = 20
    End If
    If Status = "Specs" Then
        If Micro <> "Micro" Then ActiveWorkbook.Sheets(sht).Tab.ColorIndex = 46
        If Micro = "Micro" Then ActiveWorkbook.Sheets(sht).Tab.ColorIndex = 45
        ActiveWorkbook.Sheets(sht).Move After:=ActiveWorkbook.Sheets("Specs")
    End If
    If Status = "Reviewed" Then
        If Micro <> "Micro" Then ActiveWorkbook.Sheets(sht).Tab.ColorIndex = 6
        If Micro = "Micro" Then ActiveWorkbook.Sheets(sht).Tab.ColorIndex = 36
        ActiveWorkbook.Sheets(sht).Move Before:=ActiveWorkbook.Sheets("Specs")
    End If
    If Status = "Samples" Then
        If Micro <> "Micro" Then ActiveWorkbook.Sheets(sht).Tab.ColorIndex = 15
        If Micro = "Micro" Then ActiveWorkbook.Sheets(sht).Tab.ColorIndex = 56
    End If
    If Status = "Completed" Then
        Worksheets("Main").Range("D:D").Find(ActiveWorkbook.Sheets(sht).Range("B1").Value, LookIn:=xlValues).Offset(0, 10).Value = "x"
        If ActiveWorkbook.Sheets(sht).Range("AG2").Value <> "" Then 'if rotation
            ActiveWorkbook.Sheets(sht).Range("B7").Value = "Rotation"
            ActiveWorkbook.Sheets(sht).Move After:=ActiveWorkbook.Sheets("Rotation")
            ActiveWorkbook.Sheets(sht).Tab.ColorIndex = 54
            Call UnFormula
        Else
            ActiveWorkbook.Sheets(sht).Tab.ColorIndex = 1
            Application.ScreenUpdating = True
            ActiveWorkbook.Sheets(sht).Delete
        End If
    End If
    If Status = "Rotation" Then
            ActiveWorkbook.Sheets(sht).Move After:=ActiveWorkbook.Sheets("Rotation")
            ActiveWorkbook.Sheets(sht).Tab.ColorIndex = 54
            Call UnFormula
    End If
    Call CreateTOC

End Sub