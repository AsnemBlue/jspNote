<%@page import="com.tj.personinfo.Personinfo"%>
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
	Personinfo pi = new Personinfo();
	pi.setName(request.getParameter("name"));
	pi.setAge(Integer.parseInt(request.getParameter("age")));
	pi.setGender(request.getParameter("gender").charAt(0));
	pi.setAddress(request.getParameter("address"));
%>
	<h2>입력된 개인정보</h2>
	<p>이름 : <%=pi.getName() %></p>
	<p>나이 : <%=pi.getAge() %></p>
	<p>성별 : <%=pi.getGender() %></p>
	<p>주소 : <%=pi.getAddress() %></p>
</body>
</html>