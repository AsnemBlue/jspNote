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
	String msg = request.getParameter("msg");
	if(msg.equals("success")){%>
		<h1>가입완료</h1>
		<hr>
		<button onclick="location='../lect2_login/login.jsp'">로그인</button>		
<%	}else if(msg.equals("fail")){%>
		<h1>가입실패</h1>
		<a href="join.jsp">회원가입으로</a>
		<hr>
		<button onclick="location='../lect2_login/login.jsp'">로그인</button>		
<%	}
%>
</body>
</html>