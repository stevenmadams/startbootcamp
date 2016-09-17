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
        <div class="one centered half">
          <div class="align-center">
            <h3>LOG IN</h3>
            <form method="POST" action="userprofile.do">
                Username<input type="text" name="username"/>
                Password<input type="password" name="password"/>
              <input class="gapped" type="submit" value ="LOG IN"/>
            </form>

          </div>

        </div>
        <div class="one half">
          <a role="button" href="usercreate.jsp" rel="author" class="gapped gap-bottom gap-right">Create Account</a>
        </div>
      </div>




    </div>



    </c:when>
    <%-- IF USER ID != NULL --%>
    <c:when test="${userId > 0 && auth == 'true'}">
        <p>${user}</p>
        <a href="useredit.do?">EDIT ACCOUNT</a>
    </c:when>
</c:choose>

</div>
</body>
</html>
