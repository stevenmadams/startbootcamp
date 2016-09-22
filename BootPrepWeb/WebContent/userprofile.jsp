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
						  <img class="img-responsive logohalf center-block" src="img/biglogo.png">
					</div>
				<div class="row">
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">Log-in to your account...</h3>
							</div>
							<div class="panel-body">
								<p class="bg-danger">${error}</p>
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
								<h1 class="uncapitalize"><i class="fa fa-user" aria-hidden="true"></i> ${user.username}</h1>
								<p>${user.firstName} ${user.lastName}</p>
								<p>Start date: ${user.createDate}</p>
								<p>Todays date: ${datetime-local}</p>


								<a class="btn btn-default" role="button" data-toggle="collapse" href="#deletepanel" aria-expanded="false" aria-controls="deletepanel">
  							<i class="fa fa-trash-o fa-lg"></i> Delete Account
								</a>
								<div class="collapse" id="deletepanel">
										<div class="well text-center">
											<form action="userdelete.do?" method="post">
												<input type="checkbox" required="require"> Are you sure? <br>
												<input class="btn btn-danger" type="submit" value="DELETE ACCOUNT">
											</form>
											</div>
										</div>

							</div>
						</div>
					</div>

				</div>

				<div class="col-md-6">

					<div class="panel panel-default">
						<div class="panel-body">
							<h3><i class="fa fa-tachometer" aria-hidden="true"></i> Dashboard</h3>
							<hr>
								<div class="row text-center">
									<div class="col-xs-12">
									<a class="btn btn-default btn-sm" role="button" href="useredit.do?"> <i class="fa fa-pencil-square-o fa-lg"></i> Edit Account</a>
									<a class="btn btn-default btn-sm" role="button" href="resourcecreate.jsp"><i class="fa fa-file-text fa-lg" aria-hidden="true"></i> New Resource</a>
		<a class="btn btn-default btn-sm" role="button " href="resourcelist.do?view=add"><i class="fa fa-plus fa-lg" aria-hidden="true"></i> Add Resources</a>
			<a class="btn btn-default btn-sm" role="button" href="resourcelist.do?view=my"><i class="fa fa-folder-open fa-lg" aria-hidden="true"></i>My resources</a>
		</div>
					</div>
					</div>
				</div>
							<div class="panel panel-default">
								<div class="panel-body">
						<h3><i class="fa fa-folder-open" aria-hidden="true"></i>
My Resources</h3>
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
				<c:choose>
		<%-- <<<<<<<<<<<<<<<<<<<<<<<<<<<ADMIN AREA!!!!!!!!!!!!!!!!>>>>>>>>>>>>>>>>>>>>>>>>>>>>> --%>
					<c:when test="${user.privelege > 0}">

						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-body">
									<h3><i class="fa fa-tasks" aria-hidden="true"></i> Admin Dashboard</h3>
									<div class="visible-xs">
										<p class="bg-danger">ADMIN DASHBOARD only available on larger devices!</p>
									</div>
										<%-- collapses --%>
										<div class="panel-group  hidden-xs" id="accordion" role="tablist" aria-multiselectable="true">
												<div class="panel panel-default">
													<div class="panel-heading" role="tab" id="headingOne">
														<h4 class="panel-title">
															<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
																REMOVE RESOURCES
															</a>
														</h4>
													</div>
													<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
														<div class="panel-body">
															<c:forEach var="resource" items="${allResources}">
															<div class="row">
																RESOURCE: ID = ${resource.id} | NAME = ${resource.name} | TAGS =
																<c:forEach var="tag" items="${resource.tags}">

																	<div class="btn-group" role="group" aria-label="Basic example">

																		<button type="button"
																			class="btn btn-secondary btn-default btn-xs">${tag.name}</button>


																				<a type="button"
																					href="admin.do?action=deleteTag&tagId=${tag.id}&resourceId=${resource.id}"
																					class="btn btn-secondary btn-danger btn-xs"><i class="fa fa-minus" aria-hidden="true"></i></a>




																	</div>

																</c:forEach> | DELETE =

																<a href="admin.do?resourceId=${resource.id}&action=deleteResource"><i class="fa fa-times-circle" aria-hidden="true"></i></a>

																<hr>
															</div>

														</c:forEach>
														</div>
													</div>
												</div>
												<div class="panel panel-default">
													<div class="panel-heading" role="tab" id="headingThree">
														<h4 class="panel-title">
															<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
																ALL USERS
															</a>
														</h4>
													</div>
													<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
														<div class="panel-body">
													<c:forEach var="user" items="${allUsers}">
													<div class="row">
														<div class="col-md-1">
														<img src="${user.userPhoto}" alt="photo of ${user.username}" class="img-circle img-responsive thumb">
														</div>
															<div class="col-md-8">
															 USER: ID = ${user.id} | NAME = ${user.lastName},${user.firstName} | USERNAME: ${user.username} | PRIVELEGE ${user.privelege}
														 </div>
														 <div class="col-md-3">
														<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#edituserpanel${user.id}" aria-expanded="false" aria-controls="edituserpanel${user.id}"><i class="fa fa-edit" aria-hidden="true"></i></button>
														<%-- <a type="button" class="btn btn-primary" href="#edituserpanel${user.id}" aria-expanded="false" aria-controls="edituserpanel${user.id}" title="EDIT USER" ><i class="fa fa-edit" aria-hidden="true"></i></a> --%>
														<a type="button" class="btn btn-success" href="admin.do?action=addAdmin&targetUserId=${user.id}" title="ADMINIFY" ><i class="fa fa-users" aria-hidden="true"></i></a>
														<a type="button" class="btn btn-warning" href="admin.do?action=removeAdmin&targetUserId=${user.id}"title="UNADMINIFY"><i class="fa fa-user" aria-hidden="true"></i></a>
														<a type="button" class="btn btn-danger" href="admin.do?action=deleteUser&targetUserId=${user.id}" title="REMOVE USER"><i class="fa fa-ban" aria-hidden="true"></i></a>
													</div>
												</div>
														<div class="collapse" id="edituserpanel${user.id}">
															<div class="well">
																<div class="row">
																					 <form method="POST" action="adminsubmitedit.do">
																						 <input type= "hidden" name="id" value="${user.id}"/>
																						 <div class="col-md-2">
																							First Name :
																							<input type= "text" class="form-control" name="firstName" value="${user.firstName}" required="require" />
																						</div>
																						<div class="col-md-2">
																							Last Name :
																							<input type= "text" class="form-control" name="lastName" value="${user.lastName}" required="require"/>
																						</div>
																						<div class="col-md-2">
																							User Name :
																							<input type= "text" class="form-control" name="username" value="${user.username}" required="require"/>
																						</div>
																						<div class="col-md-2">
																							Password :
																							<input type= "password" class="form-control" name="password" value="${user.password}" required="require"/>
																						</div>
																						<div class="col-md-3">
																							Email :
																							<input type= "email" class="form-control" name="email" value="${user.email}" required="require" />
																						</div>
																						<div class="col-md-1">
																							 Priv:
																							 <input type= "number" class="form-control" name="privelege" value="${user.privelege}" size="3" required="require" min="0" max="1"/>
																						 </div>
																						<div class="col-md-4">
																							 Photo :
																							 <input type= "url" class="form-control" name="userPhoto" value="${user.userPhoto}" />
																						 </div>
																						<div class="col-md-2">
																							 Date :
																							 <input type= "date" class="form-control" name="createDate" value="${user.createDate}" />
																						 </div>
																						 <div class="col-md-2">
																							 Update user info:
																							   <input type="submit" value ="UPDATE USER"/>
																						 </div>
																			</form>
																		</div>
																	</div>
  														</div>

														<hr>


												</c:forEach>

														</div>
													</div>
												</div>
												<div class="panel panel-default">
													<div class="panel-heading" role="tab" id="headingFour">
														<h4 class="panel-title">
															<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
																TAG EDITOR
															</a>
														</h4>
													</div>
													<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
														<div class="panel-body">
															REMOVE TAGS FROM DATABASE:
															<hr>
												<c:forEach var="tag" items="${allTags}">

													<div class="btn-group" role="group" aria-label="Basic example">

														<button type="button"
															class="btn btn-secondary btn-default btn-xs">${tag.name}</button>


																<a type="button"
																	href="admin.do?action=deleteTagDb&tagId=${tag.id}"
																	class="btn btn-secondary btn-danger btn-xs"><i class="fa fa-minus" aria-hidden="true"></i></a>




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






			</c:when>
		</c:choose>


	</div>
	</div>



	</div>


















	<%@ include file="sitefooter.jsp"%>
</body>
</html>
