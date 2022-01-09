Sub DeleteErrorRows()
Dim xWs As Worksheet
Dim xRg As Range
Dim xFNum As Integer
 
   Set xWs = Application.ActiveSheet
Application.ScreenUpdating = False
    On Error Resume Next
    With xWs
        Set xRg = .UsedRange
        xRg.Select
        For xFNum = 1 To xRg.Columns.Count
            With .Columns(xFNum).SpecialCells(xlCellTypeFormulas, xlErrors)
                .EntireRow.Delete
            End With
        Next xFNum
    End With
Application.ScreenUpdating = True
End Sub
