Sub CountTHYMessages()
    Dim OutlookApp As Object
    Dim Namespace As Object
    Dim Folder As Object
    Dim Items As Object
    Dim MailItem As Object
    Dim SubjectKeyword As String
    Dim Count As Integer
    
    ' Define the keyword to search for in the subject
    SubjectKeyword = "THY"
    
    ' Create a new instance of Outlook application
    Set OutlookApp = CreateObject("Outlook.Application")
    
    ' Get the MAPI namespace
    Set Namespace = OutlookApp.GetNamespace("MAPI")
    
    ' Get the inbox folder
    Set Folder = Namespace.GetDefaultFolder(6) ' 6 represents the Inbox folder
    
    ' Get all items in the inbox
    Set Items = Folder.Items
    
    ' Initialize count
    Count = 0
    
    ' Loop through each item in the inbox
    For Each MailItem In Items
        ' Check if the item is a mail item and subject contains the keyword
        If TypeOf MailItem Is Outlook.MailItem And InStr(1, MailItem.Subject, SubjectKeyword, vbTextCompare) > 0 Then
            Count = Count + 1 ' Increment count if subject contains the keyword
        End If
    Next MailItem
    
    ' Display the count
    MsgBox "Number of messages with subject containing 'THY': " & Count
    
    ' Clean up
    Set OutlookApp = Nothing
    Set Namespace = Nothing
    Set Folder = Nothing
    Set Items = Nothing
    Set MailItem = Nothing
End Sub
