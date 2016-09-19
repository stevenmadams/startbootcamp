<!DOCTYPE html>
<html>
<head>

<%@ include file="sitehead.jsp" %>
<title> &#60;BOOT/PREP&#62; ACCOUNT</title>
</head>
<body>
<%@ include file="sitenavbar.jsp" %>
<h3>Create account</h3>
<form method="post" action="usercreate.do">
  First:<input type="text" name="firstName" required >
    Last:<input type="text" name="lastName" required>
    User name:<input type="text" name="username" required>
      Password:<input type="password" name="password" required>
      E-Mail:<input type="email" name="email" required>
      Boot camp start date: <input type="date" name="createDate">
      <input type="submit" value ="CREATE ACCOUNT"/>
</form>

<%@ include file="sitefooter.jsp" %>
</body>
</html>
