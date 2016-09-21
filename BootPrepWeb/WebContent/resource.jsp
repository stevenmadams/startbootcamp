<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="sitehead.jsp"%>
<title>Selected Resource - ${resource.name}</title>
</head>
<body>
	<%@ include file="sitenavbar.jsp"%>

	<%-- <div class="container-fluid"> --%>
	<div class="full-width-image"
		style="background: url('${resource.photo}') center center no-repeat; background-size: cover;"></div>
	<%-- </div> --%>


	<hr>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<%-- <p>ID: ${resource.id}</p> --%>
				<h1>${resource.name}</h1>
				<%-- TAGS! --%>
				<%-- when user is GUEST and does not own resource --%>
				<c:if test="${userId == 0 || auth != 'true'}">
					<p>
						<i class="fa fa-tags" aria-hidden="true"></i>
						<c:forEach var="tag" items="${resource.tags}">
							<button type="button" class="btn btn-default btn-xs">${tag.name}
							</button>
						</c:forEach>
					</p>
				</c:if>
				<%-- when user is logged in and does not own resource --%>
				<c:if
					test="${userId > 0 && auth == 'true' && empty userHasResource}">

					<p>
						<i class="fa fa-tags" aria-hidden="true"></i>
						<c:forEach var="tag" items="${resource.tags}">
							<button type="button" class="btn btn-default btn-xs">${tag.name}</button>
						</c:forEach>
					</p>

				</c:if>
				<%-- when user is logged in and has resource --%>
				<c:if
					test="${userId > 0 && auth == 'true' && userHasResource == 'true'}">
					<p>
						<i class="fa fa-tags" aria-hidden="true"></i>
						<c:forEach var="tag" items="${resource.tags}">
							<button type="button" class="btn btn-default btn-xs">${tag.name}
								<c:forEach var="rtag" items="${rTags}">
									<c:if test="${rtag == tag.id}">X</c:if>
								</c:forEach>
							</button>
						</c:forEach>
						<button class="btn btn-primary btn-xs" type="button"
							data-toggle="collapse" data-target="#collapseExample"
							aria-expanded="false" aria-controls="collapseExample">
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
						</button>
					</p>
					<div class="collapse" id="collapseExample">
						<div class="well">
							<form>
								<p>this is where the stuff will go</p>
							</form>
						</div>
					</div>






				</c:if>
				<%-- END TAGS! --%>
				<blockquote>
					<p>
						<i class="fa fa-quote-left fa-2x fa-pull-left fa-border"
							aria-hidden="true"></i>${resource.description}</p>
				</blockquote>
				<a href="${resource.url}" target="_blank"
					class="btn btn-default btn-lg"><i class="fa fa-external-link"
					aria-hidden="true"></i> View Resource Site</a>
				<p>Video: ${resource.video}</p>
			</div>
			<div class="col-md-6">
				<%-- User Data Area --%>
				<c:if
					test="${userId > 0 && auth == 'true' && userHasResource == 'true'}">
					<form action="userDataUpdate.do" method="post">


						<div class="row">
							<div class="col-sm-6">
								<%-- <p>Rating: ${userData.rating}</p> --%>
								<fieldset class="rating">
									<input type="radio" id="star5" name="rating" value="5"
										<c:if test="${userData.rating == 5}"> checked="checked" </c:if> /><label
										class="full" for="star5" title="Awesome - 5 stars"></label> <input
										type="radio" id="star4" name="rating" value="4"
										<c:if test="${userData.rating == 4}"> checked="checked" </c:if> /><label
										class="full" for="star4" title="Pretty good - 4 stars"></label>

									<input type="radio" id="star3" name="rating" value="3"
										<c:if test="${userData.rating == 3}"> checked="checked" </c:if> /><label
										class="full" for="star3" title="Meh - 3 stars"></label> <input
										type="radio" id="star2" name="rating" value="2"
										<c:if test="${userData.rating == 2}"> checked="checked" </c:if> /><label
										class="full" for="star2" title="Kinda bad - 2 stars"></label>

									<input type="radio" id="star1" name="rating" value="1"
										<c:if test="${userData.rating == 1}"> checked="checked" </c:if> /><label
										class="full" for="star1" title="Sucks big time - 1 star"></label>

								</fieldset>
							</div>
							<div class="col-sm-6">
								<a
									href="userDataUpdate.do?resourceId=${resource.id}&completed=${userData.completed}">
									Completed <span><input type="checkbox" name="completed"
										value="${userData.completed}" disabled
										<c:if test="${userData.completed}">checked</c:if>> </span>

								</a>
							</div>
						</div>
						<div class="form-group">
							<label for="mynotes">My Resource Notes</label>
							<textarea class="form-control" id="mynotes" rows="4" name="notes">${userData.notes}</textarea>
						</div>

						<input type="hidden" name="resourceId" value="${resource.id}">
						<button type="submit" class="btn btn-default">
							<%-- <i class="fa fa-floppy-o" aria-hidden="true">  --%>
							Save
						</button>
					</form>

				</c:if>
			</div>
		</div>
	</div>

	<%@ include file="sitefooter.jsp"%>
</body>
</html>
