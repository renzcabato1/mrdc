<%
Set Mail = Server.CreateObject("Persits.MailSender") 
Mail.Host = "mail.mrdccarrageenan.com" ' Specify a valid SMTP server
Mail.From = "info@mrdccarrageenan.com" ' Specify sender's address
Mail.FromName = "Online Inquiry MRDC" ' Specify sender's name 

Mail.AddAddress "info@mrdccarrageenan.com"
Mail.AddReplyTo "info@mrdccarrageenan.comm"


Mail.Subject = "MRDC Sample/Order Request Form"
msg = "MRDC Sample/Order Request Form" & vbCrLf & _
	"-----------------------------" & vbCrLf & _
	"Name: " & Request.Form("txtName") & vbCrLf & _
				"Request Form: " & Request.Form("txtRequest") & vbCrLf  & _
				"Company: " & Request.Form("txtCompany") & vbCrLf  & _
				"Address: " & Request.Form("txtAddress") & vbCrLf  & _
                "Phone: " & Request.Form("txtPhone") & vbCrLf & _
                "Fax: " & Request.Form("txtFax") & vbCrLf & _
				"E-mail Address: " & Request.Form("txtEmail") & vbCrLf & _
				"Product Code: " & Request.Form("txtProdcode") & vbCrLf & _
				"Special Instructions: " & Request.Form("txtQuanity") & vbCrLf & _
				"Special Instructions: " & Request.Form("txtSpecial") & vbCrLf & _
				
				"-----------------------------"

Mail.Body = msg

On Error Resume Next
Mail.Send
response.redirect("../contact-us-sent1.asp")

If Err <> 0 Then
   Response.Write "Error encountered: " & Err.Description
End If
%>