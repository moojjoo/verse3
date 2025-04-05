<html>
<head>
<title>emailform</title>
</head>
<body>
<form method="post" action="SendMail.asp">
   Complete this form and click the submit-button. We will answer your
   questions as soon as possible.
   <br><br>
   Your name<br>
   <input type="text" size="25" name="name"><br>
   
   Your email<br>
   <input type="text" size="25" name="email"><br>   Recipient email<br>
   <input type="text" size="25" name="recipient"><br> State your business<br>
   <select name="subject" size="1">
    <option value="help">help
       <option value="tips">tips
       <option value="other">other
   </select>
   <br> Enter your question<br>
   <textarea name="body" cols="40" rows="15" wrap="PHYSICAL"></textarea>
   <br>
   <input type="submit" value="  Submit ">
</form>
</body>
</html>