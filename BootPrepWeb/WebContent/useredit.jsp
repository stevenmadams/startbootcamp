<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="sitehead.jsp" %>
<title>&#60;BOOT/PREP&#62; ACCOUNT</title>
</head>
<body>
<%@ include file="sitenavbar.jsp" %>
<div class="container">
<div class="row">

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




	<div class="col-md-6 col-md-offset-3">


	  <div class="panel panel-default">
	    <div class="panel-heading">
	      <h3 class="panel-title">Update account</h3>
	    </div>
	    <div class="panel-body">
	      <form method="post" action="usersubmitedit.do">
	        <div class="form-group">
	          <label for="1">First Name*</label>
	          <input type="text" class="form-control" name="firstName" value="${user.firstName}" required id="1">
	        </div>
	        <div class="form-group">
	          <label for="2">Last Name*</label>
	          <input type="text" class="form-control" name="lastName" value="${user.lastName}" required id="2">
	        </div>
	        <div class="form-group">
	          <label for="3">Username*</label>
	          <input type="text" class="form-control" name="username" value="${user.username}" required id="3">
	        </div>
	        <div class="form-group">
	          <label for="4">Password*</label>
	          <input type="password" class="form-control" name="password" value="${user.password}" required id="4">
	        </div>
	        <div class="form-group">
	          <label for="7">Account Photo URL</label>
	          <input type="url" class="form-control" name="userPhoto" value="${user.userPhoto}"id="7">
	        </div>
	        <div class="form-group">
	          <label for="5">E-mail*</label>
	          <input type="email" class="form-control" name="email" value="${user.email}" required id="5">
	        </div>
	        <div class="form-group">
	          <label for="6">Bootcamp Start Date (optional)</label>
	          <input type="date" class="form-control" name="createDate" value="${user.createDate}" id="6">
	        </div>
	            <input type="submit" class="btn btn-default" value ="UPDATE ACCOUNT"/>
	      </form>

	    </div>
	  </div>






	</div>
</c:when>
</c:choose>
	</div>
	</div>


<%@ include file="sitefooter.jsp" %>
</body>
</html>
