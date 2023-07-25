
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