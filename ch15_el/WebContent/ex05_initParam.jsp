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
	<h2>contextId : <%=getServletContext().getInitParameter("contextId") %></h2>
	<h2>contextPw : <%=getServletContext().getInitParameter("contextPw") %></h2>
	<h2>contextPath : <%=getServletContext().getInitParameter("contextPath") %></h2>
	<hr>
	<h2>contextId : ${initParam.contextId }</h2>
	<h2>contextPw : ${initParam.contextPw }</h2>
	<h2>contextPath : ${initParam.contextPath }</h2>
</body>
</html>