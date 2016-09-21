<!DOCTYPE html>
<html>
<head>

<%@ include file="sitehead.jsp" %>
<title> &#60;BOOT/PREP&#62; ACCOUNT</title>
</head>
<body>
<%@ include file="sitenavbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-6 col-md-offset-3">


  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title">Delete account</h3>
    </div>
    <div class="panel-body">
      <form method="post" action="userdelete.do">
        <div class="form-group">
          <label for="3">Username*</label>
          <input type="text" class="form-control" name="username" required id="3">
        </div>
        <div class="form-group">
          <label for="4">Password*</label>
          <input type="password" class="form-control" name="password" required id="4">
        </div>
            <input type="submit" class="btn btn-default" value ="DELETE ACCOUNT"/>
      </form>

    </div>
  </div>






</div>
</div>
</div>
<%@ include file="sitefooter.jsp" %>
</body>
</html>
