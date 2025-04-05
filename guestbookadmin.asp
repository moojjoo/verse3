<%
Set DbConn = Server.CreateObject("ADODB.Connection")
      Smpath = "DBQ=" & Server.Mappath("cgi-bin/verse3.mdb")
      DbConn.Open "DRIVER={Microsoft Access Driver (*.mdb)}; " & Smpath

mySQL = "SELECT * FROM Verse3 WHERE GuestBookID"

Set rsGuest =  DbConn.Execute(mySQL)
%>


<HTML>

<HEAD>
<TITLE>Verse:3 GuestBook</TITLE>
</HEAD>

<BODY>
<h4>Verse:3 GuestBook</h4>

	<TABLE border="1">

<%
  do while not rsGuest.EOF
    Response.Write "<TR align=center><TD>"
    Response.Write "<A HREF=""guestbookedit.asp?Action=Edit&GuestBookID=" & rsGuest("GuestBookID") & """>"
    Response.Write "<img src=images/edit.gif border=0>"
    Response.Write "</a></TD><TD align=left>"
    Response.Write rsGuest("GuestBookDate")
	Response.Write "</TD><TD>"
	Response.Write "<A HREF=""mailto:" & rsGuest("GuestBookEmail") & """>"
	Response.Write "" & rsGuest("GuestBookEmail")
	Response.Write "</a></TD><TD colspan=2 width=400 align=left><b>"
	Response.Write "&nbsp;" & rsGuest("GuestBookName")
	Response.Write " : </b>"
	Response.Write "&nbsp;" & rsGuest("GuestBookComment")
	Response.Write "</TD><TD>"
	Response.Write "<A HREF=""guestbookdelete.asp?Action=Edit&GuestBookID=" & rsGuest("GuestBookID") & ""
	Response.Write """ onClick=""return confirm('Verse:3 are you sure you want to delete?')"">"
	Response.Write "<img src=images/delete.gif border=0>"
    Response.Write "</a></TD>"
	 rsGuest.MoveNext
  loop
  rsGuest.close

  DbConn.close
  Set  DbConn = nothing

%>

	</TR>
</TABLE>



</BODY>
</HTML>
