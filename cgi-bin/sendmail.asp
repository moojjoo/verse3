<html>

<head>
<title>w3 JMail rocks</title>
</head>

<body>
<p align="center"><font face="Arial, geneva" size="5"> Email Form</font></p>
<%
Name = Request.Form("name")
SenderEmail = Request.Form("email")
Subject = "Regarding " & Request.Form ("subject")
Recipient = "moojjoo@mmwebs.com" 
Body = Request.Form("body")

Set JMail = Server.CreateObject ("JMail.SMTPMail") 

' Below you should enter your own SMTP-server 
JMail.ServerAddress = " " 

JMail.Sender = Senderemail
JMail.Subject = Subject 

JMail.AddRecipient Recipient 

JMail.Body = Body 

JMail.Priority = 3 

JMail.AddHeader "Originating-IP", Request.ServerVariables("REMOTE_ADDR") 

JMail.Execute

%>
<center>
<font face="Arial, geneva" size="3">
Your email has been sent to <% = Recipient %><br>
</font>

</center>
</body>
</html>