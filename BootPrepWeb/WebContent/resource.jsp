<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Selected Resource - ${resource.name}</title>
<%@ include file="sitehead.jsp" %>
</head>
<body>
<%@ include file="sitenavbar.jsp" %>
	<p>ID: ${resource.id}</p>
	<p>Name: ${resource.name}</p>
	<p>Description: ${resource.description}</p>
	<p>URL: ${resource.url}</p>
	<p>Video: ${resource.video}</p>
	<p>Image: ${resource.image}</p>

	<c:if test="${! empty userResources}">
		<p>Completed: ${userResources.completed}</p>
		<p>Rating: ${userResources.rating}</p>
		<p>Notes: ${userResources.notes}</p>
	</c:if>

  <%@ include file="sitefooter.jsp" %>
</body>
</html>
