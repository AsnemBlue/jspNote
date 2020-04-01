<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/style.css" rel="stylesheet">
</head>
<body>
	<h2>회원정보</h2>
	<h3>id : ${param.id }</h3>
	<h3>pw : ${param.pw }</h3>
	<h3>이름 : ${param.name }</h3>
</body>
</html>