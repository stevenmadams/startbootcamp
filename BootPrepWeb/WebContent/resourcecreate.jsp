<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create a Resource</title>
</head>
<body>
	<h3>Enter details about the resource below</h3>
	
	<form action="resourceCreate.do" method="post">
		URL			<input type="text" name="url">
		Title		<input type="text" name="name">
		Description	<input type="text" name="description">
					<input type="submit" value="Create">
	</form>
	
</body>
</html>