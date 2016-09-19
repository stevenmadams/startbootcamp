<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title> &#60;BOOT/PREP&#62; ACCOUNT</title>
<%@ include file="sitehead.jsp" %>

</head>
<body>
<%@ include file="sitenavbar.jsp" %>

<div class="container">


<c:choose>
    <%-- IF USER ID = NULL --%>
    <c:when test="${userId == 0 || auth != 'true'}">


      <div class="row">
        <div class="one half">
          <div class="triple-gapped">
            <h3>Log in to your account...</h3>
            <form method="POST" action="userprofile.do">
             <label for="username">Username</label> 
                <input type="text" name="username"/>
          <label for="password">Password</label>
                <input type="password" name="password"/>
              <input class="double-gap-top double-gap-bottom" type="submit" value ="LOG IN"/>
            </form>

          </div>

        </div>
        <div class="one half">
          <div class="triple-gapped">
            <h3>Create an account...</h3>
            <p>Features:</p>
            <ul>
              <li>Bookmark resources to your profile</li>
              <li>Add notes and ratings to your resources</li>
              <li>Keep track of your progress</li>
            </ul>

          <a role="button" href="usercreate.jsp" rel="author" class="double-gap-top double-gap-bottom">Create Account</a>
        </div>
        </div>
      </div>
    </div>



    </c:when>
    <%-- IF USER ID != NULL --%>
    <c:when test="${userId > 0 && auth == 'true'}">
        <p>${user}</p>
        <a href="useredit.do?">EDIT ACCOUNT</a>
        
        <a href="userListResources.do">List My Study Materials</a>
        
        <a href="resourcecreate.jsp">Create a new Study Resource</a>
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
</body>
</html>
