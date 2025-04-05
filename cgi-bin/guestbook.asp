<%
' This is used to control whether or not we empty the guestbook at
' the first hit after midnight.  We do it just to keep the list
' short.  You'll probably want to set this to False
Const bDeleteEntries = FALSE

' Allows us to easily clear the guestbook if we notice someone is
' getting rude!  All you need to do is pass it ?force=anything
' Possibly something else you might not want. To disable it comment
' out the Request.QueryString line and uncomment the "" one.
Dim bForce
'bForce = Request.QueryString("force")
bForce = ""

' Now that we're done implementing features you probably won't want,
' let's get to the actual script...
Dim strFile ' String variable to store the path / file we write to
' I use MapPath here to make the script somewhat location independent.
' If I specified the physical path, you'd need to edit it to run this
' on your own server.  This way it should work fine as long as it's in
' the same directory as the guestbook file.  The include line also
' needs to be changed if you change this!  This file needs to exist
' BEFORE you run this script!
strFile = Server.MapPath("guestbook.txt")

' If the script doesn't have anything posted to it we display the form
' otherwise we process the input and append it to the guestbook file.
If Request.Form.Count = 0 Then
	' Display the entry form.
	%> 
	
<html>
<head>
<title>Verse:3--GuestBook</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
-->
</style><link rel="stylesheet" href="../css/verse3.css"></head>

<body  background="../images/verse3back.gif">
<table width="600" border="0">
  <tr> 
    <td width="138">&nbsp;</td>
    <td width="446"><img src="../images/verse3logo.gif" width="378" height="92"></td>
  </tr>
  <tr> 
    
</table>
<table width="600" border="0">
  <tr>
    <td><img src="../images/horBarT.gif" width="720" height="4"></td>
</tr>
</table>
 
      <table width="800" border="0">
        <tr>
	      <td width="120">&nbsp;</td>
          <td width="680"><a href="../verse3.htm">News</a> - <a href="../band.htm">Band</a> - <a href="../music.htm">Music</a> 
            - <a href="../photos.htm">Photos</a> - <a href="../cgi-bin/contact.asp">Contact</a> - <a href="../links.htm">Links/Affiliates</a>  </td>
        </tr>
      </table>
<table width="640" border="0">
  <tr>
    <td><img src="../images/horBarM.gif" width="680" height="4"></td>
</tr>
</table> 
<table width="800" border="0">
        <tr>
		  <td width="120">&nbsp;</td> 
          <td width="680"><a href="../cgi-bin/guestbook.asp">Guest Book</a></td>
        </tr>
      </table> 
      <table width="640" border="0">
  <tr>
    <td><img src="../images/horBar.gif" width="640" height="4"></td>
</tr>
</table>
<table width="700" border="0">

    <td width="138">&nbsp;</td>
    <td width="472" valign="top">
   <P>
   	<H3>Sign Our Guestbook:</H3>
	<FORM ACTION="guestbook.asp" METHOD="post">
	<TABLE>
		<TR>
		<TD ALIGN="right"><B>Name:</B></TD>
		<TD><INPUT TYPE="text" NAME="name" SIZE="15"></INPUT></TD>
		</TR>
		<TR>
		<TD ALIGN="right" valign="top"><B>Comment:</B></TD>
		<TD><textarea NAME="comment" cols="40" rows="5" Wrap="hard"></textarea><P>
		<span class="button"><INPUT TYPE="submit" VALUE="Sign Guestbook!"></span>
	</FORM></TD>
		</TR>
	</TABLE>
	
	</td>
	</tr>
	</table>
	<BR>
	<table width="600" border="0">
  	 <tr>
    <td width="138">&nbsp;</td>
    <td width="472" valign="top"> 
	<H3>Fan's Comments:</H3>
	<!-- Instead of doing this in script, I simply include
			the guestbook file as is -->
	<!--#INCLUDE FILE="guestbook.txt"-->
	</td>
	</tr>
	</table>
	<%
Else
	' Log the entry to the guestbook file
	Dim objFSO  'FileSystemObject Variable
	Dim objFile 'File Object Variable
	
	' Create an instance of the FileSystemObject
	Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
	' Open the TextFile (FileName, ForAppending, AllowCreation)
	Set objFile = objFSO.OpenTextFile(strFile, 8, True)

	' Log the results
	' I simply bold the name and do a <BR>.
	' You can make it look however you'd like.
	' Once again I remind readers that we by no means claim to
	' be UI experts.  Although one person did ask us if we had a
	' graphic designer!  I laughed so hard that I almost hurt myself!
	'objFile.Write "<table width=600 border=0>"
	'objFile.Write "<tr>"
	'objFile.Write "<td width=138>&nbsp;"
	'objFile.Write "</td>"
	'objFile.Write "<td width=446 valign=top>"
	objFile.Write "<B>"
	objFile.Write Server.HTMLEncode(Request.Form("name"))
	objFile.Write ":</B> "
	objFile.Write Server.HTMLEncode(Request.Form("comment"))
	objFile.Write "<BR>"
	objFile.WriteLine ""
	'objFile.Write "</td>"
	'objFile.Write "</tr>"
	'objFile.Write "</table>"
	
	' Close the file and dispose of our objects
	objFile.Close
	Set objFile = Nothing
	Set objFSO = Nothing

	' Tell people we've written their info
	%>
	</td>
	</tr>
	</table>
	<html>
<head>
<title>Verse:3--GuestBook</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
-->
</style><link rel="stylesheet" href="../css/verse3.css"></head>

<body  background="../images/verse3back.gif">
	<body  background="../images/verse3back.gif">
	<table width="600" border="0">
  <tr> 
    <td width="138">&nbsp;</td>
    <td width="446"><img src="../images/verse3logo.gif" width="378" height="92"></td>
  </tr>
  <tr> 
    
</table>
<table width="600" border="0">
  <tr>
    <td><img src="../images/horBarT.gif" width="720" height="4"></td>
</tr>
</table>
 
      <table width="800" border="0">
        <tr>
	      <td width="120">&nbsp;</td>
          <td><a href="../verse3.htm">News</a> - <a href="../band.htm">Band</a> - <a href="../music.htm">Music</a> 
            - <a href="../photos.htm">Photos</a> - <a href="../cgi-bin/contact.asp">Contact</a> - <a href="../links.htm">Links/Affiliates</a>  </td>
        </tr>
      </table>
<table width="640" border="0">
  <tr>
    <td><img src="../images/horBarM.gif" width="680" height="4"></td>
</tr>
</table> 
<table width="800" border="0">
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
    <td width="446" valign="top"> 
	
	<H3>Your comments have been written to the file!</H3>
	<A HREF="./guestbook.asp">Back to the guestbook</A>	 
	</td>
	</tr>
	</table>
	</body>
	</html>
	<%
End If

' We do this to delete the file every day to keep it managable.
' If you were doing this for real you probably wouldn't want to
' do this so we have defined a const named bDeleteEntries at the
' top of the script that you can set to False to prevent this
' section from running.  You could also delete this whole
' If Then....End If block if you'd like.  Just be sure to leave
' the script delimiter at the bottom!
If bDeleteEntries Then
	Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
	Set objFile = objFSO.GetFile(strFile)
	If DateDiff("d", objFile.DateLastModified, Date()) <> 0 Or bForce <> "" Then
		Set objFile = Nothing		
		' Can't use delete because we need the file to exist for
		' the include the next time the script is run!
		'objFile.Delete
		
		' Create a file overwriting old one.
		Set objFile = objFSO.CreateTextFile(strFile, True)

		' The include barks if the file's empty!
		objFile.Write "<B>John:</B> "
		objFile.WriteLine "I hope you like our guestbook!<BR>"
		objFile.Close
	End If
	Set objFile = Nothing
	Set objFSO = Nothing
End If
%> 
<!-- Footer of Page -->
<table width="600" border="0">
  	 <tr>
   							    <td height="498" width="138">&nbsp;</td>
    <td width="446" valign="top">
	<hr> 
 <!-- #BeginLibraryItem "/Library/copy.lbi" -->
      <p>copyright 1999 all rights reserved<br>
        all music and lyrics written by Verse:3 unless noted by *<br>
        E-mail:<a href="mailto:verse3@verse3.com">verse3@verse3.com</a><br>
        WebMasters:<a href="http://www.mmwebs.com/">MMWebs.com</a></P><!-- #EndLibraryItem --> 
      
      <p>&nbsp; </p>
            
    </td>
  </tr>
</table>
</body>
</html>
