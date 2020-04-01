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
<%//세션의 속성추가는 객체
	session.setAttribute("sessionName", "sessionValue");
	session.setAttribute("myNum", 123);
	//session.setAttribute("myNum", Integer(123));자동으로 Integer(123)객체로 바뀜
%>
	<h2>방금 추가한 session 속성의 값(sessionName) : <%=session.getAttribute("sessionName") %></h2>
	<h2>session 값 : <%=session.getAttribute("myNum") %></h2>
	
	<a href="ex02_sessionGet.jsp">세션 GET</a>
</body>
</html>