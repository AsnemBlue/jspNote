<%@page import="com.tj.ex.MemberInfo"%>
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
	MemberInfo mi = new MemberInfo("홍길동","aaa","111");
%>
	<h2>회원정보</h2>
	<h3>이름 : <%=mi.getName() %></h3>
	<h3>id : <%=mi.getId() %></h3>
	<h3>pw : <%=mi.getPw() %></h3>
	<h2>회원정보(java logic에서 만든 객체)</h2>
	<h3>이름 : ${mi.name }</h3>
	<h3>id : ${mi.id }</h3>
	<h3>pw : ${mi.pw }</h3>
</body>
</html>