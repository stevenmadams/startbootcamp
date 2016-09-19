<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="sitehead.jsp" %>
<title>Selected Resource - ${resource.name}</title>
</head>
<body>
<%@ include file="sitenavbar.jsp" %>
	<p>ID: ${resource.id}</p>
	<p>Name: ${resource.name}</p>
	<p>Description: ${resource.description}</p>
	<p>URL: ${resource.url}</p>
	<p>Video: ${resource.video}</p>
	<p>Image: ${resource.photo}</p>

	<%-- User Data Area --%>
	<c:if test="${userId > 0 && auth == 'true'}">
		<form action="userDataUpdate.do" method="post">
			<p>Completed: ${userData.completed}</p>
			<p>Rating: ${userData.rating}</p>
			<textarea name="notes">${userData.notes}</textarea>
			<input type="hidden" name="resourceId" value="${resource.id}">
			<input type="submit" value="Update">
		</form>
		
	</c:if>

  <%@ include file="sitefooter.jsp" %>
</body>
</html>
