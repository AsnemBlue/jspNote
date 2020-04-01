<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>ex3_include입니다.</h1>
	<hr>
	<%@include file="member/footer.jsp" %><!-- 그대로 소스를  -->
	<hr>
	<jsp:include page="member/footer.jsp" /> <!-- 결과를 -->
	<hr>
	<h1>다시 ex3_include파일 입니다.</h1>
</body>
</html>