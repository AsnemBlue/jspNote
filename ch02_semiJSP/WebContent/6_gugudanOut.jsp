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
		int num = Integer.parseInt(request.getParameter("num"));
	%>
	<h1><%=num %>단 구구단</h1>
	<%for(int i=1; i<10 ; i++){ %>
		<p><%=num %> * <%=i %> = <%=num*i %></p>
	<%} %>
</body>
</html>