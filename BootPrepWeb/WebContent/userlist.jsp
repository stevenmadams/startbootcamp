<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="contentArea">
			<!-- InstanceBeginEditable name="heading" -->
			<div class="content_title">

				<h1>User data table</h1>
			</div>
			<!-- InstanceEndEditable -->
			<!-- InstanceBeginEditable name="navigation" -->
			<div class="content_left">
				<a href="index.jsp" class="nav_first">Home Page</a> <a
					href="usercreate.jsp" class="nav_last">Add new user</a>
			</div>
			<!-- InstanceEndEditable -->
			<!-- InstanceBeginEditable name="content" -->
			<div class="content_center">

				<table border="1">
					<tr>
						<th>ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Username</th>
						<th>Password</th>
						<th>email</th>
						<th>create date</th>
				
					</tr>
					<c:forEach var="user" items="${user}">
						<tr>
							<td><p>
									<c:out value="${user.id} " />
								</p></td>
							<td><p>
									<c:out value="${user.firstName} " />
								</p></td>
							<td><p>
									<c:out value="${user.last_name} " />
								</p></td>
							<td><p>
									<c:out value="${user.password} " />
								</p></td>
							<td><p>
									<c:out value="${user.email} " />
								</p></td>
							<td><p>
									
								</p></td>
							<td><p>
									
								</p></td>
							<td><a href="useredit.do?id=${user.id}">Edit</a><br> <a href="userdelete.do?id=${user.id}">Delete</a></td>
						</tr>
					</c:forEach>
				</table>
				<br>

			</div>
			<!-- InstanceEndEditable -->
			<!-- InstanceBeginEditable name="sidebar" -->
			<div class="content_right">
				<!--<![endif]-->

			</div>

			<!-- InstanceEndEditable -->
			<div class="clear_both"></div>
		</div>
</body>
</html>