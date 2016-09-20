<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="myfn" uri="http://samplefn"%>
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

	<div class="containercards">
	<c:choose>
<%-- IF USER IS LOGGED IN --%>
		<c:when test="${userId > 0 && auth == 'true'}">
<div class="row">
	<div class="text-center">
			<a class="btn btn-default" role="button" href="resourcelist.do?view=add">Add resources</a>
			<a class="btn btn-default" role="button" href="resourcelist.do?view=my">My resources</a>
			</div>
			</div>

			<%-- ADD RESOURCES --%>
			<div class="cards">

				<c:forEach var="resource" items="${resources}">
					
					<div class="card">
						<span class="card-header"
							style="background-image: url(${resource.photo});"> <a
							href="resource.do?resourceId=${resource.id}"> <span
								class="card-title">
									<h3>${resource.name}</h3>
							</span></span> <span class="card-summary"> ${resource.description} 
							
							</span> </a> <span
							class="card-meta">
							
						<c:if test="${userId > 0 && auth == 'true'}">

							<c:choose>
								<%-- IF USER HAS THIS RESOURCE --%>
								<c:when test="${add != 'true'}">
									<a class="btn btn-default" role="button" href="resource.do?resourceId=${resource.id}">
										View This Resource
									</a>
								</c:when>
								<%-- IF USER DOESNT HAVE THIS RESOURCE --%>
								<c:when test="${add == 'true'}">
									<a class="btn btn-default" role="button" href="resourceadd.do?resourceId=${resource.id}">
										Add This Resource
									</a>
								</c:when>
							</c:choose>
						</c:if>

						</span>
					</div>
				</c:forEach>


			<%-- MY RESOURCES --%>




</c:when>

<%-- IF USER IS A GUEST --%>
	<c:when test="${userId == 0 || auth != 'true'}">
		<div class="cards">

			<c:forEach var="resource" items="${resources}">
				
				<div class="card">
					<span class="card-header"
						style="background-image: url(${resource.photo});"> <a
						href="resource.do?resourceId=${resource.id}"> <span
							class="card-title">
								<h3>${resource.name}</h3>
						</span></span> <span class="card-summary"> ${resource.description} 
							<p>
								Tags:
								<c:forEach var="tag" items="${resource.tags}">
									${tag.name} 
								</c:forEach>
							</p>
						</span> </a> <span
						class="card-meta">
								<a class="btn btn-default" role="button" href="userprofile.do">Create an account</a>

					</span>
				</div>
			</c:forEach>





		</div>


</c:when>
</c:choose>
	</div>


	<%@ include file="sitefooter.jsp"%>
</body>
</html>
