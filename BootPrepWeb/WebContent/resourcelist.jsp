<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib uri="WEB-INF/tag/custom-functions.tld" prefix="myfn" %>  --%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="sitehead.jsp"%>
<title>&#60;BOOT/PREP&#62; Resource List</title>

</head>
<body>
	<!-- need to figure out how to make this work -->
	<%-- 	<c:if test="${  myfn:contains( resources, resource ) }">style='display:none;'</c:if> --%>

	<%@ include file="sitenavbar.jsp"%>

	<div class="container">
  <h1>Flexbox</h1>
	<!-- card list -->
<div class="cards">

			<c:forEach var="resource" items="${resources}">

				<a class="card" href="#">
			<span class="card-header" style="background-image: url(${resource.photo});">
				<span class="card-title">
					<h3>	${resource.name}</h3>
				</span>
			</span>
			<span class="card-summary">
				${resource.description}
			</span>
		
				<span class="card-meta">
							<c:if test="${userId > 0 && auth == 'true'}">
					 <button class="gap" href="resourceadd.do?resourceId=${resource.id}">Add This Resource</button>
					 			</c:if>
				 			<a href="resourceadd.do?resourceId=${resource.id}">Add Resource!!!!!!</a>
					 	</span>

				</c:forEach>





</div>
	</div>


	<%@ include file="sitefooter.jsp"%>
</body>
</html>
