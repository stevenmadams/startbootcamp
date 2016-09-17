<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>&#60;BOOT/PREP&#62; ACCOUNT</title>
<%@ include file="sitehead.jsp" %>

</head>
<body>
<%@ include file="sitenavbar.jsp" %>

	<c:choose>
		<%-- IF USER ID = NULL --%>
		<c:when test="${userId == 0 || auth != 'true'}">
			<h3>LOG IN</h3>
			<form method="POST" action="userprofile.do">
				Username<input type="text" name="username" /> Password<input
					type="password" name="password" /> <input type="submit"
					value="LOG IN" />
			</form>
			<a href="usercreate.html">CREATE ACCOUNT</a>
		</c:when>
		<%-- IF USER ID != NULL --%>
		<c:when test="${userId > 0 && auth == 'true'}">
			<h3>Edit account</h3>
			<form method="post" action="usersubmitedit.do">
				First:<input type="text" name="firstName" value="${user.firstName}">
				Last:<input type="text" name="lastName" value="${user.lastName}">
				Username:<input type="text" name="username" value="${user.username}">
				<%-- Password:<input type="password" name="password">  --%>
				E-Mail:<input type="email" name="email" value="${user.email}">
				Bootcamp start date: <input type="date" name="createDate"
					value="${user.createDate}"> <input type="submit"
					value="SUBMIT CHANGES" />
			</form>
		</c:when>
	</c:choose>


<%@ include file="sitefooter.jsp" %>
</body>
</html>
