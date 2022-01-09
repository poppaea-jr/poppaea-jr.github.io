Sub DeleteErrorRows()
Dim xWs As Worksheet
Dim xRg As Range
Dim xFNum As Integer
 
   Set xWs = Application.ActiveSheet
Application.ScreenUpdating = False
  On Error Resume Next ****************************** incase there are no cells with this error config -> then special cell = nothing, and then the code can move past the error given when we try to process a nothing cell
    With xWs
  Set xRg = .UsedRange 
        xRg.Select
        For xFNum = 1 To xRg.Columns.Count
      With .Columns(xFNum).SpecialCells(xlCellTypeFormulas, xlErrors) *********** xlCellTypeFormulas is suficient here as my errors can be identified after the increase of 10% formula has been applied
                .EntireRow.Delete
            End With
        Next xFNum
    End With
Application.ScreenUpdating = True
End Sub
