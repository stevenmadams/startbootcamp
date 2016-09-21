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
      <h3 class="panel-title">Create account</h3>
    </div>
    <div class="panel-body">
      <form method="post" action="usercreate.do">
        <div class="form-group">
          <label for="1">First Name*</label>
          <input type="text" class="form-control" name="firstName" required id="1">
        </div>
        <div class="form-group">
          <label for="2">Last Name*</label>
          <input type="text" class="form-control" name="lastName" required id="2">
        </div>
        <div class="form-group">
          <label for="3">Username*</label>
          <input type="text" class="form-control" name="username" required id="3">
        </div>
        <div class="form-group">
          <label for="4">Password*</label>
          <input type="password" class="form-control" name="password" required id="4">
        </div>
        <div class="form-group">
          <label for="7">DONT USE YET *** Account Photo URL</label>
          <input type="url" class="form-control" name="" id="7">
        </div>
        <div class="form-group">
          <label for="5">E-mail*</label>
          <input type="email" class="form-control" name="email" required id="5">
        </div>
        <div class="form-group">
          <label for="6">Bootcamp Start Date (optional)</label>
          <input type="date" class="form-control" name="createDate" id="6">
        </div>
            <input type="submit" class="btn btn-default" value ="CREATE ACCOUNT"/>
      </form>

    </div>
  </div>






</div>
</div>
</div>
<%@ include file="sitefooter.jsp" %>
</body>
</html>
