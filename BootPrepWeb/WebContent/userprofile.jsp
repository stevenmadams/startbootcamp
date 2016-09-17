<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title> &#60;BOOT/PREP&#62; ACCOUNT</title>
<%@ include file="sitehead.jsp" %>

</head>
<body>
<%@ include file="sitenavbar.jsp" %>




<c:choose>
    <%-- IF USER ID = NULL --%>
    <c:when test="${userId == 0 || auth != 'true'}">
        <h3>LOG IN</h3>
        <form method="POST" action="userprofile.do">
            Username<input type="text" name="username"/>
            Password<input type="password" name="password"/>
          <input type="submit" value ="LOG IN"/>
        </form>
        <a href="usercreate.html">CREATE ACCOUNT</a>
    </c:when>
    <%-- IF USER ID != NULL --%>
    <c:when test="${userId > 0 && auth == 'true'}">
        <p>${user}</p>
        <a href="useredit.do?">EDIT ACCOUNT</a>
    </c:when>
</c:choose>

</body>
</html>
