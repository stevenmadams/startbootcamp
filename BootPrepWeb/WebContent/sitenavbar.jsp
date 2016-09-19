<nav role="navigation" class="nav mobile">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <ul role="menubar">
    <li class="gapped"><a href="index.jsp">  <img  src="img/bootprepicon.png" class="half-gap-top"></a></li>
    <li class="gapped"><a href="index.jsp">Home</a></li>
      <li class="gapped"><a href="resourcelist.do">Resources</a></li>
    <li class="gapped"><a href="userprofile.do?id=${userId}">Account</a></li>
    
    <%-- ADDING THIS FOR NOW, WILL NEED STYLED FANCY --%>
     <c:if test="${userId > 0 && auth == 'true'}">
	     <li class="gapped"><a href="logout.do">Logout</a></li>
     </c:if>
  </ul>
</nav>
