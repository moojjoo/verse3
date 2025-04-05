<html>

<head>
<title>Verse:3--Confirmation of Filled out Form</title>
<link rel="stylesheet" href="../css/verse3.css">
</head>

<body background="../../images/verse3back.gif">


<table width="600" border="0">
  <tr>
    <td width="138">&nbsp;</td>
    <td width="446"><img src="../images/verse3logo.gif" width="378" height="92"></td>
  </tr>
  <tr>

</table>
<table width="720" border="0">
  <tr>
    <td><img src="../images/horBarT.gif" width="720" height="4"></td>
</tr>
</table>
 <table width="600" border="0">
        <tr>
	      <td width="138">&nbsp;</td>
          <td><font color="#C0C0C0"><a href="../band.htm">Band</a> - <a href="../music.htm">Music</a>
            - <a href="../photos.htm">Photos</a> - <a href="../cgi-bin/contact.asp">Contact</a>
            - <a href="../verse3.htm">News</a></font></td>
        </tr>
      </table>
<table width="640" border="0">
  <tr>
    <td><img src="../images/horBarM.gif" width="680" height="4"></td>
</tr>
</table>
       <table width="600" border="0">
	           <tr>
	   		  <td width="120">&nbsp;</td>
	             <td><a href="../cgi-bin/guestbook.asp">Guest Book</a></td>
	           </tr>
      </table>
      <table width="640" border="0">
  <tr>
    <td><img src="../images/horBar.gif" width="640" height="4"></td>
</tr>
</table>
<table width="600" border="0">
  <tr>
    <td width="138">&nbsp;</td>
    <td width="446">
<div align="center"
<P>
<%
message = "First Name" & ": " & Request.Form("firstName") & CHR(10)_
 & "Last Name" & ": " & Request.Form("lastName") & CHR(10)_
 & "Email Address" & ": " & Request.Form("eMail") & CHR(10)_
 & "Phone Number" & ": " & Request.Form("phoneNumber")& CHR(10)_
 & "City" & ": " & Request.Form("city") & CHR(10)_
 & "State" & ": " & Request.Form("stateid") & CHR(10)_
 & "Zip" & ": " & Request.Form("zip") & CHR(10)_
 & "Testomonials" & ": " & Request.Form("testomonials") & CHR(10)_
 & "Comments or Questions" & ": " & Request.Form("comments") & CHR(10)

set smtp = Server.CreateObject("Bamboo.SMTP")
' You only need to change the smtp.Rcpt ans smpt.from part to your email address
smtp.Server = "mail.mmwebs.com"
smtp.Rcpt = "robbie@verse3.com"
smtp.From = "robbie@verse3.com"
smtp.FromName = Request.ServerVariables("HTTP_REFERER")
smtp.Subject = "Your web form - " & Request.ServerVariables("HTTP_REFERER")
smtp.Message = message
on error resume next
smtp.Send
if err then
 response.Write err.Description
else
 response.Write ("Thank you for your submission.... Your message has been delivered successfully.")
end if
set smtp = Nothing
%>

<p>Your info has been sent to Verse:3</p>

<div>
	</td>
 </tr>
</table>


</body>
</html>