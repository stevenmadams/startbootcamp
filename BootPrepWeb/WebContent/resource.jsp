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


	<br>
	<br>
	<div class="container">
		<div class="jumbotron">
			<div class="row">
				<span><h1>${resource.name}</h1> <%-- below: If user does not own resource --%>
					<c:if
						test="${userId > 0 && auth == 'true' && empty userHasResource}">
						<a href="resourceadd.do?resourceId=${resource.id}" target="_blank"
							class="btn btn-default btn-lg">

              <i class="fa fa-folder-open text-success"></i> ADD</a>
					</c:if> <%-- above: If user does not own resource --%> <c:if
						test="${userId > 0 && auth == 'true' && userHasResource == 'true'}">
						<a class="btn btn-default btn-lg" role="button"
							href="resourceRemove.do?resourceId=${resource.id}&view=resource">

                <i class="fa fa-folder-open text-danger"></i> REMOVE





						</a>
					</c:if> <a href="${resource.url}" target="_blank"
					class="btn btn-default btn-lg"><i class="fa fa-external-link"
						aria-hidden="true"></i> Resource Site</a> </span>



				<hr>
			</div>
			<div class="row">
				<div class="col-md-6">
					<%-- <p>ID: ${resource.id}</p> --%>

					<%-- TAGS! --%>
					<br>
					<%-- when user is GUEST and does not own resource --%>
					<c:if test="${userId == 0 || auth != 'true'}">

						<i class="fa fa-tags" aria-hidden="true"></i>
						<c:forEach var="tag" items="${resource.tags}">
							<button type="button" class="btn btn-default btn-xs">${tag.name}
							</button>
						</c:forEach>

					</c:if>
					<%-- when user is logged in and does not own resource --%>
					<c:if
						test="${userId > 0 && auth == 'true' && empty userHasResource}">

						<div class="row">
							<i class="fa fa-tags" aria-hidden="true"></i>
							<c:forEach var="tag" items="${resource.tags}">
								<button type="button" class="btn btn-default btn-xs">${tag.name}</button>
							</c:forEach>
						</div>

					</c:if>
					<%-- when user is logged in and has resource --%>
					<c:if
						test="${userId > 0 && auth == 'true' && userHasResource == 'true'}">

            <p class="bg-danger">${error}</p>
            <div class="row">
						<i class="fa fa-tags" aria-hidden="true"></i>
						<c:forEach var="tag" items="${resource.tags}">


								<div class="btn-group" role="group" aria-label="Basic example">



									<button type="button"
										class="btn btn-secondary btn-default btn-xs">${tag.name}</button>
									<c:forEach var="rtag" items="${rTags}">
										<c:if test="${rtag == tag.id}">
											<a type="button"
												href="resourceTagEdit.do?resourceId=${resource.id}&action=remove&tagId=${tag.id}"
												class="btn btn-secondary btn-danger btn-xs"><i
												class="fa fa-minus" aria-hidden="true"></i></a>
										</c:if>
									</c:forEach>


								</div>
							</c:forEach>
							<button class="btn btn-success btn-xs" type="button"
								data-toggle="collapse" data-target="#collapseExample"
								aria-expanded="false" aria-controls="collapseExample">
								<i class="fa fa-plus" aria-hidden="true"></i>
							</button>
						</div>

						<div class="collapse" id="collapseExample">
							<div class="well">
								<form action="resourceTagEdit.do" method="post">

									<input type="hidden" value="${resource.id}" name="resourceId">
									<input type="hidden" value="add" name="action"> <input
										type="text" name="tagName" class="form-control" maxlength="15">
									<input type="submit" class="btn btn-default" value="Add Tag" />
								</form>
							</div>
						</div>





					</c:if>
					<%-- END TAGS! --%>
					<br> <br>
					<blockquote>

						<i class="fa fa-quote-left fa-2x fa-pull-left fa-border"
							aria-hidden="true"></i>${resource.description}
					</blockquote>

					<c:if test="${!empty resource.video}">
						<%-- <%@ include file="videoIframe.jsp"%> --%>

						<div class="embed-container">
						<iframe src="https://www.youtube.com/embed/P0_2JKxCq-0" frameborder="0" allowfullscreen></iframe>
							<%-- <iframe src="${resource.video}" frameborder="0" allowfullscreen></iframe> --%>
						</div>

					</c:if>

				</div>
				<div class="col-md-6">
					<%-- User Data Area --%>
					<c:if
						test="${userId > 0 && auth == 'true' && userHasResource == 'true'}">
						<form action="userDataUpdate.do" method="post">



							<div class="form-group">
								<label for="mynotes">My Resource Notes</label>
								<textarea class="form-control" id="mynotes" rows="4"
									name="notes">${userData.notes}</textarea>
							</div>
							<div class="row">
								<div class="col-sm-12">
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
								<div class="col-sm-12">
									<a
										href="userDataUpdate.do?resourceId=${resource.id}&completed=${userData.completed}">
										Completed <span><input type="checkbox" name="completed"
											value="${userData.completed}" disabled
											<c:if test="${userData.completed}">checked</c:if>> </span>

									</a>
								</div>
							</div>
							<br> <input type="hidden" name="resourceId"
								value="${resource.id}">
							<button type="submit" class="btn btn-default">
								<%-- <i class="fa fa-floppy-o" aria-hidden="true">  --%>
								Save
							</button>
						</form>

					</c:if>
				</div>
			</div>
		</div>
	</div>

  <c:choose>
  <%-- IF USER IS LOGGED IN --%>
    <c:when test="${userId > 0 && auth == 'true'}">
  <div class="row">
  <div class="text-center">
    <a class="btn btn-default" role="button" href="resourcecreate.jsp"><i class="fa fa-file-text fa-lg" aria-hidden="true"></i> New Resource</a>
    <a class="btn btn-default" role="button" href="resourcelist.do?view=add"><i class="fa fa-plus fa-lg" aria-hidden="true"></i> Add Resources</a>
      <a class="btn btn-default" role="button" href="resourcelist.do?view=my"><i class="fa fa-folder-open fa-lg" aria-hidden="true"></i>My resources</a>
      </div>
      </div>
    </c:when>
  </c:choose>

<br>
	<%@ include file="sitefooter.jsp"%>
</body>
</html>
