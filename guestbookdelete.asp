<%
Set DbConn = Server.CreateObject("ADODB.Connection")
      Smpath = "DBQ=" & Server.Mappath("cgi-bin/verse3.mdb")
      DbConn.Open "DRIVER={Microsoft Access Driver (*.mdb)}; " & Smpath

mySQL = "SELECT * FROM Verse3 WHERE GuestBookID = "&Request("GuestBookID")&" "
	Set rsGuest = DbConn.Execute(mySQL)

mySQL = "DELETE FROM Verse3 WHERE GuestBookID = "&Request("GuestBookID")&" "
DbConn.Execute(mySQL)

Response.Redirect("guestbookadmin.asp")

%>
