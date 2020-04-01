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
<%
	if(session.getAttribute("validMamber")!=null){
		session.invalidate();
		out.println("<h2>로그아웃되었습니다.</h2>");
	}
%>
	<hr>
	<button onclick="location.href='login.jsp'">로그인</button>
	<button onclick="location.href='join.jsp'">회원가입</button>
</body>
</html>