<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>ex01_forward.jsp파일입니다</h1>
	<jsp:forward page="ex02_forward.jsp"/>	<!-- 액션에서만 />로 닫기 생략 가능 --> 
	<%-- <%response.sendRedirect("ex02_forward.jsp"); %> --%>
	
</body>
</html>