<!DOCTYPE html>
<html>
<head>
<title> &#60;BOOT/PREP&#62; ACCOUNT</title>
<%@ include file="sitehead.jsp" %>

</head>
<body>
<%@ include file="sitenavbar.jsp" %>
<h3>Create account</h3>
<form method="post" action="usercreate.do">
  First:<input type="text" name="firstName">
    Last:<input type="text" name="lastName">
    Username:<input type="text" name="username">
      Password:<input type="password" name="password">
      E-Mail:<input type="email" name="email">
      Bootcamp start date: <input type="date" name="createDate">
      <input type="submit" value ="CREATE ACCOUNT"/>
</form>

<%@ include file="sitefooter.jsp" %>
</body>
</html>
