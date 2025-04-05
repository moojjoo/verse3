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

<link rel="stylesheet" href="css/verse3.css">


</HEAD>

<BODY bgcolor="black">
<h1>Verse:3 GuestBook</h1>

	<TABLE border="0" width=400>

<%
  do while not rsGuest.EOF
    Response.Write "<TR align=center><TD align=left>"
    Response.Write rsGuest("GuestBookDate")
	Response.Write "</TD><TD>"
	Response.Write "<A HREF=""mailto:" & rsGuest("GuestBookEmail") & """>"
	Response.Write rsGuest("GuestBookEmail")
	Response.Write "</a></TD></TR><TR><TD colspan=2 width=400><b>"
	Response.Write rsGuest("GuestBookName")
	Response.Write " : </b>"
	Response.Write rsGuest("GuestBookComment")
	Response.Write "</TD></tr><tr><TD colspan=2 width=400>&nbsp;</td>"
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
