<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title> &#60;BOOT/PREP&#62; HOME</title>
<%@ include file="sitehead.jsp" %>

</head>
<body>
<%@ include file="sitenavbar.jsp" %>
<a href="userprofile.do?id=${userId}">ACCOUNT</a>
<a href="resourcelist.do">List Resources</a>
</body>
</html>
