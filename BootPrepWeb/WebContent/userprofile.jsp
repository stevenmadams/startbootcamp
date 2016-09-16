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




<c:choose>
    <%-- IF USER ID = NULL --%>
    <c:when test="${empty user}">
        <h3>LOG IN</h3>
        <form method="GET" action="userprofile.do">
            Username<input type="text" name="username"/>
            Password<input type="password" name="password"/>
          <input type="submit" value ="LOG IN"/>
        </form>
        <a href="usercreate.html">CREATE ACCOUNT</a>
    </c:when>
    <%-- IF USER ID != NULL --%>
    <c:when test="${! empty user}">
        <p>${user}</p>
    </c:when>
</c:choose>

</body>
</html>
