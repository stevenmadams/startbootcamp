<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/custom.tld" prefix="jdm" %> <!-- this line either -->
<!DOCTYPE html>
<html>
<head>
<title>&#60;BOOT/PREP&#62; Resource List</title>
<%@ include file="sitehead.jsp" %>

</head>
<body>
<%@ include file="sitenavbar.jsp" %>
<!-- shouldnt need this line -->
	<c:if test="${  jdm:contains( resources, resource ) }">style='display:none;'</c:if>
	<div class="container">
	<div class="cards">
	<c:forEach var="resource" items="${resources}">
		<a class="card" href="#">
			<span class="card-header" style="background-image: url(${resource.photo});">
				<span class="card-title">
					<h3>${resource.name}</h3>
				</span>
			</span>
			<span class="card-summary">
			${resource.description}
			</span>
			<span class="card-meta">
				<c:if test="${userId > 0 && auth == 'true'}">
                THIS IS WHERE THE ADD BUTTON WILL GO!
				</c:if>
			</span>
		</a>

	</c:forEach>
</div>
</div>

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

	<%@ include file="sitefooter.jsp" %>
</body>
</html>
