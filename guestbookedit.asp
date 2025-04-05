<%
Set DbConn = Server.CreateObject("ADODB.Connection")
      Smpath = "DBQ=" & Server.Mappath("cgi-bin/verse3.mdb")
      DbConn.Open "DRIVER={Microsoft Access Driver (*.mdb)}; " & Smpath

GuestBookName = Replace(Request.Form("GuestBookName"), "'", "''")
GuestBookEmail = Replace(Request.Form("GuestBookEmail"), "'", "''")
GuestBookComment = Replace(Request.Form("GuestBookComment"), "'", "''")
GuestBookDate = Date

mySQL = "SELECT * FROM Verse3 WHERE GuestBookID = "&Request("GuestBookID")&" "
	Set rsGuest = DbConn.Execute(mySQL)

RequestMethod=Request.ServerVariables("REQUEST_METHOD")

If RequestMethod="POST" Then

mySQL = "UPDATE verse3 SET GuestBookName = '" & GuestBookName & "', GuestBookEmail = '" & GuestBookEmail & "', GuestBookComment = '" & GuestBookComment & "' "
	mySQL = mySQL & "WHERE GuestBookID =" & Request("GuestBookID")

DbConn.Execute(mySQL)

Response.Redirect("guestbookadmin.asp")

end if
%>

<html>
<head>
<title>Verse:3 Admin</title>
</head>
<body OnLoad="document.edit.GuestBookName.focus();">

<H3>Sign Our Guestbook:</H3>
	<FORM METHOD="post" name="edit">
	<TABLE>
		<TR>
		<TD ALIGN="right"><B>Name:</B></TD>
		<TD><INPUT TYPE="text" NAME="GuestBookName" SIZE="15" value="<%= rsGuest("GuestBookName")%>"></INPUT></TD>
		</TR>
		<TR>
		<TD ALIGN="right"><B>E-Mail:</B></TD>
		<TD><INPUT TYPE="text" NAME="GuestBookEmail" SIZE="15" value="<%= rsGuest("GuestBookEmail")%>"></INPUT></TD>
		</TR>
		<TR>
		<TD ALIGN="right"><B>Comment:</B></TD>
		<TD><textarea NAME="GuestBookComment" cols="40" rows="5" Wrap="hard"><%= rsGuest("GuestBookComment")%></textarea></TD>
		</TR>
	</TABLE>
	<INPUT TYPE="submit" VALUE="Edit Entry"></INPUT><INPUT TYPE="reset" VALUE="Reset"></INPUT>
	</FORM>

	</td>
</tr>
</table>    	

</body>

</html>