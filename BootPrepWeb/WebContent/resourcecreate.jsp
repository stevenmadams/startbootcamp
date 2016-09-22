
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
      <h3 class="panel-title">Create Resource</h3>
    </div>
    <div class="panel-body">
      <p class="bg-danger">${error}</p>
      <form method="post" action="resourceCreate.do">
        <div class="form-group">
          <label for="1">Resource Name*</label>
          <input type="text" class="form-control" name="name" required id="1" maxlength="150">
        </div>
        <div class="form-group">
          <label for="3">Description*</label>
          <input type="text" class="form-control" name="description" required id="3">
        </div>

        <div class="form-group">
          <label for="5">URL*</label>
          <input type="url" class="form-control" name="url" required id="5">
        </div>

        <div class="form-group">
          <label for="2">YouTube Video</label>
          <input type="url" class="form-control" name="video" id="2">
        </div>

        <div class="form-group">
          <label for="6">Cover Photo</label>
          <input type="url" class="form-control" name="photo"  id="6">
        </div>


            <input type="submit" class="btn btn-default" value ="CREATE RESOURCE"/>
      </form>

    </div>
  </div>

</div>
</div>
</div>
<%@ include file="sitefooter.jsp" %>
</body>
</html>
