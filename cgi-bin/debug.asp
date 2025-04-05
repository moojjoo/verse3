<TITLE>debug.asp</TITLE>
<body bgcolor="#FFFFFF">
<HTML>
<!-- from http://www.activeserverpages.com/tutorial/http.asp -->
<% 
Response.Write("<P>FORM VARIABLES:<br>")
Response.Write("----------------<br>")
For Each Key in Request.Form
Response.Write( Key & " = " & Request.Form(Key) & "<br>")
Next
Response.Write("<P>QUERY STRING VARIABLES:<br>")
Response.Write("-----------------------<br>")
For Each Key in Request.QueryString
Response.Write( Key & " = " & Request.QueryString(Key) & "<br>")
Next
Response.Write("<P>COOKIE VARIABLES:<br>")
Response.Write("-----------------<br>")
For Each Key in Request.Cookies
Response.Write( Key & " = " & Request.Cookies(Key) & "<br>")
Next
Response.Write("<P>SERVER VARIABLES:<br>")
Response.Write("-----------------<br>")
For Each Key in Request.ServerVariables
Response.Write( Key & " = " & Request.ServerVariables(Key) & "<br>")
Next
%>
</BODY>
</HTML>
