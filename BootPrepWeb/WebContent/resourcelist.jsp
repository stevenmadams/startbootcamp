<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib uri="WEB-INF/tag/custom-functions.tld" prefix="myfn" %>  --%>
<!DOCTYPE html>
<html>
<head>
<title>&#60;BOOT/PREP&#62; Resource List</title>
<%@ include file="sitehead.jsp" %>

</head>
<body>

<!-- need to figure out how to make this work -->
<%-- 	<c:if test="${  myfn:contains( resources, resource ) }">style='display:none;'</c:if> --%>
	
	<c:forEach var="resource" items="${resources}">
		<p>ID: ${resource.id} Name: ${resource.name}
			<c:forEach var="user" items="${resources.users}">
				<c:if test="${user.id == userId }">
					<c:set var="found" value="true" scope="request"/>
				</c:if>
			</c:forEach>
			***<u>${found}</u>***
		</p>
		<p>URL: ${resource.url} Video: ${resource.video} Image: ${resource.photo}</p>
		<p>Description: ${resource.description}</p>
		
		
		<c:if test="${userId > 0 && auth == 'true'}">
			
		</c:if>
	</c:forEach>
	
<%@ include file="sitenavbar.jsp" %>

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
</body>
</html>