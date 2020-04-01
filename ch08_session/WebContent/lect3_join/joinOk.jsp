<%@page import="java.io.PrintWriter"%>
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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	session.setAttribute("id"  , id    );
	session.setAttribute("pw"  , pw    );	
	response.sendRedirect(conPath+"/member/login.jsp@chk=null");	
%>
</body>
</html>