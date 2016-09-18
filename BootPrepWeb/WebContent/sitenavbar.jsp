
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp"> <img  src="img/bootprepicon.png"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="index.jsp">Home</a></li>
          <li><a href="resourcelist.do">Resources</a></li>
        <li><a href="userprofile.do?id=${userId}">Account</a></li>

      </ul>
  <%-- IF STATEMENTS TO SHOW USER IS LOGGED IN - MENU ITEMS: PROFILE / MY RESOURCES / etc... --%>
  <ul class="nav navbar-nav navbar-right">
  <c:choose>
      <%-- IF USER ID = NULL --%>

      <c:when test="${userId == 0 || auth != 'true'}">
        <p class="navbar-text"><a class="btn btn-default" href="usercreate.jsp" role="button">Create Account</a>
          <a class="btn btn-default" href="userprofile.jsp" role="button">Log In</a></p>

      </c:when>
      <%-- IF USER ID != NULL --%>
      <c:when test="${userId > 0 && auth == 'true'}">
          <p class="navbar-text">Logged in as: ${user.username}</p>
          <a class="btn btn-default" href="userprofile.do?id=null" role="button">Log Out</a>
     	</c:when>
  	</c:choose>






      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
