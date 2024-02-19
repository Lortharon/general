Sub CountMessagesBetweenDates()
    Dim OutlookApp As Object
    Dim Namespace As Object
    Dim Folder As Object
    Dim Items As Object
    Dim MailItem As Object
    Dim StartDate As Date
    Dim EndDate As Date
    Dim Count As Integer
    
    ' Prompt the user for start and end dates
    StartDate = InputBox("Enter the start date (format: mm/dd/yyyy)")
    EndDate = InputBox("Enter the end date (format: mm/dd/yyyy)")
    
    ' Create a new instance of Outlook application
    Set OutlookApp = CreateObject("Outlook.Application")
    
    ' Get the MAPI namespace
    Set Namespace = OutlookApp.GetNamespace("MAPI")
    
    ' Set the folder to your desired folder by name
    Set Folder = Namespace.GetDefaultFolder(6) ' Change if using a different folder
    
    ' Get all items in the specified folder
    Set Items = Folder.Items
    
    ' Initialize count
    Count = 0
    
    ' Loop through each item in the folder
    For Each MailItem In Items
        ' Check if the item is a mail item
        If TypeOf MailItem Is Outlook.MailItem Then
            ' Get the received date of the mail item
            Dim ReceivedDate As Date
            ReceivedDate = MailItem.ReceivedTime
            
            ' Check if the received date falls within the specified date range
            If ReceivedDate >= StartDate And ReceivedDate <= EndDate Then
                Count = Count + 1 ' Increment count if within the date range
            End If
        End If
    Next MailItem
    
    ' Display the count
    MsgBox "Number of messages received between " & StartDate & " and " & EndDate & ": " & Count
    
    ' Clean up
    Set OutlookApp = Nothing
    Set Namespace = Nothing
    Set Folder = Nothing
    Set Items = Nothing
    Set MailItem = Nothing
End Sub
