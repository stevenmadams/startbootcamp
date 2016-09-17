<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>&#60;BOOT/PREP&#62; Resource List</title>
</head>
<body>
	<table border="0">
		<tr>
			<th>Title</th>
			<th>Description</th>
			<th>Link</th>
			<th>Video</th>
			<th>Photo</th>
		</tr>
		<tr>
			<td>${resource.name}</td>
			<td>${resource.description}</td>
			<td>${resource.url}</td>
			<td>${resource.video}</td>
			<td>${resource.photo}</td>
		</tr>
		<tr>
			<c:choose>
				<%-- IF Resource ID = NULL --%>
				<c:when test="${empty resource_id}">
					<p>Please re-enter a selection:</p>
				</c:when>
				<c:otherwise>
					<%-- IF Resource ID != NULL --%>
					<c:when test="${! empty resource_id}">
						<p>${resource}</p>
					</c:when>
				</c:otherwise>
			</c:choose>
		</tr>
	</table>
</body>
</html>