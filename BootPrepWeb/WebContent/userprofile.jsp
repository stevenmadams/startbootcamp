<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="sitehead.jsp"%>
<title>&#60;BOOT/PREP&#62; ACCOUNT</title>
</head>
<body>
	<%@ include file="sitenavbar.jsp"%>
	<div class="container">


		<c:choose>
			<%-- IF USER ID = NULL --%>
			<c:when test="${userId == 0 || auth != 'true'}">
				<div class="jumbotron">

				<div class="row">
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">Log-in to your account...</h3>
							</div>
							<div class="panel-body">

								<form method="POST" action="userprofile.do">


									<div class="form-group">
										<label for="username">Username</label> <input type="text"
											class="form-control" id="username" placeholder="Username"
											name="username">
									</div>
									<div class="form-group">
										<label for="password">Password</label> <input type="password"
											class="form-control" id="password" placeholder="Password"
											name="password">
									</div>


									<input class="btn btn-default" type="submit" value="LOG IN" />
								</form>
							</div>
						</div>
					</div>

					<div class="col-md-6">


						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">Create an account...</h3>
							</div>
							<div class="panel-body">
								<p>Features:</p>
								<ul>
									<li>Bookmark resources to your profile</li>
									<li>Add notes and ratings to your resources</li>
									<li>Keep track of your progress</li>
								</ul>

								<a role="button" href="usercreate.jsp" class="btn btn-default">Create
									Account</a>
							</div>
						</div>


					</div>
				</div>
			</div>
			</c:when>
			<%-- IF USER ID != NULL --%>
			<c:when test="${userId > 0 && auth == 'true'}">

				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-body">


								<img src="${user.userPhoto}" alt="photo of ${user.username}" class="img-circle img-responsive img-profile center-block">


									<div class="text-center">
								<h1 class="uncapitalize">${user.username}</h1>
								<p>${user.firstName}${user.lastName}</p>
								<p>Start date: ${user.createDate}</p>
								<p>Todays date: ${datetime-local}</p>
								<a class="btn" href="useredit.do?"> <i
									class="fa fa-pencil-square-o fa-lg"></i> Edit Account
								</a>
								<a class="btn" href="userdelete.do?"> <i
									class="fa fa-trash-o fa-lg"></i> Delete Account
								</a>
							</div>
						</div>
					</div>

				</div>

				<div class="col-md-6">

					<div class="panel panel-default">
						<div class="panel-body">
							<h3>Dashboard</h3>
							<hr>
								<div class="row">
									<a class="btn btn-default" role="button" href="useredit.do?">Edit Account</a>
									<a class="btn btn-default" role="button" href="resourcelist.do?view=add">Add a Resource</a>
									<a class="btn btn-default" role="button" href="resourcecreate.jsp">Create New Resource</a>
					</div>
					</div>
				</div>
							<div class="panel panel-default">
								<div class="panel-body">
						<h3>My Resources</h3>
						<hr>
							<c:forEach var="resource" items="${resources}">
								<div class="row">

									<div class="col-xs-10">
										<a href="resource.do?resourceId=${resource.id}">${resource.name}</a>
									</div>
									<div class="col-xs-2">
										<a href="resourceRemove.do?resourceId=${resource.id}&view=profile"><i
											class="fa fa-times-circle" aria-hidden="true"></i></a>
									</div>

								</div>
								<br>
							</c:forEach>



					</div>
				</div>

				</div>
			</c:when>
		</c:choose>

		<c:choose>
			<c:when test="${user.privelege > 0}">

				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<h3>Admin Dashboard</h3>
							<div class="visible-xs">
								<p class="bg-danger">ADMIN DASHBOARD only available on larger devices!</p>
							</div>
								<%-- collapses --%>
								<div class="panel-group  hidden-xs" id="accordion" role="tablist" aria-multiselectable="true">
									  <div class="panel panel-default">
									    <div class="panel-heading" role="tab" id="headingOne">
									      <h4 class="panel-title">
									        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									          REMOVE RESOURCES
									        </a>
									      </h4>
									    </div>
									    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
									      <div class="panel-body">
									        FOR EACH RESOURCE
									      </div>
									    </div>
									  </div>
									  <div class="panel panel-default">
									    <div class="panel-heading" role="tab" id="headingTwo">
									      <h4 class="panel-title">
									        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									          EDIT/REMOVE USER
									        </a>
									      </h4>
									    </div>
									    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
									      <div class="panel-body">
									        TG’s form
									      </div>
									    </div>
									  </div>
									  <div class="panel panel-default">
									    <div class="panel-heading" role="tab" id="headingThree">
									      <h4 class="panel-title">
									        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									          List All Users
									        </a>
									      </h4>
									    </div>
									    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
									      <div class="panel-body">

										LIST OF USERS
											<c:forEach var="resource" items="${resources}">
											<div class="row">
												<div class="col-xs-10">
													<a href="resource.do?resourceId=${resource.id}">${resource.name}</a>
												</div>
												<div class="col-xs-2">
													<a href="resourceRemove.do?resourceId=${resource.id}&view=profile"><iclass="fa fa-times-circle" aria-hidden="true"></i></a>
												</div>
												<hr>
											</div>

										</c:forEach>

									      </div>
									    </div>
									  </div>
									</div>
							</div>
						</div>
					</div>
			</c:when>
		</c:choose>

	</div>
	</div>



	</div>


















	<%@ include file="sitefooter.jsp"%>
</body>
</html>
