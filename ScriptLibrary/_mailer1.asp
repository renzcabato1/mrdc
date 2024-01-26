<%@ Language="VBScript" %>
<%
dim mail_content

mail_content = mail_content & "Online Inquiry Form" & vbcrlf
mail_content = mail_content & "___________________________" & vbcrlf
mail_content = mail_content & "Name  : " & request.Form("txtName") & vbcrlf
mail_content = mail_content & "Company  : " & request.Form("txtCompany") & vbcrlf
mail_content = mail_content & "Address : " & request.Form("txtAddress") & vbcrlf
mail_content = mail_content & "Phone : " & request.Form("txtPhone") & vbcrlf
mail_content = mail_content & "Fax : " & request.Form("txtFax") & vbcrlf
mail_content = mail_content & "E-mail Address : " & request.Form("txtEmail") & vbcrlf
mail_content = mail_content & "Question/Comment : " & request.Form("txtComment") & vbcrlf
mail_content = mail_content & "___________________________" & vbcrlf
%>
<%
Dim iMsg
Set iConf
Set iConf = CreateObject("CDO.Configuration")
Dim Flds
Set Flds = iConf.Fields
Flds("http://schemas.microsoft.com/cdo/configuration/sendusing") = 1
Flds( _
 "http://schemas.microsoft.com/cdo/configuration/smtpserverpickupdirectory") _
  = "c:\inetpub\mailroot\pickup"

Flds.Update
Set iMsg.Configuration = iConf iMsg = CreateObject("CDO.Message")
Dim
iMsg.To = "fernando@servobox.com" 
iMsg.From = "onlineinquiry@mrdc.com"
iMsg.Subject = "Online Inquiry"
iMsg.TextBody = mail_content 	
iMsg.Send  

response.redirect("../contact-us-sent1.asp")
%>