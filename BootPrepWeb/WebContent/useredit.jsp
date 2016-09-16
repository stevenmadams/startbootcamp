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
<h3>Create account</h3>
<form method="post" action="usersubmitedit.do">
  First:<input type="text" name="firstName" value="${user.firstName}">
    Last:<input type="text" name="lastName" value="${user.lastName}">
    Username:<input type="text" name="username" value="${user.username}">
      <%-- Password:<input type="password" name="password">  --%>
      E-Mail:<input type="email" name="email" value="${user.email}">
      Bootcamp start date: <input type="date" name="startDate" value="${user.startDate}">
      <input type="submit" value ="SUBMIT CHANGES"/>
</form>


</body>
</html>
