<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="sitehead.jsp" %>
<title> &#60;BOOT/PREP&#62; ACCOUNT</title>
</head>
<body>
<%@ include file="sitenavbar.jsp" %>

<div class="container">


<c:choose>
    <%-- IF USER ID = NULL --%>
    <c:when test="${userId == 0 || auth != 'true'}">


      <div class="row">
        <div class="col-md-6">
          <div class="triple-gapped">
            <h3>Log in to your account...</h3>
            <form method="POST" action="userprofile.do">


                <div class="form-group">
                  <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" placeholder="Username" name="username">
                  </div>
                  <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Password" name="password">
                  </div>


              <input class="btn btn-default" type="submit" value ="LOG IN"/>
            </form>

          </div>

        </div>
        <div class="col-md-6">
          <div class="triple-gapped">
            <h3>Create an account...</h3>
            <p>Features:</p>
            <ul>
              <li>Bookmark resources to your profile</li>
              <li>Add notes and ratings to your resources</li>
              <li>Keep track of your progress</li>
            </ul>

          <a role="button" href="usercreate.jsp" class="btn btn-default">Create Account</a>
        </div>
        </div>
      </div>




    </c:when>
    <%-- IF USER ID != NULL --%>
    <c:when test="${userId > 0 && auth == 'true'}">
            <div class="col-md-6">
              <div class="panel panel-default">
  <div class="panel-body">
    <div class="text-center">
        <h1>${user.username}</h1>
        <p>${user.firstName} ${user.lastName}</p>
      </div>
    </div>
      </div>

            <div class="col-md-6">
        <a href="useredit.do?">EDIT ACCOUNT</a>

        <a href="userListResources.do">List My Study Materials</a>
      </div>
   	</c:when>
	</c:choose>

<c:choose>
	<c:when test="${! empty resources}">

		<c:forEach var="resource" items="${resources}">
			<p>
				<a href="resource.do?resourceId=${resource.id}">${resource.name}</a>
				<a href="resourceRemove.do?resourceId=${resource.id}">Remove</a>
			</p>

		</c:forEach>
	</c:when>
</c:choose>

</div>
</div>

	<%@ include file="sitefooter.jsp"%>
</body>
</html>
