<%
If Request("Send") <> "" Then
    Set Mail = Server.CreateObject("Persits.MailSender")
    Mail.Host = "mail.mrdccarrageenan.com"
    Mail.Username = "website@mrdccarrageenan.com"  
    Mail.Password = "MrDcC4rr4g3enan"  

    Mail.From = "mrdccarrageenan.com"  
    Mail.FromName = "Marine Resources Developement Corp."

    Mail.AddReplyTo "info@mrdccarrageenan.com"
    
    Mail.Subject = "Customer Inquiry from " & Request("full_name")
    Mail.Body = "You have received a new message from your website contact form." & chr(10) & "Here are the details: " & chr(13) & "Name: " & Request("full_name") & chr(10) & "E-mail: " & Request("email") & chr(10) & "Phone Number: " & Request("phone_num") & chr(10) & "Message: " & Request("message")

    On Error Resume Next
    Mail.Send
    If Err <> 0 Then
        Response.Write "Error encountered: " & Err.Description
    End If
End If
%>