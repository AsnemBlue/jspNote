<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String age = request.getParameter("age");
%>
	<%=age %>살 주류판매 불가
	<button onclick="history.back()">뒤로가기</button>x
</body>
</html>