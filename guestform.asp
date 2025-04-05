<%
Set DbConn = Server.CreateObject("ADODB.Connection")
      Smpath = "DBQ=" & Server.Mappath("cgi-bin/verse3.mdb")
      DbConn.Open "DRIVER={Microsoft Access Driver (*.mdb)}; " & Smpath

GuestBookName = Replace(Request.Form("GuestBookName"), "'", "''")
GuestBookEmail = Replace(Request.Form("GuestBookEmail"), "'", "''")
GuestBookComment = Replace(Request.Form("GuestBookComment"), "'", "''")
GuestBookDate = Date

RequestMethod=Request.ServerVariables("REQUEST_METHOD")

If RequestMethod="POST" Then
mySQL = " select max(GuestBookID) from Verse3"
	set rsGuest = DbConn.execute(mySQL)
    GuestBookID = cint(rsGuest(0))+1

mySQL = "INSERT into Verse3 (GuestBookID, GuestBookDate, GuestBookName, GuestBookEmail, GuestBookComment) VALUES "
	mySQL = mySQL & " (" & GuestBookID & ",'" & GuestBookDate & "','" & GuestBookName & "','" & GuestBookEmail & "','" & GuestBookComment & "') "

'response.write mySQL
DbConn.Execute(mySQL)



 rsGuest.close
 'Response.Redirect("guestbook.asp")
end if

  DbConn.close
  Set  DbConn = nothing


%>

<html>
<head>
<title>Verse:3--Guest Book</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script>
<!--

function guestBook(){
	open("guestbook.asp","GuestBook",
	"toolbar=0,location=0,menubar=0,scrollbars=1,status=0,resizable=1,width=450,height=500")
}
// -->

</script>

<link rel="stylesheet" href="css/verse3.css">
</head>

<body  background="images/verse3back.gif">
<table width="600" border="0">
  <tr>
    <td width="138">&nbsp;</td>
    <td width="446"><img src="images/verse3logo.gif" width="378" height="92"></td>
  </tr>
  <tr>

</table>
<table width="720" border="0">
  <tr>
    <td><img src="images/horBarT.gif" width="720" height="4"></td>
</tr>
</table>

      <table width="800" border="0">
        <tr>
	      <td width="120">&nbsp;</td>
          <td><a href="verse3.htm">News</a> - <a href="band.htm">Band</a> - <a href="music.htm">Music</a>
            - <a href="photos.htm">Photos</a> - <a href="cgi-bin/contact.asp">Contact</a> - <a href="links.htm">Links/Affiliates</a>  </td>
        </tr>
      </table>
<table width="640" border="0">
  <tr>
    <td><img src="images/horBarM.gif" width="680" height="4"></td>
</tr>
</table>
<table width="800" border="0">
        <tr>
		  <td width="120">&nbsp;</td>
          <td><a href="guestform.asp">Guest Book</a></td>
        </tr>
      </table>
       <table width="452" border="0">
      </table>
      <table width="640" border="0">
  <tr>
    <td><img src="images/horBar.gif" width="640" height="4"></td>
</tr>
</table>
<table width="600" border="0">
<tr>

    <td height="498" width="138" valign="bottom"><img src="images/spacer.gif" width="138" height="1" border="0" alt=""></td>
    <td height="498" width="446" valign="top">

      <p>&nbsp;</p>

<H1>Sign Our Guestbook:</H1>
	<FORM METHOD="post">
	<TABLE>
		<TR>
		<TD ALIGN="right"><B>Name:</B></TD>
		<TD><INPUT TYPE="text" NAME="GuestBookName" SIZE="15"></INPUT></TD>
		</TR>
		<TR>
		<TD ALIGN="right"><B>E-Mail:</B></TD>
		<TD><INPUT TYPE="text" NAME="GuestBookEmail" SIZE="15"></INPUT></TD>
		</TR>
		<TR>
		<TD ALIGN="right"><B>Comment:</B></TD>
		<TD><textarea NAME="GuestBookComment" cols="40" rows="5" Wrap="hard"></textarea></TD>
		</TR>
	</TABLE>
	
	<INPUT TYPE="submit" VALUE="Sign Guestbook!">
	<INPUT TYPE="button" VALUE="View Guestbook" onClick="guestBook()">
	</FORM>


  <hr>
      <!-- #BeginLibraryItem "/Library/copy.lbi" --><p>copyright 1999 all rights reserved<br>
        all music and lyrics written by Verse:3 unless noted by *<br>
        E-mail:<a href="mailto:verse3@verse3.com">verse3@verse3.com</a><br>
        WebMasters:<a href="http://www.mmwebs.com/">MMWebs.com</a></p><!-- #EndLibraryItem -->
      <p>&nbsp;</p>
    </td>
  </tr>
</table>
</body>
</html>

