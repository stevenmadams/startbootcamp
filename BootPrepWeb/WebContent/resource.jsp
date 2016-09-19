<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="sitehead.jsp" %>
<title>Selected Resource - ${resource.name}</title>
</head>
<body>
<%@ include file="sitenavbar.jsp" %>
	<p>ID: ${resource.id}</p>
	<p>Name: ${resource.name}</p>
	<p>Description: ${resource.description}</p>
	<p>URL: ${resource.url}</p>
	<p>Video: ${resource.video}</p>
	<p>Image: ${resource.photo}</p>

	<%-- User Data Area --%>
	<c:if test="${userId > 0 && auth == 'true'}">
		<form action="userDataUpdate.do" method="post">

			<a href="userDataUpdate.do?resourceId=${resource.id}&completed=${userData.completed}">
              Completed
                  <span><input type="checkbox" name="completed" value="${userData.completed}" disabled
                      <c:if test="${userData.completed}">checked</c:if>>
                  </span>

          	</a>
			
			<p>Rating: ${userData.rating}</p>
      <fieldset class="rating">
    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>

    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>

    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>

    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>

    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>

</fieldset>
			<textarea name="notes">${userData.notes}</textarea>
			<input type="hidden" name="resourceId" value="${resource.id}">
			<input type="submit" value="Update">
		</form>

	</c:if>

  <%@ include file="sitefooter.jsp" %>
</body>
</html>
