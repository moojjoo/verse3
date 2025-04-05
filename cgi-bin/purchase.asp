<html>

<head>
<title>Verse:3--Confirmation of Filled out Form</title>
<link rel="stylesheet" href="../css/verse3.css">
</head>

<body background="../../images/verse3back.gif">


<table width="600" border=0>
  <tr>
    <td width="138">&nbsp;</td>
    <td width="446"><img src="../images/verse3logo.gif" width="378" height="92"></td>
  </tr>
  <tr>

</table>
<table width="720" border=0>
  <tr>
    <td><img src="../images/horBarT.gif" width="720" height="4"></td>
</tr>
</table>
 <table width="800" border=0>
        <tr>
	      <td width="120">&nbsp;</td>
          <td><a href="../verse3.htm">News</a> - <a href="../band.htm">Band</a> - <a href="../music.htm">Music</a>
            - <a href="../photos.htm">Photos</a> - <a href="cgi-bin/contact.asp">Contact</a> - <a href="../links.htm">Links/Affiliates</a>  </td>
        </tr>
      </table>
<table width="640" border=0>
  <tr>
    <td><img src="../images/horBarM.gif" width="680" height="4"></td>
</tr>
</table>
       <table width="452" border=0>
        <tr>
         <table width="600" border="0">
	           <tr>
	   		  <td width="120">&nbsp;</td>
	             <td><a href="../guestform.asp">Guest Book</a></td>
	           </tr>
      </table>
        </tr>
      </table>
      <table width="640" border=0>
  <tr>
    <td><img src="../images/horBar.gif" width="640" height="4"></td>
</tr>
</table>
<table width="600" border=0>
  <tr>
    <td width="138">&nbsp;</td>
    <td width="446">


<%
message = "First Name" & ": " & Request.Form("firstName") & CHR(10)_
 & "Last Name" & ": " & Request.Form("lastName") & CHR(10)_
 & "Shipping Address" & ": " & Request.Form("address") & CHR(10)_
 & "City" & ": " & Request.Form("city") & CHR(10)_
 & "State" & ": " & Request.Form("stateid") & CHR(10)_
 & "Zip" & ": " & Request.Form("zip") & CHR(10)_
 & "Email Address" & ": " & Request.Form("eMail") & CHR(10)_
 & "Item" & ": " & Request.Form("item") & CHR(10)_
 & "Album" & ": " & Request.Form("album")

set smtp = Server.CreateObject("Bamboo.SMTP")
' You only need to change the smtp.Rcpt ans smpt.from part to your email address
smtp.Server = "mail.verse3.com"
smtp.Rcpt = "moojjoo@mmwebs.com"
smtp.From = "moojjoo@mmwebs.com"
smtp.FromName = Request.ServerVariables("HTTP_REFERER")
smtp.Subject = "CD Tape Purchase" & Request.ServerVariables("HTTP_REFERER")
smtp.Message = message
on error resume next
smtp.Send
if err then
 response.Write err.Description
else
 response.Write ("Thank you for your submission.... Your shipping information has been delivered successfully.")
end if
set smtp = Nothing
%>
<p>
<%
Dim strfirstName
Dim strlastName
Dim straddress
Dim strcity
Dim strstateid
Dim strzip
Dim streMail
Dim stritem
Dim stralbum
%>

First Name:
<%
strfirstName = Request.Form("firstName")
Response.Write strfirstName
%>
<br>
Last Name:
<%
strlastName = Request.Form("lastName")
Response.Write strlastName
%>
<br>
Address:
<%
straddress = Request.Form("address")
Response.Write straddress
%>
<br>
City:
<%
strcity = Request.Form("city")
Response.Write strcity
%>
<br>
State:
<%
strstateid = Request.Form("stateid")
Response.Write strstateid
%>
<br>
Zip:
<%
strzip = Request.Form("zip")
Response.Write strzip
%>
<br>
E-Mail:
<%
streMail = Request.form("eMail")
Response.Write streMail
%>
<br>
Item:
<%
stritem = Request.Form("item")
Response.Write stritem
%>
<br>
Album:
<%
stralbum = Request.Form("album")
Response.Write stralbum
%>
<p>&nbsp;</p>
<p>Click the following PayPal link according to either a CD or Tape 
to complete the payment process.</P>
<table>
<tr>
<td align="center">
For a $13.99 CD Click Below<br>
<P>
<!-- Begin PayPal Logo -->
<A HREF="https://secure.paypal.x.com/xclick/business=moojjoo%40mmwebs.com&undefined_quantity=1&item_name=Verse+3+-+CD&item_number=CD&amount=10.99&shipping=3.00&return=http%3A//www.verse3.com/cgi-bin/purchase.asp" target="_blank"><IMG SRC="http://images.paypal.com/images/x-click-but6.gif" BORDER="0" ALT="Make payments with PayPal - it's fast, free and secure!"></A>
<!-- End PayPal Logo -->
</td>
<td>
&nbsp;
</td>
<td align="center">
For a $11.99 Tape Click Below<br>
<P>
<!-- Begin PayPal Logo -->
<A HREF="https://secure.paypal.x.com/xclick/business=moojjoo%40mmwebs.com&undefined_quantity=1&item_name=Verse+3+-+Tape&item_number=Tape&amount=8.99&shipping=3.00&return=http%3A//www.verse3.com/cgi-bin/purchase.asp" target="_blank"><IMG SRC="http://images.paypal.com/images/x-click-but6.gif" BORDER="0" ALT="Make payments with PayPal - it's fast, free and secure!"></A>
<!-- End PayPal Logo -->
</td>
</tr>
</table>








	</td>
 </tr>
</table>


</body>
</html>