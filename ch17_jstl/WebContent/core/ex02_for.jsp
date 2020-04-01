<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="">
		이름 : <input type="text" name="name">
		인사받을 횟수 : <input type="number" name="hi">
		<input type="submit">
	</form>
	
	<c:forEach var="i" begin="1" end="${param.hi}">
		<p style="color:blue;">${param.name } 안녕하세</p>
	</c:forEach>
</body>
</html>