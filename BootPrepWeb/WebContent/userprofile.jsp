<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> &#60;BOOT/PREP&#62; ACCOUNT</title>
</head>
<body>
<%-- IF USER ID = NULL --%>
<h3>LOG IN</h3>
<form method="GET" action="userprofile.do">
<input type="text" name="username"/>
  <input type="password" name="password"/>
  <input type="submit" value ="LOG IN"/>
</form>
<a href="usercreate.html">CREATE ACCOUNT</a>
<%-- IF USER ID != NULL --%>


</body>
</html>
